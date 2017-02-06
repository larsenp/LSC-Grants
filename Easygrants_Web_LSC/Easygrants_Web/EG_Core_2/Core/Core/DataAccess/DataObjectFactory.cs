using System;
using System.Data;
using System.Xml;
using System.Data.SqlClient;
using Core.DataAccess.DBAccess;
using Core.DataAccess.XMLAccess;
using Core.Util;
using System.Collections;
using Core.User;


namespace Core.DataAccess {
/*====================================================*/

///<summary>
///Manages new data object creation, modification, and deletion, returns DataObjectLists
///</summary>
public class cDataObjectFactory 
{
/*====================================================*/

	private		cAppl			mAppl;
	private		cXMLDoc			mDataDefinitionDoc;
	private		cUser			mUser;
	//protected	Hashtable		mDataProviderTable;
	protected	cDataProvider	mDataProvider;

	/*-----------------------------------------------------*/

	public cUser User 
	{
		get {return mUser;}
		set {mUser = value;}
	}
	
	/*-----------------------------------------------------*/

	public cAppl Appl 
	{
		get {return mAppl;}
	}

/*----------------------------------------------------*/
	
	public cXMLDoc DataDefinitionDoc {
		get {return mDataDefinitionDoc;}
	}

/*-----------------------------------------------------*/

//	protected Hashtable DataProviderTable 
//	{
//		get {return mDataProviderTable;}
//		set {mDataProviderTable = value;}
//	}

/*-----------------------------------------------------*/

	public cDataObjectFactory (cAppl aAppl, cXMLDoc aDataDefinitionDoc)
	{
		mAppl = aAppl;
		mDataDefinitionDoc = aDataDefinitionDoc;
//		mDataProviderTable = new Hashtable();
	}

/*====================================================*/

/* DataPresenter calls this function when updating or inserting data*/

	public void SaveDataObject(cDataObjectList aDataObjectList) {
		//iterate through DO's in list and call SaveDataObject(aDO)
		if (mUser != null)
			aDataObjectList.UserID = mUser.UserID;
		
		foreach(cDataObject aDataObject in aDataObjectList)
			SaveDataObject(aDataObject);
		
	}
	
/*====================================================*/

/* DataPresenter calls this function when updating or inserting data*/

	public void SaveDataObject(cDataObject aDataObject){
		if (mUser != null)
			aDataObject.DataObjectList.UserID = mUser.UserID;
		aDataObject.SaveData(); //virtual method to give sub-classes pre- and post- processing
	}
	
/*-----------------------------------------------------*/
/* DataPresenter calls this function when selecting data*/

	public cDataObjectList GetDataObjectList(XmlNode aDataObjectNode) {
		cDataObjectList		aDataObjectList;
		String				aPrimaryKey;
		
		if(!cXMLDoc.AttributeToBool(aDataObjectNode, "GetData", true))
			return null;
		
		GenerateJoinNodes(ref aDataObjectNode);
		
		aDataObjectList = CreateDataObjectList(aDataObjectNode); 

		//functionality to create new data object if primary key is 0
		aPrimaryKey = aDataObjectList.PrimaryKey;
		if(aPrimaryKey != null) {
			XmlNodeList aArgumentsList = aDataObjectNode.SelectNodes("Filters/Argument");
			foreach (XmlNode aArgumentNode in aArgumentsList) {
				if (cXMLDoc.AttributeToString(aArgumentNode, "PropertyKey") == aPrimaryKey){
					if(cXMLDoc.AttributeToString(aArgumentNode, "Value") == "0") {
						return GetNewDataObjectList(aDataObjectNode);
					}
				}
			}
		}
		return PopulateDataObjectList(aDataObjectList);
		
	}

/*-----------------------------------------------------*/

	public cDataObjectList GetDataObjectListWithFilter(String aDataObjectKey, String[] aFilterName, String[] aFilterID) {
		cXMLDoc aXmlDoc;
		XmlNode aDataObjectNode, aFiltersNode;
		int		i;
		
		if (aFilterName != null && aFilterID != null && aFilterName.Length == aFilterID.Length) {
			aXmlDoc = this.CreateDataObjectNode(aDataObjectKey, out aDataObjectNode, out aFiltersNode);
			aFiltersNode.AppendChild(this.CreateArgumentNode(aXmlDoc, "Data", aFilterName[0], aFilterID[0]));
			
			for (i = 1; i < aFilterName.Length; i++) {
				aFiltersNode.AppendChild(this.CreateArgumentNode(aXmlDoc, "Data", aFilterName[i], aFilterID[i], "And"));
			}
			return this.GetDataObjectList(aDataObjectNode);	
		}
		return null;
	}
	
/*----------------------------------------------------*/

	public cDataObjectList GetDataObjectListWithFilter(String aDataObjectKey, String aFilterName, String aFilterID) {
		String[] aFilterNames = {aFilterName};
		String[] aFilterIDs = {aFilterID};
			
		return this.GetDataObjectListWithFilter(aDataObjectKey, aFilterNames, aFilterIDs);
	}

/*----------------------------------------------------*/

