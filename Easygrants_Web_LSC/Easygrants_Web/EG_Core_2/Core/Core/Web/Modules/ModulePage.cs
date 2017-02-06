using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Collections;
using System.IO;
using Core.Util;
using Core.Web.Navigation;
using Core.DataAccess.XMLAccess;
using Core.User;
using Core.Web.User;
using Core.DataAccess;

namespace Core.Web.Modules {
/*====================================================*/

///<summary>
///navigation between and within modules - maps page, finds necessary page controls
///</summary>
public class cModulePage : cCorePage 
{
/*====================================================*/

	//Interface AutoWireUp declarations
	protected HtmlGenericControl	spnConfigXML;
	protected HtmlForm				frmMain; //if keep, move to Corepage, and setup in load w/ find?

/*====================================================*/

	public const String		kModuleConfigKey = "Config";
	
	private cXMLDoc			mPageConfigDoc; //XmlDoc containing Xml from spnConfigXML on this .aspx
	private cXMLDoc			mModuleConfigDoc;
	protected UserControl	mPageFrameCtl;
	protected UserControl	mPageContentCtl;
	protected String		mCurrentModuleName;
	protected String		mPageTitle = "";
	
	/*--------------------------------------------------------*/

	protected int TimeOut
	{
		get {
			cXMLDoc aWebConfigDoc = new cXMLDoc(this.WebSession.DataObjectFactory.Appl.RootFileSystemPath + "/Web.config");
			int aTimeOut = cXMLDoc.AttributeToInt(aWebConfigDoc.DocElement.SelectSingleNode("system.web/sessionState"), "timeout", 0);
					
			return aTimeOut;
		}
	}

	/*-------------------------------------------------------------*/

	public String PageTitle 
	{
		get {return mPageTitle;}
		set {mPageTitle = ConfigurableText(value);}
	}
    
	/*----------------------------------------------------*/

	public cModulePage ModulePage 
	{
		get {return (cModulePage)this;}
	}

/*----------------------------------------------------*/

	public String CurrentModuleName {
		get {return mCurrentModuleName = cXMLDoc.AttributeToString(ModuleNode, "ModuleName");}
	}
		
/*----------------------------------------------------*/

	public cXMLDoc PageConfigDoc {
		get {
			if (mPageConfigDoc == null) {
				if (spnConfigXML != null) {
					mPageConfigDoc = new cXMLDoc();
					
					mPageConfigDoc.LoadFromXML(spnConfigXML.InnerText);
					if (mPageConfigDoc.DocElement == null) {
						mPageConfigDoc = null;
					}
				}
			}
			
			return mPageConfigDoc;
		}
	}
	
/*----------------------------------------------------*/

	public String PageFrameKey {
		get {
			String	aKey = Request.QueryString["PageFrame"];
			
			if (aKey != null) return aKey;
			
			return cXMLDoc.AttributeToString(ModuleNode, "DefaultPageFrameKey");
		}
	}
	
/*----------------------------------------------------*/

	public UserControl PageContentCtl {
		get {return mPageContentCtl;}
	}
	
/*----------------------------------------------------*/

	public String PageKey {
		get {return Request.QueryString["Page"];}
	}

/*----------------------------------------------------*/

	public String PageURL {
		get {return ModulePage_BuildPageKeyURL(PageKey);}
	}
	
/*----------------------------------------------------*/

	public cXMLDoc ModuleConfigDoc {
		get {
			if (mModuleConfigDoc == null) {
				String	aConfigFile = Request.QueryString[kModuleConfigKey];
				String	aPath = Get_ConfigurationPath(aConfigFile);
				
				mModuleConfigDoc = new cXMLDoc();
				if (mModuleConfigDoc.Load(Server.MapPath(aPath + aConfigFile))) {
					FileInfo aClientModuleConfigFI = new FileInfo(Server.MapPath(aPath + "Client" + aConfigFile + ".config"));
					if (aClientModuleConfigFI.Exists) {
						cXMLDoc aClientModuleConfigDoc = new cXMLDoc(Server.MapPath(aPath + "Client" + aConfigFile));
						MergeConfigDocs(aClientModuleConfigDoc, "Navigation");
						MergeConfigDocs(aClientModuleConfigDoc, "Pages");
					}
				}
				else {
				//if there is no Module Config file to load, then check the database for configuration
					mModuleConfigDoc = WebSession.LoadModuleConfigXmlFromDB(aConfigFile);
				}
			}
			
			return mModuleConfigDoc;
		}
		set {
			mModuleConfigDoc = value;
		}
	}
	
