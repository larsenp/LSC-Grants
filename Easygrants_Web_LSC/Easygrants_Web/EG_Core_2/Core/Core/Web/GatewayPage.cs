using System;
using System.Data;
using System.Xml;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Collections.Specialized;
using Core.Web;
using Core.Web.Modules;
using Core.Web.User;
using Core.Web.Navigation;
using Core.DataAccess.XMLAccess;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Diagnostics;

namespace Core.Web {
/*====================================================*/

///<summary>
///Web Session Application Gateway Object -migrates pre-existing web sessions 
///</summary>
public class cGatewayPage : cCorePage 
{
/*====================================================*/

	protected	HtmlGenericControl spnConfigXML	= new HtmlGenericControl();	

	private	cXMLDoc	mXMLDoc;	
	private String mUserSubType;
	private String mEGUserID;
	private EventLog aEvtLog = new EventLog("Application", ".", "AppEvent");
	
	//These need to be set with IAPPS coordination
	private Byte[] mSecretKey = {42, 16, 93, 156, 78, 4, 218, 32};
	private Byte[] mSecretIV = {55, 103, 246, 79, 36, 99, 167, 3};

/*====================================================*/

	public String CookieKey {
		get {
			//get from XML
			
			return "EGIAPPSGATEWAY";
		}
	}
/*----------------------------------------------------*/

	public HttpCookie Cookie {
		get {
			if (Request.Cookies[CookieKey] == null)
			{				
				return null;
			}			
			else //if (Direction == "In")
			{
				aEvtLog.WriteEntry("req cookie value from extranet is " + Request.Cookies[CookieKey].Value);
				HttpCookie aCookie = new HttpCookie(CookieKey);
				aCookie.Value = Server.UrlDecode(Request.Cookies[CookieKey].Value);
				Request.Cookies.Clear();
				Request.Cookies.Add(aCookie);
				aEvtLog.WriteEntry("req cookie value after decoding " + Request.Cookies[CookieKey].Value);						
				return Request.Cookies[CookieKey];
			}
		}
	}

/*----------------------------------------------------*/

	public String Direction {
		get { return Request.QueryString["Direction"]; }
	}
/*----------------------------------------------------*/

	public String GatewayOutUrl {
		get { return cXMLDoc.AttributeToString(Get_GatewaysNode("Default"), "URL"); }
	}

/*----------------------------------------------------*/

	public String RequestKeyOut {
		get { return Request.QueryString["RequestKey"]; }
	}

/*----------------------------------------------------*/
	
	public String UserHashKeyUrl {
		get { return Request.QueryString["UserHashKey"]; }
	}
	
/*----------------------------------------------------*/
//Target Url determined from the user's previouso request
	public String TargetUrl {
		get { return Request.QueryString["TargetUrl"]; }	
	}
/*----------------------------------------------------*/

	public NameValueCollection RequestArgsOut {
		get { 
			//return Server.UrlDecode(Request.QueryString["RequestArgs"]); 
			//String aVal = "";
			String[] aArgs = null;
			String[] aPairs = null;
			NameValueCollection aNameVal = new NameValueCollection();			
			aArgs = Server.UrlDecode(Request.QueryString["RequestArgs"]).Split('&');
			for (int i=0; i < aArgs.Length; i++) {
				aPairs = aArgs[i].Split('=');
				aNameVal.Add(aPairs[0], aPairs[1]);
			}
				
		return aNameVal;
		}
	}
		
/*----------------------------------------------------*/
	
	public String RequestKeyIn {
		get {
			if (Cookie["RequestKey"] == null)
			{
				Process_Invalid_Request();
				return null;
			}
			else
			{				
				return Cookie["RequestKey"].ToString();
			}
		}
	}
	
/*----------------------------------------------------*/
	
	public String UserHashKeyCookie {
		get {
			if (Cookie["UserHashKey"] == null)
			{
				Process_Invalid_Request();
				return null;
			}
			else
				return Cookie["UserHashKey"].ToString();
		}
	}
	
/*----------------------------------------------------*/	
	
	public String UserIDCookie {
		get { 
			if (Cookie["Session_EG_UserID"] == null)
				return "";
			else
				return Cookie["Session_EG_UserID"].ToString();
		}
	}
	
/*----------------------------------------------------*/	
	
	public String EGUserID {
		get { 
			return mEGUserID;			
		}
		set{
			mEGUserID = value;
		}
	}


/*----------------------------------------------------*/	
	
	public String TargetUrlCookie {
		get {
			if (Cookie["TargetUrl"] != null)				
				return Cookie["TargetUrl"].ToString();
			else
				return null;
		}
	}	
/*----------------------------------------------------*/

	public cXMLDoc PageConfigDoc{
		get {
			if(spnConfigXML != null){
				mXMLDoc	= new cXMLDoc();
				mXMLDoc.LoadFromXML(spnConfigXML.InnerText);
				if(mXMLDoc.DocElement == null){
					mXMLDoc	= null;
				}
			}
			
			return mXMLDoc;
		}
	}
	
/*----------------------------------------------------*/
	
