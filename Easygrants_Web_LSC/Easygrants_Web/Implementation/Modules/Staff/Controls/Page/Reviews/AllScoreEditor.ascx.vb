Imports System.Text
Imports Core.DataAccess
Imports Core.Web
Imports Core.Web.Modules
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public MustInherit Class cAllScoreEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	
	protected ctlNewWindowOpener As cNewWindowOpener
	protected valApplicants as CustomValidator
	protected valScores as CustomValidator
	protected ctlScore as cMoneyTextBox
	protected ctlList as cDataListCtl

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
				aScoreTextBox.BaseTextBox.Attributes.Add("TabIndex", "1")
				if (not aScoreTextBox is nothing) then
					aApplicantName = aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName")
					
					aScoreTextBox.RegExErrorMessage = "You must only enter digits for Score for " + aApplicantName + "."
					aScoreTextBox.DecimalErrorMessage = "You can only enter one decimal Score for " + aApplicantName + "."
					aScoreTextBox.CommaErrorMessage = "You cannot enter commas for Score for " + aApplicantName + "."							
				end if
			next
		end if    
	End Sub	
	
	Public Sub ViewAppPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String
		aHref = WebAppl.Build_RootURL("EasyGrants/Controls/Base/pgReportOutputReader.aspx")
		aHref = cWebLib.AddQuerystringParameter(aHref, "EntityID", aEntityID)
		aHref = cWebLib.AddQuerystringParameter(aHref, "DefinitionID", aDefinitionID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
		'Response.Redirect(aHref)
	End Sub
	
    Public Sub ValidateScores(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		dim aWftaDOList as cDataObjectList	
		Dim aCheckboxHash As Hashtable
		dim aWftaDO as cDataObject
		dim aWftaID as Integer
		dim aMoneyTextBox as cMoneyTextBox
		Dim aScore As Double
		dim aApplicantName as String
		dim aCheckboxHash2 as Hashtable
		dim aIsValid as Boolean = True
		Dim aApplicantPool As StringBuilder = New StringBuilder()
		
		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
        ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("ctlScore")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aMoneyTextBox = CType(aCheckboxHash(aWftaID), cMoneyTextBox)
				If Not aMoneyTextBox Is Nothing Then
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
				End If
			Next
		End If
		if aIsValid = False then
			aArgs.IsValid = False
			exit Sub
		end if
   End Sub 
   
    Public Sub ValidateApplicants(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		dim aWftaDOList as cDataObjectList	
		Dim aCheckboxHash As Hashtable
		dim aWftaDO as cDataObject
		dim aWftaID as Integer
		dim aMoneyTextBox as cMoneyTextBox
		Dim aScore As Double
		dim aApplicantName as String
		dim aCheckboxHash2 as Hashtable
		dim aIsValid as Boolean = True
		Dim aApplicantPool As StringBuilder = New StringBuilder()

		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
        ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("ctlScore")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aMoneyTextBox = CType(aCheckboxHash(aWftaID), cMoneyTextBox)
				if not aMoneyTextBox is nothing then
					aScore = aMoneyTextBox.NumericValue
					if aMoneyTextBox.Value <> "" then
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
				end if
			Next
		End If
		if aIsValid = False then
			aArgs.IsValid = False
			exit Sub
		end if		
   End Sub 
 
	Public Overrides Sub DataPresenter_SaveDataObjects()
		'myBase.DataPresenter_SaveDataObjects()
		Dim aWftaDOList As cDataObjectList
		Dim aCheckboxHash As Hashtable
		dim aWftaDO as cDataObject
		dim aGranteeProjectID as Integer
		dim aGranteeProjectReviewStageDO as cDataObject
		dim aMinValue as Double
		dim aMaxValue as Double
		dim aMoneyTextBox as cMoneyTextBox
		dim aWftaID as Integer
		dim aWfTaskID as Integer
		dim aReviewCycleStageID as Integer
		dim aCheckboxHash2 as Hashtable
		dim aReviewCommitteeID as Integer
		Dim aDOList As cDataObjectList
		Dim aAppWftaID As Integer = 0

        aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
		
		ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("ctlScore")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aWfTaskID = aWftaDO.GetPropertyInt("WfTaskID")
				aReviewCycleStageID = aWftaDO.GetPropertyInt("ReviewCycleStageID")
				aGranteeProjectReviewStageDO = aWftaDO.GetRelatedPropertyDataObject("GranteeProjectReviewStage")
				aMoneyTextBox = CType(aCheckboxHash(aWftaID), cMoneyTextBox)
				aGranteeProjectID = aWftaDO.GetPropertyInt("GranteeProjectID")
				aReviewCommitteeID = aWftaDO.GetPropertyInt("ReviewCommitteeID", 0)
				
				if not aMoneyTextBox is nothing then
					if aMoneyTextBox.Value <> "" then
						if aGranteeProjectReviewStageDO is nothing then
							aGranteeProjectReviewStageDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectReviewStage")
							aGranteeProjectReviewStageDO("GranteeProjectID") = aGranteeProjectID
							
							'aGranteeProjectReviewStageDO("AppWfTaskAssignmentID") = aWftaID
							'finds applicant wfta
							aDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("vApplicantPool", "GranteeProjectID", aGranteeProjectID)
							If aDOList.Count >= 1 Then
								aAppWftaID = aDOList(0).GetPropertyInt("WfTaskAssignmentID")
							End If
							aGranteeProjectReviewStageDO("AppWfTaskAssignmentID") = aAppWftaID

							aGranteeProjectReviewStageDO("ReviewTaskID") = aWfTaskID
							aGranteeProjectReviewStageDO("ReviewCycleStageID") = aReviewCycleStageID	
							If aReviewCommitteeID > 0 Then
								aGranteeProjectReviewStageDO("ReviewCommitteeID") = aReviewCommitteeID	
							End If
							aGranteeProjectReviewStageDO("MinValue") = aMoneyTextBox.NumericValue
							aGranteeProjectReviewStageDO("MaxValue") = aMoneyTextBox.NumericValue				
						else
							aMinValue = aWftaDO.GetRelatedPropertyDouble("GranteeProjectReviewStage.MinValue")
							aMaxValue = aWftaDO.GetRelatedPropertyDouble("GranteeProjectReviewStage.MaxValue")
							if aMoneyTextBox.Value <> "" then
								if (aMoneyTextBox.NumericValue < aMinValue) then
									aGranteeProjectReviewStageDO("MinValue") = aMoneyTextBox.NumericValue
								end if
								if (aMoneyTextBox.NumericValue > aMaxValue) then
									aGranteeProjectReviewStageDO("MaxValue") = aMoneyTextBox.NumericValue
								end if
							end if
						end if
						Try
							Double.Parse(aMoneyTextBox.Value)
							aWftaDO("ReviewRating") = aMoneyTextBox.NumericValue
						Catch ex As Exception
						End Try
						WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectReviewStageDO)
					end if
				end if
				WebSession.DataObjectFactory.SaveDataObject(aWftaDO)
			Next
		End If		
	End Sub 
	
	Public Sub Submit()
		valApplicants.Enabled = True
		
		if MyBase.EventController_Save() = False then exit Sub
		
		DataPresenter_SaveDataObjects()
		
		Dim aSubmitPage as cSubmissionModulePage
		aSubmitPage = CType(Page, cSubmissionModulePage)
		aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
		aSubmitPage.PostSubmitModuleName = "ReviewStage"
		aSubmitPage.PostSubmitPageKey = "Main"
		aSubmitPage.Submit(False)
	End Sub

	Public Sub EditComments(aEditorPageKey As String, aWfTaskAssignmentID As String, aReviewCycleStageID As String, aReviewCycleID As String, aReturnURL As String)
		DataPresenter_SaveDataObjects()
		If valScores.IsValid And valApplicants.IsValid Then
			EventController_NavigateToModulePageKey(aEditorPageKey, "WfTaskAssignmentID=" + aWfTaskAssignmentID, "ReviewCycleStageID=" + aReviewCycleStageID, "ReviewCycleID=" + aReviewCycleID, "ReturnURL=" + aReturnURL)
		End If
	End Sub

End Class
End Namespace