using System;
using System.Collections;
using System.Xml;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;

namespace EasyGrants.Correspondence  {
/*====================================================*/

/// <summary>
/// sets email data args
/// </summary>
public class cEmailArgsDataObjectBase:IEmailArgs {
/*====================================================*/

	private cDataObjectList mBaseDataObjList = null;
	private String mNamePropertyKey = "";
	private String mEmailPropertyKey = "";
	private String mRcptPersonIDPropertyKey = "";

/*====================================================*/	

	public cDataObjectList BaseDataObjList {
		get {return mBaseDataObjList;}
		set {mBaseDataObjList = value;}
	}
	
/*-----------------------------------------------------*/

	public String NamePropertyKey {
		get {return mNamePropertyKey;}
		set {mNamePropertyKey = value;}
	}

/*-----------------------------------------------------*/

	public String EmailPropertyKey {
		get {return mEmailPropertyKey;}
		set {mEmailPropertyKey = value;}
	}
	
/*-----------------------------------------------------*/

	public String RcptPersonIDPropertyKey {
		get {return mRcptPersonIDPropertyKey;}
		set {mRcptPersonIDPropertyKey = value;}
	}

/*-----------------------------------------------------*/
	
	protected virtual XmlNode Get_MailParamNode(cDataObjectList aDataObjectList) {
		return null;
	}

/*====================================================*/	

	public cEmailArgsDataObjectBase(cDataObject aDataObject){
		mBaseDataObjList = new cDataObjectList(aDataObject.DataObjectFactory);
		mBaseDataObjList.Add(aDataObject);
		ProcessEmailParamNode(mBaseDataObjList);
	}

/*====================================================*/

	public cEmailArgsDataObjectBase(cDataObjectList aDataObjectList){
		mBaseDataObjList = aDataObjectList;
		ProcessEmailParamNode(mBaseDataObjList);
	}

/*====================================================*/

	private void ProcessEmailParamNode(cDataObjectList aDataObjectList) {
		XmlNode aAttributeNode;
		XmlNode aEMailParamNode;

		aEMailParamNode = Get_MailParamNode(aDataObjectList);

		if (aEMailParamNode != null) {
			aAttributeNode = aEMailParamNode.SelectSingleNode("EMail");
			mEmailPropertyKey = cXMLDoc.AttributeToString(aAttributeNode, "Property", "");
			aAttributeNode = aEMailParamNode.SelectSingleNode("Name");
			mNamePropertyKey = cXMLDoc.AttributeToString(aAttributeNode, "Property", "");
			aAttributeNode = aEMailParamNode.SelectSingleNode("RcptPersonID");
			if (aAttributeNode != null)
				mRcptPersonIDPropertyKey = cXMLDoc.AttributeToString(aAttributeNode, "Property", "");
		} else {
			String aDOLDefinitionKey = aDataObjectList.DefinitionKey;
			if (aDOLDefinitionKey == "" || aDOLDefinitionKey == null) {
				//this will be the case when only single event is raised like in reviewer submission
				aDOLDefinitionKey = aDataObjectList[0].DefinitionKey;
			}
			switch (aDOLDefinitionKey) {
				case "User":
				case "WfTaskAssignment":
					mNamePropertyKey = "Person.LastNameFirstName";
					mEmailPropertyKey = "Person.PersonPrimaryEMail.ContactValue1";
					mRcptPersonIDPropertyKey = "PersonID";
					break;
				case "Person":
					mNamePropertyKey = "LastNameFirstName";
					mEmailPropertyKey = "PersonPrimaryEMail.ContactValue1";
					mRcptPersonIDPropertyKey = "PersonID";
					break;
				case "GranteeProject":
					mNamePropertyKey = "PrimaryPerson.LastNameFirstName";
					mEmailPropertyKey = "PrimaryPerson.PersonPrimaryEMail.ContactValue1";
					mRcptPersonIDPropertyKey = "PrimaryPerson.PersonID";
					break;
			}
		}
	}

/*====================================================*/

	public String GetDisplayNameEmailList(){
		String aDisplayStr="";
		String aSeparator="";
		int aCount=0;
		int aObjectCount = mBaseDataObjList.Count;
		
		foreach(cDataObject aDataObject in mBaseDataObjList){
			
			if (aCount+1 < aObjectCount && aCount+1 == 5){
				aSeparator=" ..." ;
				aDisplayStr= aDisplayStr + "; " + aDataObject.GetRelatedPropertyString(mNamePropertyKey)+ 
								" - " + aDataObject.GetRelatedPropertyString(mEmailPropertyKey)+ aSeparator;
				break;
			}
			else if (aCount >= 1 ){
				aSeparator="; " ;
				aDisplayStr= aDisplayStr + aSeparator+ aDataObject.GetRelatedPropertyString(mNamePropertyKey)+ 
								" - " + aDataObject.GetRelatedPropertyString(mEmailPropertyKey);
			}
			else {
				aDisplayStr= aDisplayStr + aDataObject.GetRelatedPropertyString(mNamePropertyKey)+ 
								" - " + aDataObject.GetRelatedPropertyString(mEmailPropertyKey);
			}
			aCount+=1;
		}
	
		return aDisplayStr;
		
	}
	
/*-----------------------------------------------------*/

	public String GetToEmailList(){
		String aDisplayStr="";
		String aSeparator="";
		int aCount=0;
		int aObjectCount = mBaseDataObjList.Count;
		
		foreach(cDataObject aDataObject in mBaseDataObjList){
			
			if (aCount+1 < aObjectCount && aCount+1 == 5){
				aSeparator=" ..." ;
				aDisplayStr= aDisplayStr + "; " + aDataObject.GetRelatedPropertyString(mEmailPropertyKey)+ aSeparator;
				break;
			}
			else if (aCount >= 1 ){
				aSeparator="; " ;
				aDisplayStr= aDisplayStr +aSeparator + aDataObject.GetRelatedPropertyString(mEmailPropertyKey);
			}
			else {
				aDisplayStr= aDisplayStr + aDataObject.GetRelatedPropertyString(mEmailPropertyKey);
			}
			aCount+=1;
		}
	
		return aDisplayStr;
	}
	
	/*-----------------------------------------------------*/

	public String GetSendEmailList()
	{
		String aDisplayStr="";
		String aSeparator="";
		int aCount=0;
		int aObjectCount = mBaseDataObjList.Count;
		
		foreach(cDataObject aDataObject in mBaseDataObjList)
		{
			if (aCount >= 1 )
			{
				aSeparator="; " ;
				aDisplayStr= aDisplayStr +aSeparator + aDataObject.GetRelatedPropertyString(mEmailPropertyKey);
			}
			else 
			{
				aDisplayStr= aDisplayStr + aDataObject.GetRelatedPropertyString(mEmailPropertyKey);
			}
			aCount+=1;
		}
		return aDisplayStr;
	}
	
	/*-----------------------------------------------------*/

	public ArrayList GetDisplayNameList()
	{
		ArrayList  aDisplayList = new ArrayList();
		String aDisplayStr;
		
		foreach(cDataObject aDataObject in mBaseDataObjList){
		
			aDisplayStr=aDataObject.GetRelatedPropertyString(mNamePropertyKey)+ 
								" - " + aDataObject.GetRelatedPropertyString(mEmailPropertyKey);
			aDisplayList.Add(aDisplayStr);
		}
	
		return aDisplayList;
	}
	
/*====================================================*/		
}//cEmailArgsDataObject
}// namespace EasyGrants.Correspondence