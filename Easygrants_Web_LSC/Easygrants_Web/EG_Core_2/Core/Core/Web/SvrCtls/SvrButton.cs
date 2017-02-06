using System;
using System.Web.UI;
using Core.Web;

namespace Core.Web.SvrCtls {
/*====================================================*/
///<summary>
///Server version of button control
///</summary>
public class cSvrButton : cCoreSvrCtl, IPostBackEventHandler 
{
/*====================================================*/

	public event EventHandler ButtonClick;
	
	private String mImageName;
	private String mCaption;
	
/*-----------------------------------------------------*/

	public String ImageName {
		get {return mImageName;}
		set {mImageName = value;}
	}
	
/*-----------------------------------------------------*/

	public String Caption {
		get {return mCaption;}
		set {
			mCaption = value;
			
			String	aImageName = Caption;
			
			ImageName = aImageName.Replace(" ", "_") + ".jpg";
		}
	}
	
/*-----------------------------------------------------*/

	public String CaptionText {
		get {return mCaption;}
		set {
			mCaption = value;
			ImageName = null;
		}
	}
	
/*====================================================*/

/*-----------------------------------------------------*/
/*
	.net method to override
	* called by, and aTxTWr supplied by, system
*/
	protected override void Render(HtmlTextWriter aTxTWr) {
		aTxTWr.Write("<a href=\"JavaScript:" +
						Page.GetPostBackEventReference(this, "Click") + 
						"\">");

		if (ImageName != null) {
			String aImageName = "Core/Images/" + ImageName;
			
			aTxTWr.Write("<img src='" +
							CorePage.WebAppl.Build_RootURL(aImageName) + "' " +
							"alt='" + (Caption != null ? Caption : "Click") + "' " +
							"border='0'" +
							"/>");
		}
		else if (Caption != null)
			aTxTWr.Write(Caption);
		else
			aTxTWr.Write("Button");
	
		aTxTWr.Write("</a>");
	}

/*-----------------------------------------------------*/
/*
	IPostBackEventHandler method to raise postback events
*/
	public void RaisePostBackEvent(String aArg) {
	
		if (ButtonClick != null)
			ButtonClick(this, EventArgs.Empty);
	}

/*====================================================*/
} //class cSvrButton


} //Core.Web.SvrCtls