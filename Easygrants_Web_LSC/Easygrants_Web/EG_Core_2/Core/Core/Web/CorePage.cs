using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Xml;
using Core.Util;
using Core.DataAccess.DBAccess;
using Core.DataAccess;
using Core.User;
using Core.Web.User;
using Core.DataAccess.XMLAccess;
using System.Text.RegularExpressions;

namespace Core.Web {
/*====================================================*/


///<summary>
///Base class for all Pages - wraps .NET events and Core properties
///</summary>
public class cCorePage : Page {
/*====================================================*/

	private	String		mPageNavKey;
	private	String		mPageHorizNavKey;
	//private cDBConn 	mDBConn;
/*-----------------------------------------------------*/

	///<summary>
	///Navigation Key for each page
	///</summary>
	///<remarks>
	///The mother of all navigation keys
	///</remarks>
	public String PageNavKey 
	{
		get {return mPageNavKey;}
		set {mPageNavKey = value;}
	}

/*-----------------------------------------------------*/

	public String PageHorizNavKey 
	{
		get {return mPageHorizNavKey;}
		set {mPageHorizNavKey = value;}
	}

	/*-----------------------------------------------------*/

	public HtmlForm CorePage_Form 
	{
		get {return (HtmlForm)FindControl("frmMain");}
	}
	
/*====================================================*/
	
	public cWebAppl WebAppl {
		get {
			return (cWebAppl)Application["gWebAppl"];
			//return (cAppl)cAppl.HttpAppl.Application["gAppl"];
		}
	}

/*-----------------------------------------------------*/

	public cWebUser WebUser {
		get {return null;}
	}
	
/*-----------------------------------------------------*/

	public bool DebugSwitchEnabled {
	
		get {
			if (Request.QueryString["Debug"] == "" || Request.QueryString["Debug"] == null) {
				return WebSession.DebugSwitchEnabled;
			}
			else {				
				return Convert.ToBoolean(Request.QueryString["Debug"]);
			}
		}
	}
	
/*-----------------------------------------------------*/

	public cWebSession WebSession {
		get {return (cWebSession)Session["gWebSession"];}
	}
	
/*====================================================*/

	protected override void OnInit(EventArgs e) {
		//this.Load += new System.EventHandler(this.Page_Load);
		//ddHandler Me.Load, AddressOf Me.Page_Load
		base.OnInit(e);
		SetCache();
		//base.Response.Cache.SetCacheability(HttpCacheability.Server);
	}
	
	/*====================================================*/

	protected virtual void SetCache() 
	{
		base.Response.Cache.SetCacheability(HttpCacheability.Server);
	}
	
	/*====================================================*/
	
	public virtual Boolean CorePage_Valid(Object aSrc, EventArgs aEvent) 
	{
		if (WebSession == null) {
			return false;
		}
		return true;
	}
	
/*-----------------------------------------------------*/
	
	public virtual void CorePage_Load(Object aSrc, EventArgs aEvent) {
	}

/*-----------------------------------------------------*/
	
	public virtual void CorePage_UnLoad(Object aSrc, EventArgs aEvent) {
		WebSession.DataObjectFactory.DataSource_Close();
	}
	
/*-----------------------------------------------------*/

	public void Page_Load(Object aSrc, EventArgs aEvent) {
		//cLib.Runtime_Error();
		
		WebSession.CurrentPage = this;
		if(CorePage_Valid(aSrc, aEvent)) {
			CorePage_RegisterScriptBlock(WebAppl.Build_RootURL("Core/Includes/Easygrants.js"), "EasygrantsJS");
			CorePage_RegisterScriptBlock(WebAppl.Build_RootURL("Core/Includes/ClientImplementation.js"), "ClientImplementationJS");
			CorePage_Load(aSrc, aEvent);
		} else {
			Response.Redirect(WebAppl.LogoutURL);
		}
	}
	
/*-----------------------------------------------------*/

	public void Page_Unload(Object aSrc, EventArgs aEvent) {
		CorePage_UnLoad(aSrc, aEvent);
		
		WebSession.CurrentPage = null;
	}
	
/*====================================================*/

	public void Redirect(String aParameter, String aValue, String aAnchorName) {
	
		String	aNewURL = Request.Url.PathAndQuery;
		
		if (!(aParameter == null || aParameter == ""))
			aNewURL = cWebLib.AddQuerystringParameter(aNewURL, aParameter, aValue);
		
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "_redir", UniqueQueryString());
		
		if (!(aAnchorName == null || aAnchorName == ""))
			aNewURL += "#" + aAnchorName;
			
		Response.Redirect(aNewURL);
	}

//-------------------------------------------------------------

