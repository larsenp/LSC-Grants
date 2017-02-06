using System;
using System.Web.UI;

namespace Core.Web.Modules {
/*====================================================*/

///<summary>
///Core Web Module state object
///</summary>
public class cModuleState 
{
/*====================================================*/

	protected String		mLastURL;
	
/*-----------------------------------------------------*/

	public String LastURL {
		get {return mLastURL;}
		set {mLastURL = value;}
	}

/*=====================================================*/

	public void Load(String aLastURL) {
		LastURL = aLastURL;
	}
	
/*-----------------------------------------------------*/

	public void Load(Page aPage) {
		Load(aPage.Request.Url.PathAndQuery);
	}
	
/*-----------------------------------------------------*/

	public void Return(Page aPage) {
		aPage.Response.Redirect(LastURL);
	}
	
/*=====================================================*/
} // class cModuleState


/*====================================================*/
}  //namespace Core.Web.Modules
