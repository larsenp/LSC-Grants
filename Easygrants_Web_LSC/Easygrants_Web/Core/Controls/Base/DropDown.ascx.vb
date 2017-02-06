Imports System.Xml
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base
<ValidationPropertyAttribute("Dropdown")> Public MustInherit Class cDropDown
    Inherits Core.Web.cCoreCtl
'=============================================================

        Protected selDropDown As DropDownList
    Protected valReqDropDown As RequiredFieldValidator
    Protected valRangeDropDown As RangeValidator

    Private mDisplayNone As Boolean = True
	Private mDisplayText As String
	Private mOnChangeEvent As String = ""
    Private mDisplayPropertyNode As XmlNode
    Private mFilterNodeList As XmlNodeList
    Private mListItems As ListItemCollection
	Private mActionNode As XmlNode
    Private mDisplayTextValue As String

        Protected aLI As ListItem
        Protected aDefinitionKey As String = ""
        Protected aControlNode As XmlNode
'=============================================================

    Public ReadOnly Property Dropdown() As String
		Get
			If selDropDown.SelectedItem Is Nothing Then
				Return ""
			Else
				Return selDropDown.SelectedItem.Value.ToString()
			End If
		End Get
   End Property

'--------------------------------------------------------------

    Public Sub Set_ServerIndexChange(ByVal aHandler As EventHandler)
		selDropDown.AutoPostBack = True
        AddHandler selDropDown.SelectedIndexChanged, aHandler
    End Sub

'--------------------------------------------------------------

    Public Property FilterNodeList() As XmlNodeList
    Get
        FilterNodeList = mFilterNodeList
    End Get
    Set(ByVal Value As XmlNodeList)
        mFilterNodeList = Value
    End Set
    End Property
'----------------------------------------------------

    Public Overrides Property DisplayPropertyNode() As XmlNode
        Get
            DisplayPropertyNode = mDisplayPropertyNode
        End Get
        Set(ByVal Value As XmlNode)
            mDisplayPropertyNode = Value
        End Set
    End Property

'----------------------------------------------------

    Public Property DisplayNone() As Boolean
        Get
            DisplayNone = mDisplayNone
        End Get
        Set(ByVal Value As Boolean)
            mDisplayNone = Value
        End Set
    End Property

'----------------------------------------------------

	Public Property DisplayText() As String
		Get
			DisplayText = mDisplayText
		End Get
		Set(ByVal Value As String)
			mDisplayText = Value
		End Set
	End Property
	
'----------------------------------------------------

	Public Property DisplayTextValue() As String
		Get
			DisplayTextValue = mDisplayTextValue
		End Get
		Set(ByVal Value As String)
			mDisplayTextValue = Value
		End Set
	End Property

'----------------------------------------------------

	Public Property OnChangeEvent() As String
		Get
			OnChangeEvent = mOnChangeEvent
		End Get
		Set(ByVal Value As String)
			mOnChangeEvent = Value
		End Set
	End Property

'--------------------------------------------------------------

	Public ReadOnly Property SelectedValue() As String
		Get
			If selDropDown.SelectedItem Is Nothing Then
				Return ""
			Else
				SelectedValue = selDropDown.SelectedItem.Value
			End If
		End Get

	End Property

'--------------------------------------------------------------

	Public ReadOnly Property SelectedText() As String
		Get
			If selDropDown.SelectedItem Is Nothing Then
				Return ""
			Else
				SelectedText = selDropDown.SelectedItem.Text
			End If
		End Get

	End Property

'--------------------------------------------------------------

	Public ReadOnly Property SelectedItem() As ListItem
		Get
			SelectedItem = selDropDown.SelectedItem
		End Get

	End Property

'--------------------------------------------------------------

	Public ReadOnly Property BaseControl() As DropDownList
		Get
			BaseControl = selDropDown
		End Get
	End Property
'--------------------------------------------------------------

	Public Property RangeValVisible() As Boolean
		Get
			RangeValVisible = valRangeDropDown.Enabled
		End Get
		Set(ByVal Value As Boolean)
			valRangeDropDown.Enabled = Value
			valRangeDropDown.Visible = Value
		End Set
	End Property