	public cDataObjectList GetDataObjectListWithFilter(String aDataObjectKey, String aFilterName0, String aFilterID0, 
																			String aFilterName1, String aFilterID1) {
		String[] aFilterNames = {aFilterName0, aFilterName1};
		String[] aFilterIDs = {aFilterID0, aFilterID1};
			
		return this.GetDataObjectListWithFilter(aDataObjectKey, aFilterNames, aFilterIDs);	
	}

/*----------------------------------------------------*/

	public cDataObjectList GetDataObjectListWithFilter(String aDataObjectKey, String aFilterName0, String aFilterID0, 
									String aFilterName1, String aFilterID1, String aFilterName2, String aFilterID2) {
		String[] aFilterNames = {aFilterName0, aFilterName1, aFilterName2};
		String[] aFilterIDs = {aFilterID0, aFilterID1, aFilterID2};
			
		return this.GetDataObjectListWithFilter(aDataObjectKey, aFilterNames, aFilterIDs);	
	}

/*----------------------------------------------------*/

	public cDataObjectList GetDataObjectListWithFilter(String aDataObjectKey, String aFilterName0, String aFilterID0, 
		String aFilterName1, String aFilterID1, String aFilterName2, String aFilterID2, String aFilterName3, String aFilterID3) 
	{
		String[] aFilterNames = {aFilterName0, aFilterName1, aFilterName2, aFilterName3};
		String[] aFilterIDs = {aFilterID0, aFilterID1, aFilterID2, aFilterID3};
			
		return this.GetDataObjectListWithFilter(aDataObjectKey, aFilterNames, aFilterIDs);	
	}

/*-----------------------------------------------------*/
//Peter Larsen 11/12/2003
	public cDataObjectList GetDataObjectList(XmlNode aDataObjDefNode, string aQuery) 
	{
		DataSet aDS = ((cDataProviderSQL) GetDataProvider(cXMLDoc.AttributeToString(aDataObjDefNode, "DataSourceKey"))).BuildDataSet(aDataObjDefNode, aQuery);
		return new cDataObjectList(aDataObjDefNode, aDS, this);
	}
	
/*-----------------------------------------------------*/
/* DataPresenter calls this function when selecting data*/

	public cDataObject GetDataObject(XmlNode aDataObjectNode){
		cDataObjectList		aDataObjectList;
		
		aDataObjectList = GetDataObjectList(aDataObjectNode);
		if (aDataObjectList.Count == 0) return null;
		
		return aDataObjectList[0];
	}

/*-----------------------------------------------------*/
/*DataPresenter calls this function when adding a new object*/

	public cDataObjectList GetNewDataObjectList(XmlNode aDataObjectNode){
		cDataObjectList	aDataObjectList;
		

		aDataObjectList = CreateDataObjectList(aDataObjectNode);	
		aDataObjectList.AddNewDataObject();
		
		return aDataObjectList;
	}
	
/*-----------------------------------------------------*/

	public cDataObject GetNewDataObject(XmlNode aDataObjectNode){
		cDataObjectList	aDataObjectList;
		
		aDataObjectList = GetNewDataObjectList(aDataObjectNode);	
		
		return aDataObjectList[0];
	}
	
/*-----------------------------------------------------*/
/*DataPresenter calls this function when deleting a record
	Should this method accept aDataObject?
*/

	public void  DeleteData(XmlNode aDataObjectNode){
	
		XmlNode				aDefinitionNode;
		String				aDefinitionKey;
		String				aDataSourceKey;
		
		aDefinitionKey = cXMLDoc.AttributeToString(aDataObjectNode, "DataObjectDefinitionKey");
		aDefinitionNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aDefinitionKey + "']");
		
		aDataSourceKey = cXMLDoc.AttributeToString(aDefinitionNode, "DataSourceKey");
		
		GetDataProvider(aDataSourceKey).DeleteData(aDefinitionNode, aDataObjectNode);
	}
	
/*-----------------------------------------------------*/

/*This overload of the DeleteData method was written to be called by the 
DataList control. It takes a data object definition key and the primary key
value of a single row to be deleted.*/

	public void DeleteData(String aDefinitionKey, String aPrimaryKeyValue) {

		//Based on object definition key, get name of primary key field
		String aPrimaryKeyPropertyName = GetDataObjectDefPrimaryKey(aDefinitionKey);

		//Build new data object node with empty filter node
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		cXMLDoc aXMLDoc = CreateDataObjectNode(aDefinitionKey, out aDataObjectNode, out aFiltersNode);
		
		//Add argument to filters node designating the primary key value of the row to be deleted
		XmlNode aArgumentsNode = aXMLDoc.XMLDocument.CreateElement("Argument");
		aFiltersNode.AppendChild(aArgumentsNode);
		aXMLDoc.AddAttribute(aArgumentsNode, "PropertyKey", aPrimaryKeyPropertyName);
		aXMLDoc.AddAttribute(aArgumentsNode, "Value", aPrimaryKeyValue);
		
		//Pass newly created data object node to base DeleteData method
		DeleteData(aDataObjectNode);
	}
	
/*-----------------------------------------------------*/

