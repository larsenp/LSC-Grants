using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Text;
using System.IO;
using Core.Web.SvrCtls;
using Core.Web;
using System.Xml;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;
using EasyGrants.Web.User;
using EasyGrants.DataAccess.Report;
using System.Collections;


namespace EasyGrants.Web.SvrCtls {
/*====================================================*/
///<summary>
///displays HTML results from query tool
///</summary>
public class cQueryResultsSvrCtl : cEGSvrCtl, IPostBackEventHandler 
{
/*====================================================*/

	private const String	kEvent_ExportExcel = "ExportExcel";
	
	protected HtmlTable		mTabResults;
    protected string		mHeadBgColor = "#99ccff"; //Color.LightBlue;
    protected string		mRowBgColor = "#ffffff"; //Color.White;
    protected string		mAltRowBgColor = "#cccccc"; //Color.LightGray;
    protected string		mGrpRowBgColor = "#ccccff"; //Color.LightGray;
    protected string		mHeadClass = "";
    protected string		mRowClass = "";
    protected string		mAltRowClass = "";
    protected cEGStaffUser	mUser;
    protected string		mSQLDisplayMode = "Display";//Other values are "Hide" and "HtmlComment"

/*====================================================*/

    public cEGStaffUser User {
		get {
			if (mUser == null) {
				string aUserKey = this.Page.Request.QueryString["UserKey"];
				mUser = (cEGStaffUser)CorePage.WebSession.User(aUserKey);
			}
			
			return mUser;
		}
    }
    
/*--------------------------------------------------------*/

    public cSavedQuery SavedQueryDO {
		get {return User.SavedQueryDO;}
		set {mUser.SavedQueryDO = value;}
    }
    
/*--------------------------------------------------------*/

    public cXMLDoc AdHocQueryDefXMLDoc {
		get {return SavedQueryDO.SavedQueryDefXMLDoc;}
		set {SavedQueryDO.SavedQueryDefXMLDoc = value;}
    }
    																			  
/*--------------------------------------------------------*/

    public string HeadBgColor {
		get {return mHeadBgColor;}
		set {mHeadBgColor = value;}
    }
    																			  
/*--------------------------------------------------------*/

    public string RowBgColor {
		get {return mRowBgColor;}
		set {mRowBgColor = value;}
    }
    																			  
/*--------------------------------------------------------*/

    public string AltRowBgColor {
		get {return mAltRowBgColor;}
		set {mAltRowBgColor = value;}
    }
    																			  
/*--------------------------------------------------------*/

    public string HeadClass {
		get {return mHeadClass;}
		set {mHeadClass = value;}
    }
    																			  
/*--------------------------------------------------------*/

    public string RowClass {
		get {return mRowClass;}
		set {mRowClass = value;}
    }
    																			  
/*--------------------------------------------------------*/

    public string AltRowClass {
		get {return mAltRowClass;}
		set {mAltRowClass = value;}
    }

/*--------------------------------------------------------*/

	public string SQLDisplayMode {
		get {
			XmlNode aSQLDisplayNode = cXMLDoc.FindNodeWithChildNode(((cWebAppl)WebSession.DataObjectFactory.Appl).Get_ApplNode(),
									"QueryParams/QueryParam", "ReleaseBuild", "BuildKey", WebSession.DataObjectFactory.Appl.BuildKey);
			if (aSQLDisplayNode != null)
				return cXMLDoc.AttributeToString(aSQLDisplayNode, "SQLDisplayMode", "Display");
			else
				return mSQLDisplayMode;
				
		}
		set {mSQLDisplayMode = value;}
	}
	    																			  
/*====================================================*/

	public void Render_Controls(HtmlTextWriter aTxtWr) {
	
		aTxtWr.Write("<table border='0' cellspacing='0' cellpadding='0'>\r");
		aTxtWr.Write("<tr class='" + RowClass + "'>\r");
		aTxtWr.Write("<td>\r");
		
		aTxtWr.Write("<a href=\"JavaScript:" +
							Page.GetPostBackEventReference(this, kEvent_ExportExcel) + 
							"\">");
		aTxtWr.Write("Export To Excel");
		aTxtWr.Write("</a>\r");
	
		aTxtWr.Write("</td>\r");
        aTxtWr.Write("</tr>\r");
		aTxtWr.Write("</table>");
	}

/*-----------------------------------------------------*/	

