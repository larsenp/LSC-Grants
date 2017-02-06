using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Xml;
using Core.Web.User;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;

namespace Core.Web {
/*====================================================*/

///<summary>
///Base control class for all web controls
///</summary>
public class cCoreCtl : UserControl 
{
/*====================================================*/

	private cEventController mEventController;
	public const String kDenoteRequiredField = "<font color='red'>*</font>";
	private Boolean mHideInactiveItems  = true ;

/*-----------------------------------------------------*/

	public cCorePage CorePage {
		get {return (cCorePage)Page;}
	}
	
/*-----------------------------------------------------*/

	public cWebUser WebUser {
		get {return null;}
	}
	
/*-----------------------------------------------------*/

	public cWebAppl WebAppl {
		get {return CorePage.WebAppl;}
	}

/*-----------------------------------------------------*/

	public cWebSession WebSession {
		get {return CorePage.WebSession;}
	}
	
/*-----------------------------------------------------*/

	public virtual XmlNode DisplayPropertyNode{
		get {return null;}
		set {}
	}

/*-----------------------------------------------------*/

	public virtual HtmlControl ControlToValidate{
		get {return null;}
	}

/*-----------------------------------------------------*/

	public virtual HtmlControl ControlToCompare{
		get {return null;}
	}

/*-----------------------------------------------------*/

	public cEventController EventController{
		get {return mEventController;}
		set {mEventController = value;}
	}

/*-----------------------------------------------------*/

	public String CoreCtl_ClientID {
		get {
			String	aClientID = ClientID;
			
			aClientID = aClientID.Replace("_", ":");
			
			return aClientID;
		}
	}

/*-----------------------------------------------------*/

	public bool DebugSwitchEnabled {
		get { return CorePage.DebugSwitchEnabled; }		
	}

/*====================================================*/

	public virtual void CoreCtl_Configure(XmlNode aDisplayPropertyNode, cDataObjectList aDataObjectList){
		CoreCtl_SetVisibility(aDisplayPropertyNode, aDataObjectList);
	}

/*----------------------------------------------------*/

	public virtual void CoreCtl_SetCtlValueFromDataObject(cDataObject aDataObject) {
	}

/*----------------------------------------------------*/

	public virtual void CoreCtl_SetDataObjectValueFromCtl(XmlNode aDisplayPropertyNode, cDataObject aDataObject) {
	}
	
/*----------------------------------------------------*/

	public virtual void CoreCtl_SetDataObjectCheckedPropertyFromCtl(XmlNode aDisplayPropertyNode, ref cDataObjectList aDataObjectList) 
	{
	}
	
/*----------------------------------------------------*/

	//generic saving a data in this control
	//called by the search.ascx control
	public virtual bool CoreCtl_Search() 
	{
		return true;
	}

/*----------------------------------------------------*/

	//generic drop down list onchange event
	//called by the DropDown.ascx control
	public virtual void CoreCtl_DropDownChange() {

	}	
	
/*-----------------------------------------------------*/

	//generic resetting data in this control
	//called by the save.ascx control
	public virtual void CoreCtl_Reset() {
		CorePage.Redirect();
	}
	
/*-----------------------------------------------------*/

	//generic submission of module
	//called by the submit.ascx control
	public virtual void CoreCtl_Submit() {
	}
	
/*====================================================*/
	
	public virtual void CoreCtl_SetValues() {
	}
	
/*-----------------------------------------------------*/

	public virtual void CoreCtl_Load(Object aSrc, EventArgs aEvent) {
		
	}
	
/*-----------------------------------------------------*/
	
	public virtual Boolean CoreCtl_Valid(Object aSrc, EventArgs aEvent) {
		if(WebSession == null) {
			return false;
		}
		return true;
	}
	
/*-----------------------------------------------------*/

