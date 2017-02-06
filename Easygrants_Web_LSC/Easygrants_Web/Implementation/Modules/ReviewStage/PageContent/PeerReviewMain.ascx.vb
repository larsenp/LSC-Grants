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

Namespace Implementation.Modules.ReviewStage.PageContent
Public MustInherit Class cPeerReviewMain
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'========================================================================

	protected spnSave as HtmlGenericControl
	protected tblSubmit as HtmlTable
	Protected ctlNewWindowOpener As cNewWindowOpener
	protected valMinValue as CustomValidator
	protected valMaxValue as CustomValidator
	protected valStreamlined as CustomValidator
	protected ctlMinValue as cMoneyTextBox
	protected ctlMaxValue as cMoneyTextBox
	protected ctlList as cDataListCtl
	Protected btnEditComment As cCSSButton
	Protected btnEditComment2 As cCSSButton
	protected valApplicants as CustomValidator

'========================================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
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
		dim aCheckboxHash2 as Hashtable
		dim aStreamLine as cCheckBox
		dim aStreamlined as Boolean
		dim aIsValid as Boolean = True
		Dim aApplicantPool As StringBuilder = New StringBuilder()
		dim aEditCommentHash as Hashtable
		dim aPersonID as Integer
		
		'aPersonID = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser).PersonID
  		'aWftaDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "PersonID", aPersonID, "WfTaskID", "19", "WfTaskRoleID", "9")
        
        MyBase.CoreCtl_Load(sender, e)
         
		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
        ctlList = FindControl("ctlList")
        aMinValueHash = ctlList.DataListCtl_GetControlCollection("ctlMinValue")
        aMaxValueHash = ctlList.DataListCtl_GetControlCollection("ctlMaxValue")
        aEditCommentHash = ctlList.DataListCtl_GetControlCollection("btnEditComment")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aMinValueTextBox = CType(aMinValueHash(aWftaID), cMoneyTextBox)
				aMaxValueTextBox = CType(aMaxValueHash(aWftaID), cMoneyTextBox)
				btnEditComment = CType(aEditCommentHash(aWftaID), cCSSButton)
				if (not aMinValueTextBox is nothing Or not aMaxValueTextBox is nothing) then
					aApplicantName = aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName")
					
					aMinValueTextBox.RegExErrorMessage = "You must only enter digits for Min Value for " + aApplicantName + "."
					aMinValueTextBox.DecimalErrorMessage = "You can only enter one decimal Min Value for " + aApplicantName + "."
					aMinValueTextBox.CommaErrorMessage = "You cannot enter commas for Min Value for " + aApplicantName + "."							
					
					aMaxValueTextBox.RegExErrorMessage = "You must only enter digits for Max Value for " + aApplicantName + "."
					aMaxValueTextBox.DecimalErrorMessage = "You can only enter one decimal Max Value for " + aApplicantName + "."
					aMaxValueTextBox.CommaErrorMessage = "You cannot enter commas for Max Value for " + aApplicantName + "."				
				end if
			next
		end if     
   End Sub	
   
'==============================================================

	Protected Overrides Sub OnPreRender(e As EventArgs)
		MyBase.OnPreRender(e)
		
		Try
			If Not Page.IsValid Then
				Return
			End If
		Catch
		End Try
		
		Dim aStreamLineCheckBox as cCheckBox
		Dim aMinValueTextBox as cMoneyTextBox
		Dim aMaxValueTextBox as cMoneyTextBox
		Dim aWftaID as Integer
		Dim aWftaDO as cDataObject
		Dim aWftaDOList As cDataObjectList
		Dim aMinValueHash As Hashtable
		Dim aMaxValueHash as Hashtable
		Dim aCheckboxHash2 as Hashtable

        aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
		aCheckboxHash2 = ctlList.DataListCtl_GetControlCollection("ctlStreamlined")
		aMinValueHash = ctlList.DataListCtl_GetControlCollection("ctlMinValue")
		aMaxValueHash = ctlList.DataListCtl_GetControlCollection("ctlMaxValue")

		For Each aWftaDO In aWftaDOList
			aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
			aStreamLineCheckBox = CType(aCheckboxHash2(aWftaID), cCheckBox)
			aMinValueTextBox = CType(aMinValueHash(aWftaID), cMoneyTextBox)
			aMaxValueTextBox = CType(aMaxValueHash(aWftaID), cMoneyTextBox)
			
			If aStreamLineCheckBox.Value = True Then
				aMinValueTextBox.Value = ""
				aMaxValueTextBox.Value = ""
			End If
		Next

	End Sub