	private Byte[] SecretKey {
		get {
			return mSecretKey;
		}
	}
	
/*----------------------------------------------------*/
	
	private Byte[] SecretIV {
		get {
			return mSecretIV;
		}
	}

/*----------------------------------------------------*/
//UserSubtype determined from the db
	public String UserSubType {
		get {
			return mUserSubType;
		}
		set {
			mUserSubType = value;
		}	
	}
	
/*====================================================*/

	public XmlNode Get_RequestOutNode(String aRequestKey) {
	
		XmlNode aNode;
		try{
			aNode = cXMLDoc.FindNode(PageConfigDoc.DocElement, "RequestOuts/RequestOut", "Key", aRequestKey);
			return aNode;
		}catch(SystemException se) {
			String errMsg = se.Message;
			aNode = null;
		}
		return aNode;
	}

/*----------------------------------------------------*/

	public XmlNode Get_RequestInNode(String aRequestKey) {		

		XmlNode aNode;
		try{
			aNode = cXMLDoc.FindNode(PageConfigDoc.DocElement, "RequestIns/RequestIn", "Key", aRequestKey);
			return aNode;
		}catch(SystemException se) {
			String errMsg = se.Message;
			aNode = null;
		}
		return aNode;
	}

/*----------------------------------------------------*/

	public XmlNode Get_GatewaysNode(String aRequestKey) {
		
		XmlNode aNode;
		aNode = cXMLDoc.FindNode(PageConfigDoc.DocElement, "Gateways/Gateway", "Key", aRequestKey);
		if (aNode != null) return aNode;
		else return null;		
	}

/*----------------------------------------------------*/

	public XmlNode Get_InvalidRequestsNode(String aRequestKey) {
	
		if(aRequestKey == "") {
			aRequestKey = "Default";
		}
		XmlNode aNode;
		try{
			aNode = cXMLDoc.FindNode(PageConfigDoc.DocElement, "InvalidRequests/InvalidRequest", "Key", aRequestKey);
			return aNode;
		}catch(SystemException se) {
			String errMsg = se.Message;
			aNode = null;
		}
		return aNode;
	}

/*----------------------------------------------------*/

	public HttpCookie Get_Cookie(bool aCreateNew) {
		HttpCookie aCookie = null;				
		if (Cookie == null && aCreateNew) {
			//do something
			aCookie = new HttpCookie(CookieKey);								
			Response.Cookies.Add(aCookie);
		}
		aCookie = Cookie;
		return aCookie;
	}
	
/*----------------------------------------------------*/

	public String Get_RequestArg(String aArgKey) {		
		return 	RequestArgsOut[aArgKey];
	}
	
/*====================================================*/

	public override void CorePage_Load(Object aSrc, EventArgs aEvent) {
	
		//base.CorePage_Load(aSrc, aEvent);
		if(Direction == "In") {
			Process_In_Request();
		}
		else if(Direction == "Out") {
			Process_Out_Request();
		}				
	}

/*----------------------------------------------------*/

	public void Process_Out_Request() {
		XmlNode aProcOutReq;
		
		//Get_Cookie(true) - guranteed to get a valid cookie, will create...
		if(Get_RequestOutNode(RequestKeyOut) != null) {
			aProcOutReq = Get_RequestOutNode(RequestKeyOut);
			Set_RequestOut_Info();
			//String aUrl = WebAppl.BaseURL + GatewayOutUrl;
			String aUrl = GatewayOutUrl;
			aUrl = cWebLib.AddQuerystringParameter(aUrl, "Direction", "In");
			//aUrl = cWebLib.AddQuerystringParameter(aUrl, "UserHashKey", HashValue(Response.Cookies[CookieKey]["UserHashKey"]));		
			aEvtLog.WriteEntry("req out url " + aUrl);
			Response.Redirect(aUrl);			
		}
		else if(Request.QueryString["returnurl"] != null){
			Set_RequestOut_Info();
			String aUrl = GatewayOutUrl;
			aUrl = cWebLib.AddQuerystringParameter(aUrl, "Direction", "In");
			//aUrl = cWebLib.AddQuerystringParameter(aUrl, "UserHashKey", HashValue(Response.Cookies[CookieKey]["UserHashKey"]));
			aUrl = cWebLib.AddQuerystringParameter(aUrl, "returnurl", Request.QueryString["returnurl"]);
			aEvtLog.WriteEntry("req out url " + aUrl);
			Response.Redirect(aUrl);			
		}
		else {
			Process_Invalid_Request();
		}		
	}
	
/*----------------------------------------------------*/

	public virtual void Process_In_Request() {
				
		HttpCookie aCookie = Get_Cookie(false);
		if(aCookie == null) {
			Process_Invalid_Request();
		}					
	}
	
/*----------------------------------------------------*/

