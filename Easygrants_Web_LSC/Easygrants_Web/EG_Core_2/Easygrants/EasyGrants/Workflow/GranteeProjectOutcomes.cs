using System;
using System.Diagnostics;
using System.Data;
using System.Collections;
using System.Xml;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;


namespace EasyGrants.Workflow {
/*====================================================*/

/// <summary>
/// updates and modifies grantee project outcomes 
/// </summary>
public class cGranteeProjectOutcomes:cDataObject{
/*====================================================*/

	public cGranteeProjectOutcomes(DataRow aDataObjectRow, cDataObjectList aDataObjectList):
				base(aDataObjectRow, aDataObjectList) {
	} 

/*====================================================*/

	protected void Update_Previous_Outcomes(int aOutcomeID){
		cDataObject	aWfTaskCur;
		cDataObject	aGranteeProject;
		int aGranteeProjectIDCur;
		cDataObjectList aWfTaskList;
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		XmlNode aSortNode;
		XmlNode aArgNode;

		//this is the WfTask for our record in GranteeProjectOutcomes
		aWfTaskCur = this.GetRelatedPropertyDataObject("WfTask");
		aGranteeProjectIDCur = this.GetPropertyInt("GranteeProjectID");
		aGranteeProject = this.GetRelatedPropertyDataObject("GranteeProject");
		
		//select all tasks prior to the current one 
		aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfProjectTask", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfProjectID", aGranteeProject.GetPropertyString("WfProjectID")));
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfTaskID", aWfTaskCur.GetPropertyString("WfTaskID")));
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "SortOrder", aWfTaskCur.GetPropertyString("SortOrder"),"and","LessThan"));
		aSortNode = aXMLDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Sort", "");
		aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "SortOrder", "");
		aSortNode.AppendChild(aArgNode);
		aDataObjectNode.AppendChild(aSortNode);
		aWfTaskList = DataObjectFactory.GetDataObjectList(aDataObjectNode);
		foreach(cDataObject aWfTask in aWfTaskList){
			Create_Outcome(this.DataObjectFactory, aGranteeProjectIDCur, aWfTask.GetPropertyInt("WfTaskID"), 0, true, false, false);
		}
		if(aOutcomeID > 0)
			this["OutcomeID"] = aOutcomeID;
		this.SaveData();
	}

/*----------------------------------------------------*/

	protected void Update_Next_Outcomes(int aOutcomeID){
		cDataObject	aWfTaskCur;
		cDataObject	aGranteeProject;
		int aGranteeProjectIDCur;
		cDataObjectList aWfTaskList;
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		XmlNode aSortNode;
		XmlNode aArgNode;

		//this is the WfTask for our record in GranteeProjectOutcomes
		aWfTaskCur = this.GetRelatedPropertyDataObject("WfTask");
		aGranteeProjectIDCur = this.GetPropertyInt("GranteeProjectID");
		aGranteeProject = this.GetRelatedPropertyDataObject("GranteeProject");
		
		//select all tasks after the current one
		aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfProjectTask", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfProjectID", aGranteeProject.GetPropertyString("WfProjectID")));
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfTaskID", aWfTaskCur.GetPropertyString("WfTaskID")));
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "SortOrder", aWfTaskCur.GetPropertyString("SortOrder"),"and","GreaterThan"));
		aSortNode = aXMLDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Sort", "");
		aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "SortOrder", "");
		aSortNode.AppendChild(aArgNode);
		aDataObjectNode.AppendChild(aSortNode);
		aWfTaskList = DataObjectFactory.GetDataObjectList(aDataObjectNode);
		foreach(cDataObject aWfTask in aWfTaskList){
			Create_Outcome(this.DataObjectFactory, aGranteeProjectIDCur, aWfTask.GetPropertyInt("WfTaskID"), 0, false, false, false);
		}
		if(aOutcomeID > 0)
			this["OutcomeID"] = aOutcomeID;
		this.SaveData();
	}

