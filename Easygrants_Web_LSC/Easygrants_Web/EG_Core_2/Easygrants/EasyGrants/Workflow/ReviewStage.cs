using System;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Xml;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;
using EasyGrants.DataAccess;
using Core.Util;


namespace EasyGrants.Workflow {
/*====================================================*/

/// <summary>
/// generates bulk review assignments,deletes assignment, uses ReviewCommitteeMember to determine
/// assignments
/// </summary>
public class cReviewStage:cDataObject{
/*====================================================*/

	private ArrayList	mGranteeProjectPool = new ArrayList();
	private ArrayList	mReviewerPool = new ArrayList();
 
/*====================================================*/

	protected ArrayList GranteeProjectPool {
		get {return mGranteeProjectPool;}
		set {mGranteeProjectPool = value;}
	}

/*----------------------------------------------------*/

	protected ArrayList ReviewerPool {
		get {return mReviewerPool;}
		set {mReviewerPool = value;}
	}

/*----------------------------------------------------*/

	public cDataObjectList GranteeProjectList {
		get {
			cXMLDoc aXmlDoc;
			XmlNode aFiltersNode;
			XmlNode aDataObjectNode;
			cDataObjectList aCriteriaList;
			cDataObjectList aWFTAList;
			cDataObjectList aGranteeProjectList;
			cDataObject aGranteeProject;
			XmlNode aSortNode;
			XmlNode aArgNode;
			
			aGranteeProjectList = new cDataObjectList(this.DataObjectFactory);
			
			//get Grantee Project Criteria list	
			aXmlDoc = this.DataObjectList.DataObjectFactory.CreateDataObjectNode("ReviewStageGranteeProjectCriteria", out aDataObjectNode, out aFiltersNode);
			aFiltersNode.AppendChild(this.DataObjectList.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewStageID", this.GetPropertyString("ReviewStageID"))); 
			aCriteriaList = this.DataObjectList.DataObjectFactory.GetDataObjectList(aDataObjectNode);
			
			//iterate through the Criteria and add data objects that meet the criteria to the GranteeProjectList
			foreach(cDataObject aCriteria in aCriteriaList) {
				aXmlDoc = this.DataObjectList.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
				//aFiltersNode.AppendChild(this.DataObjectList.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskRoleID", "1")); //applicant
				aFiltersNode.AppendChild(this.DataObjectList.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskStatusID", "2")); //completed

				//Because of the unusual definition of the WfTaskAssignment.WfProjectTask property, we cannot filter directly on WfProjectTaskID. Instead, 
				//we retrieve the WfProjectTask object related to the review stage and filter separately on WfTaskID and WfProjectID. Peter Larsen 7/22/2004
				cDataObject aObj = this.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", aCriteria.GetPropertyString("WfProjectTaskID"));
				aFiltersNode.AppendChild(this.DataObjectList.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aObj.GetPropertyString("WfTaskID")));
				aArgNode = aFiltersNode.AppendChild(this.DataObjectList.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectID", aObj.GetPropertyString("WfProjectID")));
				this.DataObjectList.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "GranteeProject", aArgNode);
				aFiltersNode.AppendChild(this.DataObjectList.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskOutcomeID", aCriteria.GetPropertyString("WfTaskOutcomeID")));
				
				//sort the list
				aSortNode = aXmlDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Sort", "");
				aDataObjectNode.AppendChild(aSortNode);
				aArgNode = this.DataObjectList.DataObjectFactory.CreateArgumentNode(aXmlDoc, "", "LastName", "");
				aSortNode.AppendChild (this.DataObjectList.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "Person", aArgNode));

				aWFTAList = this.DataObjectList.DataObjectFactory.GetDataObjectList(aDataObjectNode);
				 //iterate through the list of WfTaskAssignment and add GranteeProjectDO to existing aGranteeProjectList
				foreach(cDataObject aWFTA in aWFTAList){
					//add GranteeProject if not already in the list
					aGranteeProject = aWFTA.GetRelatedPropertyDataObject("GranteeProject");
					
					if(!(aGranteeProjectList.DataObjectList.Contains(aGranteeProject))){
						aGranteeProjectList.Add(aGranteeProject);
					}	
				}
			
			}
			
			return aGranteeProjectList;
		}
	}
	
/*----------------------------------------------------*/

	public cReviewStage(DataRow aDataObjectRow, cDataObjectList aDataObjectList):
				base(aDataObjectRow, aDataObjectList) {
		
	} 
	
/*====================================================*/
	
	public void GenerateAssignments(bool aDelete){
		int aNumReviewers;
		//Default for reviewers per applicant is -1 (assign all to all)
		aNumReviewers = GetPropertyInt("NumReviewersPerApplicant", -1);
		GenerateAssignments(aNumReviewers, aDelete);
	}
	
/*----------------------------------------------------*/

	public void GenerateAssignments(int aReviewerPerApplicant, bool aDelete){
		cXMLDoc aXmlDoc;
		XmlNode aFiltersNode;
		XmlNode aDataObjectNode;
		cDataObjectList aGranteeProjList;
		cDataObjectList aReviewerList;
		cReviewCommitteeMember aReviewer;
		int aIndex;
		
		int aCount = 0;
		//int aCount2 = 0;
		//Delete existing assignments if necessary
		if(aDelete) 
			DeleteAssignments();
		
		//get applicant pool 
		aGranteeProjList = GranteeProjectList;

		//get reviewers
		aXmlDoc = this.DataObjectList.DataObjectFactory.CreateDataObjectNode("ReviewCommitteeMember", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(this.DataObjectList.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCommitteeID", this.GetPropertyString("ReviewCommitteeID"))); 
		aReviewerList = this.DataObjectList.DataObjectFactory.GetDataObjectList(aDataObjectNode);

		Debug.WriteLine("Beginning Review Assignments  - " + this.GetRelatedPropertyString("WfProjectTask.WfTask")
				+ " " + System.DateTime.Now);


		if(aReviewerPerApplicant == -1) {
			GenerateAssignments_AllToAll(aReviewerList, aGranteeProjList);
			/*Debug.WriteLine("Review Assignments Completed - " + this.GetRelatedPropertyString("WfTask.WfTask")
					+ " " + System.DateTime.Now);*/
			return;
		}

		//make copies of reviewer and applicant lists for use in making assignments
		GranteeProjectPool = (ArrayList)aGranteeProjList.DataObjectList.Clone();
		ReviewerPool = (ArrayList)aReviewerList.DataObjectList.Clone();
		
		int n = 1;
		while (n > 0) { //for each review assignment type (i.e., Primary, etc.)			
			//randomize applicant pool
			GranteeProjectPool = (ArrayList)cLib.RandomizeCollection(GranteeProjectPool);
			
			//identify ReviewCommitteeMembers for each granteepoject
			foreach(cGranteeProject aGranteeProject in GranteeProjectPool){
			
				aIndex = 0;
				
				for(int i=0; i <= ReviewerPool.Count; i++){
					//check current reviewer count for Grantee
					aCount = aGranteeProject.ReviewerCount;
					if (aCount == aReviewerPerApplicant){
						aGranteeProject.SaveReviewAssignments(this.GetPropertyInt("WfProjectTaskID"));
						break;//move to next grantee
					}	
					
					if(i == ReviewerPool.Count && aReviewerPerApplicant == -1)
						break;
				
					aReviewer = GetValidReviewer(aGranteeProject);
					
					if (aReviewer == null){ //no valid reviewers were found for the applicant
						break;
					}
					
					//remove reviewer from pool
					ReviewerPool.Remove(aReviewer);
					
					//add reviewer to grantee
					aGranteeProject.AddReviewer(aReviewer);	
/*			aCount2 += 1;
			Debug.WriteLine("Assignment made - Reviewer " + aReviewer.GetPropertyString("PersonID") +
					", Applicant " + aGranteeProject.GetPropertyString("PrimaryPersonID") + " " + System.DateTime.Now + " " +
					aCount2.ToString());*/
					//increment grantee count for reviewer
					aReviewer.AssignedGranteeCount = aReviewer.AssignedGranteeCount + 1;
					
					//re-insert reivewer in new, proper order
					aIndex = ReviewerPool.BinarySearch (aReviewer);
					if (aIndex < 0) { 
						aIndex=~aIndex;
					}	
					ReviewerPool.Insert(aIndex,aReviewer);
									
				}//Reviewer loop
				
				 //assign all reviewers to all applicants
				if (aReviewerPerApplicant==-1 && aGranteeProject.ReviewerCount > 0){
					aGranteeProject.SaveReviewAssignments(this.GetPropertyInt("WfProjectTaskID"));
				}
			}//Grantee loop
			n=n-1;
		} //get next assignment type, and parameters for it like #/applicant

	Debug.WriteLine("Review Assignments Completed - " + this.GetRelatedPropertyString("WfProjectTask.WfTask")
			+ " " + System.DateTime.Now);

	}

/*----------------------------------------------------*/
	public void GenerateAssignments_AllToAll(cDataObjectList aReviewerList, cDataObjectList aGranteeProjList) {
		cDataObject aWFTA;
		int aAssignmentOrdinal;

		foreach(cGranteeProject aGranteeProject in aGranteeProjList){
			aAssignmentOrdinal = 0;
			foreach(cReviewCommitteeMember aReviewer in aReviewerList) {
				aWFTA = DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignment");
				aWFTA["WfTaskID"] = this.GetRelatedPropertyInt("WfProjectTask.WfTaskID");
				aWFTA["PersonID"] = aReviewer["PersonID"];
				aWFTA["WfTaskRoleID"] = 7;
				aWFTA["GranteeProjectID"] = aGranteeProject["GranteeProjectID"];
				aWFTA["WfTaskStatusID"] = 1; //incomplete
				aWFTA["AssignmentOrdinal"] = aAssignmentOrdinal; //used to identify primary, secondary reviewer
				aWFTA.SaveData();
				aAssignmentOrdinal += 1;
			}
		}
		//Create GranteeProjectReviewStage data objects for this stage
		foreach(cGranteeProject aGranteeProject in aGranteeProjList){
			aGranteeProject.GetGranteeProjectReviewStageDO(this.GetPropertyInt("WfProjectTaskID"));
		}
	}
/*----------------------------------------------------*/
	/// <summary>
	/// removes workflow task assignments and deletes GranteeProjectReviewStage objects
	/// </summary>
	public void DeleteAssignments() {
		cDataObject aWfProjectTask;
		cXMLDoc aXmlDoc;
		XmlNode aFiltersNode;
		XmlNode aArgNode;
		XmlNode aDataObjectNode;
		String aProjectID;
		String aTaskID;
		cDataObjectList aWFTARList;

		aWfProjectTask = DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", GetPropertyInt("WfProjectTaskID"));
		aTaskID = aWfProjectTask.GetPropertyString("WfTaskID");
		aProjectID = aWfProjectTask.GetPropertyString("WfProjectID");

		//Get all workflow task assignments for this project task
		aXmlDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aTaskID.ToString())); 
		aArgNode = aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectID", aProjectID.ToString())); 
		aArgNode.AppendChild(DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "GranteeProject"));
		cDataObjectList aWFTAList = DataObjectFactory.GetDataObjectList(aDataObjectNode);
		
		//Delete all related WfTaskAssignmentReview objects
		foreach(cDataObject aWFTADO in aWFTAList) {
			aWFTARList = DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aWFTADO.GetPropertyString("WfTaskAssignmentID"));
			DataObjectFactory.DeleteData(aWFTARList);
		}
		
