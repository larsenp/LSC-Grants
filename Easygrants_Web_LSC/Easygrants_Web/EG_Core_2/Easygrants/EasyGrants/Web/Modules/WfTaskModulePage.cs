using System;
using System.Web;
using System.Xml;
using Core.DataAccess.XMLAccess;
using Core.Web.Modules;
using EasyGrants.Web.User;
using EasyGrants.Web;
using Core.DataAccess;
using EasyGrants.Workflow;


namespace EasyGrants.Web.Modules {
/*====================================================*/

/// <summary>
/// Base class for a module page working with assignments to the same WfTask
/// </summary>
public class cWfTaskModulePage : cModulePage {
/*====================================================*/

	public cEGSession EGSession {
		get {return (cEGSession)WebSession;}
	}
	
/*====================================================*/
	
	public virtual cDataObject WfTaskObject {
		get {return (cDataObject)((cEGUser)ModuleUser).WfTaskObject;}
	}

/*====================================================*/

	public virtual void Submit(cDataObject aDataObject, String aModuleName, String aModuleConfig, String aPageKey){
	}

/*====================================================*/
	public bool Get_WfTaskModulePage_Submitted() {
		
		return ((cEGWfTaskUser)ModuleUser).IsSubmitted;
	}
/*====================================================*/

	public override void CorePage_Load(Object aSrc, EventArgs aEvent){
		bool			aSubmitted = Get_WfTaskModulePage_Submitted();

		ValidateContentControlForSubmitted(aSubmitted);

		base.CorePage_Load(aSrc, aEvent);

		ValidateNavigationForSubmitted(aSubmitted);
	}

/*====================================================*/
} //WfTaskModulePage

}//EasyGrants.Web.Modules