	public void Process_Invalid_Request() {
	
		//Since all users are using EG login page, users with invalid requests are logged out
		Response.Redirect(this.WebAppl.LogoutURL);
	}

/*----------------------------------------------------*/

	public void Update_Cookie_For_Session() {
	}

/*----------------------------------------------------*/
	
	public bool Validate_UserHashKey() {
		//this method will get the hashed timestamp from the url and compare it with the encrypted timestamp from cookie
		//byte[] hashBytes = UnicodeEncoding.ASCII.GetBytes(UserHashKeyUrl);
		
		//check for cookie existence first
		if (Cookie == null) {
			String urlHashKey = UserHashKeyUrl;
			byte[] valueBytes = UnicodeEncoding.ASCII.GetBytes(urlHashKey);
			CheckHashValue("1001", valueBytes);
			Process_Invalid_Request();
		}
		if (UserHashKeyCookie == "" || UserHashKeyUrl == "" ){
			return false;
		}		
		//else if(CheckHashValue(UserHashKeyCookie, hashBytes)) {
		else if(UserHashKeyUrl.Equals(UserHashKeyCookie)) {
			return true;
		}
		else {
			return false;
		}
	}

/*----------------------------------------------------*/

	public virtual void Set_RequestOut_Info() {

		HttpCookie aCookie = Get_Cookie(true);
		Request.Cookies.Remove(CookieKey);
		Response.Cookies.Remove(CookieKey);
		aCookie["UserHashKey"] = DateTime.Now.ToString();
		aCookie["RequestKey"] = RequestKeyOut;
		aCookie["TargetUrl"] = TargetUrl;
		aCookie["Session_EG_UserID"] = EGUserID;
		aCookie.Path = "/";
		aCookie.Domain = "wtgrantfoundation.org";
//		aCookie[Encrypt("UserHashKey")] = Encrypt("100001");
//		aCookie[Encrypt("RequestKey")] = Encrypt(RequestKeyOut);
		aCookie.Expires = DateTime.Now.AddDays(30);
		Response.Cookies.Add(aCookie);
	}
	
/*----------------------------------------------------*/
	
	private void Simulate_Cookie() {
		HttpCookie aCookie = Get_Cookie(true);
		aCookie["UserHashKey"] = DateTime.Now.ToString();
		aCookie["RequestKey"] = RequestKeyOut;
		aCookie["Session_EG_UserID"] = "80344";
		aCookie.Path = "/";
		aCookie.Domain = "wtgrantfoundation.org";		
		Request.Cookies.Set(Cookie);
	}
	
/*----------------------------------------------------*/
	
	protected String Encrypt(String originalString)
	{
		DESCryptoServiceProvider desSvc = new DESCryptoServiceProvider();			
				
		MemoryStream ms = new MemoryStream();
		CryptoStream encStream = new CryptoStream(ms, desSvc.CreateEncryptor(SecretKey, SecretIV), CryptoStreamMode.Write);
		
		StreamWriter sw = new StreamWriter(encStream);
		sw.Write(originalString);
		sw.Flush();
		encStream.FlushFinalBlock();
		ms.Flush();
		
		return Convert.ToBase64String(ms.ToArray());
	}

/*----------------------------------------------------*/
	
	protected String Decrypt(String encString)
	{
		Byte[] encBytes = Convert.FromBase64String(encString);
		DESCryptoServiceProvider desSvc = new DESCryptoServiceProvider();				
		MemoryStream ms = new MemoryStream(encBytes);
		CryptoStream decStream = new CryptoStream(ms, desSvc.CreateDecryptor(SecretKey, SecretIV), CryptoStreamMode.Read);
		
		StreamReader sr = new StreamReader(decStream);
		String decString = sr.ReadToEnd();
		sr.Close();
		ms.Flush();
		
		return decString;
	}
	
/*----------------------------------------------------*/

	protected bool CheckHashValue(String valueStr, byte[] inputHash)
	{
		byte[] valueBytes = UnicodeEncoding.ASCII.GetBytes(valueStr);
		MD5CryptoServiceProvider ckHash = new MD5CryptoServiceProvider();
		byte[] newHashValue = ckHash.ComputeHash(valueBytes);
		bool Same = true;
		for (int i=0; i < inputHash.Length; i++)
		{
			if (inputHash[i] != newHashValue[i] )
				Same = false;
		}
		return Same;
	}
	
	protected String HashValue(String valueStr)
	{
		byte[] valueBytes = UnicodeEncoding.ASCII.GetBytes(valueStr);
		MD5CryptoServiceProvider ckHash = new MD5CryptoServiceProvider();
		return UnicodeEncoding.ASCII.GetString(ckHash.ComputeHash(valueBytes));
		
	}

/*====================================================*/
}//public class cGatewayPage


/*====================================================*/
}  //namespace Core.Web
