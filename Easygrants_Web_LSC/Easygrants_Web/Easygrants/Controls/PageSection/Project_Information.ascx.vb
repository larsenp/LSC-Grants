Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web
Imports System.Text
Imports Core.Web.SvrCtls

Namespace Easygrants_Web.Controls.PageSection
    Public MustInherit Class cProject_Information
        Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================

		Protected mSvButton As String
		'Protected spnSave As cButton
		Protected tbSearchParameters As HtmlTable
		Protected ctlAgeBegin As cTextBox
		Protected ctlAgeEnd As cTextBox
		Protected ctlNotApplicableAge As cCheckBox
        Dim aItem As ListItem
        Protected valGender As CustomValidator
        Protected ctlGender As cCheckBoxList
        'Protected ctlDemographicMale as cCheckBox
        'Protected ctlDemographicFemale As cCheckBox
        'Protected ctlNotApplicableGender As cCheckBox
		Protected valRace As CustomValidator
        Protected ctlRace As cCheckBoxList
        'Protected ctlDemographicAmericaIndian As cCheckBox
        'Protected ctlDemographicAsian as cCheckBox
        'Protected ctlDemographicBlack as cCheckBox
        'Protected ctlDemographicLatin as cCheckBox
        'Protected ctlDemographicMiddleEastern as cCheckBox
        'Protected ctlDemographicWhite as cCheckBox
        'Protected ctlDemographicOther As cCheckBox
        'Protected ctlNotApplicableRace As cCheckBox
		Protected valIncome As CustomValidator
        Protected ctlIncome As cCheckBoxList
        'Protected ctlDemographicLowIncome As cCheckBox
        'Protected ctlDemographicWorkingPoor as cCheckBox
        'Protected ctlDemographicMiddleIncome as cCheckBox
        'Protected ctlDemographicUpperIncome As cCheckBox
        'Protected ctlNotApplicableIncome As cCheckBox
		Protected valLocale As CustomValidator
        Protected ctlLocale As cCheckBoxList
        'Protected ctlDemographicRural As cCheckBox
        'Protected ctlDemographicSuburban as cCheckBox
        'Protected ctlDemographicUrban As cCheckBox
        'Protected ctlNotApplicableLocale As cCheckBox
		Protected valSexOrient As CustomValidator
		Protected ctlDemographicBisexual As cCheckBox
		Protected ctlDemographicHeterosexual as cCheckBox
		Protected ctlDemographicQuestioning as cCheckBox
		Protected ctlDemographicGay as cCheckBox
		Protected ctlDemographicTransgender As cCheckBox
		Protected ctlFieldOfStudy As cDoubleListBox
		Protected ctlDollarRequest As cTextBox
'=============================================================

        Public Property SvButton() As String
            Get
                Return mSvButton
            End Get
            Set(ByVal Value As String)
                mSvButton = Value
            End Set
        End Property

'-----------------------------------------------------

        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)
			If SvButton = "NoShow" Then
				tbSearchParameters.Visible = False
			End If
			ctlDollarRequest = CType(Me.FindControl("ctlDollarRequest"), cTextBox)
		End Sub

'-----------------------------------------------------

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		ctlDollarRequest.Value = CType(CType(Me.DataObjectCollection("GranteeProjectInfo"), cDataObjectList)(0).GetPropertyDouble("DollarRequest"), Long).ToString
	End Sub
