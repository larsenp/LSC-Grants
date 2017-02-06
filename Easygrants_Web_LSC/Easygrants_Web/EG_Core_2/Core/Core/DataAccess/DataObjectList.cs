using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Xml;
using Core.DataAccess.XMLAccess;


namespace Core.DataAccess {
/*====================================================*/

///<summary>
///Data Object List class -provides object node access, insertion, and deletion
///</summary>
public class cDataObjectList:IEnumerable
{
/*====================================================*/

	private ArrayList			mDataObjectList;
	private XmlNode				mObjDefNode;
	private XmlNode				mDataObjectNode;
	private DataSet				mObjDataSet;
	private DataTable			mObjDataTable;
	private String				mDefinitionKey;
	private cDataObjectFactory	mDataObjectFactory;
	private int					mUserID;
	private XmlElement			mSortEl;

/*====================================================*/

	public int	UserID
	{
		get {return mUserID;}
		set {mUserID = value;}
	}

/*-----------------------------------------------------*/

	public int Count 
	{
		get {return mDataObjectList.Count;}
	}

/*-----------------------------------------------------*/

	public XmlNode	ObjDefNode{
			get {return mObjDefNode;}
	}

/*-----------------------------------------------------*/

	public XmlNode	DataObjectNode{
			get {return mDataObjectNode;}
			set {mDataObjectNode = value;}
	}

/*-----------------------------------------------------*/

	public string	DefinitionKey{
			get {return mDefinitionKey;}
	}

/*-----------------------------------------------------*/

	public DataSet	ObjDataSet{
			get {return mObjDataSet;}
	}

/*-----------------------------------------------------*/

	public DataTable	ObjDataTable{
			get {return mObjDataTable;}
	}

/*-----------------------------------------------------*/

	public ArrayList DataObjectList{
			get {return mDataObjectList;}
	}

/*-----------------------------------------------------*/

	public string PrimaryKey{
		get {
			XmlNode aPrimaryKeyNode = ObjDefNode.SelectSingleNode("Properties/Property[@IsPrimaryKey='True']");
			if(aPrimaryKeyNode == null)
				return null;
				
			return cXMLDoc.AttributeToString(aPrimaryKeyNode, "Key");
		}
	}

/*-----------------------------------------------------*/

	public cDataObjectFactory DataObjectFactory {
		get {return mDataObjectFactory;}
		set {mDataObjectFactory = value;}
	}

/*-----------------------------------------------------*/

	public DataColumnCollection Properties {
		get {return ObjDataTable.Columns;}
	}
/*-----------------------------------------------------*/

	public XmlElement SortEl {
		get {return mSortEl;}
		set {mSortEl = value;}
	}
	
/*====================================================*/
	
	public cDataObjectList(cDataObjectFactory aDataObjectFactory) {
		mDataObjectList = new ArrayList();
		mDataObjectFactory = aDataObjectFactory;
	}

/*-----------------------------------------------------*/
	
	public cDataObjectList(XmlNode aObjDefNode, XmlNode aDataObjectNode, 
				String aDefinitionKey, cDataObjectFactory aDataObjectFactory) {
				
		mDataObjectList = new ArrayList();
		mDataObjectFactory = aDataObjectFactory;
		mObjDefNode = aObjDefNode;
		mDataObjectNode = aDataObjectNode;
		
		
		mObjDataSet  = new DataSet();
		mDefinitionKey = aDefinitionKey;
		
		PopulateDataTable();
	}
	
/*-----------------------------------------------------*/

//Peter Larsen 11/12/2003
	public cDataObjectList(XmlNode aObjDefNode, DataSet aDS, cDataObjectFactory aDataObjectFactory) {
		mDataObjectList = new ArrayList();
		mDataObjectFactory = aDataObjectFactory;
		mObjDataSet = aDS;
		mObjDefNode = aObjDefNode;
		DataTable aDT = aDS.Tables[0];
		AddDataObjects(aDT);
	}
/*====================================================*/
//Peter Larsen 11/12/2003
	private void AddDataObjects(DataTable aDT) {
		cDataObject aDataObject;
		XmlNode aClassNode;

		aClassNode = ObjDefNode.SelectSingleNode("Class");
		foreach(DataRow aDR in aDT.Rows) {
			aDataObject = DataObjectFactory.CreateDataObject(aDR, this, aClassNode);
			Add(aDataObject);
		}
	}
/*====================================================*/

	public void Add(cDataObject aDataObject) {
		mDataObjectList.Add(aDataObject);
	}

/*-----------------------------------------------------*/

