using System;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Xml;
using System.IO;
using Core.DataAccess.XMLAccess;
using Core.Event;
using System.Security.Cryptography;
using System.Text;

namespace Core.DataAccess {
/*====================================================*/

///<summary>
///Base Data Object -provides attribute access objects
///</summary>
public class cDataObject : IComparable
{
/*====================================================*/

	private DataRow	mDataObjectRow;
	private cDataObjectList mDataObjectList;
	private bool  mIsNewDataObject = false;
	private bool mModified = false;
	private bool mChecked = false;
	private bool mHasEncryptedProps = false;

/*-----------------------------------------------------*/
	
	public DataRow DataObjectRow {
		get {return mDataObjectRow;}
	}

/*-----------------------------------------------------*/
	
	public XmlNode ObjDefNode {
		get {return DataObjectList.ObjDefNode;}
	}
	
/*-----------------------------------------------------*/
	///<summary>
	///if true, object has not been saved, object may or may not contain data
	///</summary>
	public bool IsNewDataObject 
	{
		get {return mIsNewDataObject;}
		set {mIsNewDataObject = value;}
	}
/*-----------------------------------------------------*/

	public String PrimaryKey {
		get {
			return DataObjectList.PrimaryKey;
		}
	}
/*-----------------------------------------------------*/

	public string	DefinitionKey {
			get {return DataObjectList.DefinitionKey;}
	}

/*-----------------------------------------------------*/

	public bool HasEncryptedProps {
		get {return mHasEncryptedProps;}
		set {mHasEncryptedProps = value;}
	}

/*-----------------------------------------------------*/

	public bool Modified {
		get {return mModified;}
		set {mModified = value;}
	}

/*-----------------------------------------------------*/

	public bool Checked 
	{
		get {return mChecked;}
		set {mChecked = value;}
	}

/*-----------------------------------------------------*/

	public cDataObjectList DataObjectList 
	{
		get {return mDataObjectList;}
		set {mDataObjectList = value;}
	}
	

/*-----------------------------------------------------*/

	public cDataObjectFactory DataObjectFactory {
		get {return DataObjectList.DataObjectFactory;}
	}	

/*-----------------------------------------------------*/

	public DataColumnCollection Properties {
		get {return DataObjectList.Properties;}
	}

/*====================================================*/
	///<summary>
	///corresponds to a data row
	///</summary>
	public cDataObject(DataRow aDataObjectRow, cDataObjectList aDataObjectList)
	{
		mDataObjectRow = aDataObjectRow;
		mDataObjectList = aDataObjectList;
		if (this.ObjDefNode !=null) //condition added for ad-hoc query functionality
			UpdateCalculatedValues();
		mHasEncryptedProps = cXMLDoc.AttributeToBool(ObjDefNode, "HasEncryptedProps", false);
	}

/*-----------------------------------------------------*/

	public cDataObject(DataRow aDataObjectRow, cDataObjectList aDataObjectList, bool aIsNew){
		mDataObjectRow = aDataObjectRow;
		mDataObjectList = aDataObjectList;
		UpdateCalculatedValues();
		mIsNewDataObject = aIsNew;
		mHasEncryptedProps = cXMLDoc.AttributeToBool(ObjDefNode, "HasEncryptedProps", false);
	}
	
/*-----------------------------------------------------*/

	public cDataObject(){
		
	}

/*-----------------------------------------------------*/
/*indexer for cDataObject*/

	public Object this[string aColumnName] {
		get {return GetPropertyValue(aColumnName);}
			
		set {
			switch (DataObjectRow.Table.Columns[aColumnName].DataType.ToString()) {
				case "System.Byte[]" :
					this.DataObjectRow[aColumnName] = value;
					mModified = true;
					break;
				default :
					if(this.DataObjectRow[aColumnName].ToString() != value.ToString()) {
						if (mHasEncryptedProps) {
							EncryptPropertyValue(aColumnName, value);
						}
						else
							this.DataObjectRow[aColumnName] = value;
						mModified = true;
					}
					break;
			}
		}
	}
	
	/*-----------------------------------------------------*/

	public bool HasProperty(string aColumnName) 
	{
		return DataObjectRow.Table.Columns.Contains(aColumnName);
	}

	/*-----------------------------------------------------*/

	public virtual Object GetPropertyValue(string aColumnName) 
	{
		if (mHasEncryptedProps)
			return GetDecryptedPropertyValue(aColumnName);
		else
			return this.DataObjectRow[aColumnName];
	}
	
	/*-----------------------------------------------------*/

	public void EncryptPropertyValue(string aColumnName, Object aValue)
	{
		/* HashFromPropertyKey is a newely added attribute to create a MD5 Password for the the Property Key mentioned to this attribute value. */
		XmlNode aColNode = cXMLDoc.FindNode(ObjDefNode, "Properties/Property", "Key", aColumnName);
		if (aColNode != null && cXMLDoc.AttributeToBool(aColNode, "Encrypt", false) && cXMLDoc.AttributeToString(aColNode, "EncryptProperty", "") != "")
		{
			string aEncryptKeyColName = cXMLDoc.AttributeToString(aColNode, "EncryptProperty", "");
			this.DataObjectRow[aEncryptKeyColName] = DataObjectFactory.Appl.SecretKey();
			this.DataObjectRow[aColumnName] = Encrypt(aValue.ToString());
		}
		else if (aColNode != null && cXMLDoc.AttributeToBool(aColNode, "Encrypt", false) && cXMLDoc.AttributeToString(aColNode, "EncryptProperty", "") == "" && cXMLDoc.AttributeToString(aColNode, "HashFromPropertyKey", "") != "")
		{
			this.DataObjectRow[aColumnName] = MD5Encrypt(aValue.ToString());
		}
		else if(aValue.ToString() != "")
			this.DataObjectRow[aColumnName] = aValue;
		else
			this.DataObjectRow[aColumnName] =null;	
		
	}
	
	/*-----------------------------------------------------*/

	public virtual Object GetDecryptedPropertyValue(string aColumnName) 
	{
		XmlNode aColNode = cXMLDoc.FindNode(ObjDefNode, "Properties/Property", "Key", aColumnName);
		if (aColNode != null) {
			if (cXMLDoc.AttributeToBool(aColNode, "Encrypt", false)) {
				string aEncryptKeyColName = cXMLDoc.AttributeToString(aColNode, "EncryptProperty", "");
				if (Properties.Contains(aEncryptKeyColName) && this.GetPropertyString(aEncryptKeyColName, "")!= "") {
					return Decrypt(this.DataObjectRow[aColumnName].ToString(), this.GetPropertyString(aEncryptKeyColName));
				}
			}
		}
		return this.DataObjectRow[aColumnName];
	}

/*-----------------------------------------------------*/

	public string GetPropertyString(string aColumnName) {
		return GetPropertyValue(aColumnName).ToString();
	}

/*-----------------------------------------------------*/

	public string GetPropertyString(string aColumnName, string aDefault) {
		Object	aValue;
		
		if ((aValue = GetPropertyValue(aColumnName)) == System.DBNull.Value)
			return aDefault;
		
		return aValue.ToString();
	}

/*-----------------------------------------------------*/

	public int GetPropertyInt(string aColumnName) {
		return Convert.ToInt32(GetPropertyValue(aColumnName));
	}

/*-----------------------------------------------------*/

	public int GetPropertyInt(string aColumnName, int aDefault) {
		if (GetPropertyValue(aColumnName) == System.DBNull.Value)
			return aDefault;
		else
			return Convert.ToInt32(GetPropertyValue(aColumnName));
	}
	
/*-----------------------------------------------------*/

