using System;
using System.Web.UI;
using Core.Web.User;

namespace Core.Web {
/*====================================================*/

///<summary>
///Modifies output based on if user is staff
///</summary>
public class cstaffCtl : cCoreCtl 
{
/*====================================================*/

	public override void CoreCtl_Load(Object aSrc, EventArgs aEvent) {
		if (!(CorePage.DebugSwitchEnabled || this.WebSession.HasStaffUser)) {
			Visible = false;
			return;
		}
		
		base.CoreCtl_Load(aSrc, aEvent);
	}

/*====================================================*/
} //class cstaffCtl


/*====================================================*/
}  //Core.Web