	public void DeleteData(cDataObject aDataObject) {
		if (aDataObject != null) {
			if (mUser != null)
				aDataObject.DataObjectList.UserID = mUser.UserID;
			String aDefinitionKey = cXMLDoc.AttributeToString(aDataObject.ObjDefNode, "Key");
			XmlNode aDefinitionNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aDefinitionKey + "']");
			String aDataSourceKey = cXMLDoc.AttributeToString(aDefinitionNode, "DataSourceKey");
			GetDataProvider(aDataSourceKey).DeleteData(aDataObject);
		}
	}

/*-----------------------------------------------------*/

	public void DeleteData(cDataObjectList aDataObjectList) {
		if (mUser != null)
			aDataObjectList.UserID = mUser.UserID;
		
		foreach(cDataObject aDataObject in aDataObjectList)
			DeleteData(aDataObject);
	}
	
/*====================================================*/
/*populate DataSet in DataObjectList with data*/

	public void PopulateDataSet(cDataObjectList aDataObjectList){
		String	aDataSourceKey;
		
		aDataSourceKey = cXMLDoc.AttributeToString(aDataObjectList.ObjDefNode, "DataSourceKey");
			
		GetDataProvider(aDataSourceKey).PopulateDataSet(aDataObjectList);
	}

/*-----------------------------------------------------*/	
//Execute data command that does not return data

	public void ExecuteCommand(XmlNode aDataCommandNode) {
		String aCmdDefKey = cXMLDoc.AttributeToString(aDataCommandNode, "DataCommandDefinitionKey");
		XmlNode aCmdDefNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataCommandDefinitions/Definition[@Key='" + aCmdDefKey + "']");
		String aDataSourceKey = cXMLDoc.AttributeToString(aCmdDefNode, "DataSourceKey");
		GetDataProvider(aDataSourceKey).ExecuteCommand(aDataCommandNode, aCmdDefNode);
	}
	
/*-----------------------------------------------------*/	

	public cDataObjectList CreateDataObjectList(XmlNode aDataObjectNode){
		XmlNode				aDefinitionNode;
		String				aDefinitionKey;
		
		aDefinitionKey = cXMLDoc.AttributeToString(aDataObjectNode, "DataObjectDefinitionKey");

		switch(aDefinitionKey) {
			case "AdHocQuery" :
				aDefinitionNode = BuildDataDefinitionNode_From_DataObjectNode(aDataObjectNode);
				break;
			default :
				aDefinitionNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aDefinitionKey + "']");
				break;
		}
		
		//Peter Larsen 11/12/2003
		//if(cXMLDoc.AttributeToString(aDefinitionNode, "RowSourceType") == "sql")
		//return data set/table directly from DataProviderSQL
			//return this.GetDataObjectList(aDefinitionNode, aQuery);
		//else
		//		
			return new cDataObjectList(aDefinitionNode, aDataObjectNode, aDefinitionKey, this);
	}

/*-----------------------------------------------------*/

	public XmlNode BuildDataDefinitionNode_From_DataObjectNode(XmlNode aDataObjectNode) {
        cXMLDoc aXMLDoc;
        XmlElement aDataObjDefEl;
        XmlElement aClassEl;
        XmlElement aPropertiesEl;
        XmlNodeList aDisplayPropertiesList;
        XmlElement aPropertyEl;
        String aPropertyKey;
        String[] aKeys;
        String aChildDODKey;
        XmlNode aBaseDODNode;
        XmlNode aDODNode;
        XmlNode aRelationshipNode;
        XmlNode aDODPropertyNode;
        String aDataType;
		String aBaseDODKey;
		XmlNode aBasePrimaryKeyNode;
		String aBasePrimaryKey;
		int i;

        aXMLDoc = new cXMLDoc();
        aXMLDoc.LoadFromXML("<DataObjectDefinitions></DataObjectDefinitions>");
        //<DataObject Key='Base' Updatable='True'></DataObject>
        aDataObjDefEl = aXMLDoc.XMLDocument.CreateElement("Definition");
        aDataObjDefEl.SetAttribute("Key", "QueryTool");
        aDataObjDefEl.SetAttribute("DataSourceKey", "EGDatabase");
        aDataObjDefEl.SetAttribute("RowSourceType", "sql");
        //Get row source from data definition document
        aBaseDODKey = cXMLDoc.AttributeToString(aDataObjectNode, "BaseDODKey");
        aBaseDODNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aBaseDODKey + "']");
        aDataObjDefEl.SetAttribute("RowSource", cXMLDoc.AttributeToString(aBaseDODNode, "RowSource"));
        aBasePrimaryKeyNode = aBaseDODNode.SelectSingleNode("Properties/Property[@IsPrimaryKey = 'True']");
        aBasePrimaryKey = cXMLDoc.AttributeToString(aBasePrimaryKeyNode, "Key");

        aClassEl = aXMLDoc.XMLDocument.CreateElement("Class");
        aClassEl.SetAttribute("Name", "cDataObject");
        aClassEl.SetAttribute("Assembly", "Core");
        aClassEl.SetAttribute("FullName", "Core.DataAccess.cDataObject");
        aDataObjDefEl.AppendChild(aClassEl);

        aPropertiesEl = aXMLDoc.XMLDocument.CreateElement("Properties");
        aDataObjDefEl.AppendChild(aPropertiesEl);
        
        aDisplayPropertiesList = aDataObjectNode.SelectNodes("DisplayProperties/DisplayProperty");
        foreach(XmlNode aDisplayPropertyNode in aDisplayPropertiesList) {
			aPropertyEl = aXMLDoc.XMLDocument.CreateElement("Property");
			aPropertyKey = cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey");
			aKeys = aPropertyKey.Split(new Char[]{'.'});
			//aPropertyKey = cDataProvider.FlatDataObjectPropertyKey(aPropertyKey);
			aPropertyKey =  cDataObjectFactory.Alias_DisplayPropertyKey(aDataObjectNode, aPropertyKey);
	        aDODNode = aBaseDODNode;
			for(i = 0; i < aKeys.Length - 1; i++) {
				aRelationshipNode = aDODNode.SelectSingleNode("Properties/Property[@Key='" + aKeys[i] + "']/Relationship");
				aChildDODKey = cXMLDoc.AttributeToString(aRelationshipNode, "ChildDefinitionKey");
				aDODNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aChildDODKey + "']");
			}
			aDODPropertyNode = aDODNode.SelectSingleNode("Properties/Property[@Key='" + aKeys[aKeys.Length - 1] + "']");
			aDataType = cXMLDoc.AttributeToString(aDODPropertyNode, "DataType");
			aPropertyEl.SetAttribute("Key", aPropertyKey);
			aPropertyEl.SetAttribute("DataType", aDataType);
			aPropertyEl.SetAttribute("ColumnSource", aPropertyKey);
	        aPropertiesEl.AppendChild(aPropertyEl);
        }
		
		return (XmlNode)aDataObjDefEl;
	}

