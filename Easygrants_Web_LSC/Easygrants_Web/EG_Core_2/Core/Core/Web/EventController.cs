using System;
using System.Xml;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Reflection;
using System.Collections;
using System.Text;
using Core.User;
using Core.Web.Modules;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;
using Core.Util;

namespace Core.Web {
/*====================================================*/
///<summary>
/// User event control base class
///</summary>
public class cEventController : cCoreCtl 
{
/*====================================================*/
	private Boolean mSecurityGroupCheck;

	public Boolean SecurityGroupCheck
	{
		get { return mSecurityGroupCheck; }
		set { mSecurityGroupCheck = value; }
	}
	
	public virtual HtmlGenericControl PageParamsContainer {
		get {return null;}
		set {}
	}
		
/*----------------------------------------------------*/

	public virtual Hashtable DataObjectCollection {
		get {return null;}
	}

/*----------------------------------------------------*/

	public cEventController() {
	}

/*----------------------------------------------------*/

	public virtual void EventController_ControlClicked(Object aSrc, ImageClickEventArgs aEvent) {
		EventController_ControlClicked(aSrc, (EventArgs)aEvent);
	}
	
/*----------------------------------------------------*/

	public virtual void EventController_ControlClicked(Object aSrc, EventArgs aEvent) {
		cCoreCtl aCtl = GetCoreControlFromEventSource((Control)aSrc);
		XmlNodeList aActionNodeList = cXMLDoc.GetActionNodeList(aCtl.DisplayPropertyNode);
		foreach(XmlNode aActionNode in aActionNodeList) {
			EventController_ExecuteActionMethod(aActionNode, aSrc, aCtl);
		}
	}

/*----------------------------------------------------*/

	public virtual void EventController_ExecuteActionMethod(XmlNode aActionNode, Object aSrc, cCoreCtl aCtl) {

			String aObjectKey = cXMLDoc.AttributeToString(aActionNode, "Object");
			String aMethodName = GetActionMethod(aActionNode);
						
			Object aObject = EventController_GetActionTarget(aObjectKey, aActionNode, aCtl);
			Type aType = aObject.GetType();
			//Object[] aArgs = new Object[0];
			ArrayList aArgsList = new ArrayList();
			
			EventController_GetEventMethodArgs(aArgsList, aCtl, aSrc, aActionNode);
			
			Type[] aTypes;
			/*build array of types*/
			aTypes = new Type[aArgsList.Count];
			for(int i = 0; i < aArgsList.Count; i++) {
				aTypes[i] = aArgsList[i].GetType();
			}
			MethodInfo aMethod = aType.GetMethod(aMethodName, aTypes);
			aMethod.Invoke(aObject, aArgsList.ToArray());
	}
/*----------------------------------------------------*/

	public virtual void EventController_ControlValidate(Object aSrc , ServerValidateEventArgs aArgs) {
		cCoreCtl aCtl; 
		XmlNode aValidationNode;
		
		aArgs.IsValid = false;
		
		if (((BaseValidator)aSrc).ControlToValidate != null){
			aCtl = GetControl(((BaseValidator)aSrc).ControlToValidate);
			aValidationNode = aCtl.DisplayPropertyNode.SelectSingleNode("Control/Validation");
		
			String aObjectKey = cXMLDoc.AttributeToString(aValidationNode, "Object");
			String aMethodName = GetActionMethod(aValidationNode);
			
			Object aObject = EventController_GetActionTarget(aObjectKey, aCtl);
			Type aType = aObject.GetType();
			Object[] aMethodArgs;
			aMethodArgs= new Object[2];
			aMethodArgs[0] = aSrc;
			aMethodArgs[1] = aArgs;
			
			Type[] aTypes;
			if(aMethodArgs == null)
				aTypes = new Type[0];
			else {
				/*build array of types*/
				aTypes = new Type[aMethodArgs.Length];
				for(int i = 0; i < aMethodArgs.Length; i++) {
					aTypes[i] = aMethodArgs[i].GetType();
				}
			}
			MethodInfo aMethod = aType.GetMethod(aMethodName, aTypes);
			aArgs.IsValid =(bool)aMethod.Invoke(aObject, aMethodArgs);
		}
	}

/*----------------------------------------------------*/
		
