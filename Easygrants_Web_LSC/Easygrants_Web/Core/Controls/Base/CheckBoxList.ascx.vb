Imports System.Xml
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base
Public MustInherit Class cCheckBoxList
    Inherits Core.Web.cCoreCtl
'=============================================================

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Protected chkOptionList As CheckBoxList
    Protected valReqDropDown As RequiredFieldValidator

    Private mDisplayNone As Boolean = True
    Private mOnChangeEvent As String = ""
    Private mDisplayPropertyNode As XmlNode
	Private mFilterNodeList As XmlNodeList

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

    Public Property OnChangeEvent() As String
        Get
            OnChangeEvent = mOnChangeEvent
        End Get
        Set(ByVal Value As String)
            mOnChangeEvent = Value
        End Set
    End Property

'--------------------------------------------------------------

	Public Property SelectedCheckBoxes() As String
		Get
			SelectedCheckBoxes() = RetrieveRows()
		End Get
		Set(ByVal value As String)
			Dim aSelectedItems As String() = value.Split(",")
			Dim aSelectedItem As String
			For Each aSelectedItem in aSelectedItems
				If Not chkOptionList.Items.FindByValue(aSelectedItem) Is Nothing Then
					chkOptionList.Items.FindByValue(aSelectedItem).Selected = True
				End If
			Next
		End Set
	End Property

'--------------------------------------------------------------

    Public ReadOnly Property RetrieveRows() As String
        Get
            Dim i As Integer
            Dim strResults As String
            For i = 0 To chkOptionList.Items.Count - 1
                If chkOptionList.Items(i).Selected Then
                    If strResults = Nothing Then
                        strResults = chkOptionList.Items(i).Value
                    Else
                        strResults = strResults & "," & chkOptionList.Items(i).Value
                    End If
                End If
            Next
            RetrieveRows = strResults
        End Get
    End Property

'--------------------------------------------------------------
    
    Public ReadOnly Property SelectedValue() As String
        Get
            If chkOptionList.SelectedIndex = -1 Then
                SelectedValue = ""
            Else
                SelectedValue = chkOptionList.Items(chkOptionList.SelectedIndex).Value.ToString()
            End If
        End Get
    End Property

'--------------------------------------------------------------

    Public WriteOnly Property RepeatDirection() As String
        Set(ByVal Value As String)
            If Value = "Horizontal" Then
                chkOptionList.RepeatDirection = 0
            Else
                chkOptionList.RepeatDirection = 1
            End If
        End Set

    End Property

'-------------------------------------------------------------

    Public WriteOnly Property RepeatColumns() As String
        Set(ByVal Value As String)
            If Value = "" Then
                chkOptionList.RepeatColumns = 0
            Else
                chkOptionList.RepeatColumns = System.Int32.Parse(Value)
            End If
        End Set

    End Property


'-------------------------------------------------------------

    Public WriteOnly Property CellPadding() As String
        Set(ByVal Value As String)
            If Value = "" Then
                chkOptionList.CellPadding = 0
            Else
                chkOptionList.CellPadding = System.Int32.Parse(Value)
            End If
        End Set

    End Property
    
'-------------------------------------------------------------

    Public WriteOnly Property CellSpacing() As String
        Set(ByVal Value As String)
            If Value = "" Then
                chkOptionList.CellSpacing = 0
            Else
                chkOptionList.CellSpacing = System.Int32.Parse(Value)
            End If
        End Set

    End Property
    
'--------------------------------------------------------------

    Public ReadOnly Property BaseControl() As CheckBoxList
        Get
            BaseControl = chkOptionList
        End Get
    End Property

'--------------------------------------------------------------

    Public Property SelectedField() As String
        Get
            If chkOptionList.SelectedIndex = -1 Then
                SelectedField = ""
            Else
                SelectedField = chkOptionList.Items(chkOptionList.SelectedIndex).Value
            End If
        End Get
        Set(ByVal Value As String)
            Dim aItem As ListItem

            '	For each aItem in chkOptionList.Items
            '		aItem.Selected = false
            '	Next
            If chkOptionList.Items.FindByValue(Value.ToString()) Is Nothing Then
            Else
                chkOptionList.Items.FindByValue(Value.ToString()).Selected = True
            End If
        End Set
    End Property