	/// <summary>
	/// This method merges the client module config into that of baseline. 
	/// Any client module config that needs to be merged should be named "Client[baseline module config name]"
	/// and present in the same path. Ex: ClientModuleConfig.config for a client version of staff module config
	/// </summary>
	/// <param name="mModuleConfigDoc"></param>
	/// <param name="mClientModuleConfigDoc"></param>
	public void MergeConfigDocs(cXMLDoc aClientModuleConfigDoc, string aParentNodeName) {
		//Get the Navigation Node or the Pages Node
		XmlNode aClientModuleNode = aClientModuleConfigDoc.XMLDocument.SelectSingleNode("//Module");
		XmlNode aBaselineModuleNode = mModuleConfigDoc.XMLDocument.SelectSingleNode("//Module");
		XmlNode aClientParentNode = aClientModuleNode.SelectSingleNode("//" + aParentNodeName);
		XmlNode aBaselineParentNode = aBaselineModuleNode.SelectSingleNode("//" + aParentNodeName);
		string aParentBaselineRelation = cXMLDoc.AttributeToString(aClientParentNode, "Baseline", "Append");
		if (aParentBaselineRelation == "Override") {
			XmlNode aClientParentNodeToBeCopied = mModuleConfigDoc.XMLDocument.ImportNode(aClientParentNode, true);
			aBaselineModuleNode.ReplaceChild(aClientParentNodeToBeCopied, aBaselineModuleNode.SelectSingleNode("//" + aParentNodeName));
		}
		else 
		{
			//loop thru the NavElement or the Page nodes
			foreach (XmlNode aChildNode in aClientParentNode.ChildNodes)
			{
				string aChildBaselineRelation = cXMLDoc.AttributeToString(aChildNode, "Baseline", "Override");
				string aChildNodeName = aChildNode.Name;
				string aChildNodeKeyValue = cXMLDoc.AttributeToString(aChildNode, "Key");
				XmlNode aClientChildNodeToBeCopied = mModuleConfigDoc.XMLDocument.ImportNode(aChildNode, true);
				
				//Here if the NavElement contains Child NavElement , then if block will be executed. Some of the examples are Administration and Reviews
				//and the else block will be executed when the Navelement doesn;t contains any further child elements.
				if (aChildNode.HasChildNodes)
				{
					
					if (aChildBaselineRelation == "Append" || (aChildBaselineRelation == "Override" && cXMLDoc.FindNode(aBaselineParentNode, aChildNodeName, "Key", aChildNodeKeyValue) == null))
					{
						//Here we are looping the GrandChilNavelements.
						foreach (XmlNode aGrandChildNode in aChildNode.ChildNodes)
						{
							String aGrandChildRelation = cXMLDoc.AttributeToString(aGrandChildNode, "Baseline", "Override");
							String aGrandChildNodeName = aGrandChildNode.Name;
							String aGrandChildNodeKeyValue = cXMLDoc.AttributeToString(aGrandChildNode, "Key");
							XmlNode aGrandClientChildNodeToBeCopied = mModuleConfigDoc.XMLDocument.ImportNode(aGrandChildNode, true);
							
							String aGrandChildInsertAfter = cXMLDoc.AttributeToString(aGrandChildNode, "InsertAfter");
							XmlNode aBasParentNode = aBaselineParentNode.SelectSingleNode("//Navigation/" + aChildNodeName + "[@Key" + "='" + aChildNodeKeyValue + "']");
							XmlNode aBaselineNodeToBeCopiedAfter = aBaselineParentNode.SelectSingleNode("//" + aChildNodeName + "[@Key" + "='" + aGrandChildInsertAfter + "']");


							if (aGrandChildRelation == "Append" || (aGrandChildRelation == "Override" && cXMLDoc.FindNode(aBasParentNode, aGrandChildNodeName, "Key", aGrandChildNodeKeyValue) == null))
							{
								aBasParentNode.InsertAfter(aGrandClientChildNodeToBeCopied, aBaselineNodeToBeCopiedAfter);
							}
							else if (aGrandChildRelation == "Override")
							{
								aBasParentNode.ReplaceChild(aGrandClientChildNodeToBeCopied, cXMLDoc.FindNode(aBasParentNode, aGrandChildNodeName, "Key", aGrandChildNodeKeyValue));
							}
							
						}
					}
					else
						aBaselineParentNode.ReplaceChild(aClientChildNodeToBeCopied, cXMLDoc.FindNode(aBaselineParentNode, aChildNodeName, "Key", aChildNodeKeyValue));
						
				}
				else
				{
					string aChildInsertAfter = cXMLDoc.AttributeToString(aChildNode, "InsertAfter");
					XmlNode aBaselineNodeToBeCopiedAfter = aBaselineParentNode.SelectSingleNode("//" + aChildNodeName + "[@Key" + "='" + aChildInsertAfter + "']");
								
					if (aChildBaselineRelation == "Append" || (aChildBaselineRelation == "Override" && cXMLDoc.FindNode(aBaselineParentNode, aChildNodeName, "Key", aChildNodeKeyValue) == null)) {
						aBaselineParentNode.InsertAfter(aClientChildNodeToBeCopied, aBaselineNodeToBeCopiedAfter);
					} 
					else if (aChildBaselineRelation == "Override") {
						aBaselineParentNode.ReplaceChild(aClientChildNodeToBeCopied, cXMLDoc.FindNode(aBaselineParentNode, aChildNodeName, "Key", aChildNodeKeyValue));
					}
				}
			}
		}
	}

/*----------------------------------------------------*/

