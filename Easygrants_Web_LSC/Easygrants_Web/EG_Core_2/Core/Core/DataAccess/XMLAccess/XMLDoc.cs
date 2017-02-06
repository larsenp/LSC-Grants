using System;
using System.Xml;
using System.Diagnostics;
using System.IO;

namespace Core.DataAccess.XMLAccess {
/*====================================================*/

///<summary>
///wrapper around XML document class
///</summary>
public class cXMLDoc 
{
/*====================================================*/

	protected XmlDocument		mXMLDocument;
	protected XmlElement		mDocElement;
	
/*----------------------------------------------------*/

	public XmlDocument XMLDocument {
		get {return mXMLDocument;}
		set {mXMLDocument = value;}
	}
	
/*----------------------------------------------------*/

	public XmlElement DocElement {
		get {return mDocElement;}
		set {mDocElement = value;}
	}
	
/*----------------------------------------------------*/
	
	public cXMLDoc() {
		
	}

/*----------------------------------------------------*/
	
	public cXMLDoc(String aFileName) {
		Load(aFileName);
	}

/*----------------------------------------------------*/

	public bool Load(String aFileName) {
		if (XMLDocument == null)
			XMLDocument = new XmlDocument();
		
		FileInfo aConfigFI;
		try {
			if (aFileName.IndexOf(".", 0) == -1) {
				aConfigFI = new FileInfo(aFileName + ".xml");
				if (aConfigFI.Exists)
					aFileName = aFileName + ".xml";
				else {
					aFileName = aFileName + ".config";
				}
			}
			aConfigFI = new FileInfo(aFileName);
			if (!aConfigFI.Exists)
				return false;
			XMLDocument.Load(aFileName);
			DocElement = XMLDocument.DocumentElement;
			//MessageBox.Show("Opened XML");
		}
		catch (Exception e) {
			//MessageBox.Show("Error: " + e.Message);
			Debug.WriteLine("Error: " + e.Message);
		}
				
		return true;
	}

/*----------------------------------------------------*/

	public bool LoadFromXML(String aXML) {
		if (XMLDocument == null)
			XMLDocument = new XmlDocument();
		
		//MessageBox.Show("FileName: " + aFileName);
		try {
			XMLDocument.LoadXml(aXML);
			DocElement = XMLDocument.DocumentElement;
			//MessageBox.Show("Opened XML");
		}
		catch (Exception e) {
			//MessageBox.Show("Error: " + e.Message);
			Debug.WriteLine("Error: " + e.Message);
		}
				
		return true;
	}

/*====================================================*/

	public static XmlNodeList FindNodes(XmlNode aParentN, String aName, String aProp, String aValue) {
		return aParentN.SelectNodes(aName + "[@" + aProp + "='" + aValue + "']");
	}

/*----------------------------------------------------*/
	
	public static XmlNodeList FindNodes(XmlNode aParentN, String aName, String[] aProp, String[] aValue)  {
	
		int i;
		string aXPath = "";
		
		if (aProp != null && aValue != null && aProp.Length == aValue.Length)
		{	
			aXPath = aName;
			for (i = 0; i < aProp.Length; i++)
			{
				aXPath += "[@" + aProp[i] + "='" + aValue[i] + "']";
			}
		}
		return aParentN.SelectNodes(aXPath);
    }

/*----------------------------------------------------*/

	public static XmlNode FindNode(XmlNode aParentN, String aName, String aProp, String aValue) {
		return aParentN.SelectSingleNode(aName + "[@" + aProp + "='" + aValue + "']");
	}
	
/*----------------------------------------------------*/

	public static XmlNode FindNodeWithChildNode(XmlNode aParentN, String aName,
										String aChldName, String aProp, String aValue) {
		return aParentN.SelectSingleNode(aName + "[" + aChldName +
											"[@" + aProp + "='" + aValue + "']]");
	}
	
/*----------------------------------------------------*/

	public static XmlNodeList FindNodesWithChildNode(XmlNode aParentN, String aName,
										String aChldName, String aProp, String aValue) {
		return aParentN.SelectNodes(aName + "[" + aChldName +
											"[@" + aProp + "='" + aValue + "']]");
	}
	
/*====================================================*/

