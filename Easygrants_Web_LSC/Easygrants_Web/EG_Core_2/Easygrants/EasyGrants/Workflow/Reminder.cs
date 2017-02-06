using System;
using System.Data;
using System.Xml;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;

namespace EasyGrants.Workflow
/*====================================================*/
{
/// <summary>
/// Object to manage sending of reminder e-mails based on time intervals before or after key project dates
/// </summary>

public class cReminder : cDataObject
{
/*====================================================*/

	public cReminder(DataRow aDataObjectRow, cDataObjectList aDataObjectList):
				base(aDataObjectRow, aDataObjectList) {
	}

/*====================================================*/

/*----------------------------------------------------*/
	public cDataObjectList GetWfTaskAssignmentList() {
	//returns a list of WfTaskAssignment data objects that meet the criteria for receiving an e-mail reminder (WfProjectTask,
	//WfTaskStatus, and interval before or after a key project date)
		int aWfProjectID;
		int aWfTaskID;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		XmlNode aArgNode;
		bool aOverridableDateType = false;
		
		//Get filter values
		//Project and task IDs (We cannot currently filter directly on WfTaskAssignment.WfProjectTask for technical reasons)
		if(GetPropertyValue("ProjectTaskID") != System.DBNull.Value) {
			cDataObject aWfProjectTask = DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", GetPropertyInt("ProjectTaskID"));
			aWfProjectID = aWfProjectTask.GetPropertyInt("WfProjectID");
			aWfTaskID = aWfProjectTask.GetPropertyInt("WfTaskID");
		}
		else {
			aWfProjectID = GetPropertyInt("WfProjectID");
			aWfTaskID = GetPropertyInt("WfTaskID");
		}
		
		//Get date value against which to compare dates in database (today's date offset by the interval defined in the reminder object)
		int aInterval = GetPropertyInt("DaysToRemind");
		if(GetPropertyInt("BeforeAfterID") == 2)
			aInterval = -1 * aInterval;
		DateTime aCompareDate = DateTime.Today.Add(new TimeSpan(aInterval, 0, 0, 0));
		String aCompareDateStr = String.Format("{0:yyyy/M/d}", aCompareDate);
		DateTime aCompareDateNext = aCompareDate.Add(new TimeSpan(1, 0, 0, 0));
		String aCompareDateStrNext = String.Format("{0:yyyy/M/d}", aCompareDateNext);
		
		//Check to see if the date type is one that is overridable by the individual WfTaskAssignment
		String aReminderTargetType = GetRelatedPropertyString("ReminderTarget.Abbr");
		if(aReminderTargetType == "OpenDate" || aReminderTargetType == "DueDate" || aReminderTargetType == "CloseDate")
			aOverridableDateType = true;

		//Build filter nodes
		cXMLDoc aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskID", aWfTaskID.ToString()));
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskStatusID", "1"));
		aArgNode = aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfProjectID", aWfProjectID.ToString()));
		DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "GranteeProject", aArgNode);
		
		//If the date type is not overridable, we just have to filter on the appropriate date from the WfProjectTask. Otherwise,
		//we have to filter on (WfProjectTask date meets criteria AND WfTaskAssignment date is null) OR (WfTaskAssignment date meets criteria)
		if(aOverridableDateType) {
			aFiltersNode.AppendChild(DataObjectFactory.CreateGroupArgumentNode(aXMLDoc, "(", "And"));
			aFiltersNode.AppendChild(DataObjectFactory.CreateGroupArgumentNode(aXMLDoc, "(", ""));
		}

		//aArgNode = aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", aReminderTargetType, aCompareDateStr, ""));
		//DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfProjectTask", aArgNode);
		aArgNode = aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", aReminderTargetType, aCompareDateStr, "", "GreaterThanEqual"));
		DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfProjectTask", aArgNode);
		aArgNode = aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", aReminderTargetType, aCompareDateStrNext, "And", "LessThan"));
		DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfProjectTask", aArgNode);
		
		if(aOverridableDateType) {
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", aReminderTargetType, "null"));
			aFiltersNode.AppendChild(DataObjectFactory.CreateGroupArgumentNode(aXMLDoc, ")", ""));
			
			//aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", aReminderTargetType, aCompareDateStr, "Or"));
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", aReminderTargetType, aCompareDateStr, "Or", "GreaterThanEqual"));
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", aReminderTargetType, aCompareDateStrNext, "And", "LessThan"));

			aFiltersNode.AppendChild(DataObjectFactory.CreateGroupArgumentNode(aXMLDoc, ")", ""));
		}

		//Get data object list
		return DataObjectFactory.GetDataObjectList(aDataObjectNode);
	}
	
/*====================================================*/
}
}
