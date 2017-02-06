using System;
using System.Diagnostics;
using System.Data;
using System.Collections;
using System.Xml;
using System.Data.SqlClient;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;
using Core.DataAccess.DBAccess;
using EasyGrants.DataAccess;
using EasyGrants.DataAccess.Budget;


namespace EasyGrants.Workflow {
/*====================================================*/

///<summary>
///Reference point for all tasks that represent grant application
///manages a list of ReviewCommitteeMembers that have been assigned to GranteeProject
///</summary>
public class cGranteeProject:cDataObject
{
/*====================================================*/
	//contains a list of ReviewCommitteeMembers that have been assigned to 
	//GranteeProject in memory, this assignment might or might not be written
	//to the database
	
	private ArrayList	mAssignedReviewers = new ArrayList(); 

/*====================================================*/

	public int ReviewerCount {
		get {return mAssignedReviewers.Count;}
	}
	
/*====================================================*/

	public cGranteeProject(DataRow aDataObjectRow, cDataObjectList aDataObjectList):
				base(aDataObjectRow, aDataObjectList) {
		
	} 

/*====================================================*/

	public void AddReviewer(cReviewCommitteeMember aDataObject) {
	
		mAssignedReviewers.Add(aDataObject);
	}
	
/*====================================================*/

	public bool IsAssigned(cReviewCommitteeMember aDataObject) {
		
		return mAssignedReviewers.Contains(aDataObject);
	}
	
/*====================================================*/
	///<summary>
	//This method returns the workflow task assignment ID corresponding to the review assignment of the 
	//grantee project to the specified review committee member in the request/conflict stage of the project
	///</summary>
	public cDataObject GetRequestConflictDO(cReviewCommitteeMember aRevCommMember) 
	{
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		cDataObject aRCDO = null;
		cDataObjectList aWfTAList;
		
		//Get workflow task assignment ID matching grantee and reviewer in this stage
		aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "PersonID", aRevCommMember.GetPropertyString("PersonID")));
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "GranteeProjectID", GetPropertyString("GranteeProjectID")));
		aWfTAList = DataObjectFactory.GetDataObjectList(aDataObjectNode);
		
		if (aWfTAList != null) {
			foreach (cDataObject aWfTA in aWfTAList) {
		
				//Get request/conflict data object based on workflow task assignment ID
				aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentRequestConflict", out aDataObjectNode, out aFiltersNode);
				aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfTaskAssignmentID", aWfTA.GetPropertyString("WfTaskAssignmentID")));
				aRCDO = DataObjectFactory.GetDataObject(aDataObjectNode);
				if (aRCDO !=null) 
					break;
			}
		}
		
		return aRCDO;
	}

/*====================================================*/

	public bool HasConflictWith(cReviewCommitteeMember aRevCommMember) {
		cDataObject aRCDO;

		aRCDO = GetRequestConflictDO(aRevCommMember);
		if(aRCDO == null)
			return false;
		if(aRCDO.GetPropertyInt("RequestConflictID") != 2)
			return false;
		return true;
	}

/*====================================================*/

	public bool IsRequestedBy(cReviewCommitteeMember aRevCommMember) {
		cDataObject aRCDO;
	
		aRCDO = GetRequestConflictDO(aRevCommMember);
		if(aRCDO == null)
			return false;
		if(aRCDO.GetPropertyInt("RequestConflictID") != 1)
			return false;
		return true;
	}

/*====================================================*/
	///<summary>
	///Retrieve from database existing review assignments for this GranteeProject
	///</summary>
	public cDataObjectList GetReviewAssignments(int aWfTaskID) {
		
		cXMLDoc aXmlDoc;
		XmlNode aFiltersNode;
		XmlNode aDataObjectNode;
		
		aXmlDoc = this.DataObjectList.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(this.DataObjectList.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aWfTaskID.ToString())); 
		aFiltersNode.AppendChild(this.DataObjectList.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "GranteeProjectID", this.GetPropertyString("GranteeProjectID"))); 
		
		return this.DataObjectList.DataObjectFactory.GetDataObjectList(aDataObjectNode);
			
	}
	
