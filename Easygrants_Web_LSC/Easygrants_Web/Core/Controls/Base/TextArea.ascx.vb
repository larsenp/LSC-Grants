Imports System.Xml
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Text.RegularExpressions

Namespace Core_Web.Controls.Base


<ValidationPropertyAttribute("TextArea")> Public MustInherit Class cTextArea
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

    Protected txtText As HtmlTextArea
	Protected valReqText As RequiredFieldValidator
	Protected valLength As CustomValidator
	Protected valXML As CustomValidator
    Private mDisplayPropertyNode As XmlNode
    Private mMaxLength As Integer = 0
    Private mTooLongMessage As String
    Private mInvalidXMLMessage As String
    Private mIsXML As Boolean
    Protected ValWordLength As CustomValidator
    Private mMaxWordCountLength As Integer = 0
    Private mMaxWordCountLengthMessage As String
    
'=============================================================

    Public Property MaxLength() As Integer
        Get
            MaxLength = mMaxLength
        End Get
        Set(ByVal Value As Integer)
            mMaxLength = Value
        End Set
    End Property

    Public Property MaxWordCountLength() As Integer
        Get
            MaxWordCountLength = mMaxWordCountLength
        End Get
        Set(ByVal value As Integer)
            mMaxWordCountLength = value
        End Set
    End Property
    
'-------------------------------------------------------------
    Public ReadOnly Property TextArea() As String
      Get
		 Return txtText.Value.Trim
      End Get

   End Property
   	
'-------------------------------------------------------------

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

    Public Overridable ReadOnly Property BaseTextArea() As HtmlTextArea
    Get
        BaseTextArea = txtText
    End Get
    End Property

'-------------------------------------------------------------

    Public Property Value() As String
        Get
			Value = BaseTextArea.InnerText.Trim
        End Get
        Set(ByVal Value As String)
			BaseTextArea.InnerText = Value.Trim
        End Set
    End Property

'-------------------------------------------------------------

    Public Property Cols() As Integer
        Get
            Cols = BaseTextArea.Cols
        End Get
        Set(ByVal Value As Integer)
            BaseTextArea.Cols = Value
        End Set
    End Property

'-------------------------------------------------------------

    Public Property Rows() As Integer
        Get
            Rows = BaseTextArea.Rows
        End Get
        Set(ByVal Value As Integer)
            BaseTextArea.Rows = Value
        End Set
    End Property

 '-------------------------------------------------------------  

    Public Overridable WriteOnly Property ValidateFieldName() As String
        Set(ByVal Value As String)
            RequiredFieldValidator.ErrorMessage =  Value
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

'-------------------------------------------------------------

    Public Property TooLongMessage() As String
        Get
            Return mTooLongMessage
        End Get
        Set(ByVal Value As String)
            mTooLongMessage = Value
        End Set
    End Property

    Public Property MaxWordCountLengthMessage() As String
        Get
            Return mMaxWordCountLengthMessage
        End Get
        Set(ByVal Value As String)
            mMaxWordCountLengthMessage = Value
        End Set
    End Property
    
    Public Property InvalidXMLMessage() As String
        Get
            Return mInvalidXMLMessage
        End Get
        Set(ByVal Value As String)
            mInvalidXMLMessage = Value
        End Set
    End Property

'=============================================================

    Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
            MyBase.CoreCtl_Load(sender, e)
    End Sub

'-------------------------------------------------------------

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
    'Populates the drop-down based on an XML Control node

		AddScript("onkeypress", "StopPropogation", "event,this")

        Dim aControlNode As XmlNode
        Dim aPropertyKey As String
        Dim aRows As Integer
        Dim aCols As Integer
        Dim aMaxLength As Integer
		Dim aRequiredField as Boolean
			
        DisplayPropertyNode = aDisplayPropertyNode
        aControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
        RequiredField = cXMLDoc.AttributeToBool(aControlNode,"RequiredField")		
        aRows = cXMLDoc.AttributeToInt(aControlNode, "Rows")
        aCols = cXMLDoc.AttributeToInt(aControlNode, "Cols")
        aMaxLength = cXMLDoc.AttributeToInt(aControlNode, "MaxLength")
        TooLongMessage = cXMLDoc.AttributeToString(aControlNode,"TooLongMessage")
        mIsXML = cXMLDoc.AttributeToBool(aControlNode, "IsXML", False)
        InvalidXMLMessage = cXMLDoc.AttributeToString(aControlNode,"InvalidXMLMessage")
        ValidateFieldName = cXMLDoc.AttributeToString(aControlNode, "ErrorMessage")
        MaxWordCountLength = cXMLDoc.AttributeToInt(aControlNode, "MaxWordCountLength", 0)
        MaxWordCountLengthMessage = cXMLDoc.AttributeToString(aControlNode, "MaxWordCountLengthMessage")
        If aRows <> 0 Then
            Rows = aRows
        End If
        If aCols <> 0 Then
            Cols = aCols
        End If
        If aMaxLength <> 0 Then
			MaxLength = aMaxLength

			AddScript("onkeyup", "TrimValueToMaxlength", "this," + MaxLength.ToString)
        End If

		CoreCtl_LoadScriptNodes(aDisplayPropertyNode)
    End Sub

'----------------------------------------------------

    Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
        Dim aPropertyKey As String

        aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey").ToString()
        Value = aDataObject(aPropertyKey).ToString()

    End Sub

'-------------------------------------------------------------------------

    Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
	    Dim aColName As String = aDisplayPropertyNode.SelectSingleNode("@PropertyKey").Value
        
        aDataObject(aColName) = Value
    End Sub

'----------------------------------------------------------------------------

   Public Sub ValidateLength(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		if (MaxLength <> 0) and Value.Length > MaxLength then
			aArgs.IsValid = False
			If TooLongMessage <> "" Then valLength.ErrorMessage = TooLongMessage
		end if
   End Sub

    Public Sub ValidateWordCount(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
        Dim aValueWordCount() As String = Regex.Split(Value, "\s+")
        If MaxWordCountLength > 0 Then
            If aValueWordCount.Length > MaxWordCountLength Then
                aArgs.IsValid = False
                If MaxWordCountLengthMessage <> "" Then ValWordLength.ErrorMessage = MaxWordCountLengthMessage
            End If
        End If

   End Sub
   
   Public Sub ValidateXML(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		If Value <> "" AndAlso mIsXML AndAlso Not cXMLDoc.IsWellFormedXML(Value) then
			aArgs.IsValid = False
			If InvalidXMLMessage <> "" Then valXML.ErrorMessage = InvalidXMLMessage
		End If
   End Sub

	Public Overrides Sub AddScript(ByVal aEvent As String, ByVal aScriptName As String, ByVal aParameters As String)
		BaseTextArea.Attributes.Add(aEvent, "return " + aScriptName + "(" + aParameters + ");")
	End Sub
'=============================================================

End Class
End Namespace