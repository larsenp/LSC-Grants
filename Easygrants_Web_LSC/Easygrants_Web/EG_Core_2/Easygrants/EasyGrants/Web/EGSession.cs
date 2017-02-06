using System;
using System.Data;
using System.Xml;
using System.Web;
using Core.Util;
using Core.User;
using Core.Web;
using Core.Web.Modules;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;
using Core.DataAccess.DBAccess;
using EasyGrants.Web.User;

namespace EasyGrants.Web {
/*====================================================*/

///<summary>
///EG accessors to cWebSession methods, user object methods, navigation, login to easygrants system 
///</summary>
public class cEGSession : cWebSession 
{
/*====================================================*/

	public cEGAppl EGAppl {
		get {return (cEGAppl)WebAppl;}
	}
	
/*-----------------------------------------------------*/

	public cEGSession(cWebAppl aWebAppl) :
			base(aWebAppl) {
	}
	
/*=====================================================*/

	public cEGUser EGUser_From_ClassNode(Object[] aArgs, XmlNode aClassNode) {
		cEGUser		aUser = null;
	
		aUser = (cEGUser)User(aClassNode);

		if (aUser==null) 
		{
			aUser = (cEGUser)cReflection.InstantiateObjectFromXMLClassNode(aClassNode, aArgs);
			Add_User(aClassNode, aUser);
		}

		return aUser;
	}

/*-----------------------------------------------------*/

	public cEGUser EGUser_From_ClassNode(XmlNode aClassNode) {
		Object[] aArgs = {EGAppl, this}; //array params go after type, even in VB
		
		return EGUser_From_ClassNode (aArgs, aClassNode);
	}

/*-----------------------------------------------------*/

	public cEGUser EGUser_From_User(String aUserClass, XmlNode aClassNode) {
	
		cEGUser		aUser = (cEGUser)User(aUserClass);
		Object[] aArgs = {aUser};
	
		return EGUser_From_ClassNode (aArgs, aClassNode);
	}

/*-----------------------------------------------------*/

	public cEGUser EGUser_From_ModuleDoc(cXMLDoc aModuleDoc) {
		XmlNode		aClassNode,
					aModuleNode;
		cEGUser		aUser = null;
		String		aCopyUser;
		
		aModuleNode = aModuleDoc.DocElement.SelectSingleNode("Module");
		aClassNode = cXMLDoc.FindNode(aModuleNode, "descendant::Class", "Name", cXMLDoc.AttributeToString(aModuleNode, "UserClass"));
		aCopyUser = cXMLDoc.AttributeToString(aClassNode, "CopyUser");
		
		if (aCopyUser!= "") {
			aUser = EGUser_From_User(aCopyUser, aClassNode);
		}
		else {
			aUser = EGUser_From_ClassNode(aClassNode);
		}
	
		return aUser;
	}
	
/*-----------------------------------------------------*/

	public cEGUser EGUser_From_ModuleConfig(String aModuleConfig, out cXMLDoc aModuleDoc) {		
		aModuleDoc = new cXMLDoc(CurrentPage.Server.MapPath(aModuleConfig));
		if (aModuleDoc.DocElement == null) {
			aModuleDoc = base.LoadModuleConfigXmlFromDB(aModuleConfig.Substring(aModuleConfig.LastIndexOf("/")+1));
		}
		return EGUser_From_ModuleDoc(aModuleDoc);
	}
	
/*-----------------------------------------------------*/

	public cEGUser EGUser_From_ModuleConfig(String aModuleName, String aModuleConfig, out cXMLDoc aModuleDoc) {		
	
		return EGUser_From_ModuleConfig (WebAppl.Get_ModuleRoot(aModuleName) + "/" + aModuleName + "/" + aModuleConfig, out aModuleDoc);
	}
	
/*-----------------------------------------------------*/

	public cEGUser EGUser_From_EGUserType(String aEGUserType, out cXMLDoc aModuleDoc) {
		XmlNode		aApplModuleNode;
		String		aModuleConfig;
		
		aApplModuleNode = cXMLDoc.FindNodeWithChildNode(EGAppl.Get_ApplNode(), "Modules/Module", "EGUserTypes", "Type", aEGUserType);
		aModuleConfig = cXMLDoc.AttributeToString(aApplModuleNode, "ConfigFile");
		return EGUser_From_ModuleConfig(aModuleConfig, out aModuleDoc);
	}
	
/*-----------------------------------------------------*/

