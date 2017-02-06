Imports System.Xml
Imports Core.Web.Modules
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Web.User

Namespace EasyGrants_Web.Controls.Base
Public MustInherit Class cWftaReopenCheckboxlist
    Inherits Core_Web.Controls.Base.cCheckBoxList

'==============================================================

	Private mReopenWfta As cDataObject
	Private mModuleConfigDoc As cXMLDoc
	Private mNavItemsList As XmlNodeList
	
'--------------------------------------------------------------

	Public Property ReopenWfta As cDataObject
		Get
			Return mReopenWfta
		End Get
		Set
			mReopenWfta = Value
		End Set
	End Property
	
'--------------------------------------------------------------

	Public Property ModuleConfigDoc As cXMLDoc
		Get
			Return mModuleConfigDoc
		End Get
		Set
			mModuleConfigDoc = Value
		End Set
	End Property
	
'--------------------------------------------------------------

	Public Property NavItemsList As XmlNodeList
		Get
			Return mNavItemsList
		End Get
		Set
			mNavItemsList = Value
		End Set
	End Property
	
'--------------------------------------------------------------

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
        'Populates the checkboxlist based on an XML Control node

		Dim aNavItem As XmlNode
		Dim aKey As String
		Dim aValidationNode As XmlNode
		Dim aValidationSectionNode As XmlNode
        Dim aLI As ListItem
        Dim aControlNode As XmlNode
        Dim aStoredValueProperty As String
        Dim aDisplayValueProperty As String
        Dim aRepeatDirectionProperty As String
        Dim aRepeatColumnsProperty As String

        
		ReopenWfta = GetReopenWfTA()
		If ReopenWfta Is Nothing Then
			Exit Sub
		End If
		ModuleConfigDoc = GetModuleConfigDoc()
		NavItemsList = GetNavItemsList()
		If Not IsPostBack Then
			'************************************************************************
			'aValidationNode = ModuleConfigDoc.DocElement.SelectSingleNode("Module/Validation")
			'************************************************************************
			For Each aNavItem In NavItemsList
				'Build list of navigation items using the navigation key as the value and the description from the matching validation section as the text.
				'Note that ValidationSection key values must match navigation item key values in the XML in order for resubmission functionality to work.

				'************************************************************************
				'aKey = cXMLDoc.AttributeToString(aNavItem, "Key")
				'aLI = New ListItem()
				'aLI.Value = aKey
				'aValidationSectionNode = aValidationNode.SelectSingleNode("descendant::ValidationSection[@Key='" + aKey + "']")
				'If aValidationSectionNode Is Nothing Then
				'	aLI.Text = cXMLDoc.AttributeToString(aNavItem, "NavTitle")
				'Else
				'	aLI.Text = cXMLDoc.AttributeToString(aValidationSectionNode, "DisplayName")
				'End If
				'************************************************************************

				aLI = GetListItem(aNavItem)
				chkOptionList.Items.Add(aLI)

				'resubmission changes (added following if)
				If aNavItem.HasChildNodes Then
					Dim aChildNavItem As XmlNode
					Dim aChildNavItems As XmlNodeList = aNavItem.SelectNodes("NavElement[@SubmissionSection='True']")
					For Each aChildNavItem In aChildNavItems
						aLI = GetListItem(aChildNavItem)
						chkOptionList.Items.Add(aLI)
					Next
				End If

				'************************************************************************
				'chkOptionList.Items.Add(aLI)
				'************************************************************************

			Next
		End If
		
		'Standard checkboxlist functionality (since configuration is so different from the standard checkboxlist, MyBase.CoreCtl_Configure is not called in this method)
		DisplayPropertyNode = aDisplayPropertyNode
		aControlNode = aDisplayPropertyNode.SelectSingleNode("Control")
        RepeatDirection = cXMLDoc.AttributeToString(aControlNode, "RepeatDirection")
        RepeatColumns = cXMLDoc.AttributeToString(aControlNode, "RepeatColumns")
        CellPadding = cXMLDoc.AttributeToString(aControlNode, "CellPadding")
        CellSpacing = cXMLDoc.AttributeToString(aControlNode, "CellSpacing")


    End Sub

'--------------------------------------------------------------

    Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
		MyBase.CoreCtl_SetDataObjectValueFromCtl(aDisplayPropertyNode, aDataObject)
		
		'Dim aModuleConfigDoc As cXMLDoc
		Dim aValidationNode As XmlNode
		Dim aValidationSectionNode As XmlNode
        Dim aControlNode As XmlNode
        Dim aPropertyKey As String
        Dim aDataObjectList As cDataObjectList
        Dim aChildDataObject As cDataObject
        Dim aNavItem As XmlNode
		'Dim aNavItemsList As XmlNodeList
        Dim aDescription As String

		'Section descriptions must be saved to the database. Normally these would be accessed as related properties, but
		'the data keys that are being stored are keys to an XML node list, not to a database table, and related data cannot
		'be accessed through the GetRelatedProperty methods.
		'aModuleConfigDoc = GetModuleConfigDoc()
		'aNavItemsList = aModuleConfigDoc.DocElement.SelectNodes("Module/Navigation/NavElement[@SubmissionSection='True']")
		aValidationNode = ModuleConfigDoc.DocElement.SelectSingleNode("Module/Validation")
        aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
        aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey")
        aDataObjectList = aDataObject.GetRelatedPropertyDataObjectList(aPropertyKey)
        For Each aChildDataObject In aDataObjectList
            For Each aNavItem In NavItemsList
				If cXMLDoc.AttributeToString(aNavItem, "Key") = aChildDataObject.GetPropertyString("SectionKey") Then
					aValidationSectionNode = aValidationNode.SelectSingleNode("descendant::ValidationSection[@Key='" + _
														cXMLDoc.AttributeToString(aNavItem, "Key") + "']")
					If aValidationSectionNode Is Nothing Then
						aChildDataObject("SectionDescription") = cXMLDoc.AttributeToString(aNavItem, "NavTitle")
					Else
						aChildDataObject("SectionDescription") = cXMLDoc.AttributeToString(aValidationSectionNode, "DisplayName")
					End If
				End If
            Next
        Next
        'save data
        WebSession.DataObjectFactory.SaveDataObject(aDataObjectList)
    End Sub