		//Delete WfTaskAssignment objects
		DataObjectFactory.DeleteData(aWFTAList);
		
		//Get and delete all GranteeProjectReviewStage objects for this stage
		aXmlDoc = DataObjectFactory.CreateDataObjectNode("GranteeProjectReviewStage", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewStageID", GetPropertyString("ReviewStageID"))); 
		cDataObjectList aGPRSList = DataObjectFactory.GetDataObjectList(aDataObjectNode);
		DataObjectFactory.DeleteData(aGPRSList);
	}
/*----------------------------------------------------*/

	protected cReviewCommitteeMember GetValidReviewer(cGranteeProject aGrantee) {
	
		cReviewCommitteeMember aReviewer;
		int aIndex = 0;
		
		while (aIndex < ReviewerPool.Count) {
			aReviewer=(cReviewCommitteeMember)ReviewerPool[aIndex];
			if(aGrantee.IsAssigned(aReviewer) || aGrantee.HasConflictWith(aReviewer) || !aGrantee.IsRequestedBy(aReviewer))
				aIndex += 1;
			else
				return aReviewer;
		}
			
		//If no reviewer has been returned, go through the list again, but without checking for requests this time.
		aIndex = 0;
		while (aIndex < ReviewerPool.Count) {
			aReviewer=(cReviewCommitteeMember)ReviewerPool[aIndex];
			if(aGrantee.IsAssigned(aReviewer) || aGrantee.HasConflictWith(aReviewer))
				aIndex += 1;
			else {
				return aReviewer;
			}
		}
		
		return (cReviewCommitteeMember)null;
	}

/*====================================================*/

