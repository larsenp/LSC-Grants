Imports System.Xml
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base

    <ValidationPropertyAttribute("DateTextBox")> Public MustInherit Class cDateTextBoxCalendar
        Inherits Core_Web.Controls.Base.cDateTextBox

        Protected txt_Date As HtmlInputText
        Protected imgCalendar As System.Web.UI.WebControls.Image
        'Protected valReqDate As RequiredFieldValidator
        'Protected valRexDate As RegularExpressionValidator
        'Protected valValidateDate As CustomValidator

        Protected spnTimeControls As HtmlGenericControl
        Protected spnTimeZone As HtmlGenericControl
        Protected ctlHour As DropDownList
        Protected ctlMinute As DropDownList
        Protected ctlAMPM As DropDownList

        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)

            CorePage.CorePage_RegisterScriptBlock("../../../Core/Includes/popcalendar.js", _
                     "DateTextBox1")

            Dim scriptStr As String = _
        "javascript:return popUpCalendar(this," & getClientID() & ", 'mm/dd/yyyy', '__doPostBack(\'" & getClientID() & "\')')"
            imgCalendar.Attributes.Add("onclick", scriptStr)
        End Sub

        Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
            MyBase.CoreCtl_SetDataObjectValueFromCtl(aDisplayPropertyNode, aDataObject)
        End Sub


        Public ReadOnly Property DateTextBox() As String
            Get
                Return txt_Date.Value.ToString()
            End Get
        End Property

        Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)

            MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
            Dim aControlNode As XmlNode
            DisplayPropertyNode = aDisplayPropertyNode
            aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
            If cXMLDoc.AttributeToString(aControlNode, "Calendar") = "False" Then
                spnCalendar.Visible = False
            End If

            If cXMLDoc.AttributeToString(aControlNode, "ShowDateTime") = "True" Then
                spnTimeControls.Visible = True
                SetTimeZone()
            Else
                spnTimeControls.Visible = False
            End If

        End Sub

        Public Overrides Property myDate() As Object
            Get
                'myDate = mDate
                'Changed 8/4/2003 to allow for saving of updated text box value as date
                'Don't know what other consequences this might have.
                'If this is the way to go, should we store the date as a member variable?
                'Peter Larsen
                If BaseTextBox.Value.Trim() <> "" Then
                    'myDate = DateTime.Parse(txtDate.Value)
                    Try
                        Dim aControlNode As XmlNode
                        aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
                        If cXMLDoc.AttributeToString(aControlNode, "ShowDateTime") = "true" Then
                            myDate = DateTime.Parse(BaseTextBox.Value) + " " + ctlHour.SelectedItem.Value.ToString() + ":" + ctlMinute.SelectedItem.Value.ToString() + " " + ctlAMPM.SelectedItem.Value.ToString()
                        Else
                            myDate = DateTime.Parse(BaseTextBox.Value)
                        End If

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
                Dim aControlNode As XmlNode
                aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
                If cXMLDoc.AttributeToString(aControlNode, "ShowDateTime") = "true" Then
                    SetTimeControls()
                End If
            End Set
        End Property

        Private Sub SetTimeZone()
            Dim strTimeZone As String = System.TimeZone.CurrentTimeZone.StandardName
            If strTimeZone.StartsWith("Eastern") Then
                spnTimeZone.InnerHtml = "ET"
            ElseIf strTimeZone.StartsWith("Central") Then
                spnTimeZone.InnerHtml = "CT"
            ElseIf strTimeZone.StartsWith("Mountain") Then
                spnTimeZone.InnerHtml = "MT"
            ElseIf strTimeZone.StartsWith("Pacific") Then
                spnTimeZone.InnerHtml = "PT"
            End If
        End Sub

        Public Overrides ReadOnly Property BaseTextBox() As HtmlInputText
            Get
                BaseTextBox = txt_Date
            End Get
        End Property



        Public Function getClientID() As String
            Return txt_Date.ClientID()
        End Function

        Private Sub SetTimeControls()
            If mDate.Hour = 0 Or mDate.Hour = 12 Then
                ctlHour.SelectedIndex = 11
            Else
                ctlHour.SelectedIndex = mDate.Hour Mod 12 - 1
            End If
            Select Case mDate.Minute
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

        Public Overrides Sub ValidateDate(ByVal aSrc As Object, ByVal aArgs As System.Web.UI.WebControls.ServerValidateEventArgs)
            aArgs.IsValid = True
            If BaseTextBox.Value = "" Then
                aArgs.IsValid = False
                Exit Sub
            Else
                Try
                    Dim aControlNode As XmlNode
                    aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
                    If cXMLDoc.AttributeToString(aControlNode, "ShowDateTime") = "true" Then
                        myDate = DateTime.Parse(BaseTextBox.Value) + " " + ctlHour.SelectedItem.Value.ToString() + ":" + ctlMinute.SelectedItem.Value.ToString() + " " + ctlAMPM.SelectedItem.Value.ToString()
                    Else
                        myDate = DateTime.Parse(BaseTextBox.Value)
                    End If

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
    End Class
End Namespace