/*====================================================*/
	///<summary>
	///Delete from database existing review assignments for this GranteeProject
	///</summary>
	public void DeleteReviewAssignments(int aWfProjectTaskID) {
		cDataObject GranteeProjectReviewStageDO;
		cDataObjectList aReviewAssignmentList;
		
		GranteeProjectReviewStageDO = GetGranteeProjectReviewStageDO(aWfProjectTaskID);
		DataObjectFactory.DeleteData(GranteeProjectReviewStageDO);
		
		cDataObject aWfProjectTaskDO = DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", aWfProjectTaskID);
		aReviewAssignmentList = GetReviewAssignments(aWfProjectTaskDO.GetPropertyInt("WfTaskID"));
		DataObjectFactory.DeleteData(aReviewAssignmentList);
	}
	
/*====================================================*/

	public void SaveReviewAssignments(int aWfProjectTaskID) {
		cDataObject aWfProjectTask = this.DataObjectList.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", aWfProjectTaskID);
		SaveReviewAssignments(aWfProjectTaskID, aWfProjectTask.GetPropertyInt("WfTaskID"));
	}

/*====================================================*/

	public void SaveReviewAssignments(int aWfProjectTaskID, int aWfTaskID) {
	
		cXMLDoc aXmlDoc;
		XmlNode aFiltersNode;
		XmlNode aDataObjectNode;
		cDataObject aWfTaskAssgDataObject;
		int assignment_count = 0;
		
		if (mAssignedReviewers.Count > 0) {
			cDataObject aGPReviewStage = GetGranteeProjectReviewStageDO(aWfProjectTaskID);
		}
	
		foreach (cReviewCommitteeMember aReviewer in mAssignedReviewers){
			aXmlDoc = this.DataObjectList.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
			aWfTaskAssgDataObject = this.DataObjectList.DataObjectFactory.GetNewDataObject(aDataObjectNode); 
			aWfTaskAssgDataObject["WfTaskID"] = aWfTaskID;
			aWfTaskAssgDataObject["PersonID"] = aReviewer["PersonID"];
			aWfTaskAssgDataObject["WfTaskRoleID"] = 7;
			aWfTaskAssgDataObject["GranteeProjectID"] = this["GranteeProjectID"];
			aWfTaskAssgDataObject["WfTaskStatusID"] = 1; //incomplete
			aWfTaskAssgDataObject["AssignmentOrdinal"] = assignment_count; //used to identify primary, secondary reviewer
			
			assignment_count+=1;
			
			this.DataObjectList.DataObjectFactory.SaveDataObject(aWfTaskAssgDataObject);
		}
	}
	
/*====================================================*/

	public cDataObject GetGranteeProjectReviewStageDO(int aWfProjectTaskID) {
	//Returns the GranteeProjectReviewStage data object for the current GranteeProject in the review stage
	//indicated by the aWfProjectTaskID parameter.
		int aReviewStageID;
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		XmlNode aArgNode;
		cDataObject aGranteeProjectReviewStageDO;
		cDataObject aReviewStageDO;
		int aAppWfTaskID;
		cDataObject aAppWFTADO;
		
		aReviewStageID = cReviewStage.GetReviewStageIDFromWfProjectTaskID(aWfProjectTaskID, DataObjectFactory);
		aXMLDoc = DataObjectFactory.CreateDataObjectNode("GranteeProjectReviewStage", out aDataObjectNode, out aFiltersNode);
		aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "GranteeProjectID", GetPropertyString("GranteeProjectID"));
		aFiltersNode.AppendChild(aArgNode);
		aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "ReviewStageID", aReviewStageID.ToString());
		aFiltersNode.AppendChild(aArgNode);
		aGranteeProjectReviewStageDO = DataObjectFactory.GetDataObject(aDataObjectNode);
		if(aGranteeProjectReviewStageDO != null)
			return aGranteeProjectReviewStageDO;
		else
			//Create a new data object.
			//In order to populate this object, we will need the WfTaskAssignmentID of the application. In order
			//to get it, we will need the Application WfTaskID corresponding to this review stage. 
			//The WfTaskID of the application WfProjectTask is the same as the parent task of the review stage task. 
			aReviewStageDO = DataObjectFactory.GetDataObjectFromPrimaryKey("ReviewStage", aReviewStageID);
			aAppWfTaskID = aReviewStageDO.GetRelatedPropertyInt("WfProjectTask.WfTask.WfParentTaskID");
			
			//Parent applicant WfTaskAssignmentID, filtering on GranteeProjectID and WfTaskID
			aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
			aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "GranteeProjectID", GetPropertyString("GranteeProjectID"));
			aFiltersNode.AppendChild(aArgNode);
			aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskID", aAppWfTaskID.ToString());
			aFiltersNode.AppendChild(aArgNode);
			aAppWFTADO = DataObjectFactory.GetDataObject(aDataObjectNode);
			
			//Get GranteeProjectReviewStage data object, set values, save and return
			aGranteeProjectReviewStageDO = DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectReviewStage");
			aGranteeProjectReviewStageDO["ReviewStageID"] = aReviewStageID;
			aGranteeProjectReviewStageDO["GranteeProjectID"] =  GetPropertyInt("GranteeProjectID");
			aGranteeProjectReviewStageDO["AppWfTaskAssignmentID"] = aAppWFTADO.GetPropertyInt("WfTaskAssignmentID");
			DataObjectFactory.SaveDataObject(aGranteeProjectReviewStageDO);
			return aGranteeProjectReviewStageDO;
	}

