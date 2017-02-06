using System;
using System.Web.UI;
using Core.Web.User;

namespace Core.Web {
/*====================================================*/

///<summary>
///Debug base class for all controls - shows and hides event information depending on build 
///</summary>
public class cdbgCtl : cCoreCtl 
{
/*====================================================*/

	public override void CoreCtl_Load(Object aSrc, EventArgs aEvent) {
		if(!CorePage.DebugSwitchEnabled) {
			Visible = false;
			return;
		}
		
		base.CoreCtl_Load(aSrc, aEvent);
	}

/*====================================================*/
} //class cdbgCtl


/*====================================================*/
}  //Core.Web