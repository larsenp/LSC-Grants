using System;
using System.Diagnostics;
using Core.DataAccess.XMLAccess;
using System.Xml;

namespace Core {
/*====================================================*/
///<summary>
///Core Web Application object - provides path, debug switches
///</summary>
public class cAppl 
{
/*====================================================*/

	private static BooleanSwitch	mDebugSwitch;
	
	//used to identify if the e-mail should go to its intended recipient, or a test e-mail address
	private static BooleanSwitch	mEmailSwitch; 

	protected String				mRootFileSystemPath;
	private EventLog				mEventLog;

/*-----------------------------------------------------*/

	public BooleanSwitch DebugSwitch {
		get {return mDebugSwitch;}
	}
	
/*-----------------------------------------------------*/

	public bool DebugSwitchEnabled {
		get {return mDebugSwitch == null ? false : mDebugSwitch.Enabled;}
	}
	
/*-----------------------------------------------------*/

	public BooleanSwitch EmailSwitch {
		get {return mEmailSwitch;}
	}
	
/*-----------------------------------------------------*/

	public bool EmailSwitchEnabled {
		get {return mEmailSwitch == null ? false : mEmailSwitch.Enabled;}
	}
	
/*-----------------------------------------------------*/

	public String RootFileSystemPath {
		get {return mRootFileSystemPath;}
	}
	
/*-----------------------------------------------------*/
	
	public virtual String SecretKey() {
		return null;
	}
	
/*-----------------------------------------------------*/
	
	public virtual String SecretIV() {
		return null;
	}
		
/*-----------------------------------------------------*/

	public String BuildKey {
		get {
			#if (DEBUG)
				return "Debug";
			#elif (TEST)
				return "Test";
			#elif (STAGE)
				return "Stage";
			#else //(RELEASE)
				return "Release";
			#endif
		}
	}
	
/*-----------------------------------------------------*/

	public EventLog EventLog {
		get {return mEventLog;}
		set {mEventLog = value;}
	}

/*====================================================*/
	
	public cAppl() {
		Appl_Init("");
	}
	
/*-----------------------------------------------------*/

	public cAppl(String aRootFileSystemPath) {
		Appl_Init(aRootFileSystemPath);
	}
	
/*-----------------------------------------------------*/

	private void Appl_Init(String aRootFileSystemPath) {
		#if (DEBUG || TEST)
			//DEBUG set w/ d:/DEBUG compiler switch
			//* set by default in VS.NET for debug builds
			//in order for switch to be enabled, must be in Web.Config as well
			mDebugSwitch = new BooleanSwitch("DebugSwitch", "Main Appl Debug Setting");
			mDebugSwitch.Enabled = true;
		#else
			mDebugSwitch = null;
		#endif
		
		#if (DEBUG || TEST || STAGE)
			//DEBUG set w/ d:/DEBUG compiler switch
			//* set by default in VS.NET for debug builds
			//in order for switch to be enabled, must be in Web.Config as well
			mEmailSwitch = new BooleanSwitch("EmailSwitch", "Main Appl Email Setting");
			mEmailSwitch.Enabled = true;
		#else
			mEmailSwitch = null;
		#endif
		
		mRootFileSystemPath = aRootFileSystemPath;
	}

/*====================================================*/

	public String Build_RootFileSystemPath(String aSourceFile) {
		return  RootFileSystemPath + "\\" + aSourceFile;
	}

/*----------------------------------------------------*/

	public virtual void LogException(Exception e) {
		if(EventLog != null) {
			try {
				EventLog.WriteEntry(e.Message + "\r" + e.StackTrace, EventLogEntryType.Error);
			}
			catch (System.Exception ex) {
				//If exception logging fails for any reason, do nothing.
			}
		}
	}

/*-----------------------------------------------------*/

