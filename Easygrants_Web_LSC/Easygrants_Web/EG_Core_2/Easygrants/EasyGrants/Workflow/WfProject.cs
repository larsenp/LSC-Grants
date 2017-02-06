using System;
using System.Data;
using System.Xml;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;

namespace EasyGrants.Workflow {
/*====================================================*/

/// <summary>
/// provides methods to access child tasks
/// </summary>
public class cWfProject:cDataObject	{
/*====================================================*/

	public cWfProject(DataRow aDataObjectRow, cDataObjectList aDataObjectList):
				base(aDataObjectRow, aDataObjectList) {
	} 

/*====================================================*/

	protected cDataObjectList Get_WfTasks(cDataObject aWfTaskCur, string aFilterCriteria){
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		XmlNode aArgNode;
		XmlNode aSortNode;

		aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTask", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfProjectID", aWfTaskCur.GetPropertyString("WfProjectID")));
		if(aFilterCriteria.Length > 0)
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "SortOrder", aWfTaskCur.GetPropertyString("SortOrder"), "and", aFilterCriteria));
		
		aSortNode = aXMLDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Sort", "");
		aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "SortOrder", "");
		aSortNode.AppendChild(aArgNode);
		aDataObjectNode.AppendChild(aSortNode);
		return DataObjectFactory.GetDataObjectList(aDataObjectNode);
	}

/*----------------------------------------------------*/

	protected cDataObjectList Get_WfProjectTasks(cDataObject aWfProjectTaskCur, string aFilterCriteria){
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		XmlNode aArgNode;
		XmlNode aSortNode;

		aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfProjectTask", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfProjectID", aWfProjectTaskCur.GetPropertyString("WfProjectID")));
		if(aFilterCriteria.Length > 0)
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "SortOrder", aWfProjectTaskCur.GetPropertyString("SortOrder"), "and", aFilterCriteria));
		
		aSortNode = aXMLDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Sort", "");
		aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "SortOrder", "");
		aSortNode.AppendChild(aArgNode);
		aDataObjectNode.AppendChild(aSortNode);
		return DataObjectFactory.GetDataObjectList(aDataObjectNode);
	}

/*----------------------------------------------------*/

	public cDataObjectList Get_WfTasks_All(){
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		XmlNode aArgNode;
		XmlNode aSortNode;

		aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTask", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfProjectID", this.GetPropertyString("WfProjectID")));
		aSortNode = aXMLDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Sort", "");
		aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "SortOrder", "");
		aSortNode.AppendChild(aArgNode);
		aDataObjectNode.AppendChild(aSortNode);
		return DataObjectFactory.GetDataObjectList(aDataObjectNode);
	}

/*----------------------------------------------------*/

	public cDataObjectList Get_WfProjectTasks_All(){
		cXMLDoc aXMLDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		XmlNode aArgNode;
		XmlNode aSortNode;

		aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfProjectTask", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfProjectID", this.GetPropertyString("WfProjectID")));
		aSortNode = aXMLDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Sort", "");
		aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "SortOrder", "");
		aSortNode.AppendChild(aArgNode);
		aDataObjectNode.AppendChild(aSortNode);
		return DataObjectFactory.GetDataObjectList(aDataObjectNode);
	}

/*----------------------------------------------------*/

	public cDataObjectList Get_WfTasks_Previous(cDataObject aWfTaskCur){
		return Get_WfTasks(aWfTaskCur, "LessThan");
	}

/*----------------------------------------------------*/

	public cDataObjectList Get_WfTasks_Next(cDataObject aWfTaskCur){
		return Get_WfTasks(aWfTaskCur, "GreaterThan");
	}

/*----------------------------------------------------*/

	public cDataObjectList Get_WfProjectTasks_Previous(cDataObject aWfProjectTaskCur){
		return Get_WfProjectTasks(aWfProjectTaskCur, "LessThan");
	}

/*----------------------------------------------------*/

	public cDataObjectList Get_WfProjectTasks_Next(cDataObject aWfProjectTaskCur){
		return Get_WfProjectTasks(aWfProjectTaskCur, "GreaterThan");
	}

/*====================================================*/

	public int GetInitialTask(){
		int	iInitialTaskID = 0;
		//cXMLDoc aXMLDoc;
		//XmlNode aDataObjectNode;
		//XmlNode aFiltersNode;
		//XmlNode aArgNode;

		//cDataObject aWfTaskDO;
		//cDataObjectList aWfProjectTaskList;
		//aWfProjectTaskList = Get_WfProjectTasks_All();
		//foreach(cDataObject aWfProjectTaskDO in aWfProjectTaskList){
		//    aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTask", out aDataObjectNode, out aFiltersNode);
		//    aArgNode = DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfTaskID", aWfProjectTaskDO.GetPropertyString("WfTaskID"));
		//    aFiltersNode.AppendChild(aArgNode);
		//    aWfTaskDO = DataObjectFactory.GetDataObject(aDataObjectNode);
		//    if(aWfTaskDO != null){
		//        if(aWfTaskDO.GetPropertyInt("WfTaskID") == aWfTaskDO.GetPropertyInt("WfParentTaskID", 0)){
		//            iInitialTaskID = aWfTaskDO.GetPropertyInt("WfTaskID");
		//            break;
		//        }
		//    }      
		//}
		cDataObject aInitialTaskDO = DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", this.GetPropertyString("WfProjectID"), "InitialProjectTask", "True")[0];
		if (aInitialTaskDO != null)
			iInitialTaskID = aInitialTaskDO.GetRelatedPropertyInt("WfTask.WfTaskID");
		return iInitialTaskID;
	}

/*====================================================*/
} //public class cWfProject
} //namespace EasyGrants.Workflow
