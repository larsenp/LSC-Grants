using System;
using System.Data;
using System.Collections;
using System.Xml;
using Core.DataAccess.XMLAccess;
using Core.DataAccess;
using System.Web.Mail;
using System.Text;
using EasyGrants.Correspondence;
using Core.Event;


namespace EasyGrants.Event {
/*====================================================*/

///<summary>
///handles event when reviewer requests additional info
///launches correspondence job
///</summary>
public class cRevAddInfoRevEvent:cEvent
{
/*====================================================*/

	public cRevAddInfoRevEvent(cEventData aEventData):
		base(aEventData){
	}

/*====================================================*/

	public override void RaiseEvent(cDataObjectList aDataObjectList, int aUserID){
		cCorrespondenceJob aCorrespondenceJob = new cCorrespondenceJob(aUserID);
		aCorrespondenceJob.EmailArgs = new cEmailArgsDataObject(aDataObjectList);
		aCorrespondenceJob.CorrespondenceDefinition  = this.mEventData.GetRelatedPropertyDataObject("EventCorrespondence.CorrespondenceDefinition");
		aCorrespondenceJob.SendEmail(this.DataObjectFactory.Appl);
		
		cDataObject aRevAddInfoDO = aDataObjectList[0];
		aRevAddInfoDO["RequestDate"] = System.DateTime.Now.ToShortDateString();
		aRevAddInfoDO["ResponseDate"] = System.DBNull.Value;
		aRevAddInfoDO["ResponseComment"] = System.DBNull.Value;
		this.DataObjectFactory.SaveDataObject(aRevAddInfoDO);

		cDataObject aWfDO = DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aRevAddInfoDO.GetPropertyString("AppWfTaskAssignmentID"));
		aWfDO["WfTaskStatusID"] = 1; //Incomplete
		this.DataObjectFactory.SaveDataObject(aWfDO);
	}

/*====================================================*/

}//cRevAddInfoRevEvent
}// EasyGrants.Event