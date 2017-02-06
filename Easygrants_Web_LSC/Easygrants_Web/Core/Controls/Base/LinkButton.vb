Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Navigation
Imports Core.Web
Imports Core.Web.Modules

Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports EasyGrants.Web.Modules


Namespace Core_Web.Controls.Base

Public MustInherit Class cLinkButton
    Inherits Core.Web.cCoreCtl
    
	Private mDisplayPropertyNode As XmlNode
	Private mControlNode As XmlNode
	Private mSave As Boolean = True
	Public MustOverride Property Caption() As String
	MustOverride Public Property Href() As String
	MustOverride Public Property Target() As String

	Private mWfDataObject As cWfTaskAssignment
	Private mReopenedSections As ArrayList
	Private mConfigDoc As cXMLDoc

	Public Overrides Property DisplayPropertyNode() As XmlNode
		Get
			Return mDisplayPropertyNode
		End Get
		Set(ByVal Value As XmlNode)
			mDisplayPropertyNode = Value
		End Set
	End Property
	
	Public Overridable ReadOnly Property ControlNode() As XmlNode
		Get
			Return cXMLDoc.GetControlNode(DisplayPropertyNode)
		End Get
	End Property

	Public Property Save() As Boolean
		Get
			Save = mSave
		End Get
		Set(ByVal Value As Boolean)
			mSave = Value
		End Set
	End Property

	Public Property WfDataObject() As cWfTaskAssignment
		Get
			Dim aWftaDO As cWfTaskAssignment = Nothing
			Try
				Dim aWfTaskAssignmentID As Integer = CType(Page, cSubmissionModulePage).WfTaskAssignmentObject.GetPropertyInt("WfTaskAssignmentID")
				aWftaDO = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID)(0)
			Catch SE As SystemException
			End Try
			WfDataObject = aWftaDO
		End Get
		Set(ByVal Value As cWfTaskAssignment)
			mWfDataObject = Value
		End Set
	End Property

	Public ReadOnly Property ReopenedSections() As ArrayList
		Get
			If mReopenedSections Is Nothing Then
				mReopenedSections = New ArrayList()
				Dim aWftaReopenSectionList As cDataObjectList
				Dim aWftaReopenSection, aRequestWftaDO As cDataObject
				If Not WfDataObject Is Nothing Then
					'getting reopened sections list based on requesting wfta in case there are ever two task assignments that request resubmission from same grant.  if we get reopened sections list based on reopened wfta then in this case, we will always get the first wfta reopen request record.
					aRequestWftaDO = WfDataObject.GetRelatedPropertyDataObject("ActiveRequestToReopenThis")
					aWftaReopenSectionList = aRequestWftaDO.GetRelatedPropertyDataObjectList("WftaReopenSections")
				End If
				If Not aWftaReopenSectionList Is Nothing Then
					For Each aWftaReopenSection In aWftaReopenSectionList
						mReopenedSections.Add(aWftaReopenSection.GetPropertyString("SectionKey"))
					Next
				End If
			End If
			Return mReopenedSections
		End Get
	End Property

	Public Property ConfigDoc() As cXMLDoc
		Get
			Return mConfigDoc
		End Get
		Set(ByVal value As cXMLDoc)
			mConfigDoc = value
		End Set
	End Property

	Public Sub GoToNextNav(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		Dim aContinue As Boolean
		If Save Then
			aContinue = Me.EventController.EventController_Save()
		Else
			aContinue = True
		End If

		Dim aURL As String = Me.Request.RawUrl()
		Dim aModule As String = aURL.Substring(aURL.IndexOf("Modules/") + 8)
		aModule = aModule.Substring(0, aModule.IndexOf("/"))
		Dim aModuleConfig As String = aURL.Substring(aURL.IndexOf("Config=") + 7, aURL.IndexOf("&") - aURL.IndexOf("Config=") - 7)
		Dim aPageKey As String = aURL.Substring(aURL.IndexOf("Page=") + 5)

		If aPageKey.IndexOf("&") <> -1 Then
			aPageKey = aPageKey.Substring(0, aPageKey.IndexOf("&"))
		End If

		 ConfigDoc = New cXMLDoc(WebAppl.Build_RootFileSystemPath(WebAppl.Get_RelativeDefaultModuleRoot() + "/" + aModule + "/" + aModuleConfig))
		If ConfigDoc.DocElement Is Nothing Then
			ConfigDoc = WebSession.LoadModuleConfigXmlFromDB(aModuleConfig)
			If ConfigDoc.DocElement Is Nothing Then Exit Sub
		End If

		If Not WfDataObject Is Nothing AndAlso WfDataObject.GetPropertyInt("WfTaskStatusID", 0) = 4 Then
			UpdateConfigDoc()
		End If

		Dim aPageNode As XmlNode = ConfigDoc.DocElement.SelectSingleNode("Module/Pages/Page[@Key='" & aPageKey & "']")
		Dim aPageNavKey As String = cXMLDoc.AttributeToString(aPageNode, "NavKey")

		Dim aNavElementNode As XmlNode = ConfigDoc.DocElement.SelectSingleNode("Module/Navigation/NavElement[@Key='" & aPageNavKey & "']")
		Dim aNavElementNodeNext As XmlNode
		If Not aNavElementNode Is Nothing Then
			If Not aNavElementNode.HasChildNodes Then
				 aNavElementNodeNext = aNavElementNode.NextSibling
			Else
				aNavElementNodeNext = aNavElementNode.FirstChild
			End If
		Else
			aNavElementNode = ConfigDoc.DocElement.SelectSingleNode("Module/Navigation/NavElement/NavElement[@Key='" & aPageNavKey & "']")
			aNavElementNodeNext = aNavElementNode.NextSibling
			If aNavElementNodeNext Is Nothing Then
				aNavElementNodeNext = aNavElementNode.ParentNode.NextSibling
			End If
		End If


		Dim aNextNavElementSourceFile = cXMLDoc.AttributeToString(aNavElementNodeNext, "SourceFile", "")

		If (aContinue) AndAlso Not aNextNavElementSourceFile = "" Then
			Me.Response.Redirect(WebAppl.Build_RootURL(aNextNavElementSourceFile))
		End If
	End Sub

	'The below function will get all the task Navelements from a_WF_TASK_MODULE_CONFIG_NAVELEMENT except Main and review and Submit 
	'and compare the navElements which are in WFTA_REOPEN_SECTION. And if it exixts then it won’t delete the Navelement , 
	'else it will delete the other Tasl Related pages.
	Public Sub UpdateConfigDoc()
		Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		Dim aWfTaskID As String = aUser.WfTaskID

		Dim aWfTaskModuleConfigNavElementDOL As cDataObjectList
		Dim aWfTaskModuleConfigNavElementDO As cDataObject
		Dim aDataObjectNode, aFiltersNode, aArgNode As XmlNode
		Dim aXmlDoc As cXMLDoc
		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskModuleConfigNavElement", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aWfTaskID))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))
		aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "FormTypeID", "1", ""))
		aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "StandardForms"))
		aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "FormTypeID", "2", "Or"))
		aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "StandardForms"))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
		aWfTaskModuleConfigNavElementDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)

		If Not ConfigDoc.DocElement Is Nothing Then
			Dim aParentNavList As ArrayList
			Dim aEnableList As ArrayList = ReopenedSections
			Dim aParentChildList As New ArrayList
			Dim aNavidationNode As XmlNode
			If aEnableList.Count > 0 Then
				For Each aWfTaskModuleConfigNavElementDO In aWfTaskModuleConfigNavElementDOL
					Dim aNavKeyName As String = aWfTaskModuleConfigNavElementDO("NavKey")
					If aEnableList.Contains(aNavKeyName) = False Then
						Dim xPathFind As String = "Module/Navigation/NavElement[@Key='" & aNavKeyName & "']"
						Dim aCurrentNode As XmlNode = ConfigDoc.DocElement.SelectSingleNode(xPathFind)
						'Here if the Node is not Available in the First Level , then we need to remove the node from the child Level
						If Not aCurrentNode Is Nothing Then
							If Not aCurrentNode.HasChildNodes Then
								aNavidationNode = ConfigDoc.DocElement.SelectSingleNode("Module/Navigation")
								aNavidationNode.RemoveChild(aCurrentNode)
							ElseIf aCurrentNode.HasChildNodes Then
								Dim aName As String = cXMLDoc.AttributeToString(aCurrentNode, "Key")
								aParentChildList.Add(aName)
							End If
						Else
							'Here we are deleting the Node from a Child navelement.
							Dim xPathFindChild As String = "Module/Navigation/NavElement/NavElement[@Key='" & aNavKeyName & "']"
							Dim aCurrentNodeChild As XmlNode = ConfigDoc.DocElement.SelectSingleNode(xPathFindChild)
							If Not aCurrentNodeChild Is Nothing Then

								aNavidationNode = aCurrentNodeChild.ParentNode
								aNavidationNode.RemoveChild(aCurrentNodeChild)
							End If
						End If
					End If
				Next


				'If any Parent Navelements needs to be deleted who has Child NavElements , 
				'Then Move all the Child NavElement outside the Parent NavElement and then Deleted the Parent Navelement.
				If aParentChildList.Count > 0 Then
					Dim aList, iNode As Integer
					Dim aNode, aNavigationNode As XmlNode
					aNavigationNode = ConfigDoc.DocElement.SelectSingleNode("Module/Navigation")
					For aList = 0 To aParentChildList.Count - 1
						Dim xPath As String = "Module/Navigation/NavElement[@Key='" & aParentChildList(aList) & "']"
						Dim aParentNode As XmlNode = ConfigDoc.DocElement.SelectSingleNode(xPath)
						If aParentNode.HasChildNodes Then
							Dim aChildNodeList As XmlNodeList = aParentNode.ChildNodes
							If aChildNodeList.Count > 0 Then
								For iNode = 0 To aChildNodeList.Count - 1
									aNode = aChildNodeList(iNode)
									aNavigationNode.InsertAfter(aNode, aParentNode)
								Next
								aNavigationNode.RemoveChild(aParentNode)
							End If
						End If
					Next
				End If

			End If
		End If

	End Sub

	Public Function NavElement(ByVal aKey As String) As cNavElement
			Return (CType(Page, cModulePage).ModuleUser).MasterNavElement.Find_ChildElement(aKey)
		End Function

	Public ReadOnly Property AcceptEnterKey() As String
		Get
			If DisplayPropertyNode Is Nothing Then
				Return False
				Else
				Return cXMLDoc.AttributeToString(ControlNode, "EnterKey", "False")
			End If
		End Get
	End Property

	Public ReadOnly Property GoToNextPage() As String
		Get
			If DisplayPropertyNode Is Nothing Then
				Return False
				Else
				Return cXMLDoc.AttributeToString(ControlNode, "GoToNextPage", "False")
			End If
		End Get
	End Property

	Public MustOverride Property Confirmation() As String

	Public MustOverride Property ToolTip() As String

	Public Overridable Sub Set_ServerClick(ByVal aHandler As EventHandler)
	End Sub