/*-----------------------------------------------------*/

	public cDataObject CreateDataObject(DataRow aRow, cDataObjectList aDataObjectList, XmlNode aClassNode) {
		Object[]	aArgs = {aRow, aDataObjectList};
		
		return (cDataObject)cReflection.InstantiateObjectFromXMLClassNode(aClassNode, aArgs);
	}

/*-----------------------------------------------------*/
/* creates DataObjects by extracting a data row from DataSet
	adds DataObject to DataObjectList*/
	
	public cDataObjectList PopulateDataObjectList(cDataObjectList aDataObjectList) {
		int i;
		DataTable aTable;
		XmlNode aClassNode;
		
		PopulateDataSet(aDataObjectList);
		
		aTable = aDataObjectList.ObjDataSet.Tables[aDataObjectList.DefinitionKey];
		aClassNode = aDataObjectList.ObjDefNode.SelectSingleNode("Class");
		
		for (i = 0; i <= aTable.Rows.Count - 1; i++){
			cDataObject aDataObject;
					
			aDataObject = CreateDataObject(aTable.Rows[i], aDataObjectList, aClassNode);
			//aDataObject = new cDataObject(aTable.Rows[i], aDataObjectList.ObjDefNode);
			aDataObjectList.Add(aDataObject);
		}
		return aDataObjectList;
	}
	
/*-----------------------------------------------------*/
/* return the first object in the DataObjectList*/
	
	public cDataObject PopulateDataObject(cDataObjectList aDataObjectList) {

		return PopulateDataObjectList(aDataObjectList)[0];
	}

/*====================================================*/

//	public cDataProvider CreateDataProvider(String aDataSourceKey) {
//		XmlNode			aDataSourceNode,
//						aClassNode;
//		cDataProvider	aDataProvider;
//			
//		aDataSourceNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataSources/DataSource[@Key='" + aDataSourceKey +
//							"' and ReleaseBuild[@BuildKey='" + Appl.BuildKey + "']]");
//		aClassNode = aDataSourceNode.SelectSingleNode("Class");
//		
//		Object[]	aArgs = {Appl};
//		aDataProvider = (cDataProvider)cReflection.InstantiateObjectFromXMLClassNode(aClassNode, aArgs);
//		aDataProvider.DataDefinitionDoc = DataDefinitionDoc;
//		return aDataProvider;
//	}

/*-----------------------------------------------------*/
/* extracts existing data provider from a hash table
	if data provider does not exists, creates a new one by calling SetDataProvider
*/	
//	public cDataProvider GetDataProvider(String aDataSourceKey) {
//		cDataProvider	    aDataProvider;
//		
//		if (DataProviderTable[aDataSourceKey] == null){
//			aDataProvider = CreateDataProvider(aDataSourceKey);
//			DataProviderTable.Add(aDataSourceKey, aDataProvider);
//		}
//		else 
//			aDataProvider = (cDataProvider)DataProviderTable[aDataSourceKey];
//		
//		return aDataProvider;
//	}

