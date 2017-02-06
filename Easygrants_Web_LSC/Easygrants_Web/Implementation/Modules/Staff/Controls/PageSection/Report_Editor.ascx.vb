Imports Core_Web.Controls.Base
Imports Core.DataAccess
Imports System.Web.UI

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection

Public MustInherit Class cReport_Editor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	
	Protected ctlPer As cPopUpSelectorLauncher2
	Protected spnTaskStart As HtmlGenericControl
	Protected spnTaskEnd As HtmlGenericControl
	Protected spnTaskClose As HtmlGenericControl
	Protected spnTaskOpen As HtmlGenericControl
	Protected spnTaskDue As HtmlGenericControl
	Protected ctlWorkflowTask As cDropDown
	Protected spnWorkflowTask As HtmlGenericControl

	Public ReadOnly Property ReportID() As String
		Get
			If Not Request.QueryString("WfTaskAssignmentID") Is Nothing Then
				Return Request.QueryString("WfTaskAssignmentID")
			Else
				Return ""
			End If
		End Get
	End Property

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		'btnSave = CType(Me.FindControl("btnSave"), cCSSButton)
		'Me.btnSave.Visible = False
		ctlWorkflowTask = CType(Me.FindControl("ctlWorkflowTask"), cDropDown)
		ctlWorkflowTask.Set_ServerIndexChange(AddressOf ctlDropDown_IndexChange)
		If ReportID = "0" Or ReportID = "" Then
			Dim aGranteeProjectDO As cDataObject
			aGranteeProjectDO = Me.DataObjectCollection("GranteeProject")(0)
			ctlPer.ObjName = aGranteeProjectDO.GetRelatedPropertyString("PrimaryPerson.LastNameFirstNamePrimInst")
			ctlPer.ObjID = aGranteeProjectDO.GetPropertyString("PrimaryPersonID")
		End If

	End Sub

	Private Sub ctlDropDown_IndexChange(ByVal sender As System.Object, ByVal e As System.EventArgs)

		'Dim aItem As ListItem
		'Dim aObj As cDataObject

		ctlWorkflowTask = CType(Me.FindControl("ctlWorkflowTask"), cDropDown)
		If ctlWorkflowTask.SelectedValue <> "" Then
			PopulateFundingCycleTaskDate()
		End If
		Page.SetFocus(spnWorkflowTask)
		
	End Sub

	Private Sub PopulateFundingCycleTaskDate()
		Dim aGranteeProject As cDataObject = Me.DataObjectCollection("GranteeProject")(0)
		Dim aWfProjectId As Integer = aGranteeProject.GetPropertyString("WfProjectID")
		If ctlWorkflowTask.SelectedValue <> "" Then
			Dim aWfProjectTaskDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", aWfProjectId, "WfTaskID", ctlWorkflowTask.SelectedValue)(0)
			spnTaskStart.InnerHtml = Format(aWfProjectTaskDO.GetPropertyDateTime("StartDate"), "MM/dd/yyyy")
			spnTaskEnd.InnerHtml = Format(aWfProjectTaskDO.GetPropertyDateTime("EndDate"), "MM/dd/yyyy")
			spnTaskClose.InnerHtml = Format(aWfProjectTaskDO.GetPropertyDateTime("CloseDate"), "MM/dd/yyyy")
			spnTaskDue.InnerHtml = Format(aWfProjectTaskDO.GetPropertyDateTime("DueDate"), "MM/dd/yyyy")
			spnTaskOpen.InnerHtml = Format(aWfProjectTaskDO.GetPropertyDateTime("OpenDate"), "MM/dd/yyyy")
		End If
	End Sub

	Public Overrides Sub DataPresenter_SaveDataObjects()
	
		MyBase.DataPresenter_SaveDataObjects()
		Dim aWftaDo As cDataObject = Me.DataObjectCollection("WfTaskAssignment")(0)
		aWftaDo("WfTaskRoleID") = aWftaDo.GetRelatedPropertyInt("WfTask.WfTaskModule.WfTaskRoleID")
		Dim aGranteeProject As cDataObject = Me.DataObjectCollection("GranteeProject")(0)
		Dim aWfProjectId As Integer = aGranteeProject.GetPropertyString("WfProjectID")
		Dim aWfProjectTaskDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", aWfProjectId, "WfTaskID", ctlWorkflowTask.SelectedValue)(0)
		If Not aWfProjectTaskDO Is Nothing Then
			If aWftaDo("StartDate") Is System.DBNull.Value AndAlso Not aWfProjectTaskDO("StartDate") Is System.DBNull.Value Then
				aWftaDo("StartDate") = aWfProjectTaskDO.GetPropertyString("StartDate")
			End If
			If aWftaDo("EndDate") Is System.DBNull.Value AndAlso Not aWfProjectTaskDO("EndDate") Is System.DBNull.Value Then
				aWftaDo("EndDate") = aWfProjectTaskDO.GetPropertyString("EndDate")
			End If
			If aWftaDo("CloseDate") Is System.DBNull.Value AndAlso Not aWfProjectTaskDO("CloseDate") Is System.DBNull.Value Then
				aWftaDo("CloseDate") = aWfProjectTaskDO.GetPropertyString("CloseDate")
			End If
			If aWftaDo("DueDate") Is System.DBNull.Value AndAlso Not aWfProjectTaskDO("DueDate") Is System.DBNull.Value Then
				aWftaDo("DueDate") = aWfProjectTaskDO.GetPropertyString("DueDate")
			End If
			If aWftaDo("OpenDate") Is System.DBNull.Value AndAlso Not aWfProjectTaskDO("OpenDate") Is System.DBNull.Value Then
				aWftaDo("OpenDate") = aWfProjectTaskDO.GetPropertyString("OpenDate")
			End If
		End If
		Me.WebSession.DataObjectFactory.SaveDataObject(aWftaDo)
		
	End Sub

End Class
End Namespace