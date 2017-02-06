using System;
using System.Data;
using Core.DataAccess.DBAccess;
using Core.Web.User;

namespace EasyGrants.Web.User {
/*====================================================*/

///<summary>
///user in guest module
///</summary>
public class cEGGuestUser : cEGUser 
{
/*====================================================*/

	public cEGGuestUser(cEGAppl aAppl, cEGSession aSession) :
					base(aAppl, aSession) {
	}
	
/*=====================================================*/


	

/*=====================================================*/
} // class cEGUser


/*====================================================*/
}  //namespace EasyGrants.Web.User