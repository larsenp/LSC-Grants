using System;
using System.Xml;
using System.Data;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;

namespace EasyGrants.DataAccess.Budget {
/*====================================================*/

	///<summary>
	///Budget period data object - contains tree of budget items
	///</summary>
public class cBudgetPeriod : cDataObject 
{
/*====================================================*/

	public int  ProjectID {
		get {return this.GetRelatedPropertyInt("Budget.GranteeProject.WfProjectID");}
	}
	
/*----------------------------------------------------*/

	public int  BudgetPeriodID {
		get {return this.GetPropertyInt("BudgetPeriodID");}
	}
	
/*----------------------------------------------------*/

	public cBudgetPeriod(DataRow aDataObjectRow, cDataObjectList aDataObjectList):

				base(aDataObjectRow, aDataObjectList) {
	} 

/*====================================================*/

	public cDataObjectList Get_TopLevel_Categories() {
		cXMLDoc aXmlDoc;
		XmlNode aDataObjectNode, aFiltersNode, aArgNode;

		aXmlDoc = this.DataObjectFactory.CreateDataObjectNode("BudgetCategory", out aDataObjectNode, out aFiltersNode);
        aArgNode = aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
												"ProjectID", ProjectID.ToString()));
        aArgNode = aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
												"ParentID", 0.ToString(), "And"));
		
		return this.DataObjectFactory.GetDataObjectList(aDataObjectNode);
	}
	
/*----------------------------------------------------*/

	public cDataObjectList Get_TopLevel_Categories(string aCategoryTypeID) 
	{
		cXMLDoc aXmlDoc;
		XmlNode aDataObjectNode, aFiltersNode, aArgNode;

		aXmlDoc = this.DataObjectFactory.CreateDataObjectNode("BudgetCategory", out aDataObjectNode, out aFiltersNode);
		aArgNode = aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
			"ProjectID", ProjectID.ToString()));
		aArgNode = aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
			"ParentID", "-1", "And"));
		aArgNode = aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
			"CategoryTypeID", aCategoryTypeID, "And"));
		
		return this.DataObjectFactory.GetDataObjectList(aDataObjectNode);
	}
	
	/*----------------------------------------------------*/
	///<summary>
	///returns list of budget item subcategories based on parentID 
	///</summary>
	public cDataObjectList Get_Categories(string aParentID) 
	{
		cXMLDoc aXmlDoc;
		XmlNode aDataObjectNode, aFiltersNode, aArgNode;

		aXmlDoc = this.DataObjectFactory.CreateDataObjectNode("BudgetCategory", out aDataObjectNode, out aFiltersNode);
        aArgNode = aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
												"ProjectID", ProjectID.ToString()));
        aArgNode = aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
												"ParentID", aParentID, "And"));
		
		return this.DataObjectFactory.GetDataObjectList(aDataObjectNode);
	}
	
/*----------------------------------------------------*/
	///<summary>
	///returns budget item category
	///</summary>
	public cDataObject Get_Category(String aBudgetCategoryID) 
	{
		cXMLDoc aXmlDoc;
		XmlNode aDataObjectNode, aFiltersNode, aArgNode;

		aXmlDoc = this.DataObjectFactory.CreateDataObjectNode("BudgetCategory", out aDataObjectNode, out aFiltersNode);
        aArgNode = aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
												"ProjectID", ProjectID.ToString()));
        aArgNode = aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
												"BudgetCategoryID", aBudgetCategoryID.ToString(), "And"));
		
		return this.DataObjectFactory.GetDataObjectList(aDataObjectNode)[0];
	}
	
