using System;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using Core.DataAccess.DBAccess;
using Core.DataAccess.XMLAccess;
using Core.Exceptions;
using System.Xml;
using System.Collections;
using System.Text;
//01

namespace Core.DataAccess.DBAccess {
/*====================================================*/

///<summary>
///SQL data provider object -generate data sets, save data, delete data
///</summary>
public class cDataProviderSQL : cDataProvider 
{
/*====================================================*/

	private cSQLDBConn	mDBConn, aDBConn;
	private String		mConnString;
	private Random		aRand;
	
/*-----------------------------------------------------*/

	public cSQLDBConn DBConn {
		get {
			if (mDBConn == null)
					mDBConn = new cSQLDBConn(mConnString);
			return mDBConn;
		}
	}
	
/*====================================================*/

	public cDataProviderSQL(cAppl aAppl, string aConnStr) :
			base(aAppl) {
		//mDBConn = new cSQLDBConn(aConnStr);
		mConnString = aConnStr;
	}
	
/*====================================================*/
	
	public override void DataSource_Close(){
		if (mDBConn == null) return;
	
		mDBConn.CloseDBConnection();
		mDBConn = null;
	}

/*====================================================*/

	public override void PopulateDataSet(cDataObjectList aObjList){
		XmlNode		aObjDefNode;
		XmlNode		aDataObjectNode;
		DataSet		aDS;
		string		aSQLString;
		XmlNode		aSQLNode;
		
		aObjDefNode		= aObjList.ObjDefNode;
		aDataObjectNode	= aObjList.DataObjectNode;
		aDS			    = aObjList.ObjDataSet;
		aRand = new Random();
		SqlCommand aCmd = new SqlCommand();
		aCmd.CommandType = CommandType.Text;

		if(CommandTimeout > 0)
			aCmd.CommandTimeout = CommandTimeout;

		switch(cXMLDoc.AttributeToString(aDataObjectNode, "ResultSetType")) {
			case "Flat" :
				aSQLString  = GenerateSelectSQL_FlatResultSet(aObjDefNode, ref aDataObjectNode, aCmd);
				aDS = DBConn.FillDataSetTable(aObjList.DefinitionKey, aCmd, aDS);
				break;
			
			case "Relational" :
			default:
				GenerateSelectSQL(aObjDefNode, aDataObjectNode, aCmd);
				aDS = DBConn.FillDataSetTable(aObjList.DefinitionKey, aCmd, aDS);
				return;
		}
		
		//this is used for displaying sql in querytool results.
		if (cXMLDoc.AttributeToString(aDataObjectNode, "AddDataProviderInfo") == "True") {
			aSQLNode = aDataObjectNode.SelectSingleNode("DataProviderInfo");
			if(aSQLNode == null) { 
				aSQLNode = aDataObjectNode.OwnerDocument.CreateElement("DataProviderInfo");
				aDataObjectNode.AppendChild(aSQLNode);
			}
			aSQLNode.InnerText = aSQLString;
		}
	}

/*====================================================*/

    public string GenerateSelectSQL_FlatResultSet(XmlNode aObjDefNode, ref XmlNode aDataObjectNode, SqlCommand aCmd) {
	/*	This method, used with the ad hoc query tool, returns a SQL statement that will generate a fully 
		populated data object list (i.e., related properties are pre-populated with values rather than the 
		System.DBNull placeholder used in the normal data object list generation
	*/
        String aBaseTableName;
        String aBaseDODKey;
        String aSelectClause;
		String aFromClause;
        String aWhereClause;
        String aCmdWhereClause;
		String aSortClause;
		XmlNode aBaseObjDefNode;
		Hashtable aObjDefNodes;

        aBaseTableName = cXMLDoc.AttributeToString(aObjDefNode, "RowSource");
        aBaseDODKey = cXMLDoc.AttributeToString(aDataObjectNode, "BaseDODKey");
        aBaseObjDefNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aBaseDODKey + "']");
        
        aObjDefNodes = new Hashtable();
        aObjDefNodes.Add(aBaseTableName, aBaseObjDefNode);

        aFromClause = GenerateFromClause_FlatResultSet(aDataObjectNode, aBaseObjDefNode, aBaseTableName, ref aObjDefNodes);
        aSelectClause = GenerateSelectClause_FlatResultSet(aDataObjectNode, aBaseObjDefNode, aBaseTableName, aObjDefNodes);
        aWhereClause = GenerateWhereClause_FlatResultSet(aDataObjectNode, aBaseObjDefNode, aBaseTableName, aObjDefNodes);
        aCmdWhereClause = GenerateWhereClause_FlatResultSet(aDataObjectNode, aBaseObjDefNode, aBaseTableName, aObjDefNodes, aCmd);
        aSortClause = GenerateSortClause_FlatResultSet(aDataObjectNode, aBaseObjDefNode, aBaseTableName, aObjDefNodes);
		aCmd.CommandText = aSelectClause + " " + aFromClause + " " + aCmdWhereClause + " " + aSortClause;
		
        return aSelectClause + " " + aFromClause + " " + aWhereClause + " " + aSortClause;
    }

/*====================================================*/

    public string GenerateSelectClause_FlatResultSet(XmlNode aDataObjectNode, XmlNode aBaseObjDefNode, String aBaseTableName, Hashtable aObjDefNodes) {
        XmlNodeList aDPList;
        
        String aResult;
        String aTableProperty;
        String aTableAlias;
        String aDPKey;
        String aTruncatedDPKey;
        String[] aPropertyKeys;
        String aLastDPKey;
        XmlNode aObjDefNode;
        String aRelatedTableName;
        XmlNode aDPDefNode;
        String aFieldName;
        String aFieldAlias;

        aResult = "SELECT ";
        if(cXMLDoc.AttributeToString(aDataObjectNode, "SelectType") == "Distinct")
			aResult += "DISTINCT ";

        aDPList = aDataObjectNode.SelectNodes("DisplayProperties/DisplayProperty");
        foreach(XmlNode aDPNode in aDPList) {
            //aObjDefNode = aBaseObjDefNode;
            aDPKey = cXMLDoc.AttributeToString(aDPNode, "PropertyKey");

            //Get table name
            if(aDPKey.IndexOf(".") > 0) {
                aTruncatedDPKey = aDPKey.Substring(0, aDPKey.LastIndexOf("."));
                aLastDPKey = aDPKey.Substring(aDPKey.LastIndexOf(".") + 1);
                aPropertyKeys = aTruncatedDPKey.Split(new Char[] {'.'});
                aRelatedTableName = aBaseTableName;
				aTableProperty = aTruncatedDPKey;
				aTableAlias = GetTableAlias(aDataObjectNode, aTableProperty);
            }
            else {
/*				aTableProperty = cXMLDoc.AttributeToString(aDataObjectNode, "BaseDODKey");
				if(aTableProperty == "")
					aTableProperty = cXMLDoc.AttributeToString(aDataObjectNode, "DataObjectDefinitionKey");
*/				aTableProperty = aBaseTableName;
				aTableAlias = aBaseTableName; 
                aLastDPKey = aDPKey;
            }


            //Get field name
            aObjDefNode = (XmlNode)aObjDefNodes[aTableProperty];
            aDPDefNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aLastDPKey + "']");
            aFieldName = cXMLDoc.AttributeToString(aDPDefNode, "ColumnSource");
            aFieldAlias = cXMLDoc.AttributeToString(aDPNode, "ColumnHeader");
            if(aFieldAlias == "")
				aFieldAlias = aDPKey;
            //aResult += aTableAlias + "." + aFieldName + " AS [" + aDPKey.Replace(".", "_") + "], ";
            aResult += aTableAlias + "." + aFieldName + " AS [" + cDataObjectFactory.Alias_DisplayPropertyKey(aDataObjectNode, aDPKey) + "] , ";
        } //foreach(XmlNode aDPNode in aDPList)

        //Remove trailing comma and space, then return result
        aResult = aResult.Substring(0, aResult.Length - 2) + " ";
        return aResult;
    }
