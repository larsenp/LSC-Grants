using System;
using System.Xml;
using Core.Web.User;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;
using EasyGrants.Workflow;
using EasyGrants.Web;
using EasyGrants.Correspondence;
using Core.Web.Modules;
using Core.Util;
using Core.Web;
using System.Diagnostics;
using Core.Web.Navigation;
using EasyGrants.Web.Modules;
using EasyGrants.Web.User;
using Core.Event;
using EasyGrants.DataAccess.Report;


namespace EasyGrants.Web.User {
/*====================================================*/

///<summary>
///staff user functionality -query tool, bulk email
///</summary>
public class cEGStaffUser : cEGUser 
{
/*====================================================*/

	private IEmailArgs mEmailArgs;
	private cSavedQuery mSavedQueryDO;

/*====================================================*/
	
	public IEmailArgs EmailArgs {
		get {return mEmailArgs;}
		set {mEmailArgs = value;}
	}
	
/*----------------------------------------------------*/

	public cSavedQuery SavedQueryDO {
		get {return mSavedQueryDO;}
		set {mSavedQueryDO = value;}
	}
/*====================================================*/

	public cEGStaffUser(cEGAppl aAppl, cEGSession aSession) :
					base(aAppl, aSession) {
	}
	
/*====================================================*/

	public void SetEmailArgs(cDataObjectList aDataObjList){
		
		cEmailArgsDataObject aEmailArgsDataObject=new cEmailArgsDataObject(aDataObjList);

		SetEmailArgs(aEmailArgsDataObject);
		
	}

/*-----------------------------------------------------*/

	public void SetEmailArgs(String aID, String aDataObjDefinitionKey){
		
		cEmailArgsDataObject aEmailArgsDataObject=new cEmailArgsDataObject(EGSession.DataObjectFactory.GetDataObjectListFromPrimaryKey(aDataObjDefinitionKey, aID));

		SetEmailArgs(aEmailArgsDataObject);
	
	}

/*-----------------------------------------------------*/

	public void SetEmailArgs(IEmailArgs aEmailArgs){
	
		mEmailArgs=aEmailArgs;

	}
	
/*----------------------------------------------------*/

	public cSavedQuery GetSavedQueryDO() {
			if(SavedQueryDO == null) {
				cXMLDoc aXMLDoc;
				XmlNode aDataObjectNode;
				aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SavedQuery", out aDataObjectNode);
				SavedQueryDO = (cSavedQuery)WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode);
			}
			return SavedQueryDO;

	}
/*=====================================================*/
} // class cEGStaffUser


/*====================================================*/
}  //namespace EasyGrants.Web.User