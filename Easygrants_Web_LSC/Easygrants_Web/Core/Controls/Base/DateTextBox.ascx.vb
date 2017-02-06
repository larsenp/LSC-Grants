Imports System.Xml
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base

<ValidationPropertyAttribute("TextBox")> Public MustInherit Class cDateTextBox
	Inherits Core.Web.cCoreCtl
'=============================================================

    Protected lblList As HtmlContainerControl
    Protected txtDate As HtmlInputText
    Protected valReqDate As RequiredFieldValidator
    Protected valRexDate As RegularExpressionValidator
    Protected valValidateDate As CustomValidator

	Protected ancCalendar As HtmlAnchor
	Protected spnCalendar As HtmlGenericControl
	
    Private mDisplayPropertyNode As XmlNode
    Private Const kFirstPossibleDate As Date = #1/1/1753#
    Private Const kLastPossibleDate As Date = #12/31/9999#
        Protected mDate As Date
        Protected mFirstDate As Date = kFirstPossibleDate
        Protected mLastDate As Date = kLastPossibleDate
    Private mDateFormat As String = "MMMM d, yyyy" 'default display format for dates
    Private mValidateFieldName As String
	Private mEarlier As String
	Private mLater As String
   
'=============================================================

	Public ReadOnly Property URL() As String
		Get
			dim aURL as String = WebAppl.Build_RootURL("Core/Controls/Base/Calendar.aspx" + "?UniqueID=" + UniqueID)
			
			if mEarlier <> "" then
				aURL = cWebLib.AddQuerystringParameter(aURL, "EarlierThan", mEarlier)
			end if
			
			if mLater <> "" then
				aURL = cWebLib.AddQuerystringParameter(aURL, "LaterThan", mLater)
			end if
			
			Return aURL
		End Get
	End Property

        '----------------------------------------------------
        Public Overridable ReadOnly Property BaseTextBox() As HtmlInputText
            Get
                BaseTextBox = txtDate
            End Get
        End Property

    Public ReadOnly Property TextBox() As String
      Get
                Return BaseTextBox.Value.ToString()
      End Get
    End Property
   
'----------------------------------------------------

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
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
        Dim aPropertyKey As String
        'Dim aDateFormatExist As String
		Dim aMaxLength As Integer
		Dim aRegularExpressionString As String
        Dim aValidateFieldName As String
        Dim aDateFormatErrorMessage As String
		
		DisplayPropertyNode = aDisplayPropertyNode
		aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
		
		if cXMLDoc.AttributeToString(aControlNode, "Calendar") = "True" then
			spnCalendar.Visible = True
			mEarlier = cXMLDoc.AttributeToString(aControlNode, "EarlierThan")
			mLater = cXMLDoc.AttributeToString(aControlNode, "LaterThan")
		end if
		
        aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey")
        Width = cXMLDoc.AttributeToInt(aControlNode,"Width")
		aMaxLength = cXMLDoc.AttributeToInt(aControlNode, "MaxLength")
        aValidateFieldName = cXMLDoc.AttributeToString(aControlNode,"ValidateFieldName")
        if aValidateFieldName <> "" then
			ValidateFieldName = aValidateFieldName
        end if
        DateFormat = cXMLDoc.AttributeToString(aControlNode,"DateFormat")
        RequiredField = cXMLDoc.AttributeToBool(aControlNode, "RequiredField", False)
        If RequiredField Then
            valReqDate.ErrorMessage = cXMLDoc.AttributeToString(aControlNode, "ErrorMessage")
        End If
        'aDateFormatExist = cXMLDoc.AttributeToString(aControlNode, "DateFormat")
        aRegularExpressionString = cXMLDoc.AttributeToString(aControlNode, "RegularExpression", "")

		if aRegularExpressionString <> "" Then
			RegularExpressionString = aRegularExpressionString
		End If		
        'If aDateFormatExist <> "" Then
        '    DateFormat = aDateFormatExist
        'End If

        aDateFormatErrorMessage = cXMLDoc.AttributeToString(aControlNode, "DateFormatErrorMessage")
        If aDateFormatErrorMessage <> "" Then
            valRexDate.ErrorMessage = aDateFormatErrorMessage
        End If

        Dim aNotSupportedDateErrorMessage = cXMLDoc.AttributeToString(aControlNode, "NotSupportedDateErrorMessage")
        If aNotSupportedDateErrorMessage <> "" Then
            valValidateDate.ErrorMessage = aNotSupportedDateErrorMessage
        End If

        If Not aDataObjectList Is Nothing Then
            If Not aDataObjectList(0) Is Nothing Then
                If Not IsDBNull(aDataObjectList(0)(aPropertyKey)) Then
                    myDate = aDataObjectList(0)(aPropertyKey)
                End If
            End If
        End If

        If aMaxLength <> 0 Then
            MaxLength = aMaxLength
        End If
    End Sub

'----------------------------------------------------

    Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
        Dim aColName As String = aDisplayPropertyNode.SelectSingleNode("@PropertyKey").Value
        aDataObject(aColName) = myDate
    End Sub

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

    Public Property DateString() As String
        Get
                If BaseTextBox.Value <> "" Then
                    DateString = BaseTextBox.Value
                Else
                    DateString = ""
                End If
        End Get
        Set(ByVal Value As String)
                BaseTextBox.Value = Value
        End Set
    End Property