/*====================================================*/

    public String GenerateFromClause_FlatResultSet(XmlNode aDataObjectNode, XmlNode aBaseObjDefNode, String aBaseTableName, ref Hashtable aObjDefNodes) {
    
		String aBaseDODKey = cXMLDoc.AttributeToString(aDataObjectNode, "BaseDODKey");
		if(aBaseDODKey == "")
			aBaseDODKey = cXMLDoc.AttributeToString(aDataObjectNode, "DataObjectDefinitionKey");
		String aResult = "FROM " + aBaseTableName + " "; //+ " AS " + aBaseDODKey + " ";
		XmlNode aJoinsNode = aDataObjectNode.SelectSingleNode("Joins"); //PL 12/17/03
		XmlNodeList aJoinsNodeList = aDataObjectNode.SelectNodes("Joins/Join");

		String aKey;
		String[] aKeyElements;
		int aIndex;
		String aDefinitionKey;
		String aParentAlias;
		String aJoinClause;
		String aJoinClauseFirst = "";
		String aChildDefinitionKey;
		String aChildTableName;
		String aChildTableAlias = "";
		XmlNode aParentObjDefNode = null;
		XmlNode aChildObjDefNode;
		XmlNode aRelationshipNode = null;
		XmlNodeList aRelationshipPropertiesList;
		XmlNode aParentPropertyNode;
		String aChildPropertyKey;
		XmlNode aChildPropertyNode;
		bool aFirstRelationshipProperty;
		XmlNodeList aRPFilterArgNodeList;
		XmlNode aJoinFilterNode;
		XmlNodeList aJoinFilterArgNodeList;
		String aParentProperty;
		int aParentPropertyIndex;

		aObjDefNodes.Clear();
		aObjDefNodes.Add(aBaseTableName, aBaseObjDefNode);

		foreach(XmlNode aJoinNode in aJoinsNodeList) {
			aJoinClause = cXMLDoc.AttributeToString(aJoinNode, "Type") + " JOIN ";
			aKey = cXMLDoc.AttributeToString(aJoinNode, "Key"); 
			//aChildTableAlias = GetTableAlias(aKey); PL 12/17/03
			aChildTableAlias = GetTableAlias(aJoinNode);
			
			//Use key to get current data object definition
			
			aKeyElements = aKey.Split(new Char[] {'.'});
			aChildObjDefNode = null;
			foreach(String aKeyElement in aKeyElements) {
				if(aChildObjDefNode != null)
					aParentObjDefNode= aChildObjDefNode;
				else
					aParentObjDefNode = aBaseObjDefNode;
					
				aRelationshipNode = aParentObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aKeyElement + "']/Relationship");
				aDefinitionKey = cXMLDoc.AttributeToString(aRelationshipNode, "ChildDefinitionKey");
				aChildObjDefNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aDefinitionKey + "']");
			}
			
			aObjDefNodes.Add(aKey, aChildObjDefNode);
			aIndex = aKey.LastIndexOf(".");
			aDefinitionKey = cXMLDoc.AttributeToString(aJoinNode, "DataTypeKey");
			if(aIndex == -1)
				aParentAlias = aBaseTableName;
			else {
				//aParentAlias = GetTableAlias(aKey.Substring(0, aIndex)); PL 12/17/03
				//XmlNode aParentJoinNode = aJoinsNode.SelectSingleNode("Join[@Key='" + aKey.Substring(0, aIndex) + "']");
				aParentAlias = GetTableAlias(aDataObjectNode, aKey.Substring(0, aIndex));
			}

			//add "on" condition
			aChildDefinitionKey = cXMLDoc.AttributeToString(aRelationshipNode, "ChildDefinitionKey");
			aChildObjDefNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aChildDefinitionKey + "']");
			aChildTableName = cXMLDoc.AttributeToString(aChildObjDefNode, "RowSource");
			
			aRPFilterArgNodeList = aRelationshipNode.SelectNodes("RelationshipFilters/Argument");
			if(aRPFilterArgNodeList.Count == 0)
				aJoinClause += aChildTableName + " AS " + aChildTableAlias + " ON ";
			else {
				aJoinClause += "(" + aChildTableName + " AS " + aChildTableAlias;
				aJoinClause += AddJoinsToFromClause(aRPFilterArgNodeList, aChildObjDefNode, aChildTableAlias);
				aJoinClause += ") ON ";
			}
			
			aRelationshipPropertiesList = aRelationshipNode.SelectNodes("RelationshipProperties/RelationshipProperty");
			aFirstRelationshipProperty = true;
			foreach(XmlNode aRelationshipPropertyNode in aRelationshipPropertiesList) {
				//ChildPropertyKey
				aChildPropertyKey = aRelationshipPropertyNode.Attributes["childProperty"].Value;
				aChildPropertyNode = aChildObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aChildPropertyKey + "']");
				
				//ParentPropertyKey
				aParentProperty = cXMLDoc.AttributeToString(aRelationshipPropertyNode, "parentProperty");
				aParentPropertyIndex = aParentProperty.IndexOf('.');
				if (aParentPropertyIndex == -1) {
					aParentPropertyNode = aParentObjDefNode.SelectSingleNode("Properties/Property[@Key='" + cXMLDoc.AttributeToString(aRelationshipPropertyNode, "parentProperty") + "']");
				}
				else{
					String aParentPropertyTable = cXMLDoc.AttributeToString(aParentObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aParentProperty.Substring(0, aParentPropertyIndex) + "']").SelectSingleNode("Relationship"), "ChildDefinitionKey");
					//String aParentPropertyTable = aParentProperty.Substring(0, aParentPropertyIndex);
					String aParentPropertyColumn = aParentProperty.Substring(aParentPropertyIndex+1);

					XmlNode aParentPropertyTableNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aParentPropertyTable + "']");
					XmlNode aParentPropertyColumnNode = aParentPropertyTableNode.SelectSingleNode("Properties/Property[@Key='" + aParentPropertyColumn + "']");

					String aRelatedDefinitionKey;
					XmlNode aRelatedChildObjDefNode;
					XmlNode aMainObjRelatedNode;
					XmlNode aMainParentNode;
					XmlNode aMainChildNode;
					XmlNode aRelatedNode = aParentObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aParentPropertyTable + "']/Relationship");
					aMainObjRelatedNode = aRelatedNode.SelectSingleNode("RelationshipProperties/RelationshipProperty");
					aMainParentNode = aParentObjDefNode.SelectSingleNode("Properties/Property[@Key='" + cXMLDoc.AttributeToString(aMainObjRelatedNode, "parentProperty") + "']");
					aRelatedDefinitionKey = cXMLDoc.AttributeToString(aRelatedNode, "ChildDefinitionKey");
					aRelatedChildObjDefNode = DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aRelatedDefinitionKey + "']");
					aMainChildNode = aRelatedChildObjDefNode.SelectSingleNode("Properties/Property[@Key='" + cXMLDoc.AttributeToString(aMainObjRelatedNode, "childProperty") + "']");
					
					if(aFirstRelationshipProperty) {
						aJoinClauseFirst = aJoinClause;
						aJoinClause = "";
						aJoinClause += " JOIN " + 
									cXMLDoc.AttributeToString(aParentPropertyTableNode, "RowSource") + " AS " + 
									cXMLDoc.AttributeToString(aParentPropertyTableNode, "RowSource") + "_1 ON " + 
									aParentAlias + "." + 
									cXMLDoc.AttributeToString(aMainParentNode, "ColumnSource") +
									" = " + cXMLDoc.AttributeToString(aParentPropertyTableNode, "RowSource") + "_1" + "." +
									cXMLDoc.AttributeToString(aMainParentNode, "ColumnSource") + " ";

						aJoinClause += aJoinClauseFirst + 
									cXMLDoc.AttributeToString(aParentPropertyTableNode, "RowSource") + "_1" + "." + 
									cXMLDoc.AttributeToString(aParentPropertyColumnNode, "ColumnSource") + " = " +
									aChildTableAlias + "." +
									cXMLDoc.AttributeToString(aChildPropertyNode, "ColumnSource") + " ";
					}
					else{
						aJoinClause += " JOIN " + 
									cXMLDoc.AttributeToString(aParentPropertyTableNode, "RowSource") + " AS " + 
									cXMLDoc.AttributeToString(aParentPropertyTableNode, "RowSource") + "_1 ON " + 
									cXMLDoc.AttributeToString(aParentPropertyTableNode, "RowSource") + "_1" + "." + 
									cXMLDoc.AttributeToString(aParentPropertyColumnNode, "ColumnSource") +
									" = " + aChildTableAlias + "." +
									cXMLDoc.AttributeToString(aChildPropertyNode, "ColumnSource") + " ";
					
						aJoinClause += " AND " + aParentAlias + "." + 
									cXMLDoc.AttributeToString(aMainParentNode, "ColumnSource") + " = " +
									cXMLDoc.AttributeToString(aParentPropertyTableNode, "RowSource") + "_1" + "." + 
									cXMLDoc.AttributeToString(aMainChildNode, "ColumnSource") + " ";
					}
					aFirstRelationshipProperty = false;
					continue;
				}

				if(aParentPropertyNode == null) {
					String aChildDataType = cXMLDoc.AttributeToString(aChildPropertyNode, "DataType");
					String aFilterValue = GetSQLValue(cXMLDoc.AttributeToString(aRelationshipPropertyNode, "Data"), aChildDataType);
					aJoinClause += (aFirstRelationshipProperty ? "" : " AND ") + " " + 
							aChildTableAlias + "." + cXMLDoc.AttributeToString(aChildPropertyNode, "ColumnSource") +
							" = " + aFilterValue + " ";
/*					aJoinClause += (aFirstRelationshipProperty ? "" : " AND ") + " " + 
							aChildTableAlias + "." + cXMLDoc.AttributeToString(aChildPropertyNode, "ColumnSource") + 
							" = " + cXMLDoc.AttributeToString(aRelationshipPropertyNode, "Data") + " ";
*/				}
				else {
					aJoinClause += (aFirstRelationshipProperty ? "" : " AND ") + " " + aParentAlias + "." + 
									cXMLDoc.AttributeToString(aParentPropertyNode, "ColumnSource") +
									" = " + aChildTableAlias + "." +
									cXMLDoc.AttributeToString(aChildPropertyNode, "ColumnSource") + " ";
				}
				aFirstRelationshipProperty = false;
			}
			//add join filters
			aJoinFilterNode = aJoinNode.SelectSingleNode("JoinFilter");
			if(aJoinFilterNode != null) {
				aJoinFilterArgNodeList = aJoinFilterNode.SelectNodes("Argument");
				foreach(XmlNode aArgNode in aJoinFilterArgNodeList) {
					aJoinClause += " " + cXMLDoc.AttributeToString(aArgNode, "Bool", "AND") + " ";
					aJoinClause += aChildTableAlias + ".";
					aChildPropertyKey = cXMLDoc.AttributeToString(aArgNode, "PropertyKey");
					aChildPropertyNode = aChildObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aChildPropertyKey + "']");
					aJoinClause += cXMLDoc.AttributeToString(aChildPropertyNode, "ColumnSource");
					aJoinClause += Condition_RValue(aChildPropertyNode, aArgNode);
				}
			}
			
			aResult += aJoinClause;
		}
												
		return aResult;
    }
/*----------------------------------------------------*/

	protected String GetTableAlias(String aPropertyKey) {
		return "[" + aPropertyKey.Replace(".", "_") + "]";
	}
/*----------------------------------------------------*/

	protected String GetTableAlias(XmlNode aJoinNode) {
		String aAlias;
		
		aAlias = cXMLDoc.AttributeToString(aJoinNode, "AliasKey");
		return aAlias;
	}
	
/*----------------------------------------------------*/

	protected String GetTableAlias(XmlNode aDataObjectNode, String aPropertyKey) {
		XmlNode aJoinNode = aDataObjectNode.SelectSingleNode("Joins/Join[@Key='" + aPropertyKey + "']");
		return GetTableAlias(aJoinNode);
	}
	
