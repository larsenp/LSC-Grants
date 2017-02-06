Imports System.Web.UI.HtmlControls
Imports Core.DataAccess

Namespace Implementation.Modules.TIG_Application.Forms

Public Class cBudgetNarrative
	Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

	Protected divContracts As HtmlGenericControl

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aTigContracts As cDataObjectList = DataObjectCollection("LscTigBudgetItemContracts")
		If aTigContracts.Count = 0 Then
			divContracts.Visible = False
		End If
	End Sub

End Class

End Namespace