/*====================================================*/

	//Returns the GranteeProjectReviewStage data object for the current GranteeProject 
	//in the review stage indicated by the aReviewCycleStageID and aRevPersonID parameters.
	//This is for the new Review model and uses the following views with the minimum required columns:
	//vApplicantPool: GranteeProjectID, WfTaskAssignmentID
	//vCommitteePool: PersonID, ReviewCycleID, ReviewCommitteeID
	public cDataObject GetGranteeProjectReviewStageDO(int aReviewCycleStageID, int aRevPersonID) 
	{
		int aReviewCycleID = DataObjectFactory.GetDataObjectFromPrimaryKey("ReviewCycleStage", aReviewCycleStageID).GetPropertyInt("ReviewCycleID");
		return GetGranteeProjectReviewStageDO(aReviewCycleStageID, aReviewCycleID, aRevPersonID);
	}

/*------------------------------------------------------------*/

	//Returns the GranteeProjectReviewStage data object for the current GranteeProject 
	//in the review stage indicated by the aReviewCycleStageID, aReviewCycleID and aRevPersonID parameters.
	//This is for the new Review model and uses the following views with the minimum required columns:
	//vApplicantPool: GranteeProjectID, WfTaskAssignmentID
	//vCommitteePool: PersonID, ReviewCycleID, ReviewCommitteeID
	public cDataObject GetGranteeProjectReviewStageDO(int aReviewCycleStageID, int aReviewCycleID, int aRevPersonID) 
	{
		cDataObject aGPRS;
		cDataObjectList aDOList;
		aDOList = DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectReviewStage", 
			"GranteeProjectID", GetPropertyString("GranteeProjectID"), 
			"ReviewCycleStageID", aReviewCycleStageID.ToString());
		if(aDOList.Count >= 1)
			return aDOList[0];
		else
		{
			//finds applicant wfta
			aDOList = DataObjectFactory.GetDataObjectListWithFilter("vApplicantPool", 
				"GranteeProjectID", GetPropertyString("GranteeProjectID"));
			int aAppWftaID = 0;
			if(aDOList.Count >= 1)
				aAppWftaID = aDOList[0].GetPropertyInt("WfTaskAssignmentID");
			//finds review committee
			aDOList = DataObjectFactory.GetDataObjectListWithFilter("vCommitteePool", 
				"PersonID", aRevPersonID.ToString(), "ReviewCycleID", aReviewCycleID.ToString());
			int aReviewCommitteeID = 0;
			if(aDOList.Count >= 1)
				aReviewCommitteeID = aDOList[0].GetPropertyInt("ReviewCommitteeID");

			aGPRS = DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectReviewStage");
			aGPRS["GranteeProjectID"] =  GetPropertyInt("GranteeProjectID");
			aGPRS["ReviewCycleStageID"] = aReviewCycleStageID;
			aGPRS["AppWfTaskAssignmentID"] = aAppWftaID;
			aGPRS["ReviewCommitteeID"] = aReviewCommitteeID;
			aGPRS.SaveData();
			return aGPRS;
		}
	}

/*====================================================*/

	public void ReviewAssignments_SetStatus(int aWfTaskID, int aWfTaskStatusID) {
		cDataObjectList aReviewAssignments;
		
		aReviewAssignments = GetReviewAssignments(aWfTaskID);
		
		foreach (cDataObject aReviewAssignment in aReviewAssignments) {
			aReviewAssignment["WfTaskStatusID"]=aWfTaskStatusID;
			this.DataObjectFactory.SaveDataObject(aReviewAssignment);
		}
	}
	
