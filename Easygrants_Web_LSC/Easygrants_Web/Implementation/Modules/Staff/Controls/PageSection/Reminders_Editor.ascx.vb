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

Imports EasyGrants.DataAccess

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cReminders_Editor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================

    Protected trCmpt As HtmlTableRow
    Protected trProject As HtmlTableRow
    Protected trTask As HtmlTableRow
    Protected trTemplateList as HtmlTableRow
    Protected tblReminderSettings as HtmlTable
    Protected tblEnabled as HtmlTable
    Protected tblName as HtmlTable
    Protected ctlProgram As cDropDown
    Protected ctlCmpt As cDropDown
    Protected ctlProject As cDropDown
	Protected ctlTask As cDropDown
    Protected ctlBeforeAfter as cRadioButtonList
    Protected ctlTargetDate as cRadioButtonList
    Protected ctlAfter as cRadioButton
    Protected ctlTemplateList as cDropDown
    Protected ctlIsEnabled as cCheckBox
    Protected ctlReminderName as cTextBox
    Protected ctlDescription as cTextArea
    Protected ctlDaysToRemind as cTextBox
    Protected valCompetition As CustomValidator
    Protected valProject As CustomValidator
    Protected valTask as CustomValidator
    Protected valEnabled as CustomValidator
    Private aDataObject As cDataObject
 '=============================================================

	Protected ReadOnly Property Reminder() As cDataObject
		Get
			If Request.QueryString("ReminderID") Is Nothing Then Return Nothing

			Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("ReminderID", _
				Request.QueryString("ReminderID"))
		End Get
	End Property
    
'-------------------------------------------------------------

	Public ReadOnly Property ProgramID() As String
		Get
			If Not Request.QueryString("ProgramID") Is Nothing Then Return Request.QueryString("ProgramID")
			
			Return ""
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property CmptID() As String
		Get
			If Not Request.QueryString("CompetitionID") Is Nothing Then Return Request.QueryString("CompetitionID")

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

	Public ReadOnly Property WfProjectTaskID() As String
		Get
			If Not Request.QueryString("WfProjectTaskID") Is Nothing Then Return Request.QueryString("WfProjectTaskID")

            Return ""
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property ReminderID() As String
		Get
			If Not Request.QueryString("ReminderID") Is Nothing Then Return Request.QueryString("ReminderID")

            Return ""
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property CompetitionID() As String
		Get
			If Not Request.QueryString("CompetitionID") Is Nothing Then Return Request.QueryString("CompetitionID")

            Return ""
		End Get
	End Property
	
