Imports System.Web.UI.HtmlControls
Imports Core.DataAccess

Namespace Implementation.Modules.Application.Controls.PageSection
Public Class cPolicyBoardStructureEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected trNewApplicant As HtmlTableRow

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			DisplayNoBylawsCheckBox()
		End Sub

		Public Sub DisplayNoBylawsCheckBox()
			Dim aList As cDataObjectList = DataObjectCollection("vLSCCompWftaOrgServareaYear")
			If aList.Count > 0 Then
				Dim aDO As cDataObject = aList(0)
				If aDO("WfTaskID") <> 2 Then
					trNewApplicant.Visible = False
				End If
			End If
		End Sub


End Class
End Namespace
