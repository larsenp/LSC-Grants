using System;
using System.Collections;
using System.Web.UI;
using System.Xml;

namespace Core.Web.SvrCtls 
{
	///<summary>
	///paging function to datalist control
	///</summary>
	public class cPagingCtl : cCoreSvrCtl, IPostBackEventHandler 
	{
		/*====================================================*/
	
		public event EventHandler ViewNextPrev;

		protected String mUniqueHash;
	
		protected int    mNumRowsToView;
		protected int    mTempNumRowsToView;
		protected int    mTotalRows;
		protected String mAnchorName;
		protected bool	 mShowAll = true;
		protected bool	 mDisableShowAll = false;
	
		/*-----------------------------------------------------*/

		public String UniqueHash 
		{
			get {return mUniqueHash;}
			set {mUniqueHash = value;}
		} 

		/*-----------------------------------------------------*/

		public String CurRowQueryString 
		{
			get {return UniqueHash + "_" + ID.ToString() + "_CurRow";}
		} 

		/*-----------------------------------------------------*/

		public int NumRowsToView 
		{
			get {return mNumRowsToView;}
			set 
			{
				mNumRowsToView = value;
				if(mNumRowsToView == 0)
					Visible = false;
			}
		}
	
		/*-----------------------------------------------------*/

		public bool ShowAll 
		{
			get {return mShowAll;}
			set {mShowAll = value;}
		}
	
		/*-----------------------------------------------------*/

		public bool DisableShowAll 
		{
			get {return mDisableShowAll;}
			set {mDisableShowAll = value;}
		}
	
		/*-----------------------------------------------------*/

		public int CurrentRow 
		{
			get 
			{
				return Page.Request.QueryString[CurRowQueryString] != null
					&& Page.Request.QueryString[CurRowQueryString] != "ShowAll"?
					Convert.ToInt32(Page.Request.QueryString[CurRowQueryString]) :
					1;
			}
		}
	
		/*-----------------------------------------------------*/	
	
		public int TotalRows 
		{
			get {return mTotalRows;}
			set {mTotalRows = value;}
		}
	
		/*-----------------------------------------------------*/

		public String AnchorName
		{
			get {return mAnchorName;}
			set {mAnchorName = value;}
		}
	
		/*-----------------------------------------------------*/

		public cPagingCtl()
		{
			mUniqueHash = ""; //prepended to CurRowQueryString
			mNumRowsToView = 2; //default value, use properties to change 
			mTotalRows = 0; //default value, use properties to change 
			mAnchorName = "";
		
			ViewNextPrev += new System.EventHandler(OnViewNextPrev);
		}

		/*====================================================*/

		public String Clear_CurPage(String aURL, bool aRedirFlag) 
		{
			aURL = cWebLib.RemoveQuerystringParameter(aURL, CurRowQueryString);
			if (aRedirFlag)
				CorePage.Redirect(aURL);
			return aURL;
		}
	
		/*====================================================*/
	
		protected virtual void OnViewNextPrev(Object aSrc, EventArgs e) 
		{
			cPagingCtlEventArgs	aArgs = (cPagingCtlEventArgs)e;
		
			/*
			Page.Response.Write("Event: " + aArgs.mAction);
			return;
			*/
			int aNextRow;
			int aPrevRow;
		
			if (CurrentRow + mNumRowsToView >= mTotalRows)
				aNextRow = CurrentRow + (mTotalRows - CurrentRow);
			else
				aNextRow=CurrentRow + mNumRowsToView;
		
			if (CurrentRow -  mNumRowsToView < 1)
				aPrevRow = 1;
			else
				aPrevRow=CurrentRow - mNumRowsToView;
		
		
			switch (aArgs.mAction) 
			{
				case "First" :
					if (mAnchorName == "")
						CorePage.Redirect(CurRowQueryString, "1");
					else
						CorePage.Redirect(CurRowQueryString, "1", mAnchorName);
					break;
				case "Next" :
					if (mAnchorName == "")
						CorePage.Redirect(CurRowQueryString, aNextRow.ToString());
					else
						CorePage.Redirect(CurRowQueryString, aNextRow.ToString(), mAnchorName);
					break;
				case "Prev" :
					if (mAnchorName == "")
						CorePage.Redirect(CurRowQueryString, aPrevRow.ToString());
					else
						CorePage.Redirect(CurRowQueryString, aPrevRow.ToString(), mAnchorName);
					break;
				case "Last" :
					if (mAnchorName == "")
						CorePage.Redirect(CurRowQueryString, (mTotalRows - mNumRowsToView + 1).ToString());
					else
						CorePage.Redirect(CurRowQueryString, (mTotalRows - mNumRowsToView + 1).ToString(), mAnchorName);
					break;
				case "All" :
					if (mAnchorName == "")
						CorePage.Redirect(CurRowQueryString, "ShowAll");
					else
						CorePage.Redirect(CurRowQueryString, "ShowAll", mAnchorName);
					break;
				case "Current" :
					if (mAnchorName == "")
						CorePage.Redirect(CurRowQueryString, CurrentRow.ToString());
					else
						CorePage.Redirect(CurRowQueryString, CurrentRow.ToString(), mAnchorName);
					break;
			}
		}
																				  
