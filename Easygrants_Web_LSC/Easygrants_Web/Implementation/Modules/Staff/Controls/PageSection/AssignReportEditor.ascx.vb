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
Imports System.Text

Namespace Easygrants_Web.Modules.Staff.Controls.PageContent
Public MustInherit Class cAssignReportEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

    'Protected trReviewer As HtmlTableRow
    Protected spnReviewer As HtmlGenericControl
    Protected trTaskRole As HtmlTableRow
    Protected trOutcome As HtmlTableRow
	Protected ctlPerson As cPopUpSelectorLauncher
    Protected ctlTask As cDropDown
    Protected ctlTaskRole As cDropDown
    Protected ctlOutcome As cDropDown
    Protected ctlStatus As cDropDown
	Protected btnTaskRole As cCSSButton
	Protected btnSave As cCSSButton
    Protected spnSave As HtmlGenericControl
    Protected lblValidationMessage as Label
    
'=============================================================
	Protected ReadOnly Property WfTaskAssignment() As cDataObject
		Get
			If Request.QueryString("WfTaskAssignmentID") Is Nothing Then Return Nothing

			return ctype(me.DataObjectCollection("WfTaskAssignment"), cDataObjectList)(0)
			'Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", _
				'Request.QueryString("WfTaskAssignmentID"))
		End Get
	End Property
'-------------------------------------------------------------
	Protected ReadOnly Property Person() As cDataObject
		Get
			If Request.QueryString("PersonID") Is Nothing Then
				Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", _
					GranteeProject.GetPropertyString("PrimaryPersonID"))
			Else
				Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", _
					Request.QueryString("PersonID"))
			End If
		End Get
	End Property
'-------------------------------------------------------------
	Protected ReadOnly Property GranteeProject() As cDataObject
		Get
			If Request.QueryString("GranteeProjectID") Is Nothing Then Return Nothing

			Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", _
				Request.QueryString("GranteeProjectID"))
		End Get
	End Property
'-------------------------------------------------------------
	Public ReadOnly Property PersonID() As String
		Get
			If Not Request.QueryString("PersonID") Is Nothing Then
				Return Request.QueryString("PersonID")
			Else
				Return ""
			End If
		End Get
	End Property
'-------------------------------------------------------------
	Public ReadOnly Property PersonLastNameFirstName() As String
		Get
			If Person Is Nothing Then Return ""

			Return Person.GetPropertyString("LastNameFirstName")
		End Get
	End Property
'-------------------------------------------------------------
	Public ReadOnly Property GranteeProjectID() As String
		Get
			If Not Request.QueryString("GranteeProjectID") Is Nothing Then
				Return Request.QueryString("GranteeProjectID")
			Else
				Return ""
			End If
		End Get
	End Property
'-------------------------------------------------------------
	Public ReadOnly Property TaskID() As String
		Get
			If Not Request.QueryString("TaskID") Is Nothing Then
				Return Request.QueryString("TaskID")
			Else
				Return ""
			End If
		End Get
	End Property
'-------------------------------------------------------------
	Public ReadOnly Property TaskRoleID() As String
		Get
			If Not Request.QueryString("TaskRoleID") Is Nothing Then Return Request.QueryString("TaskRoleID")

			If WfTaskAssignment Is Nothing Then Return ""

			Return WfTaskAssignment.GetPropertyString("WfTaskRoleID")
		End Get
	End Property
'-------------------------------------------------------------
	Public ReadOnly Property OutcomeID() As String
		Get
			If Not Request.QueryString("OutcomeID") Is Nothing Then Return Request.QueryString("OutcomeID")

			If WfTaskAssignment Is Nothing Then Return ""

			Return WfTaskAssignment.GetPropertyString("WfTaskOutcomeID")
		End Get
	End Property