	public static XmlAttribute AddAttribute_ToNode(XmlNode aNode, String aName, String aValue) {
		XmlAttribute	aAttr;
		
		aAttr = aNode.Attributes[aName];
		if (aAttr == null) {
			aAttr = aNode.OwnerDocument.CreateAttribute(aName);
			aNode.Attributes.Append(aAttr);
		}
		if (aValue != null)
			aAttr.Value = aValue;

		return aAttr;
	}
	
/*----------------------------------------------------*/

	public static XmlAttribute AddAttribute_ToNode(XmlNode aParentNode, String aNodeName,
					String aAttrName, String aValue) {
		XmlNode		aNode;
		
		aNode = aParentNode.SelectSingleNode(aNodeName);
		if (aNode == null) return null;
		return AddAttribute_ToNode(aNode, aAttrName, aValue);
	}
	
/*----------------------------------------------------*/

	public static XmlAttribute AddAttribute_ToNode(XmlNode aNode, String aName) {
		return AddAttribute_ToNode(aNode, aName, "");
	}

/*====================================================*/

	public static String AttributeToString(XmlNode aNode, String aAttributeName, String aDfltStr) {
		XmlAttribute	aAttribute = aNode.Attributes[aAttributeName];
		
		return aAttribute != null ? aAttribute.Value.ToString() : aDfltStr;
	}
	
/*----------------------------------------------------*/

	public static String AttributeToString(XmlNode aNode, String aAttributeName) {
		return AttributeToString(aNode, aAttributeName, "");
	}
	
	
/*----------------------------------------------------*/

	public static int AttributeToInt(XmlNode aNode, String aAttributeName, int aDfltInt) {
		XmlAttribute	aAttribute = aNode.Attributes[aAttributeName];
		
		return aAttribute != null && aAttribute.Value != "" ? Convert.ToInt32(aAttribute.Value) : aDfltInt;
	}

/*----------------------------------------------------*/

	public static int AttributeToInt(XmlNode aNode, String aAttributeName) {
		return AttributeToInt(aNode, aAttributeName, 0);
	}

/*----------------------------------------------------*/

	public static bool AttributeToBool(XmlNode aNode, String aAttributeName) {
		return AttributeToString(aNode, aAttributeName).ToLower() == "true" ? true : false;
	}

/*----------------------------------------------------*/

	public static bool AttributeToBool(XmlNode aNode, String aAttributeName, bool aDfltBool) {
		String aValue = AttributeToString(aNode, aAttributeName).ToLower();
		switch(aValue) {
			case "true":
				return true;
			case "false":
				return false;
			default:
				return aDfltBool;
		}
	}

/*====================================================*/

	public static XmlNode Get_ChildNode(XmlNode aParentNode, String aName, bool aCrFlag) {
		XmlNode	aChildNode;
		
		aChildNode = aParentNode.SelectSingleNode(aName);
		if (aChildNode == null) {
			aChildNode = aParentNode.OwnerDocument.CreateElement(aName);
			aParentNode.AppendChild(aChildNode);
		}
		
		return aChildNode;
	}
	
/*====================================================*/

    public static XmlNode GetControlNode(XmlNode aDisplayPropertyNode) {
    //returns the Control node from a data presenter control's Display Property node
        XmlNode aControlNode;

		aControlNode = aDisplayPropertyNode.SelectSingleNode("Control");
		return aControlNode;
    }

/*----------------------------------------------------*/

    public static XmlNodeList GetDisplayPropertyNodeList(XmlNode aDataObjectNode) {
        return aDataObjectNode.SelectNodes("DisplayProperties/DisplayProperty");
    }

/*----------------------------------------------------*/

    public static XmlElement DataObjectElement(String aKey, cXMLDoc aXMLDoc) { 
        return (XmlElement)aXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='" + aKey + "']");
    }

/*----------------------------------------------------*/

    public static XmlNodeList GetDisplayPropertyNodeList(String aDataObjectNodeKey, cXMLDoc aXMLDoc) {
        return DataObjectElement(aDataObjectNodeKey, aXMLDoc).SelectNodes("DisplayProperties/DisplayProperty");
    }

/*----------------------------------------------------*/

    public static XmlNodeList GetFilterArgumentList(XmlNode aDataObjectNode) {
        return aDataObjectNode.SelectNodes("Filters/Argument");
    }

/*----------------------------------------------------*/

    public static XmlNodeList GetFilterArgumentList(String aDataObjectNodeKey, cXMLDoc aXMLDoc) {
        return DataObjectElement(aDataObjectNodeKey, aXMLDoc).SelectNodes("Filters/Argument");
    }

/*----------------------------------------------------*/