	protected cCoreCtl GetCoreControlFromEventSource(Control aSrc) {
		Type aCoreCtlType = (new cCoreCtl()).GetType();
		
		while (aSrc != null) {
			if (aSrc.GetType().IsSubclassOf(aCoreCtlType)) {
				if (((cCoreCtl)aSrc).DisplayPropertyNode != null)
					break;
			}
			
			aSrc = aSrc.Parent;
		}
		
		return (cCoreCtl)aSrc;
	}

/*----------------------------------------------------*/

	public virtual void EventController_GetEventMethodArgs(ArrayList aArgsList, cCoreCtl aCtl, Object aEventSrc, XmlNode aActionNode) {
		XmlNode		aArgumentsNode = aActionNode.SelectSingleNode("Parameters");
		
		if (aArgumentsNode == null)
			return;

		XmlNodeList		aArgsNodeList = aArgumentsNode.SelectNodes("Argument");
		
		foreach(XmlNode aArgumentNode in aArgsNodeList) {

			String aAttributeName = cXMLDoc.AttributeToString(aArgumentNode, "AttributeName");
			String aType = cXMLDoc.AttributeToString(aArgumentNode, "Type");

			if(aAttributeName!= "") {
				switch(aType) {
					case "":
						aArgsList.Add(cXMLDoc.AttributeToString(aArgumentNode, "Value"));
						break;
					case "AttributeRelatedProperty":
						String aDODKey = cXMLDoc.AttributeToString(aArgumentNode, "DataObjectDefinitionKey");
						String aPrimaryKey = aCtl.Attributes[aAttributeName];
						cDataObject aDO = this.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey(aDODKey, aPrimaryKey);
						String aPropertyKey = cXMLDoc.AttributeToString(aArgumentNode, "PropertyKey");
						if(aDO.GetRelatedPropertyString(aPropertyKey) != "")
							aArgsList.Add(cXMLDoc.AttributeToString(aArgumentNode, "BaseValue") + aDO.GetRelatedPropertyString(aPropertyKey));
						else
							aArgsList.Add(cXMLDoc.AttributeToString(aArgumentNode, "BaseValue") + cXMLDoc.AttributeToString(aArgumentNode, "DefaultValue", "0"));
						break;
					default:
						aArgsList.Add(cXMLDoc.AttributeToString(aArgumentNode, "BaseValue") + 
							aCtl.Attributes[aAttributeName]);
						break;
				}
			}
			else {
				switch (aType) {
					case "Object" :
						aArgsList.Add(EventController_GetEventArgumentObject(aArgumentNode, aCtl, aEventSrc));
						break;
					default :
						if(aType == "")
							aArgsList.Add(cXMLDoc.AttributeToString(aArgumentNode, "Value"));
						else
							aArgsList.Add(cXMLDoc.AttributeToString(aArgumentNode, "BaseValue") +
								EventController_GetArgumentValue(aArgumentNode, null));
						break;
				}
			}
		}
	}
		
/*----------------------------------------------------*/

	public cCoreCtl GetControl(XmlNode aControlNode) {
		HtmlControl aContainerCtl;
		cCoreCtl aCtl;
		String aControlID;

		aControlID = aControlNode.Attributes["ID"].Value;
		if(aControlID == null)
			aControlID = "";

		if(aControlNode.Attributes["Container"] != null) {
			aContainerCtl = (HtmlControl)FindControl(aControlNode.Attributes["Container"].Value);
			return GetControl(aContainerCtl, aControlNode, aControlID);
		}
		
		aCtl = GetControl(aControlID);
		return aCtl;
	}

/*----------------------------------------------------*/

	public cCoreCtl GetControl(HtmlControl aContainerCtl, XmlNode aControlNode) {
		String aControlID;
		aControlID = cXMLDoc.AttributeToString(aControlNode, "ID");
		if(aControlID == null)
			aControlID = "";
		return GetControl(aContainerCtl, aControlNode, aControlID);
	
	}

/*----------------------------------------------------*/