	protected override void Render(HtmlTextWriter aTxtWr) {
	
		Render_Controls(aTxtWr);
		if (cXMLDoc.AttributeToString(AdHocQueryDefXMLDoc.DocElement, "GroupBy", "") == "") {
			RenderOutput(aTxtWr);
		}
		else {
			RenderOutputByGroupField(aTxtWr);
		}
	}

/*====================================================*/

	private void ExportToExcel() {
        String			aURL;
        int				aEntityID;
        cReportOutput	aReportOutput;
        
        aEntityID = User.UserID;
        aReportOutput = SavedQueryDO.Create_ReportOutput(WebSession.DataObjectFactory, aEntityID);
        
        aURL = EGAppl.Build_ReportOutput_ReportOutputID_URL(aReportOutput);

		Page.Response.Redirect(aURL);
	}
	
/*-----------------------------------------------------*/	
/*
	IPostBackEventHandler method to raise postback events
*/
	public void RaisePostBackEvent(String aArg) {
		switch (aArg) {
			case kEvent_ExportExcel :
				ExportToExcel();
				return;
		}
	}
	
/*====================================================*/

	public void WriteDataObjectList(StringBuilder aTable, cDataObjectList aDataObjectList) {
		bool anAltRow = false;
		for(int i=0; i< aDataObjectList.Count; i++) {
				cDataObject aDataObject = aDataObjectList[i];
				if (anAltRow) {
					aTable.Append("<tr bgColor='" + RowBgColor + "' class='" + RowClass + "'>");
					anAltRow = false;
				}
				else {
					aTable.Append("<tr bgColor='" + AltRowBgColor + "' class='" + AltRowClass+ "'>");
					anAltRow = true;
				}
				foreach (XmlNode aDisplayPropertyNode in AdHocQueryDefXMLDoc.DocElement.SelectNodes("DisplayProperties/DisplayProperty")) {
					String	aPropertyKey;
					aPropertyKey = cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey");
					aTable.Append("<td>" + aDataObject.GetAliased_RelatedPropertyDefaultFormattedString(aPropertyKey) + "</td>"); //PL 12/17/03
					aTable.Append("<td width='10'>&nbsp;</td>");
				}   
				aTable.Append("</tr>");
			}
	}
/*====================================================*/