	public cEGUser EGUser_From_UserDataobject(cDataObject aUserDO, out cXMLDoc aModuleDoc) {
		cEGUser aUser = EGUser_From_EGUserType(aUserDO.GetRelatedPropertyString("UserType.UserType_Abbr"), out aModuleDoc);       
		
		aUser.UserID = aUserDO.GetPropertyInt("UserID");
		aUser.PersonID = aUserDO.GetPropertyInt("PersonID");
		aUser.AccessLevel = aUserDO.GetRelatedPropertyInt("UserType.AccessLevel");
		//aUser.SetPersonRoles(); //call after PersonID is set
		
		return aUser;
	}
	
/*=====================================================*/

	public	void RedirectUserToModule(cEGUser aUser, String aModuleName, String aModuleConfig, String aPageName, String aPageKey){
		((cModulePage)CurrentPage).ModulePage_RedirectToModule(aModuleName, aModuleConfig, aPageName, aPageKey);
	}
	
/*-----------------------------------------------------*/
	
	public void RedirectToModule(String aModuleName, String aModuleConfig, String aPageKey) {
		cEGUser	aUser;
		cXMLDoc aModuleDoc;
		XmlNode	aModuleNode;
		
		aUser = EGUser_From_ModuleConfig(aModuleName, aModuleConfig, out aModuleDoc);
		if (aUser != null){
			aModuleNode = aModuleDoc.DocElement.SelectSingleNode("Module");
			
			if (aPageKey == ""){
				aPageKey = cXMLDoc.AttributeToString(aModuleNode, "DefaultPageKey");
			}
			
			String	aPageName = cXMLDoc.AttributeToString(aModuleNode, "PageName");
			RedirectUserToModule(aUser, aModuleName, aModuleConfig, aPageName, aPageKey);
		}
	}

	public void RedirectToModule(String aModuleName, String aModuleConfig, String aPageKey, String aQuery1, String aQuery2)
	{
		String[] aQueryStrs = { aQuery1, aQuery2 };

		RedirectToModule_QueryString(aModuleName, aModuleConfig, aPageKey, aQueryStrs);

	}

	protected void RedirectToModule_QueryString(String aModuleName, String aModuleConfig, String aPageKey, String[] aQueryStrs)
	{
		int i;
		cEGUser aUser;
		cXMLDoc aModuleDoc;
		XmlNode aModuleNode;
		String aQuery;
		String aPageName = "";

		aUser = EGUser_From_ModuleConfig(aModuleName, aModuleConfig, out aModuleDoc);
		if (aUser != null)
		{
			aModuleNode = aModuleDoc.DocElement.SelectSingleNode("Module");

			if (aPageKey == "")
			{
				aPageKey = cXMLDoc.AttributeToString(aModuleNode, "DefaultPageKey");
			}

			aPageName = cXMLDoc.AttributeToString(aModuleNode, "PageName");
		}
		aQuery = "";
		if (aQueryStrs != null)
			for (i = 0; i < aQueryStrs.Length; i++)
			{
				if (aQueryStrs[i] != "")
				{
					String aNameValuePair = aQueryStrs[i];
					if (aQueryStrs[i].IndexOf("=") != -1)
					{
						if (aQuery.Length == 0)
						{
							aQuery = aNameValuePair;
						}
						else
						{
							aQuery = aQuery + "&" + aNameValuePair;
						}
					}
				}

			}
		RedirectUserToModule(aUser, aModuleName, aModuleConfig, aPageName, aPageKey, aQuery);
	}

	public void RedirectUserToModule(cEGUser aUser, String aModuleName, String aModuleConfig, String aPageName, String aPageKey, string aQueryString)
	{
		((cModulePage)CurrentPage).ModulePage_RedirectToModule(aModuleName, aModuleConfig, aPageName, aPageKey, aQueryString);
	}
	
/*-----------------------------------------------------*/
/* this method is used when accessing a module through a task such as Application*/	

