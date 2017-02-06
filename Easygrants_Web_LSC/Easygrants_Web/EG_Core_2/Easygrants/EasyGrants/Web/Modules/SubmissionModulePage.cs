using System;
using System.Web;
using System.Xml;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;
using Core.Web;
using Core.Web.Modules;
using EasyGrants.Web.User;
using EasyGrants.Web;
using EasyGrants.Workflow;
using EasyGrants.Correspondence;
using System.Text;

namespace EasyGrants.Web.Modules {
/*====================================================*/

///<summary>
///pre submission vs. post submission navigation, applicants dealing w/ 3rd party persons 
///</summary>
public class cSubmissionModulePage : cModulePage {
	/*====================================================*/

	private cXMLDoc mOutcomeConfigDoc;
	protected String mPostSubmitModuleName = "Home";
	protected String mPostSubmitModuleConfig = "HomeModuleConfig";
	protected String mPostSubmitPageKey = "";
	protected String mPostSubmitQueryString = "";

	/*====================================================*/

	public cEGSession EGSession {
		get { return (cEGSession) WebSession; }
	}

	/*-----------------------------------------------------*/

	public int WfTaskAssignmentID {
		get {
			try {
				return ((cEGUser) ModuleUser).WfTaskAssignmentID;
			} catch {
				Response.Redirect(WebAppl.LogoutURL);
				return -1;
			}
		}
	}

	/*-----------------------------------------------------*/

	public virtual cWfTaskAssignment WfTaskAssignmentObject {
		get {
			try {
				return (cWfTaskAssignment) ((cEGUser) ModuleUser).WfTaskAssignmentObject;
			} catch {
				Response.Redirect(WebAppl.LogoutURL);
				return null;
			}
		}
	}

	/*-----------------------------------------------------*/

	public String PostSubmitModuleName {
		get { return mPostSubmitModuleName; }
		set { mPostSubmitModuleName = value; }
	}

	/*-----------------------------------------------------*/

	public String PostSubmitModuleConfig {
		get { return mPostSubmitModuleConfig; }
		set { mPostSubmitModuleConfig = value; }
	}

	/*-----------------------------------------------------*/

	public String PostSubmitPageKey {
		get { return mPostSubmitPageKey; }
		set { mPostSubmitPageKey = value; }
	}

	/*-----------------------------------------------------*/

	public String PostSubmitQueryString {
		get { return mPostSubmitQueryString; }
		set { mPostSubmitQueryString = value; }
	}

	/*-----------------------------------------------------*/
	//Commented out on 8/1/2007 by Sumanth
	//public cXMLDoc OutcomeConfigDoc {
	//    get {
	//        if (mOutcomeConfigDoc == null){
	//            cDataObject aWfTaskModuleObject;

	//            aWfTaskModuleObject = WfTaskAssignmentObject.GetRelatedPropertyDataObject("WfTaskModule");

	//            //load the outcome config xml document
	//            String aOutcomeModule = aWfTaskModuleObject.GetPropertyString("ModuleName");
	//            String aOutcomeConfig = aWfTaskModuleObject.GetPropertyString("OutcomeConfigFilename");
	//            if (aOutcomeConfig.Substring(0,3) != "DB_")
	//                mOutcomeConfigDoc = new cXMLDoc(WebAppl.Build_RootFileSystemPath(WebAppl.Get_RelativeDefaultModuleRoot() + "/" + aOutcomeModule + "/" + aOutcomeConfig));
	//            else
	//                if (Application["gOutcomeConfig_" + aOutcomeModule + aOutcomeConfig] == null)
	//                {
	//                    mOutcomeConfigDoc = BuildOutcomeConfigFromDB(aOutcomeConfig);
	//                    Application["gOutcomeConfig_" + aOutcomeModule + aOutcomeConfig] = mOutcomeConfigDoc;
	//                }
	//                else
	//                    mOutcomeConfigDoc = (cXMLDoc)Application["gOutcomeConfig_" + aOutcomeModule + aOutcomeConfig];
	//        }
	//        return mOutcomeConfigDoc;
	//    }
	//}

	/*-----------------------------------------------------*/

