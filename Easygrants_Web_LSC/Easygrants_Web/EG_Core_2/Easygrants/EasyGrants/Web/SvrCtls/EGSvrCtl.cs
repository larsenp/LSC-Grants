using System;
using System.Web.UI;
using Core.Web;
using Core.Web.SvrCtls;


namespace EasyGrants.Web.SvrCtls {
/*====================================================*/
///<summary>
///provides EG accessors to cCoreSvrCtl methods
///</summary>
public class cEGSvrCtl : cCoreSvrCtl 
{
/*====================================================*/

	public cEGAppl EGAppl {
		get {return (cEGAppl)WebAppl;}
	}

/*----------------------------------------------------*/

	public cEGSession EGSession {
		get {return (cEGSession)WebSession;}
	}

/*====================================================*/
} //class cEGSvrCtl


} //EasyGrants.Web.SvrCtls