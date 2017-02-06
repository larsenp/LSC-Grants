using System;
using System.Data;
using System.Collections;
using Core.DataAccess;
using System.Xml;

namespace Core.Web.Navigation {
/*====================================================*/

///<summary>
///Represents a single element in a user's navigation table
///</summary>
public class cNavElement  
{
/*====================================================*/

	private ArrayList		mElements;
	
	private cNavElement		mParent;
	private XmlNode			mActionNode;
	private	String			mKey;
	private bool			mExpanded;
	private	bool			mEnabled;
	private	bool			mEnabledAfterSubmit;
	private	bool			mDisabledBeforeSubmit;	
	private	bool			mExternal;
	private bool			mVisible;
	private bool			mHorizontal;
	private String			mPageTitle;
	private String			mNavTitle;
	private String			mSourceFile;
	private String			mTarget;
	private String			mHelpFile;
	private bool			mIsSubmissionSection;
	//private String mArgType;
	//private String mArgPropertyKey;
	//private String mArgType2;
	//private String mArgPropertyKey2;
	private bool			mIsActiveOnSelect;
	private XmlNode mArgumentsNode;

/*====================================================*/

	public XmlNode ArgumentsNode {
		get { return mArgumentsNode; }
		set { mArgumentsNode = value; }
	}
	
/*====================================================*/

	public ArrayList Elements {
		get {return mElements;}
	}
	
/*-----------------------------------------------------*/

	public cNavElement Parent {
		get {return mParent;}
		set {mParent = value;}
	}
	
	/*-----------------------------------------------------*/

	public XmlNode ActionNode 
	{
		get {return mActionNode;}
		set {mActionNode = value;}
	}
	
	/*-----------------------------------------------------*/

	public String Key 
	{
		get {return mKey;}
	}
	
	/*-----------------------------------------------------*/

	public bool Expanded 
	{
		get {return mExpanded;}
		set {mExpanded = value;}
	}
	
/*-----------------------------------------------------*/

	public bool Enabled {
	
		get {return mEnabled;}
		set {mEnabled = value;}
	}
/*-----------------------------------------------------*/

	public bool EnabledAfterSubmit {
	
		get {return mEnabledAfterSubmit;}
		set {mEnabledAfterSubmit = value;}
	}
	
/*-----------------------------------------------------*/

	public bool DisabledBeforeSubmit {
	
		get {return mDisabledBeforeSubmit;}
		set {mDisabledBeforeSubmit = value;}
	}
	
/*-----------------------------------------------------*/

	public bool External {
	
		get {return mExternal;}
		set {mExternal = value;}
	}
	
/*-----------------------------------------------------*/

	public bool Visible {
		get {return mVisible;}
		set {mVisible = value;}
	}

/*-----------------------------------------------------*/

	public bool Horizontal {
		get {return mHorizontal;}
		set {mHorizontal = value;}
	}

/*-----------------------------------------------------*/

	public virtual String PageTitle {
		get {return mPageTitle;}
		set {mPageTitle = value;}
	}

/*-----------------------------------------------------*/

	public virtual String NavTitle {
		get {return mNavTitle;}
		set {mNavTitle = value;}
	}

/*-----------------------------------------------------*/

	public virtual String SourceFile {
		get {return mSourceFile;}
		set {mSourceFile = value;}
	}
	
/*-----------------------------------------------------*/

	public String Target {
		get {return mTarget;}
		set {mTarget = value;}
	}
	
/*-----------------------------------------------------*/

	public virtual String HelpFile {
		get {return mHelpFile;}
		set {mHelpFile = value;}
	}
	
/*-----------------------------------------------------*/

	public virtual int ChildElement_Count {
		get {return mElements == null ? 0 : mElements.Count;}
	}
	
/*-----------------------------------------------------*/

	public virtual bool HasChildElements {
		get {return ChildElement_Count > 0;}
	}
	
/*-----------------------------------------------------*/

	public bool IsSubmissionSection {
		get {return mIsSubmissionSection;}
		set {mIsSubmissionSection = value;}
	}
	
/*-----------------------------------------------------*/

//    public String ArgType {
//        get {return mArgType;}
//        set {mArgType = value;}
//    }
	
///*-----------------------------------------------------*/

//    public String ArgPropertyKey {
//        get {return mArgPropertyKey;}
//        set {mArgPropertyKey = value;}
//    }
	
///*-----------------------------------------------------*/

//    public String ArgType2 {
//        get {return mArgType2;}
//        set {mArgType2 = value;}
//    }
	
///*-----------------------------------------------------*/

//    public String ArgPropertyKey2 {
//        get {return mArgPropertyKey2;}
//        set {mArgPropertyKey2 = value;}
//    }
	
/*-----------------------------------------------------*/	
	
	public bool IsActiveOnSelect {
		get {return mIsActiveOnSelect;}
		set {mIsActiveOnSelect = value;}
	}
	
/*====================================================*/

	public cNavElement() {
		mVisible = true;
	}

/*-----------------------------------------------------*/

