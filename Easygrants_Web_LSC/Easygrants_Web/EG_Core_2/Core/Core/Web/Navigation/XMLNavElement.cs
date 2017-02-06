using System;
using System.Xml;
using System.Collections;
using Core.DataAccess.XMLAccess;

namespace Core.Web.Navigation {
/*====================================================*/

///<summary>
///supports navigation output functionality
///</summary>
public class cXMLNavElement : cNavElement 
{
/*====================================================*/

	protected String mNavigationNodeName = "Navigation";

/*====================================================*/

	public String NavigationNodeName 
	{
		get {return mNavigationNodeName;}
		set {mNavigationNodeName = value;}
	}
    
	/*----------------------------------------------------*/

	public cXMLNavElement(String aPageTitle) : base(aPageTitle) {
	}
	
/*-----------------------------------------------------*/

	public cXMLNavElement(bool aExpanded) : base(aExpanded) {
	}
	
/*-----------------------------------------------------*/

	public cXMLNavElement(String aKey, String aPageTitle) : base(aKey, aPageTitle) {
	}

/*====================================================*/

	public void XMLNavElement_Load(XmlNode aParNavNode) {
		XmlNodeList		aChildNavNodeL;
		aChildNavNodeL = aParNavNode.SelectNodes("NavElement");
		
		foreach (XmlNode aChildNavNode in aChildNavNodeL) {
			cXMLNavElement		aNavElement = new cXMLNavElement(cXMLDoc.AttributeToString(aChildNavNode, "Key"),
																	cXMLDoc.AttributeToString(aChildNavNode, "PageTitle"));

			if(cXMLDoc.AttributeToString(aChildNavNode, "NavTitle") == "(") //Separator
				aNavElement.NavTitle = "&nbsp;";
			else
				aNavElement.NavTitle =  cXMLDoc.AttributeToString(aChildNavNode, "NavTitle");
			
			aNavElement.Enabled = cXMLDoc.AttributeToBool(aChildNavNode, "Enabled");
			aNavElement.Expanded = cXMLDoc.AttributeToBool(aChildNavNode, "Expanded");
			aNavElement.EnabledAfterSubmit = cXMLDoc.AttributeToBool(aChildNavNode, "EnabledAfterSubmit");
			aNavElement.DisabledBeforeSubmit = cXMLDoc.AttributeToBool(aChildNavNode, "DisabledBeforeSubmit");
			aNavElement.External = cXMLDoc.AttributeToBool(aChildNavNode, "External");
			aNavElement.SourceFile =  cXMLDoc.AttributeToString(aChildNavNode, "SourceFile");
			aNavElement.HelpFile =  cXMLDoc.AttributeToString(aChildNavNode, "HelpFile");
			aNavElement.Horizontal =  cXMLDoc.AttributeToBool(aChildNavNode, "Horizontal");	
			aNavElement.IsSubmissionSection = cXMLDoc.AttributeToBool(aChildNavNode, "SubmissionSection", false);
			//aNavElement.ArgType = cXMLDoc.AttributeToString(aChildNavNode, "ArgType");
			//aNavElement.ArgPropertyKey = cXMLDoc.AttributeToString(aChildNavNode, "ArgPropertyKey");
			//aNavElement.ArgType2 = cXMLDoc.AttributeToString(aChildNavNode, "ArgType2");
			//aNavElement.ArgPropertyKey2 = cXMLDoc.AttributeToString(aChildNavNode, "ArgPropertyKey2");
			aNavElement.IsActiveOnSelect = cXMLDoc.AttributeToBool(aChildNavNode, "ActiveOnSelect", false);
			aNavElement.ActionNode = aChildNavNode.SelectSingleNode("Action");
			aNavElement.ArgumentsNode = aChildNavNode.SelectSingleNode("Arguments");
			
			if(cXMLDoc.AttributeToString(aChildNavNode, "Target") != "")
				aNavElement.Target = cXMLDoc.AttributeToString(aChildNavNode, "Target");
			
			Add_NavElement(aNavElement);
			aNavElement.XMLNavElement_Load(aChildNavNode);
		}
	}
	
/*-----------------------------------------------------*/

	public void XMLNavElement_Load(cXMLDoc aXMLDoc) {
		XmlNode		aMainNavNode;
		
		aMainNavNode = aXMLDoc.DocElement.SelectSingleNode(NavigationNodeName);
		if (aMainNavNode != null)
			XMLNavElement_Load(aMainNavNode);
	}

/*-----------------------------------------------------*/

	public void XMLNavElement_Load(String aFileName) {
		cXMLDoc		aXMLDoc = new cXMLDoc(aFileName);
		
		XMLNavElement_Load(aXMLDoc);
		aXMLDoc = null;
	}

/*====================================================*/
} //class cXMLNavElement


/*====================================================*/
}  //namespace Core.Web.Navigation
