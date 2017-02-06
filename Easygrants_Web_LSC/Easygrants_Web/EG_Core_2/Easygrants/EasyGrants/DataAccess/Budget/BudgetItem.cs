using System;
using System.Xml;
using System.Data;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;

namespace EasyGrants.DataAccess.Budget {
/*====================================================*/

	///<summary>
	///Budget item object -contains amount
	///</summary>
public class cBudgetItem : cDataObject 
{
/*====================================================*/

	public Double Amount {
		get {return GetPropertyDouble("Amount");}
	}
	
/*----------------------------------------------------*/

	public cBudgetItem(DataRow aDataObjectRow, cDataObjectList aDataObjectList):
				base(aDataObjectRow, aDataObjectList) {
	} 

/*====================================================*/

	public static Double Get_Amount(cBudgetItem aBudgetItem) {
		return aBudgetItem == null ? 0.0 : aBudgetItem.Amount;
	}
	
/*----------------------------------------------------*/

	public static Double Get_Amount(cBudgetItem aBudgetItem, Double aDefault) 
	{
		return aBudgetItem.GetPropertyInt("BudgetItemID", 0) == 0 ? aDefault : aBudgetItem.Amount;
	}
	
	/*----------------------------------------------------*/

	public void Calculate(String aType, String aPeriodID, String aPeriodValue, String aParentID, String aParentValue) 
	{
		//cDataObjectList aDataObjectList = LoadFromData(aType, aPeriodID, aPeriodValue, aParentID, aParentValue);
		
		/*
		foreach (cDataObject aDataObject in aDataObjectList) {
			if ((int)aDataObject["Calculate"] == 1) {
				mAmount += (int)aDataObject["Cost"];
			}
			else {
				Calculate(aDataObject.ToString(), "BudgetPeriodID",
					(String)aDataObject["BudgetPeriodID"], "ParentID", (String)aDataObject["BudgetCategoryID"]);
			}
			mDataObject = aDataObject;
		}
		mDataObject["Amount"] = mAmount;
		mDataObject["BudgetCategoryID"] = mDataObject["ParentID"];
		mDataObject["ParentID"] = mDataObject["Parent.ParentID"];
		mDataObject["Calculate"] = 0;
		this.DataObjectFactory.SaveDataObject(mDataObject);
		*/
	}

/*=====================================================*/
} // class cBudgetItem


/*====================================================*/
}  //namespace EasyGrants.DataAccess.Budget