/*====================================================*/

    public String GenerateFromClause_FlatResultSet_PropertyNodes(XmlNode aDataObjectNode, XmlNode aBaseObjDefNode, String aBaseTableName) {
		XmlNodeList aDisplayPropertiesList;
		XmlNodeList aSortArgsList;
		XmlNodeList aFilterArgsList;
		XmlNode aRelatedPropertyNode;
        String aJoinPropertyKey;
        String[] aPropertyKeys;
        String aResult;

        aResult = "FROM " + aBaseTableName + " ";
        
        aDisplayPropertiesList = aDataObjectNode.SelectNodes("DisplayProperties/DisplayProperty[@Join='Left']");
        foreach(XmlNode aDisplayPropertyNode in aDisplayPropertiesList) {
			aJoinPropertyKey = cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey");
            //Remove final property key from string, as it represents a "flat" data object property
            aJoinPropertyKey = aJoinPropertyKey.Substring(0, aJoinPropertyKey.LastIndexOf("."));
			aPropertyKeys = aJoinPropertyKey.Split(new Char[] {'.'});
        }

        aFilterArgsList = aDataObjectNode.SelectNodes("Filters/Argument");
        foreach(XmlNode aFilterArgNode in aFilterArgsList) {
			aRelatedPropertyNode = aFilterArgNode.SelectSingleNode("RelatedProperty");
			if(aRelatedPropertyNode != null && cXMLDoc.AttributeToString(aRelatedPropertyNode, "Join") != "None") {
				aJoinPropertyKey = cXMLDoc.AttributeToString(aRelatedPropertyNode, "PropertyKey");
				aPropertyKeys = aJoinPropertyKey.Split(new Char[] {'.'});
			}
        }
        
        aSortArgsList = aDataObjectNode.SelectNodes("Sort/Argument");
        foreach(XmlNode aSortArgNode in aSortArgsList) {
			aRelatedPropertyNode = aSortArgNode.SelectSingleNode("RelatedProperty");
			if(aRelatedPropertyNode != null && cXMLDoc.AttributeToString(aRelatedPropertyNode, "Join") != "None") {
				aJoinPropertyKey = cXMLDoc.AttributeToString(aRelatedPropertyNode, "PropertyKey");
				aPropertyKeys = aJoinPropertyKey.Split(new Char[] {'.'});
			}
        }

        return aResult;
    }
/*====================================================*/

    public String GenerateWhereClause_FlatResultSet(XmlNode aDataObjectNode, XmlNode aBaseObjDefNode, String aBaseTableName, Hashtable aObjDefNodes) {
        String aResult = "";
        XmlNodeList aFilterNodeList;
        XmlNode aFilterPropertyNode;
        String aCriterion;

		//If there are no filter arguments, return a blank string.
        aFilterNodeList = aDataObjectNode.SelectNodes("Filters/Argument");
        if(aFilterNodeList.Count == 0)
            return " ";

        foreach(XmlNode aFilterArgNode in aFilterNodeList) {
			if (cXMLDoc.AttributeToString(aFilterArgNode, "PropertyKey", "") == "" && 
						cXMLDoc.AttributeToString(aFilterArgNode, "Group", "") == "" )
				continue;
			
			aCriterion = "";
			
			if (aResult != "")
				aCriterion = " " + cXMLDoc.AttributeToString(aFilterArgNode, "Bool", "AND") + " ";
                
            if(cXMLDoc.AttributeToString(aFilterArgNode, "Group") != "")
				aCriterion += cXMLDoc.AttributeToString(aFilterArgNode, "Group");
			else {
				aCriterion += GetTableDotField(aFilterArgNode, aDataObjectNode, aBaseTableName, aObjDefNodes, out aFilterPropertyNode);
				aCriterion += Condition_RValue(aFilterPropertyNode, aFilterArgNode);
			}
			
			aResult += aCriterion;
        }
        
        return aResult == "" ? aResult : "WHERE " + aResult;
    }

/*====================================================*/

public String GenerateWhereClause_FlatResultSet(XmlNode aDataObjectNode, XmlNode aBaseObjDefNode, String aBaseTableName, Hashtable aObjDefNodes, SqlCommand aCmd) {
        String aResult = "";
        XmlNodeList aFilterNodeList;
        XmlNode aFilterPropertyNode;
        StringBuilder aCriterion = new StringBuilder(aCmd.CommandText);

		//If there are no filter arguments, return a blank string.
        aFilterNodeList = aDataObjectNode.SelectNodes("Filters/Argument");
        if(aFilterNodeList.Count == 0)
            return " ";

        foreach(XmlNode aFilterArgNode in aFilterNodeList) {
			if (cXMLDoc.AttributeToString(aFilterArgNode, "PropertyKey", "") == "" && 
						cXMLDoc.AttributeToString(aFilterArgNode, "Group", "") == "" )
				continue;
			
			if (aCriterion.ToString() != "")
				aCriterion.Append(" " + cXMLDoc.AttributeToString(aFilterArgNode, "Bool", "AND") + " ");
                
            if(cXMLDoc.AttributeToString(aFilterArgNode, "Group") != "")
				aCriterion.Append(cXMLDoc.AttributeToString(aFilterArgNode, "Group"));
			else {
				String aDotField = GetTableDotField(aFilterArgNode, aDataObjectNode, aBaseTableName, aObjDefNodes, out aFilterPropertyNode);
				aCriterion.Append(aDotField);
				aCriterion.Append(Condition_RValue(aFilterPropertyNode, aFilterArgNode, aDotField, aCmd));
			}
			
        }
        aResult = aCriterion.ToString();
        
        return aResult == "" ? aResult : "WHERE " + aResult;
    }

/*====================================================*/

    public String GenerateSortClause_FlatResultSet(XmlNode aDataObjectNode, XmlNode aBaseObjDefNode, String aBaseTableName, Hashtable aObjDefNodes) {
        String aResult;
        XmlNodeList aSortNodeList;
        String aCriterion = "";
        String aDirection = "";
        XmlNode aFilterPropertyNode;

		//If there are no sort arguments, return a blank string.
        aSortNodeList = aDataObjectNode.SelectNodes("Sort/Argument");
        if(aSortNodeList.Count == 0)
            return " ";

        aResult = "ORDER BY ";

        foreach(XmlNode aSortArgNode in aSortNodeList) {
			aCriterion = GetTableDotField(aSortArgNode, aDataObjectNode, aBaseTableName, aObjDefNodes, out aFilterPropertyNode);
			
			//Get direction
            //aDirection += cXMLDoc.AttributeToString(aSortArgNode, "Direction");
			aDirection = cXMLDoc.AttributeToString(aSortArgNode, "Direction");
			if(aDirection == kSortDir_Descending)
                aCriterion += " DESC";
            else
                aCriterion += " ASC";

			//Add to sort clause
            aResult += aCriterion + ", ";
        }

        //Remove trailing comma and space, then return result
        return aResult.Substring(0, aResult.Length - 2) + " ";
    }

/*====================================================*/

    public String GetTableDotField(XmlNode aArgumentNode, XmlNode aDataObjectNode, String aBaseTableName, Hashtable aObjDefNodes, out XmlNode aFilterPropertyNode) {
        XmlNode aRelatedPropertyNode;
        String aRelatedPropertyKey = "";
        String aBasePropertyKey;
        XmlNode aPropertyNode;
        String aPropertyKey;
        XmlNode aObjDefNode;
        String aResult;

         //Get table alias
        aRelatedPropertyNode = aArgumentNode.SelectSingleNode("RelatedProperty");
        if(aRelatedPropertyNode == null) {
			//If the property is directly off the base object, use the base table name (which is not aliased)
			aBasePropertyKey = cXMLDoc.AttributeToString(aDataObjectNode, "BaseDODKey");
			if(aBasePropertyKey == "")
				aBasePropertyKey = cXMLDoc.AttributeToString(aDataObjectNode, "DataObjectDefinitionKey");
			aObjDefNode = (XmlNode)aObjDefNodes[aBaseTableName];
			//aResult = cXMLDoc.AttributeToString(aObjDefNode, "RowSource") + ".";
			aResult = aBaseTableName + ".";
		}
        else {
	        aRelatedPropertyKey = cXMLDoc.AttributeToString(aRelatedPropertyNode, "PropertyKey");
			aResult = GetTableAlias(aDataObjectNode, aRelatedPropertyKey) + ".";//PL 12/17/03
			aObjDefNode = (XmlNode)aObjDefNodes[aRelatedPropertyKey];
		}

		//Get field name
		aPropertyKey = cXMLDoc.AttributeToString(aArgumentNode, "PropertyKey");
		aPropertyNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aPropertyKey + "']");
		aResult += cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource");
		
		//Get filter property node
		aFilterPropertyNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aPropertyKey + "']");
		
		return aResult;
    }

