using System;
using System.Data;
using System.Xml;
using System.Collections.Generic;
using System.Text;
using Core.Event;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;

namespace EasyGrants.Event {
	class cStoredProcedureEvent:cProcessingEvent {

		public cStoredProcedureEvent() : base() { }
		//public cStoredProcedureEvent(cDataObject aProcessingEventData):base(aProcessingEventData) {
		//}
		public cStoredProcedureEvent(DataRow aDataObjectRow, cDataObjectList aDataObjectList)
			: base(aDataObjectRow, aDataObjectList) {
		}

		public override void ProcessEvent(XmlNode aDataObjectNode) {
			cDataObject aProcessEventDO = DataObjectFactory.GetDataObject(aDataObjectNode);
			SetMemberVariables(aProcessEventDO);
		}

		public override void ProcessEvent(string aFilterName, string aFilterID) {
			string[] aFilterNames = {aFilterName};
			string[] aFilterIDs = {aFilterID};
			string aFilterName1 = "UserID";
			string aFilterID1 = DataObjectFactory.User.UserID.ToString();
			string[] aFilterNames1 = {aFilterName, aFilterName1};
			string[] aFilterIDs1 = {aFilterID, aFilterID1};
			cDataObjectList aProcessEventDOL = null;
			if (DataObjectFactory.CreateNewDataObjectFromKey(DefinitionKey).HasProperty("UserID")) {
				aProcessEventDOL = DataObjectFactory.GetDataObjectListWithFilter(DefinitionKey, aFilterNames1, aFilterIDs1);	
			}
			else {
				aProcessEventDOL = DataObjectFactory.GetDataObjectListWithFilter(DefinitionKey, aFilterNames, aFilterIDs);
			}
			if (aProcessEventDOL != null && aProcessEventDOL.Count > 0) {
				cDataObject aProcessEventDO = aProcessEventDOL[0]; 
				SetMemberVariables(aProcessEventDO);
			}
		}

		public override void ProcessEvent(string aPropertyKey, cDataObject aWFTADO) {
			cXMLDoc aXmlDoc;
			XmlNode aDataObjectNode, aFiltersNode;
			aXmlDoc = DataObjectFactory.CreateDataObjectNode(DefinitionKey, out aDataObjectNode, out aFiltersNode);
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", aPropertyKey, aWFTADO.GetPropertyString(aPropertyKey)));
			if (DataObjectFactory.CreateNewDataObjectFromKey(DefinitionKey).HasProperty("UserID")) {
				aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserID", DataObjectFactory.User.UserID.ToString()));
			}
			ProcessEvent(aDataObjectNode);
		}
	
	}
}