	public	void RedirectToModule(String aModuleName, String aModuleConfig, String aPageKey, String aWfTaskAssignmentID) {
		cEGUser	aUser;
		cXMLDoc aModuleDoc;
		XmlNode	aModuleNode;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		cDataObject aWfTaskAssignmentDataObject ;
		cXMLDoc aXmlDoc;

		aUser = EGUser_From_ModuleConfig(aModuleName, aModuleConfig, out aModuleDoc);
		if (aUser != null){
			aModuleNode = aModuleDoc.DocElement.SelectSingleNode("Module");
			
			if (aPageKey == ""){
				aPageKey = cXMLDoc.AttributeToString(aModuleNode, "DefaultPageKey");
			}
			aUser.WfTaskAssignmentID = Convert.ToInt32(aWfTaskAssignmentID);

			//get wftaskass object- filter on aWfTaskAssignmentID, set aUser.GranteeProjectID 
			aXmlDoc = DataObjectFactory.CreateDataObjectNode("WfTaskAssignment",out aDataObjectNode,out aFiltersNode);
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskAssignmentID", aUser.WfTaskAssignmentID.ToString()));
			aWfTaskAssignmentDataObject = DataObjectFactory.GetDataObject(aDataObjectNode);
			aUser.GranteeProjectID = aWfTaskAssignmentDataObject.GetPropertyInt("GranteeProjectID");				
			
			String	aPageName = cXMLDoc.AttributeToString(aModuleNode, "PageName");
			RedirectUserToModule(aUser, aModuleName, aModuleConfig, aPageName, aPageKey);
		}
	}
	
/*-----------------------------------------------------*/

	public	void Task_RedirectToModule(String aModuleName, String aModuleConfig, String aPageKey, String aWfTaskID) {
		cEGUser	aUser;
		cXMLDoc aModuleDoc;
		XmlNode	aModuleNode;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		cDataObject aReviewStageObject ;
		cXMLDoc aXmlDoc;

		aUser = EGUser_From_ModuleConfig(aModuleName, aModuleConfig, out aModuleDoc);
		if (aUser != null){
			aModuleNode = aModuleDoc.DocElement.SelectSingleNode("Module");
			
			if (aPageKey == ""){
				aPageKey = cXMLDoc.AttributeToString(aModuleNode, "DefaultPageKey");
			}
			aUser.WfTaskID = Convert.ToInt32(aWfTaskID);

			//get wftaskass object- filter on aWfTaskAssignmentID, set aUser.GranteeProjectID 
			aXmlDoc = DataObjectFactory.CreateDataObjectNode("WfTask",out aDataObjectNode,out aFiltersNode);
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aUser.WfTaskID.ToString()));
			aReviewStageObject = DataObjectFactory.GetDataObject(aDataObjectNode);
			//aUser.GranteeProjectID = aReviewStageObject.GetPropertyInt("GranteeProjectID");				
			
			String	aPageName = cXMLDoc.AttributeToString(aModuleNode, "PageName");
			RedirectUserToModule(aUser, aModuleName, aModuleConfig, aPageName, aPageKey);
		}
	}
	
/*=====================================================*/

	public cEGUser ValidateLoginCredentials(String aLoginID, String aPassword,
											out cXMLDoc aModuleDoc) {
		return ValidateLoginCredentials(aLoginID, aPassword, false, false, out aModuleDoc);
	}
	
/*-----------------------------------------------------*/

	public cEGUser ValidateLoginCredentials(String aLoginID, String aPassword, bool aEnforceUserNameCase, bool aEnforcePasswordCase,
											out cXMLDoc aModuleDoc) {
		
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		
		//Construct User data object node
		cXMLDoc aXmlDoc = DataObjectFactory.CreateDataObjectNode("User", out aDataObjectNode, out aFiltersNode);	
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserName", aLoginID));
		
		cDataObjectList aDOL = DataObjectFactory.GetDataObjectList(aDataObjectNode);
		cDataObject aDataObject = null;
		
		foreach (cDataObject aDO in aDOL) {
			if (aDO.GetPropertyString("Password").ToLower() == aPassword.ToLower()) {
				aDataObject = aDO;
				break;
			}
		}
        
        if (aDataObject!=null &&
			(!aEnforceUserNameCase || aDataObject.GetPropertyString("UserName") == aLoginID) &&
			(!aEnforcePasswordCase || aDataObject.GetPropertyString("Password") == aPassword)){
			cEGUser aUser = EGUser_From_UserDataobject(aDataObject, out aModuleDoc);
			return aUser;
		}

		aModuleDoc = null;
		return null;
	}