/*----------------------------------------------------*/

	public cBudget Get_Budget(bool aCreateNew) {
		cXMLDoc aXmlDoc;
		XmlNode aDataObjectNode, aFiltersNode, aArgNode;
		cDataObjectList		aDataObjectList;
        cBudget aBudget;
        
		aXmlDoc = this.DataObjectFactory.CreateDataObjectNode("Budget", out aDataObjectNode, out aFiltersNode);
		aArgNode = aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
												"GranteeProjectID", GetPropertyString("GranteeProjectID")));
        
		aDataObjectList = DataObjectFactory.GetDataObjectList(aDataObjectNode);
		
		if (aDataObjectList != null && aDataObjectList.Count > 0)
			return (cBudget)aDataObjectList[0];
		else {
			//new BudgetItem
			if (!aCreateNew) return null;
			
			aBudget = (cBudget)DataObjectFactory.CreateNewDataObjectFromKey("Budget");
			aBudget["GranteeProjectID"] = GetPropertyString("GranteeProjectID");
			return aBudget;
		}
	}

/*----------------------------------------------------*/

	public static cBudget Get_GranteeProject_Budget(cDataObjectFactory aDataObjectFactory,
								String aProjectID, bool aCreateNew) {
		cGranteeProject		aGranteeProject;
		
		aGranteeProject = (cGranteeProject)aDataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aProjectID);
		if (aGranteeProject == null) return null;
		
		return aGranteeProject.Get_Budget(aCreateNew);
	}
	
	
	/*----------------------------------------------------*/

	public int SaveReviewAssignment(int aWfTaskID, int aReviewerPersonID) 
	{
		return SaveReviewAssignment(aWfTaskID, aReviewerPersonID, 7);
	}
	
	/*----------------------------------------------------*/

	public int SaveReviewAssignment(int aWfTaskID, int aReviewerPersonID, int aRole) 
	{
		cXMLDoc aXMLDoc;
		cDataObject aWFTADataObject; //workflow task assignment
		XmlNode aNewDataObjectNode;
		cDataObject aGPRSDataObject;

        aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aNewDataObjectNode);
		aWFTADataObject = DataObjectFactory.GetNewDataObject(aNewDataObjectNode);
		aWFTADataObject["WfTaskID"] = aWfTaskID;
		aWFTADataObject["PersonID"] = aReviewerPersonID;
		aWFTADataObject["GranteeProjectID"] = GetPropertyInt("GranteeProjectID");
		aWFTADataObject["WfTaskRoleID"] = aRole; //originally 7
		aWFTADataObject["WfTaskStatusID"] = 1;
        DataObjectFactory.SaveDataObject(aWFTADataObject);

        //Create GranteeProjectReviewStage object if it does not already exist.
        cDataObjectList aObjList = this.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask",
			"WfProjectID", GetPropertyString("WfProjectID"), "WfTaskID", aWfTaskID.ToString());
        aGPRSDataObject = GetGranteeProjectReviewStageDO(aObjList[0].GetPropertyInt("WfProjectTaskID", 0));
		//aGPRSDataObject = GetGranteeProjectReviewStageDO(aWFTADataObject.GetPropertyInt("WfTaskID"));
        
		return aWFTADataObject.GetPropertyInt("WfTaskAssignmentID");
	}	

	/*----------------------------------------------------*/

	public int SaveReviewAssignment(int aWfTaskID, int aReviewerPersonID, int aRole, int aReviewStageID, String aApplTaskID) 
	{
		cXMLDoc aXMLDoc;
		cDataObject aWFTADataObject; //workflow task assignment
		XmlNode aNewDataObjectNode;
		cDataObject aGPRSDataObject;

		aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aNewDataObjectNode);
		aWFTADataObject = DataObjectFactory.GetNewDataObject(aNewDataObjectNode);
		aWFTADataObject["WfTaskID"] = aWfTaskID;
		aWFTADataObject["PersonID"] = aReviewerPersonID;
		aWFTADataObject["GranteeProjectID"] = GetPropertyInt("GranteeProjectID");
		aWFTADataObject["WfTaskRoleID"] = aRole; //originally 7
		aWFTADataObject["ReviewStageID"] = aReviewStageID;
		aWFTADataObject["WfTaskStatusID"] = 1;
		if (aApplTaskID != "")
			aWFTADataObject["ReportTaskID"] = aApplTaskID;
		DataObjectFactory.SaveDataObject(aWFTADataObject);

		//Create GranteeProjectReviewStage object if it does not already exist.
		cDataObjectList aObjList = this.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask",
			"WfProjectID", GetPropertyString("WfProjectID"), "WfTaskID", aWfTaskID.ToString());
		aGPRSDataObject = GetGranteeProjectReviewStageDO(aObjList[0].GetPropertyInt("WfProjectTaskID", 0));
		//aGPRSDataObject = GetGranteeProjectReviewStageDO(aWFTADataObject.GetPropertyInt("WfTaskID"));
        
		return aWFTADataObject.GetPropertyInt("WfTaskAssignmentID");
	}	

	/*----------------------------------------------------*/

	public int SaveReviewAssignment(String aWfProjectTaskID, int aReviewerPersonID) 
	{
		cDataObject aWFPTDataObject; //workflow project task

		aWFPTDataObject = DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", Convert.ToInt32(aWfProjectTaskID));
		return SaveReviewAssignment(aWFPTDataObject.GetPropertyInt("WfTaskID"), aReviewerPersonID);
	}
	