/*====================================================*/
/*
	public string GenerateSelectSQL(XmlNode aObjDefNode, XmlNode aDataObjectNode) {
		XmlNodeList		aPropertiesNodeList;
		XmlNodeList		aFiltersNodeList;
		XmlNodeList		aSortNodeList;
		String			aTableName;
		String			aGeneratedSQLStr = "",
						aGeneratedSQLWhereStr = "",
						aGeneratedSQLFromStr = "",
						aGeneratedParameters = "";
		
		aTableName = cXMLDoc.AttributeToString(aObjDefNode, "RowSource");
		if (cXMLDoc.AttributeToString(aObjDefNode, "RowSourceType") == "sp")
		{
			aGeneratedParameters = GenerateStoredProcedureParameters(aObjDefNode, aDataObjectNode);
			return "exec " + aTableName + aGeneratedParameters;
		}
		
		//generate SELECT fields
		aPropertiesNodeList = aObjDefNode.SelectNodes("Properties/Property");
		aGeneratedSQLStr = GenerateSelectClause(aTableName, aPropertiesNodeList);

		aFiltersNodeList = cXMLDoc.GetFilterArgumentList(aDataObjectNode);
		aSortNodeList = cXMLDoc.GetSortArgumentList(aDataObjectNode);
		
		Hashtable aObjDefNodes = new Hashtable();
		aGeneratedSQLFromStr = GenerateFromClause_FlatResultSet(aDataObjectNode,aObjDefNode, aTableName, ref aObjDefNodes);
		
		aGeneratedSQLWhereStr = GenerateWhereClause_FlatResultSet(aDataObjectNode,aObjDefNode, aTableName, aObjDefNodes);
		aGeneratedSQLStr += " " + aGeneratedSQLFromStr + " " + aGeneratedSQLWhereStr ;
		
		String aOrderByStr = GenerateSortClause_FlatResultSet(aDataObjectNode,aObjDefNode, aTableName, aObjDefNodes);
		aGeneratedSQLStr += aOrderByStr;

		return aGeneratedSQLStr;
	}
*/
/*====================================================*/

	public string GenerateSelectSQL(XmlNode aObjDefNode, XmlNode aDataObjectNode, SqlCommand aCmd) {
		XmlNodeList		aPropertiesNodeList;
		XmlNodeList		aFiltersNodeList;
		XmlNodeList		aSortNodeList;
		String			aTableName;
		String			aGeneratedSQLStr = "",
						aGeneratedSQLWhereStr = "",
						aGeneratedSQLFromStr = "",
						aGeneratedParameters = "";
		
		aTableName = cXMLDoc.AttributeToString(aObjDefNode, "RowSource");
		if (cXMLDoc.AttributeToString(aObjDefNode, "RowSourceType") == "sp")
		{
			aGeneratedParameters = GenerateStoredProcedureParameters(aObjDefNode, aDataObjectNode);
			aCmd.CommandText = "exec " + aTableName + aGeneratedParameters;
			return aCmd.CommandText;
		}
		
		//generate SELECT fields		
		aPropertiesNodeList = aObjDefNode.SelectNodes("Properties/Property");
		aGeneratedSQLStr = GenerateSelectClause(aTableName, aPropertiesNodeList);

		aFiltersNodeList = cXMLDoc.GetFilterArgumentList(aDataObjectNode);
		aSortNodeList = cXMLDoc.GetSortArgumentList(aDataObjectNode);
		
		Hashtable aObjDefNodes = new Hashtable();
		aGeneratedSQLFromStr = GenerateFromClause_FlatResultSet(aDataObjectNode,aObjDefNode, aTableName, ref aObjDefNodes);
		aGeneratedSQLWhereStr = GenerateWhereClause_FlatResultSet(aDataObjectNode,aObjDefNode, aTableName, aObjDefNodes, aCmd);
		
		String aOrderByStr = GenerateSortClause_FlatResultSet(aDataObjectNode,aObjDefNode, aTableName, aObjDefNodes);
		aCmd.CommandText = aGeneratedSQLStr + " " + aGeneratedSQLFromStr + " " + aGeneratedSQLWhereStr + " " + aOrderByStr;
		
		return aCmd.CommandText;
	}
	
/*====================================================*/
/*
	public string GenerateSelectSQL(cDataObject aDataObject) {
	//This version of GenerateSelectSQL generates a SQL string which replicates the structure
	//of an existing data object. This functionality is used in the SaveData method.
	//Peter Larsen 8/6/2003
	
		XmlNode			aObjDefNode;
		XmlNodeList		aPropertiesNodeList;
		String			aTable;
		String			aGeneratedSQLString = "";
		XmlNode			aPrimaryKeyNode;
		String			aPrimaryKeyField = "";
		String			aPrimaryKeyValue = "";
		
		aObjDefNode = aDataObject.ObjDefNode;
		
		aTable = cXMLDoc.AttributeToString(aObjDefNode, "RowSource");

		//generate SELECT fields		
		aPropertiesNodeList = aObjDefNode.SelectNodes("Properties/Property");
		aGeneratedSQLString = GenerateSelectClause(aTable, aPropertiesNodeList);
		
		aGeneratedSQLString += " FROM " + aTable;

		//Determine name and value of primary key field for "WHERE" clause
		aPrimaryKeyNode = cXMLDoc.GetPrimaryKeyNode(aObjDefNode);
		if (cXMLDoc.AttributeToString(aPrimaryKeyNode, "ColumnSource") != "") {
			aPrimaryKeyField = cXMLDoc.AttributeToString(aPrimaryKeyNode, "ColumnSource");
			aPrimaryKeyValue = aDataObject[cXMLDoc.AttributeToString(aPrimaryKeyNode, "Key")].ToString();
		}
		
		aGeneratedSQLString += " WHERE " + aPrimaryKeyField + " = " + aPrimaryKeyValue;
		
		return aGeneratedSQLString;
	}
*/
/*-----------------------------------------------------*/

	public string GenerateSelectSQL(cDataObject aDataObject, SqlCommand aCmd) {
	/*This version of GenerateSelectSQL generates a SQL string which replicates the structure
	of an existing data object. This functionality is used in the SaveData method.
	Peter Larsen 8/6/2003 */
	
		XmlNode			aObjDefNode;
		XmlNodeList		aPropertiesNodeList;
		String			aTable;
		StringBuilder	aGeneratedSQLString = new StringBuilder();
		XmlNode			aPrimaryKeyNode;
		String			aPrimaryKeyField = "";
		String			aPrimaryKeyValue = "";
		String			aPrimaryKeyDataType = "";
		
		aObjDefNode = aDataObject.ObjDefNode;
		
		aTable = cXMLDoc.AttributeToString(aObjDefNode, "RowSource");

		//generate SELECT fields		
		aPropertiesNodeList = aObjDefNode.SelectNodes("Properties/Property");
		aGeneratedSQLString.Append(GenerateSelectClause(aTable, aPropertiesNodeList));
		
		aGeneratedSQLString.Append(" FROM " + aTable);
		aCmd.CommandText = aGeneratedSQLString.ToString();
		aCmd.CommandType = CommandType.Text;

		//Determine name and value of primary key field for "WHERE" clause
		aPrimaryKeyNode = cXMLDoc.GetPrimaryKeyNode(aObjDefNode);
		if (cXMLDoc.AttributeToString(aPrimaryKeyNode, "ColumnSource") != "") {
			aPrimaryKeyField = cXMLDoc.AttributeToString(aPrimaryKeyNode, "ColumnSource");
			aPrimaryKeyValue = aDataObject[cXMLDoc.AttributeToString(aPrimaryKeyNode, "Key")].ToString();
			aPrimaryKeyDataType = cXMLDoc.AttributeToString(aPrimaryKeyNode, "DataType");
		}
		
		AddCommandParam(aCmd, "@" + aPrimaryKeyField, aPrimaryKeyValue, aPrimaryKeyDataType);
		
		return aGeneratedSQLString.ToString();
	}
/*-----------------------------------------------------*/

	public String GenerateSelectClause(String aTableName, XmlNodeList aPropertiesNodeList) {
	//aPropertiesNodeList is a list of data object definition properties, not of display properties.
		String aGeneratedSQLString = "";
		
		foreach (XmlNode aPropertyNode in aPropertiesNodeList) {
			if(aGeneratedSQLString == "") {
				aGeneratedSQLString += "SELECT ";
			} else {
				aGeneratedSQLString += ", ";
			}
			
			if (cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource") != "") {
				aGeneratedSQLString +=	aTableName + "." + cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource");
			} else {
				aGeneratedSQLString += "NULL";
			}
			aGeneratedSQLString += " as '" + cXMLDoc.AttributeToString(aPropertyNode, "Key") + "' ";
			
		}
		return aGeneratedSQLString;
	}

/*-----------------------------------------------------*/

	private String GenerateFromClause(String aTableName, XmlNode aObjDefNode, 
							XmlNodeList aFiltersNodeList, XmlNodeList aSortNodeList) {

		String			aFromStr;

		aFromStr = "FROM " + aTableName;
		aFromStr += AddJoinsToFromClause(aFiltersNodeList, aObjDefNode, aTableName);
		aFromStr += AddJoinsToFromClause(aSortNodeList, aObjDefNode, aTableName);
		return aFromStr;
	}
	
/*-----------------------------------------------------*/

	public String Condition_RValue(XmlNode aFilterPropertyNode, XmlNode aArgumentNode) {
		String	aValue = cXMLDoc.AttributeToString(aArgumentNode, "Value");
		aValue = cDBConn.FixQuote(aValue, false);
		String aOperator = "";
		String aOperatorName = "";
		if (aValue.Trim().ToLower() == "null")
			return " is null ";
		else if (aValue.Trim().ToLower() == "not null")
			return " is not null ";
		else
			switch(cXMLDoc.AttributeToString(aFilterPropertyNode, "DataType")) {
				case "String":
					aOperatorName = cXMLDoc.AttributeToString(aArgumentNode, "Operator");
					switch (aOperatorName) {
						case "Like" :
							if (aValue == "")
								return " LIKE '" + aValue + "' ";
							else
								return " LIKE '%" + aValue + "%' ";

						case "NotEqual":
							return " <> '" + aValue + "' ";
							
						default :
							return " = '" + aValue + "' ";
					}

				case "Float":
				case "Integer":
				case "Decimal":
					if (aValue == "")
						return " is null ";

					//The following lines of code are to defeat a SQL injection scheme.
					//See http://msdn.microsoft.com/msdnmag/issues/04/09/SQLInjection/default.aspx for details.

                    if (aValue.IndexOf(";") != -1 || aValue.IndexOf(" ") != -1)
                    {
                        cSQLInjectionException e = new cSQLInjectionException("A SQL injection attempt has been made.");
                        throw (e);
                    }

					
					aOperatorName = cXMLDoc.AttributeToString(aArgumentNode, "Operator");
						switch(aOperatorName) {
							case "":
							case "Equals":
								aOperator = " = ";
								break;
							case "GreaterThan":
								aOperator = " > ";
								break;
							case "GreaterThanEqual":
								aOperator = " >= ";
								break;
							case "LessThan":
								aOperator = " < ";
								break;
							case "LessThanEqual":
								aOperator = " <= ";
								break;
							case "NotEqual":
								aOperator = " <> ";
								break;
						}
						return aOperator + aValue + " ";
				case "DateTime":
					if (aValue == "")
						return " is null ";
					else {
						aOperatorName = cXMLDoc.AttributeToString(aArgumentNode, "Operator");
							switch(aOperatorName) {
								case "":
									aOperator = " = ";
									break;
								case "Equals":	//Added NS:09/14/04 to fix filter on date = 
									aOperator = " BETWEEN ";
									if(aValue == "Today" || aValue == "Now")
										return aOperator + "'" + System.DateTime.Now.ToShortDateString() + " 00:00:00' AND '" 
											+ System.DateTime.Now.ToShortDateString() + " 23:59:00' ";
									else
										return aOperator + "'" + aValue + " 00:00:00' AND '" + aValue + " 23:59:00' ";
									//break;
								case "GreaterThan":
									aOperator = " > ";
									break;
								case "GreaterThanEqual":
									aOperator = " >= ";
									break;
								case "LessThan":
									aOperator = " < ";
									break;
								case "LessThanEqual":
									aOperator = " <= ";
									break;
								case "NotEqual":
									aOperator = " <> ";
									break;
							}
						}
						if(aValue == "Today"){
							return aOperator + "'" + System.DateTime.Now.ToShortDateString() + "'";
						}
						else if(aValue == "Now")
							return aOperator + "'" + System.DateTime.Now.ToLongDateString() + "'";
						else {
							return aOperator + "'" + aValue + "' ";
						}
				case "Boolean":
					switch(aValue.ToLower()) {
						case "":
							return " is null ";
						case "true":
							return " = 1 ";
						case "false":
							return " = 0 ";
					}
					break;
			} //switch(cXMLDoc.AttributeToString(aFilterPropertyNode, "DataType"))
			
		return ""; //for compiler
	}