/* --------------------------------------------------------*/

	public bool Locked(int aUserID)
	{
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		
		//Construct User data object node
		cXMLDoc aXmlDoc = DataObjectFactory.CreateDataObjectNode("User", out aDataObjectNode, out aFiltersNode);	
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserID", aUserID.ToString()));
		
		cDataObjectList aDOL = DataObjectFactory.GetDataObjectList(aDataObjectNode);
		
		foreach (cDataObject aDO in aDOL) 
		{
			if (aDO.GetPropertyValue("FailedAttempts") != System.DBNull.Value)
			{
				if (aDO.GetPropertyInt("FailedAttempts")>= WebAppl.MaxFailedLoginAttempts) 
				{
					return true;
				}
			}
		}
		return false;
			
	} 
/*-----------------------------------------------------*/

	public cEGUser LoginUserFromCredentials(String aLoginID, String aPassword) {
		return LoginUserFromCredentials(aLoginID, aPassword, false, false);
	}

/*-----------------------------------------------------*/

	public cEGUser LoginUserFromCredentials(String aLoginID, String aPassword, 
						bool aEnforceUserNameCase, bool aEnforcePasswordCase) {
		cEGUser	aUser;
		cXMLDoc aModuleDoc;
		String startPage="";
		String redirectUrl;
		
		aUser = ValidateLoginCredentials(aLoginID, aPassword, aEnforceUserNameCase, aEnforcePasswordCase, out aModuleDoc);
		if (aUser != null) {			
			//for logging login history
			LogLoginHistory(aUser.UserID);
			//getting the start page for extranet users
			
			cDataObject aUserDO = DataObjectFactory.GetDataObjectListWithFilter("User", "UserID", aUser.UserID.ToString())[0];
			if (CurrentPage.Request["RequestKeyOut"]!="" && CurrentPage.Request["RequestKeyOut"]!= null)
			{
				startPage = CurrentPage.Request["RequestKeyOut"];
			}
			else
			{
				cDataObject aExtranetUser = DataObjectFactory.GetDataObjectListWithFilter("ExtranetGroup", "EasygrantsUserID", aUser.UserID.ToString())[0];
				if (aExtranetUser != null)
				{
					startPage = aExtranetUser.GetRelatedPropertyString("SecurityGroup.StartPage");
				}
			}
			if (CurrentPage.Request["returnurl"] != "" && CurrentPage.Request["returnurl"] != null)
			{
				redirectUrl = WebAppl.Root + WebAppl.Root + "/Gateway/pgGateway.aspx";
				redirectUrl = cWebLib.AddQuerystringParameter(redirectUrl, "Direction", "Out");
				//redirectUrl = cWebLib.AddQuerystringParameter(redirectUrl, "RequestKey", CurrentPage.Request["RequestKeyIn"]);
				redirectUrl = cWebLib.AddQuerystringParameter(redirectUrl, "returnurl", CurrentPage.Request["returnurl"]);
				CurrentPage.Redirect(redirectUrl);
			}
			else if (CurrentPage.Request["RequestKeyIn"]!= "" && CurrentPage.Request["RequestKeyIn"] != null)
			{
				redirectUrl = WebAppl.Root + WebAppl.Root + "/Gateway/pgGateway.aspx";
				redirectUrl = cWebLib.AddQuerystringParameter(redirectUrl, "Direction", "In");
				redirectUrl = cWebLib.AddQuerystringParameter(redirectUrl, "RequestKeyIn", CurrentPage.Request["RequestKeyIn"]);
				//redirectUrl = cWebLib.AddQuerystringParameter(redirectUrl, "TargetUrl", CurrentPage.Request.UrlReferrer.ToString());
				CurrentPage.Redirect(redirectUrl);
			}
			else if (startPage == null || startPage == "" )
			{
				((cModulePage)CurrentPage).ModulePage_RedirectToModule(aModuleDoc);
			}
			else
			{
				redirectUrl = WebAppl.Root + WebAppl.Root + "/Gateway/pgGateway.aspx";
				redirectUrl = cWebLib.AddQuerystringParameter(redirectUrl, "Direction", "Out");
				redirectUrl = cWebLib.AddQuerystringParameter(redirectUrl, "RequestKey", startPage);
				//redirectUrl = cWebLib.AddQuerystringParameter(redirectUrl, "TargetUrl", CurrentPage.Request.UrlReferrer.ToString());
				CurrentPage.Redirect(redirectUrl);
			}
		}
		
		return aUser;
	}