	public Double GetPropertyDouble(string aColumnName) {
		if (GetPropertyValue(aColumnName) == System.DBNull.Value)
			return 0.0;
		return Convert.ToDouble(GetPropertyValue(aColumnName));
	}
/*-----------------------------------------------------*/

	public Double GetPropertyDouble(string aColumnName, double aDefault) 
	{
		if (GetPropertyValue(aColumnName) == System.DBNull.Value)
			return aDefault;
		else
			return Convert.ToDouble(GetPropertyValue(aColumnName));
	}	
/*-----------------------------------------------------*/

	public Decimal GetPropertyDecimal(string aColumnName) {
		if (GetPropertyValue(aColumnName) == System.DBNull.Value)
			return 0.0M;
		return Convert.ToDecimal(GetPropertyValue(aColumnName));
	}
	
/*-----------------------------------------------------*/

	public Decimal GetPropertyDecimal(string aColumnName, Decimal aDefault) 
	{
		if (GetPropertyValue(aColumnName) == System.DBNull.Value)
			return aDefault;
		else
			return Convert.ToDecimal(GetPropertyValue(aColumnName));
	}	

/*-----------------------------------------------------*/

	public bool GetPropertyBool(string aColumnName) {
		return Convert.ToBoolean(GetPropertyValue(aColumnName));
	}

/*-----------------------------------------------------*/

	public bool GetPropertyBool(string aColumnName, bool aDefault) {
		if (GetPropertyValue(aColumnName) == System.DBNull.Value)
			return aDefault;
		else
			return Convert.ToBoolean(GetPropertyValue(aColumnName));
	}

/*-----------------------------------------------------*/

	public DateTime GetPropertyDateTime(string aColumnName) {
		return Convert.ToDateTime(GetPropertyValue(aColumnName));
	}

/*-----------------------------------------------------*/

	public DateTime GetPropertyDateTime(string aColumnName, DateTime aDefault) {
		if (GetPropertyValue(aColumnName) == System.DBNull.Value)
			return aDefault;
		else
			return GetPropertyDateTime(aColumnName);
	}

/*====================================================*/

	public void SetPropertyValue(string aColumnName, string aValue){
		this.DataObjectRow[aColumnName]=aValue;
	}
	
/*-----------------------------------------------------*/

	public bool Value_EmptyDataObj(string aColumnName){
		return (string)DataObjectRow[aColumnName] == "NULL";
	}

/*====================================================*/
/* return a list of objects related to the current data object*/

	public Object GetRelatedPropertyValue(string aPropertyKey, XmlNode aFiltersNode) {
		return GetRelatedPropertyValue(aPropertyKey, aFiltersNode, null);
	}

/*-----------------------------------------------------*/

	public Object GetRelatedPropertyValue(string aPropertyKey, XmlNode aFiltersNode, XmlNode aSortNode) {
		cDataObjectList aDataObjList = new cDataObjectList(DataObjectFactory);
		
		Object aObj = GetRelatedPropertyValue(aPropertyKey, aFiltersNode, aSortNode, ref aDataObjList);
		
		if (aDataObjList.Count > 0)
			return aDataObjList;
		else
			return aObj;
	}
	
/*-----------------------------------------------------*/
	public Object GetRelatedPropertyValue(string aPropertyKey, XmlNode aFiltersNode, XmlNode aSortNode, ref cDataObjectList aDataObjList) {
	//public Object GetRelatedPropertyValue(string aPropertyKey, XmlNode aFiltersNode, XmlNode aSortNode) {
		XmlNode		aRelatedDataObjNode;
		XmlNode		aRelatedSortNode;
		int			aIndex;
		String		aRelationshipType;
		String aStr = aPropertyKey;
		aIndex = aPropertyKey.IndexOf('.');
		
		if (aIndex == -1) {
			//how will we check for value not yet loaded?
			if (this[aPropertyKey] != System.DBNull.Value)
				return this[aPropertyKey];

			aRelatedDataObjNode = GenerateRelatedDataObjectNode(aPropertyKey, DataObjectFactory, out aRelationshipType);
			//if (aRelatedDataObjNode == null) return this[aPropertyKey];
			if (aFiltersNode != null) {
				XmlNode		aRelatedFiltersNode = aRelatedDataObjNode.SelectSingleNode("Filters");
				if (aRelatedFiltersNode == null) {
					//add a filters node
				}
				
				aRelatedFiltersNode.InnerXml += aFiltersNode.InnerXml;
			}
			
			if (aSortNode != null) {
				aRelatedSortNode = aRelatedDataObjNode.OwnerDocument.CreateNode(XmlNodeType.Element, "Sort", "");
				aRelatedDataObjNode.AppendChild(aRelatedSortNode);
				aRelatedSortNode.InnerXml+= aSortNode.InnerXml;	
			}
			
			if (aRelatedDataObjNode != null) {
				cDataObjectList aDataObjectList = DataObjectFactory.GetDataObjectList(aRelatedDataObjNode);
				if(aDataObjectList == null) 
					this[aPropertyKey] = System.DBNull.Value;
				else
					this[aPropertyKey] = aDataObjectList;
			}
			
			return this[aPropertyKey] == System.DBNull.Value ? null : this[aPropertyKey]; //returns value to the original caller (i.e., presentation layer control)
		}
		else {
			String			aCurPropKey = aPropertyKey.Substring(0, aIndex);
			cDataObject		aDataObject = null;
			cDataObjectList aDataObjectList, aObjList = null;

			//aPropertyKey = aPropertyKey.Replace(aPropertyKey.Substring(0,aIndex+1), "");
			aPropertyKey = aPropertyKey.Substring(aIndex+1);

			if (this[aCurPropKey] == System.DBNull.Value) {
				aRelatedDataObjNode = GenerateRelatedDataObjectNode(aCurPropKey, DataObjectFactory, out aRelationshipType);
				//this[aCurPropKey] = DataObjectFactory.GetDataObject(aRelatedDataObjNode);
				
				aDataObjectList = DataObjectFactory.GetDataObjectList(aRelatedDataObjNode);
			}
			else
				aDataObjectList = (cDataObjectList)this[aCurPropKey];

			//get the first dataobject, which will be used below
			aDataObject = aDataObjectList == null ? null : aDataObjectList[0];
			if(aDataObject == null ) 
				this[aCurPropKey] = System.DBNull.Value;
			else
				this[aCurPropKey] = aDataObjectList;
			
			
			//keep getting related objects as long "." is in a aPropertyKey
			if(this[aCurPropKey] == System.DBNull.Value)
				return null;
			else {
				//return aDataObject.GetRelatedPropertyValue(aPropertyKey, aFiltersNode, aSortNode);
				foreach (cDataObject aDataObj in aDataObjectList) {
					try 
					{
						aObjList = (cDataObjectList)aDataObj.GetRelatedPropertyValue(aPropertyKey, aFiltersNode, aSortNode, ref aDataObjList);
					}
					catch 
					{
						return aDataObj.GetRelatedPropertyValue(aPropertyKey, aFiltersNode, aSortNode, ref aDataObjList);
					}
					if (aObjList != null && aObjList.Count != 0){
						aDataObjList.AddList(aObjList);
						aObjList = null;
					}
				}
				return aObjList;
			}
		}
	}


/*-----------------------------------------------------*/

	public Object GetRelatedPropertyValue(string aPropertyKey) {
		return GetRelatedPropertyValue(aPropertyKey, null);
	}
	
/*-----------------------------------------------------*/