	public XmlNode ModuleNode {
		get {return ModuleConfigDoc.DocElement.SelectSingleNode("Module");}
	}
	
/*----------------------------------------------------*/

	public String ModuleDefaultPageKey {
		get {
			return cXMLDoc.AttributeToString(ModuleNode, "DefaultPageKey");
		}
	}
	
/*----------------------------------------------------*/

	public XmlNode PageNode {
		get {
			return cXMLDoc.FindNode(ModuleNode, "descendant::Page", "Key", PageKey);
		}
	}
		
/*----------------------------------------------------*/

	public XmlNode ValidationNode {
		get {return ModuleNode.SelectSingleNode("Validation");}
	}	
/*----------------------------------------------------*/

	public String UserClassName {
		get {
			return cXMLDoc.AttributeToString(ModuleNode, "UserClass");
		}
	}
		
/*----------------------------------------------------*/

	public cWebUser ModuleUser {
		get {
			XmlNode		aClassNode;
			
			aClassNode = cXMLDoc.FindNode(ModuleNode, "Class", "Name", UserClassName);
			return (cWebUser)WebSession.User(aClassNode);
		}
	}
	
/*----------------------------------------------------*/

	 public bool UserLoggedIn {
        get {
			if(ModuleUser != null) {
				if (ModuleUser.Authorized == true)
					return true;
			}
            return false;
        }
	}

/*====================================================*/

	protected String Get_ConfigurationPath(String aConfigKey) {
		cXMLDoc		aPageConfigDoc = PageConfigDoc;
		String		aPath = "";
		
		//code works for this page, but fails if trying to load config w/ only:
		//* config key
		if (aPageConfigDoc != null) {
			XmlNode		aConfigurationNode;
		
			aConfigurationNode = cXMLDoc.FindNode(aPageConfigDoc.DocElement,
											"Configurations/Configuration", "Key",
											aConfigKey);
			if (aConfigurationNode != null)
				aPath = cXMLDoc.AttributeToString(aConfigurationNode, "Path", "");
		}
		
		return aPath;
	}

/*====================================================*/

	public String ModulePage_BuildPageKeyURL(String aModuleName, String aModuleConfig, String aPageName,
				String aPageKey, String aQueryString) {

		return WebAppl.Get_ModuleRoot(aModuleName) + "/" + aModuleName + "/" + 
				(aPageName == "" ? aModuleName + "ModuleContent.aspx" : aPageName) + 
				"?Config=" + aModuleConfig + "&Page=" + aPageKey + 
				(aQueryString == "" ? "" : "&" + aQueryString);
	}
		
/*----------------------------------------------------*/