/*----------------------------------------------------*/

	public cDataObject SaveReviewAssignmentSubcommittee(int aWfProjectTaskID, int aReviewSubCommitteeMemberID) {
	return null;
	/*
	This method is specific to HHMI. It is not used in the other systems, and it has not been updated to reflect the data
	model that includes WfProjectTask. It will remain uncommented in this version until HHMI is re-integrated with the 
	other Easygrants projects.
	
	Peter Larsen 6/28/2004
		int aReviewerPersonID;
		int aWFTAID;
		cDataObject aWFTARSCDataObject; //workflow task assignment review subcommittee
		
		cDataObject aRSCMDataObject; //Review Subcommittee Member
		aRSCMDataObject = DataObjectFactory.GetDataObjectFromPrimaryKey("ReviewSubCommitteeMember", aReviewSubCommitteeMemberID);
		aReviewerPersonID = aRSCMDataObject.GetPropertyInt("PersonID");
		aWFTAID = SaveReviewAssignment(aWfProjectTaskID, aReviewerPersonID);

        //create and save the WfTaskAssignmentReviewSubCommittee object
		aWFTARSCDataObject = DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignmentReviewSubCommittee");
		aWFTARSCDataObject["WfTaskAssignmentID"] = aWFTAID;
		aWFTARSCDataObject["ReviewSubCommitteeMemberID"] = aReviewSubCommitteeMemberID;
		DataObjectFactory.SaveDataObject(aWFTARSCDataObject);
		
		return aWFTARSCDataObject;
	*/
	}
/*----------------------------------------------------*/

	public void RemoveReviewAssignmentSubcommittee(int aWfProjectTaskID, int aReviewSubCommitteeMemberID) {
	/*
	This method is specific to HHMI. It is not used in the other systems, and it has not been updated to reflect the data
	model that includes WfProjectTask. It will remain uncommented in this version until HHMI is re-integrated with the 
	other Easygrants projects.
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		XmlNode aArgNode;
		cDataObject aAssignmentDO;
		cDataObject aWFTARSCDO; //workflow task assignment review subcommittee

		//Get workflow task assignment review subcommittee object
		aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentReviewSubCommittee", out aDataObjectNode, out aFiltersNode);
		aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskID", aWfProjectTaskID.ToString());
		DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfTaskAssignment", aArgNode);
		aFiltersNode.AppendChild(aArgNode);
		aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "GranteeProjectID", GetPropertyString("GranteeProjectID"));
		DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfTaskAssignment", aArgNode);
		aFiltersNode.AppendChild(aArgNode);
		aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "ReviewSubCommitteeMemberID", aReviewSubCommitteeMemberID.ToString());
		aFiltersNode.AppendChild(aArgNode);
		aWFTARSCDO = DataObjectFactory.GetDataObject(aDataObjectNode);
		
		//Get workflow task assignment object based on WfTaskAssignmentID
		int aAssignmentID = aWFTARSCDO.GetPropertyInt("WfTaskAssignmentID");
		aAssignmentDO = DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aAssignmentID);
		
		//Delete both objects
		DataObjectFactory.DeleteData(aWFTARSCDO);
		DataObjectFactory.DeleteData(aAssignmentDO);
	
		DeleteGPRSIfNecessary(aWfProjectTaskID);
	*/
	}
	
