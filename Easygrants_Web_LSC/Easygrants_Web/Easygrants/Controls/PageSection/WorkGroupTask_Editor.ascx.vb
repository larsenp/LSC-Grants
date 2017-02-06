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

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cWorkGroupTask_Editor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

    Protected trTask As HtmlTableRow
    Protected ctlProject As cDropDown
    Protected ctlTask As cDropDown
    Protected ctlDescription As cTextBox
	Protected btnTask As cCSSButton
	Protected btnSave As cCSSButton
    Protected spnSave As HtmlGenericControl
    
'=============================================================

	Protected ReadOnly Property WorkGroupTaskList() As cDataObject
		Get
			If Request.QueryString("WorkGroupTaskListID") Is Nothing Then Return Nothing

			Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WorkGroupTaskList", _
				Request.QueryString("WorkGroupTaskListID"))
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property ProjectID() As String
		Get
			If Not Request.QueryString("ProjectID") Is Nothing Then Return Request.QueryString("ProjectID")

                If WorkGroupTaskList Is Nothing Then Return ""

                Return WorkGroupTaskList.GetPropertyString("WfProjectID")
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property TaskID() As String
		Get
			If Not Request.QueryString("TaskID") Is Nothing Then Return Request.QueryString("TaskID")

                If WorkGroupTaskList Is Nothing Then Return ""

                Return WorkGroupTaskList.GetPropertyString("WfTaskID")
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property OutcomeID() As String
		Get
			If Not Request.QueryString("OutcomeID") Is Nothing Then Return Request.QueryString("OutcomeID")

                If WorkGroupTaskList Is Nothing Then Return ""

                Return WorkGroupTaskList.GetPropertyString("WfOutcomeID")
		End Get
	End Property

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		btnSave = CType(Me.FindControl("btnSave"), cCSSButton)
		Me.btnSave.Visible = False
		
		If Not ProjectID = "" Then
			Dim aDataObjectList As cDataObjectList
			Dim aDataObject As cDataObject
			Dim aItem As ListItem

			trTask.Visible = True

			aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", ProjectID)
			
			ctlTask.Items.Clear()
			aItem = New ListItem("<None>", "")
            ctlTask.Items.Add(aItem)
            
			For Each aDataObject In aDataObjectList
				'aItem = New ListItem(aDataObject.GetPropertyString("WfTask"), aDataObject.GetPropertyString("WfTaskID"))
				aItem = New ListItem(aDataObject.GetRelatedPropertyString("WfTask.WfTask"), aDataObject.GetPropertyString("WfTaskID"))
				ctlTask.Items.Add(aItem)
			Next

			btnTask.Set_ServerClick(AddressOf btnGo_Click)
			btnTask.CausesValidation = False
			ctlProject = CType(Me.FindControl("ctlProject"), cDropDown)
			ctlProject.SelectedField = ProjectID
			
			If Not TaskID = "" Then
				Me.ctlTask.SelectedField = TaskID
				Me.btnSave.Visible = True
			End If
		End If

	End Sub

'=============================================================

	Public Sub GoClick(ByVal aStepName As String, ByVal aValue As String)
		Dim aURL As String

		aURL = Request.Url.ToString()

		Select Case aStepName
			Case "Project"
				aURL = cWebLib.AddQuerystringParameter(aURL, "TaskID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "OutcomeID", "")

				aURL = cWebLib.AddQuerystringParameter(aURL, "ProjectID", aValue)
			Case "Task"
				aURL = cWebLib.AddQuerystringParameter(aURL, "OutcomeID", "")

				aURL = cWebLib.AddQuerystringParameter(aURL, "TaskID", aValue)
		End Select

		Response.Redirect(aURL)
	End Sub

'-------------------------------------------------------------

	Private Sub btnGo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Select Case CType(sender, Control).Parent.ID
			Case "btnTask"
				GoClick("Task", ctlTask.SelectedValue)
		End Select
	End Sub

'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
		'myBase.DataPresenter_SaveDataObjects()
		Dim aDataObjectList As cDataObjectList

        aDataObjectList = DataObjectCollection("WorkGroupTaskList")
		aDataObjectList(0)("WorkGroupID") = Request.QueryString("WorkGroupID")
		ctlDescription = CType(Me.FindControl("ctlDescription"), cTextBox)
		aDataObjectList(0)("Description") = ctlDescription.Value
		ctlProject = CType(Me.FindControl("ctlProject"), cDropDown)
		aDataObjectList(0)("WfProjectID") = CType(ctlProject.SelectedValue, Integer)
		aDataObjectList(0)("WfTaskID") = CType(ctlTask.SelectedValue, Integer)
            aDataObjectList(0)("WfStatusID") = 1
		WebSession.DataObjectFactory.SaveDataObject(aDataObjectList(0))
	End Sub
	
'=============================================================

End Class
End Namespace