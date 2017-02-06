using System;
using System.Collections;
using System.Data;
using System.Diagnostics;
using System.Xml;
using Core.DataAccess;
using Core.DataAccess.DBAccess;
using Core.DataAccess.XMLAccess;
using Core.Web.User;
using EasyGrants.Workflow;

namespace EasyGrants.Web.User {
/*====================================================*/

///<summary>
///Base class for a user working with assignments to the same WfTask
///This class may end up being a general purpose class for 
///all grantee users (applicants, third party, etc.)
///</summary>
public class cEGWfTaskUser : cEGUser {
/*====================================================*/

	private int mWfTaskID;
	private cDataObject mWfTaskObject;

/*====================================================*/

	public override int WfTaskID {
		get {return mWfTaskID;}
		set {
			if (mWfTaskID != value){
				mWfTaskID = value;
				MasterNavElement = null;
				mWfTaskObject = EGSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTask", mWfTaskID);
			}
		}
	}

/*-----------------------------------------------------*/	
	
	public override cDataObject WfTaskObject {
		get {
			return mWfTaskObject;
		}
	}

/*====================================================*/

	public cEGWfTaskUser(cEGAppl aAppl, cEGSession aSession) :
					base(aAppl, aSession) {
	}

/*-----------------------------------------------------*/	

	public cEGWfTaskUser(cEGUser aUser) :
					base(aUser) {

	}

/*-----------------------------------------------------*/

	public bool IsSubmitted {
		get {return Determine_Status();}
	}
	
/*=====================================================*/

	public cDataObjectList Get_WfTaskAssignments() {
		cXMLDoc				aXmlDoc;
		XmlNode				aDataObjectNode;
		XmlNode				aFiltersNode;
		XmlNode				aArgNode;

		aXmlDoc = EGSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);	
		aArgNode = aFiltersNode.AppendChild(EGSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
											"PersonID", this.PersonID.ToString()));
		aArgNode = aFiltersNode.AppendChild(EGSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
											"WfTaskID", this.WfTaskID.ToString()));
		return EGSession.DataObjectFactory.GetDataObjectList(aDataObjectNode);
	}
	
/*=====================================================*/

	private bool Determine_Status() {
		cDataObjectList		aWfTaskAssignments;
		
		aWfTaskAssignments = Get_WfTaskAssignments();
		foreach(cWfTaskAssignment aWfTaskAssignment in aWfTaskAssignments) {
			if (aWfTaskAssignment.GetPropertyString("WfTaskStatusID") != "2")
				return false;
		}
		
		return true;
	}
	
/*=====================================================*/

	public override void Notify_DataModified(cDataObjectFactory aDataObjectFactory, Hashtable aDataObjHash) {
		cXMLDoc				aXmlDoc;
		XmlNode				aDataObjectNode;
		XmlNode				aFiltersNode;
		XmlNode				aArgNode;
		cWfTaskAssignment	aWfTaskAssignment;
		
		aXmlDoc = aDataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);	
		aArgNode = aFiltersNode.AppendChild(aDataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
											"WfTaskAssignmentID", this.WfTaskAssignmentID.ToString()));
		
		aWfTaskAssignment = (cWfTaskAssignment)aDataObjectFactory.GetDataObject(aDataObjectNode);
		if (aWfTaskAssignment != null)
			aWfTaskAssignment.Notify_DataModified(aDataObjectFactory, aDataObjHash);
	}

/*=====================================================*/
} // class cEGWfTaskUser


/*====================================================*/
}  //namespace EasyGrants.Web.User