/*-----------------------------------------------------*/
/* close connections to the data source for all data providers 
	in the Object Factory
*/	
//	public  void DataSource_Close() {
//
//		cDataProvider aDataProvider;
//		foreach (Object aObj in DataProviderTable.Values) {
//			aDataProvider = (cDataProvider)aObj;
//			aDataProvider.DataSource_Close();
//		}
//		
//	}
//
/*====================================================*/

	public cDataProvider CreateDataProvider(String aDataSourceKey) {
		XmlNode		aDataSourceNode,
					aClassNode;
			
		aDataSourceNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataSources/DataSource[@Key='" + aDataSourceKey +
							"' and ReleaseBuild[@BuildKey='" + Appl.BuildKey + "']]");
		aClassNode = aDataSourceNode.SelectSingleNode("Class");
		
		Object[]	aArgs = {Appl};
		mDataProvider = (cDataProvider)cReflection.InstantiateObjectFromXMLClassNode(aClassNode, aArgs);
		mDataProvider.DataDefinitionDoc = DataDefinitionDoc;

		XmlNode		aArgumentNode;
		aArgumentNode = aClassNode.SelectSingleNode("Arguments/Argument");
		mDataProvider.CommandTimeout = cXMLDoc.AttributeToInt(aArgumentNode, "CommandTimeout", 0);

		return mDataProvider;
	}

/*-----------------------------------------------------*/

	public cDataProvider GetDataProvider(String aDataSourceKey) {
		
		if (mDataProvider == null)
			mDataProvider = CreateDataProvider(aDataSourceKey);
		
		return mDataProvider;
	}

/*-----------------------------------------------------*/

	public  void DataSource_Close() {
		if (mDataProvider != null)
			mDataProvider.DataSource_Close();
	}

/*====================================================*/

	public  cXMLDoc CreateDataObjectNode(String aDefinitionKey, out XmlNode aDataObjectNode, out XmlNode aFiltersNode) {

		cXMLDoc aXmlDoc = CreateDataObjectNode(aDefinitionKey, out aDataObjectNode);

		aFiltersNode = aXmlDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Filters", "");
		aDataObjectNode.AppendChild(aFiltersNode);
		
		return aXmlDoc;
	}
	
/*-----------------------------------------------------*/

	public  cXMLDoc CreateDataObjectNode(String aDefinitionKey, out XmlNode aDataObjectNode) {
		cXMLDoc			aXmlDoc = new cXMLDoc();
		
		aXmlDoc.LoadFromXML("<DataObject Key='Base' Updatable='True'></DataObject>");
		
		//assign value to the output parameter
		aDataObjectNode = aXmlDoc.XMLDocument.FirstChild;
		
		//add DataObjectDefinitionKey to the node
		//obtain DataObjectDefinitionKey from a Relationship node in DataDefinition.xml
		aXmlDoc.AddAttribute(aDataObjectNode, "DataObjectDefinitionKey",aDefinitionKey );
		
		return aXmlDoc;
	}
	
/*-----------------------------------------------------*/

	public  XmlNode CreateGroupArgumentNode(cXMLDoc aXmlDoc, String aGroup, String aBool) {
		//construct Filter node
		XmlNode aArgumentNode=aXmlDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Argument", ""); 
		 
		aXmlDoc.AddAttribute(aArgumentNode, "Group", aGroup);
		aXmlDoc.AddAttribute(aArgumentNode, "Bool", aBool);
		
		return aArgumentNode;
	}

/*-----------------------------------------------------*/

	public  XmlNode CreateGroupArgumentNode(cXMLDoc aXmlDoc, String aGroup) {
		return CreateGroupArgumentNode(aXmlDoc, aGroup, "AND");
	}

/*-----------------------------------------------------*/

	public  XmlNode CreateArgumentNode(cXMLDoc aXmlDoc, String aType, String aPropertyKey, String aValue,
										String aBool) {
		//parse PropertyKey
		String aArgPropertyKey, aRelatedPropertyKey;
		int aLastIndex;
		aLastIndex = aPropertyKey.LastIndexOf(".");
		if(aLastIndex != -1) {
			aArgPropertyKey = aPropertyKey.Substring(aLastIndex + 1);
			aRelatedPropertyKey = aPropertyKey.Substring(0,aLastIndex);
		}
		else {
			aArgPropertyKey = aPropertyKey;
			aRelatedPropertyKey = "";
		}
		//construct Filter node
		XmlNode aArgumentNode=aXmlDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Argument", ""); 
		 
		aXmlDoc.AddAttribute(aArgumentNode, "Type", aType);
        aXmlDoc.AddAttribute(aArgumentNode, "PropertyKey", aArgPropertyKey);
		aXmlDoc.AddAttribute(aArgumentNode, "Value", aValue);
		aXmlDoc.AddAttribute(aArgumentNode, "Bool", aBool);
		
		//add RelatedProperty node if necessary
		if(aRelatedPropertyKey != "") {
			XmlNode aRelatedPropertyNode = CreateArgumentRelatedPropertyNode(aXmlDoc, aRelatedPropertyKey);
			//XmlNode aRelatedPropertyNode = aXmlDoc.XMLDocument.CreateNode(XmlNodeType.Element, "RelatedProperty", ""); 
			//aXmlDoc.AddAttribute(aRelatedPropertyNode, "PropertyKey", aRelatedPropertyKey);
			aArgumentNode.AppendChild(aRelatedPropertyNode);
		}
		
		return aArgumentNode;
	}

