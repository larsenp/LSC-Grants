using System;
using System.Web.UI;
using Core.Web.User;
using Core.Web.Modules;

namespace Core.Web.Navigation.CrumbTrail {
/*====================================================*/

///<summary>
///renders crumb trail data to page
///</summary>
public class cCrumbTrailDisplay : Control  
{
/*====================================================*/

	private cCrumbTrail	mCrumbTrail;
	private String		mDisplayText;
	private String		mLinkTitle;
	private String		mAutoVDateType;
	private String		mKey;
	
/*-----------------------------------------------------*/

	public cCrumbTrail CrumbTrail {
		get {return mCrumbTrail;}
		set {
			if (mCrumbTrail == value) return;
			mCrumbTrail = value;
			if (mCrumbTrail != null)
				mCrumbTrail.DisplayControl = this;
		}
	}
	
/*-----------------------------------------------------*/

	public String DisplayText {
		get {return mDisplayText;}
		set {mDisplayText = value;}
	}
	
/*-----------------------------------------------------*/

	public String LinkTitle {
		get {return mLinkTitle;}
		set {mLinkTitle = value;}
	}
	
/*-----------------------------------------------------*/

	public String AutoVDateType {
		get {return mAutoVDateType;}
		set {mAutoVDateType = value;}
	}
	
/*-----------------------------------------------------*/

	public String Key {
		get {return mKey;}
		set {mKey = value;}
	}
	
/*====================================================*/

	protected override void Render(HtmlTextWriter aTxTWr) {
		int		aIndex;

		if (this.Page.Request.QueryString["PageFrame"] == "Print")
			{
				return;
			}
		
		mCrumbTrail = ((cWebUser)((cModulePage)Page).ModuleUser).CrumbTrail;
		//AutoVDateType: None, Root, Relative
		if (AutoVDateType == "Root")
			mCrumbTrail.Validate_Root(Key, "", LinkTitle, this.Page.Request.Url.AbsoluteUri);
		else if (AutoVDateType == "Relative")
			mCrumbTrail.Validate(Key, "", LinkTitle, this.Page.Request.Url.AbsoluteUri);
		else if (AutoVDateType == "Last")
			mCrumbTrail.Validate_Last(Key, "", LinkTitle, this.Page.Request.Url.AbsoluteUri);
			
		if (CrumbTrail == null) {
			aTxTWr.Write("CrumbTrail is null");
			return;
		}

		for (aIndex = 0; aIndex < CrumbTrail.Count; aIndex++) {
			if (aIndex != 0)
				aTxTWr.Write("&nbsp;|&nbsp;");
			
			if (aIndex == CrumbTrail.Count - 1)
				CrumbTrail.Crumb_From_Index(aIndex).Anchor = false;
			else
				CrumbTrail.Crumb_From_Index(aIndex).Anchor = true;
				
			if (AutoVDateType != "Root")
				aTxTWr.Write(((cModulePage)Page).ConfigurableText( CrumbTrail.Crumb_From_Index(aIndex).OutputHtml));
		}		
	}
	
/*====================================================*/
} //public class cCrumbTrailDisplay


/*====================================================*/
}  //namespace Core.Web.Navigation.CrumbTrail