	public cDataObject GetRelatedPropertyDataObject(string aPropertyKey) {
		//return (cDataObject)GetRelatedPropertyValue(aPropertyKey, aDataObjFactory);
		cDataObjectList aDataObjectList = (cDataObjectList)GetRelatedPropertyValue(aPropertyKey);
		return (aDataObjectList == null || aDataObjectList.Count == 0) ? null : aDataObjectList[0];
	}

/*-----------------------------------------------------*/

	public cDataObjectList GetRelatedPropertyDataObjectList(string aPropertyKey, XmlNode aFiltersNode) {
		cDataObjectList aDataObjectList = (cDataObjectList)GetRelatedPropertyValue(aPropertyKey, aFiltersNode);
		if(aDataObjectList == null)
			aDataObjectList = new cDataObjectList(DataObjectFactory);
		return aDataObjectList;
	}

/*-----------------------------------------------------*/

	public cDataObjectList GetRelatedPropertyDataObjectList(string aPropertyKey, XmlNode aFiltersNode, XmlNode aSortNode) {
		cDataObjectList aDataObjectList = (cDataObjectList)GetRelatedPropertyValue(aPropertyKey, aFiltersNode, aSortNode);
		if(aDataObjectList == null)
			aDataObjectList = new cDataObjectList(DataObjectFactory);
		return aDataObjectList;
	}
	
/*-----------------------------------------------------*/

	public cDataObjectList GetRelatedPropertyDataObjectList(string aPropertyKey) {
		cDataObjectList aDataObjectList = (cDataObjectList)GetRelatedPropertyValue(aPropertyKey);
		if(aDataObjectList == null)
			aDataObjectList = new cDataObjectList(DataObjectFactory);
		return aDataObjectList;
	}

/*-----------------------------------------------------*/

	public string GetRelatedPropertyString(string aPropertyKey) {

		return GetRelatedPropertyString(aPropertyKey, null) ;
	}

/*-----------------------------------------------------*/

	public string GetRelatedPropertyString(string aPropertyKey, XmlNode aFiltersNode) {

		Object aObject = GetRelatedPropertyValue(aPropertyKey, aFiltersNode);
		if (aObject == null)
			return "";
		else
			return aObject.ToString();
	}

/*-----------------------------------------------------*/

	public int GetRelatedPropertyInt(string aPropertyKey) {
		Object aObject = GetRelatedPropertyValue(aPropertyKey);
		
		return Convert.ToInt32(aObject);
	}

/*-----------------------------------------------------*/

	public int GetRelatedPropertyInt(string aPropertyKey, int aDefault) {
		if (GetRelatedPropertyValue(aPropertyKey) == System.DBNull.Value)
			return aDefault;
		else
			return Convert.ToInt32(GetRelatedPropertyValue(aPropertyKey));
	}

/*-----------------------------------------------------*/

	public Double GetRelatedPropertyDouble(string aPropertyKey) {
		Object aObject = GetRelatedPropertyValue(aPropertyKey);
		
		return Convert.ToDouble(aObject);
	}

/*-----------------------------------------------------*/

	public Double GetRelatedPropertyDouble(string aPropertyKey, Double aDefault) {
		if (GetRelatedPropertyValue(aPropertyKey) == System.DBNull.Value)
			return aDefault;
		else
			return Convert.ToDouble(GetRelatedPropertyValue(aPropertyKey));
	}

/*-----------------------------------------------------*/

	public Decimal GetRelatedPropertyDecimal(string aPropertyKey) {
		return Convert.ToDecimal(GetRelatedPropertyValue(aPropertyKey));
	}

/*-----------------------------------------------------*/

	public Decimal GetRelatedPropertyDecimal(string aPropertyKey, Decimal aDefault) {
		if (GetRelatedPropertyValue(aPropertyKey) == System.DBNull.Value)
			return aDefault;
		else
			return Convert.ToDecimal(GetRelatedPropertyValue(aPropertyKey));
	}

/*-----------------------------------------------------*/

	public bool GetRelatedPropertyBool(string aPropertyKey) {
		Object aObject = GetRelatedPropertyValue(aPropertyKey);
		
		return Convert.ToBoolean(aObject);
	}

/*-----------------------------------------------------*/

	public bool GetRelatedPropertyBool(string aPropertyKey, bool aDefault) {
		if (GetRelatedPropertyValue(aPropertyKey) == System.DBNull.Value)
			return aDefault;
		else
			return Convert.ToBoolean(GetRelatedPropertyValue(aPropertyKey));
	}

/*-----------------------------------------------------*/

	public string GetRelatedPropertyData(string aPropertyKey, out XmlNode aObjDefNode, out XmlNode aPropertyNode){
		String	aRelatedPropertyObjectName;
		String	aRelatedPropertyKey;		
		int		aIndexOf;
		
		aObjDefNode = null;
		aPropertyNode = null;						
		
		aIndexOf = aPropertyKey.LastIndexOf(".");
		if (aIndexOf != -1 ){
			cDataObject	aRelatedDataObject;
			
			aRelatedPropertyObjectName = aPropertyKey.Substring(0,aIndexOf);
			aRelatedPropertyKey = aPropertyKey.Substring(aIndexOf+1);
			
			aRelatedDataObject = this.GetRelatedPropertyDataObject(aRelatedPropertyObjectName);
			if (aRelatedDataObject == null) return null;
			
			aObjDefNode = aRelatedDataObject.ObjDefNode;
			aPropertyNode = cXMLDoc.FindNode(aObjDefNode, "Properties/Property", "Key", aRelatedPropertyKey);
			return aRelatedPropertyKey;										
		} else {
			aObjDefNode = ObjDefNode;
			aPropertyNode = cXMLDoc.FindNode(ObjDefNode, "Properties/Property", "Key", aPropertyKey);
			return aPropertyKey;	
		}
	}

/*-----------------------------------------------------*/

	public string GetRelatedPropertyFormattedString(String aPropertyKey, String aFormat) {
	
		return GetRelatedPropertyFormattedString(aPropertyKey, aFormat, null) ;
	}
	
/*-----------------------------------------------------*/

