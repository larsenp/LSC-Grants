Imports Core_Web.Controls.Base
Imports Core.Web
Imports Core.DataAccess
Imports System.Xml
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Web.User
Imports Core.Web.Modules


Namespace Implementation.Modules.Home.Controls.Page

	Public MustInherit Class cCopyTaskContent_Lsc
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlCopyToProgram As cDropDown
	Protected ctlCopyToFO As cDropDown
	Protected spnCopyToTask As HtmlGenericControl
	Protected trCopyToFO As HtmlTableRow
	Protected trCopyToTask As HtmlTableRow

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

		Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
			MyBase.CoreCtl_Load(sender, e)
			ctlCopyToProgram = CType(Me.FindControl("ctlCopyToProgram"), cDropDown)
			ctlCopyToFO = CType(Me.FindControl("ctlCopyToFO"), cDropDown)

			If Not ProgramID = "" Then
				Dim aDataObjectList As cDataObjectList
				Dim aDataObject As cDataObject
				Dim aItem As ListItem
				trCopyToFO.Visible = True
				Dim aDataObjectEl As XmlElement = Me.mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='WfProject']")
				Dim aProgramFilterEl As XmlElement = aDataObjectEl.SelectSingleNode("Filters/Argument[@PropertyKey='ProgramID']")
				cXMLDoc.AddAttribute_ToNode(aProgramFilterEl, "Value", ProgramID)
				aDataObjectEl.Attributes("GetData").Value = "True"
				aDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectEl)
				ctlCopyToFO.Items.Clear()
				aItem = New ListItem("<Select>", "")
				ctlCopyToFO.Items.Add(aItem)

				For Each aDataObject In aDataObjectList
					aItem = New ListItem(aDataObject.GetRelatedPropertyString("WfCompetition.CompetitionDisplayName"), aDataObject.GetPropertyString("WfProjectID"))
					ctlCopyToFO.Items.Add(aItem)
				Next

				ctlCopyToFO.Attributes.Add("PostBack", "True")
				ctlCopyToFO.Set_ServerIndexChange(AddressOf ctlDropDown_IndexChange)
				ctlCopyToProgram.SelectedField = ProgramID

				'If Not CmptID = "" Then
				'	aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProject", "CompetitionID", CmptID)
				'	ctlCopyToFC.Items.Clear()
				'	aItem = New ListItem("<Select>", "")
				'	ctlCopyToFC.Items.Add(aItem)

				'	For Each aDataObject In aDataObjectList
				'		aItem = New ListItem(aDataObject.GetPropertyString("WfProjectName"), aDataObject.GetPropertyString("WfProjectID"))
				'		Me.ctlCopyToFC.Items.Add(aItem)
				'	Next

				'	ctlCopyToFC.Attributes.Add("PostBack", "True")
				'	ctlCopyToFC.Set_ServerIndexChange(AddressOf ctlDropDown_IndexChange)
				'	ctlCopyToFO.SelectedField = CmptID
				'	trCopyToFC.Visible = True
				'End If

				If Not ProjectID = "" Then
					ctlCopyToFO.SelectedField = ProjectID

					Dim aWfTaDO As cDataObject = Me.DataObjectCollection("WfTaskAssignment")(0)
					Dim aWfTaskID As Integer = aWfTaDO.GetPropertyInt("WfTaskID", 0)
					trCopyToTask.Visible = True
					If aWfTaskID <> 0 Then
						aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", ProjectID, "WfTaskID", aWfTaskID)
						If aDataObjectList.Count > 0 Then
							spnCopyToTask.InnerText = aWfTaDO.GetRelatedPropertyString("WfTask.WfTaskAbbr")
						Else
							spnCopyToTask.InnerHtml = "<font color='red'>The Copy feature is not available for this task.</font>"
						End If
					End If
				End If

			End If

		End Sub

		Public Sub GoClick(ByVal aStepName As String, ByVal aValue As String)
			Dim aURL As String

			aURL = Request.Url.ToString()
			Select Case aStepName
				Case "Program"
					aURL = cWebLib.RemoveQuerystringParameter(aURL, "ReturnURL")
					aURL = cWebLib.AddQuerystringParameter(aURL, "CmptID", "")
					aURL = cWebLib.AddQuerystringParameter(aURL, "ProgramID", aValue)
				Case "Cmpt"
					aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", "")
					aURL = cWebLib.AddQuerystringParameter(aURL, "CmptID", aValue)
				Case "Project"
					Dim aWfTaDO As cDataObject = Me.DataObjectCollection("WfTaskAssignment")(0)
					Dim aWfTaskID As Integer = aWfTaDO.GetPropertyInt("WfTaskID", 0)
					aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", aValue)
					aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", aWfTaskID)
			End Select
			'Dim aReturnURL As String = Request.QueryString("ReturnURL")
			'aURL = cWebLib.AddQuerystringParameter(aURL, "ReturnURL", aReturnURL, Server)

			Response.Redirect(aURL)
		End Sub

		Private Sub ctlDropDown_IndexChange(ByVal sender As System.Object, ByVal e As System.EventArgs)
			Select Case CType(sender, Control).Parent.ID
				Case "ctlCopyToFO"
					GoClick("Project", ctlCopyToFO.SelectedValue)
				Case "ctlCopyToFC"

					'GoClick("Project", ctlCopyToFC.SelectedValue)
			End Select
		End Sub

	End Class
End Namespace
