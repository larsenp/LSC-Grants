Imports Core.DataAccess
'Imports EasyGrants.Web.User
Imports EasyGrants.DataAccess.Budget

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cGPBudget
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()

		Dim aBudgetPeriod As cDataObject
		aBudgetPeriod = Me.DataObjectCollection("BudgetPeriod")(0)
		aBudgetPeriod("Total") = aBudgetPeriod.GetPropertyDouble("TotalSalary") _
								+ aBudgetPeriod.GetPropertyDouble("TotalMaterials") _
								+ aBudgetPeriod.GetPropertyDouble("TotalEquipment") _
								+ aBudgetPeriod.GetPropertyDouble("TotalTravel") _
								+ aBudgetPeriod.GetPropertyDouble("TotalOther") _
								+ aBudgetPeriod.GetPropertyDouble("IndirectCosts")
		WebSession.DataObjectFactory.SaveDataObject(aBudgetPeriod)
		
		Dim aBudget As cBudget
		aBudget = Me.DataObjectCollection("Budget")(0)
		aBudget.UpdateBudgetTotal()
		
	End Sub

'=============================================================
End Class
End Namespace