	public void ReviewStage_SetStatus(int aWfTaskStatusID) {
	
		foreach(cGranteeProject aGranteeProject in GranteeProjectList) {
			aGranteeProject.ReviewAssignments_SetStatus(this.GetPropertyInt("WfProjectTaskID"),aWfTaskStatusID);
		}
	}

/*----------------------------------------------------*/

	public void GenerateAutomaticRequestsConflicts(XmlNodeList aRCTypeNodeList) {
	//In this method, the string "RC" within a variable name refers to "Request/Conflict" (e.g., aRCTypeNodeList)
		int aWfTaskID = GetRelatedPropertyDataObject("WfProjectTask").GetPropertyInt("WfTaskID");
		
		//Delete all existing requests and/or conflicts for this stage
		XmlNode aRCDONode;
		XmlNode aFiltersNode;
		XmlNode aArgumentNode;
		XmlNode aRelatedPropertyNode;

		cXMLDoc aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentRequestConflict", out aRCDONode, out aFiltersNode);
		aArgumentNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskID", aWfTaskID.ToString());
		aRelatedPropertyNode = DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfTaskAssignment", aArgumentNode);
		aFiltersNode.AppendChild(aArgumentNode);
		aArgumentNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "Automatic", "True");
		aFiltersNode.AppendChild(aArgumentNode);
		cDataObjectList aRCDOList = DataObjectFactory.GetDataObjectList(aRCDONode);
		DataObjectFactory.DeleteData(aRCDOList);
		
