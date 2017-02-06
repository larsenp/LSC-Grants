Imports System.Text
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base

<ValidationPropertyAttribute("Email")> Public MustInherit Class cEmailTextBox
    Inherits Core_Web.Controls.Base.cTextBox

    Protected txtEmail As HtmlInputText
    Protected valRexEmail As RegularExpressionValidator
    Protected valReqEmail As RequiredFieldValidator
    Protected mAllowMultiple As Boolean = False 'The regular expression configured in the .ascx file is assumed to be for a single e-mail.
    Protected mBaseRegEx As String

'=============================================================

    Public ReadOnly Property Email() As String
		Get
			Return txtEmail.Value.ToString.Trim()
		End Get
	End Property

'=============================================================

    Public Overrides ReadOnly Property BaseTextBox() As HtmlInputText
		Get
			BaseTextBox = txtEmail
		End Get
    End Property

'-------------------------------------------------------------

    Public Overrides ReadOnly Property RequiredFieldValidator() As RequiredFieldValidator
		Get
			Return valReqEmail
		End Get
    End Property

'-------------------------------------------------------------

    Public Overrides WriteOnly Property ValidateFieldName() As String
        Set(ByVal Value As String)
				valRexEmail.ErrorMessage = "E-mail Address is incorrectly formatted. Use the following format to enter the e-mail address: test@test.edu or test@test.edu.au."
            valReqEmail.ErrorMessage = Value
        End Set
    End Property
    
'-------------------------------------------------------------  

    Public Overridable WriteOnly Property RexValidateFieldName() As String
		Set(ByVal Value As String)
			If Value<>"" then
				valRexEmail.ErrorMessage = Value
			Else
					valRexEmail.ErrorMessage = "E-mail Address is incorrectly formatted. Use the following format to enter the e-mail address: test@test.edu or test@test.edu.au."
			End If
		End Set
    End Property
    
'-------------------------------------------------------------  

	Public WriteOnly Property AllowMultiple As Boolean
		Set
			If Value = True and mAllowMultiple = False Then
				'Capture original regular expression so that it can be reused if AllowMultiple is set back to True
				mBaseRegEx = valRexEmail.ValidationExpression
				'Change regular expression to allow multiple addresses separated by commas and optional spaces
				Dim aRegEx As String = mBaseRegEx.Substring(1, valRexEmail.ValidationExpression.Length - 2)
				Dim aRegExBuilder As StringBuilder = New StringBuilder("^" + aRegEx)
				aRegExBuilder.Append("(,(\s)*")
				aRegExBuilder.Append(aRegEx)
				aRegExBuilder.Append(")*$")
				valRexEmail.ValidationExpression = aRegExBuilder.ToString()
			End If
			If Value = False And mAllowMultiple = True Then
				valRexEmail.ValidationExpression = mBaseRegEx
			End If
			mAllowMultiple = Value
		End Set
	End Property
	
'=============================================================

    Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)
        
		'BaseTextBox.Attributes.Add("onkeyup", "next('" + ID + "')")
    End Sub

'-------------------------------------------------------------

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
        MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
        Dim aRexErrorMessage As String
        aRexErrorMessage = cXMLDoc.AttributeToString(cXMLDoc.GetControlNode(DisplayPropertyNode), "RexErrorMessage")
        If aRexErrorMessage <> "" Then
            RexValidateFieldName = aRexErrorMessage
        End If
        Dim aControlNode As XmlNode = aDisplayPropertyNode.SelectSingleNode("Control")
        If cXMLDoc.AttributeToBool(aControlNode, "AllowMultiple") Then
			AllowMultiple = True
        End If
        
        'DisplayPropertyNode = aDisplayPropertyNode
        'Dim aControlNode As XmlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
        'RequiredField = cXMLDoc.AttributeToBool(aControlNode, "RequiredField")
        'ValidateFieldName = cXMLDoc.AttributeToString(aControlNode, "ValidateFieldName")
        'MaxLength = cXMLDoc.AttributeToInt(aControlNode, "MaxLength")
        'Size = cXMLDoc.AttributeToInt(aControlNode, "Size")
        'Value = cXMLDoc.AttributeToInt(aControlNode, "Value")
    End Sub

'=============================================================

End Class
End Namespace
