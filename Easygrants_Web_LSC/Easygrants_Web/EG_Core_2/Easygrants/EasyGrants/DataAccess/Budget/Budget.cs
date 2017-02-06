using System;
using System.Xml;
using System.Data;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;

namespace EasyGrants.DataAccess.Budget {
/*====================================================*/

///<summary>
///Budget data object - contains budget period list
///</summary>
public class cBudget : cDataObject 
{
/*====================================================*/

	public cBudget(DataRow aDataObjectRow, cDataObjectList aDataObjectList):

				base(aDataObjectRow, aDataObjectList) {
	} 

/*====================================================*/
	///<summary>
	///gets budget period from ID, if aCreateNew=true creates new period
	///</summary>
	public cBudgetPeriod Get_BudgetPeriod(String aBudgetPeriodID, bool aCreateNew) 
	{
		cXMLDoc aXmlDoc;
		XmlNode aDataObjectNode, aFiltersNode, aArgNode;
		cDataObjectList		aDataObjectList;
        cBudgetPeriod aBudgetPeriod;
        
		aXmlDoc = this.DataObjectFactory.CreateDataObjectNode("BudgetPeriod", out aDataObjectNode, out aFiltersNode);
		aArgNode = aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
												"BudgetPeriodID", aBudgetPeriodID));
        
        aDataObjectList = DataObjectFactory.GetDataObjectList(aDataObjectNode);
		
		if (aDataObjectList != null && aDataObjectList.Count > 0)
			return (cBudgetPeriod)aDataObjectList[0];
		else {
			//new BudgetItem
			if (!aCreateNew) return null;
			
			aBudgetPeriod = (cBudgetPeriod)DataObjectFactory.CreateNewDataObjectFromKey("BudgetPeriod");
			aBudgetPeriod["BudgetID"] = this["BudgetID"];
			return aBudgetPeriod;
		}
	}
	
/*----------------------------------------------------*/
	///<summary>
	///assigns budget period id
	///</summary>
	public void VDate_BudgetPeriod(cBudgetPeriod aBudgetPeriod) 
	{
		aBudgetPeriod["BudgetID"] = this["BudgetID"];
	}

/*----------------------------------------------------*/
	///<summary>
	///saves budget period to database
	///</summary>
	public void Save_BudgetPeriod(cBudgetPeriod aBudgetPeriod) 
	{
		VDate_BudgetPeriod(aBudgetPeriod);
		
		this.DataObjectFactory.SaveDataObject(aBudgetPeriod);
	}
	
/*----------------------------------------------------*/

	public void CopyBudget(String aBudgetID, String aBudgetTypeID, String aDescription) {
		cDataObjectList aBudgetList;
		cDataObject aNewBudget;
		
		aBudgetList = this.DataObjectFactory.GetDataObjectListWithFilter("Budget", "BudgetID", aBudgetID);
		aNewBudget = this.DataObjectFactory.CreateNewDataObjectFromKey("Budget");
		aNewBudget["GranteeProjectID"] = aBudgetList[0]["GranteeProjectID"];
		aNewBudget["BudgetTypeID"] = aBudgetTypeID;
		aNewBudget["Total"] = aBudgetList[0]["Total"];
		aNewBudget["Description"] = aDescription;
		aNewBudget["InitialBudgetTotal"] = aBudgetList[0]["InitialBudgetTotal"];
		aNewBudget["InitialBudgetDescription"] = aBudgetList[0]["InitialBudgetDescription"];
		aNewBudget["CreateUser"] = aBudgetList[0]["CreateUser"];
		aNewBudget["ModifyUser"] = aBudgetList[0]["ModifyUser"];
		aNewBudget["CreateDate"] = aBudgetList[0]["CreateDate"];
		aNewBudget["ModifyDate"] = aBudgetList[0]["ModifyDate"];
		aNewBudget["GrantAgreement"] = aBudgetList[0]["GrantAgreement"];
		aNewBudget["Notes"] = aBudgetList[0]["Notes"];
		aNewBudget["EntityID"] = aBudgetList[0]["EntityID"];
		aNewBudget["EntityTypeID"] = aBudgetList[0]["EntityTypeID"];
		
		this.DataObjectFactory.SaveDataObject(aNewBudget);
		CopyBudgetPeriod(aBudgetList[0].GetPropertyString("BudgetID"), aNewBudget.GetPropertyString("BudgetID"));
	}
	
