Imports Core_Web.Controls.Base
Imports Core.Web
Imports Core.DataAccess
Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Web.User
Imports Core.Web.Modules



Namespace Implementation.Modules.Home.Controls.Page

Public MustInherit Class cCopyExistTaskContent
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

'Protected ctlCopyToProgram As cDropDown
'Protected ctlCopyToFO As cDropDown
'Protected ctlCopyToFC As cDropDown
'Protected spnCopyToTask As HtmlGenericControl
'Protected trCopyToFO As HtmlTableRow
'Protected trCopyToFC As HtmlTableRow
'Protected trCopyToTask As HtmlTableRow
Protected ctlCopyToTask as cDropDown

 Public ReadOnly Property ProgramID() As String
			Get
				If Not Request.QueryString("ProgramID") Is Nothing Then Return Request.QueryString("ProgramID")

				Return ""
			End Get
		End Property

  Public ReadOnly Property CmptID() As String
			Get
				If Not Request.QueryString("CmptID") Is Nothing Then Return Request.QueryString("CmptID")

				Return ""
			End Get
		End Property

 Public ReadOnly Property ProjectID() As String
			Get
				If Not Request.QueryString("WfProjectID") Is Nothing Then Return Request.QueryString("WfProjectID")

				Return ""
			End Get
		End Property

        Public ReadOnly Property WfTaskID() As String
			Get
				If Not Request.QueryString("WfTaskID") Is Nothing Then Return Request.QueryString("WfTaskID")

				Return ""
			End Get
		End Property


Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
			MyBase.CoreCtl_Load(sender, e)
			'ctlCopyToProgram = CType(Me.FindControl("ctlCopyToProgram"), cDropDown)
			'ctlCopyToFO = CType(Me.FindControl("ctlCopyToFO"), cDropDown)
			'ctlCopyToFC = CType(Me.FindControl("ctlCopyToFC"), cDropDown)

            ctlCopyToTask = CType(Me.FindControl("ctlCopyToTask"), cDropDown)

			'If Not WfTaskID = "" Then
			'	Dim aDataObjectList As cDataObjectList
			'	'Dim aDataObject As cDataObject
			'	Dim aItem As ListItem
			'	'trCopyToFO.Visible = True
			'	aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTask", "WfTaskID", WfTaskID)
			'	'ctlCopyToFO.Items.Clear()
			'	aItem = New ListItem("<Select>", "")
			'	'ctlCopyToFO.Items.Add(aItem)

   '             'For Each aDataObject In aDataObjectList
			'	'	aItem = New ListItem(aDataObject.GetPropertyString("CompetitionDisplayName"), aDataObject.GetPropertyString("CompetitionID"))
			'	'	ctlCopyToFO.Items.Add(aItem)
			'	'Next

			'	'For Each aDataObject In aDataObjectList
			'	'	aItem = New ListItem(aDataObject.GetPropertyString("CompetitionDisplayName"), aDataObject.GetPropertyString("CompetitionID"))
			'	'	ctlCopyToFO.Items.Add(aItem)
			'	'Next

			'	'ctlCopyToFO.Attributes.Add("PostBack", "True")
			'	'ctlCopyToFO.Set_ServerIndexChange(AddressOf ctlDropDown_IndexChange)
			'	'ctlCopyToProgram.SelectedField = ProgramID

			'	'If Not CmptID = "" Then
			'	'	aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProject", "CompetitionID", CmptID)
			'	'	'ctlCopyToFC.Items.Clear()
			'	'	aItem = New ListItem("<Select>", "")
			'	'	'ctlCopyToFC.Items.Add(aItem)

			'	'	For Each aDataObject In aDataObjectList
			'	'		aItem = New ListItem(aDataObject.GetPropertyString("WfProjectName"), aDataObject.GetPropertyString("WfProjectID"))
			'	'		Me.ctlCopyToFC.Items.Add(aItem)
			'	'	Next

			'	'	ctlCopyToFC.Attributes.Add("PostBack", "True")
			'	'	ctlCopyToFC.Set_ServerIndexChange(AddressOf ctlDropDown_IndexChange)
			'	'	'ctlCopyToFO.SelectedField = CmptID
			'	'	'trCopyToFC.Visible = True
			'	'End If

			'	'If Not ProjectID = "" Then
			'		'ctlCopyToFC.SelectedField = ProjectID

			'		Dim aWfTaDO As cDataObject = Me.DataObjectCollection("WfTaskAssignment")(0)
			'		Dim aWfTaskID As Integer = aWfTaDO.GetPropertyInt("WfTaskID", 0)
			'		'trCopyToTask.Visible = True
			'		If aWfTaskID <> 0 Then
			'			aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", ProjectID, "WfTaskID", aWfTaskID)
			'			If aDataObjectList.Count > 0 Then
			'				'spnCopyToTask.InnerText = aWfTaDO.GetRelatedPropertyString("WfTask.WfTaskAbbr")
			'			Else
			'				'spnCopyToTask.InnerHtml = "<font color='red'>The Copy feature is not available for this task.</font>"
			'			End If
			'		End If
			'	'End If

			'End If

End Sub

        Public Sub GoClick(ByVal aStepName As String, ByVal aValue As String)
			Dim aURL As String

			aURL = Request.Url.ToString()
			Select Case aStepName
				'Case "Program"
				'	aURL = cWebLib.RemoveQuerystringParameter(aURL, "ReturnURL")
				'	aURL = cWebLib.AddQuerystringParameter(aURL, "CmptID", "")
				'	aURL = cWebLib.AddQuerystringParameter(aURL, "ProgramID", aValue)
				'Case "Cmpt"
				'	aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", "")
				'	aURL = cWebLib.AddQuerystringParameter(aURL, "CmptID", aValue)
				'Case "Project"
				'	aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", aValue)
                Case "ExistingWfTaskAssignment"
                    aURL = cWebLib.RemoveQuerystringParameter(aURL, "ReturnURL")
                    aURL = cWebLib.AddQuerystringParameter(aURL, "ExistingWfTaskAssignmentID", aValue)
			End Select
			'Dim aReturnURL As String = Request.QueryString("ReturnURL")
			'aURL = cWebLib.AddQuerystringParameter(aURL, "ReturnURL", aReturnURL, Server)

			Response.Redirect(aURL)
		End Sub

  '      Private Sub ctlDropDown_IndexChange(ByVal sender As System.Object, ByVal e As System.EventArgs)
		'	Select Case CType(sender, Control).Parent.ID
		'		'Case "ctlCopyToFO"
		'			'GoClick("Cmpt", ctlCopyToFO.SelectedValue)
		'		'Case "ctlCopyToFC"
		'		'	GoClick("Project", ctlCopyToFC.SelectedValue)
  '              Case "ctlCopyToTask"
  '                  GoClick("WfTask", ctlCopyToTask.SelectedValue)
		'	End Select
		'End Sub


End Class


End Namespace