'-------------------------------------------------------------

	Public ReadOnly Property Template() As String
		Get
			If Not Request.QueryString("Template") Is Nothing Then Return Request.QueryString("Template")

            Return ""
		End Get
	End Property
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		Dim aReminderDOList as cDataObjectList

		ctlProgram = CType(Me.FindControl("ctlProgram"), cDropDown)
		ctlProgram.Set_ServerIndexChange(AddressOf btnGo_Click)

		If Not ProgramID = "" Then
			Dim aDataObjectList As cDataObjectList
			Dim aDataObject As cDataObject
			Dim aItem As ListItem

			trCmpt.Visible = True

			aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Competition", "ProgramID", ProgramID)

			ctlCmpt.Items.Clear()
			aItem = New ListItem("<None>", "")
			ctlCmpt.Items.Add(aItem)

			For Each aDataObject In aDataObjectList
				aItem = New ListItem(aDataObject.GetPropertyString("CompetitionDisplayName"), aDataObject.GetPropertyString("CompetitionID"))
				ctlCmpt.Items.Add(aItem)
			Next

			ctlCmpt.Set_ServerIndexChange(AddressOf btnGo_Click)
			ctlProgram.SelectedField = ProgramID
			trProject.Visible = False
			trTask.Visible = False

			If Not CmptID = "" Then
				aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProject", "CompetitionID", CompetitionID)

				ctlProject.Items.Clear()
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
					aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", ProjectID)

					ctlTask.Items.Clear()
					aItem = New ListItem("<None>", "")
					ctlTask.Items.Add(aItem)

					For Each aDataObject In aDataObjectList
						aItem = New ListItem(aDataObject.GetPropertyString("Description"), aDataObject.GetPropertyString("WfProjectTaskID"))
						Me.ctlTask.Items.Add(aItem)
					Next

					ctlTask.Set_ServerIndexChange(AddressOf btnGo_Click)
					Me.ctlProject.SelectedField = ProjectID
					Me.ctlTask.SelectedField = WfProjectTaskID
					Me.trTask.Visible = True
				End If
				
				If Not WfProjectTaskID = "" then
					Me.tblReminderSettings.Visible = True
					Me.tblEnabled.Visible = True
					Me.tblName.Visible = True
					Me.trTemplateList.Visible = True
				End If				
			End If
		End If
				
		ctlTemplateList = CType(Me.FindControl("ctlTemplateList"), cDropDown)
		
		'Check template value
		If ReminderID <> "0" then
			If Template <> "" then
				ctlTemplateList.SelectedField = Request.QueryString("Template")
				Me.tblReminderSettings.Visible = True
				Me.tblEnabled.Visible = True
				Me.tblName.Visible = True
				Me.trTemplateList.Visible = True
			Else
				aReminderDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Reminder", "ReminderID", ReminderID)			
				ctlCmpt.SelectedField = aReminderDOList(0).GetPropertyInt("CompetitionID")
				ctlProject.SelectedField = aReminderDOList(0).GetPropertyInt("WfProjectID")
				ctlTask = CType(Me.FindControl("ctlTask"), cDropDown)
				ctlTask.SelectedField = aReminderDOList(0).GetPropertyInt("ProjectTaskID")
				If ctlTask.SelectedField <> "" then
					Me.tblReminderSettings.Visible = True
					Me.tblEnabled.Visible = True
					Me.tblName.Visible = True
					Me.trTemplateList.Visible = True
				End If	
			End If
		Else
			ctlIsEnabled = CType(FindControl("ctlIsEnabled"), cCheckBox)
			ctlIsEnabled.Value = True
		End If
	End Sub

'=============================================================

	Public Sub GoClick(ByVal aStepName As String, ByVal aValue As String)
		Dim aURL As String

		aURL = Request.RawUrl.ToString()
		
		Select Case aStepName
			Case "Program"
				aURL = cWebLib.AddQuerystringParameter(aURL, "CompetitionID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectTaskID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "ProgramID", aValue)
			Case "Cmpt"
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectTaskID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "CompetitionID", aValue)
			Case "Project"
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectTaskID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", aValue)
			Case "Task"
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectTaskID", aValue)
		End Select

		ctlTemplateList = CType(Me.FindControl("ctlTemplateList"), cDropDown)
		aURL = cWebLib.AddQuerystringParameter(aURL, "Template", ctlTemplateList.SelectedField.ToString())

		Response.Redirect(aURL)
	End Sub

'-------------------------------------------------------------

	Private Sub btnGo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Select Case CType(sender, Control).Parent.ID
			Case "ctlProgram"
				GoClick("Program", ctlProgram.SelectedValue)
			Case "ctlCmpt"
				GoClick("Cmpt", ctlCmpt.SelectedValue)
			Case "ctlProject"
				GoClick("Project", ctlProject.SelectedValue)
			Case "ctlTask"
				GoClick("Task", ctlTask.SelectedValue)
		End Select
	End Sub

