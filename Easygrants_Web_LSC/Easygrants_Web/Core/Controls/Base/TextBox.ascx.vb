Imports System.Xml
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base


<ValidationPropertyAttribute("TextBox")> Public MustInherit Class cTextBox
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

    Protected txtText As HtmlInputText
	Protected valReqText As RequiredFieldValidator
	Private mDisplayPropertyNode As XmlNode

'=============================================================

    Public ReadOnly Property TextBox() As String
		Get
			Return txtText.Value.ToString.Trim()
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
        Return valReqText
    End Get
    End Property

'-------------------------------------------------------------

    Public Overridable ReadOnly Property BaseTextBox() As HtmlInputText
		Get
			BaseTextBox = txtText
		End Get
    End Property

'-------------------------------------------------------------

    Public Property Value() As String
        Get
                Value = BaseTextBox.Value.Trim
        End Get
        Set(ByVal Value As String)
                BaseTextBox.Value = Value.Trim
        End Set
    End Property

'-------------------------------------------------------------

    Public Property Size() As Integer
        Get
            Size = BaseTextBox.Size
        End Get
        Set(ByVal Value As Integer)
            BaseTextBox.Size = Value
        End Set
    End Property

'-------------------------------------------------------------

    Public Property MaxLength() As Integer
        Get
            MaxLength = BaseTextBox.MaxLength
        End Get
        Set(ByVal Value As Integer)
            BaseTextBox.MaxLength = Value
        End Set
    End Property
'-------------------------------------------------------------

	Public Property Disabled() As Boolean
		Get
			Disabled = BaseTextBox.Disabled
		End Get
		Set(ByVal Value As Boolean)
			BaseTextBox.Disabled = Value
		End Set
	End Property
 '-------------------------------------------------------------  

	Public Overridable WriteOnly Property ValidateFieldName() As String
		Set(ByVal Value As String)
			RequiredFieldValidator.ErrorMessage = Value
		End Set
	End Property

'-------------------------------------------------------------

	Public Property RequiredField() As Boolean
		Get
			RequiredField = RequiredFieldValidator.Enabled
		End Get
		Set(ByVal Value As Boolean)
			RequiredFieldValidator.Enabled = Value
		End Set
	End Property

	Public WriteOnly Property AllowNumbersOnly() As Boolean
		Set(ByVal value As Boolean)
			If value = True Then
				AddScript("onkeypress", "isNumberKey", "event")
				AddScript("onblur", "maskChange", "this")
			End If
		End Set
	End Property
'--------------------------------------------------------------

    Public Sub Set_ServerChange(ByVal aHandler As EventHandler)

        AddHandler txtText.ServerChange, aHandler

	End Sub




'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		
		'BaseTextBox.Attributes.Add("onkeyup", "next('" + ID + "')")
		'CorePage.CorePage_RegisterScriptBlock(WebAppl.Build_RootURL("Core/Includes/CTextBox.js"), _
		'								"CTextBox")
	End Sub

'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
	'Populates the drop-down based on an XML Control node

		Dim aControlNode As XmlNode
		Dim aPropertyKey As String
		Dim aMaxLength As Integer
		Dim aSize As Integer
		Dim aRequiredField As Boolean
		Dim aErrorMessage As String

	
        MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
		DisplayPropertyNode = aDisplayPropertyNode
		aControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
		RequiredField = cXMLDoc.AttributeToBool(aControlNode, "RequiredField")
		aMaxLength = cXMLDoc.AttributeToInt(aControlNode, "MaxLength")
		aErrorMessage = cXMLDoc.AttributeToString(aControlNode, "ErrorMessage")
		If aErrorMessage <> "" Then
			ValidateFieldName = aErrorMessage
		End If
		If aMaxLength <> 0 Then
			MaxLength = aMaxLength
		End If
		 aSize = cXMLDoc.AttributeToInt(aControlNode, "Size")
		If aSize <> 0 Then
			Size = aSize
		End If

		Dim TextAlign As String
		TextAlign = cXMLDoc.AttributeToString(aControlNode, "TextAlign", "").Trim().ToLower()
		If TextAlign <> "" Then
			txtText.Style.Add("text-align", TextAlign)
		End If

		AllowNumbersOnly = cXMLDoc.AttributeToBool(aControlNode, "AllowNumbersOnly", False)

		CoreCtl_LoadScriptNodes(aDisplayPropertyNode)
	End Sub
	Public Overrides Sub AddScript(ByVal aEvent As String, ByVal aScriptName As String, ByVal aParameters As String)
		BaseTextBox.Attributes.Add(aEvent, "return " + aScriptName + "(" + aParameters + ");")
	End Sub
'----------------------------------------------------

	Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
		Dim aPropertyKey As String

		aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey").ToString()
		Value = aDataObject(aPropertyKey).ToString()
	End Sub

'----------------------------------------------------

	Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
		Dim aColName As String = aDisplayPropertyNode.SelectSingleNode("@PropertyKey").Value
		If Value = "" Then
			'Check underlying data type
			Dim aPropertyNode As XmlNode
			aPropertyNode = aDataObject.ObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aColName + "']")
			If cXMLDoc.AttributeToString(aPropertyNode, "DataType") = "String" Then
				aDataObject(aColName) = Value
			Else
				'If not a string (i.e., numeric), populate property with DBNull instead of blank string
				aDataObject(aColName) = System.DBNull.Value
			End If
		Else
			aDataObject(aColName) = Value
		End If
	End Sub

'=============================================================

End Class
End Namespace