'-------------------------------------------------------------
	Public ReadOnly Property StatusID() As String
		Get
			If Not Request.QueryString("StatusID") Is Nothing Then Return Request.QueryString("StatusID")

			If WfTaskAssignment Is Nothing Then Return ""

			Return WfTaskAssignment.GetPropertyString("WfTaskStatusID")
		End Get
	End Property

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		ctlStatus = CType(Me.FindControl("ctlStatus"), cDropDown)
		ctlTask = CType(Me.FindControl("ctlTask"), cDropDown)
		ctlTaskRole = CType(Me.FindControl("ctlTaskRole"), cDropDown)
		ctlPerson = CType(Me.FindControl("ctlPerson"), cPopUpSelectorLauncher)
		ctlOutcome = CType(Me.FindControl("ctlOutcome"), cDropDown)
		btnSave = CType(Me.FindControl("btnSave"), cCSSButton)
		Me.btnSave.Visible = False

		If Not TaskID = "" Then
			Dim aDataObjectList As cDataObjectList
			Dim aDataObject As cDataObject
			Dim aItem As ListItem
			Dim aReviewers As StringBuilder = New StringBuilder()

			trTaskRole.Visible = True

			aDataObject = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTask", TaskID)

			aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskRole", "TaskTypeID", aDataObject.GetPropertyString("WfTaskTypeID"))

			aItem = New ListItem("<None>", "")
			
			If Not ctlTaskRole.Items.Contains(aItem) Then
				ctlTaskRole.Items.Add(aItem)
			end if

			For Each aDataObject In aDataObjectList
					aItem = New ListItem(aDataObject.GetPropertyString("WfTaskRole"), aDataObject.GetPropertyString("WfTaskRoleID"))
					
					If Not ctlTaskRole.Items.Contains(aItem) Then
						ctlTaskRole.Items.Add(aItem)
					end if
			Next

			btnTaskRole.Set_ServerClick(AddressOf btnGo_Click)
			ctlTask.SelectedField = TaskID
			trOutcome.Visible = False

			If Not TaskRoleID = "" Then
				aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskOutcome", "WfTaskRoleID", TaskRoleID, "WfTaskID", TaskID)

				aItem = New ListItem("<None>", "")
				
				If Not ctlOutcome.Items.Contains(aItem) Then
					ctlOutcome.Items.Add(aItem)
				end if
				
				For Each aDataObject In aDataObjectList
					aItem = New ListItem(aDataObject.GetPropertyString("WfTaskOutcome"), aDataObject.GetPropertyString("WfTaskOutcomeID"))
					
					If Not ctlOutcome.Items.Contains(aItem) Then
						Me.ctlOutcome.Items.Add(aItem)
					end if
				Next

				aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
																"WfTaskID", TaskID, "WfTaskRoleID", TaskRoleID)

				'If aDataObjectList.Count <> 0 Then
				'	trReviewer.Visible = True

				'	For Each aDataObject In aDataObjectList
				'		aReviewers.Append(aDataObject.GetRelatedPropertyDataObject("Person").GetPropertyString("LastNameFirstName"))
				'		aReviewers.Append("<br>")
				'	Next

				'	spnReviewer.InnerHtml = aReviewers.ToString
				'End If

				Me.ctlTaskRole.SelectedField = TaskRoleID
				Me.ctlOutcome.SelectedField = OutcomeID
				Me.trOutcome.Visible = True
				Me.btnSave.Visible = True
			End If
		End If

	End Sub

'=============================================================

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		ctlStatus.SelectedField = StatusID
		ctlPerson.ObjName = PersonLastNameFirstName
	End Sub