	public void Page_Load(Object aSrc, EventArgs aEvent) {
		//cLib.Runtime_Error();
		if(CoreCtl_Valid(aSrc, aEvent)) {
			CoreCtl_Load(aSrc, aEvent);
			//System.Reflection.Assembly aAssembly = System.Reflection.Assembly.Load(WebAppl.WebAssembly);
			//if (this.IsPostBack && aSrc.GetType().IsSubclassOf(aAssembly.GetType("Core_Web.Controls.Base.cDataPresenterCtl")))
			//    CoreCtl_SetValues();
			//else 
			if(!this.IsPostBack)
				CoreCtl_SetValues();
		} else {
			Response.Redirect(WebAppl.LogoutURL);
		}
		
	}
	
/*-----------------------------------------------------*/

	public virtual void Page_Unload(Object aSrc, EventArgs aEvent) {
		//cLib.Runtime_Error();
	}

/*-----------------------------------------------------*/

	public cCoreCtl CoreCtl_FindCoreCtl(ref String aCtlID) {
		Type	aType = (new cCoreCtl()).GetType();
		
		if(ID == aCtlID) {
			return this;
		}
		foreach (Control aCtl in Controls) {
			if (aType.IsInstanceOfType(aCtl)) {
				if(aCtl.ID == aCtlID) {
					return (cCoreCtl)aCtl;
				}				
				cCoreCtl	aFoundCtl;
				aFoundCtl = ((cCoreCtl)aCtl).CoreCtl_FindCoreCtl(ref aCtlID);
				if (aFoundCtl != null) {
					return aFoundCtl;
				}
			}
		}		
		return null;
	}
	
/*----------------------------------------------------*/

    public HtmlControl GetHTMLControl(XmlNode aDisplayPropertyNode) {
        return (HtmlControl)FindControl(cXMLDoc.GetControlID(aDisplayPropertyNode));
    }

/*----------------------------------------------------*/

    public cCoreCtl GetCoreControl(XmlNode aDisplayPropertyNode) {
        return (cCoreCtl)FindControl(cXMLDoc.GetControlID(aDisplayPropertyNode));
    }

/*----------------------------------------------------*/

	public void CoreCtl_SetVisibility(XmlNode aDisplayPropertyNode, cDataObjectList aDataObjectList) {
		XmlNodeList aVisibleNodeList = aDisplayPropertyNode.SelectNodes("Control/Visible/Argument");
		
		if(aVisibleNodeList.Count == 0)
			return;
		
		//if "Type" exists in Argument node
		foreach (XmlNode aArgumentNode in aVisibleNodeList){
			String aType = cXMLDoc.AttributeToString(aArgumentNode, "Type");
			if(aType != "" && aType != "Data")
				if(this.EventController != null){
					EventController.EventController_SetArgumentsInNodeList(aVisibleNodeList);
				}
			}		
		if(aDataObjectList.Count == 0){
			XmlNode aVisibleNode = aVisibleNodeList[0];
			if(cXMLDoc.AttributeToString(aVisibleNode, "NullDataObject") != "")
				Visible = cXMLDoc.AttributeToBool(aVisibleNode, "NullDataObject");
		}
			
		foreach (cDataObject aDataObject in aDataObjectList){
			if(aDataObject.MeetsFilterCriteria(aVisibleNodeList)) {
					Visible = true;
					return;
			}
			Visible = false;
		}
	}	

/*----------------------------------------------------*/

