Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web
Imports EasyGrants.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports Core.Web
Imports System.Text

Namespace Easygrants_Web.Implementation.Modules.ReviewStage.PageContent
Public MustInherit Class cPanelReviewMain
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'========================================================================

	protected spnSave as HtmlGenericControl
	protected tblSubmit as HtmlTable
	Protected ctlNewWindowOpener As cNewWindowOpener
	protected valScores as CustomValidator
	protected ctlScore as cMoneyTextBox
	protected ctlList as cDataListCtl
	protected valApplicants as CustomValidator
	protected valStreamLined as CustomValidator

'========================================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)
		
		dim aWftaDOList as cDataObjectList	
		dim aWftaDO as cDataObject
		dim aScoreHash as Hashtable
		dim aWftaID as Integer
		dim aScoreTextBox as cMoneyTextBox
		dim aApplicantName as String
		
  		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
        ctlList = FindControl("ctlList")
            aScoreHash = ctlList.DataListCtl_GetControlCollection("ctlScore")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aScoreTextBox = CType(aScoreHash(aWftaID), cMoneyTextBox)
				if (not aScoreTextBox is nothing) then
					aApplicantName = aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName")
					aScoreTextBox.RegExErrorMessage = "You must only enter digits for Score for " + aApplicantName + "."
					aScoreTextBox.DecimalErrorMessage = "You can only enter one decimal Score for " + aApplicantName + "."
					aScoreTextBox.CommaErrorMessage = "You cannot enter commas for Score for " + aApplicantName + "."							
				end if
			next
		end if    
   End Sub	
	