	public void Redirect(String aParameter, String aValue) {

		Redirect(aParameter, aValue, "");		
	}
	
//-------------------------------------------------------------

	public void Redirect() {
		
		Redirect(null, null);
	}

//-------------------------------------------------------------

	public void Redirect(String aNewURL) {
		
		Response.Redirect(aNewURL);
	}
	
//-------------------------------------------------------------

	public void RedirectAnchor(String aAnchorName) {
		String	aStrString;
		String	aNewURL = Request.Url.PathAndQuery;
				
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "_redir", UniqueQueryString());
		aStrString = HttpUtility.HtmlEncode("#" + aAnchorName);
		aNewURL = aNewURL + aStrString;
		Response.Redirect(aNewURL);
	}

//-------------------------------------------------------------

	public static String UniqueQueryString() {
		return DateTime.Now.Millisecond.ToString();
	}

/*-----------------------------------------------------*/

	public String Working_Navigation_Page_Key() {
		
		if (WebUser.CrumbTrail != null) {
			if (WebUser.CrumbTrail.Root_Crumb != null)
				return WebUser.CrumbTrail.Root_Crumb.Key;
		}

		return PageNavKey;
	}

/*====================================================*/

	public void CorePage_RegisterScriptBlock(String aSrcFile, String aKey) {
        String		aScriptStr;
        
        aScriptStr = "<script language='JavaScript1.2' src='" +
						aSrcFile + "'>" +
						"</script>";

		ClientScriptManager cs = Page.ClientScript;
		if (!cs.IsClientScriptBlockRegistered(aKey))
			cs.RegisterClientScriptBlock(this.GetType(), aKey, aScriptStr);
	}

/*====================================================*/

	public void CorePage_RegisterStartupScript(String aSrcFile, String aKey)
	{
		String aScriptStr;

		aScriptStr = "<script language='JavaScript1.2' src='" +
						aSrcFile + "'>" +
						"</script>";
		ClientScriptManager cs = Page.ClientScript;
		if (!cs.IsStartupScriptRegistered(aKey))
			cs.RegisterStartupScript(this.GetType(), aKey, aScriptStr);
	}
	
/*-----------------------------------------------------*/

	public UserControl CorePage_LoadControl(String aCtlName, String aCtlID, Control aContentCtl) {
		UserControl		aCtlInfo;
		
		aCtlInfo = (UserControl)LoadControl(aCtlName);
		aCtlInfo.ID = aCtlID;
	
		if (aContentCtl != null)
			aContentCtl.Controls.Add(aCtlInfo);

		return aCtlInfo;
	}

/*====================================================*/

	public void CorePage_LoadStyles(HtmlGenericControl aStyleSpan) {
		String		aStylesPath;

		aStylesPath = WebAppl.DefaultStylesPath;
		if (aStylesPath != "") {
			aStylesPath = WebAppl.Build_RootURL(aStylesPath);
			CorePage_LoadControl(aStylesPath, "ctlStyles", aStyleSpan);
		}
	}
	