	public cXMLDoc OutcomeConfigDoc {
		get {
			if (mOutcomeConfigDoc == null) {
				cDataObject aWfTaskModuleObject;
				cDataObject aWfProjectTaskDO;
				String aOutcomeConfig;
				String aOutcomeModule;
				
				aWfTaskModuleObject = WfTaskAssignmentObject.GetRelatedPropertyDataObject("WfTaskModule");
				aOutcomeModule = aWfTaskModuleObject.GetPropertyString("ModuleName");
				aOutcomeConfig = aWfTaskModuleObject.GetPropertyString("OutcomeConfigFilename");
				mOutcomeConfigDoc = new cXMLDoc();
				if (!mOutcomeConfigDoc.Load(WebAppl.Build_RootFileSystemPath(WebAppl.Get_RelativeDefaultModuleRoot() + "/" + aOutcomeModule + "/" + aOutcomeConfig))) {
					aWfProjectTaskDO = WfTaskAssignmentObject.GetWfProjectTask();
					if (aWfProjectTaskDO != null && aWfProjectTaskDO.HasProperty("WfProjectTaskOutcome")) {
						mOutcomeConfigDoc = BuildOutcomeConfig();
						//aOutcomeConfig = "gOutcomeConfig_" + aWfProjectTaskDO["WfProjectTaskID"];
						//if (Application[aOutcomeConfig] == null) {
						//    mOutcomeConfigDoc = BuildOutcomeConfig();
						//    Application[aOutcomeConfig] = mOutcomeConfigDoc;
						//}
					}
				}
			}
			return mOutcomeConfigDoc;
		}
	}

	/*-----------------------------------------------------*/
	
	private cXMLDoc BuildOutcomeConfig() {
	    cDataObject aWfProjectTask = WfTaskAssignmentObject.GetWfProjectTask();
	    return WebSession.BuildOutcomeConfig(aWfProjectTask);
	}

	private cXMLDoc BuildOutcomeConfigFromDB(String aName) {
		cDataObjectList aOutcomeList, aList;
		String aRelatedProperty;
		StringBuilder aXML = new StringBuilder();
		cXMLDoc aDoc = new cXMLDoc();

		aXML.Append("<?xml version='1.0' encoding='utf-8' ?>");
		aOutcomeList = this.WebSession.DataObjectFactory.GetDataObjectListWithFilter("ConfigureModuleOutcome", "Name", aName);

		if (aOutcomeList.Count > 0) {
			aXML.Append("<EasyGrants><Outcomes ProgramKey='");
			aXML.Append(aOutcomeList[0].GetPropertyString("ProgramKey"));
			aXML.Append("' DefaultOutcomeKey='");
			aXML.Append(aOutcomeList[0].GetPropertyString("DefaultOutcomeKey"));
			aXML.Append("' DefaultOutcomeDescription='");
			aXML.Append(aOutcomeList[0].GetPropertyString("DefaultOutcomeDescription"));
			aXML.Append("'>");

			aOutcomeList = this.WebSession.DataObjectFactory.GetDataObjectListWithFilter("ConfigureOutcome",
				"ConfigureModuleOutcomeID", aOutcomeList[0].GetPropertyString("ConfigureModuleOutcomeID"));

			foreach (cDataObject aOutcome in aOutcomeList) {
				aXML.Append("<Outcome OutcomeKey='");
				aXML.Append(aOutcome.GetPropertyString("OutcomeKey"));
				aXML.Append("' OutcomeDescription='");
				aXML.Append(aOutcome.GetPropertyString("OutcomeDescription"));
				aXML.Append("' DataObjectKey='");
				aXML.Append(aOutcome.GetPropertyString("DataObjectKey"));
				aXML.Append("' WfTaskAssignmentFilterKey='");
				aXML.Append(aOutcome.GetPropertyString("TaskAssignmentFilterKey"));
				aXML.Append("'><Filters>");

				aList = this.WebSession.DataObjectFactory.GetDataObjectListWithFilter("ConfigureOutcomeFilter",
					"ConfigureOutcomeID", aOutcome.GetPropertyString("ConfigureOutcomeID"));

				foreach (cDataObject aFilter in aList) {
					aXML.Append("<Argument Type='");
					aXML.Append(aFilter.GetPropertyString("Type"));
					aXML.Append("' TypeKey='");
					aXML.Append(aFilter.GetPropertyString("TypeKey"));
					aXML.Append("' PropertyKey='");
					aXML.Append(aFilter.GetPropertyString("PropertyKey"));
					aXML.Append("' Value='");
					aXML.Append(aFilter.GetPropertyString("PropertyValue"));
					aXML.Append("' Bool='");
					aXML.Append(aFilter.GetPropertyString("Bool"));
					aXML.Append("'>");

					aRelatedProperty = aFilter.GetPropertyString("RelatedPropertyKey");

					if (aRelatedProperty != "") {
						aXML.Append("<RelatedProperty PropertyKey='");
						aXML.Append(aRelatedProperty);
						aXML.Append("'/>");
					}
					aXML.Append("</Argument>");
				}
				aXML.Append("</Filters><Tasks>");
				aList = this.WebSession.DataObjectFactory.GetDataObjectListWithFilter("ConfigureOutcomeTask",
					"ConfigureOutcomeID", aOutcome.GetPropertyString("ConfigureOutcomeID"));

				foreach (cDataObject aTask in aList) {
					aXML.Append("<Task TaskKey='");
					aXML.Append(aTask.GetPropertyString("TaskKey"));
					aXML.Append("' Description='");
					aXML.Append(aTask.GetPropertyString("Description"));
					aXML.Append("' Status='");
					aXML.Append(aTask.GetPropertyString("Status"));
					aXML.Append("' Outcome='");
					aXML.Append(aTask.GetPropertyString("Outcome"));
					aXML.Append("' RoleID='");
					aXML.Append(aTask.GetPropertyString("RoleID"));
					aXML.Append("' NoPersonID='");
					aXML.Append(aTask.GetPropertyString("NoPersonID"));
					aXML.Append("'/>");
				}
				aXML.Append("</Tasks><Events>");
				aList = this.WebSession.DataObjectFactory.GetDataObjectListWithFilter("ConfigureOutcomeEvent",
					"ConfigureOutcomeID", aOutcome.GetPropertyString("ConfigureOutcomeID"));

				foreach (cDataObject aEvent in aList) {
					aXML.Append("<Event EventKey='");
					aXML.Append(aEvent.GetPropertyString("EventKey"));
					aXML.Append("' Description='");
					aXML.Append(aEvent.GetPropertyString("Description"));
					aXML.Append("'/>");
				}
				aXML.Append("</Events></Outcome>");
			}
			aXML.Append("</Outcomes></EasyGrants>");

			aDoc.LoadFromXML(aXML.ToString());
		}
		return aDoc;
	}