'=============================================================

	Public Sub GoClick(ByVal aStepName As String, ByVal aValue As String, ByVal aStatus As String)
		Dim aURL As String
		Dim aPerson As String

		aURL = Request.RawUrl.ToString()
		aPerson = GranteeProject.GetPropertyString("PrimaryPersonID")

		Select Case aStepName
			Case "Task"
				aURL = cWebLib.AddQuerystringParameter(aURL, "TaskRoleID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "OutcomeID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "StatusID", aStatus)
				aURL = cWebLib.AddQuerystringParameter(aURL, "PersonID", aPerson)
				aURL = cWebLib.AddQuerystringParameter(aURL, "TaskID", aValue)
			Case "TaskRole"
				aURL = cWebLib.AddQuerystringParameter(aURL, "OutcomeID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "PersonID", aPerson)
				aURL = cWebLib.AddQuerystringParameter(aURL, "TaskRoleID", aValue)
		End Select

		Response.Redirect(aURL)
	End Sub

'-------------------------------------------------------------

	Private Sub btnGo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

		Select Case CType(sender, Control).Parent.ID
			Case "btnTaskRole"

				GoClick("TaskRole", ctlTaskRole.SelectedValue, "")
		End Select
	End Sub

'=============================================================

	Public Overloads Overrides Function EventController_Save() As Boolean
		Dim aValid As Boolean = True

		If ctlTask.SelectedValue = "" Then
			lblValidationMessage.Text = "Please select a task.<br>"
			aValid = False
		End If
		If ctlTaskRole.SelectedValue = "" Then
			lblValidationMessage.Text += "Please select a task role.<br>"
			aValid = False
		End If
		If ctlPerson.ObjName = "" Then
			lblValidationMessage.Text += "Please select a person.<br>"
			aValid = False
		End If
		If ctlOutcome.SelectedValue = "" Then
			lblValidationMessage.Text += "Please select an outcome.<br>"
			aValid = False
		End If
		if aValid = True Then
			dim aObj as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTask", ctlTask.SelectedValue)
			if aObj.GetPropertyInt("WfTaskTypeID") = 3 then
				dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("Budget", _
					"GranteeProjectID", me.Request.QueryString("GranteeProjectID"))
				if aList.Count = 0 then
					lblValidationMessage.Text = "There is no budget for this grant."
					aValid = False
				end if
			end if
		end if
		If aValid = False Then
			Exit Function
		End If

		MyBase.EventController_Save()
		Response.Redirect(Request.QueryString("ReturnURL"))
	End Function

'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()
		Dim aDataObjectList As cDataObjectList
		Dim aDataObject As cDataObject

		aDataObject = WfTaskAssignment
		If ctlTask.SelectedValue = 5 Then 'ECT Renewal application task
			If Request.QueryString("WfTaskAssignmentID") = "0" Then 'Add new task
				Dim aGranteeProject As cDataObject
				Dim aUser As cEGUser

				aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
				'Create new GranteeProject
				aGranteeProject = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProject")
				aGranteeProject("AppGranteeProjectID") = GranteeProject("GranteeProjectID")
				aGranteeProject("GranteeID") = GranteeProject("GranteeID")
				aGranteeProject("WfProjectID") = GranteeProject("WfProjectID")
				aGranteeProject("PrimaryPersonID") = GranteeProject("PrimaryPersonID")
				aGranteeProject("PrimaryOrganizationID") = GranteeProject("PrimaryOrganizationID")
				aGranteeProject("PrimaryAddressID") = GranteeProject("PrimaryAddressID")
				aGranteeProject("GrantTitle") = GranteeProject("GrantTitle")
				aGranteeProject("ShortTitle") = GranteeProject("ShortTitle")
				aGranteeProject("GrantStatusID") = GranteeProject("GrantStatusID")
				aGranteeProject("OtherOrganization") = GranteeProject("OtherOrganization")
				aGranteeProject("GrantNumber") = GranteeProject("GrantNumber")
				aGranteeProject("CreateDate") = Date.Today
                    aGranteeProject("CreateUser") = aUser.UserID
				WebSession.DataObjectFactory.SaveDataObject(aGranteeProject)

				'Assign new GranteeProjectID to WFTA
				'aDataObject("GranteeProjectID") = aGranteeProject("GranteeProjectID")
			End If
		End If

		If ctlPerson.ObjID <> "" Then
			aDataObject("PersonID") = ctlPerson.ObjID
		Else
			aDataObject("PersonID") = PersonID
		End If
		aDataObject("WfTaskID") = ctlTask.SelectedValue
		aDataObject("WfTaskRoleID") = ctlTaskRole.SelectedValue
		aDataObject("WfTaskOutcomeID") = ctlOutcome.SelectedValue
		aDataObject("WfTaskStatusID") = ctlStatus.SelectedValue
		WebSession.DataObjectFactory.SaveDataObject(aDataObject)

	End Sub

'=============================================================

End Class
End Namespace