		//Get DOList of all review assignment WFTAs for request/conflict stage
		XmlNode aWFTADONode;
		
		aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aWFTADONode, out aFiltersNode);
		aArgumentNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskID", aWfTaskID.ToString());
		aFiltersNode.AppendChild(aArgumentNode);
		cDataObjectList aWFTADOList = DataObjectFactory.GetDataObjectList(aWFTADONode);

		int aIndex;
		String aRevFullKey;
		String aRevRelatedKey;
		String aRevPropertyKey;
		cDataObjectList aRevDOList;
		String aAppFullKey;
		String aAppRelatedKey;
		String aAppPropertyKey;
		cDataObjectList aAppDOList;
		XmlNode aReviewerNode;
		XmlNodeList aRevFiltersNodeList;
		XmlNode aApplicantNode;
		XmlNodeList aAppFiltersNodeList;
		int aRCID = 0;
		int i;
		
		//foreach(cDataObject aWFTADO in aWFTADOList) {
		for(i=0; i < aWFTADOList.Count; i++) {
			cDataObject aWFTADO = aWFTADOList[i];
	Debug.WriteLine("Checking " + i.ToString() + " of " + aWFTADOList.Count.ToString());
			bool aRC = false;
			foreach(XmlNode aRCTypeNode in aRCTypeNodeList) {
				//Get reviewer property data object list
				aReviewerNode = aRCTypeNode.SelectSingleNode("Reviewer");
				aRevFiltersNodeList = aReviewerNode.SelectNodes("Filters/Argument");
				aRevFullKey = cXMLDoc.AttributeToString(aReviewerNode, "PropertyKey");
				aIndex = aRevFullKey.LastIndexOf(".");
				if(aIndex == -1) {
					aRevDOList = this.DataObjectList;
					aRevPropertyKey = aRevFullKey;
				}
				else {
					aRevRelatedKey = aRevFullKey.Substring(0, aIndex);
					aRevDOList = aWFTADO.GetRelatedPropertyDataObjectList(aRevRelatedKey);
					aRevPropertyKey = aRevFullKey.Substring(aIndex + 1);
				}

				//Get applicant property data object list
				aApplicantNode = aRCTypeNode.SelectSingleNode("Applicant");
				aAppFiltersNodeList = aApplicantNode.SelectNodes("Filters/Argument");
				aAppFullKey = cXMLDoc.AttributeToString(aApplicantNode, "PropertyKey");
				aIndex = aAppFullKey.LastIndexOf(".");
				if(aIndex == -1) {
					aAppDOList = this.DataObjectList;
					aAppPropertyKey = aAppFullKey;
				}
				else {
					aAppRelatedKey = aAppFullKey.Substring(0, aIndex);
					aAppDOList = aWFTADO.GetRelatedPropertyDataObjectList(aAppRelatedKey);
					aAppPropertyKey = aAppFullKey.Substring(aIndex + 1);
				}
				
				//Loop through both lists; return true if any values are equal
				foreach(cDataObject aRevDO in aRevDOList) {
					if(aRevDO.MeetsFilterCriteria(aRevFiltersNodeList)) {
						foreach(cDataObject aAppDO in aAppDOList) {
							if(aAppDO.MeetsFilterCriteria(aAppFiltersNodeList)) {
								if(aRevDO.GetPropertyString(aRevPropertyKey) == aAppDO.GetPropertyString(aAppPropertyKey)) {
									aRC = true;
									aRCID = Convert.ToInt32(cXMLDoc.AttributeToString(aRCTypeNode, "ID"));
									break;
								}
							}
						}//foreach(cDataObject aAppDO in aAppDOList)
					} 
					if(aRC)
						break;
				}//foreach(cDataObject aRevDO in aRevDOList)
				if(aRC)
					break;
			}//foreach(XmlNode aRCTypeNode in aRCTypeNodeList)
			if(aRC) {
				//Get request/conflict definition to find out whether this is a request or a conflict
				cDataObject aRCDefDO = DataObjectFactory.GetDataObjectFromPrimaryKey("Conflict", aRCID.ToString());
				int aRequestConflictID = aRCDefDO.GetPropertyInt("RequestConflictID");
				//Write request/conflict row
				cDataObject aRCDO;
				aRCDO = DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignmentRequestConflict");
				aRCDO["ConflictID"] = aRCID;
				aRCDO["WfTaskAssignmentID"] = aWFTADO.GetPropertyInt("WfTaskAssignmentID");
				aRCDO["RequestConflictID"] = aRequestConflictID;
				aRCDO["Automatic"] = true;
				DataObjectFactory.SaveDataObject(aRCDO);
			}
		}//foreach(cDataObject aWFTADO in aWFTADOList)
			
	}
