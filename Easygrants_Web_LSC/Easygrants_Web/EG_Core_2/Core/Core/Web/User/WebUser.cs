using System;
using System.Collections;
using Core.User;
using Core.Web.Navigation;
using Core.DataAccess;
using Core.Web.Navigation.CrumbTrail;

namespace Core.Web.User {
/*====================================================*/

///<summary>
///Represents user in a web application - manages user authentication, web session, tracking
///</summary>
public class cWebUser : cUser 
{
/*====================================================*/

	private cWebSession	mWebSession;
	
	private cNavElement	mMasterNavElement;
	private cCrumbTrail	mCrumbTrail;

/*-----------------------------------------------------*/

	public cWebAppl WebAppl {
		get {return (cWebAppl)Appl;}
	}
	
/*-----------------------------------------------------*/

	public cWebSession WebSession {
		get {return mWebSession;}
	}
	
/*-----------------------------------------------------*/

	public bool Identified {
		//look at cookie, or forms authentication object
		get {return false;}
	}
	

/*-----------------------------------------------------*/

	public cNavElement MasterNavElement {
		get {return mMasterNavElement;}
		set {mMasterNavElement = value;}
	}

/*-----------------------------------------------------*/

	public cCrumbTrail CrumbTrail {
		get {
			if (mCrumbTrail == null)
				 mCrumbTrail = WebUser_NewCrumbTrail();
				 return mCrumbTrail;
		}
		set {mCrumbTrail = value;}
	}
	
/*-----------------------------------------------------*/

	public cCrumbTrail WebUser_NewCrumbTrail() 
	{
		return new cCrumbTrail();
	}

/*-----------------------------------------------------*/

	public cWebUser(cWebAppl aAppl, cWebSession aWebSession) :
					base(aAppl) {
	
		mWebSession = aWebSession;
	}
	
/*-----------------------------------------------------*/

	public cWebUser(cWebUser aUser) :
					base(aUser.Appl) {
	}
	
/*-----------------------------------------------------*/

	public virtual cDataObjectList PersonRoles {
		get {return null;}	
	}
	
/*-----------------------------------------------------*/

	public String GetWebSessionKey() {
		foreach(String aKey in mWebSession.Users.Keys) {
			if(this.Equals(mWebSession.Users[aKey]))
				return aKey;
		}
		return "";
	}
/*====================================================*/

	public virtual void Logout() {
	
	}

/*====================================================*/
}  //class cWebUser


/*====================================================*/
}  //Core.Web.User
