using System;
using System.Data;
using Core.DataAccess.DBAccess;
using Core.Web.User;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;
using System.Xml;
using System.Collections;
using EasyGrants.Workflow;
using Core.Web.Modules;

namespace EasyGrants.Web.User {
/*====================================================*/

///<summary>
///subclass of cWebUser, manages username and passwords
///</summary>
public class cEGUser : cWebUser 
{
/*====================================================*/

	//adding properties must update cEGUser(cWebUser aUser) constructor
	private int		  mEGUserID = -1;
	private int		  mPersonID = -1;
	private cDataObject mWfTaskAssignmentObject;
	
/*-----------------------------------------------------*/

	public cEGAppl EGAppl {
		get {return (cEGAppl)WebAppl;}
	}
	
/*-----------------------------------------------------*/

	public cEGSession EGSession {
		get {return (cEGSession)WebSession;}
	}
	
/*-----------------------------------------------------*/

	public int UserID {
		get {return mEGUserID;}
		set {mEGUserID = value; mUserID = value;}
	}
	
/*-----------------------------------------------------*/

	public int PersonID {
		get {return mPersonID;}
		set {mPersonID = value;}
	}
	
/*-----------------------------------------------------*/

	public override cDataObjectList PersonRoles {
		get {return GetPersonRoles();}	
	}

/*-----------------------------------------------------*/
	
	public virtual int WfTaskAssignmentID {
		get {return -1;}
		set {}
	}

/*-----------------------------------------------------*/
	
	public virtual int WfTaskID {
		get {return -1;}
		set {}
	}

/*-----------------------------------------------------*/
	
	public virtual cDataObject WfTaskAssignmentObject {
		get {return null;}
		set {mWfTaskAssignmentObject = value;}
	}

/*-----------------------------------------------------*/
	
	public virtual cDataObject WfTaskObject {
		get {return null;}
	}

/*-----------------------------------------------------*/
	
	public virtual cDataObject ReviewStageObject {
		get {return null;}
	}

/*-----------------------------------------------------*/
	
	public virtual int GranteeProjectID 
	{
		get {return -1;}
		set {}
	}
	
/*=====================================================*/

	public cEGUser(cEGAppl aAppl, cEGSession aSession) :
					base(aAppl, aSession) {
		
	}

/*-----------------------------------------------------*/

	public cEGUser(cWebUser aUser):base(aUser.WebAppl, aUser.WebSession) {
	
		PersonID = ((cEGUser)aUser).PersonID;
		AccessLevel  = ((cEGUser)aUser).AccessLevel;
		UserID = ((cEGUser)aUser).UserID;
	}
	

/*=====================================================*/
	
	protected virtual cDataObjectList GetPersonRoles(){
	
		cXMLDoc aXmlDoc;
		XmlNode aFiltersNode;
		XmlNode aDataObjectNode;
		
		aXmlDoc = EGSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(EGSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", PersonID.ToString()));
		aFiltersNode.AppendChild(EGSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskStatusID", "3", "AND", "NotEqual"));
		return EGSession.DataObjectFactory.GetDataObjectList(aDataObjectNode);
		
	}

/*-----------------------------------------------------*/

	public void ChangePassword(String aNewPassword) {
		cXMLDoc aXmlDoc;
		XmlNode aFiltersNode;
		XmlNode aDataObjectNode;
		cDataObject aUserObject;
		
		//Get EG_User data object based on PersonID
		aXmlDoc = EGSession.DataObjectFactory.CreateDataObjectNode("User", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(EGSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", PersonID.ToString()));
		aUserObject = EGSession.DataObjectFactory.GetDataObject(aDataObjectNode);
		//Set Password property to aNewPassword
		aUserObject["Password"] = aNewPassword;
		//Save data object
		EGSession.DataObjectFactory.SaveDataObject(aUserObject);
	}
	
/*-----------------------------------------------------*/

	public void ChangePassword(String aNewPassword, String aPageKey) {
		ChangePassword(aNewPassword);
		((cModulePage)EGSession.CurrentPage).ModulePage_RedirectToPageKey(aPageKey);
	}
	
/*-----------------------------------------------------*/
	
	public void ChangePassword(String aNewPassword, String aChangePasswordNextLogin, String aPageKey) 
	{
		cXMLDoc aXmlDoc;
		XmlNode aFiltersNode;
		XmlNode aDataObjectNode;
		cDataObject aUserObject;
		
		//Get EG_User data object based on PersonID
		aXmlDoc = EGSession.DataObjectFactory.CreateDataObjectNode("User", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(EGSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", PersonID.ToString()));
		aUserObject = EGSession.DataObjectFactory.GetDataObject(aDataObjectNode);
		//Set Password property to aNewPassword
		aUserObject["Password"] = aNewPassword;
		if (aChangePasswordNextLogin.ToLower().Equals("false"))
		{
			aUserObject["ChangePasswordNextLogin"] = false;
        }
        									    
		//Save data object
		EGSession.DataObjectFactory.SaveDataObject(aUserObject);
			
		((cModulePage)EGSession.CurrentPage).ModulePage_RedirectToPageKey(aPageKey);
	}
	
/*-----------------------------------------------------*/

	public void SynchronizeUserNameAndEmail() 
	{
        String aEmail; 
        String aUserName;
        cDataObject aPersonDataObj;
        cDataObject aUserDataObj;

        aPersonDataObj = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", PersonID.ToString());
        aEmail = aPersonDataObj.GetRelatedPropertyString("PersonPrimaryEMail.ContactValue1");
        aUserName = aPersonDataObj.GetRelatedPropertyString("User.UserName");

        if(aEmail != aUserName) {
            aUserDataObj = aPersonDataObj.GetRelatedPropertyDataObject("User");
            aUserDataObj["UserName"] = aEmail;
            WebSession.DataObjectFactory.SaveDataObject(aUserDataObj);
        }
    }
/*=====================================================*/

	

/*=====================================================*/
} // class cEGUser


/*====================================================*/
}  //namespace EasyGrants.Web.User