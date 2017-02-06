Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public MustInherit Class cInternalReview
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

    Protected trCmpt As HtmlTableRow
    Protected trProject As HtmlTableRow
    Protected trTask As HtmlTableRow
    Protected ctlProgram As cDropDown
    Protected ctlCmpt As cDropDown
    Protected ctlProject As cDropDown
	Protected ctlTask As cDropDown
	Protected btnCmpt As cCSSButton
	Protected btnProject As cCSSButton
	Protected btnTask As cCSSButton
    
'=============================================================

	Public ReadOnly Property WfTaskID() As String
		Get
			If Not Request.QueryString("WfTaskID") Is Nothing Then Return Request.QueryString("WfTaskID")
			
			Return ""
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property CmptID() As String
		Get
			If Not Request.QueryString("CmptID") Is Nothing Then Return Request.QueryString("CmptID")

            Return ""
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property ProjectID() As String
		Get
			If Not Request.QueryString("WfProjectID") Is Nothing Then Return Request.QueryString("WfProjectID")

            Return ""
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property TaskID() As String
		Get
			If Not Request.QueryString("WfTaskID") Is Nothing Then Return Request.QueryString("WfTaskID")

            Return ""
		End Get
	End Property

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		If Not WfTaskID = "" Then
			ctlProgram = CType(Me.FindControl("ctlProgram"), cDropDown)
			ctlProgram.SelectedField = WfTaskID
		End If

	End Sub

'=============================================================

	Public Sub GoClick(ByVal aStepName As String, ByVal aValue As String)
		Dim aURL As String

		aURL = Request.Url.ToString()
		
		Select Case aStepName
			Case "Program"
				aURL = cWebLib.AddQuerystringParameter(aURL, "CmptID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", "")

				aURL = cWebLib.AddQuerystringParameter(aURL, "ProgramID", aValue)
			Case "Cmpt"
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", "")

				aURL = cWebLib.AddQuerystringParameter(aURL, "CmptID", aValue)
			Case "Project"
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", "")

				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", aValue)
			Case "Task"
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", aValue)
		End Select

		Response.Redirect(aURL)
	End Sub

'-------------------------------------------------------------

	Private Sub btnGo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Select Case CType(sender, Control).Parent.ID
			Case "btnCmpt"
				GoClick("Cmpt", ctlCmpt.SelectedValue)
			Case "btnProject"
				GoClick("Project", ctlProject.SelectedValue)
			Case "btnTask"
				GoClick("Task", ctlTask.SelectedValue)
		End Select
	End Sub

'=============================================================

End Class
End Namespace