'==============================================================

	Public Sub ViewAppPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String
		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
	
 '-----------------------------------------------------
  
    Public Sub ValidateScores(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		dim aWftaDOList as cDataObjectList	
		Dim aCheckboxHash As Hashtable
		dim aWftaDO as cDataObject
		dim aWftaID as Integer
		dim aMoneyTextBox as cMoneyTextBox
		Dim aScore As Double
		dim aApplicantName as String
		dim aCheckboxHash2 as Hashtable
		dim aStreamLine as cCheckBox
		dim aStreamlined as Boolean
		dim aIsValid as Boolean = True
		Dim aApplicantPool As StringBuilder = New StringBuilder()
		
		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
        ctlList = FindControl("ctlList")
			'aMoneyTextBox = ctlList.DataListCtl_GetControlCollection("ctlScore")
            aCheckboxHash = ctlList.DataListCtl_GetControlCollection("ctlScore")
            aCheckboxHash2 = ctlList.DataListCtl_GetControlCollection("ctlStreamlined")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aMoneyTextBox = CType(aCheckboxHash(aWftaID), cMoneyTextBox)
				aStreamLine = CType(aCheckboxHash2(aWftaID), cCheckBox)
				if not aMoneyTextBox is Nothing
					if aMoneyTextBox.Value <> "" then
						aScore = aMoneyTextBox.NumericValue
						If (aScore >= 1.0 and aScore <= 5.0) Then 
							aArgs.IsValid = True
						else
							aApplicantPool.Append("Your Score for ")
							aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
							aApplicantPool.Append(" must be between 1.0 and 5.0.")
							aApplicantPool.Append("<br>")
							valScores.ErrorMessage = aApplicantPool.ToString()
							aIsValid = False
						End If
					end if
				end if
				Next
		End If
		if aIsValid = False then
			aArgs.IsValid = False
			exit Sub
		end if
   End Sub 
   
  '-----------------------------------------------------
  
    Public Sub ValidateStreamLined(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		dim aWftaDOList as cDataObjectList	
		Dim aMinValueHash As Hashtable
		dim aMaxValueHash as Hashtable
		dim aWftaDO as cDataObject
		dim aWftaID as Integer
		dim aMinValueTextBox as cMoneyTextBox
		dim aMaxValueTextBox as cMoneyTextBox
		Dim aMinValue As Double
		dim aMaxValue as Double
		dim aApplicantName as String
		dim aCheckboxHash as Hashtable
		dim aCheckboxHash2 as Hashtable
		dim aMoneyTextBox as cMoneyTextBox
		dim aStreamLine as cCheckBox
		dim aStreamlined as Boolean
		dim aIsValid as Boolean = True
		Dim aApplicantPool As StringBuilder = New StringBuilder()
		
		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
        ctlList = FindControl("ctlList")
			aCheckboxHash = ctlList.DataListCtl_GetControlCollection("ctlScore")
            aCheckboxHash2 = ctlList.DataListCtl_GetControlCollection("ctlStreamlined")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				
				aMoneyTextBox = CType(aCheckboxHash(aWftaID), cMoneyTextBox)
				aStreamLine = CType(aCheckboxHash2(aWftaID), cCheckBox)
				if (not aMoneyTextBox is nothing) then
					if (aStreamLine.BaseCheckButton.Checked.ToString() = "True" and aMoneyTextBox.Value <> "") then
						aApplicantPool.Append("You  must indicate either a Score between 1.0 and 5.0 or select Streamline checkbox for ")
						aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
						aApplicantPool.Append(" but not both.")
						aApplicantPool.Append("<br>")
						valStreamlined.ErrorMessage = aApplicantPool.ToString()
						aIsValid = False
					end if
					if (aStreamLine.BaseCheckButton.Checked.ToString() = "False" and aMoneyTextBox.Value = "") then
						aApplicantPool.Append("You  must indicate either a Score between 1.0 and 5.0 or select Streamline checkbox for ")
						aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
						aApplicantPool.Append(".")
						aApplicantPool.Append("<br>")
						valStreamlined.ErrorMessage = aApplicantPool.ToString()
						aIsValid = False
					end if
				end if
			Next
		End If	
		if aIsValid = False then
			'valScores.Enabled = False
			aArgs.IsValid = False
			exit Sub
		end if					
   End Sub 
 
'-----------------------------------------------------
  
    Public Sub ValidateApplicants(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		dim aWftaDOList as cDataObjectList	
		Dim aCheckboxHash As Hashtable
		dim aWftaDO as cDataObject
		dim aWftaID as Integer
		dim aMoneyTextBox as cMoneyTextBox
		Dim aScore As Double
		dim aApplicantName as String
		dim aCheckboxHash2 as Hashtable
		dim aStreamLine as cCheckBox
		dim aStreamlined as Boolean
		dim aIsValid as Boolean = True
		Dim aApplicantPool As StringBuilder = New StringBuilder()

		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
        ctlList = FindControl("ctlList")
            aCheckboxHash = ctlList.DataListCtl_GetControlCollection("ctlScore")
            aCheckboxHash2 = ctlList.DataListCtl_GetControlCollection("ctlStreamlined")
	
		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aMoneyTextBox = CType(aCheckboxHash(aWftaID), cMoneyTextBox)
				aStreamLine = CType(aCheckboxHash2(aWftaID), cCheckBox)
				if not aMoneyTextBox is nothing Or not aStreamLine is nothing then
					if (aStreamLine.BaseCheckButton.Checked.ToString() = "True" and aMoneyTextBox.Value <> "") then
						if aMoneyTextBox.Value <> "" then
							aScore = aMoneyTextBox.NumericValue
							If aScore = 0.0 Then 
								aApplicantPool.Append("You must indicate a Score between 1.0 and 5.0 or select Streamline for ")
								aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
								aApplicantPool.Append(" before submitting.")
								aApplicantPool.Append("<br>")
								valApplicants.ErrorMessage = aApplicantPool.ToString()
								aIsValid = False
							End If
						else
							aApplicantPool.Append("You must indicate a Score between 1.0 and 5.0 or select Streamline for ")
							aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
							aApplicantPool.Append(" before submitting.")
							aApplicantPool.Append("<br>")
							valApplicants.ErrorMessage = aApplicantPool.ToString()
							aIsValid = False
						end if
					elseif (aStreamLine.BaseCheckButton.Checked.ToString() = "False" and aMoneyTextBox.Value = "") then
							aApplicantPool.Append("You  must indicate either a Score or select Streamline checkbox for ")
							aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
							aApplicantPool.Append(" before submitting.")
							aApplicantPool.Append("<br>")
							valApplicants.ErrorMessage = aApplicantPool.ToString()
							aIsValid = False
					end if
				end if
			Next
		End If
		if aIsValid = False then
			aArgs.IsValid = False
			exit Sub
		end if		
   End Sub 
 
'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
		Dim aWftaDOList As cDataObjectList
		Dim aCheckboxHash As Hashtable
		dim aWftaDO as cDataObject
		dim aGranteeProjectID as Integer
		dim aGPReviewStageDO as cDataObject
		dim aMinValue as Double
		dim aMaxValue as Double
		dim aMoneyTextBox as cMoneyTextBox
		dim aStreamLineCheckBox as cCheckBox
		dim aWftaID as Integer
		dim aWfTaskID as Integer
		dim aReviewCycleStageID as Integer
		dim aCheckboxHash2 as Hashtable
		dim aReviewCommitteeID as Integer
		dim aAppWfTaskAssignmentID as Integer
		
        aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
		
		ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("ctlScore")
		aCheckboxHash2 = ctlList.DataListCtl_GetControlCollection("ctlStreamlined")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aWfTaskID = aWftaDO.GetPropertyInt("WfTaskID")
				aReviewCycleStageID = aWftaDO.GetPropertyInt("ReviewCycleStageID")
				aGPReviewStageDO = aWftaDO.GetRelatedPropertyDataObject("GPRSCommittee")
				aMoneyTextBox = CType(aCheckboxHash(aWftaID), cMoneyTextBox)
				aStreamLineCheckBox = CType(aCheckboxHash2(aWftaID), cCheckBox)
				aGranteeProjectID = aWftaDO.GetPropertyInt("GranteeProjectID")
				aReviewCommitteeID = aWftaDO.GetPropertyInt("ReviewCommitteeID")
				aAppWfTaskAssignmentID = aWftaDO.GetRelatedPropertyInt("GranteeProject.ApplicantWfTaskAssignment.WfTaskAssignmentID")
				
				if not aMoneyTextBox is nothing then
					if aMoneyTextBox.Value <> "" then
						if aGPReviewStageDO is nothing then
							aGPReviewStageDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectReviewStage")
							aGPReviewStageDO("GranteeProjectID") = aGranteeProjectID
							aGPReviewStageDO("AppWfTaskAssignmentID") = aAppWfTaskAssignmentID
							aGPReviewStageDO("ReviewTaskID") = aWfTaskID
							aGPReviewStageDO("ReviewCycleStageID") = aReviewCycleStageID	
							aGPReviewStageDO("ReviewCommitteeID") = aReviewCommitteeID	
							aGPReviewStageDO("MinValue") = aMoneyTextBox.NumericValue
							aGPReviewStageDO("MaxValue") = aMoneyTextBox.NumericValue				
						else
							aMinValue = aWftaDO.GetRelatedPropertyDouble("GPRSCommittee.MinValue")
							aMaxValue = aWftaDO.GetRelatedPropertyDouble("GPRSCommittee.MaxValue")
							if aMoneyTextBox.Value <> "" then
								if (aMoneyTextBox.NumericValue < aMinValue) then
									aGPReviewStageDO("MinValue") = aMoneyTextBox.NumericValue
								end if
								if (aMoneyTextBox.NumericValue > aMaxValue) then
									aGPReviewStageDO("MaxValue") = aMoneyTextBox.NumericValue
								end if
							end if
						end if
						if not aWftaDO is nothing then
							aWftaDO("ReviewRating") = aMoneyTextBox.NumericValue
						end if
						
						WebSession.DataObjectFactory.SaveDataObject(aGPReviewStageDO)
					end if
				end if
				if not aStreamLineCheckBox is nothing then
					if aMoneyTextBox.Value <> "" then
						aWftaDO("Streamlined") = aStreamLineCheckBox.BaseCheckButton.Checked
					else
						aWftaDO("ReviewRating") = System.DBNull.Value
						aWftaDO("Streamlined") = aStreamLineCheckBox.BaseCheckButton.Checked
					end if
				end if
				WebSession.DataObjectFactory.SaveDataObject(aWftaDO)
			Next
		End If		
	End Sub 
	
'=============================================================

	Public Sub Submit()
		dim aWftaDOList as cDataObjectList
		dim aWftaDO as cDataObject
		dim aGranteeProjectID as Integer
		dim aUserGranteeProjectID as Integer
		dim aUser As cEGUser

        aUser = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser)

		valApplicants.Enabled = True
		
		if MyBase.EventController_Save() = False then exit Sub
		
		DataPresenter_SaveDataObjects()

		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
		if aWftaDOList.Count > 0 then
			for each aWftaDO in aWftaDOList
				aGranteeProjectID = aWftaDO.GetPropertyInt("GranteeProjectID")
				aUserGranteeProjectID = aUser.GranteeProjectID
				if aGranteeProjectID <> aUserGranteeProjectID then
					'update each Panel review status to Complete and Outcome, except for ModuleUser
					aWftaDO("WfTaskStatusID") = 2
					aWftaDO("WfTaskOutcomeID") = 28  'Panel Review Task Submitted
					aWftaDO("SubmittedDate") = System.DateTime.Now
					WebSession.DataObjectFactory.SaveDataObject(aWftaDO)
				end if
			next
		end if
		
		'Submit Peer review task		
		Dim aSubmitPage as cSubmissionModulePage
		aSubmitPage = CType(Page, cSubmissionModulePage)
		aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
		aSubmitPage.PostSubmitModuleName = "ReviewStage"
		aSubmitPage.PostSubmitPageKey = "Main"
		aSubmitPage.Submit(False)
	
	End Sub

'=============================================================

	Public Sub EditComments(ByVal aWfTaskAssignmentID as String, ByVal aWfTaskID as String, ByVal aGranteeProjectID as String, ByVal aAppWfTaskAssignmentID as String, ByVal aReturnURL as String)
		dim aWftaDO as cDataObject
		dim aWftaDOList as cDataObjectList
		dim aWftaID as String
		dim aWfTaskAssignmentReviewDOList as cDataObjectList
		dim aWfTaskAssignmentReviewID as String
		dim aPersonID as Integer
		
		aPersonID = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser).PersonID
 					
		aWftaID = aWfTaskAssignmentID
		aWfTaskAssignmentReviewDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aWftaID)						
		
		if aWfTaskAssignmentReviewDOList.Count > 0 then
			aWfTaskAssignmentReviewID = "WfTaskAssignmentReviewID=" & aWfTaskAssignmentReviewDOList(0).GetPropertyInt("WfTaskAssignmentReviewID")
		else
			aWfTaskAssignmentReviewID = "WfTaskAssignmentReviewID=0" 
		end if
		
		aWfTaskAssignmentID = "WfTaskAssignmentID=" & aWftaID
		aWfTaskID = "WfTaskID=" & aWfTaskID
		aGranteeProjectID = "GranteeProjectID=" & aGranteeProjectID
		aAppWfTaskAssignmentID = "AppWfTaskAssignmentID=" & aAppWfTaskAssignmentID
		aReturnURL = "ReturnURL=" & aReturnURL
		EventController_NavigateToModulePageKey("PanelReviewComments", aWfTaskAssignmentReviewID, aWfTaskAssignmentID, aGranteeProjectID, aAppWfTaskAssignmentID, aReturnURL)
	End Sub
	

'========================================================================

End Class
End Namespace