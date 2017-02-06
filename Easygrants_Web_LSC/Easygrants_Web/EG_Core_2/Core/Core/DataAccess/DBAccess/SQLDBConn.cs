using System;
using System.Data;
using System.Data.SqlClient;

namespace Core.DataAccess.DBAccess {
/*====================================================*/

///<summary>
///SQLDB connection object
///</summary>
public class cSQLDBConn : cDBConn 
{
/*====================================================*/

	public cSQLDBConn(String aConnStr) : base(aConnStr) {
		DBConnection = new SqlConnection(aConnStr);
		DBConnection.Open();
		
	}

/*====================================================*/

	public override void FillDataSetTable(DataSet aDS, String aTableName, String aSQLStr) {
		//SqlDataAdapter	aDA = new SqlDataAdapter(aSQLStr, (SqlConnection)DBConnection);
		SqlCommand aCommand = new SqlCommand(aSQLStr, (SqlConnection)DBConnection, (SqlTransaction)DBTransaction);
		if (DBConnection.ConnectionTimeout > aCommand.CommandTimeout)
			aCommand.CommandTimeout = DBConnection.ConnectionTimeout;
		SqlDataAdapter aDA = new SqlDataAdapter(aCommand);
		
		aDA.Fill(aDS, aTableName);
		aDA = null;
	}

/*-----------------------------------------------------*/

	public override void FillDataSetTable(DataSet aDS, String aTableName, SqlCommand aCommand) {
		//SqlDataAdapter	aDA = new SqlDataAdapter(aSQLStr, (SqlConnection)DBConnection);
		aCommand.Connection = (SqlConnection)DBConnection;
		aCommand.Transaction = (SqlTransaction)DBTransaction;
		
		if (DBConnection.ConnectionTimeout > aCommand.CommandTimeout)
			aCommand.CommandTimeout = DBConnection.ConnectionTimeout;
		SqlDataAdapter aDA = new SqlDataAdapter(aCommand);
		
		aDA.Fill(aDS, aTableName);
		aDA = null;
	}

/*-----------------------------------------------------*/

	public override IDataReader FillDataReader(String aSQLStr) {
		//SqlCommand	aCmd = new SqlCommand(aSQLStr,(SqlConnection)DBConnection);
		SqlCommand	aCmd = new SqlCommand(aSQLStr,(SqlConnection)DBConnection, (SqlTransaction)DBTransaction);
		
		return aCmd.ExecuteReader();
	}
	
/*====================================================*/
} //class cSQLDBConn


/*====================================================*/
}  //namespace Core.DataAccess.DBAccess
