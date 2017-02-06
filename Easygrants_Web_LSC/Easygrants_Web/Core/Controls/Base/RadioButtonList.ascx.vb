Imports System.Xml
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base
<ValidationPropertyAttribute("RadioButtonList")> Public MustInherit Class cRadioButtonList
    Inherits Core.Web.cCoreCtl

'=============================================================

    Protected rdoRadioButtonList As RadioButtonList
    Protected valReqListBox As RequiredFieldValidator

    Private mDisplayNone As Boolean = True
    Private mDisplayPropertyNode As XmlNode
	Private mFilterNodeList As XmlNodeList

'=============================================================

	Public ReadOnly Property BaseControl() As RadioButtonList
		Get
			BaseControl = rdoRadioButtonList
		End Get
	End Property
	
'=============================================================

    Public ReadOnly Property RadioButtonList() As String
      Get
        Return SelectedValue()
      End Get
   End Property

'=============================================================

    Public Overrides Property DisplayPropertyNode() As XmlNode
        Get
            DisplayPropertyNode = mDisplayPropertyNode
        End Get
        Set(ByVal Value As XmlNode)
            mDisplayPropertyNode = Value
        End Set
    End Property

'-------------------------------------------------------------

    Public Overridable ReadOnly Property RequiredFieldValidator() As RequiredFieldValidator
        Get
            Return valReqListBox
        End Get
    End Property

 '-------------------------------------------------------------  

    Public Property RequiredField() As Boolean
        Get
            RequiredField = valReqListBox.Enabled
        End Get
        Set(ByVal Value As Boolean)
            valReqListBox.Enabled = Value
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

    Public Property DisplayNone() As Boolean
        Get
            DisplayNone = mDisplayNone
        End Get
        Set(ByVal Value As Boolean)
            mDisplayNone = Value
        End Set
    End Property

'----------------------------------------------------

    Public ReadOnly Property SelectedValue() As String
        Get
            If rdoRadioButtonList.SelectedIndex = -1 Then
                SelectedValue = ""
            Else
                SelectedValue = rdoRadioButtonList.Items(rdoRadioButtonList.SelectedIndex).Value.ToString()
            End If
        End Get
    End Property

'--------------------------------------------------------------

    Public Property SelectedField() As String
        Get
            If rdoRadioButtonList.SelectedIndex = -1 Then
                SelectedField = ""
            Else
                SelectedField = rdoRadioButtonList.Items(rdoRadioButtonList.SelectedIndex).Value
            End If
        End Get
        Set(ByVal Value As String)
            Dim aItem As ListItem

            For Each aItem In rdoRadioButtonList.Items
                aItem.Selected = False
            Next
            If rdoRadioButtonList.Items.FindByValue(Value.ToString()) Is Nothing Then
            Else
                rdoRadioButtonList.Items.FindByValue(Value.ToString()).Selected = True
            End If
        End Set
    End Property

'--------------------------------------------------------------

    Public WriteOnly Property RepeatDirection() As String
        Set(ByVal Value As String)
            If Value = "Horizontal" Then
                rdoRadioButtonList.RepeatDirection = 0
            Else
                rdoRadioButtonList.RepeatDirection = 1
            End If
        End Set

    End Property

'-------------------------------------------------------------

    Public WriteOnly Property RepeatColumns() As String
        Set(ByVal Value As String)
			If Value = "" Then
				rdoRadioButtonList.RepeatColumns = 0
			Else
				rdoRadioButtonList.RepeatColumns = Value
			End If
        End Set

    End Property
    
'--------------------------------------------------------------


    Public Sub LoadRows_ParamList(ByVal aControlNode as XmlNode)
        Dim aDataObjList As cDataObjectList
        Dim aDataObj As cDataObject
        Dim aLI As ListItem
        Dim aStoredValueProperty As String
        Dim aDisplayValueProperty As String
        Dim aParameterNodeList as XmlNodeList
        Dim aParameterNode as XmlNode
        
        aParameterNodeList = aControlNode.SelectNodes("Parameters/Parameter")
 				       	
		'Populate base radio button list from data object
		For Each aParameterNode in aParameterNodeList
			aLI = New ListItem()
			aStoredValueProperty = aParameterNode.Attributes("StoredValue").Value.ToString
			aLI.Value = aStoredValueProperty.ToString()
			aDisplayValueProperty = aParameterNode.Attributes("DisplayValue").Value.ToString
			aLI.Text = aDisplayValueProperty.ToString()
			
			If Not rdoRadioButtonList.Items.Contains(aLI) Then
				rdoRadioButtonList.Items.Add(aLI)
			end if
		Next
		
    End Sub

