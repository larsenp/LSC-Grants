using System;
using System.Diagnostics;
using System.Collections;
using System.Xml;
using System.Data;
using Core.DataAccess;
using Core.DataAccess.DBAccess;
using Core.DataAccess.XMLAccess;
using Core.Web.User;
using EasyGrants.Workflow;

namespace EasyGrants.Web.User {
/*====================================================*/

///<summary>
///user in home module
///</summary>
public class cEGHomeUser : cEGUser 
{
/*====================================================*/

	public cEGHomeUser(cEGAppl aAppl, cEGSession aSession) :
					base(aAppl, aSession) {
	}
	
/*-----------------------------------------------------*/	

	public cEGHomeUser(cEGUser aUser) :
					base(aUser) {

	}

/*=====================================================*/

	public override void Notify_DataModified(cDataObjectFactory aDataObjectFactory, Hashtable aDataObjHash) {
		cXMLDoc				aXmlDoc;
		XmlNode				aDataObjectNode;
		XmlNode				aFiltersNode;
		XmlNode				aArgNode;
		cDataObjectList		aWfTaskAssignments;
		
		aXmlDoc = aDataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);	
		aArgNode = aFiltersNode.AppendChild(aDataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
											"PersonID", this.PersonID.ToString()));
		
		aWfTaskAssignments = aDataObjectFactory.GetDataObjectList(aDataObjectNode);
		foreach(cWfTaskAssignment aWfTaskAssignment in aWfTaskAssignments) {
			Debug.WriteLine("ID, Description: " + aWfTaskAssignment.GetPropertyString("WfTaskAssignmentID") + ", " +
							aWfTaskAssignment.GetRelatedPropertyString("WfTask.WfTask") + " (as " +
							aWfTaskAssignment.GetRelatedPropertyString("WfTaskRole.WfTaskRole") + ")");
			
			aWfTaskAssignment.Notify_DataModified(aDataObjectFactory, aDataObjHash);
		}
	}

/*=====================================================*/
} // class cEGHomeUser


/*====================================================*/
}  //namespace EasyGrants.Web.User