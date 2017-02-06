using System;
using System.Data;
using System.Web.UI.HtmlControls;
using Core.Web;
using Core.Web.Modules;
using Core.Web.User;
using Core.Web.Navigation;
using Core.DataAccess.DBAccess;
using EasyGrants.Workflow;
using Core.DataAccess.XMLAccess;
using System.Xml;
using Core.DataAccess;
using EasyGrants.Web.User;
using EasyGrants.DataAccess;

namespace EasyGrants.Web {
/*====================================================*/

///<summary>
///access to methods for returning page title, report modify flag
///</summary>
public class cEGPage : cModulePage 
{
/*====================================================*/

	public cEGPage EGPage {
		get {return (cEGPage)this;}
	}

/*----------------------------------------------------*/

	public cEGAppl EGAppl {
		get {return (cEGAppl)WebAppl;}
	}

/*----------------------------------------------------*/

	public cEGSession EGSession {
		get {return (cEGSession)WebSession;}
	}

/*----------------------------------------------------*/

	public String GetPageTitle() {
		cNavElement		aCurNavElement;
		
		aCurNavElement = WebUser.MasterNavElement.Find_ChildElement(PageNavKey);
	
		return aCurNavElement.PageTitle;
	}

/*----------------------------------------------------*/

	public String NavKey {
		get {
			XmlNode aPageNode = ModuleNode.SelectSingleNode("Pages/Page[@Key='" + PageKey + "']");
			return cXMLDoc.AttributeToString(aPageNode, "NavKey");
		}
	}

/*----------------------------------------------------*/

	public void Flag_GranteeReport_Modified() {
		//Flag_GranteeReport_Modified(GranteeMemberUser.GranteeReportID);
	}

/*====================================================*/

	public override void CorePage_Load(Object aSrc, EventArgs aEvent) {
	
		bool AdminKey = false;
		
		if (ModuleUser == null || WebSession == null) {
			Response.Redirect(WebAppl.LogoutURL);
		}
		
		if (ModuleUser.MasterNavElement != null && !WebSession.HasAdminUser) 
		{
			XmlNodeList aNodeList = ModuleNode.SelectNodes("AdminNavigation/NavElement");
			foreach (XmlNode aNode in aNodeList)
			{
				cNavElement	aAdminNavElement = ModuleUser.MasterNavElement.Find_ChildElement(cXMLDoc.AttributeToString(aNode, "Key"));
				if (aAdminNavElement.Key == NavKey)
				{
					AdminKey = true;
					break;
				}
					
				foreach (cXMLNavElement aNavElement in aAdminNavElement.Elements)
				{
					if (aNavElement.Key == NavKey)
					{
						AdminKey = true;
						break;
					}
				}
			}
			
			if (AdminKey && !WebSession.HasAdminUser)
			{
				String aError = System.Configuration.ConfigurationSettings.AppSettings["PermissionErrorPage"];
				if(aError != "")
				{
					String aRetURL = cWebLib.Get_QueryString(Request, "ReturnURL", "");
					WebSession.CurrentUrl = aRetURL;
					String aUrl = WebAppl.Build_RootURL(aError);
					Response.Redirect(aUrl);
				}
				else
				{
					WebSession.LogoutAllUsers();
					Response.Redirect(WebAppl.LogoutURL);
				}
			}
			
			base.CorePage_Load(aSrc, aEvent);			
		}
		else
		{
			base.CorePage_Load(aSrc, aEvent);
		}
		
		// Update Activity Log
	}

	/*-----------------------------------------------------*/
	
