using System;
using System.Data;
using System.Xml;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;

namespace EasyGrants.DataAccess.Report {
/*====================================================*/
///<summary>
///build query - save as XML or in SQL db
///</summary>
public class cSavedQuery : cDataObject 
{
/*====================================================*/
//Members

	public static String	kDefaultDefinitionKey = "StaffQueryExcel";

	private cXMLDoc			mSavedQueryDefXMLDoc;
	private bool			mUpdated;
	private String			mDefinitionKey;
	
/*====================================================*/
//Constructor
	
	public cSavedQuery(DataRow aDataObjectRow, cDataObjectList aDataObjectList):
		base(aDataObjectRow, aDataObjectList) {
		
		mDefinitionKey = kDefaultDefinitionKey;
	} 
	
/*====================================================*/
//Properties

	public cXMLDoc SavedQueryDefXMLDoc {
		get {
			if(mSavedQueryDefXMLDoc == null) {
				String aXMLStr = GetPropertyString("DataObjectXML");
				if (aXMLStr == "") {
					aXMLStr = "<DataObject Key='AdHocQuery' AddDataProviderInfo='True' DataObjectDefinitionKey='AdHocQuery' BaseDODKey='' Category='' Updatable='True' " + 
								"CreateNew='True' ResultSetType='Flat' SelectType='Distinct' GroupBy=''><DisplayProperties></DisplayProperties><Filters></Filters><Sort></Sort></DataObject>";

					this["DataObjectXML"] = aXMLStr;
				}
				mSavedQueryDefXMLDoc = new cXMLDoc();
				mSavedQueryDefXMLDoc.LoadFromXML(aXMLStr);
			}
			return mSavedQueryDefXMLDoc;
		}
		set {
			mSavedQueryDefXMLDoc = value;
			this["DataObjectXML"] = value.DocElement.OuterXml;
		}
	}
/*----------------------------------------------------*/

	public bool Updated {
		get{return mUpdated;}
		set{mUpdated = value;}
	}

/*----------------------------------------------------*/

	public String DefinitionKey {
		get{return mDefinitionKey;}
		set{mDefinitionKey = value;}
	}

/*====================================================*/

	public String BaseDODKey {
		get {return cXMLDoc.AttributeToString(SavedQueryDefXMLDoc.DocElement, "BaseDODKey");}
		set {SavedQueryDefXMLDoc.DocElement.Attributes["BaseDODKey"].Value = value;}
	}

/*====================================================*/

	public String Category {
		get {return cXMLDoc.AttributeToString(SavedQueryDefXMLDoc.DocElement, "Category");}
		set {SavedQueryDefXMLDoc.DocElement.Attributes["Category"].Value = value;}
	}

/*====================================================*/
//Methods

	public void UpdateXML() {
		this["DataObjectXML"] = mSavedQueryDefXMLDoc.DocElement.OuterXml;
	}
	
/*----------------------------------------------------*/

	public XmlNode GetRelationalDataObjectNode() {
	/*This method returns a version of the data object node that can be used to get a
	relational data object list (i.e., one from which GetRelatedProperty can be called),
	as opposed to the "flat" list normally returned by the query tool */
	String aBaseDODKey;
	XmlNode aResultNode;
	XmlNode aBaseDODNode;
	XmlNode aBasePrimaryKeyNode;
	String aBasePrimaryKey;
	XmlElement aDisplayPropertiesEl;
	XmlElement aPrimaryKeyEl;
	
	//Make a copy of the data object node. This copy will not be persisted; it will only be returned to the caller of this method.
	aResultNode = SavedQueryDefXMLDoc.DocElement.Clone();
	//aResultNode.OuterXml = SavedQueryDefXMLDoc.DocElement.OuterXml;
	
    //The following adjustments must be made to the data object node for use in the e-mail utility:
    //1. DataObjectDefinitionKey attribute must be set to the base DOD key.
    aBaseDODKey = cXMLDoc.AttributeToString(aResultNode, "BaseDODKey");
    aResultNode.Attributes["DataObjectDefinitionKey"].Value = aBaseDODKey;

    //2. Result set type must be set to "Relational"
    aResultNode.Attributes["ResultSetType"].Value = "Relational";
    
    //3. Select type must be set to "Distinct"
    aResultNode.Attributes["SelectType"].Value = "Distinct";

    //4. Primary key property must be added to the data object node.
    aBaseDODNode = DataObjectFactory.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aBaseDODKey + "']");
    aBasePrimaryKeyNode = aBaseDODNode.SelectSingleNode("Properties/Property[@IsPrimaryKey = 'True']");
    aBasePrimaryKey = cXMLDoc.AttributeToString(aBasePrimaryKeyNode, "Key");
    aDisplayPropertiesEl = (XmlElement)aResultNode.SelectSingleNode("DisplayProperties");
    aPrimaryKeyEl = SavedQueryDefXMLDoc.XMLDocument.CreateElement("DisplayProperty");
    aPrimaryKeyEl.SetAttribute("PropertyKey", aBasePrimaryKey);
    aDisplayPropertiesEl.AppendChild(aPrimaryKeyEl);
	