		/*-----------------------------------------------------*/	
		/*
			Method of IPostBackEventHandler that raises change events.
		*/
		public void RaisePostBackEvent(string aArgs) 
		{
			if (ViewNextPrev != null) 
			{
				cPagingCtlEventArgs		aEventArgs = new cPagingCtlEventArgs();
			
				aEventArgs.mAction = aArgs;
				ViewNextPrev(this, aEventArgs);
			}
		}
      
		/*====================================================*/

		protected override void Render(HtmlTextWriter aTxTWr) 
		{
			int aNumRowsDisp = CurrentRow + (mNumRowsToView-1);
			string aSeparator = "&nbsp;|&nbsp;";
			string aSeparator1 = "";
			int aViewNext = mNumRowsToView;
			XmlNode aNode = this.WebAppl.ConfigDoc.DocElement.SelectSingleNode("Appl/DataList");
			if (aNode != null && aNode.Attributes["MaxToDisplay"].Value == "-1")
				DisableShowAll = true;
			
			if (mNumRowsToView > mTotalRows) 
			{		
				mNumRowsToView = mTotalRows;
			}
		
			if (CurrentRow + mNumRowsToView > mTotalRows)//the control enters into this conditional if only when it is the last page.
			{
				aNumRowsDisp = mTotalRows;
				aSeparator1 = "&nbsp;|&nbsp;";
				aSeparator = "";
			}
		
			if (mTotalRows - (CurrentRow + mNumRowsToView) < mNumRowsToView)
			{
				aViewNext = mTotalRows - (CurrentRow + (mNumRowsToView-1));
			}
		
			aTxTWr.Write("<table width='100%'>");
			aTxTWr.Write("<tr><font size='2pt'>");
			
			if (ShowAll == false) {
				aTxTWr.Write("<td>Viewing Records " + CurrentRow + " - " + mTotalRows);
			} 
			else {
				aTxTWr.Write("<td>Viewing Records " + CurrentRow + " - " + aNumRowsDisp + " of " + mTotalRows);
			}
			aTxTWr.Write("&nbsp;&nbsp;");
			aTxTWr.Write("<td align='right'>");
		
			if (CurrentRow > mNumRowsToView + 1 && ShowAll == true)
			{
			
				//First link
				aTxTWr.Write("<a id =\"" + this.UniqueID + "\" href=\"javascript:" + 
					Page.GetPostBackEventReference(this, "First") +"\">");
				aTxTWr.Write("<< First " + mNumRowsToView);
				aTxTWr.Write("</a>");
			
				//sep
				if (aSeparator1 == "")
				{
					aTxTWr.Write(aSeparator);
				}
				else
				{
					aTxTWr.Write(aSeparator1);
				}
			}
			if (CurrentRow != 1 && ShowAll == true)
			{
			
				//Prev link
				aTxTWr.Write("<a id =\"" + this.UniqueID + "\" href=\"javascript:" + 
					Page.GetPostBackEventReference(this, "Prev") +"\">");
				aTxTWr.Write("< Previous " + mNumRowsToView);
				aTxTWr.Write("</a>");
			
				//sep
				aTxTWr.Write(aSeparator);
			
			}
		
			if (!(CurrentRow + mNumRowsToView > mTotalRows) && ShowAll == true)
			{
				//Next link
				aTxTWr.Write("<a id =\"" + this.UniqueID + "\" href=\"javascript:" + 
					Page.GetPostBackEventReference(this, "Next") +"\">");
				aTxTWr.Write("Next " + aViewNext + " >");
				aTxTWr.Write("</a>");	
			}
			if (!(CurrentRow + mNumRowsToView > mTotalRows) && ((mTotalRows - CurrentRow) > 2*mNumRowsToView) && ShowAll == true)
			{
			
				//sep
				aTxTWr.Write(aSeparator);
			
				//Last link
				aTxTWr.Write("<a id =\"" + this.UniqueID + "\" href=\"javascript:" + 
					Page.GetPostBackEventReference(this, "Last") +"\">");
				aTxTWr.Write("Last " + mNumRowsToView + " >>");
				aTxTWr.Write("</a>");	
			}
			if (DisableShowAll == false)
			{
				if (!(mNumRowsToView > mTotalRows || ShowAll == false))
				{
					//sep
					aTxTWr.Write("&nbsp;|&nbsp;");
					//Next link
					aTxTWr.Write("<a id =\"" + this.UniqueID + "\" href=\"javascript:" + 
						Page.GetPostBackEventReference(this, "All") +"\">");
					aTxTWr.Write("Show All");
					aTxTWr.Write("</a>");	
				}
				if (ShowAll == false)
				{
					//Next link
					aTxTWr.Write("<a id =\"" + this.UniqueID + "\" href=\"javascript:" + 
						Page.GetPostBackEventReference(this, "Current") +"\">");
					aTxTWr.Write("Show Page View");
					aTxTWr.Write("</a>");	
				}
			}
			aTxTWr.Write("</font>");
			aTxTWr.Write("</table>");
		}												   

		/*====================================================*/
	} //cPagingCtl

} //namespace PagingCtl

	