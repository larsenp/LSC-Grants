Imports System.Xml
Imports Core.Web
Imports System.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Text.RegularExpressions

Namespace Core_Web.Controls.Base

<ValidationPropertyAttribute("SelectedValueList")> Public MustInherit Class cDoubleListBox
    Inherits Core.Web.cCoreCtl

    Protected selLeft As ListBox
    Protected selRight As ListBox
    Protected tblSort As HtmlTable
    Protected hdnList As HtmlInputHidden
    Protected spnMoveAll As HtmlGenericControl
    Private mDisplayPropertyNode As XmlNode
    Private mDisplayNone As Boolean = True
	Private mFilterNodeList As XmlNodeList

'--------------------------------------------------------------

    Public Property Width() As Unit
        Get
            Width = selLeft.Width
        End Get
        Set(ByVal Value As Unit)
            selLeft.Width = Value
            selRight.Width = Value
        End Set
    End Property

'=============================================================

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

    Public Property DisplaySort As Boolean
		Get
			Return tblSort.Visible
		End Get
		Set
			tblSort.Visible = Value
		End Set
    End Property
    
'----------------------------------------------------

    Public Property Size() As Integer
        Get
            Size = selLeft.Rows
        End Get
        Set(ByVal Value As Integer)
            selLeft.Rows = Value
            selRight.Rows = Value
        End Set

    End Property

'--------------------------------------------------------------

    Public ReadOnly Property ControlAbbrevName() As String
        Get
            ControlAbbrevName = ID
        End Get
    End Property

'--------------------------------------------------------------

    Public Property SelectedValueList() As String
        Get
            SelectedValueList = hdnList.Value
        End Get
        Set(ByVal Value As String)
            hdnList.Value = Value
        End Set
    End Property

'--------------------------------------------------------------

    Public ReadOnly Property BaseControl() As ListBox
        Get
            BaseControl = selRight
        End Get
    End Property
    
'----------------------------------------------------

    Public Property DisplayMoveAll As Boolean
		Get
			Return spnMoveAll.Visible
		End Get
		Set
			spnMoveAll.Visible = Value
		End Set
    End Property

'--------------------------------------------------------------

    Public Sub AGCtl_ClearLeftRows_SQL()
        selLeft.Items.Clear()
    End Sub

'--------------------------------------------------------------

    Public Sub AGCtl_ClearRightRows()
        selRight.Items.Clear()
        hdnList.Value = ""
    End Sub

'--------------------------------------------------------------

   Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		'CorePage.CorePage_RegisterScriptBlock("../../../Core/Includes/doubleListbox.js", _
		'								"DoubleListBox")
  End Sub