/*-----------------------------------------------------*/

	public  XmlNode CreateArgumentNode(cXMLDoc aXmlDoc, String aType, String aPropertyKey, String aValue,
										String aBool, String aOperator) {
		//construct Filter node
		XmlNode aArgumentNode=CreateArgumentNode(aXmlDoc, aType, aPropertyKey, aValue, aBool);
		 
		aXmlDoc.AddAttribute(aArgumentNode, "Operator", aOperator);
		
		return aArgumentNode;
	}

/*-----------------------------------------------------*/

	public  XmlNode CreateArgumentNode(cXMLDoc aXmlDoc, String aType, String aPropertyKey, String aValue) {
		return CreateArgumentNode(aXmlDoc, aType, aPropertyKey, aValue, "AND");
	}

/*-----------------------------------------------------*/

	public  XmlNode CreateArgumentRelatedPropertyNode(cXMLDoc aXmlDoc, String aPropertyKey, String aJoin) {
		//construct Filter node
		XmlNode aArgRelatedPropNode = aXmlDoc.XMLDocument.CreateNode(XmlNodeType.Element, "RelatedProperty", ""); 
		aXmlDoc.AddAttribute(aArgRelatedPropNode, "PropertyKey", aPropertyKey);
        if (aJoin != "")
			aXmlDoc.AddAttribute(aArgRelatedPropNode, "Join", aJoin);
		
		return aArgRelatedPropNode;
	}

/*-----------------------------------------------------*/

	public  XmlNode CreateArgumentRelatedPropertyNode(cXMLDoc aXmlDoc, String aPropertyKey) {
		return CreateArgumentRelatedPropertyNode(aXmlDoc, aPropertyKey, "");
	}

/*-----------------------------------------------------*/

	public  XmlNode CreateArgumentRelatedPropertyNode(cXMLDoc aXmlDoc, String aPropertyKey, XmlNode aArgumentNode) {
		XmlNode aArgRelatedPropertyNode = CreateArgumentRelatedPropertyNode(aXmlDoc, aPropertyKey, "");
		
		aArgumentNode.AppendChild(aArgRelatedPropertyNode);
		return aArgumentNode;
	}

/*-----------------------------------------------------*/

	public  cDataObject CreateNewDataObjectFromKey(String aDefinitionKey) {
		cXMLDoc		aXmlDoc;
		XmlNode		aDataObjectNode;
		XmlNode		aFiltersNode;
		
		aXmlDoc = CreateDataObjectNode(aDefinitionKey, out aDataObjectNode, out aFiltersNode);	
		return GetNewDataObject(aDataObjectNode);
	}
	
/*-----------------------------------------------------*/

	public  cDataObjectList CreateNewDataObjectListFromKey(String aDefinitionKey) {
		cXMLDoc		aXmlDoc;
		XmlNode		aDataObjectNode;
		XmlNode		aFiltersNode;
		
		aXmlDoc = CreateDataObjectNode(aDefinitionKey, out aDataObjectNode, out aFiltersNode);	
		return GetNewDataObjectList(aDataObjectNode);
	}
	
/*-----------------------------------------------------*/

	public  cDataObject GetDataObjectFromPrimaryKey(String aDefinitionKey, String aKeyID) {
		cXMLDoc		aXmlDoc;
		XmlNode		aDataObjectNode;
		XmlNode		aFiltersNode;
		XmlNode		aArgNode;
		String		aPrimaryKeyPropertyName = GetDataObjectDefPrimaryKey(aDefinitionKey);
		
		aXmlDoc = CreateDataObjectNode(aDefinitionKey, out aDataObjectNode, out aFiltersNode);	
		aArgNode = aFiltersNode.AppendChild(CreateArgumentNode(aXmlDoc, "Data", aPrimaryKeyPropertyName, aKeyID));

		return GetDataObject(aDataObjectNode);
	}
	
/*-----------------------------------------------------*/

	public  cDataObjectList GetDataObjectListFromPrimaryKey(String aDefinitionKey, String aKeyID) {
		cXMLDoc		aXmlDoc;
		XmlNode		aDataObjectNode;
		XmlNode		aFiltersNode;
		XmlNode		aArgNode;
		String		aPrimaryKeyPropertyName = GetDataObjectDefPrimaryKey(aDefinitionKey);
		
		aXmlDoc = CreateDataObjectNode(aDefinitionKey, out aDataObjectNode, out aFiltersNode);	
		aArgNode = aFiltersNode.AppendChild(CreateArgumentNode(aXmlDoc, "Data", aPrimaryKeyPropertyName, aKeyID));

		return GetDataObjectList(aDataObjectNode);
	}

/*-----------------------------------------------------*/

	public  cDataObject GetDataObjectFromPrimaryKey(String aDefinitionKey, int aKeyID) {
		return GetDataObjectFromPrimaryKey(aDefinitionKey, aKeyID.ToString());
	}

/*====================================================*/

	public String GetDataObjectDefPrimaryKey(String aDefinitionKey) {
		XmlNode aDefinitionNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aDefinitionKey + "']");
		XmlNode aPrimaryKeyNode = aDefinitionNode.SelectSingleNode("Properties/Property[@IsPrimaryKey='True']");
		return cXMLDoc.AttributeToString(aPrimaryKeyNode, "Key");
	}