/*----------------------------------------------------*/

	public cBudgetItem Get_BudgetItem(String aCategoryID, bool aCreateNew) {
		cXMLDoc aXmlDoc;
		XmlNode aDataObjectNode, aFiltersNode, aArgNode;
		cDataObjectList		aDataObjectList;
        cBudgetItem aBudgetItem;
        
		aXmlDoc = this.DataObjectFactory.CreateDataObjectNode("BudgetItem", out aDataObjectNode, out aFiltersNode);
		aArgNode = aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
												"BudgetPeriodID", BudgetPeriodID.ToString()));
        aArgNode = aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
												"BudgetCategoryID", aCategoryID, "And"));
		
		aDataObjectList = DataObjectFactory.GetDataObjectList(aDataObjectNode);
		
		if (aDataObjectList != null && aDataObjectList.Count > 0)
			return (cBudgetItem)aDataObjectList[0];
		else {
			//new BudgetItem
			if (!aCreateNew) return null;
			
			aBudgetItem = (cBudgetItem)DataObjectFactory.CreateNewDataObjectFromKey("BudgetItem");
			aBudgetItem["BudgetCategoryID"] = aCategoryID;
			return aBudgetItem;
		}
	}
	/*----------------------------------------------------*/

	public cDataObject Get_BudgetItemExpense(String aCategoryID, bool aCreateNew, int aTaskID) 
	{
		cXMLDoc aXmlDoc;
		XmlNode aDataObjectNode, aFiltersNode, aArgNode;
		cDataObjectList		aDataObjectList;
		cDataObject aBudgetItem;
        
		aXmlDoc = this.DataObjectFactory.CreateDataObjectNode("BudgetItemExpense", out aDataObjectNode, out aFiltersNode);
		aArgNode = aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
			"BudgetItemID", Get_BudgetItem(aCategoryID, true).GetPropertyString("BudgetItemID")));
		aArgNode = aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
			"TaskID", aTaskID.ToString(), "And"));
		
		aDataObjectList = DataObjectFactory.GetDataObjectList(aDataObjectNode);
		
		if (aDataObjectList != null && aDataObjectList.Count > 0)
			return aDataObjectList[0];
		else 
		{
			//new BudgetItem
			if (!aCreateNew) return null;
			
			aBudgetItem = DataObjectFactory.CreateNewDataObjectFromKey("BudgetItemExpense");
			aBudgetItem["BudgetItemID"] = Get_BudgetItem(aCategoryID, true).GetPropertyString("BudgetItemID");
			aBudgetItem["TaskID"] = aTaskID;
			return aBudgetItem;
		}
	}

/*----------------------------------------------------*/

	public cBudgetItem Get_BudgetItem(String aCategoryID) {
		return Get_BudgetItem(aCategoryID, false);
	}

	
/*----------------------------------------------------*/

	public cBudgetItem Get_BudgetItem(String aCategoryID, String aNew) {
		cBudgetItem aBudgetItem;
		aBudgetItem = (cBudgetItem)DataObjectFactory.CreateNewDataObjectFromKey("BudgetItem");
		aBudgetItem["BudgetCategoryID"] = aCategoryID;
		return aBudgetItem;
	}

/*----------------------------------------------------*/

	public void Save_BudgetItem(cBudgetItem aBudgetItem) {
		this.DataObjectFactory.SaveDataObject(aBudgetItem);
		//this.DataObjectFactory.DeleteData()
	}
	
/*----------------------------------------------------*/

	public void Delete_BudgetItem(cBudgetItem aBudgetItem) {
		this.DataObjectFactory.DeleteData(aBudgetItem);
	}
	
/*----------------------------------------------------*/

	public Double Get_BudgetItem_Amount(String aCategoryID) {
		cBudgetItem		aBudgetItem;
		
		aBudgetItem = Get_BudgetItem(aCategoryID);
		return aBudgetItem == null ? 0.0 : aBudgetItem.Amount;
	}
	
