Imports System.Web.UI.HtmlControls
Imports Core.DataAccess

Namespace Implementation.Modules.Application.Controls.Page
Public Class cPostPQVPA
	Inherits Easygrants_Web.Controls.Base.cWfTADataPresenterCtl

		Protected spnCharts As HtmlGenericControl

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			Dim aCwosyList As cDataObjectList = Me.DataObjectCollection("vLSCCompWftaOrgServareaYear")
			If aCwosyList.Count > 0 Then
				Dim aWfTaskID As Integer = aCwosyList(0)("WfTaskID")
				If aWfTaskID = 67 Then
					spnCharts.Visible = False
				End If
			End If
		End Sub
End Class
End Namespace