'--------------------------------------------------------------


   Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)

		MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
		If Not Visible Then
			Exit Sub
		End If

		Dim aDataType As String
		Dim aFilters As XmlNode
		Dim aDS As DataSet

		Dim aListItemsDataObjList As cDataObjectList
		Dim aDataObjList As cDataObjectList
		Dim aDataObj As cDataObject
		Dim aLI As ListItem
		Dim aStoredValueProperty As String
		Dim aStoredSourceValueProperty As String
		Dim aDisplayValueProperty As String
		Dim aControlNode As XmlNode
		Dim aFilterNode As XmlNode
		Dim aJoinFilterNodeList As XmlNodeList
		Dim aWidth As String
		Dim aWidthUnit As Unit
		Dim aHeight As String
		Dim aHeightSize As Integer
		Dim aDefinitionKey As String = ""

		DisplayPropertyNode = aDisplayPropertyNode
		aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
		aFilterNode = aControlNode.SelectSingleNode("Filters")
		HideInactiveItems = cXMLDoc.AttributeToBool(aControlNode, "HideInactiveItems", True)

		If Not aDataObjectList Is Nothing Then
			aDefinitionKey = aDataObjectList.DefinitionKey
		End If

		'Hides inactive lookup values 
		HideInactiveLookupValues(aControlNode, aFilterNode, aDataObjectList.DefinitionKey, HideInactiveItems)
		aFilterNode = aControlNode.SelectSingleNode("Filters")


		If Not (aFilterNode Is Nothing Or EventController Is Nothing) Then
				EventController.EventController_SetArgumentsInNodeList(aFilterNode)
		End If

		aListItemsDataObjList = WebSession.DataObjectFactory.GetDataObjectList(aControlNode)

		'The width setting in XML will be rendered in picas
		'1 pica = 1/6 inch = roughly one letter's width.
		aWidth = cXMLDoc.AttributeToString(aControlNode, "Width")
		If aWidth <> "" Then
			aWidthUnit = New Unit(System.Int32.Parse(aWidth), UnitType.Pica)
			Width = aWidthUnit
		End If

		aHeight = cXMLDoc.AttributeToString(aControlNode, "Height")
		If aHeight <> "" Then
			aHeightSize = System.Int32.Parse(aHeight)
			Size = aHeightSize
		End If

		'Create "None" list item
		DisplayNone = cXMLDoc.AttributeToBool(aControlNode, "DisplayNone", True)
		If DisplayNone Then
			aLI = New ListItem()
			aLI.Value = ""
			aLI.Text = "<None>"
			AddItemLeft(aLI)
		End If

		'Note: For backward compatibility reasons, the Add All and Remove All buttons
		'are invisible by default, while the Up and Down buttons are visible by default.

		'Determine whether Add All and Remove All buttons should be displayed
		spnMoveAll.Visible = cXMLDoc.AttributeToBool(aControlNode, "DisplayMoveAll", False)

		'Determine whether Sort (Up and Down) buttons should be displayed
		tblSort.Visible = cXMLDoc.AttributeToBool(aControlNode, "DisplaySort", True)


		'If this is not a postback, populate base list box from data object
		If Not IsPostBack Then
			aStoredSourceValueProperty = cXMLDoc.AttributeToString(aControlNode, "StoredSourceValue")

			If aStoredSourceValueProperty = "" Then
				aStoredValueProperty = aControlNode.Attributes("StoredValue").Value.ToString
			Else
				aStoredValueProperty = aStoredSourceValueProperty
			End If

			aDisplayValueProperty = aControlNode.Attributes("DisplayValue").Value.ToString

			If cXMLDoc.AttributeToBool(aControlNode, "Sort", False) Then
				Dim aSortedList As SortedList = New SortedList()
				Dim aKey As String

				For Each aDataObj In aListItemsDataObjList
					aSortedList.Add(aDataObj.GetRelatedPropertyString(aDisplayValueProperty), aDataObj.GetRelatedPropertyString(aStoredValueProperty))
					On Error Resume Next
				Next

				For Each aKey In aSortedList.Keys
					aLI = New ListItem()
					aLI.Value = aSortedList(aKey)
					aLI.Text = aKey
					AddItemLeft(aLI)
				Next
			Else
				For Each aDataObj In aListItemsDataObjList
					aLI = New ListItem()
					aLI.Value = aDataObj.GetRelatedPropertyString(aStoredValueProperty)
					aLI.Text = aDataObj.GetRelatedPropertyString(aDisplayValueProperty)
					AddItemLeft(aLI)
				Next
			End If
		End If
	End Sub

'--------------------------------------------------------------

	Public Sub AddItemLeft(ByVal aListItem As ListItem)
		If Not selLeft.Items.Contains(aListItem) Then
			selLeft.Items.Add(aListItem)
		End If
	End Sub

'--------------------------------------------------------------

	Public Sub AddItemRight(ByVal aListItem As ListItem)
		If Not selRight.Items.Contains(aListItem) Then
			selRight.Items.Add(aListItem)
		End If
		If hdnList.Value.ToString = "" Then
			hdnList.Value = aListItem.Value
		Else
			Dim aSelectedItems As String()
			aSelectedItems = SelectedValueList.Split(",")
			If Array.IndexOf(aSelectedItems, aListItem.Value) < 0 Then
				hdnList.Value = hdnList.Value & "," & aListItem.Value
			End If
		End If
	End Sub

'--------------------------------------------------------------

	Public Sub AGCtl_AddRightRow(ByVal aValue As String, ByVal aText As String)
		Dim aLI As ListItem

		aLI = New ListItem()
		aLI.Value = aValue
		aLI.Text = aText
		AddItemRight(aLI)
	End Sub

