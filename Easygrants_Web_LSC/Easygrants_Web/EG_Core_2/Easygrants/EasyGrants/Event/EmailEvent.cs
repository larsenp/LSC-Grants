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
///email event object -launches new correspondence job
///</summary>
public class cEmailEvent:cEvent
{
/*====================================================*/

	/*
	public cEmailEvent(DataRow aDataObjectRow, cDataObjectList aDataObjectList):
			base(aDataObjectRow, aDataObjectList) {

	}
	*/
	
	public cEmailEvent(cEventData aEventData):
		base(aEventData){
	}

/*====================================================*/

	public override void RaiseEvent(cDataObjectList aDataObjectList, int aUserID){
	
		cCorrespondenceJob aCorrespondenceJob = new cCorrespondenceJob(aUserID);
		
		aCorrespondenceJob.EmailArgs = new cEmailArgsDataObject(aDataObjectList);
		
		//aCorrespondenceJob.CorrespondenceDefinition  = this.GetRelatedPropertyDataObject("EventCorrespondence.CorrespondenceDefinition");
		aCorrespondenceJob.CorrespondenceDefinition  = this.mEventData.GetRelatedPropertyDataObject("EventCorrespondence.CorrespondenceDefinition");
		
		aCorrespondenceJob.SendEmail(this.DataObjectFactory.Appl);
	}

/*====================================================*/

	public override void RaiseSingleEvent(cDataObjectList aDataObjectList, int aUserID) {
		RaiseSingleEvent(aDataObjectList, aUserID, "");
	}

/*====================================================*/
	
	public override void RaiseSingleEvent(cDataObjectList aDataObjectList, int aUserID, string aRcptPersonIDPropertyKey) {

		cCorrespondenceJob aCorrespondenceJob = new cCorrespondenceJob(aUserID);

		aCorrespondenceJob.EmailArgs = new cEmailArgsDataObject(aDataObjectList[0]);
		if (aRcptPersonIDPropertyKey != "") {
			aCorrespondenceJob.EmailArgs.RcptPersonIDPropertyKey = aRcptPersonIDPropertyKey;
		}
		//aCorrespondenceJob.CorrespondenceDefinition  = this.GetRelatedPropertyDataObject("EventCorrespondence.CorrespondenceDefinition");
		aCorrespondenceJob.CorrespondenceDefinition = this.mEventData.GetRelatedPropertyDataObject("EventCorrespondence.CorrespondenceDefinition");

		aCorrespondenceJob.SendEmail(this.DataObjectFactory.Appl);
	}

	/*====================================================*/

}//cEmailEvent
}// EasyGrants.Event