	private void RenderOutput(HtmlTextWriter aTxtWr) {
		XmlNode aSavedQueryDataObjectNode, aDataProviderInfoNode;
        XmlNodeList aDisplayPropertyNodeList;
        string aColHeader, aMsg;
        cDataObjectList aDataObjectList;
        bool anAltRow = false;
        StringBuilder aTable = new StringBuilder();
        
		
		aSavedQueryDataObjectNode = AdHocQueryDefXMLDoc.DocElement;

		//Write column headers
		aDisplayPropertyNodeList = aSavedQueryDataObjectNode.SelectNodes("DisplayProperties/DisplayProperty");       
		aTable.Append("<table border='0' cellspacing='0' cellpadding='0'> " +
						"<tr bgColor='" + HeadBgColor + "' class='" + HeadClass+ "'>");
		
        foreach (XmlNode aDisplayPropertyNode in aDisplayPropertyNodeList) {
            aColHeader = cXMLDoc.AttributeToString(aDisplayPropertyNode, "ColumnHeader");
            if (aColHeader == "")
                aColHeader = cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey");
            
            aTable.Append("<td>" + aColHeader + "</td>");
            aTable.Append("<td width='10'>&nbsp;</td>");
        }


        aTable.Append("</tr>");
        
        //Get data from data object node
        try {
			aDataObjectList = CorePage.WebSession.DataObjectFactory.GetDataObjectList(aSavedQueryDataObjectNode);
        }
        catch (Exception aExc) {
			aMsg = "<br><b>ERROR</b><br><br>" + aExc.Message + "<br><br>";
			aTxtWr.Write(aMsg);
			return;
        }
		int i;
        //Write out data to table
        //foreach (cDataObject aDataObject in aDataObjectList) {
        for(i=0; i< aDataObjectList.Count; i++) {
			cDataObject aDataObject = aDataObjectList[i];
			if (anAltRow) {
				aTable.Append("<tr bgColor='" + RowBgColor + "' class='" + RowClass + "'>");
				anAltRow = false;
			}
			else {
				aTable.Append("<tr bgColor='" + AltRowBgColor + "' class='" + AltRowClass+ "'>");
				anAltRow = true;
			}        
            foreach (XmlNode aDisplayPropertyNode in aDisplayPropertyNodeList) {
				String	aPropertyKey;
				//aPropertyKey = cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey").Replace(".", "_"); //PL 12/17/03
				aPropertyKey = cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey");
				aTable.Append("<td>" + aDataObject.GetAliased_RelatedPropertyDefaultFormattedString(aPropertyKey) + "</td>"); //PL 12/17/03
				aTable.Append("<td width='10'>&nbsp;</td>");
            }   
            aTable.Append("</tr>");
        }
        aTable.Append("</table>");
        
        //aTxtWr.Write(aTable.ToString());
        
        aTable.Append("<table border='0' cellspacing='0' cellpadding='0'> ");
        
        //Write out record count
        aMsg = "<br><br>Row Count: " + aDataObjectList.Count.ToString();
        aTable.Append("<tr><td>" + aMsg + "</td></tr>");
        
        //aTxtWr.Write(aMsg);
        
        
        //Write out SQL if mSQLDisplayMode is not "Hide"
        if (SQLDisplayMode != "Hide") {
			aDataProviderInfoNode = aSavedQueryDataObjectNode.SelectSingleNode("DataProviderInfo");
			aMsg = "<br><br>SQL: " + aDataProviderInfoNode.InnerText;
			if (SQLDisplayMode == "Display")
				aTable.Append("<tr><td>" + aMsg + "</td></tr>");
			else if (SQLDisplayMode == "HtmlComment")
				aTable.Append("<tr><td><!--" + aMsg + "--></td></tr>");
        
        }
		//aTxtWr.Write(aMsg);	
		
		aTable.Append("</table>");
		
		aTxtWr.Write(aTable.ToString());
	}
	
/*====================================================*/
	
