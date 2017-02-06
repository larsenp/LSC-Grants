Imports System.Xml
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base
Public MustInherit Class cListBox
    Inherits Core.Web.cCoreCtl
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
'=============================================================

    Protected ctlListBox As ListBox
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

    Public Property SelectedField() As String
        Get
            SelectedField = ctlListBox.Items(ctlListBox.SelectedIndex).Value
        End Get
        Set(ByVal Value As String)
            Dim aItem As ListItem

            For Each aItem In ctlListBox.Items
                aItem.Selected = False
            Next
            If ctlListBox.Items.FindByValue(Value.ToString()) Is Nothing Then
                ' Value Does Not Exist
                'selDropDown.Items.FindByValue("").Selected = True
            Else
                ctlListBox.Items.FindByValue(Value.ToString()).Selected = True
            End If
        End Set
    End Property

'--------------------------------------------------------------

    Public ReadOnly Property SelectedValue() As String
        Get
            If ctlListBox.SelectedItem Is Nothing Then
                SelectedValue = ""
            Else
                SelectedValue = ctlListBox.SelectedItem.Value
            End If
        End Get

    End Property

'--------------------------------------------------------------

    Public Property Width() As Unit
    'Note: When the Width property is set, the width of the list box becomes
    'independent of its contents. It will neither grow nor shrink to fit the
    'length of the list items.
        Get
            Width = ctlListBox.Width
        End Get
        Set(ByVal Value As Unit)
            ctlListBox.Width = Value
        End Set
    End Property
'=============================================================

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
    'Populates the list box based on an XML Control node
    'Parameters
    ' ' aDisplayPropertyNode - the XML node that defines the list box
    ' ' aDataObjectList - the data object list containing the single data object

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
        Dim aDisplayValueProperty As String
        Dim aControlNode As XmlNode
        Dim aFilterNode As XmlNode
        Dim aJoinFilterNodeList As XmlNodeList
        Dim aWidth As String
        Dim aWidthUnit As Unit

        DisplayPropertyNode = aDisplayPropertyNode
        aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
        aFilterNode = aControlNode.SelectSingleNode("Filters")
        EventController.EventController_SetArgumentsInNodeList(aFilterNode)

        aListItemsDataObjList = WebSession.DataObjectFactory.GetDataObjectList(aControlNode)

        'The width setting in XML will be rendered in picas
        '1 pica = 1/6 inch = roughly one letter's width.
        aWidth = cXMLDoc.AttributeToString(aControlNode, "Width")
        If aWidth <> "" Then
            aWidthUnit = New Unit(System.Int32.Parse(aWidth), UnitType.Pica)
            Width = aWidthUnit
        End If

        'Create "None" list item
        DisplayNone = cXMLDoc.AttributeToBool(aControlNode, "DisplayNone", True)
        If DisplayNone Then
            aLI = New ListItem()
            aLI.Value = ""
            aLI.Text = "<None>"
            ctlListBox.Items.Add(aLI)
        End If

        'Populate base list box from data object
        aStoredValueProperty = aControlNode.Attributes("StoredValue").Value.ToString
        aDisplayValueProperty = aControlNode.Attributes("DisplayValue").Value.ToString
        
        if not aControlNode.Attributes("Sort") is nothing then
            If aControlNode.Attributes("Sort").Value.ToString.Trim() = "True" Then
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
                    ctlListBox.Items.Add(aLI)
                Next
            End If
		Else        
            For Each aDataObj In aListItemsDataObjList
                aLI = New ListItem()
                aLI.Value = aDataObj.GetRelatedPropertyString(aStoredValueProperty)
                aLI.Text = aDataObj.GetRelatedPropertyString(aDisplayValueProperty)
                ctlListBox.Items.Add(aLI)
            Next
        End If

    End Sub
'--------------------------------------------------------------

    Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)

        Dim aSelectedValue As String
        Dim aSelectedItemsDataObjList As cDataObjectList
        Dim aPropertyKey As String
        Dim aControlNode As XmlNode


        aSelectedItemsDataObjList = aDataObject.GetRelatedPropertyDataObjectList(cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey"))
        aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
        aPropertyKey = cXMLDoc.AttributeToString(aControlNode, "SelectedValueKey")
        If aPropertyKey <> "" Then
            For Each aDataObject In aSelectedItemsDataObjList
                SelectItemByValue(aDataObject(aPropertyKey).ToString())
            Next
        End If
    End Sub

'--------------------------------------------------------------

    Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
        Dim aSelectedItemsDataObjList As cDataObjectList
        Dim aItem As ListItem
        Dim aSetDataObjList As cDataObjectList

        ''Get related data object list
        'aSelectedItemsDataObjList = aDataObjectList(0).GetRelatedPropertyDataObjectList(cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey"), WebSession.DataObjectFactory)
        ''Delete each object in the list
        'For Each aDataObject In aSelectedItemsDataObjList
        '    'WebSession.DataObjectFactory.DeleteData()
        'Next
        ''Loop through list box items
        'For Each aItem In ctlListBox.Items
        '    'If item is selected, get new data object, populate and save
        '    If aItem.Selected Then
        '        aSetDataObjList = WebSession.DataObjectFactory.GetNewDataObjectList()
        '    End If
        'Next
    End Sub

'--------------------------------------------------------------

    Public Sub SelectItemByValue(ByVal aValue As String)
        If ctlListBox.Items.FindByValue(aValue) Is Nothing Then
            ' Value Does Not Exist
            'selDropDown.Items.FindByValue("").Selected = True
        Else
            ctlListBox.Items.FindByValue(aValue).Selected = True
        End If
    End Sub

'=============================================================


End Class
End Namespace 'Core_Web.Controls.Base

