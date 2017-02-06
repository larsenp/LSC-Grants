Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.DataAccess
Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core.Web.Modules
Imports EasyGrants.Web.User


Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration


Public MustInherit Class cUploadProjectTask
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected tbUploadList As HtmlTable
	Protected trCmpt As HtmlTableRow
	Protected trProject As HtmlTableRow
	Protected trTask As HtmlTableRow
	Protected ctlProgram As cDropDown
	Protected ctlCmpt As cDropDown
	Protected ctlProject As cDropDown
	Protected ctlTask As cDropDown


	Dim ctlList As cDataListCtl
	Dim aList As Hashtable
'=============================================================

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
			trTask.Visible = False
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
					aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", ProjectID)

					aItem = New ListItem("<None>", "")
					ctlTask.Items.Add(aItem)

					For Each aDataObject In aDataObjectList
						aItem = New ListItem(aDataObject.GetPropertyString("Description"), aDataObject.GetPropertyString("WfTaskID"))
						Me.ctlTask.Items.Add(aItem)
					Next

					ctlTask.Set_ServerIndexChange(AddressOf btnGo_Click)
					Me.ctlProject.SelectedField = ProjectID
					Me.ctlTask.SelectedField = TaskID
					Me.trTask.Visible = True

					If Not TaskID = "" Then
						Me.tbUploadList.Visible = True
					End If

				End If
			End If
		End If
			'If Request.QueryString("WfTaskID") <> "" Then
			'	btnCopy.Visible = True
			'	btnCopy.Set_ServerClick(AddressOf btnCopy_Click)
			'Else
			'	btnCopy.Visible = False
			'End If
	End Sub

'=============================================================

	Public Sub GoClick(ByVal aStepName As String, ByVal aValue As String)
		Dim aURL As String
		Dim aDataObjectList As cDataObjectList
		Dim aDataObject As cDataObject

		aURL = Request.Url.ToString()

		Select Case aStepName
			Case "Program"
				aURL = cWebLib.AddQuerystringParameter(aURL, "CmptID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectTaskID", "")

				aURL = cWebLib.AddQuerystringParameter(aURL, "ProgramID", aValue)
			Case "Cmpt"
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectTaskID", "")

				aURL = cWebLib.AddQuerystringParameter(aURL, "CmptID", aValue)
			Case "Project"
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectTaskID", "")

				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", aValue)
			Case "Task"
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", aValue)

				If aValue <> "" Then
					aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", ProjectID, "WfTaskID", aValue)
					aDataObject = aDataObjectList(0)
					aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectTaskID", aDataObject.GetPropertyString("WfProjectTaskID"))
				Else
					aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectTaskID", "")
				End If
		End Select

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


	'Public Overrides Sub DataPresenter_SaveDataObjects()
	'	'MyBase.DataPresenter_SaveDataObjects()
	'	Dim aUploadDOList As cDataObjectList
	'	Dim aWfProjectTaskUploadList As cDataObjectList

	'	Dim aOptionsHash As Hashtable
	'	Dim aUploadDO As cDataObject
	'	Dim aWfProjectTaskUploadDO As cDataObject
	'	Dim UploadID As Integer
	'	Dim aOptionsList As cDropDown
	'	Dim aVal As String

	'	aUploadDOList = CType(DataObjectCollection("List"), cDataObjectList)
	'	ctlList = FindControl("ctlDataList")
	'	aOptionsHash = ctlList.DataListCtl_GetControlCollection("ctlUploadRequiredType")

	'	If aUploadDOList.Count > 0 Then
	'		For Each aUploadDO In aUploadDOList
	'			UploadID = aUploadDO.GetPropertyInt("UploadID")
	'			aOptionsList = CType(aOptionsHash(UploadID), cDropDown)

	'			aWfProjectTaskUploadList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskUpload", "WfProjectTaskID", Request.QueryString("WfProjectTaskID"), "UploadId", CStr(UploadID))
	'			If aOptionsList.SelectedValue <> "" Then
	'				If aWfProjectTaskUploadList.Count > 0 Then
	'					aWfProjectTaskUploadDO = aWfProjectTaskUploadList(0)
	'					aWfProjectTaskUploadDO("IsRequired") = aOptionsList.SelectedValue
	'					WebSession.DataObjectFactory.SaveDataObject(aWfProjectTaskUploadDO)
	'				Else
	'					aWfProjectTaskUploadDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTaskUpload")
	'					aWfProjectTaskUploadDO("WfProjectTaskID") = Request.QueryString("WfProjectTaskID")
	'					aWfProjectTaskUploadDO("UploadID") = UploadID
	'					aWfProjectTaskUploadDO("IsRequired") = aOptionsList.SelectedValue
	'					WebSession.DataObjectFactory.SaveDataObject(aWfProjectTaskUploadDO)
	'				End If
	'			Else
	'				aWfProjectTaskUploadDO = aWfProjectTaskUploadList(0)
	'				WebSession.DataObjectFactory.DeleteData(aWfProjectTaskUploadDO)
	'			End If
	'		Next
	'	End If
	'End Sub

	'Public Overrides Sub CoreCtl_SetValues()
	'	MyBase.CoreCtl_SetValues()

	'	Dim aDataObjectList As cDataObjectList
	'	Dim aDataObject As cDataObject
	'	Dim ID As Integer
	'	Dim IsRequired As Integer


	'	Dim aUploadDOList As cDataObjectList
	'	Dim aOptionsHash As Hashtable
	'	Dim aUploadDO As cDataObject
	'	Dim UploadID As Integer
	'	Dim aOptionsList As cDropDown


	'	aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskUpload", "WfProjectTaskID", Request.QueryString("WfProjectTaskID"))

	'	aUploadDOList = CType(DataObjectCollection("List"), cDataObjectList)
	'	ctlList = FindControl("ctlDataList")
	'	aOptionsHash = ctlList.DataListCtl_GetControlCollection("ctlUploadRequiredType")

	'	For Each aDataObject In aDataObjectList
	'		ID = aDataObject.GetPropertyString("UploadId")
	'		IsRequired = aDataObject.GetPropertyString("IsRequired")
	'		If aUploadDOList.Count > 0 Then
	'			For Each aUploadDO In aUploadDOList
	'				UploadID = aUploadDO.GetPropertyInt("UploadID")
	'				aOptionsList = CType(aOptionsHash(UploadID), cDropDown)
	'				If UploadID = ID Then
	'					aOptionsList.SelectedField = IsRequired
	'				End If
	'			Next
	'		End If
	'	Next
	'End Sub

End Class

End Namespace