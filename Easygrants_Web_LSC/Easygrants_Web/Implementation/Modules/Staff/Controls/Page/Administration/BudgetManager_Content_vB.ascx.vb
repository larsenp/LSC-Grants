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

Namespace Easygrants_Web.Modules.Staff.Controls.Page

Public MustInherit Class cBudgetManager_Content_vB
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected tbUploadList As HtmlTable
	Protected trCmpt As HtmlTableRow
	Protected trProject As HtmlTableRow

	Protected ctlProgram As cDropDown
	Protected ctlCmpt As cDropDown
	Protected ctlProject As cDropDown

		Public ReadOnly Property ProgramID() As String
		Get
			If Not Request.QueryString("ProgramID") Is Nothing Then Return Request.QueryString("ProgramID")

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


	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		tbUploadList.Visible = False
		ctlProgram = CType(Me.FindControl("ctlProgram"), cDropDown)
		ctlProgram.Set_ServerIndexChange(AddressOf btnGo_Click)

		If Not ProgramID = "" Then
			Dim aDataObjectList As cDataObjectList
			Dim aDataObject As cDataObject
			Dim aItem As ListItem

			trCmpt.Visible = True

			aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Competition", "ProgramID", ProgramID)

			aItem = New ListItem("<None>", "")
			ctlCmpt.Items.Add(aItem)

			For Each aDataObject In aDataObjectList
				aItem = New ListItem(aDataObject.GetPropertyString("CompetitionDisplayName"), aDataObject.GetPropertyString("CompetitionID"))
				ctlCmpt.Items.Add(aItem)
			Next

			ctlCmpt.Set_ServerIndexChange(AddressOf btnGo_Click)
			ctlProgram.SelectedField = ProgramID
			trProject.Visible = False
			tbUploadList.Visible = False

			If Not CmptID = "" Then
				aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProject", "CompetitionID", CmptID)

				aItem = New ListItem("<None>", "")
				ctlProject.Items.Add(aItem)

				For Each aDataObject In aDataObjectList
					aItem = New ListItem(aDataObject.GetPropertyString("WfProjectName"), aDataObject.GetPropertyString("WfProjectID"))
					Me.ctlProject.Items.Add(aItem)
				Next

				ctlProject.Set_ServerIndexChange(AddressOf btnGo_Click)
				Me.ctlCmpt.SelectedField = CmptID
				Me.trProject.Visible = True

				If Not ProjectID = "" Then
					Me.ctlProject.SelectedField = ProjectID
					Me.tbUploadList.Visible = True
				End If
			End If
		End If

	End Sub

	Private Sub btnGo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Select Case CType(sender, Control).Parent.ID
			Case "ctlProgram"
				GoClick("Program", ctlProgram.SelectedValue)
			Case "ctlCmpt"
				GoClick("Cmpt", ctlCmpt.SelectedValue)
			Case "ctlProject"
				GoClick("Project", ctlProject.SelectedValue)
		End Select
	End Sub

		Public Sub GoClick(ByVal aStepName As String, ByVal aValue As String)
		Dim aURL As String

		aURL = Request.Url.ToString()

		Select Case aStepName
			Case "Program"
				aURL = cWebLib.AddQuerystringParameter(aURL, "CmptID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", "")

				aURL = cWebLib.AddQuerystringParameter(aURL, "ProgramID", aValue)
			Case "Cmpt"
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", "")

				aURL = cWebLib.AddQuerystringParameter(aURL, "CmptID", aValue)
			Case "Project"
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", aValue)
		End Select
		Response.Redirect(aURL)
	End Sub
	


End Class

End Namespace