    public static XmlNodeList GetSortArgumentList(XmlNode aDataObjectNode) {
        return aDataObjectNode.SelectNodes("Sort/Argument");
    }
/*----------------------------------------------------*/

    public static String GetDisplayPropertyType(XmlNode aDisplayPropertyNode) {
        return aDisplayPropertyNode.SelectSingleNode("Control/@Type").Value;
    }

/*----------------------------------------------------*/

    public static String GetControlID(XmlNode aDisplayPropertyNode) {
        return aDisplayPropertyNode.SelectSingleNode("Control/@ID").Value;
    }

/*----------------------------------------------------*/

    public static XmlNode GetActionNode(XmlNode aDisplayPropertyNode) {
		XmlNode aActionNode;

		aActionNode =  aDisplayPropertyNode.SelectSingleNode("Control/Action");
		if (aActionNode == null)
		{
			aActionNode = aDisplayPropertyNode.SelectSingleNode("Parameters/Argument/Control/Action");
		}
		
        return aActionNode;
    }

/*----------------------------------------------------*/

    public static XmlNodeList GetActionNodeList(XmlNode aDisplayPropertyNode) {
		XmlNodeList aActionNodeList;

		aActionNodeList =  aDisplayPropertyNode.SelectNodes("Control/Action");
		if (aActionNodeList == null)
		{
			aActionNodeList = aDisplayPropertyNode.SelectNodes("Parameters/Argument/Control/Action");
		}
		
        return aActionNodeList;
    }
/*----------------------------------------------------*/

	public static XmlNodeList GetArgumentsList(XmlNode aParentNode) {
		return aParentNode.SelectNodes("Argument");
	}

/*----------------------------------------------------*/

	public static XmlNode GetRelationshipNode(XmlNode aObjDefNode, String aPropertyKey) {
		return aObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aPropertyKey + "']/Relationship");
	}
	
/*----------------------------------------------------*/

	public static XmlNode GetPrimaryKeyNode(XmlNode aObjDefNode) {
		return aObjDefNode.SelectSingleNode("Properties/Property[@IsPrimaryKey='True']");
	}


/*----------------------------------------------------*/

	public XmlAttribute AddAttribute(XmlNode aNode, String aName, String aValue) {
		XmlAttribute aAttribute = XMLDocument.CreateAttribute(aName);
		aAttribute.Value = aValue;
		aNode.Attributes.Append(aAttribute);
		
		return aAttribute;
	}

/*----------------------------------------------------*/

	public static XmlElement GetResultElement(XmlNode aValidationItemNode, int aResult) {
		return (XmlElement)aValidationItemNode.SelectSingleNode("Results/Result[@ResultCode='" + aResult.ToString() + "']");
	}
/*----------------------------------------------------*/

	public static void IndicateValidationResult(ref XmlNode aValidationItemNode, int aResult) {
		XmlElement aResultEl = GetResultElement(aValidationItemNode, aResult);
		
		if (aResultEl==null) return;
		IndicateValidationResult(ref aResultEl);
	}
	
/*----------------------------------------------------*/

	public static void IndicateValidationResult(ref XmlElement aResultEl) {
		XmlAttribute aAttribute= aResultEl.SetAttributeNode("ActualResult","");
		aAttribute.Value = "True";
	}
	
	
/*----------------------------------------------------*/

	public static void SetValidationResultMessage(ref XmlElement aResultEl, String aMessage) {
		XmlAttribute aAttribute = aResultEl.Attributes["Message"];
		if(aAttribute == null)
			aAttribute= aResultEl.SetAttributeNode("Message","");
		aAttribute.Value = aMessage;
	}
	
/*----------------------------------------------------*/

	public XmlNode CreateSortNode() {
		return XMLDocument.CreateNode(XmlNodeType.Element, "Sort", "");
	}
	
	public static Boolean IsWellFormedXML(string aInputXML) {
		XmlDocument aXmlDoc = new XmlDocument();
		Boolean aIsWellFormed = false;
		try {
			aXmlDoc.LoadXml("<?xml version='1.0' encoding='utf-8' ?><EGData>" + aInputXML + "</EGData>");
			aIsWellFormed = true;
		} 
		catch (System.Xml.XmlException) {}
		
		return aIsWellFormed;
	}
/*====================================================*/
} //class cXMLDoc


/*====================================================*/
}  //Core.DataAccess.XMLAccess