'--------------------------------------------------------------

	Public Property RangeValMinVal() As Integer
		Get
			RangeValMinVal = valRangeDropDown.MinimumValue
		End Get
		Set(ByVal Value As Integer)
			valRangeDropDown.MinimumValue = Value
		End Set
	End Property
'--------------------------------------------------------------

	Public Property RangeValMaxVal() As Integer
		Get
			RangeValMaxVal = valRangeDropDown.MaximumValue
		End Get
		Set(ByVal Value As Integer)
			valRangeDropDown.MaximumValue = Value
		End Set
	End Property
'--------------------------------------------------------------

	Public Property RangeValText() As String
		Get
			RangeValText = valRangeDropDown.ErrorMessage
		End Get
		Set(ByVal Value As String)
			valRangeDropDown.ErrorMessage = Value
		End Set
	End Property
'--------------------------------------------------------------

	Public Property SelectedField() As String
		Get
			If selDropDown.SelectedItem Is Nothing Then
				Return ""
			Else
				SelectedField = selDropDown.Items(selDropDown.SelectedIndex).Value
			End If
		End Get
		Set(ByVal Value As String)
			Dim aItem As ListItem

			For Each aItem In selDropDown.Items
				aItem.Selected = False
			Next
			If selDropDown.Items.FindByValue(Value.ToString()) Is Nothing Then
				' Value Does Not Exist
				'selDropDown.Items.FindByValue("").Selected = True
			Else
				selDropDown.Items.FindByValue(Value.ToString()).Selected = True
			End If
		End Set
	End Property

'--------------------------------------------------------------

	Public Property ValidationText() As String
		Get
			ValidationText = valReqDropDown.ErrorMessage
		End Get
		Set(ByVal Value As String)
			valReqDropDown.ErrorMessage = Value
			valReqDropDown.Enabled = True
		End Set
	End Property

'--------------------------------------------------------------

	Public ReadOnly Property Items() As ListItemCollection
	Get
		Return selDropDown.Items
	End Get
	End Property
	
'----------------------------------------------------

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		'selDropDown.AutoPostBack = True

		If OnChangeEvent.ToString() <> "" Then
			selDropDown.AutoPostBack = True

			AddHandler selDropDown.SelectedIndexChanged, AddressOf Index_Changed
		End If
	End Sub

