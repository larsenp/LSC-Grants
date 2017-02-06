Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports Easygrants.DataAccess.Budget

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cNewBudget_Editor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'=============================================================

	Protected ctlDescription As cTextBox
    
'=============================================================

	Public Sub CopyBudget(ByVal aBudgetID As String, ByVal aBudgetTypeID As String)
        Dim aBudget As cBudget
        
        aBudget = CType(DataObjectCollection()("Budget")(0), cBudget)
        ctlDescription = Ctype(Me.FindControl("ctlDescription"), cTextBox)
        
		aBudget.CopyBudget(aBudgetID, aBudgetTypeID, ctlDescription.Value)
		
        EventController_NavigateToModulePageKey("Finance", "GranteeProjectID=" + aBudget.GetPropertyString("GranteeProjectID"))
        
  End Sub
	
'=============================================================
End Class
End Namespace