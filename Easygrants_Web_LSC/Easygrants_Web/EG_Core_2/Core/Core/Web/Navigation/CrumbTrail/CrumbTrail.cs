using System;
using System.Collections;
using System.Web.UI;

namespace Core.Web.Navigation.CrumbTrail {
/*====================================================*/

///<summary>
///Provides dynamic navigation based on user's prior navigation
///</summary>
public class cCrumbTrail : IEnumerable  
{
/*====================================================*/

	private ArrayList	mCrumbTbl;
	
	public Control		mDisplayControl;
	
/*-----------------------------------------------------*/

	public int Count {
		get {return mCrumbTbl.Count;}
	}
	
/*-----------------------------------------------------*/

	public bool Visible {
		get {return DisplayControl == null ? false : DisplayControl.Visible;}
		set {if (DisplayControl != null) DisplayControl.Visible = value;}
	}
	
/*-----------------------------------------------------*/

	public Control DisplayControl {
		get {return mDisplayControl;}
		set {
			if (mDisplayControl == value) return;
			mDisplayControl = value;
			if (mDisplayControl != null)
				((cCrumbTrailDisplay)mDisplayControl).CrumbTrail = this;
		}
	}
	
/*-----------------------------------------------------*/

	public cCrumb Root_Crumb {

		get {return Crumb_From_Index(0);}
	}
/*-----------------------------------------------------*/

	public cCrumb this[String aKey] {
		get {
			foreach(cCrumb aCrumb in mCrumbTbl) {
				if (aCrumb.Key == aKey)
					return aCrumb;
			}
		
			return null;
		}
	}

/*-----------------------------------------------------*/

	public String Test_Label {
		get {return "Here is the CrumbTrail";}
	}
	
/*-----------------------------------------------------*/

	public cCrumbTrail() {
		mCrumbTbl = new ArrayList();
		Visible = false;
	}

/*====================================================*/

	public void Add(cCrumb aCrumb) {
		mCrumbTbl.Add(aCrumb);
	}

/*-----------------------------------------------------*/
	
	public void Insert(cCrumb aCrumb, int aIndex) {
		if (aIndex < 0 || aIndex >= Count)
			Add(aCrumb);
		else
			mCrumbTbl.Insert(aIndex, aCrumb);
	}
	
/*-----------------------------------------------------*/

	public void Remove(cCrumb aCrumb) {
		mCrumbTbl.Remove(aCrumb);
	}

/*-----------------------------------------------------*/

	public void RemoveAt(int aIndex) {
		mCrumbTbl.RemoveAt(aIndex);
	}

/*====================================================*/

	public IEnumerator GetEnumerator() {
		return mCrumbTbl.GetEnumerator();
	}

/*====================================================*/
	
	public int Index_From_Key(String aKey) {
		int	aIndex;
		
		for (aIndex = 0; aIndex < Count; aIndex++)
			if (((cCrumb)mCrumbTbl[aIndex]).Key == aKey)
				return aIndex;
	
		return -1;
	}
	
/*-----------------------------------------------------*/

	public cCrumb Crumb_From_Index(int aIndex) {

		if(aIndex > -1 && aIndex < Count)
			return (cCrumb)mCrumbTbl[aIndex];
		else
			return null;
	}
/*-----------------------------------------------------*/

	public void Clear(String aKey) {
		int	aKeyIndex;
		
		//if empty Key passed in, clear entire trail
		aKeyIndex = (aKey == "" ? 0 : Index_From_Key(aKey));
		
		if (aKeyIndex >= 0) {
			int	aIndex = Count;
			
			while (--aIndex >= aKeyIndex)
				RemoveAt(aIndex);
		}
	}
	
/*-----------------------------------------------------*/

	public void Clear() {
		Clear("");
	}
	
/*-----------------------------------------------------*/
///<summary>
///validates key and date to manage crumb list
///</summary>
	public void Validate(String aKey, String aLabel, String aText,
							String aURL) {
		Clear(aKey);
		
		cCrumb aCrumb = new cCrumb();
		aCrumb.Key = aKey;
		aCrumb.Label = aLabel;
		aCrumb.Text = aText;
		aCrumb.URL = aURL;
		Add(aCrumb);
		
		Visible = true;
	}
	
/*-----------------------------------------------------*/

	public void Validate(String aKey, String aLabel, String aText) {
	
		Validate(aKey, aLabel, aText, DisplayControl.Page.Request.Url.PathAndQuery);
	
	}
	
/*-----------------------------------------------------*/

	public void Validate_Root(String aKey, String aLabel, String aText,
							String aURL) {
		Clear();
		Validate(aKey, aLabel, aText, aURL);
	}
	
/*-----------------------------------------------------*/

	public void Validate_Root(String aKey, String aLabel, String aText) {
	
		Clear();
		Validate(aKey, aLabel, aText);
	}

/*-----------------------------------------------------*/

	public void Validate_Last(String aKey, String aLabel, String aText,
							String aURL) {
		if(Count > 1)
			RemoveAt(Count-1);

		int cnt = Count;
		cCrumb aDelCrumb;
		while(cnt>1){
			aDelCrumb = Crumb_From_Index(cnt-1);
			if(aDelCrumb.Key == aKey){
				break;
			}
			cnt--;
		}
		while(cnt<=Count && Count>1){
			RemoveAt(Count-1);
		}

		cCrumb aCrumb = new cCrumb();
		aCrumb.Key = aKey;
		aCrumb.Label = aLabel;
		aCrumb.Text = aText;
		aCrumb.URL = aURL;
		Add(aCrumb);
		
		Visible = true;
	}
	
/*-----------------------------------------------------*/

	public void Validate_Last(String aKey, String aLabel, String aText) {
	
		Validate_Last(aKey, aLabel, aText, DisplayControl.Page.Request.Url.PathAndQuery);
	
	}
	
/*====================================================*/
} //public class cCrumbTrail


/*====================================================*/
}  //namespace Core.Web.Navigation.CrumbTrail