	public String ModulePage_BuildPageKeyURL(String aPageKey) {
		return Request.Url.AbsolutePath + "?Config=" + Request.QueryString["Config"] + "&Page=" + aPageKey;
	}

/*----------------------------------------------------*/

	public String ModulePage_BuildPageKeyURL(String aPath, String aPageKey) {
		return aPath + "&Page=" + aPageKey;
	}
		
/*----------------------------------------------------*/

	public void ModulePage_RedirectToPageKey(String aPageKey) {
		Response.Redirect(ModulePage_BuildPageKeyURL(aPageKey));
	}

/*----------------------------------------------------*/

	public void ModulePage_RedirectToPageKey(String aPageKey, String aQueryStr1) {
		
		Response.Redirect(cWebLib.AddQuerystringParameter(ModulePage_BuildPageKeyURL(aPageKey), aQueryStr1, Server));
	}

/*----------------------------------------------------*/

	public void ModulePage_RedirectToModule(String aModuleName, String aModuleConfig, String aPageName, String aPageKey) {
		ModulePage_RedirectToModule(aModuleName, aModuleConfig, aPageName, aPageKey, "");
	}

/*----------------------------------------------------*/

	public void ModulePage_RedirectToModule(String aModuleName, String aModuleConfig, String aPageName, String aPageKey, String aQueryString) {
		if (Request.QueryString["Config"] != null) {
			//add module state if module state does not exist for current module
			//if (WebSession.ModuleState(CurrentModuleName) == null) {
				cModuleState aModuleState = new cModuleState();
				
				aModuleState.Load(this);
				WebSession.Add_ModuleState(CurrentModuleName, aModuleState);
			//}
		}
		
		Response.Redirect(ModulePage_BuildPageKeyURL(aModuleName, aModuleConfig, aPageName, aPageKey, aQueryString));
	}
	
/*----------------------------------------------------*/

	public void ModulePage_RedirectToModule(XmlNode aModuleNode) {
		ModulePage_RedirectToModule(aModuleNode, "", "");
	}
	
/*----------------------------------------------------*/

	public void ModulePage_RedirectToModule(XmlNode aModuleNode, String aPageKey, String aQueryString) {
		String       aModuleName;
		String       aPageName;
		String       aModuleConfig;
			
		aModuleName =cXMLDoc.AttributeToString(aModuleNode, "ModuleName");
		aPageName =cXMLDoc.AttributeToString(aModuleNode, "PageName");
		aModuleConfig =cXMLDoc.AttributeToString(aModuleNode, "ModuleConfig");
		if(aPageKey == "")
			aPageKey = cXMLDoc.AttributeToString(aModuleNode, "DefaultPageKey");
		
		ModulePage_RedirectToModule(aModuleName, aModuleConfig, aPageName, aPageKey, aQueryString);
		
	}

/*----------------------------------------------------*/

	public void ModulePage_RedirectToModule(cXMLDoc aModuleDoc) {
	
		XmlNode      aModuleNode;
			
		aModuleNode = aModuleDoc.DocElement.SelectSingleNode("Module");
		ModulePage_RedirectToModule(aModuleNode);
	}
	

/*----------------------------------------------------*/

	public void ModulePage_RedirectToModule(cXMLDoc aModuleDoc, String aPageKey, String aQueryString) {
		XmlNode      aModuleNode;
			
		aModuleNode = aModuleDoc.DocElement.SelectSingleNode("Module");
		ModulePage_RedirectToModule(aModuleNode, aPageKey, aQueryString);
	}
/*====================================================*/

	public String ModulePage_GetTitle(String aPageKey) {
		XmlNode		aPageNode = cXMLDoc.FindNode(ModuleNode, "descendant::Page", "Key", aPageKey);
		
		if (aPageNode == null)
			return "";
			
		return ConfigurableText(cXMLDoc.AttributeToString(aPageNode, "PageTitle"));
	}
	
/*----------------------------------------------------*/

	public String ModulePage_GetTitle() {
		XmlNode		aPageNode = PageNode;
		
		if (PageTitle == "")
		{
			if (aPageNode == null)
				return "";
				
			return ConfigurableText(cXMLDoc.AttributeToString(aPageNode, "PageTitle"));
		}
		return PageTitle;
	}
	
/*----------------------------------------------------*/