	public cNavElement(bool aExpanded) {
		mExpanded = true;
		mVisible = true;
		mEnabled = true;
		mEnabledAfterSubmit = true;
		mDisabledBeforeSubmit = false;
	}

/*-----------------------------------------------------*/

	public cNavElement(String aPageTitle) {
		mPageTitle = aPageTitle;
		mVisible = true;
		mEnabled = true;
	}

/*-----------------------------------------------------*/

	public cNavElement(String aKey, String aPageTitle) {
		mKey = aKey;
		mPageTitle = aPageTitle;
		mExpanded = true;
		mVisible = true;
		mEnabled = true;
	}

/*====================================================*/

	private void Build_Elements() {
		mElements = new ArrayList();
	}
	
/*====================================================*/

	public cNavElement NavElement(int aIndex) {
		return (cNavElement)mElements[aIndex];
	}
	
/*-----------------------------------------------------*/

	public void Add_NavElement(cNavElement aNavElement) {
		if (mElements == null) Build_Elements();
		aNavElement.Parent = this;
		mElements.Add(aNavElement);
	}
	
/*====================================================*/

	public cNavElement Find_ChildElement(String aKey) {
		if (aKey == Key) return this;
		
		if (mElements != null)
			foreach (cNavElement aNavElement in mElements) {
				cNavElement aFoundElement;
				aFoundElement = aNavElement.Find_ChildElement(aKey);
				if (aFoundElement != null) return aFoundElement;
			}
			
		return null;
	}
	
/*-----------------------------------------------------*/

	public void Show(bool aExpandChildren, bool aEnable) {
		if (aExpandChildren) {
			if (HasChildElements) {
				if (!Expanded) {
					//probably will do more here...
					Expanded = true;
				}
				if(aEnable) {
					Enabled = true;
					foreach (cNavElement aChildNavElement in mElements) {
						aChildNavElement.Enabled = true;
					}
				}
			}
		}
		
		if (Parent != null)
			Parent.Show(true, aEnable);
	}
	
	
/*-----------------------------------------------------*/

	public void HideChildren() {
		foreach (cNavElement aChildNavElement in mElements) {
			aChildNavElement.Expanded = false;
	
		this.Show(false, true);
		}
	}
/*-----------------------------------------------------*/

	public void EnableParentsChildElements(cNavElement aNavElement) {
		foreach (cNavElement aChildNavElement in mElements) {
			if(aChildNavElement.Parent == aNavElement) {
				aChildNavElement.Enabled = true;
			}
		}
		aNavElement.Enabled = true;
		if (aNavElement.Parent != null) {
			EnableParentsChildElements(aNavElement.Parent);
		}
	}
	
/*-----------------------------------------------------*/

	public void NavElement_Enable(bool aEnabled, bool aEnableChildren) {
		Enabled = aEnabled;
		if (aEnableChildren && HasChildElements) {
			foreach(cNavElement aChildElement in mElements) {
				aChildElement.NavElement_Enable(aEnabled, true);
			}
		}
	}
		
/*-----------------------------------------------------*/

	public void NavElement_Enable(String aPageKey, bool aEnabled, bool aEnableChildren) {
		cNavElement aNavElement;
		aNavElement = Find_ChildElement(aPageKey);
		
		if(aNavElement != null && aNavElement.ToString() != "")
		{
			aNavElement.Enabled = aEnabled;
			if (aEnableChildren && aNavElement.HasChildElements) {
				foreach(cNavElement aChildElement in aNavElement.Elements) {
					aChildElement.NavElement_Enable(aEnabled, true);
				}
			}
		}
	}
		
/*-----------------------------------------------------*/

	public void NavElement_FirstLevel_ValidateForSubmitted() {
		foreach(cNavElement aChildElement in Elements) {
			if (!aChildElement.EnabledAfterSubmit)
				NavElement_Enable(aChildElement.Key, false, true);
		}		
	}
	
/*-----------------------------------------------------*/

	public void NavElement_FirstLevel_ValidateForUnSubmitted() {
		foreach(cNavElement aChildElement in Elements) {
			if (aChildElement.DisabledBeforeSubmit == true)
				NavElement_Enable(aChildElement.Key, false, true);
		}		
	}	
	
	
/*-----------------------------------------------------*/

	public void NavElement_FirstLevel_ValidateForReopened(cDataObjectList aReopenSectionList) {
		//disable all navigation items marked as submission sections
		foreach(cNavElement aChildElement in Elements) {
			if (aChildElement.IsSubmissionSection == true)
				NavElement_Enable(aChildElement.Key, false, true);
		}
		//enable all navigation items corresponding to the reopen section rows
		foreach(cDataObject aReopenSection in aReopenSectionList) {
			cNavElement aChildElement = this.Find_ChildElement(aReopenSection.GetPropertyString("SectionKey"));
			if(aChildElement != null)
				NavElement_Enable(aChildElement.Key, true, true);
		}
	}
/*====================================================*/
} //class cNavElement


/*====================================================*/
}  //namespace Core.Web.Navigation
