using System;
using System.Collections;
using Core.User;
using Core.Web.User;
using Core.DataAccess;
using Core.Web.Modules;
using System.Xml;
using Core.DataAccess.XMLAccess;

namespace Core.Web {
/*====================================================*/

///<summary>
///Web session data container
///</summary>
public class cWebSession 
{
/*====================================================*/

	private cWebAppl		mWebAppl;
	
	private Hashtable		mUsers;
	private Hashtable		mModuleStates;
	
	private Hashtable		mPageParams;
	
	private cDataObjectFactory		mDataObjectFactory;
	
	private cCorePage mCurrentPage;
	private String mCurrentUrl;
	
	private Exception mCurrentException;
	private bool mDebugSwitchEnabled;
	
	/*-----------------------------------------------------*/

	public cWebAppl WebAppl 
	{
		get {return mWebAppl;}
	}
	
/*-----------------------------------------------------*/

	public Hashtable Users {
		get {return mUsers;}
	}
	
/*-----------------------------------------------------*/

	public Hashtable ModuleStates {
		get {return mModuleStates;}
	}

/*-----------------------------------------------------*/

	public Hashtable PageParams {
		get {
		if(mPageParams == null)
			mPageParams = new Hashtable();
			
		return mPageParams;
		}
	}
	
/*-----------------------------------------------------*/

	public cCorePage CurrentPage {
		get {return mCurrentPage;}
		set {mCurrentPage = value;}
	}
	
/*-----------------------------------------------------*/

	public Exception CurrentException {
		get {return mCurrentException;}
		set {mCurrentException = value;}
	}
	
/*-----------------------------------------------------*/

	public String CurrentUrl {
		get {return mCurrentUrl;}
		set {mCurrentUrl = value;}
	}

/*-----------------------------------------------------*/
	///<summary>
	///Accessor for new data object creation, modification, and deletion
	///</summary>
	public cDataObjectFactory DataObjectFactory 
	{
		get {return mDataObjectFactory;}
	}

	/*-----------------------------------------------------*/

	public bool HasStaffUser 
	{
		get {			
			if (Users != null)
				foreach (DictionaryEntry aEntry in Users) {
					cWebUser	aUser = (cWebUser)aEntry.Value;
					
					if (aUser.AccessLevel >= (int)AccessLevels.AccLev_Staff) return true;
				}
				
			return false;
		}
	}

	/*-----------------------------------------------------*/
	public int StaffUserID
	{
		get
		{
			if (Users != null)
				foreach (DictionaryEntry aEntry in Users)
				{
					cWebUser aUser = (cWebUser)aEntry.Value;

					if (aUser.AccessLevel >= (int)AccessLevels.AccLev_Staff) return aUser.UserID;
				}

			return 0;
		}
	}

	/*-----------------------------------------------------*/
	public bool HasAdminUser 
	{
		get 
		{			
			if (Users != null)
				foreach (DictionaryEntry aEntry in Users) 
				{
					cWebUser	aUser = (cWebUser)aEntry.Value;
					
					if (aUser.AccessLevel > (int)AccessLevels.AccLev_Staff) return true;
				}
				
			return false;
		}
	}

	/*-----------------------------------------------------*/	

	public bool DebugSwitchEnabled 
	{
		get { return mDebugSwitchEnabled; }
		set { mDebugSwitchEnabled = value; }
	}
	
/*-----------------------------------------------------*/

	public cWebSession(cWebAppl aWebAppl) {
//		if (aWebAppl.DataDefinitionChanged == true)
//		{
//			aWebAppl.DataDefinitionDoc = aWebAppl.BuildDataDefinitionFromDB(aWebAppl.HttpApp, aWebAppl.DataDefinitionDoc);
//			aWebAppl.DataDefinitionChanged = false;
//		}
		mWebAppl = aWebAppl;
		DebugSwitchEnabled = WebAppl.DebugSwitchEnabled;
		mDataObjectFactory  = new cDataObjectFactory(aWebAppl, aWebAppl.DataDefinitionDoc);
	}
	
/*====================================================*/

	public String Get_UniqueHashKey_From_ClassNode(XmlNode aClassNode) {
		return cXMLDoc.AttributeToString(aClassNode, "Name", "") + 
					cXMLDoc.AttributeToString(aClassNode, "UniqueHashKey", "");
	}
	
/*-----------------------------------------------------*/

	public cWebUser User(String aClassName) {
		if (Users == null) return null;
		return (cWebUser)Users[aClassName];
	}

/*-----------------------------------------------------*/

	public cWebUser User(XmlNode aClassNode) {
		if (Users == null) return null;

		String aClassName = Get_UniqueHashKey_From_ClassNode(aClassNode);
		return User(aClassName);
	}

/*-----------------------------------------------------*/

	protected void Remove_User(String aUniqueHashKey) {
		if (Users == null) return;
		
		cWebUser	aExistUser = User(aUniqueHashKey);
		if (aExistUser != null) {
			Users.Remove(aUniqueHashKey);
			aExistUser = null;
		}
	}
	
/*-----------------------------------------------------*/

	public void Add_User(XmlNode aClassNode, cUser aUser) {
		String	aUniqueHashKey = Get_UniqueHashKey_From_ClassNode(aClassNode);
		
		if (Users == null)
			mUsers = new Hashtable();
		else
			Remove_User(aUniqueHashKey);
		
		Users.Add(aUniqueHashKey, aUser);
		
		if (aUniqueHashKey != "cEGPublicUser" && mDataObjectFactory.User == null)
			mDataObjectFactory.User = aUser;
	}
	
/*-----------------------------------------------------*/

	public void Remove_All_NonStaff_Users() {
		if (Users != null) {
			bool	aFoundUserFlag = true;
			
			while (aFoundUserFlag) {
				aFoundUserFlag = false;
				
				foreach (DictionaryEntry aEntry in Users) {
					cWebUser		aUser;
					
					aUser = (cWebUser)aEntry.Value;
					if (aUser.AccessLevel < (int)AccessLevels.AccLev_Staff) {
						Remove_User(aEntry.Key.ToString());
						aFoundUserFlag = true;
						break;
					}
				}
			}
		}
	}
	
/*====================================================*/
/*
	method to logout all users in WebSession
	* replaces Session.Abandon
*/
	public virtual void LogoutAllUsers() {
		
		if (Users != null) {
			Users.Clear();
			//foreach (DictionaryEntry aEntry in Users)
				//((cWebUser)aEntry.Value).Logout();
		
			mUsers = null;
		}
		mCurrentPage.Session.Abandon();
	}
	
/*====================================================*/

	public cModuleState ModuleState(String aModuleKey) {
		if (ModuleStates == null) return null;
		return (cModuleState)ModuleStates[aModuleKey];
	}

/*-----------------------------------------------------*/

	public void Remove_ModuleState(String aModuleKey) {
		if (ModuleStates == null) return;
			
		cModuleState	aExistModuleState;
		
		aExistModuleState = ModuleState(aModuleKey);
		if (aExistModuleState != null) {
			ModuleStates.Remove(aModuleKey);
			aExistModuleState = null;
		}
	}

/*-----------------------------------------------------*/

	public void Add_ModuleState(String aModuleKey, cModuleState aModuleState) {
		if (ModuleStates == null)
			mModuleStates = new Hashtable();
		else
			Remove_ModuleState(aModuleKey);
			
		ModuleStates.Add(aModuleKey, aModuleState);
	}

/*----------------------------------------------------*/