	/*-----------------------------------------------------*/

	public bool Get_SubmissionModulePage_Submitted() {
		cWfTaskAssignment aWfTaskAssignment = (cWfTaskAssignment) WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", WfTaskAssignmentID);
		if (aWfTaskAssignment.GetPropertyInt("WfTaskStatusID") == 2)
			return true;
		else
			return false;
	}
	/*====================================================*/

	public override void CorePage_Load(Object aSrc, EventArgs aEvent) {

		bool aSubmitted = Get_SubmissionModulePage_Submitted();

		ValidateContentControlForSubmitted(aSubmitted);

		base.CorePage_Load(aSrc, aEvent);

		ValidateNavigationForSubmitted(aSubmitted);

		if (!aSubmitted)
			ValidateNavigationForReopened();

	}

	/*====================================================*/

	public virtual void Submit_Redirect(String aModuleName, String aModuleConfig) {
		cXMLDoc aModuleDoc;
		cEGUser aUser;

		aUser = EGSession.EGUser_From_ModuleConfig(aModuleName, aModuleConfig, out aModuleDoc);
		ModulePage.ModulePage_RedirectToModule(aModuleDoc, PostSubmitPageKey, PostSubmitQueryString);
	}

	/*-----------------------------------------------------*/
	
	public virtual void Submit_UpdateData(cDataObjectList aDataObjectList) {
		Submit_UpdateData(aDataObjectList,true);
	}

	/*-----------------------------------------------------*/

	public virtual void Submit_UpdateData(cDataObjectList aDataObjectList, bool aRaiseSingleEvent)
	{
		foreach (cWfTaskAssignment aDataObject in aDataObjectList) {
			aDataObject.RaiseProcessEvents = true; //flag to raise pre and post submission processing events
			aDataObject["WfTaskStatusID"] = 2;
			aDataObject["SubmittedDate"] = System.DateTime.Now;
			aDataObject["ModifyUser"] = WebSession.DataObjectFactory.User.UserID;
			aDataObject["ModifyDate"] = System.DateTime.Now;
			WebSession.DataObjectFactory.SaveDataObject(aDataObject);
			aDataObject.RaiseProcessEvents = false;
		}
		//WebSession.DataObjectFactory.SaveDataObject(aDataObjectList);

		//Process outcomes for only one data object so that e-mails and tasks can be processed.
		//Since e-mail events use the entire data object list, we must create a new list containing only
		//one of these data objects

		for (int Pos = 0; Pos < aDataObjectList.Count; Pos++)
		{
				int aWfTaskAssignmentID = aDataObjectList[Pos].GetPropertyInt("WfTaskAssignmentID");
				cWfTaskAssignment aWfTaskAssignment = (cWfTaskAssignment) WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID);
				if (aRaiseSingleEvent && (Pos==0))
					aWfTaskAssignment.SetWfTaskOutcome(OutcomeConfigDoc, false, true, true);
				else if (aRaiseSingleEvent && (Pos > 0))
					aWfTaskAssignment.SetWfTaskOutcome(OutcomeConfigDoc, false, true, false);	
				else
					aWfTaskAssignment.SetWfTaskOutcome(OutcomeConfigDoc, false, true, true);		
				
			}
		

