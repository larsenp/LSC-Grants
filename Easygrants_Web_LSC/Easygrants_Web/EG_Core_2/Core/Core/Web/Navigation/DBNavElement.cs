using System;
using System.Data;
using System.Collections;
using Core.DataAccess.DBAccess;

namespace Core.Web.Navigation {
/*====================================================*/

///<summary>
///supports navigation output functionality
///</summary>
public class cDBNavElement : cNavElement 
{
/*====================================================*/

	public cDBNavElement(String aPageTitle) : base(aPageTitle) {
	}
	
/*-----------------------------------------------------*/

	public cDBNavElement(bool aExpanded) : base(aExpanded) {
	}
	
/*-----------------------------------------------------*/

	public cDBNavElement(String aKey, String aPageTitle) : base(aKey, aPageTitle) {
	}

/*====================================================*/

	public void DBNavElement_Load(cSQLDBConn aDBConn, String aTableName, String aParentKey,
					int aModuleID, int aCompetitionID) {
		DataSet		aDS = aDBConn.FillDataSetTable("Table1",
							"select * from " + aTableName + " where parent_key = '" + aParentKey + "'" + 
							" and module_id = " + aModuleID +
							" and competition_report_id = " + aCompetitionID +
							" order by sort_order");
		
		foreach (DataRow aRow in aDS.Tables["Table1"].Rows) {
			cDBNavElement	aNavElement = new cDBNavElement(aRow["page_key"].ToString(), aRow["page_title"].ToString());
			
			if(aRow["nav_title"].ToString() == "(") //Separator
				aNavElement.NavTitle = "&nbsp;";
			else
				aNavElement.NavTitle =  aRow["nav_title"].ToString();
			
			aNavElement.EnabledAfterSubmit = Convert.ToBoolean(aRow["available_after_submit"]);
			aNavElement.SourceFile =  aRow["source_file"].ToString();
			aNavElement.HelpFile =  aRow["help_file"].ToString();
			
			if(aRow["Target"].ToString() != "")
				aNavElement.Target = aRow["target"].ToString();
			
			Add_NavElement(aNavElement);
			aNavElement.DBNavElement_Load(aDBConn, aTableName, aRow["page_key"].ToString(), aModuleID, aCompetitionID);
		}
	}
	
/*-----------------------------------------------------*/

	public void DBNavElement_Load(String aConnStr, String aTableName,
			int aModuleID, int aCompetitionID) {
		cSQLDBConn	aDBConn = new cSQLDBConn(aConnStr);
		DBNavElement_Load(aDBConn, aTableName, "", aModuleID, aCompetitionID);
		aDBConn.CloseDBConnection();
	}
	
/*-----------------------------------------------------*/

	public void DBNavElement_Load(String aConnStr, String aTableName,
				int aModuleID) {
		DBNavElement_Load(aConnStr, aTableName, aModuleID, 0);
	}
	
/*====================================================*/
} //class cDBNavElement


/*====================================================*/
}  //namespace Core.Web.Navigation