'--------------------------------------------------------------

    Public Sub SelectAll()
        Dim i As Integer
        Dim aChkBox As CheckBox

        For i = 0 To chkOptionList.Items.Count - 1
            chkOptionList.Items(i).Selected = True
        Next i

    End Sub

'--------------------------------------------------------------

    Public Sub ClearAll()
        Dim i As Integer

        For i = 0 To chkOptionList.Items.Count - 1
            chkOptionList.Items(i).Selected = False
        Next i

    End Sub

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

    Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        'selDropDown.AutoPostBack = True

        If OnChangeEvent.ToString() <> "" Then
            chkOptionList.AutoPostBack = True

            AddHandler chkOptionList.SelectedIndexChanged, AddressOf Index_Changed
        End If
    End Sub

'--------------------------------------------------------------

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
        'Populates the checkboxlist based on an XML Control node

        Dim aDataType As String
        Dim aFilters As XmlNode
        Dim aDS As DataSet
        Dim aDataObjList As cDataObjectList
        Dim aDataObj As cDataObject
        Dim aLI As ListItem
		Dim aStoredValueProperty As String
		Dim aStoredSourceValueProperty As String
        Dim aDisplayValueProperty As String
        Dim aControlNode As XmlNode
        Dim aRepeatDirectionProperty As String
        Dim aRepeatColumnsProperty As String
		Dim aFilterNode As XmlNode
		Dim aDefinitionKey As String = ""

        DisplayPropertyNode = aDisplayPropertyNode
		aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
		HideInactiveItems = cXMLDoc.AttributeToBool(aControlNode, "HideInactiveItems", True)

        'Commented out by Sumanth as it is giving problems when using with a userctl loader
        If Not IsPostBack Then
			aFilterNode = aControlNode.SelectSingleNode("Filters")

			If Not aDataObjectList Is Nothing Then
				aDefinitionKey = aDataObjectList.DefinitionKey
			End If

			'Hides inactive lookup values 
			HideInactiveLookupValues(aControlNode, aFilterNode, aDataObjectList.DefinitionKey, HideInactiveItems)
			aFilterNode = aControlNode.SelectSingleNode("Filters")

			If Not (aFilterNode Is Nothing Or EventController Is Nothing) Then
				EventController.EventController_SetArgumentsInNodeList(aFilterNode)
			End If


			'Get data object from factory
			aDataObjList = WebSession.DataObjectFactory.GetDataObjectList(aControlNode)


			'Populate base checkbox list from data object
			aStoredSourceValueProperty = cXMLDoc.AttributeToString(aControlNode, "StoredSourceValue")

			If aStoredSourceValueProperty = "" Then
				aStoredValueProperty = aControlNode.Attributes("StoredValue").Value.ToString
			Else
				aStoredValueProperty = aStoredSourceValueProperty
			End If

			aDisplayValueProperty = aControlNode.Attributes("DisplayValue").Value.ToString


			For Each aDataObj In aDataObjList
				aLI = New ListItem()
				aLI.Value = aDataObj(aStoredValueProperty).ToString()
				'aLI.Text = aDataObj(aDisplayValueProperty).ToString()
				aLI.Text = aDataObj.GetRelatedPropertyString(aDisplayValueProperty)
				chkOptionList.Items.Add(aLI)
			Next
		End If

		RepeatDirection = cXMLDoc.AttributeToString(aControlNode, "RepeatDirection")
		RepeatColumns = cXMLDoc.AttributeToString(aControlNode, "RepeatColumns")
		CellPadding = cXMLDoc.AttributeToString(aControlNode, "CellPadding")
		CellSpacing = cXMLDoc.AttributeToString(aControlNode, "CellSpacing")

		'aRepeatDirectionProperty = aControlNode.Attributes("RepeatDirection").Value.ToString
		'chkOptionList.RepeatDirection = aRepeatDirectionProperty 'aDataObj.DataObjectRow(aRepeatDirectionProperty).ToString()
		'aRepeatColumnsProperty = aControlNode.Attributes("RepeatColumns").Value.ToString
		'chkOptionList.RepeatColumns = aDataObj.DataObjectRow(aRepeatColumnsProperty).ToString()


    End Sub

