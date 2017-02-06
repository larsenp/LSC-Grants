using System;
using System.Web;
using System.Web.UI;
using System.Xml;
using System.Diagnostics;
using Core.DataAccess.XMLAccess;
using Core.DataAccess.DBAccess;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Core.DataAccess;
using System.IO;
using System.Collections.Specialized;

namespace Core.Web {
/*====================================================*/

///<summary>
///Web application variable object controller
///</summary>
public class cWebAppl : cAppl 
{
/*====================================================*/

	private cXMLDoc	mConfigDoc;
	private cXMLDoc	mDataDefinitionDoc;
	private cXMLDoc mClientDataDefinitionDoc;
	
	private String mName;
	private String mRoot;
	private String mConfigRoot;
	private String mBaseURL;
	private String mSecureURL;
	private String mHome;
	private String mLogoutURL;
	private String mUNCRoot;
	private String mDefaultModuleRoot;
	private String mWebAssembly;
	private String mLocalPDFUrl;
	private bool mCreateSubmissionHistory;
	private string mSecretKey = "";
	private string mSecretIV = "";
	private int mMaxFailedLoginAttempts;
	//private XmlNode mConfigurableLabels;
	private NameValueCollection mConfigLabelsCollection;
	private NameValueCollection mSystemSettings;
	private NameValueCollection mEGSettingsCollection;
	
/*-----------------------------------------------------*/

	public String Name {
		get {return mName;}
		set {mName = value;}
	}

/*-----------------------------------------------------*/

	public String Root {
		get {return mRoot;}
		set {mRoot = value;}
	}

/*-----------------------------------------------------*/

	public String ConfigRoot {
		get { return mConfigRoot; }
		set { mConfigRoot = value; }
	}

/*-----------------------------------------------------*/

	public String DefaultModuleRoot {
		get {return mDefaultModuleRoot;}
		set {mDefaultModuleRoot = value;}
	}
	
/*-----------------------------------------------------*/

	public String UNCRoot {
		get {return mUNCRoot;}
		set {mUNCRoot = value;}
	}
	
/*-----------------------------------------------------*/

	public String BaseURL {
		get {return mBaseURL;}
		set {mBaseURL = value;}
	}	
		
/*-----------------------------------------------------*/

	public String SecureURL {
		get {return mSecureURL;}
		set {mSecureURL = value;}
	}
		
/*-----------------------------------------------------*/

	public String Home {
		get {return mHome;}
		set {mHome = value;}
	}

	/*-----------------------------------------------------*/
	public int MaxFailedLoginAttempts 
	{
		get {return mMaxFailedLoginAttempts;}
		set {mMaxFailedLoginAttempts = value;}
	}
	
	/*-----------------------------------------------------*/

	//public XmlNode ConfigurableLabels
	//{
	//    get { return mConfigurableLabels; }
	//    set { mConfigurableLabels = value; }
	//}

/*-----------------------------------------------------*/

	public String LogoutURL {
		get {return mLogoutURL;}
		set {mLogoutURL = value;}
	}

/*----------------------------------------------------*/

	public cXMLDoc ConfigDoc {
		get {return mConfigDoc;}
	}

/*----------------------------------------------------*/
	
	public cXMLDoc DataDefinitionDoc {
		get {return mDataDefinitionDoc;}
	}

/*-----------------------------------------------------*/

	public cXMLDoc ClientDataDefinitionDoc {
		get { return mClientDataDefinitionDoc; }
	}

/*-----------------------------------------------------*/

	public String ReleaseBuildVersionHTML {
		get {
			XmlNode	aBuildNode = cXMLDoc.FindNode(Get_ApplNode(), "BuildVersions/BuildVersion", "BuildKey",
								BuildKey);
								
			return cXMLDoc.AttributeToString(aBuildNode, "Version") + 
					" - " + 
					"<b>" + cXMLDoc.AttributeToString(aBuildNode, "Build") + "</b>" +
					" (" + BuildKey + ")";
		}
	}
	
/*----------------------------------------------------*/
	