/*-----------------------------------------------------*/

	public void Page_Error(object sender,EventArgs e)
	{
		if (Server.GetLastError().GetBaseException().GetType().ToString() != "System.Threading.ThreadAbortException")
		{
			WebSession.CurrentException = Server.GetLastError().GetBaseException();
			WebAppl.LogException(WebSession.CurrentException);
			WebSession.CurrentUrl = Request.Url.PathAndQuery;
			String aSystemError = System.Configuration.ConfigurationSettings.AppSettings["SystemError"];
			if(aSystemError != "" && aSystemError != null) {
				String aUrl = WebAppl.Build_RootURL(aSystemError);
				Response.Redirect(aUrl);
			}
		}
		else
			Server.ClearError();
	}

	/*-----------------------------------------------------*/
	
	public void GetFileUrl(cDataObject aUploadTemplateDO, out cDataObject aSharePointDO, out String aRemoteOrginalFileURL) {
		aRemoteOrginalFileURL = "";
		aSharePointDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")[0];
		if (aSharePointDO == null)
			return;
		String aUploadTemplateID = aUploadTemplateDO.GetPropertyString("UploadTemplateID");
		String aFileNamePrefix = aUploadTemplateDO.GetPropertyString("FileNamePrefix");
		String aSourceFileName = aUploadTemplateDO.GetPropertyString("SourceFileName");
		String aSourceExt = aSourceFileName.Substring(aSourceFileName.LastIndexOf(".") + 1);
		String aUploadFileName = aUploadTemplateID + "_" + aFileNamePrefix;
		String aSiteName = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SiteName"));
		String aSPUrl = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SharePointURL"));
		aRemoteOrginalFileURL = cWebLib.TruncateFolderName(aSPUrl + aSiteName + "Templates" + "/" + "Upload Manager" + "/" + aUploadFileName + "." + aSourceExt);
	}

	/*-----------------------------------------------------*/
		
	public void GetFileUrl(cDataObject aSubmittedFileDataObj, out cDataObject aSharePointDO, out String aRemotePDFURL, out String aRemoteOrginalURL) {
		aRemotePDFURL = "";
		aRemoteOrginalURL = "";
		aSharePointDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")[0];
		if (aSharePointDO == null)
			return;
		switch (aSubmittedFileDataObj.GetPropertyString("EntityDataObjectKey")) {
			case "WfTaskAssignment":
			case "GranteeProject":
				BuildURL(aSubmittedFileDataObj, aSharePointDO, aSubmittedFileDataObj.GetPropertyString("EntityDataObjectKey"), out aRemotePDFURL, out aRemoteOrginalURL);
				break;
			default:
				//This case needs to be handeled for Granteeproject , Person , Organization , WordMerge
				BuildURL(aSubmittedFileDataObj, aSharePointDO, aSubmittedFileDataObj.GetRelatedPropertyString("FileType.EntityDataObjectKey"), out aRemotePDFURL, out aRemoteOrginalURL);
				break;
		}
	}

	public string TruncateSpecialCharacters(cDataObject aSPIntegrationDO, String aFolderName)
	{
		//string pattern = "[^~\"#%&*:<>?\\//{|}.]*";		
		return Regex.Replace(aFolderName, aSPIntegrationDO.GetPropertyString("InvalidCharacterRegex", ""), "");
	}

	public string TruncateFolderName(string aFolderName, String aEntityDataObjectKey)
	{
		if (aEntityDataObjectKey == "Person" || aEntityDataObjectKey == "Organization")
			if (aFolderName.Length <= 50)
				return aFolderName;
			else
				return aFolderName.Substring(0, 50);		
		else
			return aFolderName;
	}
	
	
	public void BuildURL(cDataObject aSubmittedFileDataObj, cDataObject aSharePointDO , string FileType, out string aRemotePDFURL, out string aRemoteOrginalURL)
	{
		String aSiteName = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SiteName"));
		String aSPUrl = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SharePointURL"));
		String aSubmittedFileID = aSubmittedFileDataObj.GetPropertyString("SubmittedFileID");
		String aSourceFileName = aSubmittedFileDataObj.GetPropertyString("SourceFileName");
		String aSourceExt = aSourceFileName.Substring(aSourceFileName.LastIndexOf(".") + 1);
		String aFileNamePrefix = aSourceFileName.Substring(0, aSourceFileName.LastIndexOf("."));
		String aEntityID = aSubmittedFileDataObj.GetPropertyString("EntityID");
		String aDestinationFolder = "";
		String aDestinationContextFolder = "";
		String aUploadFileName = "";
		switch (FileType) {
			case "GranteeProject": 
			case "WfTaskAssignment":
				String aGPID;
				if (aSubmittedFileDataObj.GetRelatedPropertyString("TaskUploadType.Upload.FileNamePrefix") != "")
					aFileNamePrefix = aSubmittedFileDataObj.GetRelatedPropertyString("TaskUploadType.Upload.FileNamePrefix");
				
				if (aSubmittedFileDataObj.GetPropertyString("EntityDataObjectKey") == "WfTaskAssignment")
					aGPID = aSubmittedFileDataObj.GetRelatedPropertyString("WfTaskAssignment.GranteeProjectID");
				else
					aGPID = aSubmittedFileDataObj.GetPropertyString("EntityID");
				
				cDataObject aGranteeProjectDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProject", "GranteeProjectID", aGPID)[0];
				String aFCFolderName = aGranteeProjectDO.GetRelatedPropertyString("WfProjectID") + "_" + TruncateSpecialCharacters(aSharePointDO, aGranteeProjectDO.GetRelatedPropertyString("WfProject.ShortName"));
				String aFOFolderName = aGranteeProjectDO.GetRelatedPropertyString("WfProject.CompetitionID") + "_" + TruncateSpecialCharacters(aSharePointDO,aGranteeProjectDO.GetRelatedPropertyString("WfProject.WfCompetition.ShortName"));
				String aProgramFolderName = aGranteeProjectDO.GetRelatedPropertyString("WfProject.WfCompetition.ProgramID") + "_" + TruncateSpecialCharacters(aSharePointDO,aGranteeProjectDO.GetRelatedPropertyString("WfProject.WfCompetition.WfProgram.ShortName"));
				String aGPFolderName = aGPID + "_EGID";
				aUploadFileName = aSubmittedFileID + "_" + aFileNamePrefix;
				aDestinationFolder = aProgramFolderName + "/" + aFOFolderName + "/" + aFCFolderName + "/" + aGPFolderName + "/";
				aDestinationContextFolder = "Grants/";
				break;
			case "Person":
				cDataObject aPersonDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Person", "PersonID", aEntityID)[0];
				String aPersonName = aPersonDO.GetPropertyString("FirstName") +  aPersonDO.GetPropertyString("LastName") +  aPersonDO.GetPropertyString("MiddleName","") ;
				aDestinationFolder = aEntityID + "_" + TruncateFolderName(TruncateSpecialCharacters(aSharePointDO, aPersonName), "Person") + "/";
				aUploadFileName = aSubmittedFileID + "_" + aFileNamePrefix;
				aDestinationContextFolder = "Contacts/Persons/";
				break;
			case "Organization":
				cDataObject aOrganizationDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Organization", "OrganizationID", aEntityID)[0];
				String aCommonOrganizationName = aOrganizationDO.GetPropertyString("CommonOrganizationName");
				aDestinationFolder = aEntityID + "_" + TruncateFolderName(TruncateSpecialCharacters(aSharePointDO, aCommonOrganizationName), "Organization") + "/";
				aUploadFileName = aSubmittedFileID + "_" + aFileNamePrefix;
				aDestinationContextFolder = "Contacts/Organizations/";
				break;
			case "WordMerge":
				if (aSubmittedFileDataObj.GetRelatedPropertyString("FileNamePrefix") != "")
					aFileNamePrefix = aSubmittedFileDataObj.GetRelatedPropertyString("FileNamePrefix");
				aUploadFileName = aSubmittedFileID + "_" + aFileNamePrefix;
				break;
			case "WfProject":
				aUploadFileName = aSubmittedFileID + "_" + aSourceFileName.Substring(0, aSourceFileName.IndexOf("."));
				cDataObjectList aWfProjectDOL = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("WfProject", aSubmittedFileDataObj.GetPropertyString("EntityID"));
				aDestinationFolder = aWfProjectDOL[0].GetRelatedPropertyString("WfCompetition.CompetitionID") + "_" + TruncateSpecialCharacters(aSharePointDO, aWfProjectDOL[0].GetRelatedPropertyString("WfCompetition.ShortName")) + "/";
				aDestinationContextFolder = "Projects/";
				break;
		}

		aRemoteOrginalURL = cWebLib.TruncateFolderName(aSPUrl + aSiteName + aDestinationContextFolder + aDestinationFolder + aUploadFileName + "." + aSourceExt);
		aRemotePDFURL = cWebLib.TruncateFolderName(aSPUrl + aSiteName + aDestinationContextFolder + aDestinationFolder + aUploadFileName + "." + "PDF");
	}
	
	public string GetUploadViewerControlUrl(string aControlType)
	{
		XmlNode aViewerNode = WebAppl.ConfigDoc.DocElement.SelectSingleNode("UploadViewerControls/Control[@Type='" + aControlType + "']");
		cDataObject aSharePointDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")[0];
		if (aViewerNode != null  && aSharePointDO != null && cXMLDoc.AttributeToString(aViewerNode, "SPURL", "") != "")
			return cXMLDoc.AttributeToString(aViewerNode, "SPURL");
		else if (aViewerNode != null)
			return cXMLDoc.AttributeToString(aViewerNode, "URL", "");
		else
			return "";
	}

	public String GetLabel(string LabelName)
	{
		//cDataObjectList aLabelHeaderDOL=WebSession.DataObjectFactory.GetDataObjectListWithFilter("HeaderLabel","LabelName",LabelName);
		//XmlNode aConfigurableLabels = WebAppl.ConfigurableLabels;
		//XmlNode aLabelNode = cXMLDoc.FindNode(aConfigurableLabels, "Label", "Name", LabelName);
		string aLabelText = WebAppl.ConfigLabelsCollection(LabelName);
		if (aLabelText == null)
			return "";
		else
			return aLabelText;
	}

	public String ConfigurableText(string aValidationText)
	{
		string pattern = "~~[^~~]+~~";
		Match aMatch = Regex.Match(aValidationText, pattern);
		if (aMatch.Success == true)
			for (int i = 0; i < aMatch.Groups.Count; i++)
			{
				aValidationText = aValidationText.Replace(aMatch.Groups[i].Value, GetLabel(aMatch.Groups[i].Value.Replace("~", "")));
			}
		return aValidationText;
	}
/*====================================================*/
} //class cCorePage


/*====================================================*/
}  //namespace Core.Web
