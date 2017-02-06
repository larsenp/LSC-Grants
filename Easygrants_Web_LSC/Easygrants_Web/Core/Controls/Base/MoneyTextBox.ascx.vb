Imports System.Text
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base
Public Class cMoneyTextBox
	Inherits Core_Web.Controls.Base.cTextBox
'=============================================================

	Protected mFormat As String
	Protected mMaxInputDecimalPlaces As Integer
	Protected mAllowInputCommas As Boolean
	Protected valCusFormats As CustomValidator
	Protected valRexText As RegularExpressionValidator
	Protected SpnCurrencyRegex As HtmlGenericControl
	Private mCommaErrorMessage As String = "Commas are improperly formatted."
	Private mDecimalErrorMessage As String = "Decimals are improperly formatted."
	Private mRegExErrorMessage As String = "The currency field must contain only digits."
	Private mRegExExpression As String
'=============================================================

	Public Property Format() As String
		Get
			Return mFormat
		End Get
		Set(ByVal Value As String)
			mFormat = Value
		End Set
	End Property

'----------------------------------------------------

	Public Property MaxInputDecimalPlaces() As Integer
		Get
			Return mMaxInputDecimalPlaces
		End Get
		Set(ByVal Value As Integer)
			mMaxInputDecimalPlaces = Value
		End Set
	End Property

'----------------------------------------------------

	Public Property AllowInputCommas() As Boolean
		Get
			Return mAllowInputCommas
		End Get
		Set(ByVal Value As Boolean)
			mAllowInputCommas = Value
		End Set
	End Property

	Public Property RegularExpression() As String
		Get
			Return SpnCurrencyRegex.InnerHtml
		End Get
		Set(ByVal Value As String)
			SpnCurrencyRegex.InnerHtml = Value
		End Set
	End Property

'----------------------------------------------------

	Public Property NumericValue() As Decimal
		Get
			Dim aValueArray As Char() = Value.ToCharArray
			Dim aValueChar As Char
			Dim aNumberBuilder As StringBuilder = New StringBuilder()
			For Each aValueChar In aValueArray
				If Char.IsDigit(aValueChar) Or aValueChar = "."c Or aValueChar = "-"c Then
					aNumberBuilder.Append(aValueChar)
				End If
			Next
			If aNumberBuilder.ToString.Trim = "" Then
				Return System.Decimal.MinValue
			Else
				Return System.Decimal.Parse(aNumberBuilder.ToString)
			End If
		End Get
		Set(ByVal aValue As Decimal)
			If Format = "" Then
				Me.Value = aValue.ToString
			Else
				Me.Value = String.Format("{0:" + Format + "}", aValue)
			End If
		End Set
	End Property

'----------------------------------------------------

	Public Property RegExErrorMessage() As String
		Get
			Return mRegExErrorMessage
		End Get
		Set(ByVal Value As String)
			mRegExErrorMessage = Value
		End Set
	End Property

'----------------------------------------------------

	Public Property CommaErrorMessage() As String
		Get
			Return mCommaErrorMessage
		End Get
		Set(ByVal Value As String)
			mCommaErrorMessage = Value
		End Set
	End Property

'----------------------------------------------------

	Public Property DecimalErrorMessage() As String
		Get
			Return mDecimalErrorMessage
		End Get
		Set(ByVal Value As String)
			mDecimalErrorMessage = Value
		End Set
	End Property

'=============================================================

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
		MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)

		Dim aControlNode As XmlNode = DisplayPropertyNode.SelectSingleNode("Control")

		Dim aFormat As String = cXMLDoc.AttributeToString(aControlNode, "Format")
		If aFormat <> "" Then Format = aFormat

		Dim aMaxInputDecimalPlaces As String = cXMLDoc.AttributeToString(aControlNode, "MaxInputDecimalPlaces")
		If aMaxInputDecimalPlaces <> "" Then MaxInputDecimalPlaces = System.Int32.Parse(aMaxInputDecimalPlaces)

		Dim aRegExErrorMessage As String = cXMLDoc.AttributeToString(aControlNode, "RegExErrorMessage")
		If aRegExErrorMessage <> "" Then
			RegExErrorMessage = aRegExErrorMessage
		End If


		Dim aDecimalErrorMessage As String = cXMLDoc.AttributeToString(aControlNode, "DecimalErrorMessage")
		If aDecimalErrorMessage <> "" Then
			DecimalErrorMessage = aDecimalErrorMessage
		End If


		Dim aCommaErrorMessage As String = cXMLDoc.AttributeToString(aControlNode, "CommaErrorMessage")
		If aCommaErrorMessage <> "" Then
			CommaErrorMessage = aCommaErrorMessage
		End If

		Dim aRegExExpression As String = cXMLDoc.AttributeToString(aControlNode, "RegularExpression")
		If aRegExExpression <> "" Then
			RegularExpression = aRegExExpression
		End If


		AllowInputCommas = cXMLDoc.AttributeToBool(aControlNode, "AllowInputCommas", True)
	End Sub