	public void MergeDefinitions(String aDataDefinitionType, String aPropertiesType, String aPropertyType, cXMLDoc aBaselineDD, cXMLDoc aClientDD) {
		XmlNode aClientDefinitionsParentNode = aClientDD.DocElement.SelectSingleNode("//" + aDataDefinitionType);
		if (aClientDefinitionsParentNode == null)
			return;
		XmlNode aBaselineDefinitionsParentNode = aBaselineDD.DocElement.SelectSingleNode("//" + aDataDefinitionType);
		XmlNodeList aClientDefinitions = aClientDefinitionsParentNode.SelectNodes("Definition");
		foreach (XmlNode aClientDef in aClientDefinitions) {
			XmlNode aBaselineDef = cXMLDoc.FindNode(aBaselineDefinitionsParentNode, "Definition", "Key", cXMLDoc.AttributeToString(aClientDef, "Key"));
			XmlNodeList aPropertiesList = aClientDef.SelectSingleNode(aPropertiesType).ChildNodes;
			String aBaselineDefRelation = cXMLDoc.AttributeToString(aClientDef, "Baseline", "Override");
			if (aBaselineDefRelation == "Append" && aBaselineDef != null) {
				XmlNode aBaselineDefProperties = aBaselineDef.SelectSingleNode(aPropertiesType);
				foreach (XmlNode aProperty in aPropertiesList) {
					String aBaselinePropRelation = cXMLDoc.AttributeToString(aProperty, "Baseline", "Override");
					String aPropKey = cXMLDoc.AttributeToString(aProperty, "Key");
					XmlNode aNodeToBeCopied = aBaselineDD.XMLDocument.ImportNode(aProperty, true);
					if (aBaselinePropRelation == "Append") {
						if (cXMLDoc.FindNode(aBaselineDefProperties, aPropertyType, "Key", aPropKey) == null) {
							aBaselineDefProperties.AppendChild(aNodeToBeCopied);
						} else {
							Debug.WriteLine(aPropKey + " is already existing in baseline datadefinition for the Definition key " + cXMLDoc.AttributeToString(aClientDef, "Key"));
							Debug.WriteLine("To use client propertykey, set 'Baseline' attribute to 'Override'.");
						}
					} else if (aBaselinePropRelation == "Override") {
						if (cXMLDoc.FindNode(aBaselineDefProperties, aPropertyType, "Key", aPropKey) != null) {
							aBaselineDefProperties.ReplaceChild(aNodeToBeCopied, cXMLDoc.FindNode(aBaselineDefProperties, aPropertyType, "Key", aPropKey));
						} else {
							aBaselineDefProperties.AppendChild(aNodeToBeCopied);
						}
					}
				}
			} else if (aBaselineDefRelation == "Append" && aBaselineDef == null) {
				XmlNode aNodeToBeCopied = aBaselineDD.XMLDocument.ImportNode(aClientDef, true);
				aBaselineDefinitionsParentNode.AppendChild(aNodeToBeCopied);
			} else if (aBaselineDefRelation == "Override") {
				XmlNode aNodeToBeCopied = aBaselineDD.XMLDocument.ImportNode(aClientDef, true);
				if (aBaselineDef != null) {
					aBaselineDefinitionsParentNode.ReplaceChild(aNodeToBeCopied, aBaselineDef);
				} else {
					aBaselineDefinitionsParentNode.AppendChild(aNodeToBeCopied);
				}
			}
		}
	}

	public void LoadDataSources(cXMLDoc aBaselineDD, cXMLDoc aDataSourceConfigDoc) {
		XmlNode aDataSourcesNode = aDataSourceConfigDoc.DocElement.SelectSingleNode("//DataSources");

		XmlNode aReleaseBuildNode = aDataSourceConfigDoc.XMLDocument.CreateNode(XmlNodeType.Element, "ReleaseBuild", "");
		aDataSourceConfigDoc.AddAttribute(aReleaseBuildNode, "BuildKey", BuildKey);
		aDataSourcesNode.ChildNodes[0].AppendChild(aReleaseBuildNode);
		
		XmlNode aBaselineDataSourcesNode = aBaselineDD.DocElement.SelectSingleNode("//EGData").SelectSingleNode("//DataSources");
		XmlNode aNodeToBeCopied = aBaselineDD.XMLDocument.ImportNode(aDataSourcesNode, true);
		if (aBaselineDataSourcesNode != null) {
			aBaselineDD.DocElement.ReplaceChild(aNodeToBeCopied, aBaselineDataSourcesNode);
		} else {
			aBaselineDD.DocElement.AppendChild(aNodeToBeCopied);
		}
	}

/*====================================================*/
}  //class cAppl


/*====================================================*/
}  //namespace Core