	public void CoreCtl_LoadScriptNodes(XmlNode aDisplayPropertyNode)
	{
		XmlNode aControlNode = aDisplayPropertyNode.SelectSingleNode("Control");
        XmlNodeList aScriptNodes = aControlNode.SelectNodes("AddScript");
        String aEventName, aScriptName, aParameters;
        if (aScriptNodes != null)
		{
			foreach (XmlNode aScriptNode in aScriptNodes)
			{
				aEventName = cXMLDoc.AttributeToString(aScriptNode, "Event");
				aScriptName = cXMLDoc.AttributeToString(aScriptNode, "Name");
				aParameters = "";
				XmlNodeList aParamNodes = aScriptNode.SelectNodes("Parameter");

				if (aParamNodes != null)
				{
					foreach (XmlNode aParam in aParamNodes)
					{
						if (cXMLDoc.AttributeToString(aParam, "Key") == "ControlID")
						{
							aParameters = aParameters + UniqueID;
						}
						else if (cXMLDoc.AttributeToString(aParam, "Key") == "ParentControlID")
						{
							aParameters = aParameters + Parent.UniqueID;
						}
						else
						{
							aParameters = aParameters + cXMLDoc.AttributeToString(aParam, "Key") + ",";
						}
					}
					aParameters.Trim(',');
				}
				AddScript(aEventName, aScriptName, aParameters);
			}
		}
	}

/*----------------------------------------------------*/

	public virtual void AddScript(String aEvent, String aScriptName, String aParameters)
	{
	}

/*----------------------------------------------------*/

	public String GetLabel(string LabelName)
	{
		return CorePage.GetLabel(LabelName);
	}

/*-----------------------------------------------------*/

	public virtual Boolean Enable {
		get { return true; }
		set { }
	}

/*-----------------------------------------------------*/

	 public virtual Boolean HideInactiveItems{
        get
           { return mHideInactiveItems; }
        set {
            mHideInactiveItems = value;
        }
    }
	
/*-----------------------------------------------------*/   

	public void HideInactiveLookupValues(XmlNode aControlNode, XmlNode aFilterNode, string aDefinitionKey, bool aHideInactiveItems)
	{
		XmlNode aOldFilters= null;
		XmlNode aNewFilters = null;
		String aBaseDataType = cXMLDoc.AttributeToString(aControlNode, "DataObjectDefinitionKey", aDefinitionKey);
		if (aHideInactiveItems && aBaseDataType != "")
			{
				XmlNode aBaseObjDefNode   = WebSession.DataObjectFactory.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aBaseDataType + "']");
				XmlNode aPropKeyNode   = cXMLDoc.FindNode(aBaseObjDefNode, "Properties/Property", "Key", "EndDate");
				cDataObject aCodeTableDO   = WebSession.DataObjectFactory.GetDataObjectListWithFilter("IDGen", "TableName", cXMLDoc.AttributeToString(aBaseObjDefNode, "RowSource", "IDGen"))[0];
				bool aCodeTable   = false;
				if ( aCodeTableDO != null )	{
					if ( aCodeTableDO.GetPropertyValue("IsCodeTable") != System.DBNull.Value){
						aCodeTable = aCodeTableDO.GetPropertyBool("IsCodeTable");			
					}		
				}

				if ( aPropKeyNode != null && aCodeTable ){		
					cXMLDoc aXmlDoc   = new cXMLDoc();
					aXmlDoc.LoadFromXML(aControlNode.OuterXml);			
					if (aFilterNode == null)
					{
						aFilterNode = aXmlDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Filters", "");
						aXmlDoc.DocElement.AppendChild(aFilterNode);
						aFilterNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "(", ""));
					}	
					else
					{
						aOldFilters = aControlNode.SelectSingleNode("Filters");
						aFilterNode = aXmlDoc.DocElement.SelectSingleNode("Filters");
						aFilterNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("));
					}
					aFilterNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "CurrentDateTime", "EndDate", "", "", "GreaterThan"));
					aFilterNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "", "EndDate", "", "Or"));
					aFilterNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""));
					if (aOldFilters != null){
						aControlNode.RemoveChild(aOldFilters);
					}	
					aNewFilters = aControlNode.OwnerDocument.CreateNode(XmlNodeType.Element, "Filters", "");
					aNewFilters.InnerXml = aFilterNode.InnerXml;
					aControlNode.AppendChild(aNewFilters);					
					
				}				
			}										
	}
	
	public String ConfigurableText(string aValidationText)
	{
		return CorePage.ConfigurableText(aValidationText);
	}

	
	

/*====================================================*/
} //class cCoreCtl


/*====================================================*/
}  //Core.Web