'--------------------------------------------------------------

	Protected Function GetModuleConfigDoc() As cXMLDoc
		Dim aWfTaskModule As cDataObject
		Dim aModule As String
		Dim aModuleConfig As String
		Dim aModulePath As String
		Dim aModuleConfigDoc As cXMLDoc

		'Get list of submission sections from navigation node list in proposal module configuration file
		'First, get the proposal WFTA and use it to determine which module config file to use.
		aWfTaskModule = ReopenWfta.GetRelatedPropertyDataObject("WfTaskModule")
		'Get and open configuration file and find navigation items with the SubmissionSection flag set
		aModule = aWfTaskModule.GetPropertyString("ModuleName")
		aModuleConfig = aWfTaskModule.GetPropertyString("ModuleConfigFilename")
		'aModulePath = WebAppl.Build_RootFileSystemPath(WebAppl.Get_RelativeDefaultModuleRoot + "/" + aModule + "/" + aModuleConfig)
		aModuleConfigDoc = New cXMLDoc
		'aModuleConfigDoc.Load(aModulePath)
		aModuleConfigDoc = WebSession.LoadModuleConfigXmlFromDB(aModuleConfig)
		Return aModuleConfigDoc
	End Function
	
'--------------------------------------------------------------

	Protected Overridable Function GetReopenWfTA() As cDataObject
		Dim aCurWfTAID As String
		Dim aCurWfTA As cDataObject
		Dim aReopenWfta As cDataObject

		aCurWfTAID = (CType(CType(Page, cModulePage).ModuleUser, cEGUser)).WfTaskAssignmentID.ToString
		aCurWfTA = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aCurWfTAID)
		Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aCurWfTA.GetPropertyString("AppWftaID"))
	End Function
	
'--------------------------------------------------------------

	Protected Function GetProposalSubmissionWfTA() As cDataObject
		Dim aXMLDoc as cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aArgNode as XmlNode
		Dim aGranteeProjectID As String
	
		aGranteeProjectID = (CType(CType(Page, cModulePage).ModuleUser, cEGUser)).GranteeProjectID
		aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "GranteeProjectID", aGranteeProjectID))
		aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskTypeID", "1"))
		aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfTask"))
		Return WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
	End Function
	
'--------------------------------------------------------------

	Protected Function GetGranteeReportWfTA(aCurWfTA As cDataObject) As cDataObject
		Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aCurWfTA.GetRelatedPropertyString("WfTaskAssignmentExt.ReportWfTaskAssignmentID"))
	End Function
	
'--------------------------------------------------------------

	Protected Function GetNavItemsList() As XmlNodeList
		Dim aNavNode As XmlNode = ModuleConfigDoc.DocElement.SelectSingleNode("Module/Navigation")
		Dim aNavItemsList As XmlNodeList = aNavNode.SelectNodes("NavElement[@SubmissionSection='True']")
		Dim aNavItemNode As XmlNode
		Dim aRoleID As String = ReopenWfTA.GetPropertyString("WfTaskRoleID")

		For Each aNavItemNode in aNavItemsList
			Dim aInclude As Boolean = True
			Dim aRoleList As XmlNodeList = aNavItemNode.SelectNodes("PersonRole")
			If aRoleList.Count > 0 Then
				aInclude = False
				Dim aRoleNode As XmlNode
				For Each aRoleNode In aRoleList
					If cXMLDoc.AttributeToString(aRoleNode, "Key") = aRoleID Then
						aInclude = True
						Exit For
					End If
				Next aRoleNode
			End If
			If aInclude Then
				cXMLDoc.AddAttribute_ToNode(aNavItemNode, "Include", "True")
			End If
		Next aNavItemNode

		Return aNavNode.SelectNodes("NavElement[@Include='True']")
	End Function

	'resubmission changes (added function)
	Protected Function GetListItem(ByVal aNavItem As XmlNode) As ListItem
		Dim aLI As ListItem
		Dim aValidationNode As XmlNode
		Dim aValidationSectionNode As XmlNode
		Dim aKey As String

		aValidationNode = ModuleConfigDoc.DocElement.SelectSingleNode("Module/Validation")
		aKey = cXMLDoc.AttributeToString(aNavItem, "Key")
		aLI = New ListItem()
		aLI.Value = aKey
		aValidationSectionNode = aValidationNode.SelectSingleNode("descendant::ValidationSection[@Key='" + aKey + "']")
		If aValidationSectionNode Is Nothing Then
			aLI.Text = cXMLDoc.AttributeToString(aNavItem, "NavTitle")
		Else
			aLI.Text = cXMLDoc.AttributeToString(aValidationSectionNode, "DisplayName")
		End If

		Return aLI
	End Function

'==============================================================

End Class
End Namespace