'-----------------------------------------------------  

	Public Sub ValidateFieldOfStudy(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		If Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlProjectInfo:ctlFieldOfStudy:hdnList") <> "" Then
			If Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlProjectInfo:ctlFieldOfStudy:hdnList").Split(",").Length > 0 Then
				aArgs.IsValid = True
			Else
				aArgs.IsValid = False
			End If
		Else
			aArgs.IsValid = False
		End If
	End Sub
   '-----------------------------------------------------

	Public Sub ValidateAgeBegin(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ctlAgeBegin = CType(Me.FindControl("ctlAgeBegin"), cTextBox)
		ctlNotApplicableAge = CType(Me.FindControl("ctlNotApplicableAge"), cCheckBox)
		If ((ctlNotApplicableAge.BaseCheckButton.Checked = False) And (ctlAgeBegin.TextBox.Trim = "")) Then
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True
		End If
   End Sub

   '-----------------------------------------------------

	Public Sub ValidateAgeEnd(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ctlAgeEnd = CType(Me.FindControl("ctlAgeEnd"), cTextBox)
		ctlNotApplicableAge = CType(Me.FindControl("ctlNotApplicableAge"), cCheckBox)
		If ((ctlNotApplicableAge.BaseCheckButton.Checked = False) And (ctlAgeEnd.TextBox.Trim = "")) Then
			aArgs.IsValid = False
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
            'ctlDemographicMale = CType(Me.FindControl("ctlDemographicMale"), cCheckBox)
            'ctlDemographicFemale = CType(Me.FindControl("ctlDemographicFemale"), cCheckBox)
            'ctlNotApplicableGender = CType(Me.FindControl("ctlNotApplicableGender"), cCheckBox)
            'If ctlDemographicMale.BaseCheckButton.Checked = False And _
            ' ctlDemographicFemale.BaseCheckButton.Checked = False And _
            ' ctlNotApplicableGender.BaseCheckButton.Checked = False Then
            '    aArgs.IsValid = False
            'Else
            '    aArgs.IsValid = True
            'End If
        End Sub

'-----------------------------------------------------  

	Public Sub ValidateRace(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            Dim blnRaceSelected As Boolean = False
            ctlRace = CType(FindControl("ctlRace"), cCheckBoxList)
            For Each aItem In ctlGender.BaseControl.Items
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
            '          ctlDemographicAmericaIndian = CType(Me.FindControl("ctlDemographicAmericaIndian"), cCheckBox)
            'ctlDemographicAsian = CType(Me.FindControl("ctlDemographicAsian"), cCheckBox)
            'ctlDemographicBlack = CType(Me.FindControl("ctlDemographicBlack"), cCheckBox)
            'ctlDemographicMiddleEastern = CType(Me.FindControl("ctlDemographicMiddleEastern"), cCheckBox)
            'ctlDemographicWhite = CType(Me.FindControl("ctlDemographicWhite"), cCheckBox)
            'ctlDemographicOther = CType(Me.FindControl("ctlDemographicOther"), cCheckBox)
            'ctlDemographicLatin = CType(Me.FindControl("ctlDemographicLatin"), cCheckBox)
            'ctlNotApplicableRace = CType(Me.FindControl("ctlNotApplicableRace"), cCheckBox)
            'If ctlDemographicAmericaIndian.BaseCheckButton.Checked = False And _
            '	ctlDemographicAsian.BaseCheckButton.Checked = False And _
            '	ctlDemographicBlack.BaseCheckButton.Checked = False And _
            '	ctlDemographicMiddleEastern.BaseCheckButton.Checked = False And _
            '	ctlDemographicWhite.BaseCheckButton.Checked = False And _
            '	ctlDemographicOther.BaseCheckButton.Checked = False And _
            '	ctlDemographicLatin.BaseCheckButton.Checked = False And _
            '	ctlNotApplicableRace.BaseCheckButton.Checked = False Then
            '		aArgs.IsValid = False
            'Else
            '	aArgs.IsValid = True
            'End If
   End Sub

'-----------------------------------------------------  

	Public Sub ValidateIncome(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            Dim blnIncomeSelected As Boolean = False
            ctlIncome = CType(FindControl("ctlIncome"), cCheckBoxList)
            For Each aItem In ctlGender.BaseControl.Items
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
            '          ctlDemographicLowIncome = CType(Me.FindControl("ctlDemographicLowIncome"), cCheckBox)
            'ctlDemographicWorkingPoor = CType(Me.FindControl("ctlDemographicWorkingPoor"), cCheckBox)
            'ctlDemographicMiddleIncome = CType(Me.FindControl("ctlDemographicMiddleIncome"), cCheckBox)
            'ctlDemographicUpperIncome = CType(Me.FindControl("ctlDemographicUpperIncome"), cCheckBox)
            'ctlNotApplicableIncome = CType(Me.FindControl("ctlNotApplicableIncome"), cCheckBox)
            'If ctlDemographicLowIncome.BaseCheckButton.Checked = False And _
            '	ctlDemographicWorkingPoor.BaseCheckButton.Checked = False And _
            '	ctlDemographicMiddleIncome.BaseCheckButton.Checked = False And _
            '	ctlDemographicUpperIncome.BaseCheckButton.Checked = False And _
            '	ctlNotApplicableIncome.BaseCheckButton.Checked = False Then
            '		aArgs.IsValid = False
            'Else
            '	aArgs.IsValid = True
            'End If
   End Sub

'-----------------------------------------------------  

	Public Sub ValidateLocale(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            Dim blnLocaleSelected As Boolean = False
            ctlLocale = CType(FindControl("ctlLocale"), cCheckBoxList)
            For Each aItem In ctlGender.BaseControl.Items
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
            '          ctlDemographicRural = CType(Me.FindControl("ctlDemographicRural"), cCheckBox)
            'ctlDemographicSuburban = CType(Me.FindControl("ctlDemographicSuburban"), cCheckBox)
            'ctlDemographicUrban = CType(Me.FindControl("ctlDemographicUrban"), cCheckBox)
            'ctlNotApplicableLocale = CType(Me.FindControl("ctlNotApplicableLocale"), cCheckBox)
            'If ctlDemographicRural.BaseCheckButton.Checked = False And _
            '	ctlDemographicSuburban.BaseCheckButton.Checked = False And _
            '	ctlDemographicUrban.BaseCheckButton.Checked = False And _
            '	ctlNotApplicableLocale.BaseCheckButton.Checked = False Then
            '		aArgs.IsValid = False
            'Else
            '	aArgs.IsValid = True
            'End If
   End Sub

'-----------------------------------------------------  

	Public Sub ValidateSexOrient(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ctlDemographicBisexual = CType(Me.FindControl("ctlDemographicBisexual"), cCheckBox)
		ctlDemographicHeterosexual = CType(Me.FindControl("ctlDemographicHeterosexual"), cCheckBox)
		ctlDemographicQuestioning = CType(Me.FindControl("ctlDemographicQuestioning"), cCheckBox)
		ctlDemographicGay = CType(Me.FindControl("ctlDemographicGay"), cCheckBox)
		ctlDemographicTransgender = CType(Me.FindControl("ctlDemographicTransgender"), cCheckBox)
		If ctlDemographicBisexual.BaseCheckButton.Checked = False And _
			ctlDemographicHeterosexual.BaseCheckButton.Checked = False And _
			ctlDemographicQuestioning.BaseCheckButton.Checked = False And _
			ctlDemographicGay.BaseCheckButton.Checked = False And _
			ctlDemographicTransgender.BaseCheckButton.Checked = False Then
				aArgs.IsValid = False
		Else
			aArgs.IsValid = True
		End If
   End Sub

'-----------------------------------------------------  



End Class
End Namespace