/*----------------------------------------------------*/
	
	public static int GetReviewStageIDFromWfProjectTaskID(int aWfProjectTaskID, cDataObjectFactory aDataObjectFactory) {
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		XmlNode aArgNode;
		cDataObject aDataObject;
		
		aXMLDoc = aDataObjectFactory.CreateDataObjectNode("ReviewStage", out aDataObjectNode, out aFiltersNode);
		cDataObjectList aObjList = aDataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectTaskID", aWfProjectTaskID.ToString());
		aArgNode = aDataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfProjectTaskID", aObjList[0].GetPropertyString("WfProjectTaskID"));
		aFiltersNode.AppendChild(aArgNode);
		
		aDataObject = aDataObjectFactory.GetDataObject(aDataObjectNode);
		return aDataObject.GetPropertyInt("ReviewStageID");
	}
	
/*----------------------------------------------------*/

	public void PopulateGPRS() {
		foreach(cGranteeProject aGranteeProject in GranteeProjectList)
			aGranteeProject.GetGranteeProjectReviewStageDO(GetPropertyInt("WfProjectTaskID"));
	}
	
/*----------------------------------------------------*/

	public void CalculateAverageScores() {
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		XmlNode aArgNode;
		cDataObjectList aReviewWFTAList;
		
		cDataObject aWfProjectTask = GetRelatedPropertyDataObject("WfProjectTask");
		foreach(cGranteeProject aGPDO in GranteeProjectList){
			//Get all review WfTaskAssignment objects for this grantee project and review stage.
			aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
			aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfTaskID", aWfProjectTask.GetPropertyString("WfTaskID"));
			aFiltersNode.AppendChild(aArgNode);
			aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "GranteeProjectID", aGPDO.GetPropertyString("GranteeProjectID"));
			aFiltersNode.AppendChild(aArgNode);
			aReviewWFTAList = DataObjectFactory.GetDataObjectList(aDataObjectNode);
			
			//Loop through list, getting sum and count of ReviewRating property.
			int aCount = 0;
			double aTotalRating = 0;
			foreach(cDataObject aReviewWFTADO in aReviewWFTAList) {
				if(aReviewWFTADO["ReviewRating"] != System.DBNull.Value) {
					aCount += 1;
					aTotalRating += aReviewWFTADO.GetPropertyDouble("ReviewRating");
				}
			}

			//Calculate mean and save to GranteeProjectReviewStage data object.
			if (aCount >0) {
				cDataObject aGPRSDO = aGPDO.GetGranteeProjectReviewStageDO(aWfProjectTask.GetPropertyInt("WfProjectTaskID"));
				aGPRSDO["AverageRating"] = aTotalRating/aCount;
				aGPRSDO.SaveData();
			}
		}
	}
	
