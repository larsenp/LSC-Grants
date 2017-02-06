using System;
using System.Collections;
using System.Web.UI;

namespace Core.Web.SvrCtls {
/// <summary>
///identifies if the user clicked on View Next or View Previous link
///see GetPostBackEventReference in the Render method
/// </summary>
public class cPagingCtlEventArgs : EventArgs {
/*====================================================*/
	/*identifies if the user clicked on View Next or View Previous link
	  see GetPostBackEventReference in the Render method
	*/
	
	public String		mAction; 
	
/*====================================================*/

} //public class cPagingCtlEventArgs 

} //namespace Core.Web.SvrCtls