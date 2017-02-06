using System;
using System.Collections;
using System.Web.UI;
using Core.DataAccess;

namespace Core.Web.SvrCtls {
///<summary>
///Dynamic list object sort control
///</summary>	
public class cSortCtl : cCoreSvrCtl, IPostBackEventHandler 
{
	protected cPagingCtl	mPagingCtl;
	protected String	mCaptionHtml;
	protected String	mQueryKey;
	protected String	mQueryValue;
	protected String	mAnchorName;
	
/*====================================================*/

	public cPagingCtl PagingCtl {
		get {return mPagingCtl;}
		set {mPagingCtl = value;}
	}
	
/*-----------------------------------------------------*/	

	public String CaptionHtml {
		get {return mCaptionHtml;}
		set {mCaptionHtml = value;}
	}
	
/*-----------------------------------------------------*/	

	public String QueryKey {
		get {return mQueryKey;}
		set {mQueryKey = value;}
	}
	
/*-----------------------------------------------------*/	

	public String QueryValue {
		get {return mQueryValue;}
		set {mQueryValue = value;}
	}

/*-----------------------------------------------------*/	

	public String AnchorName
	{
		get {return mAnchorName;}
		set {mAnchorName = value;}
	}

/*====================================================*/
	
	public static String Get_Page_SortDir(cCorePage aPage, String aQueryKey, out String aQueryValue) {
		int		aIndex;
		String	aSortDir;
		
		aQueryValue = aPage.Request.QueryString[aQueryKey];
		if (aQueryValue == null) return "";
		
		aIndex = aQueryValue.LastIndexOf("/");
		if (aIndex == -1) return "";
		
		aSortDir = aQueryValue.Substring(aIndex + 1);
		aQueryValue = aQueryValue.Substring(0, aIndex);
		return aSortDir;
	}
	
/*====================================================*/
	
	public String Append_SortDir(String aSortDir) {
		return QueryValue + "/" + aSortDir;
	}
	
/*-----------------------------------------------------*/	
/*
returns current SortDir as specficied for this page
* returns "" if none specfied
*/
	public String Get_PageCurrentSortDir() {
		String	aQueryValue,
				aSortDir;
		
		aSortDir = Get_Page_SortDir(CorePage, QueryKey, out aQueryValue);
		//check if supplied sortdir is for this control:
		if (aQueryValue != QueryValue) return "";
		return aSortDir;
	}
	
/*====================================================*/
/*
gets the current sortdir for this page
* sets to opposite
*/
	protected virtual void AddSortToQueryString() {
		String	aSortDir = Get_PageCurrentSortDir();
		
		switch (aSortDir) {
			case cDataProvider.kSortDir_Ascending :
				aSortDir = cDataProvider.kSortDir_Descending;
				break;
			default :
				aSortDir = cDataProvider.kSortDir_Ascending;
				break;
		}
		
		String	aURL = CorePage.Request.Url.PathAndQuery;
		
		if (PagingCtl != null && aURL.IndexOf(PagingCtl.CurRowQueryString + "=ShowAll") == -1)
			aURL = PagingCtl.Clear_CurPage(aURL, false);
			
		aURL = cWebLib.AddQuerystringParameter(aURL, QueryKey, Append_SortDir(aSortDir));
		if (mAnchorName != "")
		{
			aURL = cWebLib.RemoveQuerystringParameter(aURL, mAnchorName);
			aURL += "&" + mAnchorName + "=#" + mAnchorName;
		}
		CorePage.Redirect(aURL);
	}
	
/*-----------------------------------------------------*/	
/*
	Method of IPostBackEventHandler that raises change events.
*/
	public void RaisePostBackEvent(string aArgs) {
		switch(aArgs) {
			case "Sort" :
				AddSortToQueryString();
				return;
		}
	}
      
/*====================================================*/

	protected override void Render(HtmlTextWriter aTxTWr) {
		String	aSortDir = Get_PageCurrentSortDir();
		
		aTxTWr.Write("<a href=\"JavaScript:" +
						Page.GetPostBackEventReference(this, "Sort") + 
						"\">");
		aTxTWr.Write(CaptionHtml);
		switch (aSortDir) {
			case cDataProvider.kSortDir_Ascending :
				aTxTWr.Write(" (Asc)");
				break;
			case cDataProvider.kSortDir_Descending :
				aTxTWr.Write(" (Desc)");
				break;
		}
		aTxTWr.Write("</a>");
	}

/*====================================================*/
} //cSortCtl

} //Core.Web.SvrCtls