'--------------------------------------------------------------

	Public Sub AGCtl_RemoveLeftRow(ByVal aValue As String)
		Dim aLI As ListItem
		For Each aLI In selLeft.Items
			If aLI.Value.ToString = aValue.ToString Then
				selLeft.Items.Remove(aLI)
				Exit Sub
			End If
		Next aLI
	End Sub

	Public Sub AGCtl_RemoveRightRow(ByVal aValue As String)
		Dim aRegexValidator As String = "[,]?\b" + aValue + "\b[,]?"
		Dim aRegEx As Regex
		Dim aLI As ListItem
		aLI = selRight.Items.FindByValue(aValue)
		If Not aLI Is Nothing Then
			selRight.Items.Remove(aLI)
			Dim aRightValues As String = hdnList.Value
			Dim aMatch As Match = aRegEx.Match(aRightValues, aRegexValidator)
			If aMatch.Success Then
				Dim aCountComma() As String = aMatch.Value.Split(",")
				'IF is the case where the Value contains ",2," to be removed from a string (1,2,3) and this case we are replacing with “,”,
				' and the rest all cases goes to elseif condition and we are replacing with empty
				If aCountComma.Length > 2 Then
					hdnList.Value = aRegEx.Replace(aRightValues, aRegexValidator, ",")
				ElseIf aCountComma.Length <= 2 Then
					hdnList.Value = aRegEx.Replace(aRightValues, aRegexValidator, "")
				End If
			End If
		End If
	End Sub
	
	Public Sub AGCtl_AddLeftRow(ByVal aValue As String, ByVal aText As String)
		Dim aLI As ListItem

		aLI = New ListItem()
		aLI.Value = aValue
		aLI.Text = aText
		AddItemLeft(aLI)
	End Sub

'--------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
		Dim aPropertyKey As String
		Dim aDataObjectList As cDataObjectList
		Dim aChildDataObject As cDataObject
		Dim aStoredValueProperty As String
		Dim aDisplayValueProperty As String
		Dim aControlNode As XmlNode
		Dim aItem As ListItem
		Dim aLI As ListItem

		aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
		aStoredValueProperty = aControlNode.Attributes("StoredValue").Value.ToString
		aDisplayValueProperty = aControlNode.Attributes("StoredDisplayValue").Value.ToString
		aPropertyKey = DisplayPropertyNode.SelectSingleNode("@PropertyKey").Value.ToString
		aDataObjectList = aDataObject.GetRelatedPropertyDataObjectList(aPropertyKey)

		If aPropertyKey <> "" Then
			If cXMLDoc.AttributeToBool(aControlNode, "SortSelected", False) Then
				Dim aSortedList As SortedList = New SortedList()
				Dim aKey As String

				For Each aDataObject In aDataObjectList
					aSortedList.Add(aDataObject.GetRelatedPropertyString(aDisplayValueProperty), aDataObject.GetRelatedPropertyString(aStoredValueProperty))
					On Error Resume Next
				Next

				For Each aKey In aSortedList.Keys
					aLI = New ListItem()
					aLI.Value = aSortedList(aKey)
					aLI.Text = aKey
					AddItemRight(aLI)
				Next
			Else
				For Each aDataObject In aDataObjectList
					aLI = New ListItem()
					aLI.Value = aDataObject.GetRelatedPropertyString(aStoredValueProperty)
					aLI.Text = aDataObject.GetRelatedPropertyString(aDisplayValueProperty)
					AddItemRight(aLI)
				Next
			End If
		End If

	End Sub