	public String DefaultStylesPath {
		get {
			XmlNode		aModulesNode;
			
			aModulesNode = Get_ApplNode().SelectSingleNode("Modules");
			return cXMLDoc.AttributeToString(aModulesNode, "ModuleStyle", "");
		}
	}

/*----------------------------------------------------*/

	public String ClientStylesPath {
		get
		{
			XmlNode aModulesNode;

			aModulesNode = Get_ApplNode().SelectSingleNode("Modules");
			return cXMLDoc.AttributeToString(aModulesNode, "ClientModuleStyle", "");
		}
	}

/*----------------------------------------------------*/

	public String WebAssembly {
		get {return mWebAssembly;}
		set {mWebAssembly = value;}
	}

/*----------------------------------------------------*/

	public String LocalPDFUrl {
		get {return mLocalPDFUrl;}
		set {mLocalPDFUrl = value;}
	}

/*----------------------------------------------------*/

	public bool CreateSubmissionHistory {
		get {return mCreateSubmissionHistory;}
		set {mCreateSubmissionHistory = value;}
	}

/*=====================================================*/

	public String ConfigLabelsCollection(String aArgKey){
		return mConfigLabelsCollection[aArgKey];		
	}
	
	/*=====================================================*/
	
	public void ConfigLabelsCollection(String aArgKey,String aVal)
	{
		mConfigLabelsCollection[aArgKey] = aVal;
	}

	/*=====================================================*/

	public String EGSettingsCollection(String aArgKey)
	{
		return mEGSettingsCollection[aArgKey];			
	}

	/*=====================================================*/

	public NameValueCollection SystemSettings
	{
		get { return mSystemSettings; }
		set { mSystemSettings = value; }
	}

	/*=====================================================*/

	public String GetSystemSetting(String aKey)
	{
		return SystemSettings[aKey];
	}

	/*=====================================================*/

	public void SetGetSystemSetting(String aKey, String aVal)
	{
		SystemSettings[aKey] = aVal;
	}

	/*=====================================================*/

	public cWebAppl(HttpApplication aHttpApp, String aConfigFileName) :
			base() {
		
		mConfigDoc = new cXMLDoc(aHttpApp.Server.MapPath(aConfigFileName));
		WebAppl_Init(aHttpApp, ConfigDoc);
	}
	
/*=====================================================*/