'----------------------------------------------------

        Public Overridable Property myDate() As Object
            Get
                'myDate = mDate
                'Changed 8/4/2003 to allow for saving of updated text box value as date
                'Don't know what other consequences this might have.
                'If this is the way to go, should we store the date as a member variable?
                'Peter Larsen
                If BaseTextBox.Value.Trim() <> "" Then
                    'myDate = DateTime.Parse(txtDate.Value)
                    Try
                        myDate = DateTime.Parse(BaseTextBox.Value)
                    Catch exFormat As FormatException
                        Dim err As String = exFormat.Message
                    End Try
                Else
                    myDate = System.DBNull.Value
                End If
            End Get
            Set(ByVal Value As Object)
                mDate = Value
                SetDateText()
            End Set
        End Property

'----------------------------------------------------

    Public Property DateFormat() As String
        Get
            DateFormat = mDateFormat
        End Get
        Set(ByVal Value As String)
            mDateFormat = Value
            SetDateText()
        End Set
    End Property

'----------------------------------------------------

    Public WriteOnly Property RegularExpressionString() As String
        Set(ByVal Value As String)
            valRexDate.ValidationExpression = Value
            If Value <> "" Then
                valRexDate.Visible = True
                valRexDate.Enabled = True
            End If
        End Set
    End Property

'----------------------------------------------------

    Public Property Width() As Integer
        Get
                Width = BaseTextBox.Size
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

'----------------------------------------------------

    Public Property ValidateFieldName() As String
        Get
            ValidateFieldName = mValidateFieldName
        End Get
        Set(ByVal Value As String)
            mValidateFieldName = Value
            SetErrorMessages()
        End Set
    End Property

'----------------------------------------------------

    Public Property RequiredField() As Boolean
        Get
            RequiredField = valReqDate.Enabled
        End Get
        Set(ByVal Value As Boolean)
            valReqDate.Enabled = Value
        End Set
    End Property

'----------------------------------------------------

    Public Property FirstDate() As String
        Get
            FirstDate = mFirstDate.ToString()
        End Get
        Set(ByVal Value As String)
            Try
                mFirstDate = DateTime.Parse(Value)
            Catch exFormat As FormatException
                mFirstDate = #1/1/1753#
            End Try
            SetErrorMessages()
        End Set
    End Property

'----------------------------------------------------

    Public Property LastDate() As String
        Get
            LastDate = mLastDate.ToString()
        End Get
        Set(ByVal Value As String)
            Try
                mLastDate = DateTime.Parse(Value)
            Catch exFormat As FormatException
                mLastDate = #12/31/9999#
            End Try
            SetErrorMessages()
        End Set
    End Property

'----------------------------------------------------

    Public ReadOnly Property SQLDate() As String
        'This property returns a text string that should be safe to include in a SQL statement
        Get
            Dim aDate As DateTime

            Try
                    aDate = DateTime.Parse(BaseTextBox.Value)
                SQLDate = Format(aDate, "yyyy/M/d")
            Catch exFormat As FormatException
                SQLDate = ""
            End Try
        End Get
    End Property

'----------------------------------------------------

        Public Overridable Sub ValidateDate(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            aArgs.IsValid = True
            If BaseTextBox.Value = "" Then
                aArgs.IsValid = False
                Exit Sub
            Else
                Try
                    myDate = DateTime.Parse(BaseTextBox.Value)
                Catch ex As Exception
                    aArgs.IsValid = False
                    If valRexDate.Enabled Then
                        valRexDate.Enabled = False
                        valRexDate.Visible = False
                        valValidateDate.ErrorMessage = valRexDate.ErrorMessage
                    End If
                    Exit Sub
                End Try

                If mDate > mLastDate Then
                    aArgs.IsValid = False
                    valRexDate.Enabled = False
                    valRexDate.Visible = False
                    Exit Sub
                End If
                If mDate < mFirstDate Then
                    aArgs.IsValid = False
                    valRexDate.Enabled = False
                    valRexDate.Visible = False
                    Exit Sub
                End If
            End If
        End Sub

'----------------------------------------------------

        Protected Sub SetDateText()
            If mDate = Nothing Then
                BaseTextBox.Value = ""
                Exit Sub
            End If
            If mDateFormat = "" Then
                BaseTextBox.Value = mDate.ToString()
            Else
                BaseTextBox.Value = Format(mDate, mDateFormat)
            End If
        End Sub

'----------------------------------------------------

    Private Function FormatDateFromText(ByVal aDateStr As String) As String
        Dim aDate As Date

        Try
            aDate = DateTime.Parse(aDateStr)
            FormatDateFromText = Format(aDate, mDateFormat)
        Catch exFormat As FormatException
            FormatDateFromText = ""
        End Try
    End Function

'----------------------------------------------------

    Private Sub SetErrorMessages()
            valReqDate.ErrorMessage = "Enter a value for " + ValidateFieldName & "."
        valRexDate.ErrorMessage = "The entered value for " + ValidateFieldName & " is not formatted properly or is not a valid date."
        valValidateDate.ErrorMessage = "The entered value for " + ValidateFieldName & " is not a supported date."
    End Sub

'====================================================
End Class

End Namespace 'Core_Web.Controls.Base