	public string GetRelatedPropertyFormattedString(String aPropertyKey, String aFormat, XmlNode aFiltersNode) {
		if (aFormat == "")
			return GetRelatedPropertyString(aPropertyKey);
		
		Object	aObject = GetRelatedPropertyValue(aPropertyKey, aFiltersNode);
		XmlNode	aPropertyNode;
		XmlNode	aObjDefNode;		
		
		GetRelatedPropertyData(aPropertyKey, out aObjDefNode, out aPropertyNode);
		//aPropertyNode = cXMLDoc.FindNode(ObjDefNode, "Properties/Property", "Key", aPropertyKey);
		if (aPropertyNode != null) {
			String	aDataType;
			
			aDataType = cXMLDoc.AttributeToString(aPropertyNode, "DataType", "");
			switch (aDataType) {
				case "Boolean" :
					bool	aVal = Convert.ToBoolean(aObject);
					switch (aFormat) {
						case "YesNo" :
							return aVal == true ? "Yes" : "No";
						case "YesNoNull" :
							if(aObject == null)
								return "";
							else
								return aVal == true ? "Yes" : "No";
						case "TrueFalse" :
							return aVal == true ? "True" : "False";
						case "TrueFalseNull" :
							if(aObject == null)
								return "";
							else
								return aVal == true ? "True" : "False";
						case "CompleteIncomplete" :
							return aVal == true ? "Complete" : "Incomplete";
						case "CompleteIncompleteNull" :
							if(aObject == null)
								return "";
							else
								return aVal == true ? "Complete" : "Incomplete";
						case "ActiveInactive" :
							return aVal == true ? "Inactive" : "Active";
						default :
							String aTrueVal = aFormat.Substring(0,  aFormat.IndexOf(","));
							String aFalseVal = aFormat.Substring(aFormat.IndexOf(",") + 1);
							return aVal == true ? aTrueVal : aFalseVal;
					}
					//break;
				case "String" :
					String	aStringVal = Convert.ToString(aObject);
					switch (aFormat) {
						case "YesNo" :
							return aStringVal == "1" ? "Yes" : "No";
						case "YesNoNull" :
							if(aObject == null)
								return "";
							else
								return aStringVal == "1" ? "Yes" : "No";
						case "TrueFalse" :
							return aStringVal == "1" ? "True" : "False";		
						case "TrueFalseNull" :
							if(aObject == null)
								return "";
							else
								return aStringVal == "1" ? "True" : "False";
						case "Phone" :
							//formats phone numbers from the U.S./Canada/Caribbean dialing area
							//(e.g., 1-xxx-xxx-xxxx, xxx-xxx-xxxx, xxx-xxxx)
							switch(aStringVal.Length) {
								case 11 :
									return aStringVal.Substring(0,1) + "-" + aStringVal.Substring(1,3) + "-" + aStringVal.Substring(4,3) + "-" + aStringVal.Substring(7,4);
								case 10 :
									return aStringVal.Substring(0,3) + "-" + aStringVal.Substring(3,3) + "-" + aStringVal.Substring(6,4);
								case 7 :
									return aStringVal.Substring(0,3) + "-" + aStringVal.Substring(3,4);
								default :
									return aStringVal;
							}
					}				
					break;	
				case "Integer" :
					String	aIntVal = Convert.ToString(aObject);
					switch (aFormat) {
						case "YesNo" :
								return aIntVal == "1" ? "Yes" : "No";
						case "YesNoNull" :
							if(aObject == null)
								return "";
							else
								return aIntVal == "1" ? "Yes" : "No";
						case "TrueFalse" :
							return aIntVal == "1" ? "True" : "False";		
						case "TrueFalseNull" :
							if(aObject == null)
								return "";
							else
								return aIntVal == "1" ? "True" : "False";
					}				
					break;		
			}
		}

		//use the default .NET retrieval...
		aFormat = "{0:" + aFormat + "}";
		return String.Format(aFormat, aObject);
	}


/*-----------------------------------------------------*/

	public string GetRelatedPropertyDefaultFormattedString(String aFullPropertyKey) {
		XmlNode	aPropertyNode;
		XmlNode	aObjDefNode;
		String aFormat = "";

		GetRelatedPropertyData(aFullPropertyKey, out aObjDefNode, out aPropertyNode);
		aFormat = cXMLDoc.AttributeToString(aPropertyNode, "DefaultFormat");
		
		if(aFormat == "") {
			String aDataType;
			aDataType = cXMLDoc.AttributeToString(aPropertyNode, "DataType");
			
			switch(aDataType) {
				case "Boolean" :
					//aFormat = "TrueFalse";
					aFormat = "TrueFalseNull";
					break;
				case "Integer" :
					aFormat = "#";
					break;
				case "DateTime" :
					aFormat = "MM/dd/yyyy";
					break;
				default :
					return GetRelatedPropertyString(aFullPropertyKey);
			}
		}
		return GetRelatedPropertyFormattedString(aFullPropertyKey, aFormat);
	}
	
/*-----------------------------------------------------*/

	public string GetAliased_RelatedPropertyDefaultFormattedString(String aFullPropertyKey) {
		String aAliasedKey = cDataObjectFactory.Alias_DisplayPropertyKey(this.DataObjectList.DataObjectNode, aFullPropertyKey);
		return GetRelatedPropertyDefaultFormattedString(aAliasedKey);
	}
	
/*-----------------------------------------------------*/

	public ArrayList GetRelatedPropertyArrayList(String aPropertyKey) {
		
		/*Returns an array list of values from a property
		in a one-to-many relationship with the current data object. Values
		are returned as objects so that they can be recast to specific types
		as needed. */
		
		//Find last dot in property key, in order to break the key into a list property
		//key, which returns a data object list, and a value key, which specifies
		//a data property within the returned list.
		int aIndex = aPropertyKey.LastIndexOf(".");
		if(aIndex < 0)
			return null;
			
		String aListPropertyKey = aPropertyKey.Substring(0, aIndex);
		String aValuePropertyKey = aPropertyKey.Substring(aIndex + 1);
		
		//Get data object list from list key
		cDataObjectList aDataObjectList = GetRelatedPropertyDataObjectList(aListPropertyKey);
		if(aDataObjectList.Count == 0)
			return null;
		
		//Add values to array list based on value key
		ArrayList aReturnList = new ArrayList();
		foreach(cDataObject aDataObject in aDataObjectList)
			aReturnList.Add(aDataObject.GetPropertyValue(aValuePropertyKey));
			
		return aReturnList;
	}
	
/*-----------------------------------------------------*/

	public object GetRelatedPropertyAggregate(String aPropertyKey, String aAggType) {
		ArrayList aList = GetRelatedPropertyArrayList(aPropertyKey);
		switch(aAggType) {
			case "Sum" :
				return SumFromArrayList(aList);
			case "Count" :
				return CountFromArrayList(aList);
			case "Mean" :
				return MeanFromArrayList(aList);
			default :
				return null;
		}
	}	
/*-----------------------------------------------------*/

	public double SumFromArrayList(ArrayList aList) {
		if(aList == null)
			return 0;
			
		double aSum = 0;
		foreach(object aObj in aList) {
			if(aObj != System.DBNull.Value)
				aSum += (double)aObj;
		}
		return aSum;
	}
	
/*-----------------------------------------------------*/

	public int CountFromArrayList(ArrayList aList) {
		return CountFromArrayList(aList, true);
	}
	
/*-----------------------------------------------------*/

	public int CountFromArrayList(ArrayList aList, bool aIncludeNulls) {
		if(aList == null)
			return 0;
		
		if(aIncludeNulls)
			return aList.Count;
			
		int i = 0;
		foreach(object aObj in aList) {
			if(aObj != null)
				i += 1;
		}
		
		return i;
	}
	
/*-----------------------------------------------------*/

	public double MeanFromArrayList(ArrayList aList) {
		return MeanFromArrayList(aList, true);
	}

/*-----------------------------------------------------*/

	public double MeanFromArrayList(ArrayList aList, bool aIncludeNulls) {
		int aCount = CountFromArrayList(aList, aIncludeNulls);
		if(aCount == 0)
			return System.Double.MinValue;
		return SumFromArrayList(aList)/aCount;
	}
/*====================================================*/
	///<summary>
	///writes binary large object to a file from db
	///</summary>
	public int WriteBlobToFile(string aPropertyKey, String aFileName) 
	{
		FileStream	aFileStream;
		Byte[]		aByteArray;
		
		aFileStream = File.Create(aFileName);
		aByteArray = (Byte[])this[aPropertyKey];
		aFileStream.Write(aByteArray, 0, aByteArray.Length);
		
		aFileStream.Close();
		return 0;
	}

/*-----------------------------------------------------*/

	public int WriteFileToBlob(string aPropertyKey, String aFileName, bool aDeleteFlag) {
		FileStream	aFileStream;
		
		aFileStream = File.Open(aFileName, FileMode.Open);
		Byte[]		aByteArray = new Byte[aFileStream.Length];
		
		//aByteArray.Length = aFileStream.Length;
		aFileStream.Read(aByteArray, 0, (int)aFileStream.Length);
		aFileStream.Close();
		
		this[aPropertyKey] = aByteArray;
		
		if (aDeleteFlag)
			File.Delete(aFileName);
		return 0;
	}

/*-----------------------------------------------------*/

