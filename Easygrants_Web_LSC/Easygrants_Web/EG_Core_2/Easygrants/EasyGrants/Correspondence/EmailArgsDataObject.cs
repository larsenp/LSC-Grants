using System;
using System.Collections;
using System.Xml;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;
using Core.Web;

namespace EasyGrants.Correspondence  {
/*====================================================*/

/// <summary>
/// sets email data args
/// </summary>
public class cEmailArgsDataObject:cEmailArgsDataObjectBase {
/*====================================================*/	
	
	protected override XmlNode Get_MailParamNode(cDataObjectList aDataObjectList) {
		XmlNode		aEMailParamNode;
		aEMailParamNode = cXMLDoc.FindNode(((cWebAppl)aDataObjectList.DataObjectFactory.Appl).Get_ApplNode(),
										"EMailParams/DataObjectEmailProperties", 
										"Key", aDataObjectList.DefinitionKey);
		return aEMailParamNode;
	}
	
/*-----------------------------------------------------*/

//	public cDataObjectList BaseDataObjList {
//		get {return mBaseDataObjList;}
//		set {mBaseDataObjList = value;}
//	}
	
/*-----------------------------------------------------*/

//	public String NamePropertyKey {
//		get {return mNamePropertyKey;}
//		set {mNamePropertyKey = value;}
//	}

/*-----------------------------------------------------*/

//	public String EmailPropertyKey {
//		get {return mEmailPropertyKey;}
//		set {mEmailPropertyKey = value;}
//	}

/*====================================================*/	

	public cEmailArgsDataObject(cDataObjectList aDataObjectList): base(aDataObjectList){
		
	}

	public cEmailArgsDataObject(cDataObject aDataObject): base(aDataObject) {

	}
/*====================================================*/	
}//cEmailArgsDataObject
}// namespace EasyGrants.Correspondence