	public cCoreCtl GetControl(HtmlControl aContainerCtl, XmlNode aControlNode, String aControlID) {
			cCoreCtl aCtl;			
			XmlNode aEGControlNode= null;
			String aControlType="";
			
			//create new control if container is empty; there is always one control in HTMLGenericControl
			if(aContainerCtl.Controls.Count == 0) {
				//Here we are checking whether the SharePoint Integration is Active
				Boolean IsSPActive = false;
				cDataObjectList aSharePointList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration" , "Active" , "True");
				if(aSharePointList.Count > 0)
					IsSPActive = true;
				
				//Load control by getting the type of control from aControlNode
				//and the location of control from EGConfig.xml = WebAppl.ConfigDoc
				if (IsSPActive == true){
					aEGControlNode = WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='" + aControlNode.Attributes["Type"].Value + "']");
					aControlType=cXMLDoc.AttributeToString(aEGControlNode, "Type", "");
				}

				aCtl = (cCoreCtl)LoadControl(WebAppl.Get_ControlSrc(aControlType, aControlNode.Attributes["Type"].Value, IsSPActive));
				
						
				if(aControlID != null && aControlID != "")
					aCtl.ID = aControlID;
				aContainerCtl.Controls.Add(aCtl);
			}
			else 
				aCtl = (cCoreCtl)aContainerCtl.FindControl(aControlID);
			
			return aCtl;
	}

/*----------------------------------------------------*/

	public cCoreCtl GetControl(String aControlID) {
		if(FindControl(aControlID).GetType().IsSubclassOf(new cCoreCtl().GetType()))
			return (cCoreCtl)FindControl(aControlID);
		else
			return null;
	
	}
		
/*----------------------------------------------------*/

	public cCoreCtl GetNewCoreControl(String aType) {
		return (cCoreCtl)LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='" + aType + "']").Attributes["ControlFile"].Value);
	}

/*----------------------------------------------------*/

	public virtual Object EventController_GetActionTarget(String aActionKey, XmlNode aActionNode, Object aSrc) {
		XmlNode aDisplayPropertyNode;
		
		switch(aActionKey) {
			case "EventController":
				return this;
			case "EventControllerControl":
				Control aCtl = FindControl(cXMLDoc.AttributeToString(aActionNode, "ControlID"));
				return aCtl;
			case "Source":
				return aSrc;	
			case "DataObjectFactory":
				return WebSession.DataObjectFactory;
			case "DataObject":
				String aID = ((cCoreCtl)aSrc).ID;
				aDisplayPropertyNode = ((cCoreCtl)aSrc).DisplayPropertyNode;
				return "Hack";
			case "Class":
				//instantiate class, passing any parameters to the constructor
				aDisplayPropertyNode = ((cCoreCtl)aSrc).DisplayPropertyNode;
				XmlNode aClassNode = aDisplayPropertyNode.SelectSingleNode("Control/Action/Class");
				EventController_SetArgumentsInNodeList(aClassNode);
				return cReflection.InstantiateObjectFromXMLClassNode(aClassNode);
				//break;
			case "WebSession":
				return WebSession;
			/*
				commented by LCF/KR because we questioned how this fit as a target?
			case "RequestURLPathAndQuery":
				return WebSession.CurrentPage.Request.Url.PathAndQuery;
			*/
			case "ModulePage":
				return ((cModulePage)WebSession.CurrentPage);
			case "ModulePageContent":
				return ((cModulePage)WebSession.CurrentPage).PageContentCtl;
			case "DataPresenter":
				return this;
			case "ModuleUser":
				return ((cModulePage)Page).ModuleUser;
		}
		
		return "Hack";
	}

/*----------------------------------------------------*/

	public virtual Object EventController_GetActionTarget(String aActionKey, Object aSrc) {
		return EventController_GetActionTarget(aActionKey, null, aSrc);
	}