	return aResultNode;
	}
	
/*----------------------------------------------------*/

	public String DisplayValue(cDataObject aDataObject, String aFullPropertyKey) {
		XmlNode aObjDefNode;
		XmlNode aRelationshipNode;
		String aDataType;
		String[] aKeys;
		String aFinalPropertyKey;
		XmlNode aPropertyNode;
		int i;
		String aChildDataDefinitionKey;
		
		aObjDefNode = DataObjectFactory.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + BaseDODKey + "']");
		if(aFullPropertyKey.IndexOf(".") != -1) {
			aKeys = aFullPropertyKey.Split(new Char[] {'.'});
			aFinalPropertyKey = aKeys[aFullPropertyKey.Length - 1];
			for(i = 0; i < aKeys.Length - 1; i++) {
				aRelationshipNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aKeys[i] + "']/Relationship");
				aChildDataDefinitionKey = cXMLDoc.AttributeToString(aRelationshipNode, "ChildDefinitionKey");
				aObjDefNode = DataObjectFactory.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aChildDataDefinitionKey + "']");
			}
		}
		else
			aFinalPropertyKey = aFullPropertyKey;

		aPropertyNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aFinalPropertyKey + "']");
		aDataType  = cXMLDoc.AttributeToString(aPropertyNode, "DataType");
		if(aDataType == "Boolean")
			return aDataObject.GetRelatedPropertyBool(aFullPropertyKey).ToString();
		else
			return aDataObject.GetRelatedPropertyString(aFullPropertyKey);
	}

/*====================================================*/

	public cReportOutput Create_ReportOutput(cDataObjectFactory aDataObjectFactory, 
											int aEntityID) {
		cReportOutput		aReportOutput;
		
		aReportOutput = (cReportOutput)aDataObjectFactory.CreateNewDataObjectFromKey("ReportOutput");

		aReportOutput["EntityID"] = aEntityID;
		aReportOutput["DefinitionID"] = cReportOutput.Get_ReportOutputDefinitionID(aDataObjectFactory, DefinitionKey);
		aReportOutput["GenRequestDate"] = DateTime.Now;
		aReportOutput["GenStatus"] = 0;
		aReportOutput["GenResult"] = "Report is in the queue to be generated.";
		aReportOutput["ReportParametersXML"] = SavedQueryDefXMLDoc.DocElement.OuterXml;
		aDataObjectFactory.SaveDataObject(aReportOutput);

		return aReportOutput;
	}

	/*====================================================*/

	public cReportOutput Create_ReportOutputWord(cDataObjectFactory aDataObjectFactory, 
		int aEntityID) 
	{
		cReportOutput		aReportOutput;
		
		aReportOutput = (cReportOutput)aDataObjectFactory.CreateNewDataObjectFromKey("ReportOutput");

		aReportOutput["EntityID"] = aEntityID;
		aReportOutput["DefinitionID"] = cReportOutput.Get_ReportOutputDefinitionID(aDataObjectFactory, "StaffQueryWord");
		aReportOutput["GenRequestDate"] = DateTime.Now;
		aReportOutput["GenStatus"] = 0;
		aReportOutput["GenResult"] = "Report is in the queue to be generated.";
		aReportOutput["ReportParametersXML"] = SavedQueryDefXMLDoc.DocElement.OuterXml;
		aDataObjectFactory.SaveDataObject(aReportOutput);

		return aReportOutput;
	}
	/*====================================================*/
} //class cSavedQuery


/*====================================================*/
} //namespace EasyGrants.DataAccess.Report 
