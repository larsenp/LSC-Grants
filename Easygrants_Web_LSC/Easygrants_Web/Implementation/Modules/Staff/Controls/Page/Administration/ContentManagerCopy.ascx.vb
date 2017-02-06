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

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration
	Public MustInherit Class cContentManagerCopy
		Inherits Core_Web.Controls.Base.cDataPresenterCtl
		'=============================================================
		Protected trCmpt As HtmlTableRow
		Protected trProject As HtmlTableRow
		Protected trTask As HtmlTableRow
		Protected ctlProject As cDropDown
		Protected ctlTask As cDropDown
		Protected ctlProgram As cDropDown
		Protected ctlCmpt As cDropDown
		Protected btnSave As cCSSButton
		Protected spnNoResultsMessage As HtmlControl
		'Protected btnProject As cCSSButton

		'=============================================================

		Public ReadOnly Property ProgramID() As String
			Get
				If Not Request.QueryString("ProgramID") Is Nothing Then Return Request.QueryString("ProgramID")

				Return ""
			End Get
		End Property

		Public ReadOnly Property ProgramIDCopyTo() As String
			Get
				If Not Request.QueryString("ProgramIDCopyTo") Is Nothing Then Return Request.QueryString("ProgramIDCopyTo")

				Return ""
			End Get
		End Property

		Public ReadOnly Property CmptID() As String
			Get
				If Not Request.QueryString("CmptID") Is Nothing Then Return Request.QueryString("CmptID")

				Return ""
			End Get
		End Property

		Public ReadOnly Property CmptIDCopyTo() As String
			Get
				If Not Request.QueryString("CmptIDCopyTo") Is Nothing Then Return Request.QueryString("CmptIDCopyTo")

				Return ""
			End Get
		End Property


		Public ReadOnly Property ProjectID() As String
			Get
				If Not Request.QueryString("WfProjectID") Is Nothing Then Return Request.QueryString("WfProjectID")

				Return ""
			End Get
		End Property

		Public ReadOnly Property ProjectIDCopyTo() As String
			Get
				If Not Request.QueryString("WfProjectIDCopyTo") Is Nothing Then Return Request.QueryString("WfProjectIDCopyTo")

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

		Public ReadOnly Property WfProjectTask() As cDataObject
			Get
				Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", WfProjectTaskID)
			End Get
		End Property

		'-------------------------------------------------------------

		Public ReadOnly Property TaskID() As String
			Get
				If Not Request.QueryString("WfTaskID") Is Nothing Then Return Request.QueryString("WfTaskID")

				If WfProjectTask Is Nothing Then Return ""

				Return WfProjectTask.GetPropertyString("WfTaskID")
			End Get
		End Property

		Public ReadOnly Property TaskIDCopyTo() As String
			Get
				If Not Request.QueryString("WfTaskIDCopyTo") Is Nothing Then Return Request.QueryString("WfTaskIDCopyTo")

				If WfProjectTask Is Nothing Then Return ""

				Return WfProjectTask.GetPropertyString("WfTaskIDCopyTo")
			End Get
		End Property

		'=============================================================

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)

			btnSave = CType(Me.FindControl("btnSave"), cCSSButton)
			Me.btnSave.Visible = False

			ctlProgram = CType(Me.FindControl("ctlProgram"), cDropDown)
			ctlProgram.Set_ServerIndexChange(AddressOf btnGo_Click)

			If Not ProgramIDCopyTo = "" Then
				Dim aDataObjectList As cDataObjectList
				Dim aDataObject As cDataObject
				Dim aItem As ListItem

				trCmpt.Visible = True

				aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Competition", "ProgramID", ProgramIDCopyTo)

				aItem = New ListItem("<None>", "")
				If Not ctlCmpt.Items.Contains(aItem) Then
					ctlCmpt.Items.Add(aItem)
				End If
				

				For Each aDataObject In aDataObjectList
					aItem = New ListItem(aDataObject.GetPropertyString("CompetitionDisplayName"), aDataObject.GetPropertyString("CompetitionID"))
					If Not ctlCmpt.Items.Contains(aItem) Then
						ctlCmpt.Items.Add(aItem)
					End If
				Next

				ctlCmpt.Set_ServerIndexChange(AddressOf btnGo_Click)
				ctlProgram.SelectedField = ProgramIDCopyTo
				trProject.Visible = False
				trTask.Visible = False

				If Not CmptIDCopyTo = "" Then
					aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProject", "CompetitionID", CmptIDCopyTo)

					aItem = New ListItem("<None>", "")
					If Not ctlProject.Items.Contains(aItem) Then
						ctlProject.Items.Add(aItem)
					End If
					

					For Each aDataObject In aDataObjectList
						aItem = New ListItem(aDataObject.GetPropertyString("WfProjectName"), aDataObject.GetPropertyString("WfProjectID"))
						If Not ctlProject.Items.Contains(aItem) Then
							ctlProject.Items.Add(aItem)
						End If
					Next

					ctlProject.Set_ServerIndexChange(AddressOf btnGo_Click)
					Me.ctlCmpt.SelectedField = CmptIDCopyTo
					Me.trProject.Visible = True

					If Not ProjectIDCopyTo = "" Then
						aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", ProjectIDCopyTo)

						aItem = New ListItem("<None>", "")
						If Not ctlTask.Items.Contains(aItem) Then
							ctlTask.Items.Add(aItem)
						End If

						For Each aDataObject In aDataObjectList
							aItem = New ListItem(aDataObject.GetPropertyString("Description"), aDataObject.GetPropertyString("WfTaskID"))
							If Not ctlTask.Items.Contains(aItem) Then
								ctlTask.Items.Add(aItem)
							End If
						Next

						ctlTask.Set_ServerIndexChange(AddressOf btnGo_Click)
						Me.ctlProject.SelectedField = ProjectIDCopyTo
						Me.ctlTask.SelectedField = TaskIDCopyTo
						Me.trTask.Visible = True
					End If
				End If
			End If
			If Request.QueryString("WfTaskIDCopyTo") <> "" Then
				btnSave.Visible = True
			End If
		End Sub

		'=============================================================

		Public Sub GoClick(ByVal aStepName As String, ByVal aValue As String)
			Dim aURL As String

			aURL = Request.Url.ToString()

			Select Case aStepName
				Case "Program"
					aURL = cWebLib.AddQuerystringParameter(aURL, "CmptIDCopyTo", "")
					aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectIDCopyTo", "")
					aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskIDCopyTo", "")

					aURL = cWebLib.AddQuerystringParameter(aURL, "ProgramIDCopyTo", aValue)
				Case "Cmpt"
					aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectIDCopyTo", "")
					aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskIDCopyTo", "")

					aURL = cWebLib.AddQuerystringParameter(aURL, "CmptIDCopyTo", aValue)
				Case "Project"
					aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskIDCopyTo", "")

					aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectIDCopyTo", aValue)
				Case "Task"
					aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskIDCopyTo", aValue)
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
		Public Sub CopyContent()
			If Request.QueryString("WfTaskID") = ctlTask.SelectedValue Then
				Dim aXmlDoc As cXMLDoc
				Dim aDataObjectNode, aFiltersNode As XmlNode
				aDataObjectNode = Nothing
				aFiltersNode = Nothing
				aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("CopyContent", aDataObjectNode, aFiltersNode)
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SourceProjectID", Request.QueryString("WfProjectID")))
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SourceTaskID", Request.QueryString("WfTaskID")))
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "TargetProjectID", Request.QueryString("WfProjectIDCopyTo")))
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "TargetTaskID", ctlTask.SelectedValue))
				WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

				Dim aWfProjectTaskDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", ctlProject.SelectedValue, "WfTaskID", ctlTask.SelectedValue)(0)
				Dim aWfProjectTaskIDCopyTo As String = ""
				If Not aWfProjectTaskDO Is Nothing Then
					aWfProjectTaskIDCopyTo = aWfProjectTaskDO("WfProjectTaskID")
				End If
				EventController_NavigateToModulePageKey("ContentManager", "ProgramID=" + ctlProgram.SelectedValue, "CmptID=" + ctlCmpt.SelectedValue, "WfProjectID=" + ctlProject.SelectedValue, "WfTaskID=" + ctlTask.SelectedValue)
			Else
				spnNoResultsMessage.Visible = True
			End If
		End Sub
		Public Sub ModulePage_RedirectToModule(ByVal aModuleName As String, ByVal aModuleConfig As String, ByVal aPageKey As String)
			Dim aURL As StringBuilder = New StringBuilder()
			aURL.Append(WebAppl.Get_ModuleRoot(aModuleName) + "/" + aModuleName + "/" + "ModuleContent.aspx" + "?Config=" + aModuleConfig + "&Page=" + aPageKey)
			If Not Request.QueryString.Get("ProgramID") Is Nothing Then
				aURL.Append("&ProgramID=" + Request.QueryString.Get("ProgramID"))
			End If
			If Not Request.QueryString.Get("WfProjectID") Is Nothing Then
				aURL.Append("&WfProjectID=" + Request.QueryString.Get("WfProjectID"))
			End If
			If Not Request.QueryString.Get("CmptID") Is Nothing Then
				aURL.Append("&CmptID=" + Request.QueryString.Get("CmptID"))
			End If
			If Not Request.QueryString.Get("WfTaskID") Is Nothing Then
				aURL.Append("&WfTaskID=" + Request.QueryString.Get("WfTaskID"))
			End If
			Response.Redirect(aURL.ToString)
		End Sub
	End Class
End Namespace