	public String ModulePage_GetModuleDescriptiveName() {
		String		aName;
		
		aName = cXMLDoc.AttributeToString(ModuleNode, "DescriptiveName");
		if (aName == "")
			aName = cXMLDoc.AttributeToString(ModuleNode, "ModuleName");
		
		return ConfigurableText(aName);
	}
	
/*====================================================*/
	
	public virtual void LoadPageContent_NotFound() {
		Response.Redirect(WebAppl.LogoutURL);
	}
	
/*----------------------------------------------------*/

	public bool LoadPageContent_FromXML() {
		XmlNode		aPageNode;
		
		aPageNode = PageNode;
		if (aPageNode == null)
			return false;
		
		PageNavKey = cXMLDoc.AttributeToString(aPageNode, "NavKey");
		PageHorizNavKey = cXMLDoc.AttributeToString(aPageNode, "HorizNavKey");

		Control	aPgContentTDCell;

		aPgContentTDCell = mPageFrameCtl.FindControl("tdPageContent");
		mPageContentCtl = CorePage_LoadControl(WebAppl.Build_RootURL(cXMLDoc.AttributeToString(aPageNode, "ContentCtl")),
								"ctlPageContent", aPgContentTDCell);
		return true;
	}
	
/*----------------------------------------------------*/

	public virtual bool LoadPageContent() {
		switch (cXMLDoc.AttributeToString(ModuleNode, "PageContent")) {
			case "XML:Pages" :
				if (LoadPageContent_FromXML()) return true;
				break;
			default :
				return false;
		}
		
		LoadPageContent_NotFound();
		return false;
	}

/*----------------------------------------------------*/

	public virtual void LoadPageFrameControl() {
		String	aPath;
		XmlNode	aXMLNode;
		
		aXMLNode = cXMLDoc.FindNode(ModuleNode, "PageFrames/PageFrame", "Key", PageFrameKey);
		
		aPath = WebAppl.Build_RootURL(cXMLDoc.AttributeToString(aXMLNode, "PageFrameCtl"));
		mPageFrameCtl = CorePage_LoadControl(aPath,
								"mPageFrameCtl", frmMain);
	}

/*----------------------------------------------------*/

	public UserControl LoadHeaderFooterControl(String aAttribute, String aID, String aParentID) {
		UserControl aCtl;
		String		aPath;
		
		aPath = cXMLDoc.AttributeToString(ModuleNode, aAttribute);
		
		if (aPath == "") {
			XmlNode		aApplNode = WebAppl.Get_ApplNode();
			XmlNode		aModulesNode = aApplNode.SelectSingleNode("Modules");
			
			aPath = cXMLDoc.AttributeToString(aModulesNode, aAttribute);
			if (aPath == "") return null;
		}
		
		aPath = WebAppl.Build_RootURL(aPath);
		aCtl = CorePage_LoadControl(aPath,
					aID, mPageFrameCtl.FindControl(aParentID));
					
		return aCtl;
	}

/*----------------------------------------------------*/

	public  virtual void LoadHeaderFooterControls() {
		//LoadHeaderFooterControl("ModuleStyle", "mModuleStyle", "tdCompetitionStyle");
		LoadHeaderFooterControl("CompetitionHeader", "mCompetitionHeader", "tdCompetitionHeader");
		LoadHeaderFooterControl("CompetitionFooter", "mCompetitionFooter", "tdCompetitionFooter");

		LoadHeaderFooterControl("ModuleHeader", "mModuleHeader", "tdModuleHeader");
		LoadHeaderFooterControl("ModuleFooter", "mModuleFooter", "tdModuleFooter");
	}

/*====================================================*/

	public virtual void Validate_ModuleUser_MasterNavElement() {
		if (ModuleUser.MasterNavElement == null) {
			//auto-load navigation if necessary
			ModuleUser.MasterNavElement = new cXMLNavElement(true);
			((cXMLNavElement)ModuleUser.MasterNavElement).XMLNavElement_Load(ModuleNode.SelectSingleNode("descendant::Navigation"));
		}	
	}
	
/*----------------------------------------------------*/