'--------------------------------------------------------------

    Public Sub LoadRows_ParamList(ByVal aParamList As String, ByVal aSeparator As String, ByVal aSubSeparator As String)
        Dim aLI As ListItem
        Dim aDone As Boolean
        Dim aCurrentValueSet As String
        Dim aValue As String
        Dim aText As String

        If chkOptionList.Items.Count > 0 Then
            Exit Sub
        Else

            'Create "None" list item
            If DisplayNone Then
                aLI = New ListItem()
                aLI.Value = ""
                aLI.Text = "<None>"
                chkOptionList.Items.Add(aLI)
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
                    chkOptionList.Items.Add(aLI)
                End While
            End If
        End If
    End Sub

'--------------------------------------------------------------

    Public Sub Index_Changed(ByVal aSrc As Object, ByVal aArgs As EventArgs)

        'Dim aPageContentControl As cAGCtl = CType(AGPage.FindControl("ctlModuleContent"), cAGCtl).FindControl("ctlPageContent")

        'Dim aAGCtl As Object = aPageContentControl.AGCtl_FindAGCtl(ParentCtl)

        'CallByName(aAGCtl, OnChangeEvent, CallType.Method, SelectedValue)

    End Sub

'--------------------------------------------------------------

    Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
        Dim aPropertyKey As String
        Dim aDataObjectList As cDataObjectList
        Dim aChildDataObject As cDataObject
        Dim aStoredValueProperty As String
        Dim aControlNode As XmlNode
        Dim aItem As ListItem

        aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
        aStoredValueProperty = aControlNode.Attributes("StoredValue").Value.ToString
        aPropertyKey = DisplayPropertyNode.SelectSingleNode("@PropertyKey").Value.ToString
        aDataObjectList = aDataObject.GetRelatedPropertyDataObjectList(aPropertyKey)
        For Each aChildDataObject In aDataObjectList
            aItem = chkOptionList.Items.FindByValue(aChildDataObject(aStoredValueProperty))
            if not aItem is nothing then
                aItem.Selected = True
            End If
        Next
    End Sub


'--------------------------------------------------------------

    Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
        Dim aControlNode As XmlNode
        Dim aPropertyKey As String
        Dim aDefinitionKey As String
        Dim aDataObjectList As cDataObjectList
        Dim aChildDataObject As cDataObject
        Dim aItem As ListItem
        Dim aXMLDoc As cXMLDoc
        Dim aDataObjectNode As XmlNode
        Dim aStoredValuePropertyKey As String
        Dim aDefaultValuesNode As XmlNode
        Dim aDefaultValuesNodeList As XmlNodeList
        Dim aDefaultValueNode As XmlNode
        Dim aDefaultValue As String

        If aDataObject Is Nothing Then Return

        'Delete all rows represented by this check box list
        aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
        aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey")
        aDataObjectList = aDataObject.GetRelatedPropertyDataObjectList(aPropertyKey)
        For Each aChildDataObject In aDataObjectList
            WebSession.DataObjectFactory.DeleteData(aChildDataObject)
        Next

        'Insert data row for each checked item
        aStoredValuePropertyKey = cXMLDoc.AttributeToString(aControlNode, "StoredValue")
        aDefinitionKey = cXMLDoc.AttributeToString(aDataObjectList.ObjDefNode, "Key")
        aDefaultValuesNode = aControlNode.SelectSingleNode("DefaultValues")
        Me.EventController.EventController_SetArgumentsInNodeList(aDefaultValuesNode)
        For Each aItem In chkOptionList.Items
            If aItem.Selected Then
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
                aChildDataObject(aStoredValuePropertyKey) = aItem.Value

            End If
        Next
        'save data
        WebSession.DataObjectFactory.SaveDataObject(aDataObjectList)
    End Sub

'=============================================================
End Class
End Namespace