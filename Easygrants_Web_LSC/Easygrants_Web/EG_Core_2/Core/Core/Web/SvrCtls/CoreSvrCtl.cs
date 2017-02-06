using System;
using System.Web.UI;
using Core.Web;

namespace Core.Web.SvrCtls {
/*====================================================*/
///<summary>
///base class for all server controls
///</summary>
public class cCoreSvrCtl : Control 
{
/*====================================================*/

	public cCorePage CorePage {
		get {return (cCorePage)Page;}
	}

/*-----------------------------------------------------*/

	public cWebAppl WebAppl {
		get {return CorePage.WebAppl;}
	}

/*-----------------------------------------------------*/

	public cWebSession WebSession {
		get {return CorePage.WebSession;}
	}
	
/*====================================================*/
} //class cCoreSvrCtl


} //Core.Web.SvrCtls