/*----------------------------------------------------*/
	///<summary>
	///recursively calculates budget for category list and subitems
	///</summary>
	public double CalculateBudgetCategory(cDataObjectList aBudgetCategoryList, int aGranteeProjectID) 
	{
		cBudgetItem aBudgetItem;
		double anAmount = 0.0;
		
		if (aBudgetCategoryList.Count == 0)
			return anAmount;
		
		foreach (cDataObject aBudgetCategory in aBudgetCategoryList) {
			if (aBudgetCategory.GetPropertyBool("HasChild") == true) {
				anAmount += CalculateBudgetCategory((cDataObjectList)aBudgetCategory.GetRelatedPropertyValue("Children"), aGranteeProjectID);
			}
			else {
				anAmount += this.Get_BudgetItem_Amount(aBudgetCategory["BudgetCategoryID"].ToString());
			}
		}
		aBudgetItem = this.Get_BudgetItem(aBudgetCategoryList[0]["ParentID"].ToString(), true);
		aBudgetItem["Amount"] = anAmount;
		aBudgetItem["BudgetPeriodID"] = this["BudgetPeriodID"];
		aBudgetItem["BudgetCategoryID"] = aBudgetCategoryList[0]["ParentID"];
		aBudgetItem["GranteeProjectID"] = aGranteeProjectID;
		
		if (aBudgetItem.HasProperty("CategoryTypeID") && aBudgetCategoryList[0].HasProperty("CategoryTypeID"))
			aBudgetItem["CategoryTypeID"] = aBudgetCategoryList[0].GetPropertyString("CategoryTypeID");
		
//		if (aBudgetCategoryList[0]["ParentID"].ToString() != "0" && anAmount != 0)
//			this.DataObjectFactory.SaveDataObject(aBudgetItem);
		if (aBudgetCategoryList[0]["ParentID"].ToString() != "0")
			this.DataObjectFactory.SaveDataObject(aBudgetItem);

		if (aBudgetCategoryList[0]["ParentID"].ToString() == "0") {
			this["Total"] = anAmount;
			this.DataObjectFactory.SaveDataObject(this);
		}
		return anAmount;
	}
	