/*----------------------------------------------------*/

	public void RemoveReviewAssignment(int aWfProjectTaskID, int aReviewerPersonID) {
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		cDataObject aWfProjectTaskDO;
		cDataObject aAssignmentDO;
		cDataObjectList aWfTARList;

		//DELETE REVIEW ASSIGNMENT
		
		//Get review assignment object
		aWfProjectTaskDO = DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", aWfProjectTaskID.ToString());
		aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskID", aWfProjectTaskDO.GetPropertyString("WfTaskID")));
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "GranteeProjectID", GetPropertyString("GranteeProjectID")));
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "PersonID", aReviewerPersonID.ToString()));
		aAssignmentDO = DataObjectFactory.GetDataObject(aDataObjectNode);
		
		//Get and delete related WfTaskAssignmentReview objects
		aWfTARList = DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aAssignmentDO.GetPropertyString("WfTaskAssignmentID"));
		DataObjectFactory.DeleteData(aWfTARList);
		
		//Delete review assignment object
		DataObjectFactory.DeleteData(aAssignmentDO);

		DeleteGPRSIfNecessary(aWfProjectTaskID);
	}
/*----------------------------------------------------*/
	///<summary>
	///This method checks to see if any assignments exist for a given grantee project review stage object.
	///If not, the grantee project review stage object is deleted.
	///</summary>
	public void DeleteGPRSIfNecessary(int aWfProjectTaskID) 
	{
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		cDataObjectList aRemainingAssignments;
		cDataObject aWfProjectTaskDO;
		cDataObject aGPRSDataObject;

		aWfProjectTaskDO = DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", aWfProjectTaskID.ToString());
        aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
        aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskID", aWfProjectTaskDO.GetPropertyString("WfTaskID")));
        aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "GranteeProjectID", GetPropertyString("GranteeProjectID")));
        aRemainingAssignments = DataObjectFactory.GetDataObjectList(aDataObjectNode);
        if(aRemainingAssignments.Count == 0) {
            //Delete GranteeProjectReviewStage object
            ///First, get ReviewStageID based on current stage WfTaskID
            int aReviewStageID = cReviewStage.GetReviewStageIDFromWfProjectTaskID(aWfProjectTaskID, DataObjectFactory);
            ///Next, build data object node to retrieve GranteeProjectReviewStage
            aXMLDoc = DataObjectFactory.CreateDataObjectNode("GranteeProjectReviewStage", out aDataObjectNode, out aFiltersNode);
            aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "ReviewStageID", aReviewStageID.ToString()));
            aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "GranteeProjectID", GetPropertyString("GranteeProjectID")));
            aGPRSDataObject = DataObjectFactory.GetDataObject(aDataObjectNode);
            if(aGPRSDataObject != null)
                DataObjectFactory.DeleteData(aGPRSDataObject);
        }
	}

/*====================================================*/

	public void GenerateGrantNumber(){
		cDataObject aGP_EMF = null;
		cDataObject aWfProject;
		cDataObject aWfCompetition;
		cDataObject aWfProgram;
		cDataObject aWfCompetitionEMF;
		
		aGP_EMF = GetRelatedPropertyDataObject("GranteeProjectEMF");
		if(aGP_EMF != null){
			if(aGP_EMF.GetPropertyString("GrantNumber","") == ""){
				aWfProject = GetRelatedPropertyDataObject("WfProject");
				aWfCompetition = aWfProject.GetRelatedPropertyDataObject("WfCompetition");
				aWfProgram = aWfCompetition.GetRelatedPropertyDataObject("WfProgram");
				aWfCompetitionEMF = aWfCompetition.GetRelatedPropertyDataObject("CompetitionEMF");
				aGP_EMF["GrantNumber"] = aWfProgram.GetRelatedPropertyString("ProgramEMF.GrantNumberPart") + "-"
					+ aWfCompetition.GetRelatedPropertyString("CompetitionEMF.GrantNumberPart") + "-"
					+ aWfCompetitionEMF.GetPropertyString("NextAutoNumber") + "-"
					+ aWfProject.GetRelatedPropertyString("WfProjectEMF.GrantNumberPart");

				//TO DO: make it work in transaction mode
				//increase auto number in CompetitionEMF
				aWfCompetitionEMF["NextAutoNumber"] = aWfCompetitionEMF.GetPropertyInt("NextAutoNumber") + 1;
				DataObjectFactory.SaveDataObject(aWfCompetitionEMF);
				//save GrantNumber in GranteeProjectEMF
				DataObjectFactory.SaveDataObject(aGP_EMF);
			}
		}
	}

