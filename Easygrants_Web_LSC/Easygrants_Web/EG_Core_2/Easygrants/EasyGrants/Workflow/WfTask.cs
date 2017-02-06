using System;
using System.Data;
using Core.DataAccess;

namespace EasyGrants.Workflow {
/*====================================================*/

/// <summary>
/// overrides save data method when a new workflow task is saved that
/// represents a new review stage object
/// </summary>
public class cWfTask:cDataObject	{
/*====================================================*/

	public cWfTask(DataRow aDataObjectRow, cDataObjectList aDataObjectList):
				base(aDataObjectRow, aDataObjectList) {
		
	} 
/*====================================================*/

	public override void SaveData() {
		bool aNewObj;
		int aTaskTypeID;
		
		aNewObj = this.IsNewDataObject;
		base.SaveData();
		
		//If this is a new review stage, create the corresponding row in the
		//REVIEW_STAGE table
		aTaskTypeID = GetPropertyInt("WfTaskTypeID");
		if(aNewObj && (aTaskTypeID == 2 || aTaskTypeID == 3)) {
			cDataObject aReviewStage = DataObjectFactory.CreateNewDataObjectFromKey("ReviewStage");
			aReviewStage["WfTaskID"] = GetPropertyInt("WfTaskID");
			aReviewStage["IsInterviewStage"] = false;
			aReviewStage.SaveData();
		}
	}
	
/*====================================================*/
} //public classcWfTask
} //namespace EasyGrants.Workflow