	public cXMLDoc LoadModuleConfigXmlFromDB(String aModuleConfigName) {
		cDataObject aWfTaskModuleDO = DataObjectFactory.GetDataObjectListWithFilter("WfTaskModule", "ModuleConfigFilename", aModuleConfigName)[0];
		String aWfTaskID = aWfTaskModuleDO.GetPropertyString("WfTaskID");
		String aWfTaskTypeID = aWfTaskModuleDO.GetRelatedPropertyString("WfTask.WfTaskTypeID");
		//cDataObject aWfTaskModuleConfigNavMainDO = null;
		//cDataObject aWfTaskModuleConfigNavReviewDO = null;
		cXMLDoc aModuleConfigXml = new cXMLDoc();
		if (aWfTaskTypeID == "7")
			aModuleConfigXml.LoadFromXML("<EasyGrants><Module><Class></Class><PageFrames></PageFrames><AdminNavigation><NavElement Key='Administration'/></AdminNavigation><Navigation></Navigation><Pages></Pages><Validation><ValidationHeader></ValidationHeader></Validation></Module></EasyGrants>");
		else
			aModuleConfigXml.LoadFromXML("<EasyGrants><Module><Class></Class><PageFrames></PageFrames><Navigation></Navigation><Pages></Pages><Validation><ValidationHeader></ValidationHeader></Validation></Module></EasyGrants>");
		cDataObject aWfTaskModuleConfigDO = DataObjectFactory.GetDataObjectListWithFilter("WfTaskModuleConfig", "WfTaskID", aWfTaskID)[0];
		XmlNode aModuleNode = null;
		if (aWfTaskModuleConfigDO != null) {
			aModuleNode = aModuleConfigXml.DocElement.SelectSingleNode("Module");
			aModuleConfigXml.AddAttribute(aModuleNode, "UserClass", aWfTaskModuleConfigDO.GetPropertyString("UserClass"));
			aModuleConfigXml.AddAttribute(aModuleNode, "PageContent", aWfTaskModuleConfigDO.GetPropertyString("PageContent"));
			aModuleConfigXml.AddAttribute(aModuleNode, "DefaultPageFrameKey", aWfTaskModuleConfigDO.GetPropertyString("DefaultPageFrameKey"));
			aModuleConfigXml.AddAttribute(aModuleNode, "ModuleName", aWfTaskModuleDO.GetPropertyString("ModuleName"));
			aModuleConfigXml.AddAttribute(aModuleNode, "DescriptiveName", aWfTaskModuleDO.GetRelatedPropertyString("WfTask.WfTask"));
			aModuleConfigXml.AddAttribute(aModuleNode, "PageName", aWfTaskModuleConfigDO.GetPropertyString("PageName"));
			aModuleConfigXml.AddAttribute(aModuleNode, "ModuleConfig", aWfTaskModuleDO.GetPropertyString("ModuleConfigFilename"));

			XmlNode aClassNode = aModuleConfigXml.DocElement.SelectSingleNode("//Class");
			aModuleConfigXml.AddAttribute(aClassNode, "Name", aWfTaskModuleConfigDO.GetPropertyString("UserClass"));
			aModuleConfigXml.AddAttribute(aClassNode, "Assembly", aWfTaskModuleConfigDO.GetPropertyString("ClassAssembly"));
			aModuleConfigXml.AddAttribute(aClassNode, "FullName", aWfTaskModuleConfigDO.GetPropertyString("ClassFullname"));
			aModuleConfigXml.AddAttribute(aClassNode, "CopyUser", aWfTaskModuleConfigDO.GetPropertyString("CopyFromUser"));
			aModuleConfigXml.AddAttribute(aClassNode, "UniqueHashKey", aWfTaskModuleConfigDO.GetPropertyString("UniqueHashKey"));
		}

		cDataObjectList aWfTaskModuleConfigPageFramesDOL = DataObjectFactory.GetDataObjectListWithFilter("WfTaskModuleConfigPageFrames", "WfTaskID", aWfTaskID);
		XmlNode aPageFramesNode = aModuleConfigXml.DocElement.SelectSingleNode("//PageFrames");
		foreach (cDataObject aWfTaskModuleConfigPageFramesDO in aWfTaskModuleConfigPageFramesDOL) {
			XmlNode aPageFrameNode = aModuleConfigXml.XMLDocument.CreateNode(XmlNodeType.Element, "PageFrame", "");
			aModuleConfigXml.AddAttribute(aPageFrameNode, "Key", aWfTaskModuleConfigPageFramesDO.GetPropertyString("PageframeKey"));
			aModuleConfigXml.AddAttribute(aPageFrameNode, "PageFrameCtl", aWfTaskModuleConfigPageFramesDO.GetPropertyString("PageframeCtl"));
			aPageFramesNode.AppendChild(aPageFrameNode);
		}

		XmlNode aDataObjectNode, aFiltersNode, aSortNode, aArgNode;
		cXMLDoc aXmlDoc;

		////Get the Main Navigation Element
		//aXmlDoc = DataObjectFactory.CreateDataObjectNode("WfTaskModuleConfigNavElement", out aDataObjectNode, out aFiltersNode);
		//aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aWfTaskID));
		//aArgNode = aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "FormTypeID", "3"));
		//aArgNode.AppendChild(DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "StandardForms"));
		//aWfTaskModuleConfigNavMainDO = DataObjectFactory.GetDataObjectList(aDataObjectNode)[0];

		aFiltersNode = null;
		aXmlDoc = null;
		aDataObjectNode = null;
		aArgNode = null;

		////Get the Review and Submit Navigation Element
		//aXmlDoc = DataObjectFactory.CreateDataObjectNode("WfTaskModuleConfigNavElement", out aDataObjectNode, out aFiltersNode);
		//aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aWfTaskID));
		//aArgNode = aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "FormTypeID", "4"));
		//aArgNode.AppendChild(DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "StandardForms"));
		//aWfTaskModuleConfigNavReviewDO = DataObjectFactory.GetDataObjectList(aDataObjectNode)[0];

		aFiltersNode = null;
		aXmlDoc = null;
		aDataObjectNode = null;
		aArgNode = null;

		//Get the rest of the Navigation Elements
		aXmlDoc = DataObjectFactory.CreateDataObjectNode("WfTaskModuleConfigNavElement", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aWfTaskID));
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ParentNavID", "null", "And"));
		//aFiltersNode.AppendChild(DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("));
		//aArgNode = aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "FormTypeID", "3","And", "NotEqual"));
		//aArgNode.AppendChild(DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "StandardForms"));
		//aArgNode = aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "FormTypeID", "4", "And", "NotEqual"));
		//aArgNode.AppendChild(DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "StandardForms"));
		//aFiltersNode.AppendChild(DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""));
		aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode());
		aSortNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SortOrder", ""));
		cDataObjectList aWfTaskModuleConfigNavElementDOL = DataObjectFactory.GetDataObjectList(aDataObjectNode);

		//if (aWfTaskModuleConfigNavMainDO != null) {
		//    aModuleConfigXml.AddAttribute(aModuleNode, "DefaultPageKey", aWfTaskModuleConfigNavMainDO.GetPropertyString("NavKey"));
		//}
		//else {
			if (aWfTaskModuleConfigNavElementDOL.Count > 0)
				aModuleConfigXml.AddAttribute(aModuleNode, "DefaultPageKey", aWfTaskModuleConfigNavElementDOL[0].GetRelatedPropertyString("StandardForms.PageKey"));
		//}

