using System;
using System.Data;
using System.Xml;
using Core.Util;
using Core.DataAccess.XMLAccess;
using Core.DataAccess;


namespace Core.Event {
/*====================================================*/

///<summary>
///Base event object
///</summary>
public class cProcessingEvent : cDataObject
{

	private Boolean mSuccess = false;
	private string mMessage = "";
	private int mStatusID = 0;
	private string mDefinitionKey = "";
	private cDataObjectFactory mDataObjectFactory;

	//private cDataObject mProcessingEventData;	
	
	public Boolean Success
	{
		get { return mSuccess; }
		set { mSuccess = value; }
	}

	public string Message
	{
		get { return mMessage; }
		set { mMessage = value; }
	}
	
	public int StatusID
	{
		get { return mStatusID; }
		set { mStatusID = value; }
	}
	
	public new string DefinitionKey {
		get { return mDefinitionKey; }
		set { mDefinitionKey = value; }
	}

	public new cDataObjectFactory DataObjectFactory {
		get { return mDataObjectFactory; }
		set { mDataObjectFactory = value; }
	}	
	
	//protected cDataObject ProcessingEventData
	//{
	//    get { return mProcessingEventData; }
	//    set { mProcessingEventData = value; }
	//}

	public cProcessingEvent() {
	}

	//public cProcessingEvent(cDataObject aProcessingEventData) {
	//    mProcessingEventData = aProcessingEventData;
	//}

	public cProcessingEvent(DataRow aDataObjectRow, cDataObjectList aDataObjectList) : base(aDataObjectRow, aDataObjectList) {
	}

	public virtual void ProcessEvent(XmlNode aDataObjectNode) {
	}

	public virtual void ProcessEvent(string aFilterName, string aFilterID) {
	}

	public virtual void ProcessEvent(string aPropertyKey, cDataObject aWFTADO) {
	}

	public static cProcessingEvent CreateProcessingEventInstance(String aDefinitionKey, cDataObjectFactory aDataObjectFactory)
	{
		cProcessingEvent aProcessingEvent = null;
		XmlNode aDefinitionNode = aDataObjectFactory.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aDefinitionKey + "']");
		if (aDefinitionNode != null) {
			XmlNode aClassNode = aDefinitionNode.SelectSingleNode("Class");
			aProcessingEvent = (cProcessingEvent)cReflection.InstantiateObjectFromXMLClassNode(aClassNode, null);
			aProcessingEvent.DefinitionKey = aDefinitionKey;
			aProcessingEvent.DataObjectFactory = aDataObjectFactory;
		}
		return aProcessingEvent;
	}
	
	public void SetMemberVariables(cDataObject aProcessEventDO) {
		Success = aProcessEventDO.GetPropertyBool("Success", false);
		StatusID = aProcessEventDO.GetPropertyInt("StatusID", 0);
		Message = aProcessEventDO.GetPropertyString("StatusMessage", "");
	}
	
} //Class cProcessingEvent
} //Namespace Core.Event