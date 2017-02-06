Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Easygrants.DataAccess.Budget

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cGrantBudgets
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================



Public Sub CopyBudget(ByVal aBudgetID As String, ByVal aBudgetTypeID As String, ByVal aDescription As String, ByVal aBudgetPeriodName As String)
		Dim aBudget As cBudget
		aBudget = CType(DataObjectCollection()("BudgetList")(0), cBudget)
		Dim aDesc As String = "Copy of " + aDescription
		aBudget.CopyBudget(aBudgetID, aBudgetTypeID, aDesc)
		CorePage.Redirect()
	End Sub

'=============================================================
End Class
End Namespace