/*-----------------------------------------------------*/

	private String AddCommandParam(SqlCommand aCmd, String aParamName, String aValue, String aDataType) 
	{
		if (aCmd.Parameters.Contains(aParamName))
			aParamName += aRand.Next().ToString();
		
		//Reversing two single quotes back to just one
		//SqlParameter object knows better how to deal with quotes
		aValue = cDBConn.FixTwoQuotes(aValue);
		
		SqlParameter aParam = new SqlParameter(aParamName, GetSqlDbType(aDataType));
		aParam.Direction = ParameterDirection.Input;
		aParam.Value = ConvertValueToDotNetType(aValue, aDataType);
		aCmd.Parameters.Add(aParamName, aParam.Value);
		return aParamName;
	}

/*-----------------------------------------------------*/

	private Object ConvertValueToDotNetType(String aValue, String aEGDataType) 
	{
		if (aValue != "") {
			switch(aEGDataType) {
				case "Float" : 
					return Convert.ToDouble(aValue);
				case "Integer" : 
					return Convert.ToInt32(aValue);
				case "Decimal" :
					return Convert.ToDecimal(aValue);
				case "DateTime" : 
					return Convert.ToDateTime(aValue);
				case "Boolean" : 
					return Convert.ToBoolean(aValue);
				case "String" :
				default :
					return aValue;
			}
		}
		return aValue;
	}

/*-----------------------------------------------------*/

	public String Condition_RValue(XmlNode aFilterPropertyNode, XmlNode aArgumentNode, String aDotField, SqlCommand aCmd) 
	{
		String	aValue = cXMLDoc.AttributeToString(aArgumentNode, "Value");
		aValue = cDBConn.FixQuote(aValue, false);
		String aNewDotField =  "@" + aDotField.Replace(".", "__");
		String aParamName = "";
		String aOperator = "";
		String aOperatorName = "";
		
		aOperatorName = cXMLDoc.AttributeToString(aArgumentNode, "Operator");
					
		if (aValue.Trim().ToLower() == "null")
			if (aOperatorName == "Like" || aOperatorName == "Equals" || aOperatorName == "")
				return " is null ";
			else
				return " is not null ";
		else if (aValue.Trim().ToLower() == "not null")
			if (aOperatorName == "Like" || aOperatorName == "Equals" || aOperatorName == "")
				return " is not null ";
			else
				return " is null ";
		else {
			String aDataType = cXMLDoc.AttributeToString(aFilterPropertyNode, "DataType");
			switch(aDataType) {
				case "String":
					aOperatorName = cXMLDoc.AttributeToString(aArgumentNode, "Operator");
					switch (aOperatorName) {
						case "Like" :
							if (aValue == "") {
								aParamName = AddCommandParam(aCmd, aNewDotField, aValue, aDataType);
								return " LIKE " + aParamName;
							}
							else {
								aParamName = AddCommandParam(aCmd, aNewDotField, "%" + aValue + "%", aDataType);
								return " LIKE " + aParamName;
							}
						case "BeginsWith":
							if (aValue == "")
							{
								aParamName = AddCommandParam(aCmd, aNewDotField, aValue, aDataType);
								return " LIKE " + aParamName;
							}
							else
							{
								aParamName = AddCommandParam(aCmd, aNewDotField, aValue + "%", aDataType);
								return " LIKE " + aParamName;
							}
						case "EndsWith":
							if (aValue == "")
							{
								aParamName = AddCommandParam(aCmd, aNewDotField, aValue, aDataType);
								return " LIKE " + aParamName;
							}
							else
							{
								aParamName = AddCommandParam(aCmd, aNewDotField, "%" + aValue, aDataType);
								return " LIKE " + aParamName;
							}
						case "NotLike" :
								if (aValue == "") {
								aParamName = AddCommandParam(aCmd, aNewDotField, aValue, aDataType);
								return " not LIKE " + aParamName;
							}
							else {
								aParamName = AddCommandParam(aCmd, aNewDotField, "%" + aValue + "%", aDataType);
								return " not LIKE " + aParamName;
							}
						case "NotEqual":
							aParamName = AddCommandParam(aCmd, aNewDotField, aValue, aDataType);
							return " <> " + aParamName;
							
						default :
							aParamName = AddCommandParam(aCmd, aNewDotField, aValue, aDataType);
							return " = " + aParamName;
					}

				case "Float":
				case "Integer":
				case "Decimal":
					if (aValue == "")
						return " is null ";

					aOperatorName = cXMLDoc.AttributeToString(aArgumentNode, "Operator");
						switch(aOperatorName) {
							case "":
							case "Equals":
								aOperator = " = ";
								break;
							case "GreaterThan":
								aOperator = " > ";
								break;
							case "GreaterThanEqual":
								aOperator = " >= ";
								break;
							case "LessThan":
								aOperator = " < ";
								break;
							case "LessThanEqual":
								aOperator = " <= ";
								break;
							case "NotEqual":
								aOperator = " <> ";
								break;
						}
						aParamName = AddCommandParam(aCmd, aNewDotField, aValue, aDataType);
						return aOperator + aParamName + " ";

				case "DateTime":
					if (aValue == "")
						return " is null ";
					else {
						aOperatorName = cXMLDoc.AttributeToString(aArgumentNode, "Operator");
							switch(aOperatorName) {
								case "":
									aOperator = " = ";
									break;
								case "Equals":	//Added NS:09/14/04 to fix filter on date = 
									aOperator = " BETWEEN ";
									if(aValue == "Today" || aValue == "Now")
										return aOperator + "'" + System.DateTime.Now.ToShortDateString() + " 00:00:00' AND '" 
													+ System.DateTime.Now.ToShortDateString() + " 23:59:00' ";
									else 
									{
									aParamName = AddCommandParam(aCmd, aNewDotField, aValue + " 00:00:00", 

										aDataType);
									String aParamName1  = AddCommandParam(aCmd, aNewDotField, aValue + " 23:59:00 ", 

										aDataType);
									return aOperator + aParamName + " AND " + aParamName1 ;
								}
								case "GreaterThan":
									aOperator = " > ";
									break;
								case "GreaterThanEqual":
									aOperator = " >= ";
									break;
								case "LessThan":
									aOperator = " < ";
									break;
								case "LessThanEqual":
									aOperator = " <= ";
									break;
								case "NotEqual":
									aOperator = " <> ";
									break;
							}
						}
						if(aValue == "Today"){
							return aOperator + "'" + System.DateTime.Now.ToShortDateString() + "'";
						}
						else if(aValue == "Now")
							return aOperator + "'" + System.DateTime.Now.ToLongDateString() + "'";
						else {
							aParamName = AddCommandParam(aCmd, aNewDotField, aValue, aDataType);
							return aOperator + aParamName;
						}
				case "Boolean":
					aOperatorName = cXMLDoc.AttributeToString(aArgumentNode, "Operator");
					switch(aOperatorName) 
					{
						case "":
						case "Like":
						case "Equals":
							aOperator = " = ";
							break;
						case "GreaterThan":
							aOperator = " > ";
							break;
						case "LessThan":
							aOperator = " < ";
							break;
						case "NotEqual":
							aOperator = " <> ";
							break;
					}
					switch(aValue.ToLower()) 
					{
						case "":
							return " is null ";
						case "true":
							return aOperator + "1 ";
						case "false":
							return aOperator + "0 ";
					}
					break;
			} 
		}	
		return ""; 
	}