	public int WriteFileToBlob(string aPropertyKey, String aFileName) {
		return WriteFileToBlob(aPropertyKey, aFileName, false);
	}

/*====================================================*/
/* constructs a DataObject node using the relationship node for the property*/

	public XmlNode GenerateRelatedDataObjectNode(string aPropertyKey, cDataObjectFactory aDataObjFactory, out String aRelationshipType){
		//<DataObject Key='Base' DataObjectDefinitionKey='Person' Updatable='True'>
		XmlNode			aRelationshipNode;
		XmlNode			aDataObjectNode;
		XmlNode			aFiltersNode;
		cXMLDoc			aXmlDoc;
		
		aRelationshipType = "";
		
		aRelationshipNode = cXMLDoc.GetRelationshipNode(ObjDefNode, aPropertyKey);
		if (aRelationshipNode == null) return null;
		
		//assigns value to the output parameter
		aRelationshipType = cXMLDoc.AttributeToString(aRelationshipNode, "Type");
		
		aXmlDoc = aDataObjFactory.CreateDataObjectNode(aRelationshipNode.Attributes["ChildDefinitionKey"].Value, out aDataObjectNode, out aFiltersNode);
		
		//creates filter for specific related property
		XmlNodeList aRelationshipProperties = aRelationshipNode.SelectNodes("RelationshipProperties/RelationshipProperty");
		
		foreach(XmlNode aRelationshipProperty in aRelationshipProperties){
			String	aFilterParentPropertyKey;
			String	aFilterPropertyValue;
			String	aFilterChildPropertyKey;
			
			aFilterParentPropertyKey = cXMLDoc.AttributeToString(aRelationshipProperty, "parentProperty", "");
			
			if (aFilterParentPropertyKey != "")
				aFilterPropertyValue = this.GetRelatedPropertyString(aFilterParentPropertyKey);
			else
				aFilterPropertyValue = cXMLDoc.AttributeToString(aRelationshipProperty, "Data");
				
			aFilterChildPropertyKey = cXMLDoc.AttributeToString(aRelationshipProperty, "childProperty"); 

			//add <Argument> node to <Filters> node only if a row exists in the parent object
			//if (!(this.DataObjectRow.IsNull(aFilterParentPropertyKey)))
			//aFiltersNode.AppendChild(aDataObjFactory.CreateArgumentNode(aXmlDoc, "Data", aFilterChildPropertyKey, aFilterPropertyValue));

			String	aFilterBool;
			String	aFilterOperator;
			aFilterBool = cXMLDoc.AttributeToString(aRelationshipProperty, "Bool", "");
			aFilterOperator = cXMLDoc.AttributeToString(aRelationshipProperty, "Operator", "");
			if (aFilterOperator != "") {
				if (aFilterBool == "") aFilterBool = "And";
				aFiltersNode.AppendChild(aDataObjFactory.CreateArgumentNode(aXmlDoc, "Data", aFilterChildPropertyKey, aFilterPropertyValue, aFilterBool, aFilterOperator));
			}
			else{
				if (aFilterBool != "")
					aFiltersNode.AppendChild(aDataObjFactory.CreateArgumentNode(aXmlDoc, "Data", aFilterChildPropertyKey, aFilterPropertyValue, aFilterBool));
				else
					aFiltersNode.AppendChild(aDataObjFactory.CreateArgumentNode(aXmlDoc, "Data", aFilterChildPropertyKey, aFilterPropertyValue));
			}
		}
		
		XmlNodeList aRelationShipFilters = aRelationshipNode.SelectNodes("RelationshipFilters/Argument");
		foreach(XmlNode aRelationShipFilter in aRelationShipFilters) {
			XmlNode		aNewNode = aRelationShipFilter.CloneNode(true);

			aNewNode = aFiltersNode.OwnerDocument.CreateNode(XmlNodeType.Element, "Argument", "");
			aNewNode.Attributes.Append(aFiltersNode.OwnerDocument.CreateAttribute("Bool")).Value = " ";
			aNewNode.InnerXml = aRelationShipFilter.InnerXml;
			aFiltersNode.AppendChild(aNewNode);
		}
	
        return aDataObjectNode;
	}

/*-----------------------------------------------------*/

	public void UpdateCalculatedValues() {
		XmlNodeList		aCalculatedPropertyNodeList = this.ObjDefNode.SelectNodes("Properties/Property[@Calculated='True']");
		
		XmlNode			aCalculationNode;
		String			aPropertyKey;
		String			aDataType;
		
		foreach (XmlNode aCalculatedPropertyNode in aCalculatedPropertyNodeList) 
		{
			aCalculationNode = aCalculatedPropertyNode.SelectSingleNode("Calculation");
			aPropertyKey = cXMLDoc.AttributeToString(aCalculatedPropertyNode,"Key");
			aDataType = cXMLDoc.AttributeToString(aCalculatedPropertyNode,"DataType");
			UpdateCalculatedValue(aCalculationNode,aPropertyKey,aDataType);
		}
	}

/*-----------------------------------------------------*/

