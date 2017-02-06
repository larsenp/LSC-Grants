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

Namespace Implementation.Modules.Application.Controls.Page
Public MustInherit Class cLogicFrameworkEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

	Protected spnValidatorOutcomes As HtmlGenericControl
	Private ctlOutcomeIndicators As cDropDown
	Private ctlBaseline As cTextBox
	Private ctlGrantcompletion As cTextBox
	Private ctlLongTerm As cTextBox
	Private ctlYearLongTerm As cTextBox
	Private ctlOther As cTextBox

	Protected spnValidatorThreats As HtmlGenericControl
	Private ctlThreatIndicators As cDropDown
	Private ctlBaselineThreats As cTextBox
	Private ctlGrantcompletionThreats As cTextBox
	Private ctlLongTermThreats As cTextBox
	Private ctlYearLongTermThreats As cTextBox
	Private ctlOtherThreats As cTextBox
	Private ctlThreatID As cTextBox
	Protected ValProjectActivities As RequiredFieldValidator
	Protected ValongTermConservationOutcome As RequiredFieldValidator
	Protected ValThreatsAndOpportunities As RequiredFieldValidator
	Protected spnPageValidation As HtmlGenericControl
	Protected ctlList As cDataListCtl


	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		ctlOutcomeIndicators = Me.FindControl("ctlOutcomeIndicators")
		ctlBaseline = Me.FindControl("ctlBaseline")
		ctlGrantcompletion = Me.FindControl("ctlGrantcompletion")
		ctlLongTerm = Me.FindControl("ctlLongTerm")
		ctlYearLongTerm = Me.FindControl("ctlYearLongTerm")
		ctlOther = Me.FindControl("ctlOther")

		ctlBaselineThreats = Me.FindControl("ctlBaselineThreats")
		ctlGrantcompletionThreats = Me.FindControl("ctlGrantcompletionThreats")
		ctlLongTermThreats = Me.FindControl("ctlLongTermThreats")
		ctlYearLongTermThreats = Me.FindControl("ctlYearLongTermThreats")
		ctlOtherThreats = Me.FindControl("ctlOtherThreats")
		ctlThreatID = Me.FindControl("ctlThreatID")
		ctlThreatIndicators = Me.FindControl("ctlThreatIndicators")

		'If Not IsPostBack Then
		'	Dim aNFWFGranteeProjLogicFrameworkListDOL As cDataObjectList
		'	Dim aBtnDeleteHash As Hashtable
		'	Dim aBtnDelete As cCSSButton

		'	ctlList = FindControl("ctlDataListOutcomes")
		'	aBtnDeleteHash = ctlList.DataListCtl_GetControlCollection("btnDelete")
		'	aNFWFGranteeProjLogicFrameworkListDOL = CType(DataObjectCollection("NFWFGranteeProjectLogicFrameworkIndicatorsList"), cDataObjectList)
		'	If aNFWFGranteeProjLogicFrameworkListDOL.Count = 1 Then
		'		aBtnDelete = CType(aBtnDeleteHash(aNFWFGranteeProjLogicFrameworkListDOL(0).GetPropertyInt("LogicFrameworkIndicatorsID")), cCSSButton)
		'		If (Not aBtnDelete Is Nothing) Then
		'			aBtnDelete.Visible = False
		'		End If
		'	End If
		'End If
			
	End Sub

	Public Overrides Sub CoreCtl_SetValues()
			MyBase.CoreCtl_SetValues()
		Dim aIndicatorID As String = Request.QueryString("IndicatorID")
		If aIndicatorID = 1 Then
			ctlBaselineThreats.Value = ""
			ctlGrantcompletionThreats.Value = ""
			ctlLongTermThreats.Value = ""
			ctlYearLongTermThreats.Value = ""
			ctlOtherThreats.Value = ""
			ctlThreatID.Value = ""
			ctlThreatIndicators.SelectedField = ""
		ElseIf aIndicatorID = 2 Then
			ctlOutcomeIndicators.SelectedField = ""
			ctlBaseline.Value = ""
			ctlGrantcompletion.Value = ""
			ctlLongTerm.Value = ""
			ctlYearLongTerm.Value = ""
			ctlOther.Value = ""
		End If

	End Sub

	Public Sub AddLogicFrameworkIndicators(ByVal PageKey As String, ByVal LogicFrameworkIndicatorsID As String, ByVal GranteeProjectID As String, ByVal ProjectLogicFrameworkID As String, ByVal IndicatorID As String, ByVal ReturnURL As String)

			ValidatedLogicFrameworkIndicatorsFields()

			spnPageValidation.InnerHtml = ""
			ValidateRequiredFields()
			ValidateOutcomeIndicatorsOther()

			If spnValidatorOutcomes.InnerHtml.Trim.Length > 0 Or spnPageValidation.InnerHtml.Trim.Length > 0 Then
				Exit Sub
			End If

			Dim mLogicFrameworkIndicatorsDo As cDataObject
			Dim mLogicFrameworkIndicatorsList As cDataObjectList

			mLogicFrameworkIndicatorsList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectLogicFrameworkIndicators", "LogicFrameworkIndicatorsID", LogicFrameworkIndicatorsID, "GranteeProjectID", GranteeProjectID, "ProjectLogicFrameworkID", ProjectLogicFrameworkID, "IndicatorID", IndicatorID)
			If mLogicFrameworkIndicatorsList.Count > 0 Then
				mLogicFrameworkIndicatorsDo = mLogicFrameworkIndicatorsList(0)
			Else
				mLogicFrameworkIndicatorsDo = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectLogicFrameworkIndicators")
			End If


			mLogicFrameworkIndicatorsDo("GranteeProjectID") = GranteeProjectID
			mLogicFrameworkIndicatorsDo("ProjectLogicFrameworkID") = ProjectLogicFrameworkID
			mLogicFrameworkIndicatorsDo("IndicatorID") = IndicatorID
			mLogicFrameworkIndicatorsDo("IndicatorTypeID") = ctlOutcomeIndicators.SelectedValue
			mLogicFrameworkIndicatorsDo("BaseLine") = ctlBaseline.Value
			mLogicFrameworkIndicatorsDo("Grantcompletion") = ctlGrantcompletion.Value
			mLogicFrameworkIndicatorsDo("LongTerm") = ctlLongTerm.Value
			mLogicFrameworkIndicatorsDo("YearLongTerm") = ctlYearLongTerm.Value
			mLogicFrameworkIndicatorsDo("Other") = ctlOther.Value

			mLogicFrameworkIndicatorsDo.SaveData()

			EventController_NavigateToModulePageKey(PageKey, "ProjectLogicFrameworkID=" + ProjectLogicFrameworkID.ToString(), "GranteeProjectID=" + GranteeProjectID.ToString(), "LogicFrameworkIndicatorsID=0", "ReturnURL=" + ReturnURL.ToString)

	End Sub

	Private Sub ValidatedLogicFrameworkIndicatorsFields()
			spnValidatorOutcomes.InnerHtml = ""

			ValongTermConservationOutcome.Enabled = True
			ValongTermConservationOutcome.Validate()

			If Not ValongTermConservationOutcome.IsValid Then
				spnValidatorOutcomes.InnerHtml = spnValidatorOutcomes.InnerHtml + ValongTermConservationOutcome.ErrorMessage + "<br/>"
			End If

			If ctlOutcomeIndicators.SelectedField = "" Then
				spnValidatorOutcomes.InnerHtml += " Indicator and Units of Measure is required.<br>"
			End If
			If ctlBaseline.Value.Trim = "" Then
				spnValidatorOutcomes.InnerHtml += "Baseline is required.<br>"
			End If
			If ctlGrantcompletion.Value.Trim = "" Then
				spnValidatorOutcomes.InnerHtml += "Value at Grant Completion is required.<br>"
			End If
			If ctlLongTerm.Value.Trim = "" Then
				spnValidatorOutcomes.InnerHtml += "Long-term Value is required.<br>"
			End If
			If ctlYearLongTerm.Value.Trim = "" Then
				spnValidatorOutcomes.InnerHtml += "In What Year Will Long-Term Value be Acheived is required.<br>"
			End If
	End Sub


	Public Sub AddLogicFrameworkIndicatorsThreats(ByVal PageKey As String, ByVal LogicFrameworkIndicatorsID As String, ByVal GranteeProjectID As String, ByVal ProjectLogicFrameworkID As String, ByVal IndicatorID As String, ByVal ReturnURL As String)
			
			LogicFrameworkIndicatorsThreatsFields()
			spnPageValidation.InnerHtml = ""
			ValidateRequiredFields()
			ValidateThreatIndicatorsOther()
			'ValidateOutcomeIndicators()

			If spnValidatorThreats.InnerHtml.Trim.Length > 0 Or spnPageValidation.InnerHtml.Trim.Length > 0 Then
				Exit Sub
			End If

			Dim mLogicFrameworkIndicatorsThreatsDo As cDataObject
			Dim mLogicFrameworkIndicatorsThreatsList As cDataObjectList

			mLogicFrameworkIndicatorsThreatsList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectLogicFrameworkIndicators", "LogicFrameworkIndicatorsID", LogicFrameworkIndicatorsID, "GranteeProjectID", GranteeProjectID, "ProjectLogicFrameworkID", ProjectLogicFrameworkID, "IndicatorID", IndicatorID)
			If mLogicFrameworkIndicatorsThreatsList.Count > 0 Then
				mLogicFrameworkIndicatorsThreatsDo = mLogicFrameworkIndicatorsThreatsList(0)
			Else
				mLogicFrameworkIndicatorsThreatsDo = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectLogicFrameworkIndicators")
			End If


			mLogicFrameworkIndicatorsThreatsDo("GranteeProjectID") = GranteeProjectID
			mLogicFrameworkIndicatorsThreatsDo("ProjectLogicFrameworkID") = ProjectLogicFrameworkID
			mLogicFrameworkIndicatorsThreatsDo("IndicatorID") = IndicatorID
			mLogicFrameworkIndicatorsThreatsDo("ID") = ctlThreatID.Value
			mLogicFrameworkIndicatorsThreatsDo("IndicatorTypeID") = ctlThreatIndicators.SelectedValue
			mLogicFrameworkIndicatorsThreatsDo("BaseLine") = ctlBaselineThreats.Value
			mLogicFrameworkIndicatorsThreatsDo("Grantcompletion") = ctlGrantcompletionThreats.Value
			mLogicFrameworkIndicatorsThreatsDo("LongTerm") = ctlLongTermThreats.Value
			mLogicFrameworkIndicatorsThreatsDo("YearLongTerm") = ctlYearLongTermThreats.Value
			mLogicFrameworkIndicatorsThreatsDo("Other") = ctlOtherThreats.Value



			mLogicFrameworkIndicatorsThreatsDo.SaveData()



			EventController_NavigateToModulePageKey(PageKey, "ProjectLogicFrameworkID=" + ProjectLogicFrameworkID.ToString(), "GranteeProjectID=" + GranteeProjectID.ToString(), "LogicFrameworkIndicatorsID=0", "ReturnURL=" + ReturnURL.ToString)

	End Sub

	Private Sub LogicFrameworkIndicatorsThreatsFields()
			spnValidatorThreats.InnerHtml = ""

			ValongTermConservationOutcome.Enabled = True
			ValongTermConservationOutcome.Validate()

			If Not ValongTermConservationOutcome.IsValid Then
				spnValidatorThreats.InnerHtml = spnValidatorThreats.InnerHtml + ValongTermConservationOutcome.ErrorMessage + "<br/>"
			End If

			If ctlThreatID.Value.Trim = "" Then
				spnValidatorThreats.InnerHtml += "Threat/Opportunity ID is required.<br>"
			End If
			If ctlThreatIndicators.SelectedField = "" Then
				spnValidatorThreats.InnerHtml += "Indicator and Units of Measure is required.<br>"
			End If

			If ctlBaselineThreats.Value.Trim = "" Then
				spnValidatorThreats.InnerHtml += "Baseline is required.<br>"
			End If
			If ctlGrantcompletionThreats.Value.Trim = "" Then
				spnValidatorThreats.InnerHtml += "Value at Grant Completion is required.<br>"
			End If
			If ctlLongTermThreats.Value.Trim = "" Then
				spnValidatorThreats.InnerHtml += "Long-term Value is required.<br>"
			End If
			If ctlYearLongTermThreats.Value.Trim = "" Then
				spnValidatorThreats.InnerHtml += "In What Year Will Long-Term Value be Acheived is required.<br>"
			End If
	End Sub

	Public Overloads Overrides Function EventController_Save() As Boolean
		Dim RaisedByControlID As String = Request.Form("__EVENTTARGET")
		spnPageValidation.InnerHtml = ""
		spnValidatorOutcomes.InnerHtml = ""
		spnValidatorThreats.InnerHtml = ""

		If RaisedByControlID.Contains("btnSave_and_ContinueBottom") Or RaisedByControlID.Contains("btnSaveBottom") Or RaisedByControlID.Contains("btnSave_and_Continue") Or RaisedByControlID.Contains("btnSave") Then
			'ValidateOutcomeIndicators()
			ValidateRequiredFields()
		ElseIf RaisedByControlID.Contains("btnAddOutcomes") Then
			ValidatedLogicFrameworkIndicatorsFields()
		ElseIf RaisedByControlID.Contains("btnAddThreats") Then
			'ValidateOutcomeIndicators()
			LogicFrameworkIndicatorsThreatsFields()
		End If
		If spnPageValidation.InnerHtml <> "" Then
			Return False
		End If

		MyBase.EventController_Save()
		If Page.IsValid Then
		   Return True
		Else
		   Return False
		End If
	End Function

	Private Sub ValidateRequiredFields()
		ValongTermConservationOutcome.Enabled = True
		ValongTermConservationOutcome.Validate()

		If Not ValongTermConservationOutcome.IsValid Then
			spnPageValidation.InnerHtml = spnPageValidation.InnerHtml + ValongTermConservationOutcome.ErrorMessage + "<br/>"
		End If

		'ValThreatsAndOpportunities.Enabled = True
		'ValThreatsAndOpportunities.Validate()

		'If Not ValThreatsAndOpportunities.IsValid Then
		'	spnPageValidation.InnerHtml = spnPageValidation.InnerHtml + ValThreatsAndOpportunities.ErrorMessage + "<br/>"
		'End If

		'ValProjectActivities.Enabled = True
		'ValProjectActivities.Validate()

		'If Not ValProjectActivities.IsValid Then
		'	spnPageValidation.InnerHtml = spnPageValidation.InnerHtml + ValProjectActivities.ErrorMessage + "<br/>"
		'End If
	End Sub

	Private Sub ValidateOutcomeIndicators()
		Dim NFWFGranteeProjectLogicFrameworkIndicatorsListDOL As cDataObjectList
		NFWFGranteeProjectLogicFrameworkIndicatorsListDOL = Me.DataObjectCollection("NFWFGranteeProjectLogicFrameworkIndicatorsList")
		If NFWFGranteeProjectLogicFrameworkIndicatorsListDOL.Count = 0 Then
			spnPageValidation.InnerHtml = spnPageValidation.InnerHtml + "At least one outcome indicator record is required." + "<br/>"
		End If
	End Sub

		Private Sub ValidateThreatOpp()
			Dim NFWFGranteeProjectLogicFrameworkIndicatorsListDOL As cDataObjectList
			NFWFGranteeProjectLogicFrameworkIndicatorsListDOL = Me.DataObjectCollection("NFWFGranteeProjectLogicFrameworkIndicatorsList1")
			If NFWFGranteeProjectLogicFrameworkIndicatorsListDOL.Count = 0 Then
				spnPageValidation.InnerHtml = spnPageValidation.InnerHtml + "At least one threat/opportunity indicator record is required." + "<br/>"
			End If
		End Sub

		Private Sub ValidateOutcomeIndicatorsOther()
			If ctlOutcomeIndicators.SelectedText = "Other" And ctlOther.Value.Trim = "" Then
				spnValidatorOutcomes.InnerHtml = spnValidatorOutcomes.InnerHtml + "Other is required." + "<br/>"
			End If
		End Sub

		Private Sub ValidateThreatIndicatorsOther()
			If ctlThreatIndicators.SelectedText = "Other" And ctlOtherThreats.Value.Trim = "" Then
				spnValidatorThreats.InnerHtml = spnValidatorThreats.InnerHtml + "Other is required." + "<br/>"
			End If
		End Sub


End Class
End Namespace
