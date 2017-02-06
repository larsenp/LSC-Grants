using System;
using System.Data;
using System.Data.OleDb;

namespace Core.DataAccess.DBAccess {
/*====================================================*/

///<summary>
///OLEDB connection object
///</summary>
public class cOLEDBConn : cDBConn 
{
/*====================================================*/

	public cOLEDBConn(String aConnStr) : base(aConnStr) {
		DBConnection = new OleDbConnection(aConnStr);
		DBConnection.Open();
	}

/*====================================================*/

	public override void FillDataSetTable(DataSet aDS, String aTableName, String aSQLStr) {
		OleDbDataAdapter	aDA = new OleDbDataAdapter(aSQLStr, (OleDbConnection)DBConnection);
		
		aDA.Fill(aDS, aTableName);
		aDA = null;
	}
	
/*-----------------------------------------------------*/

	public override IDataReader FillDataReader(String aSQLStr) {
		OleDbCommand	aCmd = new OleDbCommand(aSQLStr,(OleDbConnection)DBConnection);
		
		return aCmd.ExecuteReader();
	}
	
/*====================================================*/
} //class cOLEDBConn


/*====================================================*/
}  //namespace Core.DataAccess.DBAccess