'--------------------------------------------------------------

	Public Overloads Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
	'Populates the drop-down based on an XML Control node

		Dim aDataType As String
		Dim aFilters As XmlNode
		Dim aDS As DataSet
		Dim aDataObjList As cDataObjectList
		Dim aDataObj As cDataObject

		Dim aStoredValueProperty As String
		Dim aDisplayValueProperty As String

		Dim aErrorMessage As String
		Dim aParamList As String
		Dim aUniqueStoredValue As Boolean
		Dim aDefaultValue As String


        mActionNode = cXMLDoc.GetActionNode(aDisplayPropertyNode)
        If Not mActionNode Is Nothing Then
			Set_ServerIndexChange(AddressOf Index_Changed)
		End If

		DisplayPropertyNode = aDisplayPropertyNode
		aControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
		'aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
		DisplayNone = cXMLDoc.AttributeToBool(aControlNode, "DisplayNone", True)
		DisplayText = cXMLDoc.AttributeToString(aControlNode, "DisplayText")
		DisplayTextValue = cXMLDoc.AttributeToString(aControlNode, "DisplayTextValue")
		aDefaultValue = cXMLDoc.AttributeToString(aControlNode, "DefaultValue","")
		HideInactiveItems = cXMLDoc.AttributeToBool(aControlNode, "HideInactiveItems", True)
		aParamList = cXMLDoc.AttributeToString(aControlNode, "ParamList")
		If aParamList <> "" Then
			'Build list items from param list
			LoadRows_ParamList(aControlNode)
		ElseIf Not mListItems Is Nothing Then
			'Add list items passed in
			For Each aLI In mListItems
				Me.Items.Add(aLI)
			Next
			mListItems = Nothing
		Else
			'Build list items from data object
			'Set values in filter node, then get data object from factory
			aFilters = aControlNode.SelectSingleNode("Filters")

			If Not aDataObjectList Is Nothing Then
				aDefinitionKey = aDataObjectList.DefinitionKey
			End If

			'Hides inactive lookup values 
			HideInactiveLookupValues(aControlNode, aFilters, aDefinitionKey, HideInactiveItems)
			aFilters = aControlNode.SelectSingleNode("Filters")


			If Not (aFilters Is Nothing Or EventController Is Nothing) Then
				EventController.EventController_SetArgumentsInNodeList(aFilters)
			End If

			aDataObjList = WebSession.DataObjectFactory.GetDataObjectList(aControlNode)


			'Create "None" list item
			If DisplayText <> "" Then
				aLI = New ListItem()
				aLI.Value = DisplayTextValue
				aLI.Text = "<" + DisplayText + ">"
				If Not selDropDown.Items.Contains(aLI) Then
					selDropDown.Items.Add(aLI)
				End If
			ElseIf DisplayNone Then
				aLI = New ListItem()
				aLI.Value = ""
					aLI.Text = "<None>"
				If Not selDropDown.Items.Contains(aLI) Then
					selDropDown.Items.Add(aLI)
				End If
			End If

			'If DisplayTextValue <> 0 Then
			'	aLI = New ListItem()
			'	aLI.Value = DisplayTextValue
			'	If Not selDropDown.Items.Contains(aLI) Then
			'		selDropDown.Items.Add(aLI)
			'	End If
			'End If

			aStoredValueProperty = cXMLDoc.AttributeToString(aControlNode, "StoredValue")
			aDisplayValueProperty = cXMLDoc.AttributeToString(aControlNode, "DisplayValue")
			aUniqueStoredValue = cXMLDoc.AttributeToBool(aControlNode, "UniqueStoredValue")

			If aStoredValueProperty <> "" Then
				'Populate base drop-down from data object
				For Each aDataObj In aDataObjList
					aLI = New ListItem(aDataObj.GetRelatedPropertyString(aDisplayValueProperty), aDataObj.GetRelatedPropertyString(aStoredValueProperty))
					'aLI = New ListItem(aDataObj.GetPropertyString(aDisplayValueProperty), aDataObj.GetPropertyString(aStoredValueProperty))
					If selDropDown.Items.Contains(aLI) = False Then
						selDropDown.Items.Add(aLI)
					End If
				Next
			End If

			SetSelectedValue(cXMLDoc.GetControlNode(DisplayPropertyNode))

			If aDefaultValue <> "" Then
				Dim selLI As ListItem = selDropDown.Items.FindByValue(aDefaultValue.ToString())
				If Not selLI Is Nothing Then
					selLI.Selected = True
				End If
			End If

			'DisplayPropertyNode = aDisplayPropertyNode
		End If

		aErrorMessage = cXMLDoc.AttributeToString(aControlNode, "ErrorMessage")
		If aErrorMessage <> "" Then
			ValidationText = aErrorMessage
		End If

		CoreCtl_LoadScriptNodes(aDisplayPropertyNode)
	End Sub

'--------------------------------------------------------------

    Public Overrides Sub AddScript(ByVal aEvent As String, ByVal aScriptName As String, ByVal aParameters As String)
        selDropDown.Attributes.Add(aEvent, "JavaScript: " + aScriptName + "('" + aParameters + "');")
    End Sub

'--------------------------------------------------------------

	Public Overloads Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList, _
											ByVal aItems As ListItemCollection)
		mListItems = aItems
		CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
	End Sub
	
	Public Sub RemoveItemByValue(ByVal aValue As String)
		Dim aItem As ListItem = selDropDown.Items.FindByValue(aValue)
		If Not aItem Is Nothing Then
			selDropDown.Items.RemoveAt(selDropDown.Items.IndexOf(aItem))
		End If
	End Sub
	