	public void Validate_Staff_NavigationItem() {
		if (ModuleUser.MasterNavElement != null) {
			cNavElement		aStaffNavElement = ModuleUser.MasterNavElement.Find_ChildElement("Staff");
		
			if (aStaffNavElement != null){
				if (WebSession.HasStaffUser && ModuleUser.UserID != WebSession.StaffUserID)
				{
					aStaffNavElement.Visible = true;
					aStaffNavElement.Enabled = true;
					aStaffNavElement.SourceFile = "Core/Controls/Base/scrpRedirectToModule.aspx?RedirectModuleName=Staff";
				}
				else
					aStaffNavElement.Visible = false;
			}
		}
	}
	
	/*----------------------------------------------------*/

	public void Validate_Admin_NavigationItem() 
	{
		if (ModuleUser.MasterNavElement != null) 
		{
			XmlNodeList aNodeList = ModuleNode.SelectNodes("AdminNavigation/NavElement");
			
			foreach (XmlNode aNode in aNodeList)
			{
				Set_Admin_NavigationItem(cXMLDoc.AttributeToString(aNode, "Key"));
			}
		}
	}
	
	/*----------------------------------------------------*/

	private void Set_Admin_NavigationItem(string aNav) 
	{
		cNavElement		aAdminNavElement = ModuleUser.MasterNavElement.Find_ChildElement(aNav);
	
		if (aAdminNavElement != null) 
		{
			if (WebSession.HasAdminUser) 
			{
				aAdminNavElement.Visible = true;
				aAdminNavElement.Enabled = true;
			}
			else
				aAdminNavElement.Visible = false;
		}
	}
	
	/*----------------------------------------------------*/

	private String ReturnHomeModuleDefaultPageKey() 
	{
		XmlNode	aApplNode = WebAppl.Get_ApplNode();
		XmlNode	aModulesNode = cXMLDoc.FindNode(aApplNode, "Modules/Module", "Key", "Home");
		String aModuleConfigName = cXMLDoc.AttributeToString(aModulesNode, "ConfigFile");
		cXMLDoc aModuleConfigDoc = new cXMLDoc();
		aModuleConfigDoc.Load(Server.MapPath(Get_ConfigurationPath(aModuleConfigName) + aModuleConfigName));
		XmlNode ModuleNode = aModuleConfigDoc.DocElement.SelectSingleNode("Module");
		String aDefaultPageKey = cXMLDoc.AttributeToString(ModuleNode, "DefaultPageKey");
		return aDefaultPageKey;
	}
		
	/*----------------------------------------------------*/

	public void Validate_ReturnHome_NavigationItem() 
	{
		if (ModuleUser.MasterNavElement != null) {
			cNavElement		aReturnHomeNavElement = ModuleUser.MasterNavElement.Find_ChildElement("ReturnHome");
		
			if (aReturnHomeNavElement != null) {
				cModuleState aModuleState  = WebSession.ModuleState("Home");
				if (aModuleState == null && WebSession.HasStaffUser)
					aModuleState = WebSession.ModuleState("Staff");	
				if (aModuleState != null) {
				//WebSession.Remove_ModuleState("Home");
					aReturnHomeNavElement.Visible = true;
					aReturnHomeNavElement.Enabled = true;
					aReturnHomeNavElement.SourceFile = WebAppl.Remove_RootFromURL(aModuleState.LastURL);
					String aDefaultPageKey = ReturnHomeModuleDefaultPageKey();
					aReturnHomeNavElement.SourceFile = cWebLib.AddQuerystringParameter(aReturnHomeNavElement.SourceFile, "Page", aDefaultPageKey);
				}
				else
					aReturnHomeNavElement.Visible = false;
			}
		}
	}

/*----------------------------------------------------*/

	public void Validate_Logout_NavigationItem()
	{
		if (ModuleUser.MasterNavElement != null)
		{
			cNavElement aLogoutNavElement = ModuleUser.MasterNavElement.Find_ChildElement("Logout");

			if (aLogoutNavElement != null)
			{
				cModuleState aModuleState = WebSession.ModuleState("Home");
				if (aModuleState == null && WebSession.HasStaffUser)
					aModuleState = WebSession.ModuleState("Staff");
				if (aModuleState != null)
				{
					aLogoutNavElement.SourceFile = WebAppl.Remove_RootFromURL(aModuleState.LastURL);					
					aLogoutNavElement.SourceFile = cWebLib.AddQuerystringParameter(aLogoutNavElement.SourceFile, "Page", aLogoutNavElement.Key);
				}
			}
		}
	}

/*----------------------------------------------------*/
	