'	Public Overridable Overloads Sub Set_ServerClick(ByVal aHandler As ImageClickEventHandler)
'	End Sub

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
		MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
		If Not Visible Then Exit Sub
		DisplayPropertyNode = aDisplayPropertyNode
		ConfigureCaption()
		If Not (cXMLDoc.GetActionNode(DisplayPropertyNode) Is Nothing) Then
			ConfigureAction()
		End If

		'ConfigureConfirmation()
		ConfigureToolTipText()
	End Sub

	Public Overridable Sub ConfigureCaption()
		If cXMLDoc.AttributeToString(ControlNode, "Caption") <> "" Then
			Caption = cXMLDoc.AttributeToString(ControlNode, "Caption")
		ElseIf (cXMLDoc.AttributeToString(ControlNode, "Image") <> "") Then
			Dim cap As String = cXMLDoc.AttributeToString(ControlNode, "Image")
			cap = cap.Replace("_", " ")
			Caption = cap
		ElseIf cXMLDoc.AttributeToString(ControlNode, "CaptionKey") <> "" Then
		Else
			Caption = "Save and Continue"
		End If

	End Sub

	Public Overridable Sub ConfigureAction()
		Dim aActionNode As XmlNode = cXMLDoc.GetActionNode(DisplayPropertyNode)
		If cXMLDoc.AttributeToBool(aActionNode, "PostBack") Then
			Set_ServerClick(AddressOf Me.EventController.EventController_ControlClicked)
		Else
			Href = cXMLDoc.AttributeToString(aActionNode, "URL")
			Target = cXMLDoc.AttributeToString(aActionNode, "Target")
		End If
	End Sub

	Public Overridable Sub ConfigureConfirmation()
		Dim aConfirmation As String = cXMLDoc.AttributeToString(ControlNode, "Confirmation", "")
		If aConfirmation <> "" Then
			Confirmation = aConfirmation
		End If
	End Sub

	Public Overridable Sub ConfigureToolTipText()
		Dim aToolTipText As String
		aToolTipText = cXMLDoc.AttributeToString(ControlNode, "ToolTipText", "")
		If aToolTipText <> "" Then
			ToolTip = aToolTipText
		End If
	End Sub

	Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
		Dim aPropertyKey, aCaptionKey As String
		Dim aLink As String
		Dim aControlNode As XmlNode = cxmldoc.GetControlNode(DisplayPropertyNode)
		Dim aActionNode As XmlNode = cXMLDoc.GetActionNode(DisplayPropertyNode)
		Dim aURL = cXMLDoc.AttributeToString(aActionNode, "URL")

		aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey").ToString()
		aCaptionKey = cXMLDoc.AttributeToString(aControlNode, "CaptionKey").ToString()

		If aPropertyKey <> "" Then
			aLink = aDataObject.GetRelatedPropertyString(aPropertyKey)
			If aCaptionKey <> "" Then
				Caption = aDataObject.GetRelatedPropertyString(aCaptionKey)
			ElseIf cXMLDoc.AttributeToString(aControlNode, "Caption") = "" Then
				Caption = aLink
			End If

			If aURL = "Web" Then
				If aLink.IndexOf("://") = -1 Then
					Href = "http://" + aLink
				Else
					Href = aLink
				End If
			ElseIf aURL = "WebRelative" Then
				Href = aLink
			ElseIf aURL = "LocalPDF" Then
				Href = WebAppl.LocalPDFUrl + aLink
			ElseIf aURL = "Email" Then
				Href = "mailto:" + alink
			ElseIf aURL = "File" Then
				If aLink.IndexOf(":///") = -1 Then
					Href = "file:///" + aLink
				Else
					Href = aLink
				End If
			End If
		End If

		If Not aURL = "File" Then
			Href = Server.HTMLEncode(Href)
		End If

		Dim aToolTipPropertyKey As String
		aToolTipPropertyKey = cXMLDoc.AttributeToString(aControlNode, "ToolTipPropertyKey", "")
		If aToolTipPropertyKey <> "" Then
			Dim aToolTip As String
			aToolTip = aDataObject.GetRelatedPropertyString(aToolTipPropertyKey)
			If aToolTip <> "" Then
				 ToolTip = aToolTip
			End If
		End If

	End Sub

End Class
End Namespace