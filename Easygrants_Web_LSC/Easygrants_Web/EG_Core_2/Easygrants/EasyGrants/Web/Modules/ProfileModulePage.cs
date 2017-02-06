using System;
using System.Web;
using System.Xml;
using Core.DataAccess.XMLAccess;
using Core.Web.Modules;
using EasyGrants.Web.User;
using EasyGrants.Web;
using Core.DataAccess;


namespace EasyGrants.Web.Modules {
/*====================================================*/

///<summary>
///subclass of cModulePage, provides EG accessors to cModulePage methods
///</summary>
public class cProfileModulePage : cModulePage 
{
/*====================================================*/

	public cEGSession EGSession {
		get {return (cEGSession)WebSession;}
	}
	
/*====================================================*/

	public override void CorePage_Load(Object aSrc, EventArgs aEvent){
		base.CorePage_Load(aSrc, aEvent);
		
	}
/*====================================================*/

/*====================================================*/
} //cProfileModulePage

}//EasyGrants.Web.Modules