'--------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
		Dim aControlNode As XmlNode
		Dim aPropertyKey As String
		Dim aDefinitionKey As String
		Dim aDataObjectList As cDataObjectList
		Dim aChildDataObject As cDataObject
		Dim aItem As String
		Dim aXMLDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aStoredValuePropertyKey As String
		Dim aDefaultValuesNode As XmlNode
		Dim aDefaultValuesNodeList As XmlNodeList
		Dim aDefaultValueNode As XmlNode
		Dim aDefaultValue As String

		'Delete all rows represented by this check box list
		aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
		aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey")
		aDataObjectList = aDataObject.GetRelatedPropertyDataObjectList(aPropertyKey)
		For Each aChildDataObject In aDataObjectList
			WebSession.DataObjectFactory.DeleteData(aChildDataObject)
		Next

		'Insert data row for each item
		aStoredValuePropertyKey = cXMLDoc.AttributeToString(aControlNode, "StoredValue")
		aDefinitionKey = cXMLDoc.AttributeToString(aDataObjectList.ObjDefNode, "Key")
		aDefaultValuesNode = aControlNode.SelectSingleNode("DefaultValues")
		Me.EventController.EventController_SetArgumentsInNodeList(aDefaultValuesNode)

		If SelectedValueList <> "" Then
			Dim aSelectedItems As String()
			aSelectedItems = SelectedValueList().Split(",")

			For Each aItem In aSelectedItems
				'build data object node
				aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode(aDefinitionKey, aDataObjectNode)

				'create data object
				aChildDataObject = aDataObjectList.AddNewDataObject()

				'set default values
				aDefaultValuesNodeList = aDefaultValuesNode.SelectNodes("Argument")
				For Each aDefaultValueNode In aDefaultValuesNodeList
					aPropertyKey = cXMLDoc.AttributeToString(aDefaultValueNode, "PropertyKey")
					aDefaultValue = cXMLDoc.AttributeToString(aDefaultValueNode, "Value")
					aChildDataObject(aPropertyKey) = aDefaultValue
				Next

				'set stored value
				aChildDataObject(aStoredValuePropertyKey) = aItem.ToString()
			Next
			'save data
			WebSession.DataObjectFactory.SaveDataObject(aDataObjectList)
		End If
	End Sub

	'--------------------------------------------------------------

	Public Sub SelectItemByValue(ByVal aValue As String)
		If selRight.Items.FindByValue(aValue) Is Nothing Then
			' Value Does Not Exist
			'selDropDown.Items.FindByValue("").Selected = True
		Else
			selRight.Items.FindByValue(aValue).Selected = True
		End If
	End Sub

'--------------------------------------------------------------

	Public Function GetItemByValue(ByVal aValue As String) As ListItem
		Dim aReturnItem As ListItem

		aReturnItem = selLeft.Items.FindByValue(aValue)
		If aReturnItem Is Nothing Then
			aReturnItem = selRight.Items.FindByValue(aValue)
		End If
		Return aReturnItem
	End Function

'--------------------------------------------------------------

	Public Sub UpdateSelectionFromSelectedValueList
		'On postback, the double list box is populated by the viewstate, which does not reflect any items moved by the
		'user after the page was initially loaded. This method uses the SelectedValueList property to render the
		'changes made by the user to the control.
		
		Dim aSelectedValues() As String = SelectedValueList.Split(",")
		Dim aSelectedValue As String
		Dim aRightItems As ArrayList = New ArrayList
		Dim aLeftItem As ListItem
		Dim aRightItem As ListItem
		Dim i As Integer

		'Loop through the right-hand list box to ensure that it holds no items not represented in the SelectedValueList.
		
		'First, copy all the items. Loop through the copy to avoid problems when items get deleted.
		aRightItems.AddRange(selRight.Items)
		For Each aRightItem In aRightItems
			If Array.IndexOf(aSelectedValues, aRightItem.Value) = -1 And aRightItem.Text.Trim <> "" Then
				aLeftItem = New ListItem(aRightItem.Text, aRightItem.Value)
				AddItemLeft(aLeftItem)
				selRight.Items.Remove(aRightItem)
			End If
		Next
		
		'Loop through the SelectedValueList to ensure that all selected values are in the right list box.
		For Each aSelectedValue In aSelectedValues
			aLeftItem = selLeft.Items.FindByValue(aSelectedValue)
			If Not aLeftItem Is Nothing AndAlso aLeftItem.Text.Trim <> "" Then
				aRightItem = New ListItem(aLeftItem.Text, aSelectedValue)
				AddItemRight(aRightItem)
			End If
		Next
	End Sub
	
'--------------------------------------------------------------

	Protected Overrides Sub OnPreRender(e As EventArgs)
		MyBase.OnPreRender(e)
		'For reasons I can't explain, the value of the hidden control that contains the selected values for the double list
		'box is not available at the time of the load event, even though this follows the LoadViewState event. However, the
		'information is available at the time of the PreRender event, so we place here the function call that "corrects" the 
		'list box data to match any changes made by the user since the previous page load.
		'Peter Larsen 3/15/2005
		If IsPostBack Then
			UpdateSelectionFromSelectedValueList
		End If
	End Sub
	
'=============================================================
End Class
End Namespace