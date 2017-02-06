Imports System.Xml
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base
<ValidationPropertyAttribute("Dropdown")> Public MustInherit Class cAutoCompleteTextBox
	Inherits Core.Web.cCoreCtl
'=============================================================

	'Protected selDropDown As DropDownList
	'Protected valReqDropDown As RequiredFieldValidator
	'Protected valRangeDropDown As RangeValidator

	Private mDisplayNone As Boolean = True
	Private mDisplayText As String
	Private mOnChangeEvent As String = ""
	Private mDisplayPropertyNode As XmlNode
	'Private mFilterNodeList As XmlNodeList
	'Private mListItems As ListItemCollection
	'Private mHideInactiveItems As Boolean = True
	Private mActionNode As XmlNode
	Private mDisplayTextValue As String
	Private mErrorMessage As String
	Protected txtAutoComplete As TextBox
	Protected hdnObjID As HtmlInputHidden
	Protected hdnObjText As HtmlInputHidden
	Protected valSelection As CustomValidator
	Protected mAutoCompleteExtender As AjaxControlToolkit.AutoCompleteExtender

'=============================================================

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

	Public ReadOnly Property ControlID() As String
		Get
			ControlID = cXMLDoc.GetControlID(DisplayPropertyNode)
		End Get
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

	Public Property SelectedValue() As String
		Get
			Return hdnObjID.Value
		End Get
		Set(ByVal Value As String)
			hdnObjID.Value = Value
		End Set
	End Property

'--------------------------------------------------------------

	Public Property SelectedText() As String
		Get
			Return hdnObjText.Value
		End Get
		Set(ByVal Value As String)
			hdnObjText.Value = Value
		End Set
	End Property

'--------------------------------------------------------------

	Public ReadOnly Property BaseControl() As TextBox
		Get
			BaseControl = txtAutoComplete
		End Get
	End Property

'--------------------------------------------------------------

	Public Property Value() As String
		Get
			Value = BaseControl.Text.Trim
		End Get
		Set(ByVal Value As String)
			BaseControl.Text = Value.Trim
		End Set
	End Property

'--------------------------------------------------------------

	Public Property ErrorMessage() As String
		Get
			ErrorMessage = mErrorMessage
		End Get
		Set(ByVal Value As String)
			mErrorMessage = Value
		End Set
	End Property

	Public Property RequiredField() As Boolean
		Get
			RequiredField = valSelection.Enabled
		End Get
		Set(ByVal Value As Boolean)
			valSelection.Enabled = Value
		End Set
	End Property

	Public Property Size() As Unit
		Get
			Size = BaseControl.Width
		End Get
		Set(ByVal Value As Unit)
			BaseControl.Width = Value
		End Set
	End Property

'-------------------------------------------------------------

	Public Property MaxLength() As Integer
		Get
			MaxLength = BaseControl.MaxLength
		End Get
		Set(ByVal Value As Integer)
			BaseControl.MaxLength = Value
		End Set
	End Property

'--------------------------------------------------------------

	Public Overloads Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
	'Populates the drop-down based on an XML Control node

		Dim aDataType As String
		Dim aFilters As XmlNode
		Dim aDS As DataSet
		Dim aDataObjList As cDataObjectList
		Dim aDataObj As cDataObject
		Dim aLI As ListItem
		Dim aStoredValueProperty As String
		Dim aDisplayValueProperty As String
		Dim aControlNode As XmlNode
		'Dim aErrorMessage As String
		Dim aParamList As String
		Dim aUniqueStoredValue As Boolean
		Dim aDefaultValue As String

		DisplayPropertyNode = aDisplayPropertyNode
		aControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
		aFilters = aControlNode.SelectSingleNode("Filters")
		mAutoCompleteExtender.SearchValue = cXMLDoc.AttributeToString(aControlNode, "SearchValue")
		mAutoCompleteExtender.SearchText = cXMLDoc.AttributeToString(aControlNode, "SearchText")
		mAutoCompleteExtender.DataObjectDefinitionKey = cXMLDoc.AttributeToString(aControlNode, "DataObjectDefinitionKey")
		mAutoCompleteExtender.MinimumPrefixLength = cXMLDoc.AttributeToInt(aControlNode, "MinimumPrefixLength", 2)
		mAutoCompleteExtender.CompletionSetCount = cXMLDoc.AttributeToInt(aControlNode, "CompletionSetCount", 20)
		mAutoCompleteExtender.OnClientItemSelected = cXMLDoc.AttributeToString(aControlNode, "OnClientItemSelected", "UpdateHiddenObjects")
		mAutoCompleteExtender.SearchOperator = cXMLDoc.AttributeToString(aControlNode, "SearchOperator", "Like")
		mErrorMessage = cXMLDoc.AttributeToString(aControlNode, "ErrorMessage")
		MaxLength = cXMLDoc.AttributeToInt(aControlNode, "MaxLength", 50)
		RequiredField = cXMLDoc.AttributeToBool(aControlNode, "RequiredField", False)
		Size = cXMLDoc.AttributeToInt(aControlNode, "Size", 50)

		CoreCtl_LoadScriptNodes(aDisplayPropertyNode)
	End Sub

'--------------------------------------------------------------

	Public Overrides Sub AddScript(ByVal aEvent As String, ByVal aScriptName As String, ByVal aParameters As String)
		'selDropDown.Attributes.Add(aEvent, "JavaScript: " + aScriptName + "('" + aParameters + "');")
	End Sub

'--------------------------------------------------------------

	Public Overloads Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList, _
											ByVal aItems As ListItemCollection)
		CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
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
			Return True
		Else
			Return False
		End If
	End Function

'--------------------------------------------------------------

	Public Sub Index_Changed(ByVal aSrc As Object, ByVal aArgs As EventArgs)

		If Not mActionNode Is Nothing Then
			If cXMLDoc.AttributeToBool(mActionNode, "PostBack") Then
				Me.EventController.EventController_ControlClicked(aSrc, aArgs)
			End If
		End If
	End Sub

'--------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
		Dim aDisplayPropertyText As String
		Dim aDisplayPropertyValue As String
		Dim aControlNode As XmlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
		aDisplayPropertyText = cXMLDoc.AttributeToString(aControlNode, "DisplayValue")
		aDisplayPropertyValue = cXMLDoc.AttributeToString(aControlNode, "StoredValue")
		SelectedValue = aDataObject.GetRelatedPropertyString(aDisplayPropertyValue)
		SelectedText = aDataObject.GetRelatedPropertyString(aDisplayPropertyText)
		Value = aDataObject.GetRelatedPropertyString(aDisplayPropertyText)
	End Sub

'--------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
		Dim aColName As String
		Dim aControlNode As XmlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
		aColName = cXMLDoc.AttributeToString(aControlNode, "UniqueStoredValue")
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

	Protected Sub ValidateSelected(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		If SelectedValue = "" Then
			aArgs.IsValid = False
			valSelection.ErrorMessage = ErrorMessage
			Exit Sub
		ElseIf Not Value = SelectedText Then
			aArgs.IsValid = False
			valSelection.ErrorMessage = ErrorMessage
			Exit Sub
		End If
	End Sub

'=============================================================

End Class
End Namespace