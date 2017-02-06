using System;
using System.Web.UI;
using Core.Util;
using Core.Web;

namespace Core.Web.SvrCtls {
/*====================================================*/

//this class should NOT implement INamingContainer
//	* doing so will cause controls it loads to derrive unique names
//	* this breaks the source pages references to this control:
//	* e.g., using a Required Field validator
///<summary>
///used within data presenter - loads user controls into data presenter
///</summary>
public class cUserCtlLoader : cCoreSvrCtl/*, INamingContainer*/ 
{
/*====================================================*/

	protected String		mContainer;
	protected int			mContainerIndex = -1;
	protected String		mCtlID;
	protected String		mSrc;
	protected String		mType;
	protected String		mProperties;
	protected String		mPathVar;
/*====================================================*/

	public String Container {
		get {return mContainer;}
		set {mContainer = value;}
	}

/*-----------------------------------------------------*/

	public int ContainerIndex {
		get {return mContainerIndex;}
		set {mContainerIndex = value;}
	}

/*-----------------------------------------------------*/

	public String CtlID {
		get {return mCtlID;}
		set {mCtlID = value;}
	}

/*-----------------------------------------------------*/
	
	public String Src {
		get {
			if (!(mSrc == null || mSrc == "")) {
				if(mPathVar != "" && mPathVar != null)
					return Path + mSrc;
				else
					return WebAppl.Build_RootURL(mSrc);
			}
			if (!(mType == null || mType == ""))
				return WebAppl.Get_ControlSrc(mType);
			return "";
		}
		set {mSrc = value;}
	}

/*-----------------------------------------------------*/

	
	public String Type {
		get {return mType;}
		set {mType = value;}
	}

/*-----------------------------------------------------*/
	
	public String Properties {
		get {return mProperties;}
		set {mProperties = value;}
	}


/*-----------------------------------------------------*/

	public String Path {
		get {
			if(mPathVar != "" && mPathVar != null)
				//return "Howdy!";
				return cReflection.Invoke_Property(this.WebAppl, mPathVar) + "/";
			else
				return "";
		}
	}	
/*-----------------------------------------------------*/

	public String PathVar {
		get {return mPathVar;}
		set {mPathVar = value;}
	}	

/*====================================================*/

	protected void Set_ParentCtlID(UserControl aCtlInfo) {
		Control		aParent = Parent;
		
		while (aParent != null) {
			if (cReflection.Set_Field(aParent, CtlID, aCtlInfo))
				return;
		
			aParent = aParent.Parent;
		} 
	}
	
/*-----------------------------------------------------*/
/*
	Iterates through name/value pairs provided in Properties node
		and sets those properties in loaded control
	* e.g., <Properties Value='Caption=Save&Color=Red'/>
	uses reflection - controls must implement property specified
	* e.g., loaded control must implement Caption, Color
*/
	protected void Set_ControlProperties(UserControl aCtlInfo) {
		
		if (Properties == null || Properties == "") return;
		
		String[]	aProperties = Properties.Split('&');
		String[]	aNameValues;
		
		foreach(String aNameValue in aProperties) {
			aNameValues = aNameValue.Split('=');
			cReflection.Set_Property(aCtlInfo, aNameValues[0], aNameValues[1]);
		}
	}
	
/*-----------------------------------------------------*/

	protected void Add_Control(UserControl aCtlInfo) {
		if (Container == null || Container == "")
			Controls.Add(aCtlInfo);
		else {
			Control		aParent = Parent;
			
			while (aParent != null) {
				Control	aCtl;
				aCtl = aParent.FindControl(Container);
				if (aCtl != null) {
					if (ContainerIndex == -1)
						aCtl.Controls.Add(aCtlInfo);
					else
						aCtl.Controls.AddAt(ContainerIndex, aCtlInfo);
						
					return;
				}
			
				aParent = aParent.Parent;
			} 
		}
	}
	
/*-----------------------------------------------------*/

	protected void LoadControlInParent() {
		UserControl		aCtlInfo;
		String			aCtlSrc;
		
		aCtlSrc = Src;
		aCtlInfo = (UserControl)CorePage.LoadControl(aCtlSrc);
		aCtlInfo.ID = CtlID;
		
		//set loaded control properties
		Set_ControlProperties(aCtlInfo);
		
		//set instance member in parent
		Set_ParentCtlID(aCtlInfo);
		
		Add_Control(aCtlInfo);
	}

/*====================================================*/

	protected override void CreateChildControls() {
		base.CreateChildControls();
	}
	
/*-----------------------------------------------------*/

	protected override void OnInit(EventArgs aEvent) {
		base.OnInit(aEvent);
		
		LoadControlInParent();
	}

/*====================================================*/
} //class cUserCtlLoader


} //Core.Web.SvrCtls