/*----------------------------------------------------*/

    public virtual Object EventController_GetEventArgumentObject(XmlNode aArgumentNode, 
                        cCoreCtl aCtl, Object aEventSrc) {

        String aObjectType;
        aObjectType = cXMLDoc.AttributeToString(aArgumentNode, "ObjectType");

        switch(aObjectType) {
            case "DataPresenter":
                return this;
            case "CoreControl":
                return aCtl;
            case "EventSource":
                return aEventSrc;
            default:
                return null;
        }
    }

/*----------------------------------------------------*/

	public String GetActionMethod(XmlNode aActionNode) {
		return cXMLDoc.AttributeToString(aActionNode, "Method");
	}
	
/*----------------------------------------------------*/

	public void EventController_SetArgumentsInNodeList(XmlNode aParentNode) {
		XmlNodeList aArgumentsList = cXMLDoc.GetArgumentsList(aParentNode);
		EventController_SetArgumentsInNodeList(aArgumentsList);
	}

/*----------------------------------------------------*/

	public void EventController_SetArgumentsInNodeList(XmlNodeList aArgumentsList) {
		EventController_SetArgumentsInNodeList(aArgumentsList, null);
	}
	
/*----------------------------------------------------*/
/*
	main version:
	* iterates through nodes in aArgumentsList and sets value
*/
	public void EventController_SetArgumentsInNodeList(XmlNodeList aArgumentsList, cDataObject aDataObject) {
		foreach(XmlNode aArgumentNode in aArgumentsList) 
			EventController_SetValueInArgumentNode(aArgumentNode, aDataObject);
	}

/*----------------------------------------------------*/

	public void EventController_SetValueInArgumentNode(XmlNode aArgumentNode, cDataObject aDataObject) {
			XmlAttribute	aAttr;
			
			//if the argument element does not already have a Value attribute, add the attribute
			aAttr = aArgumentNode.Attributes["Value"];
			if (aAttr == null) {
				aAttr = aArgumentNode.OwnerDocument.CreateAttribute("Value");
				aArgumentNode.Attributes.Append(aAttr);
			}
			
			//get value for Value attribute if not specified in XML
			String aType = cXMLDoc.AttributeToString(aArgumentNode, "Type");
			if(aType != "" && aType != "Data")
				EventController_SetArgumentAttribute(aArgumentNode, aDataObject);
				
			//If the argument node contains a JoinFilter element, all arguments within that element must
			//also have their values set.
			XmlNodeList aArgumentSubNodeList = aArgumentNode.SelectNodes("RelatedProperty/JoinFilter/Argument");
			foreach(XmlNode aArgumentSubNode in aArgumentSubNodeList)
				EventController_SetValueInArgumentNode(aArgumentSubNode, aDataObject);
	
	}
/*----------------------------------------------------*/

	public void EventController_SetArgumentAttribute(XmlNode aArgumentNode) {
		String aValue = EventController_GetArgumentValue(aArgumentNode, null);
					
		//aArgumentNode.Attributes["Value"].Value += aValue;
		aArgumentNode.Attributes["Value"].Value = cXMLDoc.AttributeToString(aArgumentNode, "BaseValue") + aValue;
	}
/*----------------------------------------------------*/

	public void EventController_SetArgumentAttribute(XmlNode aArgumentNode, cDataObject aDataObject) {
		String aValue = EventController_GetArgumentValue(aArgumentNode, aDataObject);
					
		//aArgumentNode.Attributes["Value"].Value += aValue;
		aArgumentNode.Attributes["Value"].Value = cXMLDoc.AttributeToString(aArgumentNode, "BaseValue") + aValue;
	}
		
