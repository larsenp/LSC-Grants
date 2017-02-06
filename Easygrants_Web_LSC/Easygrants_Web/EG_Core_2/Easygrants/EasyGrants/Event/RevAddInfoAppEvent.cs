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
///handles event when applicant requests additional info
///launches correspondence job
///</summary>
public class cRevAddInfoAppEvent:cEvent
{
/*====================================================*/

	public cRevAddInfoAppEvent(cEventData aEventData):
		base(aEventData){
	}

/*====================================================*/

	public override void RaiseEvent(cDataObjectList aDataObjectList, int aUserID){
		cCorrespondenceJob aCorrespondenceJob = new cCorrespondenceJob(aUserID);
		aCorrespondenceJob.EmailArgs = new cEmailArgsDataObject(aDataObjectList);
		aCorrespondenceJob.CorrespondenceDefinition  = this.mEventData.GetRelatedPropertyDataObject("EventCorrespondence.CorrespondenceDefinition");
		aCorrespondenceJob.SendEmail(this.DataObjectFactory.Appl);
		
		cDataObject aRevAddInfoDO = aDataObjectList[0];
		aRevAddInfoDO["ResponseDate"] = System.DateTime.Now.ToShortDateString();
		this.DataObjectFactory.SaveDataObject(aRevAddInfoDO);
	}

/*====================================================*/

}//cRevAddInfoAppEvent
}// EasyGrants.Event