		//Set WfTaskStatusID property of WfTaskAssignmentObject in memory (this allows the post-submission content control to be displayed to the reviewer on redirect)
		WfTaskAssignmentObject["WfTaskStatusID"] = 2;

	}

	/*-----------------------------------------------------*/

	public virtual void Submit_UpdateData() {
		Submit_UpdateData(OutcomeConfigDoc);
	}

	/*-----------------------------------------------------*/

	public virtual void Submit_UpdateData(cXMLDoc aOutcomeConfigDoc)
	{
		cWfTaskAssignment aWfTaskAssignment = (cWfTaskAssignment)WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", WfTaskAssignmentID);
		aWfTaskAssignment.RaiseProcessEvents = true; //flag to raise pre and post submission processing events
		cDataObject aSubmissionHistory = null;
		if (WebAppl.CreateSubmissionHistory)
		{
			aSubmissionHistory = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("SubmissionHistory");
			aSubmissionHistory["WfTaskAssignmentID"] = WfTaskAssignmentID;
			aSubmissionHistory["WfTaskID"] = aWfTaskAssignment.GetPropertyInt("WfTaskID");
			aSubmissionHistory["PersonID"] = aWfTaskAssignment.GetPropertyInt("PersonID");
			//aSubmissionHistory["StartDate"] = (System.DateTime)aWfTaskAssignment.GetPropertyValue("StartDate");
			aSubmissionHistory["OpenDate"] = aWfTaskAssignment.GetPropertyValue("OpenDate");
			aSubmissionHistory["DueDate"] = aWfTaskAssignment.GetPropertyValue("DueDate");
			aSubmissionHistory["CloseDate"] = aWfTaskAssignment.GetPropertyValue("CloseDate");
			//aSubmissionHistory["EndDate"] = (System.DateTime)aWfTaskAssignment.GetPropertyValue("EndDate");
			aSubmissionHistory["PreWfTaskStatusID"] = aWfTaskAssignment.GetPropertyValue("WfTaskStatusID");
			aSubmissionHistory.SaveData();
		}
		aWfTaskAssignment["WfTaskStatusID"] = 2;
		aWfTaskAssignment["SubmittedDate"] = System.DateTime.Now;
		aWfTaskAssignment["SubmittedBy"] = WebSession.DataObjectFactory.User.UserID;
		aWfTaskAssignment["ModifyUser"] = WebSession.DataObjectFactory.User.UserID;
		aWfTaskAssignment["ModifyDate"] = System.DateTime.Now;
		WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssignment);
		aWfTaskAssignment.RaiseProcessEvents = false;
		//Continue processing the post submission workflow tasks only if the ContinueProcessing is still true
		if (aWfTaskAssignment.ContinueProcessing)
		{
			aWfTaskAssignment.SetWfTaskOutcome(aOutcomeConfigDoc);
		}
		if (WebAppl.CreateSubmissionHistory)
		{
			aSubmissionHistory["SubmittedDate"] = aWfTaskAssignment.GetPropertyValue("SubmittedDate");
			aSubmissionHistory["WfTaskOutcomeID"] = aWfTaskAssignment.GetPropertyValue("WfTaskOutcomeID");
			aSubmissionHistory["PostWfTaskStatusID"] = aWfTaskAssignment.GetPropertyValue("WfTaskStatusID");
			aSubmissionHistory.SaveData();
		}
		WebSession.DataObjectFactory.CopyDataObject(aWfTaskAssignment, ((cEGUser)ModuleUser).WfTaskAssignmentObject);
	}
	
	/*-----------------------------------------------------*/

	public virtual void Submit(cDataObjectList aDataObjectList, String aModuleName, String aModuleConfig) {
		Submit_UpdateData(aDataObjectList);
		Submit_Redirect(aModuleName, aModuleConfig);
	}

	/*-----------------------------------------------------*/

	public virtual void Submit(cDataObject aDataObject, String aModuleName, String aModuleConfig, String aPageKey) {

		Submit_UpdateData();
		Submit_Redirect(aModuleName, aModuleConfig);
	}

	/*-----------------------------------------------------*/

	public virtual void Submit(bool aForceGenFlag) {
		bool aReportGenerated = true;
		String aURL;
		cDataObjectList aReportDOList;

		if (aForceGenFlag) {
			aReportDOList = WfTaskAssignmentObject.GetRelatedPropertyDataObjectList("ReportOutput");

			aReportGenerated = aReportDOList.Count > 0 &&
					aReportDOList[0].GetPropertyInt("GenStatus") == -1 &&
					aReportDOList[0].GetPropertyValue("ReportOutputData") != null;
		}

		if (aReportGenerated)
			Submit(null, PostSubmitModuleName, PostSubmitModuleConfig, "");
		else {
			aURL = ModulePage_BuildPageKeyURL(PageKey);
			aURL = cWebLib.AddQuerystringParameter(aURL, "AppNotGenerated", "True");
			Response.Redirect(aURL);
		}
	}

	/*====================================================*/

	///<summary>
	///selects a third party by taking a PersonRelationShip and:
	///* creating a WfTaskAssighment for this third party role
	///* note that the user already exists
	///</summary>
	public virtual cWfTaskAssignment SelectThirdParty(String aPersonRelationshipID) {
		cDataObjectList aChildProjectTasksObjectList;
		// This following code needs to be modified if there are mutiple third parties for one project task. 
		aChildProjectTasksObjectList= WfTaskAssignmentObject.GetRelatedPropertyDataObjectList("WfProjectTask.ChildProjectTasks");
		if (aChildProjectTasksObjectList.Count > 1) {
		    cDataObject aPersonRelationshipDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("PersonRelationship", aPersonRelationshipID);
			cXMLDoc aXmlDoc;
			XmlNode aDataObjectNode, aFiltersNode, aArgNode;
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfProjectTask", out aDataObjectNode, out aFiltersNode);
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ParentProjectTaskID", WfTaskAssignmentObject.GetRelatedPropertyString("WfProjectTask.WfProjectTaskID")));
			aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ID", aPersonRelationshipDO.GetPropertyString("RelatedPersonRoleID")));
			aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "AssignToRoleWorkgroupStaffcontact"));
			cDataObject aChildProjectTaskDO = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode);
			return SelectThirdParty(aPersonRelationshipID, aChildProjectTaskDO.GetPropertyString("WfTaskID"));
		}
		else if (aChildProjectTasksObjectList.Count == 1) {
			return SelectThirdParty(aPersonRelationshipID,aChildProjectTasksObjectList[0].GetPropertyString("WfTaskID"));
		}
		return null;
	}

	/*-----------------------------------------------------*/

	public virtual cWfTaskAssignment SelectThirdParty(String aPersonRelationshipID, String aTaskID) {
		cXMLDoc aXmlDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		cDataObject aWfTaskAssgObject;
		cDataObject aPersonRelationshipDataObject;
		cDataObject aWfTaskAssgRelationshipObject;

		//If no selection has been made, just refresh the page
		if (aPersonRelationshipID == null || aTaskID == "") {
			Redirect();
			return null;
		}
		//get the Related Person Role
		aPersonRelationshipDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("PersonRelationship", aPersonRelationshipID);

		//check to see if this person already has a third party
		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aTaskID));
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", aPersonRelationshipDataObject.GetPropertyString("RelatedPersonID")));
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskRoleID", aPersonRelationshipDataObject.GetPropertyString("RelatedPersonRoleID")));
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "GranteeProjectID", ((cEGUser) ModuleUser).GranteeProjectID.ToString()));
		aWfTaskAssgObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode);

		if (aWfTaskAssgObject == null) {
			WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
			aWfTaskAssgObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode);

			aWfTaskAssgObject["WfTaskID"] = aTaskID;
			aWfTaskAssgObject["GranteeProjectID"] = ((cEGUser) ModuleUser).GranteeProjectID.ToString();
			aWfTaskAssgObject["WfTaskStatusID"] = 3; //3-inactive
			aWfTaskAssgObject["PersonID"] = aPersonRelationshipDataObject["RelatedPersonID"];
			aWfTaskAssgObject["WfTaskRoleID"] = aPersonRelationshipDataObject["RelatedPersonRoleID"];
			WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject);

			//create WfTaskAssignmentPersonRelationship
			WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentPersonRelationship", out aDataObjectNode, out aFiltersNode);
			aWfTaskAssgRelationshipObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode);
			aWfTaskAssgRelationshipObject["WfTaskAssignmentID"] = aWfTaskAssgObject["WfTaskAssignmentID"];
			aWfTaskAssgRelationshipObject["PersonRelationshipID"] = aPersonRelationshipID;
			WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgRelationshipObject);
		}

		return (cWfTaskAssignment) aWfTaskAssgObject;
	}

	/*-----------------------------------------------------*/

	public virtual cWfTaskAssignment SelectThirdParty(String aPersonRelationshipID, String aRoleID, String aTaskID) {
		cXMLDoc aXmlDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		cDataObject aWfTaskAssgObject;
		cDataObject aPersonRelationshipDataObject;
		cDataObject aWfTaskAssgRelationshipObject;

		if (aTaskID == "") {
			aTaskID = WfTaskAssignmentObject.GetPropertyString("WfTaskID");
		}
		//If no selection has been made, just refresh the page
		if (aPersonRelationshipID == null || aTaskID == "") {
			Redirect();
			return null;
		}
		//get the Related Person Role
		aPersonRelationshipDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("PersonRelationship", aPersonRelationshipID);

		//check to see if this person already has a third party
		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aTaskID));
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", aPersonRelationshipDataObject.GetPropertyString("RelatedPersonID")));
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskRoleID", "4"));
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "RefereeRoleID", aRoleID));
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "GranteeProjectID", ((cEGUser) ModuleUser).GranteeProjectID.ToString()));
		aWfTaskAssgObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode);

		if (aWfTaskAssgObject == null) {
			WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
			aWfTaskAssgObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode);

			aWfTaskAssgObject["WfTaskID"] = aTaskID;
			aWfTaskAssgObject["GranteeProjectID"] = ((cEGUser) ModuleUser).GranteeProjectID.ToString();
			aWfTaskAssgObject["WfTaskStatusID"] = 3; //3-inactive
			aWfTaskAssgObject["PersonID"] = aPersonRelationshipDataObject["RelatedPersonID"];
			aWfTaskAssgObject["WfTaskRoleID"] = 4;
			aWfTaskAssgObject["RefereeRoleID"] = aRoleID;
			WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject);

			//create WfTaskAssignmentPersonRelationship
			WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentPersonRelationship", out aDataObjectNode, out aFiltersNode);
			aWfTaskAssgRelationshipObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode);
			aWfTaskAssgRelationshipObject["WfTaskAssignmentID"] = aWfTaskAssgObject["WfTaskAssignmentID"];
			aWfTaskAssgRelationshipObject["PersonRelationshipID"] = aPersonRelationshipID;
			WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgRelationshipObject);
		}

		return (cWfTaskAssignment) aWfTaskAssgObject;
	}

	/*-----------------------------------------------------*/
	/*
		notifies thrid party by:
		* retrieving appropriate WfTaskAssignment
		* settting status to 1 (active)
		* evaluating outcome, which will raise appropriate events
	*/
	public virtual void NotifyThirdParty(String aWfTaskAssignmentID) {
		NotifyThirdParty(aWfTaskAssignmentID,"False");
	}

	/*-----------------------------------------------------*/

	public virtual void NotifyThirdParty(String aWfTaskAssignmentID, String aRedirectFlag) {
		cWfTaskAssignment aWfTaskAssgObject;

		aWfTaskAssgObject = (cWfTaskAssignment)WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID);
		aWfTaskAssgObject["OpenDate"] = System.DBNull.Value;
		aWfTaskAssgObject.SaveData();
		aWfTaskAssgObject.SetWfTaskOutcome(WebSession.BuildOutcomeConfig(aWfTaskAssgObject.GetWfProjectTask()));
		aWfTaskAssgObject["WfTaskStatusID"] = 1; //incomplete
		aWfTaskAssgObject["OpenDate"] = DateTime.Now;
		WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject);
		WfTaskAssignmentObject.Notify_DataModified(WebSession.DataObjectFactory, null);

		WfTaskAssignmentObject.Notify_DataModified(WebSession.DataObjectFactory, null);

		if (aRedirectFlag == "True")
			ModulePage.Redirect();
	}

	/*-----------------------------------------------------*/

	public virtual void SelectAndNotifyThirdParty(String aPersonRelationshipID, String aRedirectFlag) {
		cWfTaskAssignment aWfTaskAssgObject;

		aWfTaskAssgObject = SelectThirdParty(aPersonRelationshipID);
		if (aWfTaskAssgObject == null)
			return;

		NotifyThirdParty(aWfTaskAssgObject.GetPropertyString("WfTaskAssignmentID"));

		if (aRedirectFlag == "True")
			ModulePage.Redirect();
	}

	/*-----------------------------------------------------*/

	public virtual void SelectAndNotifyThirdParty(String aPersonRelationshipID, String aTaskID, String aRedirectFlag) {
		cWfTaskAssignment aWfTaskAssgObject;

		aWfTaskAssgObject = SelectThirdParty(aPersonRelationshipID, aTaskID);
		if (aWfTaskAssgObject == null)
			return;

		NotifyThirdParty(aWfTaskAssgObject.GetPropertyString("WfTaskAssignmentID"));

		if (aRedirectFlag == "True")
			ModulePage.Redirect();
	}

	/*-----------------------------------------------------*/

	public virtual void SelectAndNotifyThirdParty(String aPersonRelationshipID, String aRoleID, String aTaskID, String aRedirectFlag) {
		cWfTaskAssignment aWfTaskAssgObject;

		aWfTaskAssgObject = SelectThirdParty(aPersonRelationshipID, aRoleID, aTaskID);
		if (aWfTaskAssgObject == null)
			return;

		NotifyThirdParty(aWfTaskAssgObject.GetPropertyString("WfTaskAssignmentID"));

		if (aRedirectFlag == "True")
			ModulePage.Redirect();
	}

	/*-----------------------------------------------------*/

	public virtual void DeleteThirdParty(String aWfTaskAssignmentID, String aRedirectFlag) {
		cWfTaskAssignment aWfTaskAssgObject;
		cXMLDoc aXMLDoc;
		XmlNode aDataObjNode,
							aFiltersNode;
		cDataObject aWfTaskPerson;

		aWfTaskAssgObject = (cWfTaskAssignment) WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID);

		aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentPersonRelationship", out aDataObjNode, out aFiltersNode);
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskAssignmentID", aWfTaskAssignmentID));
		aWfTaskPerson = WebSession.DataObjectFactory.GetDataObject(aDataObjNode);

		//aWfTaskAssgObject["WfTaskStatusID"] = 3; //inactive
		aWfTaskAssgObject["OpenDate"] = System.DateTime.Now;
		WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject);
		aWfTaskAssgObject.SetWfTaskOutcome(WebSession.BuildOutcomeConfig(aWfTaskAssgObject.GetWfProjectTask()));

		//Delete PDFs
		cWfTaskAssignment aApplWfTA;
		cDataObjectList aDOL;
		aDOL = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "GranteeProjectID", aWfTaskAssgObject.GetPropertyString("GranteeProjectID", "0"), "WfTaskRoleID", "1");
		foreach (cDataObject aDO in aDOL) {
			if (aDO.GetRelatedPropertyInt("WfTask.WfTaskTypeID", 0) == 1) {
				aApplWfTA = (cWfTaskAssignment) aDO;
				aApplWfTA.Notify_DataModified(WebSession.DataObjectFactory, null);
				break;
			}
		}

		WebSession.DataObjectFactory.DeleteData(aWfTaskPerson);
		WebSession.DataObjectFactory.DeleteData("WfTaskAssignment", aWfTaskAssignmentID);
		WebSession.DataObjectFactory.DeleteData("PersonRelationship", aWfTaskPerson.GetPropertyString("PersonRelationshipID"));

		if (aRedirectFlag == "True")
			ModulePage.Redirect();
	}

	/*-----------------------------------------------------*/

	public virtual void DeleteThirdParty(String aWfTaskAssignmentID) {
		DeleteThirdParty(aWfTaskAssignmentID, "True");
	}

	/*-----------------------------------------------------*/

	public virtual void DeleteThirdPartyEMF(String aWfTaskAssignmentID, String aPersonRelationshipID, String aRedirectFlag) {
		cWfTaskAssignment aWfTaskAssgObject;
		cXMLDoc aXMLDoc;
		XmlNode aDataObjNode,
								aFiltersNode;
		cDataObject aWfTaskPerson;

		aWfTaskAssgObject = (cWfTaskAssignment) WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID);

		aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentPersonRelationship", out aDataObjNode, out aFiltersNode);
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskAssignmentID", aWfTaskAssignmentID));
		aWfTaskPerson = WebSession.DataObjectFactory.GetDataObject(aDataObjNode);

		//aWfTaskAssgObject["WfTaskStatusID"] = 3; //inactive
		//WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject);
		//aWfTaskAssgObject.SetWfTaskOutcome();
		cDataObject aPersonRelationshipDO;
		aPersonRelationshipDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("PersonRelationship", aPersonRelationshipID);
		try {
			cDataObjectList aList = this.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment",
				"WfTaskAssignmentID", aWfTaskAssignmentID);
			cDataObjectList aTempList = this.WebSession.DataObjectFactory.GetDataObjectListWithFilter("CorrespondenceDefinition",
				"CorrespondenceDefinitionID", "26");
			cCorrespondenceJob aJob = new cCorrespondenceJob(aPersonRelationshipDO.GetRelatedPropertyInt("RelatedPerson.User.UserID", 0));
			aJob.EmailArgs = new cEmailArgsDataObject(aList);
			aJob.CorrespondenceDefinition = aTempList[0];

			aJob.SendEmail(this.WebSession.DataObjectFactory.Appl);
		} catch { }

		WebSession.DataObjectFactory.DeleteData(aWfTaskPerson);
		WebSession.DataObjectFactory.DeleteData("WfTaskAssignment", aWfTaskAssignmentID);

		if (aPersonRelationshipDO != null) {
			/*
			cDataObject	aPersonDO;
			aPersonDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aPersonRelationshipDO.GetPropertyInt("RelatedPersonID", 0));
			if (aPersonDO != null){
				cDataObject aUserDO;
				aUserDO = aPersonDO.GetRelatedPropertyDataObject("User");
				if (aUserDO != null){
					WebSession.DataObjectFactory.DeleteData(aUserDO);
				}
				WebSession.DataObjectFactory.DeleteData(aPersonDO);
			}
			*/
			WebSession.DataObjectFactory.DeleteData(aPersonRelationshipDO);
		}

		if (aRedirectFlag == "True")
			ModulePage.Redirect();
	}

	/*====================================================*/

	public virtual void AddTranscript(String aEducationID) {

	}

	/*====================================================*/

	public void ValidateNavigationForReopened() {
		cDataObject aWfTaskAssignment = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", WfTaskAssignmentID);
		if (aWfTaskAssignment.GetPropertyInt("WfTaskStatusID") == 4) {
			//Check to see if there is an active reopen request. If so,
			cDataObject aReopenRequest = aWfTaskAssignment.GetRelatedPropertyDataObject("ActiveRequestToReopenThis");
			if (aReopenRequest != null) {
				//Check to see if there are reopen sections. If so,
				cDataObjectList aReopenSectionList = aReopenRequest.GetRelatedPropertyDataObjectList("WftaReopenSections");
				if (aReopenSectionList.Count > 0) {
					ModuleUser.MasterNavElement.NavElement_FirstLevel_ValidateForReopened(aReopenSectionList);
				}
			}
		}
	}

	/*====================================================*/

	public virtual int ValidateUploads(cWfTaskAssignment aWfTaskAssignment, XmlElement aValidationItemNode) {
		cDataObjectList aSubmittedFileList;
		cDataObjectList aProjectTaskUploadsList;
		XmlElement aResultEl;
		string aWfProjectTaskUploadID;
		String aMessage = "";
		int aResultCode = 0;

		aProjectTaskUploadsList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("WfProjectTask.TaskUploadType");
		foreach (cDataObject aUploadDO in aProjectTaskUploadsList) {
			//Checking if grantee primary organization's eligibility is status is one of the project task upload eligbility status's
			int aPrimaryOrgEligStatusID = aWfTaskAssignment.GetRelatedPropertyInt("Person.PersonPrimaryAffiliation.Organization.EligibilityStatusID", 0);
			cDataObjectList aWfProjectTaskUploadEligDOL = aUploadDO.GetRelatedPropertyDataObjectList("WfProjectTaskUploadOrganizationEligibility");
			bool aIsOrgEligible = false;
			foreach (cDataObject aWfProjectTaskUploadEligDO in aWfProjectTaskUploadEligDOL) {
				if (aWfProjectTaskUploadEligDO.GetPropertyInt("OrganizationEligibilityID", -1) == aPrimaryOrgEligStatusID) {
					aIsOrgEligible = true;
				}
			}
			if (aIsOrgEligible)
				continue;
			aWfProjectTaskUploadID = aUploadDO.GetPropertyString("WfProjectTaskUploadID", "0");
			bool IsRequired = aUploadDO.GetPropertyBool("IsRequired", false);
			int UploadStatus = EvaluateUploadItem(aWfProjectTaskUploadID, aWfTaskAssignment.GetPropertyString("WfTaskAssignmentID", "0"), IsRequired);
			if (UploadStatus == -1 || UploadStatus == 0) {
				if (IsRequired)
					aMessage = aMessage + aUploadDO.GetRelatedPropertyString("Upload.UploadName") + " was not uploaded or file conversion was not successful.<br />";
				else
					aMessage = aMessage + aUploadDO.GetRelatedPropertyString("Upload.UploadName") + " file conversion was not successful.<br />";
				aResultCode = 3;
			}
		}
		if (aResultCode == 3) {
			aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, aResultCode);
			if (aResultEl != null)
				cXMLDoc.SetValidationResultMessage(ref aResultEl, aMessage);
			return aResultCode;
		} else
			return 1;

	}

	/*====================================================*/
	
	public int EvaluateUploadItem(string aWfProjectTaskUploadID, string EntitityID, bool IsRequired) {
		//1 Successful conversion or Zero non-required uploads
		//-1 Un successful conversion
		//0 Missing upload
		//
		cDataObjectList aSubmittedFileDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", "EntityID", EntitityID, "UploadID", aWfProjectTaskUploadID);
		if (aSubmittedFileDO.Count > 0) {
			if (aSubmittedFileDO[0].GetPropertyInt("ConversionStatus", 0) == -1)
				return 1;
			else
				return -1;
		} else
			if (IsRequired)
				return 0;
			else
				return 1;


	}
	/*====================================================*/
} //cPublicModulePage

}//EasyGrants.Web.Modules
