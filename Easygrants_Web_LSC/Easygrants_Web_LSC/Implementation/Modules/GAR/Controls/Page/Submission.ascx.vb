Imports System.Web.UI.HtmlControls
Imports Core.DataAccess

Namespace Implementation.Modules.GAR.Controls.Page
Public Class cSubmission
	Inherits EasyGrants.Modules.Application.Controls.Page.cSubmissionContent

	Protected parPVInstr As HtmlGenericControl
	Protected trPrintableView As HtmlTableRow

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		'Hide printable view for Form L
		Dim aWfTAList As cDataObjectList = DataObjectCollection("WfTaskAssignment")
		If aWfTAList.Count > 0 Then
			Dim aWfTA As cDataObject = aWfTAList(0)
			If aWfTA.GetPropertyInt("WfTaskID") = 18 Then
				parPVInstr.Visible = False
				trPrintableView.Visible = False
			End If
		End If
	End Sub
End Class
End Namespace