'-------------------------------------------------------------

	Public Overrides Sub DataPresenter_SaveDataObjects()
        'MyBase.DataPresenter_SaveDataObjects()
        Dim aDataObjectList As cDataObjectList
		Dim aUser As cEGUser
		Dim aPerson As cPerson
		
		aUser = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser)
		aPerson = CType(Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aUser.PersonID), cPerson)
	
        ctlTask = CType(Me.FindControl("ctlTask"), cDropDown)
        
		aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Reminder", _
													"ReminderID", ReminderID, _
													"ProgramID", ProgramID, _
													"CompetitionID", CompetitionID)
			
		If ReminderID = "0" Then
			aDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Reminder")
			aDataObject("CreateDate") = date.Today
                aDataObject("CreateUser") = aUser.UserID
		Else
			aDataObject = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Reminder", ReminderID)
			aDataObject("ModifyDate") = date.Today
                aDataObject("ModifyUser") = aUser.UserID
		End If
            
               
		ctlReminderName = CType(Me.FindControl("ctlReminderName"), cTextBox)
		aDataObject("ReminderName") = ctlReminderName.Value
		ctlDescription = CType(Me.FindControl("ctlDescription"), cTextArea)
		aDataObject("Description") = ctlDescription.Value
		ctlTemplateList = CType(Me.FindControl("ctlTemplateList"), cDropDown)
		aDataObject("CorrespondenceID") = ctlTemplateList.SelectedField
		ctlProgram = CType(Me.FindControl("ctlProgram"), cDropDown)
		aDataObject("ProgramID") = ctlProgram.SelectedField
		ctlCmpt = CType(Me.FindControl("ctlCmpt"), cDropDown)
		aDataObject("CompetitionID") = ctlCmpt.SelectedField
		ctlProject = CType(Me.FindControl("ctlProject"), cDropDown)
		aDataObject("WfProjectID") = ctlProject.SelectedField
		ctlTask = CType(Me.FindControl("ctlTask"), cDropDown)
		aDataObject("ProjectTaskID") = ctlTask.SelectedField
		ctlDaysToRemind = CType(Me.FindControl("ctlDaysToRemind"), cTextBox)
		aDataObject("DaysToRemind") = ctlDaysToRemind.Value
		ctlBeforeAfter = CType(Me.FindControl("ctlBeforeAfter"), cRadioButtonList)
		aDataObject("BeforeAfterID") = ctlBeforeAfter.SelectedField
		ctlTargetDate = CType(Me.FindControl("ctlTargetDate"), cRadioButtonList)
		aDataObject("TargetDateID") = ctlTargetDate.SelectedField
		ctlIsEnabled = CType(Me.FindControl("ctlIsEnabled"), cCheckBox)
		aDataObject("IsEnabled") = ctlIsEnabled.Value			
		WebSession.DataObjectFactory.SaveDataObject(aDataObject)
		
	End Sub
	
'-----------------------------------------------------
  
    Public Sub ValidateCompetition(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		
		ctlCmpt = CType(Me.FindControl("ctlCmpt"), cDropDown)
						
		If ctlCmpt.SelectedField = "" then
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True 
		End If
						
   End Sub
   
  '-----------------------------------------------------
  
    Public Sub ValidateProject(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		
		ctlProject = CType(Me.FindControl("ctlProject"), cDropDown)
						
		If ctlProject.SelectedField = "" then
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True 
		End If
						
   End Sub 
   
  '-----------------------------------------------------
  
    Public Sub ValidateTask(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		
		ctlTask = CType(Me.FindControl("ctlTask"), cDropDown)
						
		If ctlTask.SelectedField = "" then
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True 
		End If
						
   End Sub 
  
   '-----------------------------------------------------
  
    Public Sub ValidateEnabled(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		
		ctlIsEnabled = CType(Me.FindControl("ctlIsEnabled"), cCheckBox)
						
		If ctlIsEnabled.Value = False then
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True 
		End If
						
   End Sub
   
   Public Sub DataPresenter_Save_And_Reload()
	
		Dim aReminderIDValue As String = aDataObject.GetPropertyString("ReminderID")
		MyBase.DataPresenter_Reload_After_Save("ReminderID=" + aReminderIDValue)

	End Sub
    
'=============================================================

End Class
End Namespace