/*----------------------------------------------------*/

	public void CopyBudgetPeriod(String aBudgetID, String aNewBudgetID) {
		cDataObjectList aBudgetPeriodList;
		cDataObject aNewBudgetPeriod;
		
		aBudgetPeriodList = this.DataObjectFactory.GetDataObjectListWithFilter("BudgetPeriod", "BudgetID", aBudgetID);

        foreach (cDataObject aBudgetPeriod in aBudgetPeriodList)
        {
            aNewBudgetPeriod = this.DataObjectFactory.CreateNewDataObjectFromKey("BudgetPeriod");
            aNewBudgetPeriod["BudgetID"] = aNewBudgetID;
            if (aNewBudgetPeriod.HasProperty("BudgetPeriodNameID")) {
                aNewBudgetPeriod["BudgetPeriodNameID"] = aBudgetPeriod["BudgetPeriodNameID"];
            }
            if (aNewBudgetPeriod.HasProperty("BudgetPeriodName")) {
                aNewBudgetPeriod["BudgetPeriodName"] = aBudgetPeriod["BudgetPeriodName"];
            }
            if (aNewBudgetPeriod.HasProperty("BudgetPeriodDescription")) {
                aNewBudgetPeriod["BudgetPeriodDescription"] = aBudgetPeriod["BudgetPeriodDescription"];
            }
            if (aNewBudgetPeriod.HasProperty("BudgetYear")) {
                aNewBudgetPeriod["BudgetYear"] = aBudgetPeriod["BudgetYear"];
            }
            if (aNewBudgetPeriod.HasProperty("BudgetPeriodDescriptionID")) {
                aNewBudgetPeriod["BudgetPeriodDescriptionID"] = aBudgetPeriod["BudgetPeriodDescriptionID"];
            }
			aNewBudgetPeriod["CarryoverCost"] = aBudgetPeriod["CarryoverCost"];
			//Below which are commented, we are not using these fields anymore
			//aNewBudgetPeriod["TotalSalary"] = aBudgetPeriod["TotalSalary"];
			//aNewBudgetPeriod["TotalMaterials"] = aBudgetPeriod["TotalMaterials"];
			//aNewBudgetPeriod["TotalEquipment"] = aBudgetPeriod["TotalEquipment"];
			//aNewBudgetPeriod["TotalTravel"] = aBudgetPeriod["TotalTravel"];
			//aNewBudgetPeriod["TotalOther"] = aBudgetPeriod["TotalOther"];
			aNewBudgetPeriod["IndirectCosts"] = aBudgetPeriod["IndirectCosts"];
			aNewBudgetPeriod["GrandTotal"] = aBudgetPeriod["GrandTotal"];
			aNewBudgetPeriod["Note"] = aBudgetPeriod["Note"];
			aNewBudgetPeriod["StartDate"] = aBudgetPeriod["StartDate"];
			aNewBudgetPeriod["EndDate"] = aBudgetPeriod["EndDate"];
			aNewBudgetPeriod["Total"] = aBudgetPeriod["Total"];

            this.DataObjectFactory.SaveDataObject(aNewBudgetPeriod);
            CopyBudgetItem(aBudgetPeriod.GetPropertyString("BudgetPeriodID"), aNewBudgetPeriod.GetPropertyString("BudgetPeriodID"));
        }
	}
	