/*-----------------------------------------------------*/

	public void GenerateJoinNodes(ref XmlNode aDataObjectNode) {
		String aBaseDataType;
		XmlNode aBaseObjDefNode;
		XmlNodeList aNodeList;
		String aPropertyKey;
		String aRelatedPropertyKey;
		int aIndex;
		XmlNode aJoinsNode;
		XmlNodeList aJoinsNodeList;
		
		aBaseDataType = cXMLDoc.AttributeToString(aDataObjectNode, "BaseDODKey");
		if(aBaseDataType == "")
			aBaseDataType = cXMLDoc.AttributeToString(aDataObjectNode, "DataObjectDefinitionKey");
		
		//Create joins node if necessary
		aBaseObjDefNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aBaseDataType + "']");
		aJoinsNode = aDataObjectNode.SelectSingleNode("Joins");
		if(aJoinsNode == null) {
			aJoinsNode = aDataObjectNode.OwnerDocument.CreateElement("Joins");
			aDataObjectNode.AppendChild(aJoinsNode);
		}
		
		//Delete any existing join nodes
		aJoinsNodeList = aJoinsNode.SelectNodes("Join");
		foreach(XmlNode aJoinNode in aJoinsNodeList)
			aJoinsNode.RemoveChild(aJoinNode);
			
		if(cXMLDoc.AttributeToString(aDataObjectNode, "ResultSetType") == "Flat"){
			//Process display properties
			aNodeList = aDataObjectNode.SelectNodes("DisplayProperties/DisplayProperty");
			foreach(XmlNode aNode in aNodeList) {
				aPropertyKey = cXMLDoc.AttributeToString(aNode, "PropertyKey");
				aIndex = aPropertyKey.LastIndexOf(".");
				if(aIndex != -1) {
					aRelatedPropertyKey = aPropertyKey.Substring(0, aIndex);
					BuildJoinNodesFromPropertyKey(aRelatedPropertyKey, aBaseDataType, aBaseObjDefNode, null, ref aDataObjectNode);
				}
			}
		}
		//process filter nodes
		aNodeList = aDataObjectNode.SelectNodes("Filters/Argument/RelatedProperty");
		foreach(XmlNode aNode in aNodeList) {
			if(cXMLDoc.AttributeToString(aNode, "Join") != "None") {
				aRelatedPropertyKey = cXMLDoc.AttributeToString(aNode, "PropertyKey");
				BuildJoinNodesFromPropertyKey(aRelatedPropertyKey, aBaseDataType, aBaseObjDefNode, aNode, ref aDataObjectNode);
			}
		}
		
		//process sort nodes
		aNodeList = aDataObjectNode.SelectNodes("Sort/Argument/RelatedProperty");
		foreach(XmlNode aNode in aNodeList) {
			if(cXMLDoc.AttributeToString(aNode, "Join") != "None") {
				aRelatedPropertyKey = cXMLDoc.AttributeToString(aNode, "PropertyKey");
				BuildJoinNodesFromPropertyKey(aRelatedPropertyKey, aBaseDataType, aBaseObjDefNode, null, ref aDataObjectNode);
			}
		}
	}

/*-----------------------------------------------------*/

	protected void BuildJoinNodesFromPropertyKey(String aRelatedPropertyKey, String aBaseDataType, XmlNode aBaseObjDefNode, 
										XmlNode	aRelatedPropertyNode, ref XmlNode aDataObjectNode) {
		String aDataType;
		XmlNode aObjDefNode;
		String[] aKeys;
		String aConstructedKey = "";
		XmlNode aJoinsNode;
		XmlNode aJoinNode;
		XmlNode	aJoinFiltersNode;
		XmlNode aRelationshipNode;

		aJoinsNode = aDataObjectNode.SelectSingleNode("Joins");
		aKeys = aRelatedPropertyKey.Split(new Char[] {'.'});
		aDataType = aBaseDataType;
		aObjDefNode = aBaseObjDefNode;
		foreach(String aPropertyKey in aKeys) {
			if(aConstructedKey == "")
				aConstructedKey = aPropertyKey;
			else
				aConstructedKey += "." + aPropertyKey;
				
			aRelationshipNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aPropertyKey + "']/Relationship");
			aJoinNode = aJoinsNode.SelectSingleNode("Join[@Key='" + aConstructedKey + "']");
			if(aJoinNode == null) {
				String		aJoinType = "LEFT";
				
				if (aRelatedPropertyNode != null)
					aJoinType = cXMLDoc.AttributeToString(aRelatedPropertyNode, "Join", "LEFT");

				aJoinNode = BuildJoinNode(aJoinType, aConstructedKey, aDataType, aPropertyKey, aJoinsNode); 
				
				//aJoinsNode.AppendChild(aJoinNode);
/*				aRelationshipFiltersArgNode = aRelationshipNode.SelectSingleNode("RelationshipFilters/Argument");
				if(aRelationshipFiltersArgNode != null) {
					XmlNode aArgNode = aDataObjectNode.OwnerDocument.CreateElement("Argument");
					aArgNode.InnerXml = aRelationshipFiltersArgNode.InnerXml;
					aJoinNode.AppendChild(aArgNode);
				}
*/				if(aRelatedPropertyNode != null) {
					aJoinFiltersNode = aRelatedPropertyNode.SelectSingleNode("JoinFilter");
					if(aJoinFiltersNode != null) {
						XmlNode aArgNode = aDataObjectNode.OwnerDocument.CreateElement("JoinFilter");
						aArgNode.InnerXml = aJoinFiltersNode.InnerXml;
						aJoinNode.AppendChild(aArgNode);
					}
				}
			}
			aDataType = cXMLDoc.AttributeToString(aRelationshipNode, "ChildDefinitionKey");
			aObjDefNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aDataType + "']");
		}
	
	}