'=============================================================

	Public Sub EditCritique(ByVal aWfTaskAssignmentID as String, ByVal aWfTaskID as String, ByVal aGranteeProjectID as String, ByVal aAppWfTaskAssignmentID as String, ByVal aReturnURL as String)
		dim aWftaDO as cDataObject
		dim aWftaDOList as cDataObjectList
		dim aWftaID as String
		dim aWfTaskAssignmentReviewDOList as cDataObjectList
		dim aWfTaskAssignmentReviewID as String
		dim aPersonID as Integer
		
		me.EventController_Save()
		
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
		EventController_NavigateToModulePageKey("PeerReviewCritique", aWfTaskAssignmentReviewID, aWfTaskAssignmentID, aGranteeProjectID, aAppWfTaskAssignmentID, aReturnURL)
	End Sub
	
'==============================================================

	Public Sub ViewAppPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String
		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
	
 '-----------------------------------------------------
  
    Public Sub ValidateMinValue(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
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
		dim aCheckboxHash2 as Hashtable
		dim aStreamLine as cCheckBox
		dim aStreamlined as Boolean
		dim aIsValid as Boolean = True
		Dim aApplicantPool As StringBuilder = New StringBuilder()
		
		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
        ctlList = FindControl("ctlList")
        aMinValueHash = ctlList.DataListCtl_GetControlCollection("ctlMinValue")
        aMaxValueHash = ctlList.DataListCtl_GetControlCollection("ctlMaxValue")
        aCheckboxHash2 = ctlList.DataListCtl_GetControlCollection("ctlStreamlined")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aMinValueTextBox = CType(aMinValueHash(aWftaID), cMoneyTextBox)
				aMaxValueTextBox = CType(aMaxValueHash(aWftaID), cMoneyTextBox)
				aStreamLine = CType(aCheckboxHash2(aWftaID), cCheckBox)
				if (not aMinValueTextBox is nothing) then
					if (aMinValueTextBox.Value <> "") then
						aMinValue = aMinValueTextBox.NumericValue
						If (aMinValue < 1.0 Or aMinValue > 5.0) Then 
							aApplicantPool.Append("Your Min Value for ")
							aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
							aApplicantPool.Append(" must be between 1.0 and 5.0.")
							aApplicantPool.Append("<br>")
							valMinValue.ErrorMessage = aApplicantPool.ToString()
							aIsValid = False
						End If
					end if
					if (not aMaxValueTextBox is nothing) then
						if (aMinValueTextBox.Value <> "" And aMaxValueTextBox.Value = "") then 
							aApplicantPool.Append("You must indicate a Max Value for ")
							aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
							aApplicantPool.Append(" between 1.0 and 5.0.")
							aApplicantPool.Append("<br>")
							valMinValue.ErrorMessage = aApplicantPool.ToString()
						end if
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
  
    Public Sub ValidateMaxValue(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
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
		dim aCheckboxHash2 as Hashtable
		dim aStreamLine as cCheckBox
		dim aStreamlined as Boolean
		dim aIsValid as Boolean = True
		Dim aApplicantPool As StringBuilder = New StringBuilder()
		
		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
        ctlList = FindControl("ctlList")
		aMinValueHash = ctlList.DataListCtl_GetControlCollection("ctlMinValue")
        aMaxValueHash = ctlList.DataListCtl_GetControlCollection("ctlMaxValue")
        aCheckboxHash2 = ctlList.DataListCtl_GetControlCollection("ctlStreamlined")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aMinValueTextBox = CType(aMinValueHash(aWftaID), cMoneyTextBox)
				aMaxValueTextBox = CType(aMaxValueHash(aWftaID), cMoneyTextBox)
				aStreamLine = CType(aCheckboxHash2(aWftaID), cCheckBox)
				if (not aMaxValueTextBox is nothing) then
					if (aMaxValueTextBox.Value <> "") then
						aMaxValue = aMaxValueTextBox.NumericValue
						If (aMaxValue < 1.0 Or aMaxValue > 5.0) Then 
							aApplicantPool.Append("Your Max Value for ")
							aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
							aApplicantPool.Append(" must be between 1.0 and 5.0.")
							aApplicantPool.Append("<br>")
							valMaxValue.ErrorMessage = aApplicantPool.ToString()
							aIsValid = False
						End If
					end if
					if (not aMinValueTextBox is nothing) then
						if	(aMaxValueTextBox.Value <> "" And aMinValueTextBox.Value = "") then 
							aApplicantPool.Append("You must indicate a Min Value for ")
							aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
							aApplicantPool.Append(" between 1.0 and 5.0.")
							aApplicantPool.Append("<br>")
							valMaxValue.ErrorMessage = aApplicantPool.ToString()
						end if
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
		dim aCheckboxHash2 as Hashtable
		dim aStreamLine as cCheckBox
		dim aStreamlined as Boolean
		dim aIsValid as Boolean = True
		Dim aApplicantPool As StringBuilder = New StringBuilder()
		
		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
        ctlList = FindControl("ctlList")
		aMinValueHash = ctlList.DataListCtl_GetControlCollection("ctlMinValue")
        aMaxValueHash = ctlList.DataListCtl_GetControlCollection("ctlMaxValue")
        aCheckboxHash2 = ctlList.DataListCtl_GetControlCollection("ctlStreamlined")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aMinValueTextBox = CType(aMinValueHash(aWftaID), cMoneyTextBox)
				aMaxValueTextBox = CType(aMaxValueHash(aWftaID), cMoneyTextBox)
				aStreamLine = CType(aCheckboxHash2(aWftaID), cCheckBox)
				if (not aMaxValueTextBox is nothing And not aMinValueTextBox is nothing) then
					if (aStreamLine.BaseCheckButton.Checked.ToString() = "True" and aMinValueTextBox.Value <> "") Or _
						(aStreamLine.BaseCheckButton.Checked.ToString() = "True" and aMaxValueTextBox.Value <> "") then
							aApplicantPool.Append("You  must indicate either a Min and Max Value or select Streamline checkbox for ")
							aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
							aApplicantPool.Append(" but not both.")
							aApplicantPool.Append("<br>")
							valStreamlined.ErrorMessage = aApplicantPool.ToString()
							aIsValid = False
							
					end if
					if (aStreamLine.BaseCheckButton.Checked.ToString() = "False" and aMinValueTextBox.Value = "") And _
						(aStreamLine.BaseCheckButton.Checked.ToString() = "False" and aMaxValueTextBox.Value = "") then
							aApplicantPool.Append("You  must indicate either a Min and Max Value or select Streamline checkbox for ")
							aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
							aApplicantPool.Append(".")
							aApplicantPool.Append("<br>")
							valStreamlined.ErrorMessage = aApplicantPool.ToString()
							aIsValid = False
							
					end if
					'if Min value, No Max Value and StreamLined false
					if (aStreamLine.BaseCheckButton.Checked.ToString() = "False" and aMinValueTextBox.Value <> "") And _
						(aStreamLine.BaseCheckButton.Checked.ToString() = "False" and aMaxValueTextBox.Value = "") then
							aApplicantPool.Append("You  must indicate either a Min and Max Value or select Streamline checkbox for ")
							aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
							aApplicantPool.Append(".")
							aApplicantPool.Append("<br>")
							valStreamlined.ErrorMessage = aApplicantPool.ToString()
							aIsValid = False
							
					end if
					'if Min Value = "", Max Value <> "" and Streamlined = False
					if (aStreamLine.BaseCheckButton.Checked.ToString() = "False" and aMinValueTextBox.Value = "") And _
						(aStreamLine.BaseCheckButton.Checked.ToString() = "False" and aMaxValueTextBox.Value <> "") then
							aApplicantPool.Append("You  must indicate either a Min and Max Value or select Streamline checkbox for ")
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
			valMinValue.Enabled = False
			valMaxValue.Enabled = False
			aArgs.IsValid = False
			exit Sub
		end if
   End Sub 
 '-----------------------------------------------------
  
    Public Sub ValidateApplicants(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		dim aWftaDOList as cDataObjectList	
		Dim aCheckboxHash As Hashtable
		Dim aMinValueHash As Hashtable
		dim aMaxValueHash as Hashtable
		dim aWftaDO as cDataObject
		dim aWftaID as Integer
		dim aMoneyTextBox as cMoneyTextBox
		dim aMinValueTextBox as cMoneyTextBox
		dim aMaxValueTextBox as cMoneyTextBox
		Dim aMinValue As Double
		dim aMaxValue as Double
		Dim aScore As Double
		dim aApplicantName as String
		dim aCheckboxHash2 as Hashtable
		dim aStreamLine as cCheckBox
		dim aStreamlined as Boolean
		dim aIsValid as Boolean = True
		Dim aApplicantPool As StringBuilder = New StringBuilder()

		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
        ctlList = FindControl("ctlList")
        aMinValueHash = ctlList.DataListCtl_GetControlCollection("ctlMinValue")
        aMaxValueHash = ctlList.DataListCtl_GetControlCollection("ctlMaxValue")
        aCheckboxHash2 = ctlList.DataListCtl_GetControlCollection("ctlStreamlined")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aMinValueTextBox = CType(aMinValueHash(aWftaID), cMoneyTextBox)
				aMaxValueTextBox = CType(aMaxValueHash(aWftaID), cMoneyTextBox)
				aStreamLine = CType(aCheckboxHash2(aWftaID), cCheckBox)
				
				if aWftaDO.GetPropertyInt("ReviewAssignmentTypeID", 4) < 4 then
					if aWftaDO.GetRelatedPropertyString("WfTaskAssignmentReview.PeerCritique") = "" then
						aApplicantPool.Append("You  must enter a critique  for ")
						aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
						aApplicantPool.Append(" before submitting.")
						aApplicantPool.Append("<br>")
						valApplicants.ErrorMessage = aApplicantPool.ToString()
						aIsValid = False
					End If	
				End If		
						
				if (not aMaxValueTextBox is nothing And not aMinValueTextBox is nothing And not aStreamLine is nothing) then
					if (aStreamLine.BaseCheckButton.Checked.ToString() = "True" and aMinValueTextBox.Value <> "") And _
						(aStreamLine.BaseCheckButton.Checked.ToString() = "True" and aMaxValueTextBox.Value <> "") then
						if aMinValueTextBox.Value <> "" Or aMaxValueTextBox.Value <> "" then 
							aMinValue = aMinValueTextBox.NumericValue
							aMaxValue = aMaxValueTextBox.NumericValue
							If aMinValue = 0.0 Or aMaxValue = 0.0 Then 
								aApplicantPool.Append("You  must indicate either a Min and Max Value or select Streamline checkbox for ")
								aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
								aApplicantPool.Append(" before submitting.")
								aApplicantPool.Append("<br>")
								valApplicants.ErrorMessage = aApplicantPool.ToString()
								aIsValid = False
							End If
						else
							aApplicantPool.Append("You  must indicate either a Min and Max Value or select Streamline checkbox for ")
							aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
							aApplicantPool.Append(" before submitting.")
							aApplicantPool.Append("<br>")
							valApplicants.ErrorMessage = aApplicantPool.ToString()
							aIsValid = False
						end if
					elseif (aStreamLine.BaseCheckButton.Checked.ToString() = "False" and aMinValueTextBox.Value = "") And _
							  (aStreamLine.BaseCheckButton.Checked.ToString() = "False" and aMaxValueTextBox.Value = "") then
							aApplicantPool.Append("You  must indicate either a Min and Max Value or select Streamline checkbox for ")
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
			valMinValue.Enabled = False
			valMaxValue.Enabled = False
			aArgs.IsValid = False
			exit Sub
		end if
   End Sub 
 
'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
		Dim aWftaDOList As cDataObjectList
		Dim aMinValueHash As Hashtable
		dim aMaxValueHash as Hashtable
		dim aWftaDO as cDataObject
		dim aGranteeProjectID as Integer
		dim aWftaReviewDO as cDataObject
		dim aMinValue as Decimal
		dim aMaxValue as Decimal
		dim aMinValueTextBox as cMoneyTextBox
		dim aMaxValueTextBox as cMoneyTextBox
		dim aStreamLineCheckBox as cCheckBox
		dim aWftaID as Integer
		dim aWfTaskID as Integer
		dim aReviewCycleStageID as Integer
		dim aCheckboxHash2 as Hashtable
		dim aGPReviewStageDO as cDataObject
		dim aReviewCommitteeID as Integer
		dim aAppWfTaskAssignmentID as Integer

        aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
		
		ctlList = FindControl("ctlList")
		aMinValueHash = ctlList.DataListCtl_GetControlCollection("ctlMinValue")
		aMaxValueHash = ctlList.DataListCtl_GetControlCollection("ctlMaxValue")
		aCheckboxHash2 = ctlList.DataListCtl_GetControlCollection("ctlStreamlined")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aWfTaskID = aWftaDO.GetPropertyInt("WfTaskID")
				aReviewCycleStageID = aWftaDO.GetPropertyInt("ReviewCycleStageID")
				aMinValueTextBox = CType(aMinValueHash(aWftaID), cMoneyTextBox)
				aMaxValueTextBox = CType(aMaxValueHash(aWftaID), cMoneyTextBox)
				aStreamLineCheckBox = CType(aCheckboxHash2(aWftaID), cCheckBox)
				aGranteeProjectID = aWftaDO.GetPropertyInt("GranteeProjectID")
				aGPReviewStageDO = aWftaDO.GetRelatedPropertyDataObject("GPRSCommittee")
				aReviewCommitteeID = aWftaDO.GetPropertyInt("ReviewCommitteeID")
				aAppWfTaskAssignmentID = aWftaDO.GetRelatedPropertyInt("GranteeProject.ApplicantWfTaskAssignment.WfTaskAssignmentID")
				
				If aStreamLineCheckBox.Value = True Then
					aMinValueTextBox.Value = "4.9"
					aMaxValueTextBox.Value = "4.9"
				End If				
				
				if not aMinValueTextBox is nothing or not aMaxValueTextBox is nothing then
					if aMinValueTextBox.Value <> "" And aMaxValueTextBox.Value <> "" then
						aMinValue = aWftaDO.GetPropertyDouble("MinValue")
						aMaxValue = aWftaDO.GetPropertyDouble("MaxValue")
						aWftaDO("MinValue") = aMinValueTextBox.NumericValue
						aWftaDO("MaxValue") = aMaxValueTextBox.NumericValue	
						if aGPReviewStageDO is nothing then
							aGPReviewStageDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectReviewStage")
							aGPReviewStageDO("GranteeProjectID") = aGranteeProjectID
							aGPReviewStageDO("AppWfTaskAssignmentID") = aAppWfTaskAssignmentID
							aGPReviewStageDO("ReviewTaskID") = aWfTaskID
							aGPReviewStageDO("ReviewCycleStageID") = aReviewCycleStageID	
							aGPReviewStageDO("ReviewCommitteeID") = aReviewCommitteeID	
							aGPReviewStageDO("MinValue") = aMinValueTextBox.NumericValue
							aGPReviewStageDO("MaxValue") = aMaxValueTextBox.NumericValue
							WebSession.DataObjectFactory.SaveDataObject(aGPReviewStageDO)				
						else
							aMinValue = aWftaDO.GetRelatedPropertyDouble("GPRSCommittee.MinValue")
							aMaxValue = aWftaDO.GetRelatedPropertyDouble("GPRSCommittee.MaxValue")
							if aMinValueTextBox.Value <> "" then
								if (aMinValueTextBox.NumericValue < aMinValue) then
									aGPReviewStageDO("MinValue") = aMinValueTextBox.NumericValue
								end if
								if (aMaxValueTextBox.NumericValue > aMaxValue) then
									aGPReviewStageDO("MaxValue") = aMaxValueTextBox.NumericValue
								end if
								WebSession.DataObjectFactory.SaveDataObject(aGPReviewStageDO)
							end if
						end if
					elseif (aMinValueTextBox.Value = "" And aMaxValueTextBox.Value = "") And aStreamLineCheckBox.BaseCheckButton.Checked = True Or _
						(aMinValueTextBox.Value = "" And aMaxValueTextBox.Value = "") And aStreamLineCheckBox.BaseCheckButton.Checked = False then
						aWftaDO("MinValue") = System.DBNull.Value
						aWftaDO("MaxValue") = System.DBNull.Value
						'WebSession.DataObjectFactory.SaveDataObject(aGPReviewStageDO)
						aWftaDO("Streamlined") = aStreamLineCheckBox.BaseCheckButton.Checked		
					end if
					
				end if
				if not aStreamLineCheckBox is nothing then
					aWftaDO("Streamlined") = aStreamLineCheckBox.BaseCheckButton.Checked
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
		
		if MyBase.EventController_Save() = False then exit sub
		
		DataPresenter_SaveDataObjects()
		
		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
		if aWftaDOList.Count > 0 then
			for each aWftaDO in aWftaDOList
				aGranteeProjectID = aWftaDO.GetPropertyInt("GranteeProjectID")
				aUserGranteeProjectID = aUser.GranteeProjectID
				if aGranteeProjectID <> aUserGranteeProjectID then
					'update each peer review status to Complete and Outcome, except for ModuleUser
					aWftaDO("WfTaskStatusID") = 2
					aWftaDO("WfTaskOutcomeID") = 27  'Peer Review Task Submitted
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
'========================================================================

End Class
End Namespace