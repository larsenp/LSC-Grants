using System;
using System.Collections;
using System.Web.UI;
using Core.Web.SvrCtls;

namespace Core.Web.Navigation
{
/// <summary>
/// object designed to encapsulate writing JavaScript dynamically
/// </summary>
public class cJSWriter : cSvrButton {
/*====================================================*/

	protected ArrayList mLinkedDocs;
	
/*-----------------------------------------------------*/

	public ArrayList LinkedDocs {
		get {return mLinkedDocs;}
		set {mLinkedDocs = value;}
	}
	
/*-----------------------------------------------------*/

	public cJSWriter() {
		mLinkedDocs = new ArrayList();
	}

/*====================================================*/

	public void Add_LinkedDoc(String aFileName) {
		LinkedDocs.Add(aFileName);
	}

/*-----------------------------------------------------*/

	public void Render_LinkedDocs(HtmlTextWriter aTxTWr) {
		foreach (String aLinkedDoc in LinkedDocs)
			aTxTWr.Write("<script language='JavaScript1.2' src='" +
					aLinkedDoc +
					"'></script>");
	}
	
/*====================================================*/

	public void Render_Open(HtmlTextWriter aTxTWr) {
		//iterate through LinkedDocs to write:
		//* aTxTWr.Write("<script language='JavaScript' src='" + <path to file> + "'></script>");
		//hard coded for now.
		aTxTWr.Write("<script language='JavaScript'>");
	}
	
/*-----------------------------------------------------*/

	public void Render_Close(HtmlTextWriter aTxTWr) {
		aTxTWr.Write("</script>");
		//aTxTWr.Write("<script language='JavaScript1.2' src='Includes/mm_menu.js'></script>");
		Render_LinkedDocs(aTxTWr);
		aTxTWr.Write("<script language='JavaScript1.2'>mmLoadMenus();</script>");		
	}
	
/*====================================================*/
/*
	main method to provide this instance JS content
*/
	public virtual void Render_Content(HtmlTextWriter aTxTWr) {
		aTxTWr.Write("Hello World");
	}
	
/*-----------------------------------------------------*/
/*
	.net method to override
	* called by, and aTxTWr supplied by, system
*/
	protected override void Render(HtmlTextWriter aTxTWr) {
		Render_Open(aTxTWr);
		
		Render_Content(aTxTWr);
		
		Render_Close(aTxTWr);
	}

/*====================================================*/
} //class cJSWriter

} //namespace JSWriter
