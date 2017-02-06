Imports System.Xml
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base

<ValidationPropertyAttribute("TextBox")> Public MustInherit Class cDateTimeTextBox
	Inherits Core.Web.cCoreCtl
'=============================================================

    Protected lblList As HtmlContainerControl
    Protected txtDate As HtmlInputText
    Protected valReqDate As RequiredFieldValidator
    Protected valRexDate As RegularExpressionValidator
    Protected valValidateDate As CustomValidator
    
	Protected ancCalendar As HtmlAnchor
	Protected spnCalendar As HtmlGenericControl
    Protected spnTimeZone As HtmlGenericControl
    Protected ctlHour As DropDownList
    Protected ctlMinute As DropDownList
    Protected ctlAMPM As DropDownList
	
    Private mDisplayPropertyNode As XmlNode
    Private Const kFirstPossibleDate As Date = #1/1/1753#
    Private Const kLastPossibleDate As Date = #12/31/9999#
    Private mDate As Date
    Private mFirstDate As Date = kFirstPossibleDate
    Private mLastDate As Date = kLastPossibleDate
    Private mDateFormat As String = "MMMM d, yyyy" 'default display format for dates
    Private mValidateFieldName As String
	Private mEarlier As String
	Private mLater As String
   
'=============================================================

	Public ReadOnly Property URL() As String
		Get
            Dim aURL As String = WebAppl.Build_RootURL("Core/Controls/Base/Calendar.aspx" + "?UniqueID=" + UniqueID)
			
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

    Public ReadOnly Property TextBox() As String
      Get
         Return txtDate.Value.ToString()
      End Get
    End Property
   
'----------------------------------------------------

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
	'Populates the drop-down based on an XML Control node

		'Dim aDataType As String
		'Dim aFilters As XmlNode
		'Dim aDS As DataSet
		'Dim aDataObjList As cDataObjectList
		'Dim aDataObj As cDataObject
		'Dim aLI As ListItem
		'Dim aStoredValueProperty As String
		'Dim aDisplayValueProperty As String
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
        DateFormat = cXMLDoc.AttributeToString(aControlNode, "DateFormat")
        RequiredField = cXMLDoc.AttributeToBool(aControlNode, "RequiredField", False)
        If RequiredField Then
            valReqDate.ErrorMessage = cXMLDoc.AttributeToString(aControlNode, "ErrorMessage")
            valReqDate.Enabled = True
        End If
        'aDateFormatExist = cXMLDoc.AttributeToString(aControlNode, "DateFormat")
        'If aDateFormatExist <> "" Then
        '    DateFormat = aDateFormatExist
        'End If

        aRegularExpressionString = cXMLDoc.AttributeToString(aControlNode, "RegularExpression", "")
		if aRegularExpressionString <> "" Then
			RegularExpressionString = aRegularExpressionString
		End If
		
        aDateFormatErrorMessage = cXMLDoc.AttributeToString(aControlNode, "DateFormatErrorMessage")
        If aDateFormatErrorMessage <> "" Then
            valRexDate.ErrorMessage = aDateFormatErrorMessage
        End If

		Dim aNotSupportedDateErrorMessage As String = cXMLDoc.AttributeToString(aControlNode, "NotSupportedDateErrorMessage")
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
        
        SetTimeZone()
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
            If txtDate.Value <> "" Then
                DateString = txtDate.Value
            Else
                DateString = ""
            End If
        End Get
        Set(ByVal Value As String)
            txtDate.Value = Value
        End Set
    End Property

'----------------------------------------------------

    Public Property myDate() As Object
        Get
            If txtDate.Value <> "" Then
                Try
					myDate = DateTime.Parse(txtDate.Value) + " " + ctlHour.SelectedItem.Value.ToString() + ":" + ctlMinute.SelectedItem.Value.ToString() + " " + ctlAMPM.SelectedItem.Value.ToString()
				Catch exFormat As FormatException
					Dim err As String = exFormat.Message
					myDate = System.DBNull.Value
				End Try
            Else
                myDate = System.DBNull.Value
            End If
        End Get
        Set(ByVal Value As Object)
            mDate = Value
            SetTimeControls()
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
            Width = txtDate.Size
        End Get
        Set(ByVal Value As Integer)
            txtDate.Size = Value
        End Set
    End Property

'-------------------------------------------------------------

    Public Property MaxLength() As Integer
        Get
            MaxLength = txtDate.MaxLength
        End Get
        Set(ByVal Value As Integer)
            txtDate.MaxLength = Value
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
                aDate = DateTime.Parse(txtDate.Value) + " " + ctlHour.SelectedItem.Value.ToString() + ":" + ctlMinute.SelectedItem.Value.ToString() + " " + ctlAMPM.SelectedItem.Value.ToString()
                SQLDate = Format(aDate, "yyyy/M/d hh:mm")
            Catch exFormat As FormatException
                SQLDate = ""
            End Try
        End Get
    End Property

'----------------------------------------------------

    Public Sub ValidateDate(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
        aArgs.IsValid = True
        If txtDate.Value = "" Then
            aArgs.IsValid = False
            Exit Sub
        Else
            Try
				myDate = DateTime.Parse(txtDate.Value) + " " + ctlHour.SelectedItem.Value.ToString() + ":" + ctlMinute.SelectedItem.Value.ToString() + " " + ctlAMPM.SelectedItem.Value.ToString()
            Catch exFormat As FormatException
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

    Private Sub SetDateText()
        If mDate = Nothing Then
            txtDate.Value = ""
            Exit Sub
        End If
        If mDateFormat = "" Then
            txtDate.Value = Format(mDate, "mm/dd/YYYY")
       Else
            txtDate.Value = Format(mDate, mDateFormat)
        End If
    End Sub

'----------------------------------------------------

	Private Sub SetTimeControls()
		If mDate.Hour = 0 Or mDate.Hour = 12 Then
			ctlHour.SelectedIndex = 11
		Else
			ctlHour.SelectedIndex = mDate.Hour Mod 12 - 1
		End If
		Select mDate.Minute
			Case 0
				ctlMinute.SelectedIndex = 0
			Case 15
				ctlMinute.SelectedIndex = 1
			Case 30
				ctlMinute.SelectedIndex = 2
			Case 45
				ctlMinute.SelectedIndex = 3
		End Select
		
		If mDate.Hour >= 12 Then
			ctlAMPM.SelectedIndex = 1 'PM
		Else
			ctlAMPM.SelectedIndex = 0 'AM
		End If
	End Sub

'----------------------------------------------------

    Private Sub SetTimeZone()
		Dim strTimeZone As String = System.TimeZone.CurrentTimeZone.StandardName
		If strTimeZone.StartsWith("Eastern") Then
			spnTimeZone.InnerHtml = "ET"
		Else If strTimeZone.StartsWith("Central") Then
			spnTimeZone.InnerHtml = "CT"
		Else If strTimeZone.StartsWith("Mountain") Then
			spnTimeZone.InnerHtml = "MT"
		Else If strTimeZone.StartsWith("Pacific") Then
			spnTimeZone.InnerHtml = "PT"
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
        valReqDate.ErrorMessage = "You must enter a value for " + ValidateFieldName & "."
        valRexDate.ErrorMessage = "The entered value for " + ValidateFieldName & " is not formatted properly or is not a valid date."
        valValidateDate.ErrorMessage = "The entered value for " + ValidateFieldName & " is not a valid date."
    End Sub

'====================================================
End Class

End Namespace 'Core_Web.Controls.Base
