using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Core.DataAccess.DBAccess {
/*====================================================*/

///<summary>
///Base Database connection object
///</summary>
public class cDBConn  
{
/*====================================================*/

	private	IDbConnection		mDBConnection;
	private	IDbTransaction		mDBTransaction;

/*-----------------------------------------------------*/

	/// <summary>
	/// Connection text
	/// </summary>
	internal IDbConnection DBConnection {
		get {return mDBConnection;}
		set {mDBConnection = value;}
	}
	
/*====================================================*/

	internal IDbTransaction DBTransaction {
		get {return mDBTransaction;}
		set {mDBTransaction = value;}
	}
	
/*====================================================*/

	public cDBConn(String aConnStr) {
	}

/*====================================================*/

	public void BeginTran() 
	{
		if (DBTransaction == null){
			DBTransaction = DBConnection.BeginTransaction();
		}
	}

/*====================================================*/

	public void CommitTran() 
	{
		if (DBTransaction != null){
			DBTransaction.Commit();
			DBTransaction = null;
		}
	}

/*====================================================*/

	public void RollbackTran() 
	{
		if (DBTransaction != null){
			DBTransaction.Rollback();
			DBTransaction = null;
		}
	}

/*====================================================*/

	public void CloseDBConnection() 
	{
		if (DBConnection != null && DBConnection.State != ConnectionState.Closed)
			DBConnection.Close();
	}
	
/*====================================================*/

	//sample - will be overloads, etc.
	public void RemoveRows(DataTable aDT, int aSRowNum, int aFinRowNum) {
		while (aFinRowNum >= aSRowNum) {
			aDT.Rows.Remove(aDT.Rows[aFinRowNum]);
			aFinRowNum--;
		}
	}

/*-----------------------------------------------------*/

	public virtual void FillDataSetTable(DataSet aDS, String aTableName, String aSQLStr) {
	}

/*-----------------------------------------------------*/

	public DataSet FillDataSetTable(String aTableName, String aSQLStr) {
		DataSet		aDS = new DataSet();
		
		FillDataSetTable(aDS, aTableName, aSQLStr);
		return aDS;
	}

/*-----------------------------------------------------*/

	public DataSet FillDataSetTable(String aTableName, String aSQLStr, DataSet aDS) {
		
		FillDataSetTable(aDS, aTableName, aSQLStr);
		return aDS;
	}

/*-----------------------------------------------------*/

	public virtual void FillDataSetTable(DataSet aDS, String aTableName, SqlCommand aCommand) {
	}

/*-----------------------------------------------------*/

	public DataSet FillDataSetTable(String aTableName, SqlCommand aCommand) {
		DataSet		aDS = new DataSet();
		
		FillDataSetTable(aDS, aTableName, aCommand);
		return aDS;
	}

/*-----------------------------------------------------*/

	public DataSet FillDataSetTable(String aTableName, SqlCommand aCommand, DataSet aDS) {
		
		FillDataSetTable(aDS, aTableName, aCommand);
		return aDS;
	}

/*-----------------------------------------------------*/

	public virtual IDataReader FillDataReader(String aSQLStr) {
		return null;
	}
	
/*-----------------------------------------------------*/

	public int ExecuteCommand(String aSQLStr, int aCommandTimeout) {
		IDbCommand	aCmd = DBConnection.CreateCommand();
		int			aRowCount;
		
		aCmd.CommandType = CommandType.Text;
		aCmd.CommandText = aSQLStr;
		aCmd.Transaction = DBTransaction;
		if(aCommandTimeout > 0) {
			aCmd.CommandTimeout = aCommandTimeout;
		}
		aRowCount = aCmd.ExecuteNonQuery();
		aCmd = null;
		
		return aRowCount;
	}

/*-----------------------------------------------------*/

	public int ExecuteCommand(String aSQLStr) {
		return ExecuteCommand(aSQLStr, -1);
	}
/*-----------------------------------------------------*/

	public int ExecuteCommand(IDbCommand aCmd) {
		return ExecuteCommand(aCmd, -1);
	}
/*-----------------------------------------------------*/

	public int ExecuteCommand(IDbCommand aCmd, int aCommandTimeout) {
		
		int aRowCount;
		aCmd.CommandType = CommandType.Text;
		aCmd.Transaction = DBTransaction;
		if(aCommandTimeout > 0) {
			aCmd.CommandTimeout = aCommandTimeout;
		}
		aRowCount = aCmd.ExecuteNonQuery();
		aCmd = null;
		
		return aRowCount;
	}

/*-----------------------------------------------------*/

	public Object ExecuteProcedure (String aSQLStr) {
		Object returnValue;
		IDbCommand	aCmd = DBConnection.CreateCommand();
		aCmd.CommandType = CommandType.StoredProcedure;
		aCmd.CommandText = aSQLStr;
		aCmd.Transaction = DBTransaction;
		
		SqlParameter objParam;
		SqlParameterCollection parmCol = (SqlParameterCollection)aCmd.Parameters;
		objParam = parmCol.Add("RETURN_VALUE", SqlDbType.Variant);
		objParam.Direction = ParameterDirection.ReturnValue;
		aCmd.ExecuteNonQuery();
		returnValue = objParam.Value;
		aCmd = null;
		return returnValue;				
	}

/*-----------------------------------------------------*/

    // This function will replace two single quotes with one single quote 
    // It is intended for use with SqlParameter object
	public static String FixTwoQuotes(String aTarget) 
	{
		String aStr = "";
		aStr = aTarget.Trim().Replace("''", "'");
	    return aStr.Trim();
	}

/*-----------------------------------------------------*/

	public static String FixQuote(String aTarget, bool aEncloseFlag) {
		String aStr = "";
		int aInt;
		
	    // This function will fix a string containing a single quote 
	    // character so that it can be inserted (or searched)
		aTarget = aTarget.Trim();
	    for(aInt = 0; aInt < aTarget.Trim().Length; aInt++) {
	        if(aTarget[aInt] == (char)39 || aTarget[aInt] == (char)146 || aTarget[aInt] == (char)145)
	            aStr = aStr + (char)39 + (char)39;
	        else
	            aStr = aStr + aTarget[aInt];
	    }
	    if (aEncloseFlag) aStr = "'" + aStr + "'";
	    return aStr.Trim();
	}

/*-----------------------------------------------------*/

	public static String FixQuote(String aTarget) {
		return FixQuote(aTarget, true);
	}

/*-----------------------------------------------------*/

	public static String FixQuoteWithNulls(String aTarget) {
		String aStr = "";
		int aInt;
		
	    // This function will fix a string containing a single quote 
	    // character so that it can be inserted (or searched)
		aTarget = aTarget.Trim();
	    for(aInt = 0; aInt < aTarget.Trim().Length; aInt++) {
	        if(aTarget[aInt] == (char)39 || aTarget[aInt] == (char)146 || aTarget[aInt] == (char)145)
	            aStr = aStr + (char)39 + (char)39;
	        else
	            aStr = aStr + aTarget[aInt];
	    }
	    
	    if (aStr.Length == 0) aStr = "NULL";
	    else {
			aStr = "'" + aStr + "'";
			}
	   
	    return aStr.Trim();
	}

/*-----------------------------------------------------*/

	public static String FixNulls(String aTarget) {
		    
	    if (aTarget.Length == 0) aTarget = "NULL";
	    else {
			aTarget = aTarget;
			}
	   
	    return aTarget.Trim();
	}

/*-----------------------------------------------------*/

	public static String BuildParam(ref String aSqlString, String aParamName, String aParamValue, 
								bool aIsText, bool aIsExecSql) {

		
		if (aParamValue.Length == 0) aParamValue = "NULL";
		else {
			if (aIsText) {
				aParamValue = FixQuote(aParamValue);
				/*
				//Replace all left and right curly single quotes with straight single quotes
				aParamValue = aParamValue.Replace((char)145, (char)39);
				aParamValue = aParamValue.Replace((char)146, (char)39);
				
				//Replace all single quotes with double quotes (SQL handled by provider) or quadruple quotes (SQL pre-processed using a Parameter object)
				if (aIsExecSql) aParamValue = aParamValue.Replace("'","''''");
				else aParamValue = aParamValue.Replace("'","''");

				//Add surrounding single quotes
				aParamValue = "'" + aParamValue + "'";
				*/
			}
		}
		
		if (aSqlString.Length != 0)
			aSqlString += ", ";
		
		aSqlString += aParamName + "=" + aParamValue;
 		return aSqlString;
	}

//-----------------------------------------------------

	public static string DB_ValueToString(DBNull aVal) {
		return "";
	}
	
	public static String DB_ValueToString(String aStr) {
		return aStr;
	}

	public static String DB_ValueToString(int aInt) {
		return aInt.ToString();
	}

	public static String DB_ValueToString(System.DateTime aDate) {
		return aDate.ToString();
	}

//-----------------------------------------------------

	public static String DB_ReplaceWhenNull(DBNull aVal, String aReplace) {
		return aReplace;
	}
	
	public static String DB_ReplaceWhenNull(String aVal, String aReplace) {
		return aVal;
	}
	
	public static int DB_ReplaceWhenNull(DBNull aVal, int aReplace) {
		return aReplace;
	}
	
	public static int DB_ReplaceWhenNull(int aVal, int aReplace) {
		return aVal;
	}
	
	public static bool DB_ReplaceWhenNull(DBNull aVal) {
		return false;
	}
	
	public static bool DB_ReplaceWhenNull(bool aVal) {
		return aVal;
	}
	
//-----------------------------------------------------	
	
	public void WriteBLOBToDB(String aFilePath, String aParamName, String aSQL) {
		FileStream aFSO;
				
		aFSO = new FileStream(aFilePath, FileMode.Open, FileAccess.Read);
		
		BinaryReader aBR = new BinaryReader(aFSO);

		aBR.BaseStream.Position = 0;

		SqlCommand aDBCmd = new SqlCommand();

		aDBCmd.Connection = (SqlConnection)mDBConnection;
		aDBCmd.Transaction = (SqlTransaction)mDBTransaction;

		aDBCmd.CommandType = CommandType.Text;
		aDBCmd.CommandText = aSQL;
		aDBCmd.Parameters.Clear();
		aDBCmd.Parameters.Add(aParamName, SqlDbType.Image);

		aDBCmd.Parameters[aParamName].Value = aBR.ReadBytes((int)aBR.BaseStream.Length);

		aDBCmd.ExecuteNonQuery();
		aDBCmd.Connection.Close();
	}
	
//-----------------------------------------------------	
	
	public int DB_GetID(String aTableName) {
		String		aSQL;
		IDataReader	aDR;
		int			aID = 0;

		aSQL = "exec getid_sel @table='" + aTableName + "', @mode=1";
		aDR = FillDataReader(aSQL);
		
		if (aDR.Read())
			aID = Convert.ToInt32(aDR["NEW_ID"]);
		
		aDR.Close();
		
		return aID;
	}
	
//-----------------------------------------------------	

	public String DB_GetString(String aSQL) {
	//Executes a SQL string and returns the first field of the first row 
	//of the resulting recordset as a string
	
		IDataReader	aDR;
		String		aResult = "";

		aDR = FillDataReader(aSQL);
		if (aDR.Read())
			aResult = (aDR[0]).ToString();
		aDR.Close();
		return aResult;
	}	
/*====================================================*/
} //public class cDBConn


/*====================================================*/
}  //namespace Core.DataAccess.DBAccess