	public void Insert(cDataObject aDataObject, int aPosition) {
		mDataObjectList.Insert(aPosition, aDataObject);
	}

/*====================================================*/

	public void AddList(cDataObjectList aDataObjectList) {
		foreach(cDataObject aDataObject in aDataObjectList) {
			mDataObjectList.Add(aDataObject);
		}
	}

/*====================================================*/

	public void Remove(cDataObject aDataObject) {
		mDataObjectList.Remove(aDataObject);
	}

/*====================================================*/

	public void FillWithNewDataObjectsToCount(XmlNode aDataObjectNode) {
		int			aObjectCount;
		
	// method will "fill out" a data object list so that its count matches the ObjectCount specified in XML.
		aObjectCount = cXMLDoc.AttributeToInt(aDataObjectNode,"ObjectCount");
		
		//If no object count has been set in the XML, the count should be set to one
		if(aObjectCount == 0)
			aObjectCount = 1;
			
		//add new row
		while(aObjectCount > this.Count)
			AddNewDataObject();
	}

/*====================================================*/

	public cDataObject AddNewDataObject() {
		DataRow     aDataRow;
		cDataObject	aDataObject;

		aDataRow = this.ObjDataSet.Tables[this.DefinitionKey].NewRow();
		this.ObjDataSet.Tables[this.DefinitionKey].Rows.Add(aDataRow);

		//aDataObject = new cDataObject(aDataRow, this, true);
		aDataObject = DataObjectFactory.CreateDataObject(aDataRow, this, ObjDefNode.SelectSingleNode("Class"));
		aDataObject.IsNewDataObject = true;
		
		this.Add(aDataObject);
		return aDataObject;
	}

/*====================================================*/

	public void PopulateDataTable() {
		XmlNodeList		aPropertiesNodeList;
		DataColumn[]	aPKArray;
		String			aColumnName;
		bool aAddColumn = true;
		mObjDataTable = ObjDataSet.Tables.Add(DefinitionKey);
		
		//In the case of queries from the query tool, the columns of the data table are not built in advance; 
		//instead, they are returned automatically by the data adapter based on the column names and aliases in
		//the SQL data set. This keeps us from setting data types for the columns; however, the only data type
		//we use besides "String" is "Byte[]", which is used for fields containing file data. These fields are
		//not available through the query tool.
		//Peter Larsen 12/17/03
		if(DefinitionKey == "AdHocQuery")
			return;
		
		aPropertiesNodeList = ObjDefNode.SelectNodes("Properties/Property");
		
		//populates data table with columns and column names
		//Data Provider will populate the columns with values
		Object	aObj = new Object();
		Byte[] aByte = new Byte[1];
		foreach (XmlNode aPropertyNode in aPropertiesNodeList) {
			
			aColumnName = cXMLDoc.AttributeToString(aPropertyNode, "Key");
			String aTypeName = cXMLDoc.AttributeToString(aPropertyNode, "DataType");
			String aRSType = cXMLDoc.AttributeToString(ObjDefNode, "RowSourceType", "");
			//If Parameter='True' it should not be added to the columns list.
			if (aRSType != "" && cXMLDoc.AttributeToBool(aPropertyNode, "Parameter", false)){
				aAddColumn = false;
			}
			if (aAddColumn) {
				DataColumn aDC = mObjDataTable.Columns.Add(aColumnName);
				if(cXMLDoc.AttributeToBool(aPropertyNode, "IsPrimaryKey")) {
					aPKArray = new DataColumn[1];
					aPKArray[0] = (aDC);
					//aDT.PrimaryKey = aPKArray;
				}
				if(aTypeName == "Byte[]")
					ObjDataSet.Tables[DefinitionKey].Columns[aColumnName].DataType = aByte.GetType();
				else
					ObjDataSet.Tables[DefinitionKey].Columns[aColumnName].DataType = aObj.GetType();
			}
		}
	}

/*-----------------------------------------------------*/

	public void Sort() {
		if(SortEl != null)
			mDataObjectList.Sort();
	}
	
/*-----------------------------------------------------*/
/*indexer for cDataObjectList*/

	public cDataObject this[int index]
	{
		get {
			return (Count < (index+1)) ? null : (cDataObject)mDataObjectList[index];
		}
		set
		{
		}
	}
	
/*====================================================*/
	
	public IEnumerator GetEnumerator() {
		return mDataObjectList.GetEnumerator();
	}
	
/*====================================================*/

} //class cDataObjectList


/*====================================================*/
}  //namespace Core.DataAccess