	private void RenderOutputByGroupField(HtmlTextWriter aTxtWr) {
		XmlNode aSavedQueryDataObjectNode, aDataProviderInfoNode;
        XmlNodeList aDisplayPropertyNodeList;
        string aColHeader, aMsg, aGroupByField;
        cDataObjectList aDataObjectList, aGrpDOL, aNullGrpDOL;
        StringBuilder aTable = new StringBuilder();
        Hashtable aGrpByHash = new Hashtable();
        int aRowCount;
        
        aNullGrpDOL = null;
		
		aSavedQueryDataObjectNode = AdHocQueryDefXMLDoc.DocElement;
		aGroupByField = cXMLDoc.AttributeToString(aSavedQueryDataObjectNode, "GroupBy");

		//Write column headers
		aDisplayPropertyNodeList = aSavedQueryDataObjectNode.SelectNodes("DisplayProperties/DisplayProperty");
		aTable.Append("<table border='0' cellspacing='0' cellpadding='0'> " +
						"<tr bgColor='" + HeadBgColor + "' class='" + HeadClass+ "'>");
		
        foreach (XmlNode aDisplayPropertyNode in aDisplayPropertyNodeList) {
            aColHeader = cXMLDoc.AttributeToString(aDisplayPropertyNode, "ColumnHeader");
            if (aColHeader == "")
                aColHeader = cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey");
            
            aTable.Append("<td>" + aColHeader + "</td>");
            aTable.Append("<td width='10'>&nbsp;</td>");
        }


        aTable.Append("</tr>");
        
        //Get data from data object node
        try {
			aDataObjectList = CorePage.WebSession.DataObjectFactory.GetDataObjectList(aSavedQueryDataObjectNode);
        }
        catch (Exception aExc) {
			aMsg = "<br><b>ERROR</b><br><br>" + aExc.Message + "<br><br>";
			aTxtWr.Write(aMsg);
			return;
        }
        aRowCount = aDataObjectList.Count;
		int i;
        //Write out data to table
        //foreach (cDataObject aDataObject in aDataObjectList) {
        for(i=0; i< aDataObjectList.Count; i++) {
			cDataObject aDataObject = aDataObjectList[i];
            foreach (XmlNode aDisplayPropertyNode in aDisplayPropertyNodeList) {
				String	aPropertyKey;
				//aPropertyKey = cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey").Replace(".", "_"); //PL 12/17/03
				aPropertyKey = cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey");
				String aPropKeyVal = aDataObject.GetAliased_RelatedPropertyDefaultFormattedString(aPropertyKey);
				if (aGroupByField.Equals(aPropertyKey)) {
					if (aPropKeyVal == "") {
						if (aNullGrpDOL == null)
							aNullGrpDOL = new cDataObjectList(aDataObject.DataObjectFactory);
						aNullGrpDOL.Add(aDataObject);
					}
					else {
						if (aGrpByHash.Contains(aPropKeyVal)) {
							aGrpDOL = (cDataObjectList)aGrpByHash[aPropKeyVal];
							aGrpDOL.Add(aDataObject);
						}
						else {
							aGrpDOL = new cDataObjectList(aDataObject.DataObjectFactory);
							aGrpDOL.Add(aDataObject);
							
							aGrpByHash.Add(aPropKeyVal, aGrpDOL);
						}
					}
				}
            }   

        }
        //when the group by field is not in the selected field list
        if (aDataObjectList.Count > 0 && aGrpByHash.Count < 1 && aNullGrpDOL==null){
			RenderOutput(aTxtWr);
			return;
        }
        
        foreach (DictionaryEntry aEntry in aGrpByHash) {
			//Printing the Group By Field
			aTable.Append("<tr bgColor='" + HeadBgColor + "' class='" + RowClass + "'>");
			aTable.Append("<td colspan='" + (aDisplayPropertyNodeList.Count * 2) + "'>&nbsp;</td>");
			aTable.Append("</tr>");
			aTable.Append("<tr bgColor='" + HeadBgColor + "' class='" + RowClass + "'>");
			aTable.Append("<td colspan='" + (aDisplayPropertyNodeList.Count * 2) + "'><B>" + aEntry.Key + "</B></td>"); //PL 12/17/03
			aTable.Append("</tr>");
			
			aDataObjectList = (cDataObjectList)aEntry.Value;
			WriteDataObjectList(aTable, aDataObjectList);
        }
        
        //Write out the rows that have no values for the Group By field 
        if (aNullGrpDOL != null) {
			aTable.Append("<tr bgColor='" + HeadBgColor + "' class='" + RowClass + "'>");
			aTable.Append("<td colspan='" + (aDisplayPropertyNodeList.Count * 2) + "'>&nbsp;</td>");
			aTable.Append("</tr>");
			WriteDataObjectList(aTable, aNullGrpDOL);
			aTable.Append("</table>");
        }
        
        aTable.Append("<table border='0' cellspacing='0' cellpadding='0'> ");
        
        //Write out record count
        aMsg = "<br><br>Row Count: " + aRowCount;
        aTable.Append("<tr><td>" + aMsg + "</td></tr>");
        
        //Write out SQL
        aDataProviderInfoNode = aSavedQueryDataObjectNode.SelectSingleNode("DataProviderInfo");
        aMsg = "<br><br>SQL: " + aDataProviderInfoNode.InnerText;
        aTable.Append("<tr><td>" + aMsg + "</td></tr>");
		
		aTable.Append("</table>");
		
		aTxtWr.Write(aTable.ToString());
	}
	
/*====================================================*/	
} //class cQueryResultsSvrCtl


} //EasyGrants.Web.SvrCtls