	public void Validate_Help_NavigationItem() {
		if (ModuleUser.MasterNavElement != null) {
			cNavElement		aCurNavElement = ModuleUser.MasterNavElement.Find_ChildElement(PageNavKey);
			
			if (aCurNavElement != null) {
				cNavElement		aHelpNavElement = ModuleUser.MasterNavElement.Find_ChildElement("Help");
				
				if (aHelpNavElement != null)
					aHelpNavElement.Visible = (aCurNavElement.HelpFile.ToString() != "");
			}
		}	
	}
	
/*----------------------------------------------------*/
//hides navigation item if it does not apply to ModuleUser's person roles
	public void Validate_PersonRole_NavigationItem() {
		XmlNodeList aNavigationNodeList;
		XmlNodeList aRolesNodeList;
		cNavElement		aCurNavElement;
		bool aBool;
		
		aNavigationNodeList = ModuleNode.SelectNodes("Navigation/NavElement");
		foreach(XmlNode aNavElementNode in aNavigationNodeList) {
		
			aBool = false;
			aRolesNodeList = aNavElementNode.SelectNodes("PersonRole");
			if (aRolesNodeList.Count != 0) {
				foreach(XmlNode aRoleNode in aRolesNodeList) {
				
					foreach (cDataObject aDataObject in ModuleUser.PersonRoles){
						if(aDataObject.GetPropertyInt("WfTaskRoleID") == cXMLDoc.AttributeToInt(aRoleNode, "Key")){
							aBool = true;
							break;
						}
					}
				}
				//if current user does not have a valid role for the navigation element, set visible=false
				if (aBool == false) {
					aCurNavElement = ModuleUser.MasterNavElement.Find_ChildElement(cXMLDoc.AttributeToString(aNavElementNode, "Key"));
					if (aCurNavElement != null) {
						aCurNavElement.Visible = false;
					}
				}
			}
		}
	}	
/*----------------------------------------------------*/

	public virtual void Validate_Navigation() {
		if (ModuleUser.MasterNavElement == null) {
			Validate_ModuleUser_MasterNavElement();
			if (ModuleUser.MasterNavElement == null) return;
		}	

		//ModuleUser.MasterNavElement.NavElement_Enable(false, true);
		
		ModuleUser.MasterNavElement.HideChildren();
		cNavElement		aCurNavElement = ModuleUser.MasterNavElement.Find_ChildElement(this.PageNavKey);
		if (aCurNavElement != null)
			aCurNavElement.Show(true, true);
		
		Validate_PersonRole_NavigationItem();
		Validate_Help_NavigationItem();
		Validate_Staff_NavigationItem();
		Validate_Admin_NavigationItem();
		Validate_ReturnHome_NavigationItem();
		Validate_Logout_NavigationItem();
	}

/*----------------------------------------------------*/

	public void ValidateContentControlForSubmitted(bool aSubmitted) {
		if (aSubmitted){ //if task is completed
			if(PageNode.Attributes["AfterSubmitContentCtl"] != null)
				PageNode.Attributes["ContentCtl"].Value=PageNode.Attributes["AfterSubmitContentCtl"].Value;
		}
	}

/*----------------------------------------------------*/

	public void ValidateNavigationForSubmitted(bool aSubmitted) {

		if (!WebSession.HasStaffUser) {
			if (aSubmitted)
				ModuleUser.MasterNavElement.NavElement_FirstLevel_ValidateForSubmitted();
			else
				ModuleUser.MasterNavElement.NavElement_FirstLevel_ValidateForUnSubmitted();
		}
	}

/*====================================================*/

	public override void CorePage_Load(Object aSrc, EventArgs aEvent) {
		base.CorePage_Load(aSrc, aEvent);
		
		if (ModuleUser == null) Response.Redirect(WebAppl.LogoutURL);
		LoadPageFrameControl();
		LoadHeaderFooterControls();
		LoadPageContent();
		Validate_Navigation();
	}

/*=====================================================*/
} // class cModulePage


/*====================================================*/
}  //namespace Core.Web.Modules
