using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Core.Web {

///<summary>
///Web method utility class library
///</summary>
public class cWebLib 
{
/*====================================================*/

	public static String ControlName(int aRowNum, int aColNum, int aMinNumDigits) {
		String	aStr;
		
		aStr = Convert.ToString(aColNum);
		aStr = aStr.PadLeft(aMinNumDigits, '0');
		aStr = "_" + aStr;
		aStr = Convert.ToString(aRowNum) + aStr;
		return aStr.PadLeft((aMinNumDigits * 2) + 1, '0');
	}

/*====================================================*/

	public static HtmlTableCell Add_TableCell(HtmlTableRow aTR, String aInnerHtml) {
		HtmlTableCell	aCell = new HtmlTableCell();
		
		aCell.InnerHtml = aInnerHtml;
		aTR.Cells.Add(aCell);
		return aCell;
	}

/*-----------------------------------------------------*/

	public static HtmlTableCell Add_TableCell(HtmlTableRow aTR, HtmlControl aControl) {
		HtmlTableCell	aCell = new HtmlTableCell();
		
		aCell.Controls.Add(aControl);
		aTR.Cells.Add(aCell);
		return aCell;
	}

/*-----------------------------------------------------*/

	public static HtmlAnchor TableCell_Add_Anchor(HtmlTableCell aTC, String aInnerHtml, EventHandler aHandler) {
		HtmlAnchor aAnchor = new HtmlAnchor();
		
		aAnchor.InnerHtml = aInnerHtml;
		aAnchor.ServerClick += aHandler;
		aTC.Controls.Add(aAnchor);
		return aAnchor;
	}
	
/*====================================================*/

	public static String CheckBoxToSQL(HtmlInputCheckBox aCheckbox) {
		//For use in building SQL Server queries. Returns 1 if checkbox is checked, 0 if not checked.
	
		return (Convert.ToInt16(aCheckbox.Checked)).ToString();
	}

/*-----------------------------------------------------*/

	public static String CheckBoxToSQL(CheckBox aCheckbox) {
		//For use in building SQL Server queries. Returns 1 if checkbox is checked, 0 if not checked.
	
		return (Convert.ToInt16(aCheckbox.Checked)).ToString();
	}
	
/*====================================================*/

	public static String AddQuerystringParameter(String aURL, String aParameter, String aValue,
						HttpServerUtility aServer) {
		String aNewURL;
		
		aNewURL = RemoveQuerystringParameter(aURL, aParameter);
		
		if (aServer != null)
			aValue = aServer.UrlEncode(aValue);

		if (aNewURL.IndexOf("?") != -1) {
			aNewURL = aNewURL + "&" + aParameter + "=" + aValue.ToString();
		} else {
			aNewURL = aNewURL + "?" + aParameter + "=" + aValue.ToString();
		}
		return aNewURL;
	}

/*-----------------------------------------------------*/

	public static String AddQuerystringParameter(String aURL, String aNameValuePair,
							HttpServerUtility aServer) {
		if(aNameValuePair.IndexOf("=") == -1)
			return aURL;
		String aParameter = aNameValuePair.Substring(0, aNameValuePair.IndexOf("="));
		String aValue = aNameValuePair.Substring(aNameValuePair.IndexOf("=") + 1);
		return AddQuerystringParameter(aURL, aParameter, aValue, aServer);
	}
		
/*-----------------------------------------------------*/

	public static String AddQuerystringParameter(String aURL, String aParameter, String aValue) {
		return AddQuerystringParameter(aURL, aParameter, aValue, null);
	}

/*-----------------------------------------------------*/

	public static String AddQuerystringParameter(String aURL, String aNameValuePair) {
		return AddQuerystringParameter(aURL, aNameValuePair, (HttpServerUtility)null);
	}
		
/*-----------------------------------------------------*/

	public static String RemoveQuerystringParameter(String aURL, String aParameter) {
		String aRootURL;
		String aQURL;
		String aResultURL;
		
		if (aURL.IndexOf("?") != -1) {
			aRootURL = aURL.Substring(0, aURL.IndexOf("?"));
			aQURL = aURL.Substring(aURL.IndexOf("?"), aURL.Length - aURL.IndexOf("?"));
			if (aQURL.IndexOf("?" + aParameter + "=") != -1) {
				// parameter is first.
				for(int i = aQURL.IndexOf("?" + aParameter + "="); i < aQURL.Length; i++) {
					if(aQURL[i].ToString() == "&") {
						aResultURL = aRootURL + "?" + aQURL.Substring(i, aQURL.Length - i);
						return aResultURL;
					}
				}
				// parameter is only one.
				return aRootURL;
			}
			else {
				if (aQURL.IndexOf("&" + aParameter + "=") != -1) {
					// parameter is not first.
					for(int i = aQURL.IndexOf("&" + aParameter + "=") + 1; i < aQURL.Length; i++) {
						if(aQURL[i].ToString() == "&") {
							aResultURL = aRootURL + aQURL.Substring(0, aQURL.IndexOf("&" + aParameter + "=")) + aQURL.Substring(i, aQURL.Length - i);
							return aResultURL;
						}
					}
					aResultURL = aRootURL + aQURL.Substring(0, aQURL.IndexOf("&" + aParameter + "="));
					return aResultURL;
				}
			}
		}
			
		return aURL;
	}
		
/*-----------------------------------------------------*/

	public static String Get_QueryString(HttpRequest aRequest, String aKey, String aDefault) {
		String	aValue;
		
		aValue = aRequest.QueryString[aKey];
		if (aValue == null || aValue == "")
			return aDefault;
			
		return aValue;
	}


	public static String GetFormattedUrl(String aSPUrl)
	{
		aSPUrl = aSPUrl.Replace("\\", "/");
		if (aSPUrl.Length > 0)
		{
			String aSubSPUrl = aSPUrl.Substring(aSPUrl.Length - 1);
			if (aSubSPUrl != "/")
			{
				aSPUrl = aSPUrl + "/";
			}
		}
		return aSPUrl;
	}

	public static String TruncateFolderName(String aUrl)
	{
		int i = 0;
		String aReturnUrl = "";
		if (aUrl != null)
		{
			String[] aSplitVal = aUrl.Split('/');
			for (i = 0; i < aSplitVal.Length; i++)
			{
				String aTruncate = aSplitVal[i];
				if (aSplitVal[i].Length > 128)
				{
					aTruncate = aTruncate.Substring(0, 128);
				}
				if (i == 0)
					aReturnUrl = aTruncate;
				else
					aReturnUrl = aReturnUrl + "/" + aTruncate;
			}
		}
		return aReturnUrl;
		
	}
	
/*====================================================*/
} //class cWebLib


}  //Core.Web
