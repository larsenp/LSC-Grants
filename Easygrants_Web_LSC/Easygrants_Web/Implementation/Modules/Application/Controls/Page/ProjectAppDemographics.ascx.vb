Imports Core.DataAccess
Imports Core.Web.Modules
Imports Core.Web.SvrCtls
Imports Core_Web.Controls.Base
Imports EasyGrants.Web.User
Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core.Web
Imports System.Text

Namespace Easygrants_Web.Modules.Application.Controls.Page
    Public MustInherit Class cProjectAppDemographics
        Inherits Core_Web.Controls.Base.cDataPresenterCtl
        '-----------------------------------------------------
        Dim aItem As ListItem
        Protected ctlAgeBegin As cTextBox
        Protected ctlAgeEnd As cTextBox
        Protected ctlNotApplicableAge As cCheckBox
        Protected valGender As CustomValidator
        Protected ctlGender As cCheckBoxList
        Protected valRace As CustomValidator
        Protected ctlRace As cCheckBoxList
        Protected valIncome As CustomValidator
        Protected ctlIncome As cCheckBoxList
        Protected valLocale As CustomValidator
        Protected ctlLocale As cCheckBoxList
        '-----------------------------------------------------
        Public Sub ValidateAgeBegin(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            ctlNotApplicableAge = CType(Me.FindControl("ctlNotApplicableAge"), cCheckBox)
            ctlAgeBegin = CType(Me.FindControl("ctlAgeBegin"), cTextBox)
            If ctlNotApplicableAge.Value = False Then
                If ((ctlAgeBegin.TextBox.Trim = "")) Then
                    aArgs.IsValid = False
                Else
                    aArgs.IsValid = True
                End If
            Else
                aArgs.IsValid = True
            End If
        End Sub
        ''-----------------------------------------------------
        Public Sub ValidateAgeEnd(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            ctlAgeEnd = CType(Me.FindControl("ctlAgeEnd"), cTextBox)
            ctlNotApplicableAge = CType(Me.FindControl("ctlNotApplicableAge"), cCheckBox)
            If ctlNotApplicableAge.Value = False Then
                If ((ctlAgeEnd.TextBox.Trim = "")) Then
                    aArgs.IsValid = False
                Else
                    aArgs.IsValid = True
                End If
            Else
                aArgs.IsValid = True
            End If
        End Sub
        Public Sub ValidateAgeRange(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            ctlAgeBegin = CType(Me.FindControl("ctlAgeBegin"), cTextBox)
            ctlAgeEnd = CType(Me.FindControl("ctlAgeEnd"), cTextBox)
            ctlNotApplicableAge = CType(Me.FindControl("ctlNotApplicableAge"), cCheckBox)
            If ctlNotApplicableAge.Value = False Then
                If ((ctlAgeBegin.TextBox.Trim <> "")) And ((ctlAgeEnd.TextBox.Trim <> "")) Then
                    If CInt(ctlAgeBegin.TextBox.Trim) > CInt(ctlAgeEnd.TextBox.Trim) Then
                        aArgs.IsValid = False
                    Else
                        aArgs.IsValid = True
                    End If
                End If
            Else
                aArgs.IsValid = True
            End If
        End Sub

        '-----------------------------------------------------
        Public Sub ValidateGender(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            Dim blnGenderSelected As Boolean = False
            ctlGender = CType(FindControl("ctlGender"), cCheckBoxList)
            For Each aItem In ctlGender.BaseControl.Items
                If aItem.Selected Then
                    blnGenderSelected = True
                    Exit For
                End If
            Next
            If blnGenderSelected = False Then
                aArgs.IsValid = False
            Else
                aArgs.IsValid = True
            End If
        End Sub
        '-----------------------------------------------------  
        Public Sub ValidateRace(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            Dim blnRaceSelected As Boolean = False
            ctlRace = CType(FindControl("ctlRace"), cCheckBoxList)
            For Each aItem In ctlRace.BaseControl.Items
                If aItem.Selected Then
                    blnRaceSelected = True
                    Exit For
                End If
            Next
            If blnRaceSelected = False Then
                aArgs.IsValid = False
            Else
                aArgs.IsValid = True
            End If
        End Sub
        '-----------------------------------------------------  
        Public Sub ValidateIncome(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            Dim blnIncomeSelected As Boolean = False
            ctlIncome = CType(FindControl("ctlIncome"), cCheckBoxList)
            For Each aItem In ctlIncome.BaseControl.Items
                If aItem.Selected Then
                    blnIncomeSelected = True
                    Exit For
                End If
            Next
            If blnIncomeSelected = False Then
                aArgs.IsValid = False
            Else
                aArgs.IsValid = True
            End If
        End Sub
        '-----------------------------------------------------  
        Public Sub ValidateLocale(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            Dim blnLocaleSelected As Boolean = False
            ctlLocale = CType(FindControl("ctlLocale"), cCheckBoxList)
            For Each aItem In ctlLocale.BaseControl.Items
                If aItem.Selected Then
                    blnLocaleSelected = True
                    Exit For
                End If
            Next
            If blnLocaleSelected = False Then
                aArgs.IsValid = False
            Else
                aArgs.IsValid = True
            End If
        End Sub
        '-----------------------------------------------------  
    End Class
End Namespace
