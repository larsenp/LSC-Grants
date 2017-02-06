using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Xml;
using Core.Util;
using Core.DataAccess.XMLAccess;
using Core.DataAccess;
using System.Web.Mail;
using System.Text;


namespace Core.Event {
/*====================================================*/

///<summary>
///Base event object
///</summary>
public class cEvent
{
/*====================================================*/

	protected	cEventData		mEventData;

/*-----------------------------------------------------*/

	public cEventData EventData {
		get {return mEventData;}
	}

/*-----------------------------------------------------*/

	public cDataObjectFactory DataObjectFactory {
		get {return mEventData.DataObjectFactory;}
	}

/*-----------------------------------------------------*/

	public cEvent(cEventData aEventData){
		mEventData = aEventData;
	}

/*====================================================*/

	protected static XmlNode  Get_EventClassNode(cEventData aEventData) {
		cXMLDoc		aClassNodeDoc;
		
		aClassNodeDoc = new cXMLDoc();
		//check for ClassNodeXml null, and if it is, return a class node for the cEmailEvent
		if (aEventData.GetPropertyString("ClassNodeXml", "") == "")
		{
			aClassNodeDoc.LoadFromXML("<EventElement><Class Name='cEmailEvent' Assembly='EasyGrants' FullName='EasyGrants.Event.cEmailEvent'/></EventElement>");
			return aClassNodeDoc.DocElement.SelectSingleNode("Class");
		}
		if (!aClassNodeDoc.LoadFromXML(aEventData.GetPropertyString("ClassNodeXml")))
			return null;
		return aClassNodeDoc.DocElement.SelectSingleNode("Class");
	}

/*-----------------------------------------------------*/

	public static cEvent New_Event(int aEventID, cDataObjectFactory aDataObjectFactory) {
		cEventData	aEventData;
		XmlNode		aClassNode;
		cEvent		aEvent;

		aEventData = (cEventData)aDataObjectFactory.GetDataObjectFromPrimaryKey("Event", aEventID);
		aClassNode = Get_EventClassNode(aEventData);

		Object[]	aArgs = new Object[1];
		aArgs[0] = aEventData;
		aEvent = (cEvent)cReflection.InstantiateObjectFromXMLClassNode(aClassNode, aArgs);

		return aEvent;
	}

/*====================================================*/

	public virtual void RaiseEvent() {
		
	}

/*-----------------------------------------------------*/
	
	public virtual void RaiseEvent(cDataObjectList aDataObjectList, int aUserID) {
		
	}

/*-----------------------------------------------------*/

	public virtual void RaiseSingleEvent(cDataObjectList aDataObjectList, int aUserID) {

	}

/*-----------------------------------------------------*/

	public virtual void RaiseSingleEvent(cDataObjectList aDataObjectList, int aUserID, string aRcptPersonIDPropertyKey) {

	}

/*====================================================*/
}//cEvent
}// Core.Event