/*-----------------------------------------------------*/

	protected XmlNode BuildJoinNode(String aType, String aKey, String aDataTypeKey, 
					String aPropertyKey, XmlNode aJoinsNode) {
		XmlNode aJoinNode;
		
		aJoinNode = aJoinsNode.OwnerDocument.CreateElement("Join");
		cXMLDoc.AddAttribute_ToNode(aJoinNode, "Type");
		aJoinNode.Attributes["Type"].Value = aType;
		cXMLDoc.AddAttribute_ToNode(aJoinNode, "Key"); //contructed table alias
		aJoinNode.Attributes["Key"].Value = aKey;
		cXMLDoc.AddAttribute_ToNode(aJoinNode, "DataTypeKey");
		aJoinNode.Attributes["DataTypeKey"].Value = aDataTypeKey;
		cXMLDoc.AddAttribute_ToNode(aJoinNode, "PropertyKey");
		aJoinNode.Attributes["PropertyKey"].Value = aPropertyKey; //column name
		cXMLDoc.AddAttribute_ToNode(aJoinNode, "AliasKey");
		aJoinNode.Attributes["AliasKey"].Value = "Src_" + aJoinsNode.ChildNodes.Count.ToString();
		aJoinsNode.AppendChild(aJoinNode);
		
		return aJoinNode;
	}

/*-----------------------------------------------------*/

	public static String Alias_DisplayPropertyKey(XmlNode aDataObjectNode, String aDisplayPropertyKey) {
		int aIndex;
		String aTruncatedDPKey;
		XmlNode aJoinNode;
		String aAliasKey;
		String aLastDPKey;
		
		aIndex = aDisplayPropertyKey.LastIndexOf(".");
		if(aIndex == -1)
			return aDisplayPropertyKey;
		aTruncatedDPKey = aDisplayPropertyKey.Substring(0, aIndex);
		aLastDPKey = aDisplayPropertyKey.Substring(aIndex + 1);
		aJoinNode = aDataObjectNode.SelectSingleNode("Joins/Join[@Key='" + aTruncatedDPKey + "']");
		aAliasKey = cXMLDoc.AttributeToString(aJoinNode, "AliasKey");
		return aAliasKey + "_" + aLastDPKey;
		
	}

/*-----------------------------------------------------*/

	public String GetExternalConnParams(String aDataSource, String aReleaseBuild) {
		XmlNodeList aDataNodeList = DataDefinitionDoc.DocElement.SelectNodes("DataSources/DataSource[@Key='" + aDataSource + "']");
		
		foreach (XmlNode aDataNode in aDataNodeList) {
			XmlNodeList aReleaseNodeList = aDataNode.SelectNodes("ReleaseBuild[@BuildKey='" + aReleaseBuild + "']");
			
			if (aReleaseNodeList.Count > 0) {
				XmlNode aArgNode = aDataNode.SelectSingleNode("Class/Arguments/Argument");
				return cXMLDoc.AttributeToString(aArgNode, "Value");
			}
		}
		return "";
	}
	
	/*-----------------------------------------------------*/

	public cDataObject CloneDataObject(cDataObject aObj) 
	{
		cDataObject aClone = this.CreateNewDataObjectFromKey(aObj.DefinitionKey);
		
		for (int i=0; i<aClone.DataObjectRow.ItemArray.Length; i++) 
		{
			if (aClone.DataObjectRow.Table.Columns[i].ToString() != aObj.PrimaryKey)
				aClone.DataObjectRow[i] =  aObj.DataObjectRow.ItemArray.GetValue(i);
		}
		return aClone;
	}
	
	public bool CopyDataObject(cDataObject aObjFrom, cDataObject aObjTo) 
	{
		if(aObjFrom.DefinitionKey != aObjTo.DefinitionKey)
			return false;

		for (int i=0; i < aObjFrom.DataObjectRow.ItemArray.Length; i++) 
		{
			if (aObjFrom.DataObjectRow.Table.Columns[i].ToString() != aObjFrom.PrimaryKey)
				aObjTo.DataObjectRow[i] =  aObjFrom.DataObjectRow.ItemArray.GetValue(i);
		}
		return true;
	}

	/*====================================================*/
} //class cDataObjectFactory


/*====================================================*/
}  //namespace Core.DataAccess
