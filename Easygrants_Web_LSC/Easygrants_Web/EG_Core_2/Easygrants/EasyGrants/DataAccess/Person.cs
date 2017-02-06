using System;
using System.Xml;
using System.Data;
using System.Collections;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;

namespace EasyGrants.DataAccess {
/*====================================================*/

/// <summary>
/// gets workflow task list for a given person based on the groups
/// they belong to
/// </summary>
public class cPerson : cDataObject {
/*====================================================*/

	public cPerson(DataRow aDataObjectRow, cDataObjectList aDataObjectList):

				base(aDataObjectRow, aDataObjectList) {
	} 

/*-----------------------------------------------------*/

	public override void UpdateCalculatedValue(XmlNode aCalculationNode, String aPropertyName) {
		String		aAttributeType;
		
		aAttributeType = cXMLDoc.AttributeToString(aCalculationNode,"Type");

		switch (aAttributeType) {
			case "Custom" :
				
				break;
			default :
				base.UpdateCalculatedValue(aCalculationNode, aPropertyName);
				return;
		}
	}

/*-----------------------------------------------------*/

	public cDataObjectList Person_Updated_WorkgroupTaskList(XmlElement aDataObjectElement) {
		cXMLDoc aXmlDoc;
		XmlNode aDataObjectNode, aFiltersNode, aArgNode;
		cDataObjectList aWorkGroupList, aWorkGroupTaskListL;
		cDataObjectList aWFTAList = DataObjectFactory.CreateDataObjectList(aDataObjectElement); //This is the object that will be returned.

		aXmlDoc = DataObjectFactory.CreateDataObjectNode("WorkGroup", out aDataObjectNode, out aFiltersNode);
		aArgNode = aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
												"PersonID", this.GetPropertyString("PersonID")));
        aArgNode = aArgNode.AppendChild(DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc,
												"WorkGroupMembers"));
		aWorkGroupList = DataObjectFactory.GetDataObjectList(aDataObjectNode);
		
		ArrayList wgArrayL = new ArrayList();
		int wfALIdx = 0;
		foreach (cDataObject aWorkGroup in aWorkGroupList) {
			aWorkGroupTaskListL = DataObjectFactory.GetDataObjectListWithFilter("WorkGroupTaskList", "WorkGroupID", aWorkGroup.GetPropertyString("WorkGroupID"));
			
			if (aWorkGroupTaskListL.Count == 0)
				continue;
				
			foreach (cDataObject aWorkGroupTaskLst in aWorkGroupTaskListL) 
			{
				cDataObjectList		aCurWFTAList;
				
				aCurWFTAList = aWorkGroupTaskLst.GetRelatedPropertyDataObjectList("WfTaskAssignments");
				
				if (aCurWFTAList.Count == 0)
					continue;
				foreach (cDataObject aCurWFTA in aCurWFTAList) {
					wfALIdx = wgArrayL.BinarySearch(aCurWFTA.GetPropertyInt("WfTaskAssignmentID"));
					
					if (wfALIdx >= 0)
						break;
						
					if (aCurWFTA.GetPropertyInt("WfTaskStatusID") == 1 && aCurWFTA.GetPropertyString("PersonID") == "") {
						aWFTAList.Add(aCurWFTA);
						wgArrayL.Insert(~wfALIdx, aCurWFTA.GetPropertyInt("WfTaskAssignmentID"));
						aCurWFTA.DataObjectList = aWFTAList;
					}
				}
			}
		}
		
		XmlElement aSortEl = (XmlElement)aDataObjectElement.SelectSingleNode("Sort");
		if(aSortEl != null) {
			aWFTAList.SortEl = aSortEl;
			aWFTAList.Sort();
		}
		
		return aWFTAList;
	}
	
/*-----------------------------------------------------*/

	public cDataObjectList Person_Updated_WorkgroupTaskList() {
		XmlNode aDataObjectNode;
		cXMLDoc aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode);
		return Person_Updated_WorkgroupTaskList((XmlElement)aDataObjectNode);
	}
	
/*-----------------------------------------------------*/

	public int Get_EG_User() {
		int aUserID;
		cDataObject aUser = this.GetRelatedPropertyDataObject("User");
		if (aUser != null)
			return aUser.GetPropertyInt("UserID",0);
		else
			return 0;		
	}

/*=====================================================*/
} // class cPerson


/*====================================================*/
}  //namespace EasyGrants.DataAccess