/*-----------------------------------------------------*/

	public String AddJoinsToFromClause(XmlNodeList aArgumentsList, XmlNode aCoreObjDefNode, String aCoreTableName) {
	/*
	This method, formerly declared as private, was made public so that it could be used by the ad hoc query editor.
	Peter Larsen 11/11/2003
	*/
		XmlNode         aRelatedPropertyNode;
		XmlNode			aObjDefNode;
		XmlNode         aRelationshipNode;
		XmlNode         aRelatedObjDefNode;
		XmlNode         aParentPropertyNode;
		XmlNode         aChildPropertyNode;
		XmlNode			aJoinFilterPropertyNode;
		XmlNodeList		aJoinFilterNodeList;
		String			aJoinString;
		String[]		aPropertyKeys;
		String			aTableName;
		String			aRelatedTableName;
		String			aRelatedTableAlias;
		String			aResult = "";
		String			aChildPropertyKey;
		String			aJoinExpression;
		String			aJoinFilterProperty;

		foreach (XmlNode aArgumentNode in aArgumentsList) {			
			aRelatedPropertyNode = aArgumentNode.SelectSingleNode("RelatedProperty");
			if (aRelatedPropertyNode != null) {
				aJoinString = cXMLDoc.AttributeToString(aRelatedPropertyNode, "Join");

				if (aJoinString != "None") {
					aObjDefNode = aCoreObjDefNode;
					aTableName = aCoreTableName;
					aPropertyKeys = cXMLDoc.AttributeToString(aRelatedPropertyNode, "PropertyKey").Split('.');
					
					foreach(String aPropertyKey in aPropertyKeys) {
						aJoinExpression = "";
						//Alias needs to be reset
						aRelatedTableAlias = cXMLDoc.AttributeToString(aRelatedPropertyNode, "Alias");
					
						//derive variables for join from Relationship Node 
						aRelationshipNode = cXMLDoc.GetRelationshipNode(aObjDefNode, aPropertyKey);
				
						aRelatedObjDefNode = aObjDefNode.OwnerDocument.DocumentElement.SelectSingleNode(
													"DataObjectDefinitions/Definition[@Key='" + cXMLDoc.AttributeToString(aRelationshipNode, "ChildDefinitionKey") + "']");
						aRelatedTableName = cXMLDoc.AttributeToString (aRelatedObjDefNode, "RowSource");
						if (aRelatedTableAlias == "")
							aRelatedTableAlias = aRelatedTableName;
						else
							aRelatedTableName += " " + aRelatedTableAlias;
						
						XmlNodeList aRelationshipProperties = aRelationshipNode.SelectNodes("RelationshipProperties/RelationshipProperty");
						
						aResult += " " + (aJoinString == "" ? "LEFT" : aJoinString) + " ";

						XmlNodeList		aRelationshipFiltersArgsNodeList;
						aRelationshipFiltersArgsNodeList = aRelationshipNode.SelectNodes("RelationshipFilters/Argument");
						if (aRelationshipFiltersArgsNodeList.Count == 0)
							aResult += "JOIN " + aRelatedTableName + " ON ";
						else {
							aResult += "JOIN (" + aRelatedTableName;
							
							aResult+= AddJoinsToFromClause(aRelationshipFiltersArgsNodeList, aRelatedObjDefNode, aRelatedTableAlias);
							
							aResult += ") ON ";
						}
							
						foreach(XmlNode aRelationshipProperty in aRelationshipProperties){
								
							//ParentPropertyKey
							aParentPropertyNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" + cXMLDoc.AttributeToString(aRelationshipProperty, "parentProperty") + "']");
							
							//ChildPropertyKey
							aChildPropertyKey = aRelationshipProperty.Attributes["childProperty"].Value;
							aChildPropertyNode = aRelatedObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aChildPropertyKey + "']");
							
							//aResult += " " + (aJoinString == "" ? "LEFT JOIN" : aJoinString) + " ";
							if(aParentPropertyNode == null) {
								aJoinExpression += (aJoinExpression == "" ? "" : " AND ") + " " + 
										aRelatedTableAlias + "." + cXMLDoc.AttributeToString(aChildPropertyNode, "ColumnSource") + 
										" = " + cXMLDoc.AttributeToString(aRelationshipProperty, "Data");
							}
							else {
								aJoinExpression += (aJoinExpression == "" ? "" : " AND ") + " " + aTableName + "." + 
												/*
													KR, CF, LM  9/16/03
													this code is to support hard-coding values for related properties
													we thought there was an error here, were we correct?
													(aParentPropertyNode != null ?
													cXMLDoc.AttributeToString(aParentPropertyNode, "ColumnSource") :
													cXMLDoc.AttributeToString(aRelationshipProperty, "Data")) +
												*/
												 cXMLDoc.AttributeToString(aParentPropertyNode, "ColumnSource") +
												" = " + aRelatedTableAlias + "." +
												cXMLDoc.AttributeToString(aChildPropertyNode, "ColumnSource");
							}
						}
						
						aResult += aJoinExpression;					
						aObjDefNode = aRelatedObjDefNode;
						aTableName = aRelatedTableAlias;
					} //foreach(String aPropertyKey in aPropertyKeys)
					
					aJoinFilterNodeList = aRelatedPropertyNode.SelectNodes("JoinFilter/Argument");
					
					if(aJoinFilterNodeList != null) {
						foreach(XmlNode aJoinFilterArgNode in aJoinFilterNodeList) {
							if (cXMLDoc.AttributeToString(aJoinFilterArgNode,"DataObjectType") == "Core"){
								aObjDefNode=aCoreObjDefNode;
								aTableName = aCoreTableName;
							}
							aJoinFilterProperty = cXMLDoc.AttributeToString(aJoinFilterArgNode, "PropertyKey");
							aJoinFilterPropertyNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aJoinFilterProperty + "']");
							aResult += " AND " + aTableName + "." + 
											cXMLDoc.AttributeToString(aJoinFilterPropertyNode, "ColumnSource") +
											Condition_RValue(aJoinFilterPropertyNode, aJoinFilterArgNode);
						} //foreach(XmlNode aJoinFilterArgNode in aJoinFilterNodeList)
					} //if(aJoinFilterNodeList != null)
				} //if (aJoinString != "None")
			} //if (aRelatedPropertyNode != null)
			
		} //foreach (XmlNode aArgumentNode in aArgumentsList)
		return aResult;

	}	

/*-----------------------------------------------------*/

	public void ExecuteStoredProcedure(cDataObject aDataObject) {
	
		String aSPName = cXMLDoc.AttributeToString(aDataObject.ObjDefNode, "SPSource");
		SqlCommand aCommand = new SqlCommand(aSPName, (SqlConnection)DBConn.DBConnection, (SqlTransaction)DBConn.DBTransaction);
		aCommand.CommandType = CommandType.StoredProcedure;
		SqlParameterCollection aParamColl = aCommand.Parameters;
		
		XmlNodeList aPropertiesNodeList = aDataObject.ObjDefNode.SelectNodes("Properties/Property");
		String aEncryptPropertyColumnName =  "";
		foreach (XmlNode aPropertyNode in aPropertiesNodeList) {
			String aDBColumnName = cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource");
			String aEGColumnName = cXMLDoc.AttributeToString(aPropertyNode, "Key");
			if (aDBColumnName != "") {
				SqlParameter aParam = new SqlParameter();
				aParam.ParameterName = "@" + aDBColumnName;
				aParam.SqlDbType = GetSqlDbType(cXMLDoc.AttributeToString(aPropertyNode, "DataType"));
				aParam.Direction = ParameterDirection.Input;
				if (aDataObject.HasEncryptedProps) {
					XmlNode aColNode = cXMLDoc.FindNode(aDataObject.ObjDefNode, "Properties/Property", "Key", aEGColumnName);
					if (aColNode != null && cXMLDoc.AttributeToString(aColNode, "Encrypt", "") == "True") 
					{
						/* HashFromPropertyKey is a newely added attribute to create a MD5 Password for the the Property Key mentioned to this attribute value. */
						string aHashFromPropertyKey = cXMLDoc.AttributeToString(aColNode, "HashFromPropertyKey", "");
						if (aHashFromPropertyKey != "")
							aParam.Value = Convert.ChangeType(aDataObject.MD5Encrypt(aDataObject[aHashFromPropertyKey].ToString()), aDataObject[aHashFromPropertyKey].GetType());
						else {
							aParam.Value = Convert.ChangeType(aDataObject.Encrypt(aDataObject[aEGColumnName].ToString()), aDataObject[aEGColumnName].GetType());
							aEncryptPropertyColumnName = cXMLDoc.AttributeToString(aColNode, "EncryptProperty", "");
						}
					}
					else {
						if (aEGColumnName == aEncryptPropertyColumnName && aDataObject[aEGColumnName].ToString() == "")
							aParam.Value = aDataObject.DataObjectFactory.Appl.SecretKey();
						else
							aParam.Value = Convert.ChangeType(aDataObject[aEGColumnName], aDataObject[aEGColumnName].GetType());
					}
				}
				else {
					aParam.Value = Convert.ChangeType(aDataObject[aEGColumnName], aDataObject[aEGColumnName].GetType());
				}
				aParamColl.Add(aParam);
			}
		}
		
		Int32 aResult = aCommand.ExecuteNonQuery();
		
	}
	
/*-----------------------------------------------------*/
	
	private SqlDbType GetSqlDbType(String aType) {
		
		switch(aType) {
			case "Boolean":
				return SqlDbType.Bit;
			case "Byte":	
				return SqlDbType.TinyInt;
			case "Byte[]":	
				return SqlDbType.Text;
			case "Char":
				return SqlDbType.Char;
			case "DateTime":
				return SqlDbType.DateTime;
			case "Decimal":
				return SqlDbType.Decimal;
			case "Float":
				return SqlDbType.Float;
			case "Integer":
				return SqlDbType.Int;
			case "Single":
				return SqlDbType.Real;
			case "String":
				return SqlDbType.VarChar;
			default:
				return SqlDbType.Variant;
			/*
			case "TimeSpan":
			case "UInt16":	
			case "UInt32":
			case "UInt64":
			case "SByte":
			*/
		}
	}

/*-----------------------------------------------------*/

	public override void SaveData(cDataObject aDataObject) {
		string aSQL;
		int aCount;
		string aValues = "";
		string aChangeType = "update";
		
/*		In order to save a data object or a data object list, the primary key property of the underlying 
		DataTable object must be set. In order to do this, we must first populate the primary key value for
		each row in the table (i.e., for each data object in the data object list), even if we are saving only one row */
		bool aHasNewDataObject = false;
		foreach(cDataObject aSiblingDataObject in aDataObject.DataObjectList) {
			if(aSiblingDataObject.IsNewDataObject) {
				aHasNewDataObject = true;
				break;
			}
		}

		if(aHasNewDataObject) {
			//Populate all objects in data object's parent list with identity value
			XmlNode aIdentityPropertyNode = aDataObject.ObjDefNode.SelectSingleNode("Properties/Property[@IsIdentity='True']");
			if(aIdentityPropertyNode != null) {
				String aPrimaryKeyProperty = cXMLDoc.AttributeToString(aIdentityPropertyNode, "Key");
				String aTableName = cXMLDoc.AttributeToString(aDataObject.ObjDefNode, "RowSource");
				foreach(cDataObject aSiblingDataObject in aDataObject.DataObjectList) {
					if(aSiblingDataObject.GetPropertyValue(aPrimaryKeyProperty) == System.DBNull.Value) {
						int aID = DBConn.DB_GetID(aTableName);
						aSiblingDataObject[aPrimaryKeyProperty]=aID;
					}
				}
			}
		}
		
		aValues = GetDataObjectValues(aDataObject);
		
		if(aDataObject.IsNewDataObject) {
			aDataObject.IsNewDataObject = false;
			aChangeType = "insert";
		}
		
		if (cXMLDoc.AttributeToString(aDataObject.ObjDefNode, "SPSource") != "") {
			ExecuteStoredProcedure(aDataObject);
			WriteDataBaseLog(aValues, aChangeType, aDataObject);
			return;
		}
		
		SqlCommand aCommand = new SqlCommand();
		aCommand.Connection = (SqlConnection)DBConn.DBConnection;
		aCommand.Transaction = (SqlTransaction)DBConn.DBTransaction;
		aSQL = GenerateSelectSQL(aDataObject, aCommand);

		//Set primary key in data object's data table. This is necessary in order for the 
		//command builder to create the necessary update, insert and delete commands
		if(aDataObject.DataObjectRow.Table.PrimaryKey.Length == 0)
					aDataObject.SetDataTablePrimaryKey();
					
		SqlDataAdapter aDA = new SqlDataAdapter(aCommand);
		SqlCommandBuilder aCB = new SqlCommandBuilder(aDA);
		aCount = aDA.Update(aDataObject.DataObjectRow.Table);
		
		WriteDataBaseLog(aValues, aChangeType, aDataObject);

	}