/*----------------------------------------------------*/

	public void CalculateAverageScores_WFTAReview() {
/*	This method, formerly called CalculateAverageScores(), is based on the older model of collecting a "primary"
	rating for each review assignment, which was stored in a WfTaskAssignmentReview data object with a RatingTypeID
	of 4. The new CalculateAverageScores() method reflects the new model of collecting multiple scores per review assignment
	and calculating a weighted average, which is stored in the WfTaskAssignment.ReviewRating property.
	Peter Larsen 7/6/2004
*/	
	
		//cDataObjectList aGPRSDOList;
		cDataObjectList aReviewRatingsList;
		int aWfProjectTaskID;
		int aGranteeProjectID;
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		XmlNode aArgNode;
		XmlNode aRPNode;
		cDataObject aGranteeProjectReviewStage;
		
		aWfProjectTaskID = GetPropertyInt("WfProjectTaskID");
		//aGPRSDOList = GetRelatedPropertyDataObjectList("GranteeProjectReviewStages");
		//foreach(cDataObject aGPRSDO in aGPRSDOList) {
		foreach(cGranteeProject aGPRSDO in GranteeProjectList){
			aGranteeProjectID = aGPRSDO.GetPropertyInt("GranteeProjectID");
			aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentReview", out aDataObjectNode, out aFiltersNode);

			aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfTaskID", aWfProjectTaskID.ToString());
			aRPNode = DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfTaskAssignment", aArgNode);
			aFiltersNode.AppendChild(aRPNode);

			aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "GranteeProjectID", aGranteeProjectID.ToString());
			aRPNode = DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfTaskAssignment", aArgNode);
			aFiltersNode.AppendChild(aRPNode);

			aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "RatingTypeID", "4");
			aFiltersNode.AppendChild(aArgNode);

			aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "Rating", "not null");
			aFiltersNode.AppendChild(aArgNode);

			aReviewRatingsList = DataObjectFactory.GetDataObjectList(aDataObjectNode);

			int aCount = 0;
			double aTotalRating = 0;
			foreach(cDataObject aReviewRatingDO in aReviewRatingsList) {
				aCount += 1;
				aTotalRating += aReviewRatingDO.GetPropertyDouble("Rating");
			}
			if (aCount >0) {
				//aGPRSDO["AverageRating"] = aTotalRating/aCount;
				//DataObjectFactory.SaveDataObject(aGPRSDO);
				aGranteeProjectReviewStage = aGPRSDO.GetGranteeProjectReviewStageDO(aWfProjectTaskID);
				aGranteeProjectReviewStage["AverageRating"] = aTotalRating/aCount;
				DataObjectFactory.SaveDataObject(aGranteeProjectReviewStage);
			}
		}
		//DataObjectFactory.SaveDataObject(aGPRSDOList);
	}	
	
