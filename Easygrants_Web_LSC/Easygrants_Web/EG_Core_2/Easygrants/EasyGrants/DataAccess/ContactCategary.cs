using System;
using System.Xml;
using System.Data;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;

namespace EasyGrants.DataAccess {
/*====================================================*/

/// <summary>
///  ContactCategory is an entry in the category list, to 
///  which a person can be affiliated. Note that the object is misspelled.
/// </summary>
public class cContactCategary : cDataObject 
{
/*====================================================*/

/*-----------------------------------------------------*/

	public cContactCategary(DataRow aDataObjectRow, cDataObjectList aDataObjectList):

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

	public cDataObjectList Person_Updated_WorkgroupTaskList() {
		cXMLDoc aXmlDoc;
		XmlNode aDataObjectNode, aFiltersNode, aArgNode;
		cDataObjectList aWorkGroupList, aWorkGroupTaskListL;
        cDataObjectList aWFTAList = new cDataObjectList(DataObjectFactory);
        
		aXmlDoc = DataObjectFactory.CreateDataObjectNode("WorkGroup", out aDataObjectNode, out aFiltersNode);
		aArgNode = aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
												"PersonID", this.GetPropertyString("PersonID")));
        aArgNode = aArgNode.AppendChild(DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc,
												"WorkGroupMembers"));
		aWorkGroupList = DataObjectFactory.GetDataObjectList(aDataObjectNode);
		
		foreach (cDataObject aWorkGroup in aWorkGroupList) {
			aWorkGroupTaskListL = DataObjectFactory.GetDataObjectListWithFilter("WorkGroupTaskList", "WorkGroupID", aWorkGroup.GetPropertyString("WorkGroupID"));

			foreach (cDataObject aWorkGroupTaskLst in aWorkGroupTaskListL) {
				cDataObjectList		aCurWFTAList;
				
				aCurWFTAList = aWorkGroupTaskLst.GetRelatedPropertyDataObjectList("WfTaskAssignments");
				aWFTAList.AddList(aCurWFTAList);
			}
		}
		
		return aWFTAList;
	}
		
/*=====================================================*/
} // class cReportOutput


/*====================================================*/
}  //namespace EasyGrants.DataAccess