/*----------------------------------------------------*/

	public static cGranteeProjectOutcomes  Create_Outcome(cDataObjectFactory aDataObjectFactory, int aGranteeProjectID, int aWfTaskID, int aOutcomeID, bool aComplete, bool aCreatePrevious, bool aCreateNext) {
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		XmlNode aArgNode;
		cGranteeProjectOutcomes aGranteeProjectOutcomes;

		aXMLDoc = aDataObjectFactory.CreateDataObjectNode("GranteeProjectOutcomes", out aDataObjectNode, out aFiltersNode);
		aArgNode = aDataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "GranteeProjectID", aGranteeProjectID.ToString());
		aFiltersNode.AppendChild(aArgNode);
		aArgNode = aDataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskID", aWfTaskID.ToString());
		aFiltersNode.AppendChild(aArgNode);
		aGranteeProjectOutcomes = (cGranteeProjectOutcomes) aDataObjectFactory.GetDataObject(aDataObjectNode);
		if(aGranteeProjectOutcomes != null){
			//Update the Outcome
			if (aOutcomeID > 0)
				aGranteeProjectOutcomes["OutcomeID"] = aOutcomeID;
			aGranteeProjectOutcomes["Complete"] = aComplete;
		}
		else{
			//Create a new data object.
			aGranteeProjectOutcomes = (cGranteeProjectOutcomes) aDataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectOutcomes");
			aGranteeProjectOutcomes["GranteeProjectID"] =  aGranteeProjectID;
			aGranteeProjectOutcomes["WfTaskID"] = aWfTaskID;
			if (aOutcomeID > 0)
				aGranteeProjectOutcomes["OutcomeID"] = aOutcomeID;
			aGranteeProjectOutcomes["Complete"] = aComplete;
		}
		aGranteeProjectOutcomes.SaveData();
		if (aCreatePrevious)
			aGranteeProjectOutcomes.Update_Previous_Outcomes(aOutcomeID);
		if (aCreateNext)
			aGranteeProjectOutcomes.Update_Next_Outcomes(aOutcomeID);
		return aGranteeProjectOutcomes;
	}

/*----------------------------------------------------*/

	public static cGranteeProjectOutcomes  Create_Outcome(cWfTaskAssignment aWfTA, bool aComplete, bool aCreatePrevious, bool aCreateNext) {
		cGranteeProjectOutcomes aGranteeProjectOutcomes = null;
		cDataObjectFactory aDataObjectFactory;
		aDataObjectFactory = aWfTA.DataObjectFactory;

		int aOutcomeID = aWfTA.GetPropertyInt("WfTaskOutcomeID",0);
		int aGPID = aWfTA.GetPropertyInt("GranteeProjectID",0);
		int aWfTaskID = aWfTA.GetPropertyInt("WfTaskID",0);
		if (aGPID > 0 && aWfTaskID > 0){
			aGranteeProjectOutcomes = cGranteeProjectOutcomes.Create_Outcome(aDataObjectFactory, aGPID, aWfTaskID, aOutcomeID, aComplete, aCreatePrevious, aCreateNext);
		}
		return aGranteeProjectOutcomes;
	}

/*----------------------------------------------------*/

	public static void  Validate_For_WfTA_Update(cWfTaskAssignment aWfTA) {
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		XmlNode aArgNode;
		cDataObject aGranteeProjectOutcomes;
		cDataObjectFactory aDataObjectFactory;
		aDataObjectFactory = aWfTA.DataObjectFactory;

		aXMLDoc = aDataObjectFactory.CreateDataObjectNode("GranteeProjectOutcomes", out aDataObjectNode, out aFiltersNode);
		aArgNode = aDataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "GranteeProjectID", aWfTA.GetPropertyString("GranteeProjectID"));
		aFiltersNode.AppendChild(aArgNode);
		aArgNode = aDataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskID", aWfTA.GetPropertyString("WfTaskID"));
		aFiltersNode.AppendChild(aArgNode);
		aGranteeProjectOutcomes = (cGranteeProjectOutcomes) aDataObjectFactory.GetDataObject(aDataObjectNode);
		if(aGranteeProjectOutcomes != null){
			//Update the Outcome
			if (aWfTA.GetPropertyInt("WfTaskOutcomeID", 0) > 0)
				aGranteeProjectOutcomes["OutcomeID"] = aWfTA.GetPropertyInt("WfTaskOutcomeID");
		}
		else{
			//Create a new data object.
			aGranteeProjectOutcomes = aDataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectOutcomes");
			aGranteeProjectOutcomes["GranteeProjectID"] =  aWfTA.GetPropertyInt("GranteeProjectID");
			aGranteeProjectOutcomes["WfTaskID"] = aWfTA.GetPropertyInt("WfTaskID");
			if (aWfTA.GetPropertyInt("WfTaskOutcomeID", 0) > 0)
				aGranteeProjectOutcomes["OutcomeID"] = aWfTA.GetPropertyInt("WfTaskOutcomeID");
			aGranteeProjectOutcomes["Complete"] = false;
		}
		aGranteeProjectOutcomes.SaveData();
	}

/*====================================================*/
} //cGranteeProjectOutcomes
} //EasyGrants.Workflow