	private void WebAppl_Init(HttpApplication aHttpApp, XmlNode aApplNode) {
		XmlNode		aPropsN;
		
		aPropsN = cXMLDoc.FindNode(aApplNode, "Properties", "Key",
								cXMLDoc.AttributeToString(aApplNode, "ActiveProperties"));
		if (aPropsN != null) {
			LogoutURL = cXMLDoc.AttributeToString(aPropsN, "LogoutURL");
			Name = cXMLDoc.AttributeToString(aPropsN, "Name");
			Root = cXMLDoc.AttributeToString(aPropsN, "Root");
			ConfigRoot = cXMLDoc.AttributeToString(aPropsN, "ConfigRoot");
			this.mRootFileSystemPath = aHttpApp.Server.MapPath(Root);
			DefaultModuleRoot = cXMLDoc.AttributeToString(aPropsN, "DefaultModuleRoot", "");
			if (DefaultModuleRoot == "")
				DefaultModuleRoot = cXMLDoc.AttributeToString(aPropsN, "ModuleRoot");
			UNCRoot = cXMLDoc.AttributeToString(aPropsN, "UNCRoot");
			BaseURL = cXMLDoc.AttributeToString(aPropsN, "BaseURL");
			SecureURL = cXMLDoc.AttributeToString(aPropsN, "SecureURL");
			WebAssembly = cXMLDoc.AttributeToString(aPropsN, "WebAssembly");
			LocalPDFUrl = cXMLDoc.AttributeToString(aPropsN, "LocalPDFUrl");
			MaxFailedLoginAttempts = cXMLDoc.AttributeToInt(aPropsN,"MaxFailedLoginAttempts",0);
			mDataDefinitionDoc = new cXMLDoc(aHttpApp.Server.MapPath(cXMLDoc.AttributeToString(aPropsN, "DataDefinition")));
			if (mDataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions") == null)
				mDataDefinitionDoc = BuildDataDefinitionFromDB(aHttpApp, mDataDefinitionDoc);
			string aClientDataDefinitionFileWithPath = cXMLDoc.AttributeToString(aPropsN, "ClientDataDefinition", "");
			if (aClientDataDefinitionFileWithPath != "") {
				FileInfo aClientDDConfigFI = new FileInfo(aHttpApp.Server.MapPath(aClientDataDefinitionFileWithPath));
				if (aClientDDConfigFI.Exists) {
					mClientDataDefinitionDoc = new cXMLDoc(aHttpApp.Server.MapPath(cXMLDoc.AttributeToString(aPropsN, "ClientDataDefinition")));
					//Merge DataObjectDefinitions
					MergeDefinitions("DataObjectDefinitions", "Properties", "Property", mDataDefinitionDoc, mClientDataDefinitionDoc);

					//Merge DataCommandDefinitions
					MergeDefinitions("DataCommandDefinitions", "Parameters", "Parameter", mDataDefinitionDoc, mClientDataDefinitionDoc);
				}
			}
			LoadDataSources(mDataDefinitionDoc, aHttpApp);
			if (mDataDefinitionDoc.DocElement.SelectSingleNode("HorizontalNavigation") != null)
				BuildHorizNavFromDB(aHttpApp, mDataDefinitionDoc);
			CreateSubmissionHistory = cXMLDoc.AttributeToBool(aPropsN, "CreateSubmissionHistory", false);
			String aEventLogName = System.Configuration.ConfigurationSettings.AppSettings["EventLogName"];
			String aEventSource = System.Configuration.ConfigurationSettings.AppSettings["EventSource"];
			if(aEventLogName != "" && aEventSource != "") {
				try {
					EventLog = new EventLog(aEventLogName, ".", aEventSource);
				}
				catch (Exception e) {
					EventLog = null;
				}
			}
		}
		mSecretKey = cXMLDoc.AttributeToString(DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions"), "SecretKey", "");
		mSecretIV = cXMLDoc.AttributeToString(DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions"), "IV", "");
		//ConfigurableLabels = aApplNode.SelectSingleNode("ConfigurableLabels");
		BuildConfigurableLabels();
		GetSystemSettingsFromDB();
		BuildEGSettings();
	}
	/*-----------------------------------------------------*/

	public void BuildConfigurableLabels()
	{
		mConfigLabelsCollection = new NameValueCollection();
		cXMLDoc aXmlDoc; 
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		cDataObjectFactory aFactory = new cDataObjectFactory(this, DataDefinitionDoc);
		aXmlDoc = aFactory.CreateDataObjectNode("HeaderLabel", out aDataObjectNode, out aFiltersNode);
		cDataObjectList aLabelHeaderDOL = aFactory.GetDataObjectList(aDataObjectNode);			
		foreach (cDataObject aLabelHeaderDO in aLabelHeaderDOL)
		{
			mConfigLabelsCollection.Add((String)aLabelHeaderDO["LabelName"], (String)aLabelHeaderDO["LabelText"]);
		}
	}

	public void GetSystemSettingsFromDB()
	{
		mSystemSettings = new NameValueCollection();
		cXMLDoc aXmlDoc;
		XmlNode aDataObjectNode;
		XmlNode aFiltersNode;
		cDataObjectFactory aFactory = new cDataObjectFactory(this, DataDefinitionDoc);
		aXmlDoc = aFactory.CreateDataObjectNode("Systemsettings", out aDataObjectNode, out aFiltersNode);
		aFiltersNode.AppendChild(aFactory.CreateArgumentNode(aXmlDoc, "Data", "Value", "null", "And", "NotEqual"));
		cDataObjectList aSystemsettingsDOL = aFactory.GetDataObjectList(aDataObjectNode);
		foreach (cDataObject aSystemsettingsDO in aSystemsettingsDOL)
		{
			mSystemSettings.Add((String)aSystemsettingsDO["SysSettingName"], (String)aSystemsettingsDO["Value"]);
		}
	}
	
	
	/*-----------------------------------------------------*/

	private void LoadDataSources(cXMLDoc aBaselineDD, HttpApplication aHttpApp) {

		//Check for Developer.config
		FileInfo aDeveloperConfigFI = new FileInfo(aHttpApp.Server.MapPath(ConfigRoot + "Developer.config"));
		cXMLDoc aDataSourceConfigDoc = null;
		if (aDeveloperConfigFI.Exists && BuildKey == "Debug") {
			aDataSourceConfigDoc = new cXMLDoc(aHttpApp.Server.MapPath(ConfigRoot + "Developer.config"));
		} else {
			string aBuildKeyDSFileName = BuildKey + ".config";
			FileInfo aBuildKeyConfigFI = new FileInfo(aHttpApp.Server.MapPath(ConfigRoot + aBuildKeyDSFileName));
			if (aBuildKeyConfigFI.Exists) {
				aDataSourceConfigDoc = new cXMLDoc(aHttpApp.Server.MapPath(ConfigRoot + aBuildKeyDSFileName));
			}
		}
		if (aDataSourceConfigDoc != null) {
			base.LoadDataSources(aBaselineDD, aDataSourceConfigDoc);
		}
	}
	/*-----------------------------------------------------*/
	
	private void BuildHorizNavFromDB(HttpApplication aHttpApp, cXMLDoc aDoc)
	{
		String aKey, aMethod;
		StringBuilder aXML;
		XmlElement aElem;
		cDataObjectList aList;
		XmlNode aNavNode = aDoc.DocElement.SelectSingleNode("HorizontalNavigation");
		cDataObjectFactory aFactory = new cDataObjectFactory(this, aDoc);
		aElem = aDoc.XMLDocument.CreateElement("DataObjects");
		aElem.InnerXml = "<DataObject Key='HorizNav' DataObjectDefinitionKey='HorizNav'/>";
		cDataObjectList aNavList = aFactory.GetDataObjectList(aElem.SelectSingleNode("DataObject"));
		foreach (cDataObject aObj in aNavList)
		{
			aXML = new StringBuilder();
			aXML.Append("<TabControl Key='");
			aKey = aObj.GetPropertyString("KeyName");
			aXML.Append(aKey);
			aXML.Append("' NavStandard='");
			aXML.Append(cXMLDoc.AttributeToString(aNavNode, "NavStandardStyle"));
			aXML.Append("' NavSelected='");
			aXML.Append(cXMLDoc.AttributeToString(aNavNode, "NavSelectedStyle"));
			aXML.Append("' NavBorder='");
			aXML.Append(cXMLDoc.AttributeToString(aNavNode, "NavBorderStyle"));
			aXML.Append("'>");
			aList = aFactory.GetDataObjectListWithFilter("HorizNavElement", "HorizNavID", aObj.GetPropertyString("HorizNavID"));
			foreach (cDataObject aElemObj in aList)
			{
				aXML.Append("<NavElement Key='");
				aXML.Append(aElemObj.GetPropertyString("KeyName"));
				aXML.Append("' NavTitle='");
				aXML.Append(aElemObj.GetPropertyString("NavTitle"));
				aXML.Append("' Enabled='");
				if (aElemObj.GetPropertyBool("Enable") == true)
					aXML.Append("True");
				else
					aXML.Append("False");
				aXML.Append("' SourceFile='");
				aXML.Append(aElemObj.GetPropertyString("SourceFile"));
				aXML.Append("'>");
				
                int aCount = 1;
                cDataObjectList aArgList;
                aArgList = aFactory.GetDataObjectListWithFilter("HorizNavElementArg", "HorizNavElementID", aElemObj.GetPropertyString("HorizNavElementID"));
                if (aArgList.Count > 0)
                {
					aXML.Append("<Arguments>");
					foreach (cDataObject aElemArgObj in aArgList)
					{
						aXML.Append("<Argument Type='");
						aXML.Append(aElemArgObj.GetPropertyString("ArgType"));
						aXML.Append("' PropertyKey='");
						aXML.Append(aElemArgObj.GetPropertyString("ArgPropertyKey") + "'/>");
					}
					aXML.Append("</Arguments>");
                }
				//foreach (cDataObject aElemArgObj in aArgList)
				//{
				//        if (aCount == 1)
				//        {
				//            aXML.Append("' ArgType='");
				//            aXML.Append(aElemArgObj.GetPropertyString("ArgType"));
				//            aXML.Append("' ArgPropertyKey='");
				//            aXML.Append(aElemArgObj.GetPropertyString("ArgPropertyKey"));
				//        }
				//        else
				//        {
				//            aXML.Append("' ArgType" + aCount +"='");
				//            aXML.Append(aElemArgObj.GetPropertyString("ArgType"));
				//            aXML.Append("' ArgPropertyKey" + aCount + "='");
				//            aXML.Append(aElemArgObj.GetPropertyString("ArgPropertyKey"));
				//        }
				//        aCount = aCount + 1;
				//}

				aMethod = aElemObj.GetPropertyString("Method");
				if (aMethod.Trim() != "")
				{
					aXML.Append("<Action Method='");
					aXML.Append(aMethod);
					aXML.Append("'/>");
				}
				aXML.Append("</NavElement>");
			}
			aXML.Append("</TabControl>");
			aElem = aDoc.XMLDocument.CreateElement("TabControls");
			aElem.InnerXml = aXML.ToString();
			aHttpApp.Application["gHorizNav_" + aKey] = aElem;
		}
	}
	/*-----------------------------------------------------*/

	private cXMLDoc BuildDataDefinitionFromDB(HttpApplication aHttpApp, cXMLDoc aDoc)
	{
		String aConnString = "", aChild;
		StringBuilder aXML = new StringBuilder();
		XmlNodeList aDataNodeList = aDoc.DocElement.SelectNodes("DataSources/DataSource");
  
		foreach (XmlNode aDataNode in aDataNodeList) 
		{
			XmlNodeList aReleaseNodeList = aDataNode.SelectNodes("ReleaseBuild[@BuildKey='" + BuildKey + "']");
   
			if (aReleaseNodeList.Count > 0) 
			{
				XmlNode aArgNode = aDataNode.SelectSingleNode("Class/Arguments/Argument");
				aConnString = cXMLDoc.AttributeToString(aArgNode, "Value");
				break;
			}
		}
		IDataReader aReader, aPropertyRD, aRelatedRD;
		cSQLDBConn aConn, aPropertyConn, aRelatedConn;
		aConn = new cSQLDBConn(aConnString);
		SqlCommand aCmd  = new SqlCommand("select * from a_DATA_DEFINITION", (SqlConnection)aConn.DBConnection);
		aReader = aCmd.ExecuteReader();
    
		while (aReader.Read()) 
		{
			aXML.Append("<Definition Key='");
			aXML.Append(aReader.GetValue(1).ToString());
			aXML.Append("' DataSourceKey='");
			aXML.Append(aReader.GetValue(2).ToString());
			aXML.Append("' RowSource='");
			aXML.Append(aReader.GetValue(3).ToString());
			aXML.Append("'><Class Name='");
			aXML.Append(aReader.GetValue(4).ToString());
			aXML.Append("' Assembly='");
			aXML.Append(aReader.GetValue(5).ToString());
			aXML.Append("' FullName='");
			aXML.Append(aReader.GetValue(6).ToString());
			aXML.Append("'></Class><Properties>");
    
			aPropertyConn = new cSQLDBConn(aConnString);
			aCmd  = new SqlCommand("select * from a_DATA_PROPERTY where data_definition_id=" + aReader.GetValue(0).ToString(), (SqlConnection)aPropertyConn.DBConnection);
			aPropertyRD = aCmd.ExecuteReader();
   
			while (aPropertyRD.Read()) 
			{
				aXML.Append("<Property Key='");
				aXML.Append(aPropertyRD.GetValue(2).ToString());
				aXML.Append("' IsPrimaryKey='");
				aXML.Append(aPropertyRD.GetValue(3).ToString());
				aXML.Append("' IsIdentity='");
				aXML.Append(aPropertyRD.GetValue(4).ToString());
				aXML.Append("' DataType='");
				aXML.Append(aPropertyRD.GetValue(5).ToString());
				aXML.Append("' ColumnSource='");
				aXML.Append(aPropertyRD.GetValue(6).ToString());
				aXML.Append("'>");
				aChild = aPropertyRD.GetValue(8).ToString();
				if (aChild != "")
				{
					aXML.Append("<Relationship Type='");
					aXML.Append(aPropertyRD.GetValue(7).ToString());
					aXML.Append("' ChildDefinitionKey='");
					aXML.Append(aChild);
					aXML.Append("'><RelationshipProperties>");
     
					aRelatedConn = new cSQLDBConn(aConnString);
					aCmd  = new SqlCommand("select * from a_DATA_RELATED_PROPERTY where data_property_id=" + aPropertyRD.GetValue(0).ToString(), (SqlConnection)aRelatedConn.DBConnection);
					aRelatedRD = aCmd.ExecuteReader();
     
					while (aRelatedRD.Read()) 
					{
						aXML.Append("<RelationshipProperty parentProperty='");
						aXML.Append(aRelatedRD.GetValue(2).ToString());
						aXML.Append("' childProperty='");
						aXML.Append(aRelatedRD.GetValue(3).ToString());
						aXML.Append("'/>");
					}
					aRelatedRD.Close();
					aXML.Append("</RelationshipProperties></Relationship>");
				}
				aXML.Append("</Property>");
    
			}
			aPropertyRD.Close();
			aXML.Append("</Properties></Definition>");
		}
		aReader.Close();
		XmlElement aElem = aDoc.XMLDocument.CreateElement("DataObjectDefinitions");
		aElem.InnerXml = aXML.ToString();
		aDoc.DocElement.AppendChild(aElem);
  
		return aDoc;
	}
	/*-----------------------------------------------------*/

	private void WebAppl_Init(HttpApplication aHttpApp, cXMLDoc aXMLDoc) 
	{
		WebAppl_Init(aHttpApp, aXMLDoc.DocElement.SelectSingleNode("/descendant::Appl"));
	}

/*=====================================================*/

	public XmlNode	Get_ApplNode() {
		return ConfigDoc.DocElement.SelectSingleNode("Appl");
	}
	
/*=====================================================*/

	
	////<summary>
	///this series of methods retrieves information from a specific ModuleConfig,
	///even if the caller is not in that module
	///* they use <App>Config and module key to map to the appropriate ModuleConfig
	///</summary>
	protected XmlNode Get_Appl_ModuleNode(String aModuleKey) 
	{
		return cXMLDoc.FindNode(Get_ApplNode(), "Modules/Module", "Key", aModuleKey);
	}
	
/*----------------------------------------------------*/

	////<summary>
	///given aModuleKey, returns the cXMLDoc of the ModuleConfg file indicated in
	///the /Modules/Module[@Key='<aModuleKey>']/ConfigFile node of <App>Config
	///</summary>
	public cXMLDoc Get_ModuleConfigDoc(Page aPage, String aModuleKey) 
	{
		XmlNode		aApplModuleNode;
		
		aApplModuleNode = Get_Appl_ModuleNode(aModuleKey);
		
		return new cXMLDoc(aPage.Server.MapPath("/" + cXMLDoc.AttributeToString(aApplModuleNode, "ConfigFile")));
		//return new cXMLDoc(aPage.Server.MapPath(Build_RootURL(cXMLDoc.AttributeToString(aApplModuleNode, "ConfigFile"))));
	}

/*----------------------------------------------------*/

	
    ////<summary>
	///convenience method to get the ModuleNode of the ModuleConfig
	///</summary>
	public XmlNode Get_ModuleConfig_ModuleNode(Page aPage, String aModuleKey) 
	{
		cXMLDoc		aModuleConfigDoc;
		
		aModuleConfigDoc = Get_ModuleConfigDoc(aPage, aModuleKey);
		return aModuleConfigDoc.DocElement.SelectSingleNode("Module");
	}

/*----------------------------------------------------*/
	
	///<summary>
	///retrieves ModuleRoot for given ModuleName by:
	///* searching for ModuleName in Config's modules
	///* returning default
	///</summary>
	public String Get_ModuleRoot(String aModuleName) 
	{
		XmlNode		aApplModuleNode;
		
		aApplModuleNode = Get_Appl_ModuleNode(aModuleName);
		if (aApplModuleNode != null) {
			String aRoot;
			
			aRoot = cXMLDoc.AttributeToString(aApplModuleNode, "Root", "");
			if (aRoot != "")
				return aRoot;
		}
		
		return DefaultModuleRoot;
	}

/*----------------------------------------------------*/

	public String Get_RelativeDefaultModuleRoot() {
	//The DefaultModuleRoot property is currently configured to include the application
	//name (e.g., "Easygrants_v4_YMCA_r1/Easygrants_v4_YMCA_r1/Modules". Because of this,
	//it cannot be used as an argument with Build_RootURL or Build_UNCRoot because these
	//methods also include the application name; therefore, the resulting string would
	//repeat the application name and be invalid. This method strips the application
	//name from the front of the DefaultModuleRoot string so that it can be used with
	//these methods.
	
		String aRoot = DefaultModuleRoot;
		int aIndex = aRoot.IndexOf("/", 1);
		return aRoot.Substring(aIndex);
	}
/*=====================================================*/

	public String Build_RootURL(String aSourceFile) {
		return  Root + "/" + aSourceFile;
	}
	
/*-----------------------------------------------------*/

	public String Build_RootNameURL(ref String aSourceFile) {
		return  Root + "/" + Name + "/" + aSourceFile;
	}
	
/*-----------------------------------------------------*/

	public String Build_BaseURL(ref String aSourceFile) {
		return BaseURL + Root + "/" + aSourceFile;
	}
	
/*-----------------------------------------------------*/

	public String Build_UNCRoot(ref String aSourceFile) {
		return UNCRoot + "\\" + aSourceFile;
	}

/*=====================================================*/

	public String Remove_RootFromURL(String aSourceFile) {
		return  aSourceFile.Replace(Root + "/", "");
	}
	
/*=====================================================*/

	public String Get_ControlSrc(String aControlKey)
	{
		return Get_ControlSrc("",aControlKey,false);
	}

	public String Get_ControlSrc(String aControlType,String aControlKey, Boolean IsSPActive)
	{
		//if ((aControlType == "cUploadNew" || aControlType == "cUploadTemplate" || aControlType == "cUpload" || aControlType == "cUpload1" || aControlType == "cUploadSaveAll") && IsSPActive == true)
		XmlNode aControlNode = ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='" + aControlKey + "']");		
		if (aControlNode == null)
			return "";
		if (aControlType == "Upload" && IsSPActive && cXMLDoc.AttributeToString(aControlNode, "SPControlFile", "") != "")
			return cXMLDoc.AttributeToString(aControlNode, "SPControlFile", "");	
		else
			return cXMLDoc.AttributeToString(aControlNode, "ControlFile", "");				
	}
/*-----------------------------------------------------*/
	
	public override String SecretKey() {
		return mSecretKey;
	}
	
/*-----------------------------------------------------*/
	
	public override String SecretIV() {
		return mSecretIV;
	}

/*-----------------------------------------------------*/

	public void BuildEGSettings()
	{
		mEGSettingsCollection = new NameValueCollection();
		XmlNodeList aSettingNodeList = ConfigDoc.DocElement.SelectNodes("Appl/Settings/Setting");

		foreach (XmlNode aSettingNode in aSettingNodeList)
		{
			mEGSettingsCollection.Add((String)aSettingNode.Attributes["Key"].Value, (String)(String)aSettingNode.Attributes["Value"].Value);
		}
	}	
	
/*=====================================================*/
} // class cWebAppl


/*====================================================*/
}  //namespace Core.Web
