using System;
using System.Collections;
using Core.DataAccess;

namespace Core.User {


public enum AccessLevels : int {
	AccLev_Public = 1,
	AccLev_Staff
}

///<summary>
///Base user class - sets user access level privileges
///</summary>
public class cUser 
{
/*====================================================*/

	private cAppl		mAppl;
	
	private	int			mAccessLevel;
	protected int		mUserID;
	
	/*-----------------------------------------------------*/

	public int UserID 
	{
		get {return mUserID;}
	}
	
	/*-----------------------------------------------------*/

	public cAppl Appl 
	{
		get {return mAppl;}
	}
	
/*-----------------------------------------------------*/

	public int AccessLevel {
		get {return mAccessLevel;}
		set {mAccessLevel = value;}
	}
	
/*-----------------------------------------------------*/

	public bool Authorized {
		get {return AccessLevel > 0;}
	}
	
/*-----------------------------------------------------*/

	public cUser(cAppl aAppl) {
		mAppl = aAppl;
	}
	
/*====================================================*/

	public virtual cUser CreateUserFromUser(cUser aUser) {
		return null;
	}
	
/*-----------------------------------------------------*/

	public virtual void Notify_DataModified(cDataObjectFactory aDataObjectFactory, Hashtable aDataObjHash) {
	}
	
/*====================================================*/
} //class cAGUser


} //Core.User