'----------------------------------------------------

	Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
		Dim aPropertyKey As String

		aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey").ToString()
		If Not aDataObject(aPropertyKey) Is System.DBNull.Value Then
			NumericValue = aDataObject.GetPropertyDecimal(aPropertyKey)
		End If
	End Sub

'----------------------------------------------------

	Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
		Dim aColName As String = aDisplayPropertyNode.SelectSingleNode("@PropertyKey").Value
		If NumericValue = System.Decimal.MinValue Then
			aDataObject(aColName) = System.DBNull.Value
		Else
			aDataObject(aColName) = NumericValue
		End If
	End Sub

'----------------------------------------------------
	Protected Sub ValidateCurrencyField(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		aArgs.IsValid = True

	   If Not (System.Text.RegularExpressions.Regex.IsMatch(Value, RegularExpression)) Then
			aArgs.IsValid = False
			valCusFormats.ErrorMessage = RegExErrorMessage
			Exit Sub
	   End If

	   If Not ValidateDecimals() Then
			aArgs.IsValid = False
			valCusFormats.ErrorMessage = DecimalErrorMessage
			Exit Sub
	   End If

		If Not ValidateCommas() Then
			aArgs.IsValid = False
			valCusFormats.ErrorMessage = CommaErrorMessage
			Exit Sub
	   End If

	End Sub
	Protected Function ValidateCommas() As Boolean
		If Value.IndexOf(",") = -1 Then
			Return True
			Exit Function
		End If
		If AllowInputCommas Then
			Return CommasAreValid()
		Else
		End If
	End Function

'----------------------------------------------------

	Protected Function ValidateDecimals() As Boolean
		Dim aIndex As Integer = Value.IndexOf(".")
		'If there's no decimal we're always OK (control does not enforce minimum number of decimal places)
		If aIndex = -1 Then
			Return True
			Exit Function
		End If

		'If we've gotten here, we know there's a decimal point. If the maximum is 0, the control is invalid
		If MaxInputDecimalPlaces = 0 Then
			Return False
			Exit Function
		End If

		'Count the number of characters after the decimal point and compare it to the maximum.
		If Value.Length - aIndex - 1 > MaxInputDecimalPlaces Then
			Return False
		Else
			Return True
		End If
	End Function

'----------------------------------------------------

	Protected Function CommasAreValid() As Boolean
		If Value.IndexOf(",") = -1 Then
			Return True
		End If

		Dim aLastBeforeDecimal As Integer
		Dim aFirstDigit As Integer = -1
		Dim aWholeNumber As String
		Dim i As Integer
		Dim aChar As Char
		Dim aWholeNumberArray As Char()

		aLastBeforeDecimal = Value.IndexOf(".") - 1
		If aLastBeforeDecimal = -2 Then aLastBeforeDecimal = Value.Length - 1

		'Get index of first digit in value - relevant if minus sign or (potentially) currency indicator precedes the number
		For i = 0 To Value.Length - 1
			If Char.IsDigit(Value.Chars(i)) Then
				aFirstDigit = i
				Exit For
			End If
		Next
		If aFirstDigit = -1 Then Return False

		'Get string representing the whole number, first digit to decimal point. This should consist only of digits and commas, with digits grouped into threes.
		aWholeNumber = Value.Substring(aFirstDigit, aLastBeforeDecimal - aFirstDigit + 1)
		aWholeNumberArray = aWholeNumber.ToCharArray
		For i = 1 To aWholeNumber.Length
			aChar = aWholeNumber.Substring(aWholeNumber.Length - i)
			If i Mod 4 = 0 Then
				If aChar <> ","c Then
					Return False
				End If
			Else
				If Not Char.IsDigit(aChar) Then
					Return False
				End If
			End If
		Next
		Return True
	End Function

'=============================================================

End Class
End Namespace