/*----------------------------------------------------*/

	public void FinalizeOutcomes() {
		cDataObjectList aGPRSDOList; //grantee project review stage
		cDataObject aWFTADO; //workflow task assignment
	
		aGPRSDOList = GetRelatedPropertyDataObjectList("GranteeProjectReviewStages");
		foreach(cDataObject aGPRSDO in aGPRSDOList) {
			if(aGPRSDO["ProposedOutcomeID"] != System.DBNull.Value) 
			{
				aWFTADO = DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aGPRSDO.GetPropertyInt("AppWfTaskAssignmentID"));
				aWFTADO["WfTaskOutcomeID"] = aGPRSDO.GetPropertyInt("ProposedOutcomeID");
				DataObjectFactory.SaveDataObject(aWFTADO);
			}
		}
	}

/*----------------------------------------------------*/

	public void FinalizeSelectedTaskOutcomes(int aWfTaskAssignmentID, int aProposedOutcomeID) {
		cDataObject aWFTADO; //workflow task assignment
		aWFTADO = DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID);
//		aWFTADO["WfTaskOutcomeID"] = aProposedOutcomeID;
//		DataObjectFactory.SaveDataObject(aWFTADO);

		int aGPID = aWFTADO.GetPropertyInt("GranteeProjectID",0);
		int aWfTaskID = aWFTADO.GetPropertyInt("WfTaskID",0);
		if (aGPID > 0 && aWfTaskID > 0){
			cGranteeProjectOutcomes.Create_Outcome(DataObjectFactory, aGPID, aWfTaskID, aProposedOutcomeID, false, true, false);
		}
	}

/*----------------------------------------------------*/

	public void FinalizeSelectedProjectOutcomes(int aGranteeProjectID, int aProposedOutcomeID) {
		cDataObject aGPDO; //workflow task assignment
	
		aGPDO = DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aGranteeProjectID);
		aGPDO["WfProjectOutcomeID"] = aProposedOutcomeID;
		DataObjectFactory.SaveDataObject(aGPDO);
	}

/*====================================================*/
} //cReviewStage
} //EasyGrants.Workflow
