using System;
using System.Collections;
using System.Data;
using System.Xml;
using Core.DataAccess;
using Core.DataAccess.DBAccess;
using Core.DataAccess.XMLAccess;
using Core.Web.User;
using EasyGrants.Workflow;

namespace EasyGrants.Web.User {
/*====================================================*/
//WfTaskAssignment User
/// <summary>
///  Base class for a user working a single WAfTaskAssignment
/// </summary>
public class cEGWfTAUser : cEGUser {
/*====================================================*/

	private int mWfTaskAssignmentID;
	private int mGranteeProjectID;
	private cDataObject mWfTaskAssignmentObject;

/*====================================================*/

	public override int WfTaskAssignmentID {
		get {return mWfTaskAssignmentID;}
		set {
			if (mWfTaskAssignmentID != value){
				mWfTaskAssignmentID = value;
				MasterNavElement = null;
				mWfTaskAssignmentObject = EGSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", mWfTaskAssignmentID);
			}
		}
	}

/*-----------------------------------------------------*/
	
	public override int WfTaskID {
		get {return WfTaskAssignmentObject.GetPropertyInt("WfTaskID");}
	}

/*-----------------------------------------------------*/	

	public override int GranteeProjectID {
		get {return mGranteeProjectID;}
		set {mGranteeProjectID = value;}
	}
	
/*-----------------------------------------------------*/
	
	public override cDataObject WfTaskAssignmentObject {
		get {
			return mWfTaskAssignmentObject;
		}
	}

/*-----------------------------------------------------*/

	/*For a WfTA user, only the role of the current WfTA should be taken into account in showing/hiding
	navigation elements*/
	protected override cDataObjectList GetPersonRoles(){
		return WfTaskAssignmentObject.DataObjectList;
	}
	
/*====================================================*/

	public cEGWfTAUser(cEGAppl aAppl, cEGSession aSession) :
					base(aAppl, aSession) {
	}

/*-----------------------------------------------------*/	

	public cEGWfTAUser(cEGUser aUser) :
					base(aUser) {

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
} // class EGWfTAUser


/*====================================================*/
}  //namespace EasyGrants.Web.User
