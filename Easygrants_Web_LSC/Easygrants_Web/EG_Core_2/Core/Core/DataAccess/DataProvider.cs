using System;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using Core.DataAccess.XMLAccess;

namespace Core.DataAccess {
/*====================================================*/

///<summary>
///references data definition document
///</summary>
public class cDataProvider 
{
/*====================================================*/

	public const String		kSortDir_Ascending = "Ascending";
	public const String		kSortDir_Descending = "Descending";
	
	protected cAppl		mAppl;
	private cXMLDoc		mDataDefinitionDoc;
	private	int			mCommandTimeout;

/*-----------------------------------------------------*/
	
	public cAppl Appl {
		get {return mAppl;}
	}
	
/*-----------------------------------------------------*/

	public cDataProvider(cAppl aAppl) {
		mAppl = aAppl;
	}
	
/*-----------------------------------------------------*/

	public cXMLDoc DataDefinitionDoc {
		get {return mDataDefinitionDoc;}
		set {mDataDefinitionDoc = value;}
	}

/*-----------------------------------------------------*/

	public int CommandTimeout {
		get {return mCommandTimeout;}
		set {mCommandTimeout = value;}
	}

/*====================================================*/

	public virtual void DataSource_Close(){
		
	}

/*-----------------------------------------------------*/

	public virtual void SaveData(cDataObject aDataObject) {
		
	}

/*-----------------------------------------------------*/

	public virtual void DeleteData(XmlNode aObjDefNode, XmlNode aDataObjectNode) {
		
	}

/*-----------------------------------------------------*/

	public virtual void DeleteData(XmlNode aObjDefNode, String aPrimaryKeyValue) {
	
	}

/*-----------------------------------------------------*/

	public virtual void DeleteData(cDataObject aDataObject) {

	}

/*-----------------------------------------------------*/

	public virtual void PopulateDataSet(cDataObjectList aObjList) {
		
	}

/*-----------------------------------------------------*/

	public static String FlatDataObjectPropertyKey(String aPropertyKey) {
	/*this method takes a dot-delimited property key name and returns
	a property key name properly formatted for use in a flat data set*/
	
		return aPropertyKey.Replace(".", "_");
	}

/*-----------------------------------------------------*/

	public virtual void ExecuteCommand(XmlNode aDataCommandNode) {
	
	}
	
/*-----------------------------------------------------*/

	public virtual void ExecuteCommand(XmlNode aDataCommandNode, XmlNode aCmdDefNode) {
	
	}
	
/*====================================================*/
} //class cDataProvider


/*====================================================*/
}  //namespace Core.DataAccess