/*----------------------------------------------------*/

	public virtual String EventController_GetArgumentValue(XmlNode aArgumentNode, cDataObject aDataObject) {
		
		String aType = cXMLDoc.AttributeToString(aArgumentNode, "Type");
		String aTypeKey = cXMLDoc.AttributeToString(aArgumentNode, "TypeKey");
		
		switch(aType) {
			case "":
			case "Data":
				return ""; //returns blank Value already set
			case "QueryString":
				return Request.QueryString[aTypeKey];
			case "URL":
				//typically, want PathAndQuery property
				return (String)cReflection.Invoke_Property(Request.Url, aTypeKey);
			case "ModulePage":
				return cReflection.Invoke_Property(((cModulePage)Page), aTypeKey).ToString();
			case "ModuleUser":
				String aTypeKeyIndex = cXMLDoc.AttributeToString(aArgumentNode, "TypeKeyIndex");
				if (aTypeKeyIndex == "")
					return cReflection.Invoke_Property(((cModulePage)Page).ModuleUser, aTypeKey).ToString();
				else
					return ((Hashtable)cReflection.Invoke_Property(((cModulePage)Page).ModuleUser, aTypeKey))[aTypeKeyIndex].ToString();
			case "DataObject":
				return aDataObject[aTypeKey].ToString();
			case "DataObjectRelated":
				return aDataObject.GetRelatedPropertyString(aTypeKey);
			case "DataObjectCollection":
				String aDataObjPropertyKey = cXMLDoc.AttributeToString(aArgumentNode, "DataObjectPropertyKey");
				return ((cDataObjectList)DataObjectCollection[aTypeKey])[0].GetRelatedPropertyString(aDataObjPropertyKey);
			case "Control":
				String aControlProperty = cXMLDoc.AttributeToString(aArgumentNode, "ControlPropertyKey");
				Control aCtl = FindControl(aTypeKey);
				return cReflection.Invoke_Property(aCtl, aControlProperty).ToString();
			case "PageParams":
				return ((HtmlInputControl)PageParamsContainer.FindControl(aTypeKey)).Value;
			case "CurrentDateTime":
				if(aTypeKey == "DateTime" || aTypeKey == "")
					return System.DateTime.Now.ToString("yyyy/M/d H:m:s");
				else
					return (cReflection.Invoke_Property(System.DateTime.Now, aTypeKey)).ToString();
		}
			
		return "Hack";
	}

/*----------------------------------------------------*/

	public virtual void EventController_Delete(XmlNode aDataObjectNode) {
	}