/*-----------------------------------------------------*/
	///<summary>
	///Method to let a user login with just a loginid. Should be used only by gateway or other places where
	///there is a way to check for authorization and authentication of the user. See GatewayPage.cs and pgGateway.aspx	
	///for cookie encryption and decryption details.
	///</summary>
	public cEGUser LoginUserFromCookie(String aLoginID) {
	
		cEGUser aUser = null;
		cXMLDoc aModuleDoc;
		
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		
		//Construct User data object node
		cXMLDoc aXmlDoc = DataObjectFactory.CreateDataObjectNode("User", out aDataObjectNode, out aFiltersNode);	
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserName", aLoginID));		
		
		cDataObject aDataObject = DataObjectFactory.GetDataObject(aDataObjectNode);
        
        if (aDataObject!=null){
			aUser = EGUser_From_UserDataobject(aDataObject, out aModuleDoc);			
		}	

		aModuleDoc = null;
		return aUser;
//		if (aUser != null) {
//			return true;			
			//LogLoginHistory(aUser.UserID);
			//((cModulePage)CurrentPage).ModulePage_RedirectToModule(aModuleDoc);
//		}
//		else
//			return false;
	}

/*-----------------------------------------------------*/

	///<summary>
	///Logs a user's history of login to Easygrants.
	///</summary>
	private void LogLoginHistory(int aUserID) {
		cXMLDoc	aXmlDoc;
		XmlNode	aDataObjectNode;
		cDataObject aLoginDO;		
		
		aXmlDoc = DataObjectFactory.CreateDataObjectNode("LoginHistory", out aDataObjectNode);
		aLoginDO = DataObjectFactory.GetNewDataObject(aDataObjectNode); 
		aLoginDO["UserID"] = aUserID;
		aLoginDO["IPAddress"] = ((cModulePage)CurrentPage).Request.UserHostAddress;
		//do i need to get all the languauges?
		string aUserLanguage = "";
		if (((cModulePage)CurrentPage).Request.UserLanguages != null)
		{
			for (int i=0; i < ((cModulePage)CurrentPage).Request.UserLanguages.Length; i++)
			{
				aUserLanguage += ((cModulePage)CurrentPage).Request.UserLanguages.GetValue(i) + " ";
			}
		}
		aLoginDO["UserLanguage"] = aUserLanguage;
		aLoginDO["BrowserInfo"] = ((cModulePage)CurrentPage).Request.UserAgent;
		aLoginDO["LoginDate"] = System.DateTime.Now;
		
		DataObjectFactory.SaveDataObject(aLoginDO);
	}

/*-----------------------------------------------------*/

	///<summary>
	///Checks for a duplicate person
	///</summary>
	public int GetDuplicatePersonID(String aLoginID) {
		int ret = 0;
		cXMLDoc aXmlDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		cDataObject aDataObject;

		aXmlDoc = DataObjectFactory.CreateDataObjectNode("User", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserName", aLoginID));
		aDataObject = DataObjectFactory.GetDataObject(aDataObjectNode);
		if(aDataObject != null)
			ret = aDataObject.GetPropertyInt("PersonID", 0);
		else{
			aFiltersNode.RemoveAll();
			aDataObjectNode.RemoveAll();
			aXmlDoc = DataObjectFactory.CreateDataObjectNode("Email", out aDataObjectNode, out aFiltersNode);
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ContactValue1", aLoginID));
			aDataObject = DataObjectFactory.GetDataObject(aDataObjectNode);
			if(aDataObject != null)
				ret = aDataObject.GetPropertyInt("EntityID", 0);
		}
		return ret;
	}

/*=====================================================*/
} // class cEGSession

/*====================================================*/
}  //namespace EasyGrants.Web