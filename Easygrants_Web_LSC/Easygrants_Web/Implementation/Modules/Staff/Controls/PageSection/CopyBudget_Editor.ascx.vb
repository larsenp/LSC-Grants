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
Public MustInherit Class cCopyBudget_Editor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================
	Protected ctlDescription As cTextArea
    

	Public Sub CopyBudget(ByVal aBudgetID As String, ByVal aBudgetTypeID As String)
        Dim aBudget As cBudget
        
        aBudget = CType(DataObjectCollection()("Budget")(0), cBudget)
        ctlDescription = Ctype(Me.FindControl("ctlDescription"), cTextArea)
        
		aBudget.CopyBudget(aBudgetID, aBudgetTypeID, ctlDescription.Value)
		
        response.Redirect(request.QueryString("ReturnURL"))
  End Sub
	
'=============================================================
End Class
End Namespace