/*----------------------------------------------------*/

	public virtual void EventController_Delete(XmlNode aRelatedDataObjNode, String aParentDefinitionKey, String aParentPrimaryKeyValue, int aUserID) {
		String[]		aPropertyNameArray, aPropertyValueArray;
		StringBuilder	aNameBuilder, aValueBuilder;
		String			aParentProperty, aChildDefinitionKey, aChildValue;
		cDataObject		aParentObj;
		cDataObjectList	aChildDataObjList;
		XmlNodeList		aDataObjNodeList, aPropertyNodeList;
		XmlNode			aChildDataObjNode;
		
		aParentObj = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey(aParentDefinitionKey, aParentPrimaryKeyValue);
		if(aParentObj == null) return;
		
		aDataObjNodeList = aRelatedDataObjNode.SelectNodes("RelatedDataObject");
		
		foreach (XmlNode aDataObjNode in aDataObjNodeList) {
			aChildDataObjNode = aDataObjNode.SelectSingleNode("RelatedDataObjects");
			aPropertyNodeList = aDataObjNode.SelectNodes("RelationshipProperties/RelationshipProperty");
			aNameBuilder = new StringBuilder();
			aValueBuilder = new StringBuilder();
			
			for (int i = 0; i < aPropertyNodeList.Count; i++) {
				aNameBuilder.Append(cXMLDoc.AttributeToString((XmlNode)aPropertyNodeList[i], "childProperty"));
				aChildValue = cXMLDoc.AttributeToString((XmlNode)aPropertyNodeList[i], "aValue");
				
				if (aChildValue != "")
					aValueBuilder.Append(aChildValue);	
				else {
					aParentProperty = cXMLDoc.AttributeToString((XmlNode)aPropertyNodeList[i], "parentProperty");
					//aParentObj = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey(aParentDefinitionKey, aParentPrimaryKeyValue);
					aValueBuilder.Append(aParentObj.GetPropertyString(aParentProperty));	
				}
				if (i < aPropertyNodeList.Count - 1) {
					aNameBuilder.Append(",");
					aValueBuilder.Append(",");	
				}
			}
			aPropertyNameArray = aNameBuilder.ToString().Split(',');
			aPropertyValueArray = aValueBuilder.ToString().Split(',');
			
			aChildDefinitionKey = cXMLDoc.AttributeToString(aDataObjNode, "DataObjectDefinitionKey");
			aChildDataObjList = WebSession.DataObjectFactory.GetDataObjectListWithFilter(aChildDefinitionKey, aPropertyNameArray, aPropertyValueArray);
			 
			foreach (cDataObject aChildDataObj in aChildDataObjList) {
				if (aChildDataObjNode != null)
					EventController_Delete(aChildDataObjNode, aChildDefinitionKey, aChildDataObj.GetPropertyString(aChildDataObj.PrimaryKey), aUserID);
					//EventController_Delete(aChildDataObjNode, aChildDefinitionKey, aChildDataObj.GetPropertyString(aChildDataObj.PrimaryKey));
				
				aChildDataObj.DataObjectList.UserID = aUserID;
				this.WebSession.DataObjectFactory.DeleteData(aChildDataObj);
				//EventController_Delete(aChildDefinitionKey, aChildDataObj.GetPropertyString(aChildDataObj.PrimaryKey));
			}
		}
	}

	/*----------------------------------------------------*/

	public bool HasChildRecord(XmlNode aRecordCheckNode, String aParentDefinitionKey, String aParentPrimaryKeyValue) 
	{
		String[]		aPropertyNameArray, aPropertyValueArray;
		StringBuilder	aNameBuilder, aValueBuilder;
		String			aParentProperty, aChildDefinitionKey;
		cDataObject		aParentObj;
		cDataObjectList	aChildDataObjList;
		XmlNodeList		aDataObjNodeList, aPropertyNodeList;
		XmlNode			aChildDataObjNode;
		
		aDataObjNodeList = aRecordCheckNode.SelectNodes("RelatedDataObject");
		
		foreach (XmlNode aDataObjNode in aDataObjNodeList) 
		{
			aChildDataObjNode = aDataObjNode.SelectSingleNode("RelatedDataObjects");
			aPropertyNodeList = aDataObjNode.SelectNodes("RelationshipProperties/RelationshipProperty");
			aNameBuilder = new StringBuilder();
			aValueBuilder = new StringBuilder();
			
			for (int i = 0; i < aPropertyNodeList.Count; i++) 
			{
				aNameBuilder.Append(cXMLDoc.AttributeToString((XmlNode)aPropertyNodeList[i], "childProperty"));
				
				aParentProperty = cXMLDoc.AttributeToString((XmlNode)aPropertyNodeList[i], "parentProperty");
				aParentObj = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey(aParentDefinitionKey, aParentPrimaryKeyValue);
				aValueBuilder.Append(aParentObj.GetPropertyString(aParentProperty));	
				
				if (i < aPropertyNodeList.Count - 1) 
				{
					aNameBuilder.Append(",");
					aValueBuilder.Append(",");	
				}
			}
			aPropertyNameArray = aNameBuilder.ToString().Split(',');
			aPropertyValueArray = aValueBuilder.ToString().Split(',');
			
			aChildDefinitionKey = cXMLDoc.AttributeToString(aDataObjNode, "DataObjectDefinitionKey");
			aChildDataObjList = WebSession.DataObjectFactory.GetDataObjectListWithFilter(aChildDefinitionKey, aPropertyNameArray, aPropertyValueArray);
			
			if (aChildDataObjList.Count > 0)
				return true;
		}
		return false;
	}

	/*----------------------------------------------------*/

	public virtual void EventController_Delete(String aDefinitionKey, String aPrimaryKeyValue) 
	{
		WebSession.DataObjectFactory.DeleteData(aDefinitionKey, aPrimaryKeyValue);
		
		EventController_Notify_DataModified(WebSession.DataObjectFactory, null);
	}