/*----------------------------------------------------*/

	public void CopyBudgetItem(String aBudgetPeriodID, String aNewBudgetPeriodID) {
		cDataObjectList aBudgetItemList;
		cDataObject aNewBudgetItem;
		
		aBudgetItemList = this.DataObjectFactory.GetDataObjectListWithFilter("BudgetItem", "BudgetPeriodID", aBudgetPeriodID);
		
		foreach (cDataObject aBudgetItem in aBudgetItemList) {
			aNewBudgetItem = this.DataObjectFactory.CreateNewDataObjectFromKey("BudgetItem");
			aNewBudgetItem["BudgetPeriodID"] = aNewBudgetPeriodID;
			aNewBudgetItem["BudgetCategoryID"] = aBudgetItem["BudgetCategoryID"];
			aNewBudgetItem["Amount"] = aBudgetItem["Amount"];
			aNewBudgetItem["GranteeProjectID"] = aBudgetItem["GranteeProjectID"];
			aNewBudgetItem["NoOfUnits"] = aBudgetItem["NoOfUnits"];
			aNewBudgetItem["UnitCost"] = aBudgetItem["UnitCost"];
			aNewBudgetItem["Description"] = aBudgetItem["Description"];
			aNewBudgetItem["Notes"] = aBudgetItem["Notes"];
			aNewBudgetItem["CategoryTypeID"] = aBudgetItem["CategoryTypeID"];
			aNewBudgetItem["CreateDate"] = aBudgetItem["CreateDate"];
			aNewBudgetItem["ModifyDate"] = aBudgetItem["ModifyDate"];
			aNewBudgetItem["CreateUser"] = aBudgetItem["CreateUser"];
			aNewBudgetItem["ModifyUser"] = aBudgetItem["ModifyUser"];
			
			this.DataObjectFactory.SaveDataObject(aNewBudgetItem);
		}
	}
	
/*----------------------------------------------------*/

	public void UpdateBudgetTotal() {
		cDataObjectList aBudgetPeriodsList;
		//cDataObject aBudgetPeriod;
		double aTotal = 0.0;
		
		aBudgetPeriodsList = this.DataObjectFactory.GetDataObjectListWithFilter("BudgetPeriod", "BudgetID", this.GetPropertyString("BudgetID"));
		foreach (cDataObject aBudgetPeriod in aBudgetPeriodsList) {
			aTotal += aBudgetPeriod.GetPropertyDouble("Total");
		}
		this["Total"] = aTotal;
		//this.DataObjectFactory.SaveDataObject(this);
		this.SaveData();
	}

	/*----------------------------------------------------*/

	public void UpdateBudgetTotal(String aCategoryTypeID) 
	{
		double aTotal = 0.0;
		cDataObject aInfo;
		
		cDataObjectList aList = this.DataObjectFactory.GetDataObjectListWithFilter("BudgetCategory", 
			"CategoryTypeID", aCategoryTypeID, "ParentID", "-1");
			
		if (aList.Count > 0)
		{
			cDataObjectList aItemList = this.DataObjectFactory.GetDataObjectListWithFilter("BudgetItem",
				"GranteeProjectID", this.GetPropertyString("GranteeProjectID"),
				"BudgetCategoryID", aList[0].GetPropertyString("BudgetCategoryID"));
				
			foreach  (cDataObject aObj in aItemList)
			{
				aTotal += aObj.GetPropertyDouble("Amount");
			}
		}
		aList = this.DataObjectFactory.GetDataObjectListWithFilter("BudgetCategoryInfo",
			"BudgetID", this.GetPropertyString("BudgetID"), "CategoryTypeID", aCategoryTypeID);
		
		if (aList.Count == 0)
		{
			aInfo = this.DataObjectFactory.CreateNewDataObjectFromKey("BudgetCategoryInfo");
			aInfo["BudgetID"] = this.GetPropertyString("BudgetID");
			aInfo["CategoryTypeID"] = aCategoryTypeID;
		}
		else
			aInfo = aList[0];
			
		aInfo["Total"] = aTotal;
		aInfo["ModifyDate"] = System.DateTime.Now.ToString();
		aInfo["GranteeProjectID"] = this.GetPropertyString("GranteeProjectID");
		this.DataObjectFactory.SaveDataObject(aInfo);
	}

	/*=====================================================*/
} // class cBudget


/*====================================================*/
}  //namespace EasyGrants.DataAccess