	public void UpdateCalculatedValue(XmlNode aCalculationNode, String aPropertyName, String aDataType) {
		String		aAttributeType;
		String		aBuildString = "";
		String		aCalculationType;
		String		aFormat;
		int			aSumInt = 0, cnt;
		Double		aSumDouble = 0, aArg1 = 0, aArg2 = 0;
		
		aAttributeType = cXMLDoc.AttributeToString(aCalculationNode,"Type");

		switch (aAttributeType) {
			case "Division" :
				//Double	aArg1 = 0; 
				//Double	aArg2 = 0;
				cnt = aCalculationNode.SelectNodes("Argument").Count;
				if(cnt != 2)
				{
					this[aPropertyName] = System.DBNull.Value;
				}
				else
				{
					int i=1;
					foreach (XmlNode aArgumentNode in aCalculationNode)
					{
						aCalculationType = cXMLDoc.AttributeToString(aArgumentNode,"Type");
						switch (aCalculationType)
						{
							case "Data" :
								if(i == 1)
									aArg1 = this.GetPropertyDouble(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"), 0);
								else
									aArg2 = this.GetPropertyDouble(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"), 0);
								break;
							case "RelatedProperty" :
								if(i == 1)
									aArg1 = this.GetRelatedPropertyDouble(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"));
								else
									aArg2 = this.GetRelatedPropertyDouble(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"));
								break;
						}
						i++;
					}
					if(aArg2 == 0)
						this[aPropertyName] = System.DBNull.Value;
					else
						this[aPropertyName] = aArg1/aArg2;
				}
				break;
			
			case "Subtraction" :
				cnt = aCalculationNode.SelectNodes("Argument").Count;
				if(cnt != 2)
				{
					this[aPropertyName] = System.DBNull.Value;
				}
				else
				{
					int i=1;
					foreach (XmlNode aArgumentNode in aCalculationNode)
					{
						aCalculationType = cXMLDoc.AttributeToString(aArgumentNode,"Type");
						switch (aCalculationType)
						{
							case "Data" :
								if(i == 1)
									aArg1 = this.GetPropertyDouble(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"), 0);
								else
									aArg2 = this.GetPropertyDouble(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"), 0);
								break;
							case "RelatedProperty" :
								if(i == 1)
									aArg1 = this.GetRelatedPropertyDouble(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"));
								else
									aArg2 = this.GetRelatedPropertyDouble(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"));
								break;
						}
						i++;
					}
					this[aPropertyName] = aArg1 - aArg2;
				}
				break;

			case "Sum" :
				if(aDataType == "Float"){
					foreach (XmlNode aArgumentNode in aCalculationNode){
						aCalculationType = cXMLDoc.AttributeToString(aArgumentNode,"Type");
						switch (aCalculationType)
						{
							case "Data" :
								aSumDouble += this.GetPropertyDouble(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"), 0);
								break;
							case "RelatedProperty" :
								aSumDouble += this.GetRelatedPropertyDouble(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"));
								break;
						}
					}
					this[aPropertyName] = aSumDouble;
				}
				else if(aDataType == "Integer"){
					foreach (XmlNode aArgumentNode in aCalculationNode){
						aCalculationType = cXMLDoc.AttributeToString(aArgumentNode,"Type");
						switch (aCalculationType)
						{
							case "Data" :
								aSumInt += this.GetPropertyInt(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"), 0);
								break;
							case "RelatedProperty" :
								aSumInt += this.GetRelatedPropertyInt(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"));
								break;
						}
					}
					this[aPropertyName] = aSumInt;
				}
				break;
			case "Concatenation" :
				String aLeftString = "";
				String aRightString = "";
				String aCurrentString = "";
				foreach (XmlNode aArgumentNode in aCalculationNode){
					aCalculationType = cXMLDoc.AttributeToString(aArgumentNode,"Type");
					aLeftString = cXMLDoc.AttributeToString(aArgumentNode,"LeftString","");
					aRightString = cXMLDoc.AttributeToString(aArgumentNode,"RightString","");
					switch (aCalculationType)
					{
						case "Data" :
							aFormat = cXMLDoc.AttributeToString(aArgumentNode, "Format");
							if (aFormat != "")
								//aBuildString += this.GetRelatedPropertyFormattedString(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"), aFormat);
								aCurrentString = this.GetRelatedPropertyFormattedString(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"), aFormat);
							else
								//aBuildString += this[cXMLDoc.AttributeToString(aArgumentNode,"TypeKey")];
								aCurrentString = this[cXMLDoc.AttributeToString(aArgumentNode,"TypeKey")].ToString();
							break;
						case "String" :
							//aBuildString += aArgumentNode.Attributes["Value"].Value;
							aCurrentString = aArgumentNode.Attributes["Value"].Value;
							break;
						case "RelatedProperty" :
							//aBuildString += this.GetRelatedPropertyString(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"));
							aCurrentString = this.GetRelatedPropertyString(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"));
							break;
					}
					if(aCurrentString.Trim().Length > 0 && aLeftString.Length > 0)
						aBuildString += aLeftString;
					aBuildString += aCurrentString;
					if(aCurrentString.Trim().Length > 0 && aRightString.Length > 0)
						aBuildString += aRightString;
				}
				this[aPropertyName] = aBuildString;
				break;
			case "StringFormat" :
				foreach (XmlNode aArgumentNode in aCalculationNode){
					aCalculationType = cXMLDoc.AttributeToString(aArgumentNode,"Type");
					Object	aObject = GetRelatedPropertyValue(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"));
					aCalculationType = "{0:" + aCalculationType + "}";
					aBuildString += String.Format(aCalculationType, aObject);
				}
				this[aPropertyName] = aBuildString;
				break;
			case "Formula" :
				this[aPropertyName] = aBuildString;
				break;
		}
	}

/*-----------------------------------------------------*/

	public virtual void UpdateCalculatedValue(XmlNode aCalculationNode, String aPropertyName) {
		String		aAttributeType;
		String		aBuildString = "";
		String		aBuildStringPre = "";
		String		aCalculationType;
		int			iFrom = 0;
		int			iLength = 0;
		
		aAttributeType = cXMLDoc.AttributeToString(aCalculationNode,"Type");

		switch (aAttributeType) {
			case "Concatenation" :
				foreach (XmlNode aArgumentNode in aCalculationNode){
					aCalculationType = cXMLDoc.AttributeToString(aArgumentNode,"Type");
					switch (aCalculationType)
					{
						case "Data" :
							aBuildString += this[cXMLDoc.AttributeToString(aArgumentNode,"TypeKey")];
							break;
						case "String" :
							aBuildString += aArgumentNode.Attributes["Value"].Value;
							break;
						case "RelatedProperty" :
							aBuildString += this.GetRelatedPropertyString(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"));
							break;
					}
				}
				break;
			case "StringFormat" :
				foreach (XmlNode aArgumentNode in aCalculationNode){
					aCalculationType = cXMLDoc.AttributeToString(aArgumentNode,"Type");
					Object	aObject = GetRelatedPropertyValue(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"));
					aCalculationType = "{0:" + aCalculationType + "}";
					aBuildString += String.Format(aCalculationType, aObject);
				}
				break;
			case "Formula" :
				break;
			case "Substring" :
				foreach (XmlNode aArgumentNode in aCalculationNode)
				{
					aCalculationType = cXMLDoc.AttributeToString(aArgumentNode,"Type");
					switch (aCalculationType)
					{
						case "Data" :
							aBuildStringPre = "";
							aBuildStringPre += this[cXMLDoc.AttributeToString(aArgumentNode,"TypeKey")];
							if (aBuildStringPre.Length>0)
							{
								iFrom = Convert.ToInt32(aArgumentNode.Attributes["From"].Value);
								iLength = Convert.ToInt32(aArgumentNode.Attributes["Length"].Value);
								if (iLength > aBuildStringPre.Length)
								{
									iLength = aBuildStringPre.Length;
								}
								aBuildString += aBuildStringPre.Substring(iFrom,iLength);
							} 
							else 
							{
								aBuildString = "";
							}
							break;
						case "String" :
							if(aArgumentNode.Attributes["Required"].Value == "True" && aBuildString.Length>0)
							{
								aBuildString += aArgumentNode.Attributes["Value"].Value;
							}
							if(aArgumentNode.Attributes["Required"].Value == "False")
							{
								aBuildString += aArgumentNode.Attributes["Value"].Value;
							}
							break;
						case "RelatedProperty" :
							//aBuildStringPre = this.GetRelatedPropertyString(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"));
							aBuildStringPre = "";
							aBuildStringPre += this.GetRelatedPropertyString(cXMLDoc.AttributeToString(aArgumentNode,"TypeKey"));
							if (aBuildStringPre.Length>0)
							{
								iFrom = Convert.ToInt32(aArgumentNode.Attributes["From"].Value);
								iLength = Convert.ToInt32(aArgumentNode.Attributes["Length"].Value);
								if (iLength > aBuildStringPre.Length)
								{
									iLength = aBuildStringPre.Length;
								}
								aBuildString += aBuildStringPre.Substring(iFrom,iLength);
							} 
							else 
							{
								aBuildString = "";
							}
							break;
					}
				}
				break;
		}

		this[aPropertyName] = aBuildString;
	}

/*-----------------------------------------------------*/

	public void SetDataTablePrimaryKey() {
		XmlNode aPrimaryKeyNode = ObjDefNode.SelectSingleNode("Properties/Property[@IsPrimaryKey='True']");
		String aPrimaryKeyName = cXMLDoc.AttributeToString(aPrimaryKeyNode, "Key");
		DataColumn aDC = DataObjectRow.Table.Columns[aPrimaryKeyName];
		DataColumn[] aDCArray = new DataColumn[1];
		aDCArray[0] = aDC;
		DataObjectRow.Table.PrimaryKey = aDCArray;
	}

/*-----------------------------------------------------*/

	public bool MeetsFilterCriteria(XmlNodeList aFilterNodeList) {
	
		String aPropertyKey;
		String aValue;
		double dblValue;
		bool aReturnValue = true;
		bool aItemValue = true;
		bool aFirstItem = true;
		String aBoolOperator;
		XmlNode aRelatedPropertyNode;
		String aRelatedProperty;
		cDataObject aDataObject;
		String aOperator;
		
		foreach(XmlNode aFilterNode in aFilterNodeList) {
			aRelatedPropertyNode = aFilterNode.SelectSingleNode("RelatedProperty");
			if(aRelatedPropertyNode != null){
				aRelatedProperty = cXMLDoc.AttributeToString(aRelatedPropertyNode, "PropertyKey");
				aDataObject = this.GetRelatedPropertyDataObject(aRelatedProperty);
				if(aDataObject == null)
					return false;
			}
			else
				aDataObject = this;

			aPropertyKey = cXMLDoc.AttributeToString(aFilterNode, "PropertyKey");
			aValue = cXMLDoc.AttributeToString(aFilterNode, "Value");
			aOperator = cXMLDoc.AttributeToString(aFilterNode, "Operator");

			if(aOperator == "")
				aOperator = "Equal";
				
			switch(aOperator) {
				case "Equal":
					if(aDataObject[aPropertyKey].ToString() == aValue)
						aItemValue = true;
					else
						aItemValue = false;
					break;
				case "NotEqual":
					if(aDataObject[aPropertyKey].ToString() != aValue)
						aItemValue = true;
					else
						aItemValue = false;
					break;
				case "Boolean":
					/*This currently breaks when the value of the boolean is null. It could be fixed
					by first checking if aDataObject.GetPropertyKey(aPropertyKey) == System.DBNull.Value
					and, if so, setting aItemValue = false (since a null is not equal to anything).
					Peter Larsen 3/26/04
					*/
					if(aDataObject.GetPropertyValue(aPropertyKey) == System.DBNull.Value) {
						if(aValue.ToLower() == "null")
							return true;
						else
							return false;
					}
					
					if((aDataObject.GetPropertyBool(aPropertyKey) && aValue.ToLower() == "true") ||
						(!aDataObject.GetPropertyBool(aPropertyKey) && aValue.ToLower() == "false"))
						aItemValue = true;
					else
						aItemValue = false;
					break;

				//Dimo start 6/4/2004
				/* The following 4 case operators will break if the aValue cannot be converted 
				to type double. They are intended only for integer and double data types. */
				case "GreaterThan":
					dblValue = Convert.ToDouble(aValue);
					if(aDataObject.GetPropertyDouble(aPropertyKey) > dblValue)
						aItemValue = true;
					else
						aItemValue = false;
					break;
				case "GreaterThanEqual":
					dblValue = Convert.ToDouble(aValue);
					if(aDataObject.GetPropertyDouble(aPropertyKey) >= dblValue)
						aItemValue = true;
					else
						aItemValue = false;
					break;
				case "LessThan":
					dblValue = Convert.ToDouble(aValue);
					if(aDataObject.GetPropertyDouble(aPropertyKey) < dblValue)
						aItemValue = true;
					else
						aItemValue = false;
					break;
				case "LessThanEqual":
					dblValue = Convert.ToDouble(aValue);
					if(aDataObject.GetPropertyDouble(aPropertyKey) <= dblValue)
						aItemValue = true;
					else
						aItemValue = false;
					break;
				//Dimo end 6/4/2004

			}
			if(!aFirstItem) {
				aBoolOperator = cXMLDoc.AttributeToString(aFilterNode, "Bool", "And");
					
				switch(aBoolOperator) {
					case "And":
						aReturnValue = aReturnValue && aItemValue;
						break;
					case "Or":
						aReturnValue = aReturnValue || aItemValue;
						break;
				}
			}
			else {
				aReturnValue = aItemValue;
			}
			
			aFirstItem = false;
		}
		return aReturnValue;
	}
/*-----------------------------------------------------*/

	public virtual void SaveData() {
		//cDataProvider	    aDataProvider;
		string aDataSourceKey;

		if(!Modified) 
			return;

		aDataSourceKey = cXMLDoc.AttributeToString(ObjDefNode, "DataSourceKey");
		//aDataProvider = DataObjectFactory.GetDataProvider(aDataSourceKey);
		//aDataProvider.SaveData(this);	
		DataObjectFactory.GetDataProvider(aDataSourceKey).SaveData(this);	
	}

/*----------------------------------------------------*/

	public void RaiseEvent(int aEventID, int aUserID) {
		cEvent aEvent;

		aEvent = cEvent.New_Event(aEventID, DataObjectFactory);
		if (aEvent != null)
			aEvent.RaiseEvent(DataObjectList, aUserID);
	}

/*----------------------------------------------------*/

	public void RaiseSingleEvent(int aEventID, int aUserID) {
		RaiseSingleEvent(aEventID, aUserID, "");
	}

/*----------------------------------------------------*/

	public void RaiseSingleEvent(int aEventID, int aUserID, string aRcptPersonIDPropertyKey) {
		cEvent aEvent;

		aEvent = cEvent.New_Event(aEventID, DataObjectFactory);
		if (aEvent != null) {
			if (aRcptPersonIDPropertyKey != "") {
				aEvent.RaiseSingleEvent(DataObjectList, aUserID, aRcptPersonIDPropertyKey);
			}
			else {
				aEvent.RaiseSingleEvent(DataObjectList, aUserID);
			}
		}
	}

/*----------------------------------------------------*/

	public String EvaluateData_Item(XmlElement aEvaluationEl) {
		int aCount = EvaluateData_Count(aEvaluationEl);
		int aMinCount;
		int aMaxCount;
		String aResultCode;
        XmlNodeList aResultNodeList = aEvaluationEl.SelectNodes("Results/Result");
        foreach(XmlNode aResultNode in aResultNodeList) {
			//Set minimum and maximum count values, using default values if they are not specified in XML
			aMinCount = cXMLDoc.AttributeToInt(aResultNode, "MinCount", 0);
			aMaxCount = cXMLDoc.AttributeToInt(aResultNode, "MaxCount", System.Int32.MaxValue);

			if(aCount >= aMinCount && aCount <= aMaxCount) {
				XmlElement aResultEl = (XmlElement)aResultNode;
	            
				cXMLDoc.IndicateValidationResult(ref aResultEl);
				aResultCode = cXMLDoc.AttributeToString(aResultNode, "ResultCode");
				return aResultCode;
			}
        }
        //If none of the result nodes matched the data, return a result of zero.
		return "";
	}
/*----------------------------------------------------*/

	public int EvaluateData_Count(XmlElement aEvaluationEl) {
		String aDataObjKey;
		cDataObjectList aDataObjList;
		int aCount;
		XmlNodeList aFilterNodeList;
		
		aDataObjKey = cXMLDoc.AttributeToString(aEvaluationEl, "DataObjectKey");
		aCount = 0;
		aFilterNodeList = aEvaluationEl.SelectNodes("Filters/Argument");
		if(aDataObjKey == "this") {
			if(this.MeetsFilterCriteria(aFilterNodeList))
				aCount = 1;
		}
		else {
			aDataObjList = this.GetRelatedPropertyDataObjectList(aDataObjKey);
			foreach(cDataObject aDataObj in aDataObjList) {
				if(aDataObj.MeetsFilterCriteria(aFilterNodeList))
					aCount += 1;
			}
		}
		
		return aCount;
	}
	
/*----------------------------------------------------*/

	public int CompareTo(object aObj) {
	/*Required to implement IComparable interface. Return values:
	-1 - this sorts before compared object
	0  - the two objects are equal
	1  - this sorts after the compared object
	*/
		if(DataObjectList.SortEl == null)
			return 0;
		
		cDataObject aCompareDO = (cDataObject)aObj;
		XmlNodeList aArgsList = DataObjectList.SortEl.SelectNodes("Argument");	
		foreach(XmlNode aArgNode in aArgsList) {
			XmlNode aRelatedPropertyNode = aArgNode.SelectSingleNode("RelatedProperty");
			XmlNode aObjDefNode;
			cDataObject aRelatedDO;
			cDataObject aRelatedCompareDO;
			if(aRelatedPropertyNode == null) {
				aRelatedDO = this;
				aRelatedCompareDO = aCompareDO;
				aObjDefNode = this.ObjDefNode;
			}
			else {
				aRelatedDO = GetRelatedPropertyDataObject(cXMLDoc.AttributeToString(aRelatedPropertyNode, "PropertyKey"));
				aRelatedCompareDO = aCompareDO.GetRelatedPropertyDataObject(cXMLDoc.AttributeToString(aRelatedPropertyNode, "PropertyKey"));
				aObjDefNode = aRelatedDO.ObjDefNode;
			}
			String aPropertyKey = cXMLDoc.AttributeToString(aArgNode, "PropertyKey");
			XmlNode aPropertyNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aPropertyKey + "']");

			//Values must be cast as the appropriate type before comparing. Nulls are treated as the smallest possible value of their type.
			int aCompareResult = 0; //Holds the result of the greater than/less than comparison. 1 = greater; 0 = equal; -1 = less
			String aDataType = cXMLDoc.AttributeToString(aPropertyNode, "DataType");
			switch(aDataType) {
				case "Boolean" :
					throw new ApplicationException("The Boolean property '" + aPropertyKey + "' was indicated as a Sort argument. Boolean properties cannot be sorted.");
				case "Integer" :
				case "Float" :
					if(aRelatedDO.GetPropertyDouble(aPropertyKey, Double.MinValue) == aRelatedCompareDO.GetPropertyDouble(aPropertyKey, Double.MinValue))
						continue;
					if(aRelatedDO.GetPropertyDouble(aPropertyKey, Double.MinValue) > aRelatedCompareDO.GetPropertyDouble(aPropertyKey, Double.MinValue))
						aCompareResult = 1;
					else
						aCompareResult = -1;
					break;
				case "String" :
					//Do case-insensitive comparison
					aCompareResult = String.Compare(aRelatedDO.GetPropertyString(aPropertyKey), aRelatedCompareDO.GetPropertyString(aPropertyKey), true);
					break;
				case "DateTime" :
					if(aRelatedDO.GetPropertyDateTime(aPropertyKey, DateTime.MinValue) == aRelatedCompareDO.GetPropertyDateTime(aPropertyKey, DateTime.MinValue))
						continue;
					if(aRelatedDO.GetPropertyDateTime(aPropertyKey, DateTime.MinValue) > aRelatedCompareDO.GetPropertyDateTime(aPropertyKey, DateTime.MinValue))
						aCompareResult = 1;
					else
						aCompareResult = -1;
					break;
			}

			//A sort order of descending should cause the method to return the reverse of what it would normally return. 
			//Set an integer value to multiply by the comparison result
			String aSortDir = cXMLDoc.AttributeToString(aArgNode, "Direction", "Ascending");
			int aSortIndex;
			switch(aSortDir) {
				case "Ascending" :
					aSortIndex = 1;
					break;
				case "Descending" :
					aSortIndex = -1;
					break;
				default :
					throw new ApplicationException("The Direction attribute of the Sort element has been misconfigured. Valid values are 'Ascending' and 'Descending'.");
			}

			//Sort order priority is implemented in the order of the argument nodes; thus, the first property comparison 
			//that yields an inequality defines the result of the comparison between data objects.
			return aCompareResult * aSortIndex;
		} //foreach(XmlNode aArgNode in aArgsList)
		
		//All sort arguments have evaluated to equal
		return 0;
	}
	
/*----------------------------------------------------*/
	
	public String Encrypt(String originalString)
	{
		string[] aSecretKey = DataObjectFactory.Appl.SecretKey().Split(',');
		return Encrypt(originalString, aSecretKey);
	}
	
/*----------------------------------------------------*/

	public String Encrypt(String originalString, string[] aSecretKey)
	{
		string[] aSecretIV = DataObjectFactory.Appl.SecretIV().Split(',');
		
		Byte[] SecretKey = new Byte[aSecretKey.Length];
		Byte[] SecretIV = new Byte[aSecretIV.Length];
		
		for (int i=0; i < aSecretKey.Length; i++) {
			SecretKey[i] = Convert.ToByte(aSecretKey[i]);
		}
		
		for (int i=0; i < aSecretIV.Length; i++) {
			SecretIV[i] = Convert.ToByte(aSecretIV[i]);
		}
		
		DESCryptoServiceProvider desSvc = new DESCryptoServiceProvider();
		MemoryStream ms = new MemoryStream();
		CryptoStream encStream = new CryptoStream(ms, desSvc.CreateEncryptor(SecretKey, SecretIV), CryptoStreamMode.Write);
		
		StreamWriter sw = new StreamWriter(encStream);
		sw.Write(originalString);
		sw.Flush();
		encStream.FlushFinalBlock();
		ms.Flush();
		
		return Convert.ToBase64String(ms.ToArray());
	}

	public string MD5Encrypt(string originalString)
	{
		// First we need to convert the string into bytes,
		// which means using a text encoder.
		Encoder enc = System.Text.Encoding.ASCII.GetEncoder();

		// Create a buffer large enough to hold the string
		byte[] data = new byte[originalString.Length];
		enc.GetBytes(originalString.ToCharArray(), 0, originalString.Length, data, 0, true);

		// This is one implementation of the abstract class MD5.
		MD5 md5 = new MD5CryptoServiceProvider();
		byte[] result = md5.ComputeHash(data);

		return BitConverter.ToString(result).Replace("-", "").ToLower();
	}




/*----------------------------------------------------*/

	public String Decrypt(String encString, string aKey)
	{
		return Decrypt(encString, aKey.Split(','));
	}
	
/*----------------------------------------------------*/
	
	public String Decrypt(String encString)
	{
		string[] aSecretKey = DataObjectFactory.Appl.SecretKey().Split(',');	
		return Decrypt(encString, aSecretKey);
	}
	
/*----------------------------------------------------*/	
	
	public String Decrypt(String encString, string[] aKeys)
	{
		string[] aSecretIV = DataObjectFactory.Appl.SecretIV().Split(',');
		
		Byte[] SecretKey = new Byte[aKeys.Length];
		Byte[] SecretIV = new Byte[aSecretIV.Length];
		
		for (int i=0; i < aKeys.Length; i++) {
			SecretKey[i] = Convert.ToByte(aKeys[i]);
		}
		
		for (int i=0; i < aSecretIV.Length; i++) {
			SecretIV[i] = Convert.ToByte(aSecretIV[i]);
		}
		Byte[] encBytes = Convert.FromBase64String(encString);
		DESCryptoServiceProvider desSvc = new DESCryptoServiceProvider();				
		MemoryStream ms = new MemoryStream(encBytes);
		CryptoStream decStream = new CryptoStream(ms, desSvc.CreateDecryptor(SecretKey, SecretIV), CryptoStreamMode.Read);
		
		StreamReader sr = new StreamReader(decStream);
		String decString = sr.ReadToEnd();
		sr.Close();
		ms.Flush();
		
		return decString;
	}

/*====================================================*/
} //class cDataObject


/*====================================================*/
}  //namespace Core.DataAccess
