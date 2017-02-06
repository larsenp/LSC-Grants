using System;
using Core.Web.User;

namespace EasyGrants.Web.User {
/*====================================================*/

/// <summary>
/// Bases class for users using publically accessible modules
/// </summary>
public class cEGPublicUser : cEGUser {
/*====================================================*/

/*-----------------------------------------------------*/

	public cEGPublicUser(cEGAppl aAppl, cEGSession aSession) :
					base(aAppl, aSession) {
	}

/*=====================================================*/
} // class cEGPublicUser


/*====================================================*/
}  //namespace EasyGrants.Web.User