/*====================================================*/
	/* A SQL version of the above method. All Updates a wraped in a DB transaction.
		Use only this method for DB integrity and consistency. */
	public void GenerateGrantNumberSP(){
		string aSQLStr = "GenerateGrantNumber @GranteeProjectID=" + this.GetPropertyString("GranteeProjectID");
		cDataProviderSQL aDP;
		aDP = (cDataProviderSQL) DataObjectFactory.GetDataProvider("EGDatabase");
		aDP.DBConn.ExecuteCommand(aSQLStr);
	}

/*====================================================*/

	public override void SaveData() {
		if(DataObjectList.UserID > 0)
			SaveData(DataObjectList.UserID);
		else
			SaveData(-1);
	}
	
/*====================================================*/

	public void SaveData(int aUserID) {
	/*If PrimaryPersonID or PrimaryOrganizationID has been changed, write a copy of the data from
	the database to GRANTEE_PROJECT_HISTORY before updating*/

		if(!this.IsNewDataObject) {
			cDataObject aGranteeProject = this.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", GetPropertyInt("GranteeProjectID"));
			
			//Check the properties to see if either one has changed. Using GetPropertyString allows us to check numbers
			//against nulls and vice-versa.
			if(aGranteeProject.GetPropertyString("PrimaryOrganizationID") != this.GetPropertyString("PrimaryOrganizationID") ||
				aGranteeProject.GetPropertyString("PrimaryPersonID") != this.GetPropertyString("PrimaryPersonID")) {
				SaveHistory(aGranteeProject, aUserID);
			}
		}
		base.SaveData();
	}

/*====================================================*/

	protected int SaveHistory(cDataObject aGranteeProject, int aUserID) {
	/*Note: The GranteeProject data object passed into this method is not "this". It 
	is a data object containing the data currently saved in the database. This data
	will be written to the history table before the updates in the current GranteeProject
	object are saved to the database*/
	
		cDataObject aGPHistory;
		aGPHistory = this.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectHistory");
		aGPHistory["GranteeProjectID"] = aGranteeProject["GranteeProjectID"];
		aGPHistory["WfProjectID"] = aGranteeProject["WfProjectID"];
		aGPHistory["WfProjectOutcomeID"] = aGranteeProject["WfProjectOutcomeID"];
		aGPHistory["PrimaryPersonID"] = aGranteeProject["PrimaryPersonID"];
		aGPHistory["PrimaryOrganizationID"] = aGranteeProject["PrimaryOrganizationID"];
		aGPHistory["OtherOrganization"] = aGranteeProject["OtherOrganization"];
		aGPHistory["PrimaryAddressID"] = aGranteeProject["PrimaryAddressID"];
		aGPHistory["GranteeID"] = aGranteeProject["GranteeID"];
		aGPHistory["GrantTitle"] = aGranteeProject["GrantTitle"];
		aGPHistory["ShortTitle"] = aGranteeProject["ShortTitle"];
		aGPHistory["CreateDate"] = System.DateTime.Now;
		aGPHistory["EntityTypeID"] = aGranteeProject.GetRelatedPropertyDataObjectList("Grantee")[0]["EntityTypeID"];
		if(aUserID != -1) //A value of -1 indicates that the User ID is unknown.
			aGPHistory["CreateUser"] = aUserID;
		
		aGPHistory.SaveData();
		return aGPHistory.GetPropertyInt("GranteeProjectHistoryID");
	}

/*====================================================*/

	public void UpdateNomination(int iStatus){
		//iStatus: 3-NotActive, 2-Completed
		cDataObject aNominationDO;
		aNominationDO = this.DataObjectFactory.GetDataObjectListWithFilter("Nomination", "GranteeProjectID", this.GetPropertyString("GranteeProjectID"))[0];
		if(aNominationDO != null){
			aNominationDO["StatusID"] = iStatus;
			DataObjectFactory.SaveDataObject(aNominationDO);
		}
	}

/*====================================================*/

} //cGranteeProject
} //EasyGrants.Workflow