'--------------------------------------------------------------

	Public Sub LoadRows_ParamList(ByVal aParamList As String, ByVal aSeparator As String, ByVal aSubSeparator As String)
		Dim aLI As ListItem
		Dim aDone As Boolean
		Dim aCurrentValueSet As String
		Dim aValue As String
		Dim aText As String

		If selDropDown.Items.Count > 0 Then
			Exit Sub
		Else

			'Create "None" list item
			If DisplayNone Then
				aLI = New ListItem()
				aLI.Value = ""
				aLI.Text = "<None>"
				selDropDown.Items.Add(aLI)
			End If

			If aParamList <> "" Then
				aDone = False
				While aDone = False
					' Check for multiple items remaining
					If InStr(1, aParamList, aSeparator) > 0 Then
						' if multiple items, get first item and trim item list
						aCurrentValueSet = Left(aParamList, InStr(1, aParamList, aSeparator))
						aParamList = Right(aParamList, Len(aParamList) - (Len(aCurrentValueSet)))
					Else
						'if only one item, set current item to that item
						aCurrentValueSet = aParamList
						aDone = True
					End If
					' get value of listitem
					aValue = Left(aCurrentValueSet, InStr(1, aCurrentValueSet, aSubSeparator) - 1)

					' get text of listitem
					If aDone = True Then
						' no separator
						aText = Left(Right(aCurrentValueSet, Len(aCurrentValueSet) - InStr(1, aCurrentValueSet, aSubSeparator)), Len(Right(aCurrentValueSet, Len(aCurrentValueSet) - InStr(1, aCurrentValueSet, aSubSeparator))))
					Else
						' remove separator
						aText = Left(Right(aCurrentValueSet, Len(aCurrentValueSet) - InStr(1, aCurrentValueSet, aSubSeparator)), Len(Right(aCurrentValueSet, Len(aCurrentValueSet) - InStr(1, aCurrentValueSet, aSubSeparator))) - 1)
					End If

					' add item to dropdown
					aLI = New ListItem()
					aLI.Value = aValue
					aLI.Text = aText
					selDropDown.Items.Add(aLI)
				End While
			End If
		End If 'selDropDown.Items.Count
	End Sub

'--------------------------------------------------------------

	Public Sub LoadRows_ParamList(ByVal aControlNode As XmlNode)
		Dim aParamList As String
		Dim aSeparator As String
		Dim aSubSeparator As String

		aParamList = cXMLDoc.AttributeToString(aControlNode, "ParamList")
		aSeparator = cXMLDoc.AttributeToString(aControlNode, "Separator")
		aSubSeparator = cXMLDoc.AttributeToString(aControlNode, "SubSeparator")
		LoadRows_ParamList(aParamList, aSeparator, aSubSeparator)

		SetSelectedValue(aControlNode)

	End Sub

'--------------------------------------------------------------

	Public Function SetSelectedValue(ByVal aControlNode As XmlNode) As Boolean
		Dim aSelectedValueNode As XmlNode
		Dim aSelectedValue As String

		aSelectedValueNode = aControlNode.SelectSingleNode("SelectedValue")
		If Not aSelectedValueNode Is Nothing Then
			EventController.EventController_SetArgumentsInNodeList(aSelectedValueNode)

			aSelectedValue = cXMLDoc.AttributeToString(aSelectedValueNode.SelectSingleNode("Argument"), _
										"Value", "")
			If Not aSelectedValue = "" Then
				SelectedField = aSelectedValue
			End If
			Return True
		Else
			Return False
		End If
	End Function

'--------------------------------------------------------------

	Public Sub Index_Changed(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		'Dim aPageContentControl As cAGCtl = CType(AGPage.FindControl("ctlModuleContent"), cAGCtl).FindControl("ctlPageContent")
		'Dim aAGCtl As Object = aPageContentControl.AGCtl_FindAGCtl(ParentCtl)
		'CallByName(aAGCtl, OnChangeEvent, CallType.Method, SelectedValue)

		If Not mActionNode Is Nothing Then
			If cXMLDoc.AttributeToBool(mActionNode, "PostBack") Then
				Me.EventController.EventController_ControlClicked(aSrc, aArgs)
			End If
		End If
	End Sub

'--------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
		Dim aSelectedValue As String
		Dim aControlNode As XmlNode

		aControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
		If SetSelectedValue(aControlNode) = True Then
			Exit Sub
		End If

		aSelectedValue = DisplayPropertyNode.SelectSingleNode("@PropertyKey").Value.ToString
		SelectedField = aDataObject(aSelectedValue).ToString()
	End Sub

'--------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
		Dim aColName As String

		aColName = cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey")
		If aDataObject Is Nothing Then
			Exit Sub
		Else
			If SelectedValue = "" Then
				aDataObject(aColName) = System.DBNull.Value
			Else
				aDataObject(aColName) = SelectedValue
			End If
		End If
	End Sub

'=============================================================

End Class
End Namespace