/*----------------------------------------------------*/

	public virtual void EventController_Delete(String aPrimaryKeyValue) {
	}

	
	/*====================================================*/

	public virtual void EventController_Notify_DataModified(cDataObjectFactory aDataObjectFactory, Hashtable aDataObjHash) 
	{
		if (cReflection.TypeBasedFrom(WebSession.CurrentPage.GetType(), "Core", "Core.Web.Modules.cModulePage")) {
			cModulePage	aPage = (cModulePage)WebSession.CurrentPage;
			cUser	aUser = aPage.ModuleUser;
			
			if (aUser != null)
				aUser.Notify_DataModified(WebSession.DataObjectFactory, null);
		}
	}

/*====================================================*/
/*
	consolidated method to actually redirect w/ queries
*/
	protected void EventController_NavigateToURL(String aURL, String[] aQueryStrs) {
		int		i;
		
		if (aQueryStrs != null)
			for (i = 0; i < aQueryStrs.Length; i++) {
				aURL = cWebLib.AddQuerystringParameter(aURL, aQueryStrs[i], Server);
			}
		
		Response.Redirect(aURL);
	}

/*----------------------------------------------------*/

	public void EventController_NavigateToURL(String aURL) {
		EventController_NavigateToURL(aURL, (String[])null);
	}

/*----------------------------------------------------*/

	public void EventController_NavigateToURL(String aURL, String aQuery1) {
		String[]	aQueryStrs = {aQuery1};

		EventController_NavigateToURL(aURL, aQueryStrs);
	}

/*----------------------------------------------------*/

	public void EventController_NavigateToURL(String aURL, String aQuery1, String aQuery2) {
		String[]	aQueryStrs = {aQuery1, aQuery2};

		EventController_NavigateToURL(aURL, aQueryStrs);
	}

/*----------------------------------------------------*/

	public void EventController_NavigateToURLWithAnchor(String aURL, String aAnchor) {
		EventController_NavigateToURLWithAnchor(aURL, aAnchor, (String[])null);
	}
	
/*----------------------------------------------------*/

	public void EventController_NavigateToURLWithAnchor(String aURL, String aAnchor, params String[] aQueryStrs) {
		int		i;
		
		if (aQueryStrs != null)
			for (i = 0; i < aQueryStrs.Length; i++) {
				aURL = cWebLib.AddQuerystringParameter(aURL, aQueryStrs[i], Server);
			}
		//Add anchor to the end of the url
		aURL = cWebLib.RemoveQuerystringParameter(aURL, aAnchor);
		aURL += "&" + aAnchor + "=#" + aAnchor;
		
		Response.Redirect(aURL);
	}

/*----------------------------------------------------*/

	public void EventController_NavigateToModulePageKey(String aPageKey) {		
		EventController_NavigateToURL(((cModulePage)Page).ModulePage_BuildPageKeyURL(aPageKey),
										(String[])null);
	}
		
/*----------------------------------------------------*/

	public void EventController_NavigateToModulePageKey(String aPageKey, String aQuery1) {
		String[]	aQueryStrs = {aQuery1};
		
		EventController_NavigateToURL(((cModulePage)Page).ModulePage_BuildPageKeyURL(aPageKey),
										aQueryStrs);
	}
		
/*----------------------------------------------------*/

	public void EventController_NavigateToModulePageKey(String aPageKey, String aQuery1, String aQuery2) {
		String[]	aQueryStrs = {aQuery1, aQuery2};
		
		EventController_NavigateToURL(((cModulePage)Page).ModulePage_BuildPageKeyURL(aPageKey),
										aQueryStrs);
	}
		
/*----------------------------------------------------*/

	public void EventController_NavigateToModulePageKey(String aPageKey, String aQuery1, String aQuery2,  String aQuery3) {
		String[]	aQueryStrs = {aQuery1, aQuery2, aQuery3};
		
		EventController_NavigateToURL(((cModulePage)Page).ModulePage_BuildPageKeyURL(aPageKey),
										aQueryStrs);
	}
		
/*----------------------------------------------------*/

	public void EventController_NavigateToModulePageKey(String aPageKey, String aQuery1, String aQuery2,  String aQuery3,  String aQuery4) {
		String[]	aQueryStrs = {aQuery1, aQuery2, aQuery3, aQuery4};
		
		EventController_NavigateToURL(((cModulePage)Page).ModulePage_BuildPageKeyURL(aPageKey),
										aQueryStrs);
	}
		
