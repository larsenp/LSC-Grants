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

Namespace Implementation.Modules.Staff.Controls.PageSection
Public MustInherit Class cNewGrantEditor
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
    Protected ctlPer As cPopUpSelectorLauncher
    Protected ctlInst As cDropDown
	Protected ctlGrantTitle As cTextArea
	Protected ctlGrantStatus As cDropDown
	
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
			If Not Request.QueryString("CmptID") Is Nothing Then Return Request.QueryString("ProgramID")

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
		
		Page.DataBind() 
		
		If Not ProgramID = "" Then
			Dim aDataObjectList As cDataObjectList
			Dim aDataObject As cDataObject
			Dim aItem As ListItem

			'trCmpt.Visible = True

			'aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Competition", "ProgramID", ProgramID)

			Dim aXmlDoc as cXMLDoc 
			Dim aFiltersNode as XmlNode 
			Dim aDataObjectNode as XmlNode
			Dim aSortNode as XmlNode
			Dim aArgNode as XmlNode
			
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Competition", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ProgramID", ProgramID))
			aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
			aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "CompetitionDisplayName", ""))
			aDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)

			ctlCmpt.Items.Clear()
			aItem = New ListItem("<None>", "")
			ctlCmpt.Items.Add(aItem)

			For Each aDataObject In aDataObjectList
				aItem = New ListItem(aDataObject.GetPropertyString("CompetitionDisplayName"), aDataObject.GetPropertyString("CompetitionID"))
				ctlCmpt.Items.Add(aItem)
			Next

			btnCmpt.Set_ServerClick(AddressOf btnGo_Click)
			ctlProgram = CType(Me.FindControl("ctlProgram"), cDropDown)
			ctlProgram.SelectedField = ProgramID
			trProject.Visible = False
			trTask.Visible = False

			If Not CmptID = "" Then
				aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProject", "CompetitionID", CmptID)

				ctlProject.Items.Clear()
				aItem = New ListItem("<None>", "")
				
				If Not ctlProject.Items.Contains(aItem) Then
					ctlProject.Items.Add(aItem)
				end if
				
				For Each aDataObject In aDataObjectList
					aItem = New ListItem(aDataObject.GetPropertyString("WfProjectName"), aDataObject.GetPropertyString("WfProjectID"))
					
					If Not ctlProject.Items.Contains(aItem) Then
						Me.ctlProject.Items.Add(aItem)
					end if
				Next

				btnProject.Set_ServerClick(AddressOf btnGo_Click)
				me.ctlProject.Set_ServerIndexChange(addressof DropDown_Selected)
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

					btnTask.Set_ServerClick(AddressOf btnGo_Click)
					Me.ctlProject.SelectedField = ProjectID
					Me.ctlTask.SelectedField = TaskID
					'Me.trTask.Visible = True
				End If
			End If
		End If

	End Sub

'=============================================================

	Public Sub GoClick(ByVal aStepName As String, ByVal aValue As String)
		dim aURL as String = Request.RawUrl.ToString()
		
		Select Case aStepName
			Case "Program"
				aURL = cWebLib.AddQuerystringParameter(aURL, "CmptID", "")
				'aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", "")
				'aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", "")
				
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

	Private Sub DropDown_Selected(ByVal sender As System.Object, ByVal e As System.EventArgs)
		dim aURL as String = Request.RawUrl.ToString()
		
		Select Case CType(sender, Control).Parent.ID
			Case "ctlProject"
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", ctlProject.SelectedValue)
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

'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		
		Dim aItem As ListItem
		dim aObj as cDataObject
		
		ctlPer = CType(Me.FindControl("ctlPer"), cPopUpSelectorLauncher)
		ctlPer.ObjName = Request.QueryString("Text")
		ctlPer.ObjID = Request.QueryString("Value")
		dim aList as cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonOrganizationAffiliation", _
			"PersonID", Request.QueryString("Value"))
		
		ctlInst = CType(Me.FindControl("ctlInst"), cDropDown)
		ctlInst.Items.Clear()
		aItem = New ListItem("<None>", "")
		ctlInst.Items.Add(aItem)

		For Each aObj In aList
			aItem = New ListItem(aObj.GetRelatedPropertyString("Organization.CommonOrganizationName"), aObj.GetPropertyString("OrganizationID"))
			If aObj.GetPropertyBool("IsPrimary") Then
				Me.ctlInst.Items.Insert(1, aItem)
			Else
				Me.ctlInst.Items.Add(aItem)
			End If				
		Next
	End Sub

'-----------------------------------------------------
  
    Public Sub ValidateProject(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		
		ctlProject = CType(Me.FindControl("ctlProject"), cDropDown)
						
		try 
			If ctlProject.SelectedField = "" then
				aArgs.IsValid = False
			Else
				aArgs.IsValid = True 
			End If
		catch
			aArgs.IsValid = False
		end try			
   End Sub 
   
 '-------------------------------------------------------------

	'Public Overrides Sub DataPresenter_SaveDataObjects()
 '       'MyBase.DataPresenter_SaveDataObjects()
        
 '       Dim aObj As cDataObject
		
	'	ctlProject = CType(Me.FindControl("ctlProject"), cDropDown)
	'	dim aPersonID as String = request.QueryString("Value")
		
	'	aObj = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProject")
	'	aObj("WfProjectID") = ctlProject.SelectedField
	'	aObj("PrimaryPersonID") = aPersonID
	'	aObj("GranteeID") = aPersonID
	'	aObj("WfProjectOutcomeID") = 2
		
	'	ctlInst = CType(Me.FindControl("ctlInst"), cDropDown)
	'	aObj("PrimaryOrganizationID") = ctlInst.SelectedField
	'	ctlGrantTitle = CType(Me.FindControl("ctlGrantTitle"), cTextArea)
	'	aObj("GrantTitle") = ctlGrantTitle.Value
	'	ctlGrantStatus = CType(Me.FindControl("ctlGrantStatus"), cDropDown)
	'	aObj("GrantStatusID") = ctlGrantStatus.SelectedField
		
	'	WebSession.DataObjectFactory.SaveDataObject(aObj)		
	'	EventController_NavigateToModulePageKey("GrantsEditor", "GranteeProjectID=" + aObj.GetPropertyString("GranteeProjectID"))
	'End Sub
	
'=============================================================

End Class
End Namespace