/*----------------------------------------------------*/
	public double[] CalculateBudgetExpenseCategory(cDataObjectList aBudgetCategoryList, int aGranteeProjectID, int aTaskID) 
	{
		cDataObject aBudgetItem;
		double[] anAmount = new double[2] {0.0, 0.0};
		
		if (aBudgetCategoryList.Count == 0)
			return anAmount;
		
		foreach (cDataObject aBudgetCategory in aBudgetCategoryList) 
		{
			if (aBudgetCategory.GetPropertyBool("HasChild") == true) 
			{
				anAmount[0] += CalculateBudgetExpenseCategory((cDataObjectList)aBudgetCategory.GetRelatedPropertyValue("Children"), aGranteeProjectID, aTaskID)[0];
				anAmount[1] += CalculateBudgetExpenseCategory((cDataObjectList)aBudgetCategory.GetRelatedPropertyValue("Children"), aGranteeProjectID, aTaskID)[1];
			}
			else 
			{
				aBudgetItem = this.Get_BudgetItemExpense(aBudgetCategory["BudgetCategoryID"].ToString(), false, aTaskID);
				if (aBudgetItem != null)
				{
					anAmount[0] += aBudgetItem.GetPropertyDouble("Expense", 0);
					anAmount[1] += aBudgetItem.GetPropertyDouble("ExpenseNext", 0);
				}
			}
		}
		aBudgetItem = this.Get_BudgetItemExpense(aBudgetCategoryList[0]["ParentID"].ToString(), true, aTaskID);
		aBudgetItem["BudgetItemID"] = this.Get_BudgetItem(aBudgetCategoryList[0]["ParentID"].ToString(), true).GetPropertyString("BudgetItemID");
		aBudgetItem["Expense"] = anAmount[0];
		aBudgetItem["ExpenseNext"] = anAmount[1];
		aBudgetItem["BudgetPeriodID"] = this["BudgetPeriodID"];
		aBudgetItem["BudgetCategoryID"] = aBudgetCategoryList[0]["ParentID"];
		aBudgetItem["GranteeProjectID"] = aGranteeProjectID;
		aBudgetItem["TaskID"] = aTaskID;
		
		//		if (aBudgetCategoryList[0]["ParentID"].ToString() != "0" && anAmount != 0)
		//			this.DataObjectFactory.SaveDataObject(aBudgetItem);
		if (aBudgetCategoryList[0]["ParentID"].ToString() != "0")
			this.DataObjectFactory.SaveDataObject(aBudgetItem);

//		if (aBudgetCategoryList[0]["ParentID"].ToString() == "0") 
//		{
//			this["Total"] = anAmount;
//			this.DataObjectFactory.SaveDataObject(this);
//		}
		return anAmount;
	}

	public double CalBudgetExpenseCategory(cDataObjectList aBudgetCategoryList, int aGranteeProjectID, int aTaskID)
	{
		cDataObject aBudgetItem;
		double anAmount = 0.0;
		double budgetAmount = 0.0;
		if (aBudgetCategoryList.Count == 0)
			return anAmount;

		foreach (cDataObject aBudgetCategory in aBudgetCategoryList)
		{
			if (aBudgetCategory.GetPropertyBool("HasChild") == true)
			{
				anAmount += CalBudgetExpenseCategory((cDataObjectList)aBudgetCategory.GetRelatedPropertyValue("Children"), aGranteeProjectID, aTaskID);
			}
			else
			{
				aBudgetItem = this.Get_BudgetItemExpense(aBudgetCategory["BudgetCategoryID"].ToString(), false, aTaskID);
				if (aBudgetItem != null)
				{
					anAmount += aBudgetItem.GetPropertyDouble("Expense", 0);
				}
			}
		}
		aBudgetItem = this.Get_BudgetItemExpense(aBudgetCategoryList[0]["ParentID"].ToString(), true, aTaskID);
		aBudgetItem["BudgetItemID"] = this.Get_BudgetItem(aBudgetCategoryList[0]["ParentID"].ToString(), true).GetPropertyString("BudgetItemID");
		aBudgetItem["Expense"] = anAmount;
		//aBudgetItem["BudgetPeriodID"] = this["BudgetPeriodID"];
		//aBudgetItem["BudgetCategoryID"] = aBudgetCategoryList[0]["ParentID"];
		budgetAmount = this.Get_BudgetItem(aBudgetCategoryList[0]["ParentID"].ToString(), true).GetPropertyDouble("Amount");
		aBudgetItem["Balance"] = budgetAmount - anAmount;
		if (budgetAmount > 0)
			aBudgetItem["CarryOver"] = ((budgetAmount - anAmount)/budgetAmount) * 100;
			
		aBudgetItem["GranteeProjectID"] = aGranteeProjectID;
		aBudgetItem["TaskID"] = aTaskID;

		//		if (aBudgetCategoryList[0]["ParentID"].ToString() != "0" && anAmount != 0)
		//			this.DataObjectFactory.SaveDataObject(aBudgetItem);
		if (aBudgetCategoryList[0]["ParentID"].ToString() != "0")
			this.DataObjectFactory.SaveDataObject(aBudgetItem);

		//		if (aBudgetCategoryList[0]["ParentID"].ToString() == "0") 
		//		{
		//			this["Total"] = anAmount;
		//			this.DataObjectFactory.SaveDataObject(this);
		//		}
		return anAmount;
	}
	
	/*----------------------------------------------------*/

	public double CalculateBudget(cDataObjectList aTopLevelBudgetCategoryList) 
	{
		double	aBPAmount;

		cBudget aBudget;
		aBudget = (cBudget) this.DataObjectFactory.GetDataObjectFromPrimaryKey("Budget",this.GetPropertyInt("BudgetID"));

		aBPAmount = CalculateBudgetCategory(aTopLevelBudgetCategoryList, aBudget.GetPropertyInt("GranteeProjectID"));
		/*
			store aBPAmount in this BudgetPeriod
		*/
		return aBPAmount;
	}
	
/*----------------------------------------------------*/

	public double CalculateBudget() {
		return CalculateBudget(Get_TopLevel_Categories());
	}
	
/*=====================================================*/
} // class cBudgetPeriod


/*====================================================*/
}  //namespace EasyGrants.DataAccess.Budget