	///<summary>
	///selects a third party by taking a PersonRelationShip and:
	///* creating a WfTaskAssighment for this third party role
	///* note that the user already exists
	///</summary>
	public virtual cWfTaskAssignment SelectThirdParty(String aPersonRelationshipID, String aTaskID) 
	{
		cXMLDoc			aXmlDoc;
		XmlNode			aDataObjectNode;
		XmlNode			aFiltersNode;
		cDataObject		aWfTaskAssgObject;
		cDataObject		aPersonRelationshipDataObject;
		cDataObject		aWfTaskAssgRelationshipObject;

		//If no selection has been made, just refresh the page
		if (aPersonRelationshipID == null || aTaskID == "") 
		{
			Redirect();
			return null;
		}
		//get the Related Person Role
		aPersonRelationshipDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("PersonRelationship", aPersonRelationshipID);

		//check to see if this person already has a third party
		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aTaskID));
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", aPersonRelationshipDataObject.GetPropertyString("RelatedPersonID")));
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskRoleID", aPersonRelationshipDataObject.GetPropertyString("RelatedPersonRoleID")));
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "GranteeProjectID", ((cEGUser)ModuleUser).GranteeProjectID.ToString()));
		aWfTaskAssgObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode);

		if (aWfTaskAssgObject == null) 
		{
			WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
			aWfTaskAssgObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode);

			aWfTaskAssgObject["WfTaskID"] = aTaskID;
			aWfTaskAssgObject["GranteeProjectID"] = ((cEGUser)ModuleUser).GranteeProjectID.ToString();
			aWfTaskAssgObject["WfTaskStatusID"] = 3; //3-inactive
			aWfTaskAssgObject["PersonID"] = aPersonRelationshipDataObject["RelatedPersonID"];
			aWfTaskAssgObject["WfTaskRoleID"] = aPersonRelationshipDataObject["RelatedPersonRoleID"];
			WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject);

			//create WfTaskAssignmentPersonRelationship
			WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentPersonRelationship", out aDataObjectNode, out aFiltersNode);
			aWfTaskAssgRelationshipObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode);
			aWfTaskAssgRelationshipObject["WfTaskAssignmentID"] = aWfTaskAssgObject["WfTaskAssignmentID"];
			aWfTaskAssgRelationshipObject["PersonRelationshipID"] = aPersonRelationshipID;
			WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgRelationshipObject);
		}
		
		return (cWfTaskAssignment)aWfTaskAssgObject;
	}

	/*-----------------------------------------------------*/
	/*
		notifies thrid party by:
		* retrieving appropriate WfTaskAssignment
		* settting status to 1 (active)
		* evaluating outcome, which will raise appropriate events
	*/
	public virtual void NotifyThirdParty(String aWfTaskAssignmentID, String aEventID) 
	{
		cWfTaskAssignment		aWfTaskAssgObject;
        
		aWfTaskAssgObject = (cWfTaskAssignment)WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID);
		aWfTaskAssgObject["WfTaskStatusID"] = 1; //incomplete
		aWfTaskAssgObject["OpenDate"] = DateTime.Now;
		WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject);
		int aUserID = ((cPerson) aWfTaskAssgObject.GetRelatedPropertyDataObject("Person")).Get_EG_User();

		aWfTaskAssgObject.RaiseEvent(System.Convert.ToInt32(aEventID), aUserID);
		//aWfTaskAssgObject.SetWfTaskOutcome(OutcomeConfigDoc);
		
		//WfTaskAssignmentObject.Notify_DataModified(WebSession.DataObjectFactory, null);
	}

	/*-----------------------------------------------------*/

	public virtual void SelectAndNotifyThirdParty(String aPersonRelationshipID, String aTaskID, String aEventID, String aRedirectFlag) 
	{
		cWfTaskAssignment		aWfTaskAssgObject;
		
		aWfTaskAssgObject = SelectThirdParty(aPersonRelationshipID, aTaskID);
		if (aWfTaskAssgObject == null) return;
		
		NotifyThirdParty(aWfTaskAssgObject.GetPropertyString("WfTaskAssignmentID"), aEventID);

		if (aRedirectFlag == "True")
			ModulePage.Redirect();
	}
	
	/*-----------------------------------------------------*/

	public virtual void DeleteThirdParty(String aWfTaskAssignmentID, String aRedirectFlag) 
	{
		cWfTaskAssignment		aWfTaskAssgObject;
		cXMLDoc					aXMLDoc;
		XmlNode					aDataObjNode,
			aFiltersNode;
		cDataObject				aWfTaskPerson;
		
		aWfTaskAssgObject = (cWfTaskAssignment)WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID);
		
		aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentPersonRelationship", out aDataObjNode, out aFiltersNode);
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskAssignmentID", aWfTaskAssignmentID));
		aWfTaskPerson = WebSession.DataObjectFactory.GetDataObject(aDataObjNode);

		aWfTaskAssgObject["WfTaskStatusID"] = 3; //inactive
		WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject);
		//aWfTaskAssgObject.SetWfTaskOutcome(OutcomeConfigDoc);
		
		WebSession.DataObjectFactory.DeleteData(aWfTaskPerson);
		WebSession.DataObjectFactory.DeleteData("WfTaskAssignment", aWfTaskAssignmentID);

		if (aRedirectFlag == "True")
			ModulePage.Redirect();
	}
	
	/*-----------------------------------------------------*/

	public virtual void DeleteThirdParty(String aWfTaskAssignmentID) 
	{
		DeleteThirdParty(aWfTaskAssignmentID, "True");
	}

	/*====================================================*/
}//public class cEGPage


/*====================================================*/
}  //namespace EasyGrants.Web
