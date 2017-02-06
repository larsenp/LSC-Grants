Imports Core.DataAccess
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public Class cReviewCycleStageEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		'Dim aReviewCycleStageID As Integer
		'aReviewCycleStageID = CType(Request.QueryString("ReviewCycleStageID"), Integer)
		'If aReviewCycleStageID < 1 Then
		'	Dim ctlName As cTextBox
		'	ctlName = CType(Me.FindControl("ctlName"), cTextBox)

			'Dim aReviewCycleID As String
			'aReviewCycleID = Request.QueryString("ReviewCycleID")
			'Dim aDO As cDataObject
			'aDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("ReviewCycle",aReviewCycleID)
			'ctlName.Value = aDO.GetPropertyString("Name","")
		'End If
	End Sub

	'ValidateListOrder
	Public Function ValidateListOrder(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim ctlListOrder As cTextBox

		ctlListOrder = CType(Me.FindControl("ctlListOrder"), cTextBox)

		If Not (IsNumeric(ctlListOrder.Value)) Then
			ValidateListOrder = False
		Else
			ValidateListOrder = True
		End If

	End Function

End Class
End Namespace
