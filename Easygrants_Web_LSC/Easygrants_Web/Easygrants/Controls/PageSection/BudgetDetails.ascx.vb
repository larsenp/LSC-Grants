Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web
Imports System.web.UI.HtmlControls

Namespace Easygrants_Web.Controls.PageSection
Public Class cBudgetDetails
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'============================================================= 

		
		Protected TdBudgetDetailsItemsList As HtmlTable
		Private mBudgetPeriodDO As cBudgetPeriod
		 '=============================================================

	Public ReadOnly Property BudgetPeriodID() As String
		Get
			If Not Request.QueryString("BudgetPeriodID") Is Nothing Then
				Return Request.QueryString("BudgetPeriodID")
			Else
				Return "0"
			End If
		End Get
	End Property
	Public ReadOnly Property ReturnURL() As String
		Get
			If Not Request.QueryString("ReturnURL") Is Nothing Then
				Return Request.QueryString("ReturnURL")
			Else
				Return ""
			End If
		End Get
	End Property

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aBudgetDo As cDataObject = Me.DataObjectCollection("Budget")(0)
			If aBudgetDo.GetPropertyInt("BudgetID", 0) > 0 Then
			TdBudgetDetailsItemsList.Visible = True
		Else
			TdBudgetDetailsItemsList.Visible = False
		End If

		If BudgetPeriodID = "0" Then
			mBudgetPeriodDO = Me.DataObjectCollection("BudgetPeriod")(0)
			If Not mBudgetPeriodDO Is Nothing Then
				EventController_NavigateToModulePageKey("BudgetDetails", "BudgetID=" + BudgetID.ToString(), "GranteeProjectID=" + GranteeProjectID.ToString(), "BudgetPeriodID=" + mBudgetPeriodDO.GetPropertyString("BudgetPeriodID", "-1"), "ReturnURL=" + ReturnURL.ToString)
			End If
		End If
	End Sub

'=============================================================

	

'=============================================================
	End Class 'cAddressEditor
End Namespace