/*----------------------------------------------------*/

	public void EventController_NavigateToModulePageKey(String aPageKey, String aQuery1, String aQuery2, String aQuery3, String aQuery4, String aQuery5) {
		String[]	aQueryStrs = {aQuery1, aQuery2, aQuery3, aQuery4, aQuery5};
		
		EventController_NavigateToURL(((cModulePage)Page).ModulePage_BuildPageKeyURL(aPageKey),
										aQueryStrs);
	}

/*----------------------------------------------------*/

	public void EventController_NavigateToModulePageKey(String aPageKey, String aQuery1, String aQuery2, String aQuery3, String aQuery4, String aQuery5, String aQuery6) {
		String[]	aQueryStrs = {aQuery1, aQuery2, aQuery3, aQuery4, aQuery5, aQuery6};
		
		EventController_NavigateToURL(((cModulePage)Page).ModulePage_BuildPageKeyURL(aPageKey),
										aQueryStrs);
	}

/*----------------------------------------------------*/

	public void EventController_NavigateToModulePageKey(String aPageKey, String aQuery1, String aQuery2, String aQuery3, String aQuery4, String aQuery5, String aQuery6, String aQuery7) {
		String[] aQueryStrs = { aQuery1, aQuery2, aQuery3, aQuery4, aQuery5, aQuery6, aQuery7 };

		EventController_NavigateToURL(((cModulePage) Page).ModulePage_BuildPageKeyURL(aPageKey),
										aQueryStrs);
	}

/*----------------------------------------------------*/

	public void EventController_NavigateToModulePageKey(String aPageKey, String aQuery1, String aQuery2, String aQuery3, String aQuery4, String aQuery5, String aQuery6, String aQuery7, String aQuery8)
	{
		String[] aQueryStrs = { aQuery1, aQuery2, aQuery3, aQuery4, aQuery5, aQuery6, aQuery7, aQuery8 };

		EventController_NavigateToURL(((cModulePage)Page).ModulePage_BuildPageKeyURL(aPageKey),
										aQueryStrs);
	}

/*----------------------------------------------------*/
		
	public virtual bool EventController_Save() {
		return false;
	}

/*----------------------------------------------------*/
		
	public virtual void EventController_SaveUser(String aEmail, String aFirstName, String aLastName, String aUserType) {
		
	}

/*----------------------------------------------------*/

	public virtual void EventController_SaveUser(String aEmail, String aFirstName, String aLastName, String aHonorific, String aUserType) {
		
	}

/*----------------------------------------------------*/
		
	public virtual void EventController_Reset() {
	}
	
/*----------------------------------------------------*/

	public virtual void EventController_Copy(String aDefinitionKey, String aPrimaryKeyValue, String aDescriptionKey) {
	
		cDataObject aDO, aCopyDO;
		XmlNode aDataObjectNode, aFiltersNode;
		cXMLDoc aXmlDoc;
		String aPrimaryKey;
		
		aDO =  WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey(aDefinitionKey, aPrimaryKeyValue);
		aPrimaryKey = aDO.PrimaryKey;
		
		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode(aDefinitionKey, out aDataObjectNode, out aFiltersNode);
		aCopyDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey(aDefinitionKey);
		
		for (int i=0; i<aCopyDO.DataObjectRow.ItemArray.Length; i++) {
			//copy all values but the primary key
			if (aCopyDO.DataObjectRow.Table.Columns[i].ToString() != aPrimaryKey)
				aCopyDO.DataObjectRow[i] =  aDO.DataObjectRow.ItemArray.GetValue(i);
		}
		
		if (aDescriptionKey != "") {
			aCopyDO[aDescriptionKey] = "Copy of " + aCopyDO[aDescriptionKey];
		}
		WebSession.DataObjectFactory.SaveDataObject(aCopyDO);
	}
	
/*====================================================*/
} //public class EventController


} //namespace Core.Web