		if (aWfTaskModuleConfigNavElementDOL != null && aWfTaskModuleConfigNavElementDOL.Count > 0) {
			XmlNode aNavigationNode = aModuleConfigXml.DocElement.SelectSingleNode("//Navigation");
			//XmlNode aValidationHeaderNode = aModuleConfigXml.DocElement.SelectSingleNode("//ValidationHeader");

			if (aWfTaskTypeID != "7") {
				aNavigationNode.AppendChild(CreateNavigationNode(aModuleConfigXml, "ReturnHome", "Home", "True", "False", "True", "", ""));
				aNavigationNode.AppendChild(CreateSeperatorNode(aModuleConfigXml));
				String aGuidelineFile = "";
				aGuidelineFile = aWfTaskModuleDO.GetRelatedPropertyString("WfTask.HelpFile");
				if (aGuidelineFile != "") {
					if (aWfTaskModuleDO.GetRelatedPropertyBool("WfTask.IsExternalHelpURL"))
						aNavigationNode.AppendChild(CreateNavigationNode(aModuleConfigXml, "Guidelines", "Guidelines", "True", "True", "True", "http://" + aGuidelineFile, "Blank"));
					else
						aNavigationNode.AppendChild(CreateNavigationNode(aModuleConfigXml, "Guidelines", "Guidelines", "True", "True", "True", aGuidelineFile, "Blank"));
					aNavigationNode.AppendChild(CreateSeperatorNode(aModuleConfigXml));
				}
			}
			//if (aWfTaskModuleConfigNavMainDO != null) {
			//    AddNavElement(aModuleConfigXml, aWfTaskModuleConfigNavMainDO, aWfTaskModuleDO.GetRelatedPropertyDataObject("WfTask"));
			//}
			foreach (cDataObject aWfTaskModuleConfigNavElementDO in aWfTaskModuleConfigNavElementDOL) {
				//Add the code in the loop into a separate method named 
				AddNavElement(aModuleConfigXml, aWfTaskModuleConfigNavElementDO, aWfTaskModuleDO.GetRelatedPropertyDataObject("WfTask"));
			}
			//if (aWfTaskModuleConfigNavReviewDO != null) {
			//    AddNavElement(aModuleConfigXml, aWfTaskModuleConfigNavReviewDO, aWfTaskModuleDO.GetRelatedPropertyDataObject("WfTask"));
			//}
			aNavigationNode.AppendChild(CreateSeperatorNode(aModuleConfigXml));
			if (aWfTaskTypeID != "7") {
				aNavigationNode.AppendChild(CreateNavigationNode(aModuleConfigXml, "FAQ", "FAQ", "True", "True", "True", "../../../Implementation/Modules/Home/HomeModuleContent.aspx?Config=HomeModuleConfig&Page=FAQPublicView&PageFrame=Print", "Blank"));
				aNavigationNode.AppendChild(CreateSeperatorNode(aModuleConfigXml));
				aNavigationNode.AppendChild(CreateNavigationNode(aModuleConfigXml, "Help", "Help", "True", "True", "True", "", ""));
				aNavigationNode.AppendChild(CreateSeperatorNode(aModuleConfigXml));
				aNavigationNode.AppendChild(CreateNavigationNode(aModuleConfigXml, "Logout", "Log Out", "True", "False", "True", "", ""));
				aNavigationNode.AppendChild(CreateNavigationNode(aModuleConfigXml, "Staff", "Return to Staff Module", "True", "False", "True", "", ""));
			}
		}
		return aModuleConfigXml;
	}

	/*----------------------------------------------------*/

	private void AddNavElement(cXMLDoc aModuleConfigXml, cDataObject aWfTaskModuleConfigNavElementDO, cDataObject aWfTaskDO) {
		XmlNode aNavigationNode = aModuleConfigXml.DocElement.SelectSingleNode("//Navigation");
		XmlNode aValidationHeaderNode = aModuleConfigXml.DocElement.SelectSingleNode("//ValidationHeader");
		if (aWfTaskModuleConfigNavElementDO.GetRelatedPropertyBool("AddSeparatorBefore")) {
			aNavigationNode.AppendChild(CreateSeperatorNode(aModuleConfigXml));
		}
		XmlNode aNavElementNode = aModuleConfigXml.XMLDocument.CreateNode(XmlNodeType.Element, "NavElement", "");
		aModuleConfigXml.AddAttribute(aNavElementNode, "Key", aWfTaskModuleConfigNavElementDO.GetPropertyString("NavKey"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "NavTitle", aWfTaskModuleConfigNavElementDO.GetPropertyString("NavTitle"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "EnabledAfterSubmit", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsEnabledAfterSubmit"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "Enabled", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsEnabled"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "Expanded", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsExpanded"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "DisabledBeforeSubmit", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsDisabledBeforeSubmit"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "External", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsExternal"));
		
		//aModuleConfigXml.AddAttribute(aNavElementNode, "SourceFile", "Implementation/Modules/" + aWfTaskDO.GetRelatedPropertyString("WfTaskModule.ModuleName") + "/ModuleContent.aspx?Config=" + aWfTaskDO.GetRelatedPropertyString("WfTaskModule.ModuleConfigFilename") + "&Page=" + aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("StandardForms.PageKey"));
		String aModuleName = aWfTaskDO.GetRelatedPropertyString("WfTaskModule.ModuleName");
		
		if (aWfTaskDO.GetRelatedPropertyString("WfTaskTypeID") == "5")
		{
			aModuleConfigXml.AddAttribute(aNavElementNode, "SourceFile", "Implementation/Modules/" + aModuleName + "/" + aModuleName + "ModuleContent.aspx?Config=" + aWfTaskDO.GetRelatedPropertyString("WfTaskModule.ModuleConfigFilename") + "&Page=" + aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("StandardForms.PageKey"));
		}
		else
		{
			aModuleConfigXml.AddAttribute(aNavElementNode, "SourceFile", "Implementation/Modules/" + aModuleName + "/ModuleContent.aspx?Config=" + aWfTaskDO.GetRelatedPropertyString("WfTaskModule.ModuleConfigFilename") + "&Page=" + aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("StandardForms.PageKey"));
		}
		
		
		if (aWfTaskModuleConfigNavElementDO.GetPropertyString("HelpFile") != "") {
			if (aWfTaskModuleConfigNavElementDO.GetRelatedPropertyBool("IsExternalHelpURL"))
				aModuleConfigXml.AddAttribute(aNavElementNode, "HelpFile", "http://" + aWfTaskModuleConfigNavElementDO.GetPropertyString("HelpFile"));
			else
				aModuleConfigXml.AddAttribute(aNavElementNode, "HelpFile", aWfTaskModuleConfigNavElementDO.GetPropertyString("HelpFile"));
		}
		aModuleConfigXml.AddAttribute(aNavElementNode, "Horizontal", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsHorizontal"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "SubmissionSection", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsSubmissionSection"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "ActiveOnSelect", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsActiveOnSelect"));
		if (aWfTaskModuleConfigNavElementDO.GetPropertyString("Target") != "") {
			aModuleConfigXml.AddAttribute(aNavElementNode, "Target", aWfTaskModuleConfigNavElementDO.GetPropertyString("Target"));
		}
		
		XmlNode aDataObjectNode, aFiltersNode, aSortNode;
		cXMLDoc aXmlDoc;
		aXmlDoc = DataObjectFactory.CreateDataObjectNode("WfTaskModuleConfigNavElement", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aWfTaskDO.GetPropertyString("WfTaskID")));
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ParentNavID", "null", "And", "NotEqual"));
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ParentNavID", aWfTaskModuleConfigNavElementDO.GetPropertyString("WfTaskModuleConfigNavElementID")));
		
		//****************************************************************
		//aSortNode = aFiltersNode.AppendChild(aXmlDoc.CreateSortNode());
		//****************************************************************
		aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode());
		
		aSortNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SortOrder", ""));
		cDataObjectList aWfTaskModuleConfigChildNavElementDOL = DataObjectFactory.GetDataObjectList(aDataObjectNode);

		//****************************************************************
		//foreach (cDataObject aWfTaskModuleConfigChildNavElementDO in aWfTaskModuleConfigChildNavElementDOL) {
		//    aNavElementNode.AppendChild(CreateNavigationNode(aModuleConfigXml, aWfTaskModuleConfigChildNavElementDO));
		//    AddPageNode(aModuleConfigXml, aWfTaskModuleConfigChildNavElementDO);
		//    XmlNode aChildNavValidationNode = CreateValidateSectionNode(aModuleConfigXml, aWfTaskModuleConfigChildNavElementDO);
		//    if (aChildNavValidationNode != null) {
		//        aValidationHeaderNode.AppendChild(aChildNavValidationNode);
		//    }
		//    //aValidationHeaderNode.AppendChild(CreateValidateSectionNode(aModuleConfigXml, aWfTaskModuleConfigChildNavElementDO));
		//}
		//****************************************************************
		
		aNavigationNode.AppendChild(aNavElementNode);
		AddPageNode(aModuleConfigXml, aWfTaskModuleConfigNavElementDO);
		XmlNode aValidationNode = CreateValidateSectionNode(aModuleConfigXml, aWfTaskModuleConfigNavElementDO);
		if (aValidationNode != null) {
			aValidationHeaderNode.AppendChild(aValidationNode);

			foreach (cDataObject aWfTaskModuleConfigChildNavElementDO in aWfTaskModuleConfigChildNavElementDOL)
			{
				aNavElementNode.AppendChild(CreateNavigationNode(aModuleConfigXml, aWfTaskModuleConfigChildNavElementDO));
				AddPageNode(aModuleConfigXml, aWfTaskModuleConfigChildNavElementDO);
				XmlNode aChildNavValidationNode = CreateValidateSectionNode(aModuleConfigXml, aWfTaskModuleConfigChildNavElementDO);
				if (aChildNavValidationNode != null)
				{
					aValidationHeaderNode.AppendChild(aChildNavValidationNode);
				}

			}

		}
	}

/*----------------------------------------------------*/

	private void AddPageNode(cXMLDoc aModuleConfigXml, cDataObject aWfTaskModuleConfigNavElementDO) {
		//Add Page nodes for the Standard forms ID
		XmlNode aPagesNode = aModuleConfigXml.DocElement.SelectSingleNode("//Pages");
		XmlNode aPageNode = aModuleConfigXml.XMLDocument.CreateNode(XmlNodeType.Element, "Page", "");
		aModuleConfigXml.AddAttribute(aPageNode, "Key", aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("StandardForms.PageKey"));
		aModuleConfigXml.AddAttribute(aPageNode, "NavKey", aWfTaskModuleConfigNavElementDO.GetPropertyString("NavKey"));
		aModuleConfigXml.AddAttribute(aPageNode, "PageTitle", aWfTaskModuleConfigNavElementDO.GetPropertyString("NavTitle"));
		aModuleConfigXml.AddAttribute(aPageNode, "ContentCtl", aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("StandardForms.ControlPath"));
		if (aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("StandardForms.AfterSubmitControlPath") != "")
			aModuleConfigXml.AddAttribute(aPageNode, "AfterSubmitContentCtl", aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("StandardForms.AfterSubmitControlPath"));
		aPagesNode.AppendChild(aPageNode);

		//Add related page (ex: editor pages, pagesection controls, etc) nodes for the form
		cDataObjectList aStandardFormRelatedPagesDOL = aWfTaskModuleConfigNavElementDO.GetRelatedPropertyDataObjectList("StandardForms.StandardFormRelatedPages");
		if (aStandardFormRelatedPagesDOL != null && aStandardFormRelatedPagesDOL.Count > 0) {
			foreach (cDataObject aStandardFormRelatedPagesDO in aStandardFormRelatedPagesDOL) {
				XmlNode aRelatedPageNode = aModuleConfigXml.XMLDocument.CreateNode(XmlNodeType.Element, "Page", "");
				aModuleConfigXml.AddAttribute(aRelatedPageNode, "Key", aStandardFormRelatedPagesDO.GetPropertyString("PageKey"));
				aModuleConfigXml.AddAttribute(aRelatedPageNode, "NavKey", aWfTaskModuleConfigNavElementDO.GetPropertyString("NavKey"));
				aModuleConfigXml.AddAttribute(aRelatedPageNode, "PageTitle", aStandardFormRelatedPagesDO.GetPropertyString("PageTitle"));
				aModuleConfigXml.AddAttribute(aRelatedPageNode, "ContentCtl", aStandardFormRelatedPagesDO.GetPropertyString("ControlPath"));
				if (aStandardFormRelatedPagesDO.GetPropertyString("AfterSubmitControlPath", "") != "")
					aModuleConfigXml.AddAttribute(aRelatedPageNode, "AfterSubmitContentCtl", aStandardFormRelatedPagesDO.GetPropertyString("AfterSubmitControlPath"));
				aPagesNode.AppendChild(aRelatedPageNode);
			}
		}
	}

/*----------------------------------------------------*/

	private XmlNode CreateValidateSectionNode(cXMLDoc aModuleConfigXml, cDataObject aWfTaskModuleConfigNavElementDO) {
		XmlNode aValidationSectionNode = null;
		//if (aWfTaskModuleConfigNavElementDO.GetPropertyString("SubmissionValidation") != "") {
			aValidationSectionNode = aModuleConfigXml.XMLDocument.CreateNode(XmlNodeType.Element, "ValidationSection", "");
			aModuleConfigXml.AddAttribute(aValidationSectionNode, "Key", aWfTaskModuleConfigNavElementDO.GetPropertyString("NavKey"));
			aModuleConfigXml.AddAttribute(aValidationSectionNode, "DisplayName", aWfTaskModuleConfigNavElementDO.GetPropertyString("NavTitle"));
			aModuleConfigXml.AddAttribute(aValidationSectionNode, "PageKey", aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("StandardForms.PageKey"));
			aValidationSectionNode.InnerXml = aWfTaskModuleConfigNavElementDO.GetPropertyString("SubmissionValidation");
		//}
		return aValidationSectionNode;
	}
	
/*----------------------------------------------------*/

	private XmlNode CreateNavigationNode(cXMLDoc aModuleConfigXml, cDataObject aWfTaskModuleConfigNavElementDO) {
		
		XmlNode aNavElementNode = aModuleConfigXml.XMLDocument.CreateNode(XmlNodeType.Element, "NavElement", "");
		aModuleConfigXml.AddAttribute(aNavElementNode, "Key", aWfTaskModuleConfigNavElementDO.GetPropertyString("NavKey"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "NavTitle", aWfTaskModuleConfigNavElementDO.GetPropertyString("NavTitle"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "EnabledAfterSubmit", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsEnabledAfterSubmit"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "Enabled", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsEnabled"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "Expanded", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsExpanded"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "DisabledBeforeSubmit", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsDisabledBeforeSubmit"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "External", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsExternal"));
		
		String aModuleName = aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("WfTask.WfTaskModule.ModuleName");

		if (aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("WfTask.WfTaskTypeID") == "5")
		{
			aModuleConfigXml.AddAttribute(aNavElementNode, "SourceFile", "Implementation/Modules/" + aModuleName + "/" + aModuleName + "ModuleContent.aspx?Config=" + aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("WfTask.WfTaskModule.ModuleConfigFilename") + "&Page=" + aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("StandardForms.PageKey"));
		}
		else{
			aModuleConfigXml.AddAttribute(aNavElementNode, "SourceFile", "Implementation/Modules/" + aModuleName + "/ModuleContent.aspx?Config=" + aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("WfTask.WfTaskModule.ModuleConfigFilename") + "&Page=" + aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("StandardForms.PageKey"));
		}
		
		
		if (aWfTaskModuleConfigNavElementDO.GetPropertyString("HelpFile") != "") {
			if (aWfTaskModuleConfigNavElementDO.GetRelatedPropertyBool("IsExternalHelpURL"))
				aModuleConfigXml.AddAttribute(aNavElementNode, "HelpFile", "http://" + aWfTaskModuleConfigNavElementDO.GetPropertyString("HelpFile"));
			else
				aModuleConfigXml.AddAttribute(aNavElementNode, "HelpFile", aWfTaskModuleConfigNavElementDO.GetPropertyString("HelpFile"));
		}
		aModuleConfigXml.AddAttribute(aNavElementNode, "Horizontal", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsHorizontal"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "SubmissionSection", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsSubmissionSection"));
		aModuleConfigXml.AddAttribute(aNavElementNode, "ActiveOnSelect", aWfTaskModuleConfigNavElementDO.GetPropertyString("IsActiveOnSelect"));
		if (aWfTaskModuleConfigNavElementDO.GetPropertyString("Target") != "") {
			aModuleConfigXml.AddAttribute(aNavElementNode, "Target", aWfTaskModuleConfigNavElementDO.GetPropertyString("Target"));
		}
		
		return aNavElementNode;
	}

	private XmlNode CreateNavigationNode(cXMLDoc aConfigXml, String aKey, String aNavTitle, String aEnabledAfterSubmit, String aExternal, String aEnabled, String aSourceFile, String aTarget) {
		XmlNode aNavElementNode = aConfigXml.XMLDocument.CreateNode(XmlNodeType.Element, "NavElement", "");
		aConfigXml.AddAttribute(aNavElementNode, "Key", aKey);
		aConfigXml.AddAttribute(aNavElementNode, "NavTitle", aNavTitle);
		aConfigXml.AddAttribute(aNavElementNode, "EnabledAfterSubmit", aEnabledAfterSubmit);
		aConfigXml.AddAttribute(aNavElementNode, "External", aExternal);
		aConfigXml.AddAttribute(aNavElementNode, "Enabled", aEnabled);
		aConfigXml.AddAttribute(aNavElementNode, "SourceFile", aSourceFile);
		aConfigXml.AddAttribute(aNavElementNode, "Target", aTarget);
		return aNavElementNode;
	}

	/*----------------------------------------------------*/

	private XmlNode CreateSeperatorNode(cXMLDoc aConfigXml) {
		XmlNode aSeparatorNavElementNode = aConfigXml.XMLDocument.CreateNode(XmlNodeType.Element, "NavElement", "");
		aConfigXml.AddAttribute(aSeparatorNavElementNode, "Key", "Sep1");
		aConfigXml.AddAttribute(aSeparatorNavElementNode, "NavTitle", "(");
		return aSeparatorNavElementNode;
	}

	/*----------------------------------------------------*/

	public cXMLDoc BuildOutcomeConfig(cDataObject aWfProjectTask) {
		cXMLDoc aDoc = new cXMLDoc();
		XmlNode aOutcomesNode;
		XmlNode aOutcomeNode;
		//cDataObject aWfProjectTask = WfTaskAssignmentObject.GetWfProjectTask();

		aDoc.LoadFromXML("<EasyGrants><Outcomes DefaultOutcomeKey='" + aWfProjectTask["DefaultOutcomeID"].ToString() + "'></Outcomes></EasyGrants>");
		aOutcomesNode = aDoc.DocElement.SelectSingleNode("Outcomes");

		//Get all project task outcomes except for the submitted and default outcomes
		cXMLDoc aXmlDoc = new cXMLDoc();
		XmlNode aDataObjectNode, aFiltersNode;
		aXmlDoc = DataObjectFactory.CreateDataObjectNode("WfProjectTaskOutcome", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectTaskID", aWfProjectTask.GetPropertyString("WfProjectTaskID")));
		if (aWfProjectTask.GetPropertyString("SubmittedOutcomeID", "") != "") {
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "TaskOutcomeID", aWfProjectTask.GetPropertyString("SubmittedOutcomeID"), "And", "NotEqual"));
		}
		if (aWfProjectTask.GetPropertyString("DefaultOutcomeID", "") != "") {
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "TaskOutcomeID", aWfProjectTask.GetPropertyString("DefaultOutcomeID"), "And", "NotEqual"));
		}
		cDataObjectList aWfProjectTaskOutcomeDOL = DataObjectFactory.GetDataObjectList(aDataObjectNode);

		foreach (cDataObject aWfProjectTaskOutcomeDO in aWfProjectTaskOutcomeDOL) {
			aOutcomeNode = CreateOutcomeNode(aDoc, aWfProjectTaskOutcomeDO);
			aOutcomeNode.AppendChild(CreateFiltersNode(aDoc, aWfProjectTaskOutcomeDO, aWfProjectTask, false));

			///Adding Processing Event Nodes
			cDataObjectList aWorkflowEventsDOL;
			aDataObjectNode = null;
			aFiltersNode = null;
			XmlNode aSortNode = null;
			aXmlDoc = DataObjectFactory.CreateDataObjectNode("WorkflowEvents", out aDataObjectNode, out aFiltersNode);
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WorkflowID", aWfProjectTaskOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID")));
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WorkflowEventTypeID", "2"));
			aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode());
			aSortNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SortOrder", ""));
			aWorkflowEventsDOL = DataObjectFactory.GetDataObjectList(aDataObjectNode);
			if (aWorkflowEventsDOL.Count > 0) {
				XmlNode aProcessingEventsNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "ProcessingEvents", "");
				foreach (cDataObject aWorkflowEventsDO in aWorkflowEventsDOL) {
					aProcessingEventsNode.AppendChild(CreateProcessingEventNode(aDoc, aWorkflowEventsDO));
				}
				aOutcomeNode.AppendChild(aProcessingEventsNode);
			}
			
			///Adding Tasks
			cDataObjectList aWfProjectTaskOutcomeTasksDOL = aWfProjectTaskOutcomeDO.GetRelatedPropertyDataObjectList("WfProjectTaskOutcomeTasks");
			if (aWfProjectTaskOutcomeTasksDOL.Count > 0) {
				XmlNode aTasksNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Tasks", "");
				foreach (cDataObject aWfProjectTaskOutcomeTasksDO in aWfProjectTaskOutcomeTasksDOL) {
					aTasksNode.AppendChild(CreateTaskNode(aDoc, aWfProjectTaskOutcomeTasksDO.GetRelatedPropertyDataObject("NextWfProjectTask")));
				}
				aOutcomeNode.AppendChild(aTasksNode);
			}

			///Adding Events
			cDataObjectList aWfProjectTaskOutcomeEventsDOL = aWfProjectTaskOutcomeDO.GetRelatedPropertyDataObjectList("WfProjectTaskOutcomeEvents");
			if (aWfProjectTaskOutcomeEventsDOL.Count > 0) {
				XmlNode aEventsNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Events", "");
				foreach (cDataObject aWfProjectTaskOutcomeEventsDO in aWfProjectTaskOutcomeEventsDOL) {
					aEventsNode.AppendChild(CreateEventNode(aDoc, aWfProjectTaskOutcomeEventsDO));
				}
				aOutcomeNode.AppendChild(aEventsNode);
			}
			aOutcomesNode.AppendChild(aOutcomeNode);
		}
		aDoc.DocElement.AppendChild(aOutcomesNode);

		//Add the submitted outcome next
		if (aWfProjectTask.GetPropertyString("SubmittedOutcomeID", "") != "") {
			cDataObjectList aWfProjectTaskSelectedOutcomeDOL = DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcome", "WfProjectTaskID", aWfProjectTask.GetPropertyString("WfProjectTaskID"), "TaskOutcomeID", aWfProjectTask.GetPropertyString("SubmittedOutcomeID"));
			if (aWfProjectTaskSelectedOutcomeDOL.Count > 0) {
				aOutcomeNode = CreateOutcomeNode(aDoc, aWfProjectTaskSelectedOutcomeDOL[0]);
				aOutcomeNode.AppendChild(CreateFiltersNode(aDoc, aWfProjectTaskSelectedOutcomeDOL[0], aWfProjectTask, true));
			} else {
				aOutcomeNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Outcome", "");
				aDoc.AddAttribute(aOutcomeNode, "OutcomeKey", aWfProjectTask["SubmittedOutcomeID"].ToString());
				aDoc.AddAttribute(aOutcomeNode, "DataObjectKey", "WfTaskAssignment");
				aDoc.AddAttribute(aOutcomeNode, "WfTaskAssignmentFilterKey", "WfTaskAssignmentID");
				XmlNode aSubmittedOutcomeFiltersNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Filters", "");
				aSubmittedOutcomeFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "WfTaskID", aWfProjectTask["WfTaskID"].ToString()));
				if (aWfProjectTask.GetRelatedPropertyString("WfTask.WfTaskTypeID") == "5" || aWfProjectTask.GetRelatedPropertyString("WfTask.WfTaskTypeID") == "7") {
					aSubmittedOutcomeFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "WfTaskOutcomeID", aWfProjectTask.GetPropertyString("SubmittedOutcomeID")));
				}
				aSubmittedOutcomeFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "WfTaskStatusID", "2"));

				aOutcomeNode.AppendChild(aSubmittedOutcomeFiltersNode);
			}
			
			if (aWfProjectTaskSelectedOutcomeDOL.Count > 0) {
				XmlNode aTasksNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Tasks", "");
				XmlNode aEventsNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Events", "");
				foreach (cDataObject aWfProjectTaskSelectedOutcomeDO in aWfProjectTaskSelectedOutcomeDOL) {

					///Adding Processing Event Nodes
					aDataObjectNode = null;
					aFiltersNode = null;
					aXmlDoc = DataObjectFactory.CreateDataObjectNode("WorkflowEvents", out aDataObjectNode, out aFiltersNode);
					aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WorkflowID", aWfProjectTaskSelectedOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID")));
					aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WorkflowEventTypeID", "2"));
					XmlNode aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode());
					aSortNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SortOrder", ""));
					cDataObjectList aWorkflowEventsDOL = DataObjectFactory.GetDataObjectList(aDataObjectNode);
					if (aWorkflowEventsDOL.Count > 0) {
						XmlNode aProcessingEventsNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "ProcessingEvents", "");
						foreach (cDataObject aWorkflowEventsDO in aWorkflowEventsDOL) {
							aProcessingEventsNode.AppendChild(CreateProcessingEventNode(aDoc, aWorkflowEventsDO));
						}
						aOutcomeNode.AppendChild(aProcessingEventsNode);
					}
					
					///Adding Tasks
					cDataObjectList aWfProjectTaskOutcomeTasksDOL = aWfProjectTaskSelectedOutcomeDO.GetRelatedPropertyDataObjectList("WfProjectTaskOutcomeTasks");
					if (aWfProjectTaskOutcomeTasksDOL.Count > 0) {
						foreach (cDataObject aWfProjectTaskOutcomeTasksDO in aWfProjectTaskOutcomeTasksDOL) {
							aTasksNode.AppendChild(CreateTaskNode(aDoc, aWfProjectTaskOutcomeTasksDO.GetRelatedPropertyDataObject("NextWfProjectTask")));
						}
					}
					///Adding Events
					cDataObjectList aWfProjectTaskOutcomeEventsDOL = aWfProjectTaskSelectedOutcomeDO.GetRelatedPropertyDataObjectList("WfProjectTaskOutcomeEvents");
					if (aWfProjectTaskOutcomeEventsDOL.Count > 0) {
						foreach (cDataObject aWfProjectTaskOutcomeEventsDO in aWfProjectTaskOutcomeEventsDOL) {
							aEventsNode.AppendChild(CreateEventNode(aDoc, aWfProjectTaskOutcomeEventsDO));
						}
					}
				}
				aOutcomeNode.AppendChild(aTasksNode);
				aOutcomeNode.AppendChild(aEventsNode);
			}
			aOutcomesNode.AppendChild(aOutcomeNode);
		}

		//Add the default outcome next
		if (aWfProjectTask.GetPropertyString("DefaultOutcomeID", "") != "") {
			cDataObject aWfProjectTaskSelectedOutcomeDO = DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcome", "WfProjectTaskID", aWfProjectTask.GetPropertyString("WfProjectTaskID"), "TaskOutcomeID", aWfProjectTask.GetPropertyString("DefaultOutcomeID"))[0];
			if (aWfProjectTaskSelectedOutcomeDO != null) {
				aOutcomeNode = CreateOutcomeNode(aDoc, aWfProjectTaskSelectedOutcomeDO);
				aOutcomeNode.AppendChild(CreateFiltersNode(aDoc, aWfProjectTaskSelectedOutcomeDO, aWfProjectTask, true));
			} else {
				aOutcomeNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Outcome", "");
				aDoc.AddAttribute(aOutcomeNode, "OutcomeKey", aWfProjectTask["DefaultOutcomeID"].ToString());
				aDoc.AddAttribute(aOutcomeNode, "DataObjectKey", "WfTaskAssignment");
				aDoc.AddAttribute(aOutcomeNode, "WfTaskAssignmentFilterKey", "WfTaskAssignmentID");
				XmlNode aSubmittedOutcomeFiltersNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Filters", "");
				aSubmittedOutcomeFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "WfTaskID", aWfProjectTask["WfTaskID"].ToString()));
				if (aWfProjectTask.GetRelatedPropertyString("WfTask.WfTaskTypeID") == "5" || aWfProjectTask.GetRelatedPropertyString("WfTask.WfTaskTypeID") == "7") {
					aSubmittedOutcomeFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "WfTaskOutcomeID", aWfProjectTask.GetPropertyString("DefaultOutcomeID")));
				}
				aSubmittedOutcomeFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "WfTaskStatusID", "2"));

				aOutcomeNode.AppendChild(aSubmittedOutcomeFiltersNode);
			}

			if (aWfProjectTaskSelectedOutcomeDO != null) {
				///Adding Processing Event Nodes
				aDataObjectNode = null;
				aFiltersNode = null;
				aXmlDoc = DataObjectFactory.CreateDataObjectNode("WorkflowEvents", out aDataObjectNode, out aFiltersNode);
				aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WorkflowID", aWfProjectTaskSelectedOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID")));
				aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WorkflowEventTypeID", "2"));
				XmlNode aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode());
				aSortNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SortOrder", ""));
				cDataObjectList aWorkflowEventsDOL = DataObjectFactory.GetDataObjectList(aDataObjectNode);
				if (aWorkflowEventsDOL != null && aWorkflowEventsDOL.Count > 0) {
					XmlNode aProcessingEventsNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "ProcessingEvents", "");
					foreach (cDataObject aWorkflowEventsDO in aWorkflowEventsDOL) {
						aProcessingEventsNode.AppendChild(CreateProcessingEventNode(aDoc, aWorkflowEventsDO));
					}
					aOutcomeNode.AppendChild(aProcessingEventsNode);
				}
			}
			
			///Adding Tasks
			if (aWfProjectTaskSelectedOutcomeDO != null) {
				cDataObjectList aWfProjectTaskOutcomeTasksDOL = aWfProjectTaskSelectedOutcomeDO.GetRelatedPropertyDataObjectList("WfProjectTaskOutcomeTasks");
				if (aWfProjectTaskOutcomeTasksDOL.Count > 0) {
					XmlNode aTasksNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Tasks", "");
					foreach (cDataObject aWfProjectTaskOutcomeTasksDO in aWfProjectTaskOutcomeTasksDOL) {
						aTasksNode.AppendChild(CreateTaskNode(aDoc, aWfProjectTaskOutcomeTasksDO.GetRelatedPropertyDataObject("NextWfProjectTask")));
					}
					aOutcomeNode.AppendChild(aTasksNode);
				}
			}

			///Adding Events
			if (aWfProjectTaskSelectedOutcomeDO != null) {
				cDataObjectList aWfProjectTaskOutcomeEventsDOL = aWfProjectTaskSelectedOutcomeDO.GetRelatedPropertyDataObjectList("WfProjectTaskOutcomeEvents");
				if (aWfProjectTaskOutcomeEventsDOL.Count > 0) {
					XmlNode aEventsNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Events", "");
					foreach (cDataObject aWfProjectTaskOutcomeEventsDO in aWfProjectTaskOutcomeEventsDOL) {
						aEventsNode.AppendChild(CreateEventNode(aDoc, aWfProjectTaskOutcomeEventsDO));
					}
					aOutcomeNode.AppendChild(aEventsNode);
				}
			}
			aOutcomesNode.AppendChild(aOutcomeNode);
		}

		return aDoc;
	}

	/*-----------------------------------------------------*/

	private XmlNode CreateFiltersNode(cXMLDoc aDoc, cDataObject aWfProjectTaskOutcomeDO, cDataObject aWfProjectTask, Boolean isSubmittedOutcome)
	{
		XmlNode aFiltersNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Filters", "");
		//check if there is an advanced filter
		Boolean HasAdvancedFilter = false;
		String AdvancedFilter = "";
		cDataObjectList aWfProjectTaskOutcomeFiltersDOL = aWfProjectTaskOutcomeDO.GetRelatedPropertyDataObjectList("WfProjectTaskOutcomeFilters");
		foreach (cDataObject aWfProjectTaskOutcomeFiltersDO in aWfProjectTaskOutcomeFiltersDOL)
		{
			if (aWfProjectTaskOutcomeFiltersDO.GetRelatedPropertyString("FilterArgument.ArgXml") != "")
			{
				HasAdvancedFilter = true;
				AdvancedFilter += aWfProjectTaskOutcomeFiltersDO.GetRelatedPropertyString("FilterArgument.ArgXml");
			}
		}

		if (HasAdvancedFilter)
		{
			aFiltersNode.InnerXml = AdvancedFilter;
		}
		else
		{

			if (aWfProjectTaskOutcomeDO.GetRelatedPropertyString("WfProjectTaskOutcomeEvents.ActionID") != "")
			{
				int aActionID = aWfProjectTaskOutcomeDO.GetRelatedPropertyInt("WfProjectTaskOutcomeEvents.ActionID");
				switch (aActionID)
				{
					case 1:
						//Notify Third Party
						aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "WfTaskStatusID", "3"));
						aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "OpenDate", ""));
						break;
					case 2:
						//Re-Notify Third Party
						aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "WfTaskStatusID", "1"));
						aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "OpenDate", ""));
						break;
					case 3:
						//Delete Third Party
						aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "WfTaskStatusID", "1"));
						aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "OpenDate", "", "NotEqual"));
						break;
				}

			}
			else
			{
				aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "WfTaskID", aWfProjectTask["WfTaskID"].ToString()));
				int aTaskTypeID = aWfProjectTask.GetRelatedPropertyInt("WfTask.WfTaskTypeID");
				if (aTaskTypeID == 5 || aTaskTypeID == 7)
				{
					//for eligibility and internal review tasks, outcome is already set in the modulecontent, so include outcomes in the filters
					//for external review, outcome is set in review stage outcomes page
					if (aWfProjectTaskOutcomeDO["TaskOutcomeID"].ToString() != "")
						aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "WfTaskOutcomeID", aWfProjectTaskOutcomeDO["TaskOutcomeID"].ToString()));
				}
				else if (aTaskTypeID == 4)
				{
					if (aWfProjectTaskOutcomeDO["TaskOutcomeID"].ToString() != "" && aWfProjectTaskOutcomeDO["TaskOutcomeID"].ToString() != aWfProjectTask["DefaultOutcomeID"].ToString() && aWfProjectTaskOutcomeDO["TaskOutcomeID"].ToString() != aWfProjectTask["SubmittedOutcomeID"].ToString())
						aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "WfTaskOutcomeID", aWfProjectTaskOutcomeDO["TaskOutcomeID"].ToString()));
				}
				aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "WfTaskStatusID", "2"));
			}
		}

		return aFiltersNode;
	}

	/*-----------------------------------------------------*/

	private XmlNode CreateOutcomeNode(cXMLDoc aDoc, cDataObject aWfProjectTaskOutcomeDO) {
		XmlNode aOutcomeNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Outcome", "");
		aDoc.AddAttribute(aOutcomeNode, "OutcomeKey", aWfProjectTaskOutcomeDO["TaskOutcomeID"].ToString());
		aDoc.AddAttribute(aOutcomeNode, "DataObjectKey", aWfProjectTaskOutcomeDO["DataObjectKey"].ToString());
		aDoc.AddAttribute(aOutcomeNode, "WfTaskAssignmentFilterKey", aWfProjectTaskOutcomeDO["WfTaskAssignmentFilterKey"].ToString());
		return aOutcomeNode;
	}

	/*-----------------------------------------------------*/

	private XmlNode CreateArgumentNode(cXMLDoc aDoc, String Type, String TypeKey, String PropertyKey, String Value) {
		return CreateArgumentNode(aDoc, Type, TypeKey, PropertyKey, Value, "");
	}

	/*-----------------------------------------------------*/

	private XmlNode CreateArgumentNode(cXMLDoc aDoc, String Type, String TypeKey, String PropertyKey, String Value, String Operator) {
		XmlNode aArgumentNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Argument", "");
		aDoc.AddAttribute(aArgumentNode, "Type", Type);
		aDoc.AddAttribute(aArgumentNode, "TypeKey", TypeKey);
		aDoc.AddAttribute(aArgumentNode, "PropertyKey", PropertyKey);
		aDoc.AddAttribute(aArgumentNode, "Value", Value);
		if (Operator != "")
			aDoc.AddAttribute(aArgumentNode, "Operator", Operator);
		return aArgumentNode;
	}

	/*-----------------------------------------------------*/

	private XmlNode CreateTaskNode(cXMLDoc aDoc, cDataObject aNextProjectTaskDO) {
		XmlNode aTaskNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Task", "");
		aDoc.AddAttribute(aTaskNode, "TaskKey", aNextProjectTaskDO["WfTaskID"].ToString());
		aDoc.AddAttribute(aTaskNode, "Status", aNextProjectTaskDO["DefaultStatusID"].ToString());
		aDoc.AddAttribute(aTaskNode, "Outcome", aNextProjectTaskDO["DefaultOutcomeID"].ToString());
		String aAssignTo = aNextProjectTaskDO["AssignTo"].ToString();
		String aAssignToType = "";
		String aAssignToID = "";
		cDataObject aDefaultWorkgroupDO = DataObjectFactory.GetDataObjectListWithFilter("WorkGroup", "IsPrimary", "True")[0];
		if (aAssignTo.IndexOf('~') > 0) {
			//AssignTo value is in the format of 1~role
			string[] aAssignToValues = aAssignTo.Split('~');
			aAssignToID = aAssignToValues[0];
			aAssignToType = aAssignToValues[1];

			switch (aAssignToType) {
				case "role":
					aDoc.AddAttribute(aTaskNode, "RoleID", aAssignToID);
					if (aAssignToID == "1" || aAssignToID == "114")
						aDoc.AddAttribute(aTaskNode, "PersonID", "GranteeProject.PrimaryPersonID");
					break;
				case "workgroup":
					aDoc.AddAttribute(aTaskNode, "RoleID", aAssignToID);
					aDoc.AddAttribute(aTaskNode, "NoPersonID", "True");
					if (aAssignToValues[2] != null) {
						cDataObject aWorkGroupDO = DataObjectFactory.GetDataObjectFromPrimaryKey("WorkGroup", aAssignToValues[2]);
						if (aWorkGroupDO != null)
							aDoc.AddAttribute(aTaskNode, "WorkgroupID", aAssignToValues[2]);
						else {
							if (aDefaultWorkgroupDO != null)
								aDoc.AddAttribute(aTaskNode, "WorkgroupID", aDefaultWorkgroupDO.GetPropertyString("WorkGroupID"));
						}
					}
					break;
				case "primary_staff_support_contact":
					aDoc.AddAttribute(aTaskNode, "RoleID", aAssignToID);
					aDoc.AddAttribute(aTaskNode, "NoPersonID", "False");
					if (aDefaultWorkgroupDO != null)
						aDoc.AddAttribute(aTaskNode, "DefaultWorkgroupID", aDefaultWorkgroupDO.GetPropertyString("WorkGroupID"));
					aDoc.AddAttribute(aTaskNode, "PersonID", "GranteeProject.GranteeProjectPrimaryStaffAffiliation.StaffPersonID");
					break;
			}
		}
		//if (aNextProjectTaskDO.GetRelatedPropertyString("WfTask.WfTaskTypeID") == "7") {
			XmlNode aExistingWfTAFiltersNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "ExistingWfTAFilters", "");
			aExistingWfTAFiltersNode.AppendChild(CreateArgumentNode(aDoc, "SubmittedWfTaskAssignment", "WfTaskAssignmentID", "AppWftaID", ""));
			XmlNode aRelatedDataObjectNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "RelatedDataObject", "");
			aDoc.AddAttribute(aRelatedDataObjectNode, "DataObjectDefinitionKey", "WfTaskAssignment");
			XmlNode aFiltersNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Filters", "");
			aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "NewWfTaskAssignment", "WfTaskAssignmentID", "WfTaskAssignmentID", ""));
			aRelatedDataObjectNode.AppendChild(aFiltersNode);
			XmlNode aDataObjectPropertiesNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "DataObjectProperties", "");
			aDataObjectPropertiesNode.AppendChild(CreateArgumentNode(aDoc, "SubmittedWfTaskAssignment", "WfTaskAssignmentID", "AppWftaID", ""));
			aRelatedDataObjectNode.AppendChild(aDataObjectPropertiesNode);

			aTaskNode.AppendChild(aExistingWfTAFiltersNode);
			aTaskNode.AppendChild(aRelatedDataObjectNode);
		//}
		return aTaskNode;
	}
	/*-----------------------------------------------------*/

	private XmlNode CreateEventNode(cXMLDoc aDoc, cDataObject aWfProjectTaskOutcomeEventDO) {
		XmlNode aEventNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Event", "");
		aDoc.AddAttribute(aEventNode, "EventKey", aWfProjectTaskOutcomeEventDO["EventKeyID"].ToString());
		String aRecipient = aWfProjectTaskOutcomeEventDO["EventRecipientID"].ToString();
		String aRecipientType = "";
		String aRecipientID = "";
		cDataObject aDefaultWorkgroupDO = DataObjectFactory.GetDataObjectListWithFilter("WorkGroup", "IsPrimary", "True")[0];
		if (aRecipient.IndexOf('~') > 0) {
			//aRecipient value is in the format of 1~role
			string[] aAssignToValues = aRecipient.Split('~');
			aRecipientID = aAssignToValues[0];
			aRecipientType = aAssignToValues[1];
			XmlNode aEventDataObjectListNode = null;
			XmlNode aFiltersNode = null;
			switch (aRecipientType) {
				//case "role":
				//    aDoc.AddAttribute(aTaskNode, "RoleID", aRecipientID);
				//    break;
				case "workgroup":
					aEventDataObjectListNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "EventDataObjectList", "");
					aDoc.AddAttribute(aEventDataObjectListNode, "DataObjectDefinitionKey", "WfTaskAssignmentWorkGroupMember");
					aFiltersNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Filters", "");
					aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "SubmittedWfTaskAssignment", "WfTaskAssignmentID", "WfTaskAssignmentID", ""));
					if (aAssignToValues[2] != null)
					{
						cDataObject aWorkGroupDO = DataObjectFactory.GetDataObjectFromPrimaryKey("WorkGroup", aAssignToValues[2]);
						if (aWorkGroupDO != null)
							aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "WorkGroupID", aAssignToValues[2]));
						else
						{
							if (aDefaultWorkgroupDO != null)
								aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "", "", "WorkGroupID", aDefaultWorkgroupDO.GetPropertyString("WorkGroupID")));
						}
					}
					aEventDataObjectListNode.AppendChild(aFiltersNode);
					aEventNode.AppendChild(aEventDataObjectListNode);
					break;
				case "primary_staff_support_contact":
					aEventDataObjectListNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "EventDataObjectList", "");
					aDoc.AddAttribute(aEventDataObjectListNode, "DataObjectDefinitionKey", "GranteeProject");
					aDoc.AddAttribute(aEventDataObjectListNode, "PersonID", "GranteeProject.GranteeProjectPrimaryStaffAffiliation.StaffPersonID");
					aFiltersNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Filters", "");
					aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "SubmittedWfTaskAssignment", "GranteeProjectID", "GranteeProjectID", ""));
					aEventDataObjectListNode.AppendChild(aFiltersNode);
					aEventNode.AppendChild(aEventDataObjectListNode);
					break;
			}
		}
		return aEventNode;
	}
	/*-----------------------------------------------------*/
	/// <summary>
	/// This method creates a DataObject node for the processing event
	/// </summary>
	/// <param name="aDoc"></param>
	/// <param name="aWorkflowEventsDO"></param>
	/// <returns></returns>
	private XmlNode CreateProcessingEventNode(cXMLDoc aDoc, cDataObject aWorkflowEventsDO) {
		XmlNode aDataObjectNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "DataObject", "");
		aDoc.AddAttribute(aDataObjectNode, "Key", "aWorkflowEventsDO" + aWorkflowEventsDO["WorkflowEventsID"].ToString());
		aDoc.AddAttribute(aDataObjectNode, "DataObjectDefinitionKey", aWorkflowEventsDO.GetRelatedPropertyString("EventManagerEvents.ProcessName"));
		XmlNode aFiltersNode = aDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Filters", "");
		aFiltersNode.AppendChild(CreateArgumentNode(aDoc, "SubmittedWfTaskAssignment", "WfTaskAssignmentID", "WfTaskAssignmentID", ""));
		aDataObjectNode.AppendChild(aFiltersNode);
		return aDataObjectNode;
	}

	/*-----------------------------------------------------*/

/*====================================================*/
} // class cWebSession


/*====================================================*/
}  //Core.Web