'=============================================================

    Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
    End Sub

'--------------------------------------------------------------

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
        'Populates the radio button list based on an XML Control node
        Dim aControlNode As XmlNode
        Dim aDataObjList As cDataObjectList
        Dim aDataObj As cDataObject
        Dim aLI As ListItem
        Dim aStoredValueProperty As String
        Dim aDisplayValueProperty As String
		Dim aLoadParam as String
		Dim aFilterNode As XmlNode
		Dim aDefaultValue As String
		Dim aDefinitionKey As String = ""


		rdoRadioButtonList.Items.Clear()

        DisplayPropertyNode = aDisplayPropertyNode
        aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
		aFilterNode = aControlNode.SelectSingleNode("Filters")

        RequiredField = cXMLDoc.AttributeToBool(aControlNode, "RequiredField", False)
	    valReqListBox.ErrorMessage = cXMLDoc.AttributeToString(aControlNode, "ErrorMessage")
		RepeatDirection = cXMLDoc.AttributeToString(aControlNode, "RepeatDirection")
		RepeatColumns = cXMLDoc.AttributeToString(aControlNode, "RepeatColumns")
		aLoadParam = cXMLDoc.AttributeToString(aControlNode, "LoadParam")
		DisplayNone = cXMLDoc.AttributeToBool(aControlNode, "DisplayNone", False)
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

		If aLoadParam = "True" Then
			LoadRows_ParamList(aControlNode)
		Else
			'Get data object from factory
			aDataObjList = WebSession.DataObjectFactory.GetDataObjectList(aControlNode)
			If DisplayNone Then
				rdoRadioButtonList.Items.Add(New ListItem("None", ""))
			End If
			'Populate base radio button list from data object
			For Each aDataObj In aDataObjList
				aLI = New ListItem()
				aStoredValueProperty = aControlNode.Attributes("StoredValue").Value.ToString
				aLI.Value = aDataObj(aStoredValueProperty).ToString()
				aDisplayValueProperty = aControlNode.Attributes("DisplayValue").Value.ToString
				'aLI.Text = aDataObj(aDisplayValueProperty).ToString()
				aLI.Text = aDataObj.GetRelatedPropertyString(aDisplayValueProperty)

				If Not rdoRadioButtonList.Items.Contains(aLI) Then
					rdoRadioButtonList.Items.Add(aLI)
				End If
			Next
		End If

		aDefaultValue = cXMLDoc.AttributeToString(aControlNode, "DefaultValue", "")
		If Not aControlNode.Attributes("DefaultValue") Is Nothing Then
			Dim selLI As ListItem = rdoRadioButtonList.Items.FindByValue(aDefaultValue.ToString())
			If Not selLI Is Nothing Then
				selLI.Selected = True
			End If
		End If

		CoreCtl_LoadScriptNodes(aDisplayPropertyNode)
	End Sub

'--------------------------------------------------------------

    Public Overrides Sub AddScript(ByVal aEvent As String, ByVal aScriptName As String, ByVal aParameters As String)
        rdoRadioButtonList.Attributes.Add(aEvent, "JavaScript: " + aScriptName + "('" + aParameters + "');")
    End Sub

'--------------------------------------------------------------

    Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
        Dim aSelectedValue As String
        aSelectedValue = DisplayPropertyNode.SelectSingleNode("@PropertyKey").Value.ToString
        SelectedField = aDataObject(aSelectedValue).ToString()
    End Sub
 '----------------------------------------------------

    Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
	    Dim aColName As String = aDisplayPropertyNode.SelectSingleNode("@PropertyKey").Value

		If SelectedValue = "" Then
			aDataObject(aColName) = System.DBNull.Value
		Else
	        aDataObject(aColName) = SelectedValue
		End If
    End Sub
       
'=============================================================


End Class
End Namespace