/*-----------------------------------------------------*/
	
	private string GetDataObjectValues(cDataObject aDataObject) {
		string aValues = "";
		string aDatabaseLog = cXMLDoc.AttributeToString(this.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions"), "DatabaseLog");
		string aDataObjLog = cXMLDoc.AttributeToString(aDataObject.ObjDefNode, "DatabaseLog");
		string			aSQL;
		
		XmlNode aObjDefNode = aDataObject.ObjDefNode;
		string aTableName = cXMLDoc.AttributeToString(aObjDefNode, "RowSource");
		XmlNode aPrimaryKeyNode = aObjDefNode.SelectSingleNode("Properties/Property[@IsPrimaryKey='True']");
		string aPrimaryKeyPropertyName = cXMLDoc.AttributeToString(aPrimaryKeyNode, "Key");
		string aPrimaryKeyColumnName = cXMLDoc.AttributeToString(aPrimaryKeyNode, "ColumnSource");
		string aPrimaryKeyValue = aDataObject[aPrimaryKeyPropertyName].ToString();
		
		if (aDatabaseLog == "True" && aDataObjLog != "False") {
			if(!aDataObject.IsNewDataObject) {
				aSQL = "select * from " + cXMLDoc.AttributeToString(aDataObject.ObjDefNode, "RowSource") + " where "
					+ aPrimaryKeyColumnName + "=@" + aPrimaryKeyColumnName;
				SqlCommand aCmd = new SqlCommand(aSQL,(SqlConnection)DBConn.DBConnection, (SqlTransaction)DBConn.DBTransaction);
				aCmd.Parameters.Add("@" + aPrimaryKeyColumnName, aPrimaryKeyValue);
				IDataReader aReader = aCmd.ExecuteReader();
				
				if (aReader.Read()) {
					for (int i = 0; i < aReader.FieldCount; i++) {
						if (aReader.IsDBNull(i))
							aValues = aValues + aReader.GetName(i).ToString() + "=null~^";
						else
							aValues = aValues + aReader.GetName(i).ToString() + "=" + aReader.GetValue(i).ToString() + "~^";
					}
				}
				aReader.Close();
				if (aValues.Length > 8000)
					aValues = aValues.Substring(0, 8000);
			}
		}
		
		return aValues;
	}
	
/*-----------------------------------------------------*/

	private void WriteDataBaseLog(string aValues, string aChangeType, cDataObject aDataObject) {
	
		string aDatabaseLog = cXMLDoc.AttributeToString(this.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions"), "DatabaseLog");
		string aDataObjLog = cXMLDoc.AttributeToString(aDataObject.ObjDefNode, "DatabaseLog");
		XmlNode aObjDefNode = aDataObject.ObjDefNode;
		string aTableName = cXMLDoc.AttributeToString(aObjDefNode, "RowSource");
		XmlNode aPrimaryKeyNode = aObjDefNode.SelectSingleNode("Properties/Property[@IsPrimaryKey='True']");
		string aPrimaryKeyPropertyName = cXMLDoc.AttributeToString(aPrimaryKeyNode, "Key");
		string aPrimaryKeyValue = aDataObject[aPrimaryKeyPropertyName].ToString();
		int aUserID = 0;
		
		if (aDatabaseLog == "True" && aDataObjLog != "False") {
			string aDataSource = cXMLDoc.AttributeToString(this.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions"), "DataSource");
			SqlCommand aInsertDBLogCmd = new SqlCommand();
			SqlParameter aPrimaryKeyParam = new SqlParameter("@primary_key", SqlDbType.Int);
			SqlParameter aOriginalValuesParam = new SqlParameter("@original_values", SqlDbType.VarChar);
			aPrimaryKeyParam.Value = Convert.ToInt32(aPrimaryKeyValue);
			aInsertDBLogCmd.Parameters.Add(aPrimaryKeyParam);
			aOriginalValuesParam.Value = aValues;
			aInsertDBLogCmd.Parameters.Add(aOriginalValuesParam);
			
			try {
				if (aDataObject.DataObjectFactory.User != null)
					aUserID = aDataObject.DataObjectFactory.User.UserID;
				if (aDataSource != "") 
				{
					aDBConn = new cSQLDBConn(aDataSource);
					aInsertDBLogCmd.Connection = (SqlConnection)aDBConn.DBConnection;
					aInsertDBLogCmd.CommandText = "insert into DATABASE_LOG(database_log_id, user_id, change_date, table_name, primary_key, original_values, change_type)" 
						+ " values(" + aDBConn.DB_GetID("DATABASE_LOG")
						+ "," + aUserID + ",'" + System.DateTime.Now.ToString()
						+ "','" + aTableName + "',@primary_key,@original_values,'" + aChangeType + "')";
					
					aDBConn.ExecuteCommand(aInsertDBLogCmd);
				}
				else {
					aInsertDBLogCmd.Connection = (SqlConnection)DBConn.DBConnection;
					aInsertDBLogCmd.CommandText = "insert into DATABASE_LOG(database_log_id, user_id, change_date, table_name, primary_key, original_values, change_type)" 
						+ " values(" + DBConn.DB_GetID("DATABASE_LOG")
						+ "," + aUserID + ",'" + System.DateTime.Now.ToString()
						+ "','" + aTableName + "',@primary_key,@original_values,'" + aChangeType + "')";
					
					DBConn.ExecuteCommand(aInsertDBLogCmd);
				}
			}
			catch(SystemException se) {}
		}	
	}
/*-----------------------------------------------------*/

	public override void DeleteData(XmlNode aObjDefNode, XmlNode aDataObjectNode) {
		XmlNodeList		aFiltersNodeList;
		string			aTableName;
		int				aWhereCount = 0;
		
		//create table name to return with dataset
		aTableName = cXMLDoc.AttributeToString(aObjDefNode, "RowSource");
		StringBuilder aSQL = new StringBuilder("DELETE FROM " + aTableName + " where ");
		SqlCommand aCommand = new SqlCommand(aSQL.ToString(), (SqlConnection)DBConn.DBConnection);
		
		//TODO:generate WHERE filters
		aFiltersNodeList = cXMLDoc.GetFilterArgumentList(aDataObjectNode);
		
		foreach (XmlNode aArgumentNode in aFiltersNodeList) {
			if(aWhereCount == 0) {		
				aWhereCount = 1;
			} else {
				aSQL.Append(" AND ");
			}
			XmlNode aPropertyNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" + cXMLDoc.AttributeToString(aArgumentNode, "PropertyKey") + "']");
			String aColumnSource = cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource");
			String aParamName = AddCommandParam(aCommand, "@" + aColumnSource, cXMLDoc.AttributeToString(aArgumentNode, "Value"), cXMLDoc.AttributeToString(aArgumentNode, "DataType"));
			aSQL.Append(aColumnSource + " = " + aParamName);
		}
		
		aCommand.CommandText = aSQL.ToString();
		DBConn.ExecuteCommand(aCommand);
	}
	
/*-----------------------------------------------------*/

	public override void DeleteData(cDataObject aDataObject) {
		XmlNode			aObjDefNode;
		string			aTableName;
		string			aPrimaryKeyPropertyName;
		string			aPrimaryKeyColumnName;
		string			aPrimaryKeyValue;
		XmlNode			aPrimaryKeyNode;
		string			aValues = "";
		string aDatabaseLog = cXMLDoc.AttributeToString(this.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions"), "DatabaseLog");
		string aDataObjLog = cXMLDoc.AttributeToString(aDataObject.ObjDefNode, "DatabaseLog");
		
		aObjDefNode = aDataObject.ObjDefNode;
		
		//create table name to return with dataset
		aTableName = cXMLDoc.AttributeToString(aObjDefNode, "RowSource");
		aPrimaryKeyNode = aObjDefNode.SelectSingleNode("Properties/Property[@IsPrimaryKey='True']");
		aPrimaryKeyPropertyName = cXMLDoc.AttributeToString(aPrimaryKeyNode, "Key");
		aPrimaryKeyColumnName = cXMLDoc.AttributeToString(aPrimaryKeyNode, "ColumnSource");
		aPrimaryKeyValue = aDataObject[aPrimaryKeyPropertyName].ToString();
		
		aValues = GetDataObjectValues(aDataObject);
		
		SqlCommand aCommand = new SqlCommand("DELETE " + aTableName + " WHERE " + aPrimaryKeyColumnName + " = @" + aPrimaryKeyColumnName, (SqlConnection)DBConn.DBConnection);
		aCommand.Parameters.Add("@" + aPrimaryKeyColumnName, aDataObject.GetPropertyValue(aPrimaryKeyPropertyName));
		DBConn.ExecuteCommand(aCommand);

		WriteDataBaseLog(aValues, "delete", aDataObject);
	}
		
/*-----------------------------------------------------*/
//Peter Larsen 11/12/2003. If this is implemented, this method should
//override a virtual method in cDataProvider
	public DataSet BuildDataSet(XmlNode aDataObjDefNode, String aQuery) {
		DataSet aDS = new DataSet();
		String aObjDefKey = cXMLDoc.AttributeToString(aDataObjDefNode, "Key");
		DBConn.FillDataSetTable(aDS, aObjDefKey, aQuery);
		return aDS;
	}		
/*-----------------------------------------------------*/

	private string GenerateUpdateSQL(cDataObject aDataObject) {
		string  aGeneratedUPDATEScript = "";
		string	aPrimaryKeyField = "";
		string	aPrimaryKeyValue = "";
		int		aWhereCount = 0;

		//read XML from DataObject		
		XmlNode				aObjDefNode;		
		aObjDefNode				= aDataObject.ObjDefNode;
			
		//generate fields to INSERT	
		XmlNodeList			aPropertiesNodeList;	
		aPropertiesNodeList	= aObjDefNode.SelectNodes("Properties/Property");
		
		//Start SQL statement
		aGeneratedUPDATEScript += "UPDATE ";
		
		//TABLE TO UPDATE
		aGeneratedUPDATEScript += cXMLDoc.AttributeToString(aObjDefNode, "RowSource");
		
		//Currently handles those NODES with an existing 'ColumnSource'
		foreach (XmlNode aPropertyNode in aPropertiesNodeList) {
			//check and generate proper fields taking into consideration the PRIMARY KEY
			if (cXMLDoc.AttributeToString(aPropertyNode, "IsPrimaryKey") == "true") {
				if (cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource") != "") {
					aPrimaryKeyField = cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource");
					aPrimaryKeyValue = aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString();
				}
			} else {
				//ensures only the appropriate properties are updated in the database
				if (cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource") != "") {
					//generate the correct delimiters
					if(aWhereCount == 0) {
						aGeneratedUPDATEScript += " SET "; 
						aWhereCount = 1;	
					} else {
						aGeneratedUPDATEScript += " , ";	
					}	
					//generate the column name and value
					aGeneratedUPDATEScript +=	cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource");
					aGeneratedUPDATEScript += " = "; 
					//determine which type of data then apply proper '(s)
					switch(cXMLDoc.AttributeToString(aPropertyNode, "DataType")) {
						case "String":
							aGeneratedUPDATEScript +=	cDBConn.FixQuoteWithNulls(aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString());
							break;
						case "DateTime":	
							aGeneratedUPDATEScript +=	cDBConn.FixQuoteWithNulls(aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString());
							break;	
						case "Integer":
							aGeneratedUPDATEScript +=	cDBConn.FixNulls(aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString());
							break;
						case "Boolean":
							aGeneratedUPDATEScript +=	cDBConn.FixNulls(aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString());
							break;	
						case "Float":
							aGeneratedUPDATEScript +=	cDBConn.FixNulls(aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString());
							break;	
					}
				}
			}	
		}	
		//final assembly
		aGeneratedUPDATEScript += " WHERE " + aPrimaryKeyField + " = " + aPrimaryKeyValue;
		
		return aGeneratedUPDATEScript;
	}
	
/*-----------------------------------------------------*/

	private string GenerateInsertSQL(cDataObject aDataObject) {
		string  aGeneratedINSERTScript = "";
		string	aTableFields = "";
		string	aTableValues = "";
		int		aID;
		int		aWhereCount = 0;
		
		//read XML from DataObject		
		XmlNode	aObjDefNode;		
		aObjDefNode	= aDataObject.ObjDefNode; 
			
		//generate fields to INSERT	
		XmlNodeList			aPropertiesNodeList;	
		aPropertiesNodeList	= aObjDefNode.SelectNodes("Properties/Property");
		
		//Start SQL statement
		aGeneratedINSERTScript += "INSERT INTO ";
		
		//TABLE TO INSERT INTO
		aGeneratedINSERTScript += cXMLDoc.AttributeToString(aObjDefNode, "RowSource");
		
		//New id field (if needed)
		aID = DBConn.DB_GetID(cXMLDoc.AttributeToString(aObjDefNode, "RowSource"));
		
		//Currently handles those NODES with an existing 'ColumnSource'
		foreach (XmlNode aPropertyNode in aPropertiesNodeList) {
			if(aWhereCount == 0) {
				if (cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource") != "") {
					if (cXMLDoc.AttributeToString(aPropertyNode, "IsIdentity") == "true") {
						//fields
						aTableFields += " "; 		
						aTableFields +=	cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource");
						//values
						aTableValues += " "; 		
						aTableValues +=	aID.ToString();
						aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")]=aID;
						aDataObject.IsNewDataObject = false;				
					} else {
						//fields
						aTableFields += " "; 		
						aTableFields +=	cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource");
						//values
						aTableValues += " "; 		
						//determine which type of data then apply proper '(s)
						switch(cXMLDoc.AttributeToString(aPropertyNode, "DataType")) {
							case "String":
								aTableValues +=	cDBConn.FixQuoteWithNulls(aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString());
								break;
							case "DateTime":	
								aTableValues +=	cDBConn.FixQuoteWithNulls(aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString());
								break;	
							case "Integer":
								aTableValues +=	aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString();
								break;
							case "Boolean":
								aTableValues +=	aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString();
								break;	
							case "Float":
								aTableValues +=	aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString();
								break;
						}					
					}
				}		
			aWhereCount = 1;
			} else {
				if (cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource") != "") {
					if (cXMLDoc.AttributeToString(aPropertyNode, "IsIdentity") == "true") {
						//fields
						aTableFields += " , "; 		
						aTableFields +=	cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource");
						//values
						aTableValues += " , "; 		
						aTableValues +=	aID.ToString();	
						aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")]=aID;
						aDataObject.IsNewDataObject = false;					
					} else {
						//fields
						aTableFields += " , ";
						aTableFields +=	cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource");
						//values
						aTableValues += " , "; 		
						//determine which type of data then apply proper '(s)
						switch(cXMLDoc.AttributeToString(aPropertyNode, "DataType")) {
							case "String":
								aTableValues +=	cDBConn.FixQuoteWithNulls(aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString());
								break;
							case "DateTime":	
								aTableValues +=	cDBConn.FixQuoteWithNulls(aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString());
								break;	
							case "Integer":
								aTableValues +=	cDBConn.FixNulls(aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString());
								break;
							case "Boolean":
								aTableValues +=	cDBConn.FixNulls(aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString());
								break;	
							case "Float":
								aTableValues +=	cDBConn.FixNulls(aDataObject[cXMLDoc.AttributeToString(aPropertyNode, "Key")].ToString());
								break;
						}		
					}
				}	
			}
		}	
		
		aGeneratedINSERTScript += " ( " + aTableFields + " ) VALUES ( " + aTableValues + " ) ";
		
		return aGeneratedINSERTScript;
	}
	/*-----------------------------------------------------*/

	private string GenerateStoredProcedureParameters(XmlNode aObjDefNode, XmlNode aDataObjectNode) 
	{
		string aGeneratedParameters;
		
		aGeneratedParameters = " ";
		//generate fields to INSERT	
		XmlNodeList			aFiltersNodeList;	
		aFiltersNodeList	= aDataObjectNode.SelectNodes("Filters/Argument");
		
		foreach (XmlNode aFilterNode in aFiltersNodeList) 
		{
			if (aGeneratedParameters != " ") {
				aGeneratedParameters += ", ";
			}
			if (cXMLDoc.AttributeToString(aFilterNode, "Value") != "") {
				string aPropertyKey = cXMLDoc.AttributeToString(aFilterNode, "PropertyKey");
				XmlNode aPropertyNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aPropertyKey + "']");
				string aDelimiter;
				if(aPropertyNode == null)
					aDelimiter = "";
				else {
					switch(cXMLDoc.AttributeToString(aPropertyNode, "DataType")) {
						case "String":
						case "Datetime":
						case "DateTime":
							aDelimiter = "'";
							break;
						default:
							aDelimiter = "";
							break;
					}
				}
				aGeneratedParameters += "@" + aPropertyKey + "=" + aDelimiter + cXMLDoc.AttributeToString(aFilterNode, "Value") + aDelimiter;
			}
		}

		return aGeneratedParameters;
	}
	
	
/*-----------------------------------------------------*/

	protected String GetSQLValue(String aValue, String aDataType) {
		switch(aDataType) {
			case "String":
				return "'" + aValue + "'";
			case "Integer":
			case "Double":
			case "Float":
				return aValue;
			case "Boolean":
				switch(aValue) {
					case "True":
						return "1";
					case "False":
						return "0";
				}
			return aValue;
		}
		return aValue;
	}
	
/*-----------------------------------------------------*/

	public override void ExecuteCommand(XmlNode aDataCommandNode, XmlNode aCmdDefNode) {
		int aCommandTimeout = cXMLDoc.AttributeToInt(aDataCommandNode, "CommandTimeout", -1);
		if(aCommandTimeout == -1)
			aCommandTimeout = cXMLDoc.AttributeToInt(aCmdDefNode, "CommandTimeout", -1);
		String aSQLString = GenerateCommandSQL(aDataCommandNode, aCmdDefNode);
		this.DBConn.ExecuteCommand(aSQLString, aCommandTimeout);
	}
	
/*-----------------------------------------------------*/

	protected String GenerateCommandSQL(XmlNode aDataCommandNode, XmlNode aCmdDefNode) {
		String aSPName = cXMLDoc.AttributeToString(aCmdDefNode, "Source");
		String aSQLString = "EXEC " + aSPName + " ";
		XmlNodeList aParametersList = aDataCommandNode.SelectNodes("Parameters/Argument");
		bool aFirst = true;
		foreach(XmlNode aParameterNode in aParametersList) {
			String aParameterKey = cXMLDoc.AttributeToString(aParameterNode, "ParameterKey");
			XmlNode aParameterDefNode = aCmdDefNode.SelectSingleNode("Parameters/Parameter[@Key='" + aParameterKey + "']");
			String aParameterSource = cXMLDoc.AttributeToString(aParameterDefNode, "Source");
			String aParameterType = cXMLDoc.AttributeToString(aParameterDefNode, "DataType");
			String aParameterValue = cXMLDoc.AttributeToString(aParameterNode, "Value");
			if(!aFirst)
				aSQLString += ", ";
			aSQLString += aParameterSource + " = ";
			switch(aParameterType) {
				case "String":
					aSQLString += "'" + aParameterValue + "'";
					break;
				case "Integer":
				case "Double":
					if(aParameterValue.Trim() == "")
						aSQLString += "NULL";
					else
						aSQLString += aParameterValue;
					break;
				case "DateTime":
					if(aParameterValue.Trim() == "")
						aSQLString += "NULL";
					else
						aSQLString += "'" + aParameterValue + "'";
					break;
				default:
					return "";
			}
			aFirst = false;
		} //foreach(XmlNode aParameterNode in aParametersList)
		return aSQLString;
	}
	
/*====================================================*/
} //class cDataProviderSQL


/*====================================================*/
}  //namespace Core.DataAccess.DBAccess
