using System;

namespace Core.Web.Navigation.CrumbTrail {
/*====================================================*/

///<summary>
///User navigation data node in crumb trail
///</summary>
public class cCrumb  
{
/*====================================================*/

	private String		mKey;
	private String		mLabel;
	private String		mText;
	private String		mURL;
	private bool		mAnchor;
	
/*-----------------------------------------------------*/

	public String Key {
		get {return mKey;}
		set {mKey = value;}
	}
	
/*-----------------------------------------------------*/

	public String Label {
		get {return mLabel;}
		set {mLabel = value;}
	}
	
/*-----------------------------------------------------*/

	public String Text {
		get {return mText;}
		set {mText = value;}
	}
	
/*-----------------------------------------------------*/

	public String URL {
		get {return mURL;}
		set {mURL = value;}
	}
	
/*-----------------------------------------------------*/

	public bool Anchor {
		get {return mAnchor;}
		set {mAnchor = value;}
	}
	
/*-----------------------------------------------------*/

	public String OutputHtml {
		get {
			String aOutput = "";
			
			if (Label != null && Label != "")
				aOutput += "<b>" + Label + "</b>:&nbsp;";
			if(Anchor)
				aOutput += "<a href='" + URL + "'>";
			aOutput += Text;
			if(Anchor)
				aOutput +="</a>";
			return aOutput;
		}
	}
	
/*-----------------------------------------------------*/

	public cCrumb() {
	}

/*====================================================*/
} //public class cCrumb


/*====================================================*/
}  //namespace Core.Web.Navigation.CrumbTrail
