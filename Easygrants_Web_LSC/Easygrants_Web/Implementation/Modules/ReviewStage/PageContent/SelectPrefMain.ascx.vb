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
Public MustInherit Class cSelectPrefMain
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	
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
	protected ctlOptions as cRadioButtonList
	protected valConflictType as CustomValidator

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
		dim aOptionsHash as Hashtable
		dim aOptionsList as cRadioButtonList
		        
        MyBase.CoreCtl_Load(sender, e)
         
		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
        ctlList = FindControl("ctlList")
        aOptionsHash =  ctlList.DataListCtl_GetControlCollection("ctlOptions")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aOptionsList = CType(aOptionsHash(aWftaID), cRadioButtonList)				
				
				if (not aOptionsList is nothing) then
					if not IsDBNull(aWftaDO("ReviewPreferenceTypeID")) then
						aOptionsList.SelectedField = aWftaDO.GetPropertyInt("ReviewPreferenceTypeID").ToString()
					else
						aOptionsList.SelectedField = "2"
					end if
				end if
			next
		end if     
   End Sub	
   
 '==============================================================

	Public Sub ViewProjectSummary(ByVal aWfTaskAssignmentID As String, ByVal aGranteeProjectID As String)
		Dim aHref As String

		aHref = WebAppl.Build_RootURL("EasyGrants/Controls/PageSection/pgViewProjectSummary.aspx")
		aHref = cWebLib.AddQuerystringParameter(aHref, "WfTaskAssignmentID", aWfTaskAssignmentID)
		aHref = cWebLib.AddQuerystringParameter(aHref, "GranteeProjectID", aGranteeProjectID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
	  
'=============================================================
  
    Public Sub ValidateConflictType(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
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
		dim aConflictHash as Hashtable
		dim aConflictDD as cDropDown
		dim aOptionsHash as Hashtable
		dim aOptionsList as cRadioButtonList
		
		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
        ctlList = FindControl("ctlList")
        aOptionsHash =  ctlList.DataListCtl_GetControlCollection("ctlOptions")
        aConflictHash =  ctlList.DataListCtl_GetControlCollection("ctlConflictType")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aConflictDD = CType(aConflictHash(aWftaID), cDropDown)
				aOptionsList = CType(aOptionsHash(aWftaID), cRadioButtonList)
				if (not aConflictDD is nothing Or not aOptionsList is nothing) then
					if aOptionsList.SelectedValue = "3" And aConflictDD.SelectedField = "" then
							aApplicantPool.Append("If you select Conflict as your Options for ")
							aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
							aApplicantPool.Append(" , you must select a Conflict Type.")
							aApplicantPool.Append("<br>")
							valConflictType.ErrorMessage = aApplicantPool.ToString()
							aIsValid = False
					end if
				end if
				if (not aConflictDD is nothing Or not aOptionsList is nothing) then
					if aOptionsList.SelectedValue <> "3" And aConflictDD.SelectedField <> "" then
							aApplicantPool.Append("If you select a Conflict Type for ")
							aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
							aApplicantPool.Append(" , you must select Conflict as your Options.")
							aApplicantPool.Append("<br>")
							valConflictType.ErrorMessage = aApplicantPool.ToString()
							aIsValid = False
					end if
				end if
			next
		end if     
		
		if aIsValid = False then
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
		dim aObj as cDataObject
		dim aMinValue as Decimal
		dim aMaxValue as Decimal
		dim aMinValueTextBox as cMoneyTextBox
		dim aMaxValueTextBox as cMoneyTextBox
		dim aStreamLineCheckBox as cCheckBox
		dim aWftaID as Integer
		dim aWfTaskID as Integer
		dim aReviewCycleStageID as Integer
		dim aCheckboxHash2 as Hashtable
		dim aOptionsHash as Hashtable
		dim aOptionsList as cRadioButtonList
		dim aList as cDataObjectList
		dim aWftaReviewPrefDO as cDataObject
		dim aConflictHash as Hashtable
		dim aConflictDD as cDropDown

        aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
		
		ctlList = FindControl("ctlList")
		aOptionsHash =  ctlList.DataListCtl_GetControlCollection("ctlOptions")
		aConflictHash =  ctlList.DataListCtl_GetControlCollection("ctlConflictType")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aWfTaskID = aWftaDO.GetPropertyInt("WfTaskID")
				aOptionsList = CType(aOptionsHash(aWftaID), cRadioButtonList)
				aConflictDD = CType(aConflictHash(aWftaID), cDropDown)
				aGranteeProjectID = aWftaDO.GetPropertyInt("GranteeProjectID")
				if not aOptionsList is nothing Or not aConflictDD is nothing then
					aWftaDO("ReviewPreferenceTypeID") = aOptionsList.SelectedValue
					if aConflictDD.SelectedField <> "" then
						aWftaDO("ReviewConflictTypeID") = aConflictDD.SelectedValue
					else
						aWftaDO("ReviewConflictTypeID") = System.DBNull.Value
					end if
					
					aList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleConflict", _
						"ReviewCycleID", aWftaDO.GetRelatedPropertyString("ReviewCycleStage.ReviewCycleID"), _
						"RevPersonID", aWftaDO.GetPropertyString("PersonID"), _
						"AppPersonID", aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPersonID"))
						
					if aList.Count > 0 then
						aList(0)("RequestConflictID") = aOptionsList.SelectedValue
						
						if aConflictDD.SelectedField <> "" then
							aList(0)("ConflictTypeID") = aConflictDD.SelectedValue
						else
							aList(0)("ConflictTypeID") = System.DBNull.Value
						end if
					
						aList(0)("WFTAID") = aWftaDO.GetPropertyString("WfTaskAssignmentID")
						aList(0)("RevWFTAID") = aWftaDO.GetPropertyString("WfTaskAssignmentID")
						aList(0)("ReviewSourceID") = 3
						aList(0).SaveData()
					else
						aObj = me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("ReviewCycleConflict")
						aObj("ReviewCycleID") = aWftaDO.GetRelatedPropertyString("ReviewCycleStage.ReviewCycleID")
						aObj("RevPersonID") = aWftaDO.GetPropertyString("PersonID")
						aObj("AppPersonID") = aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPersonID")
						
						if aConflictDD.SelectedField <> "" then
							aObj("ConflictTypeID") = aConflictDD.SelectedValue
						else
							aObj("ConflictTypeID") = System.DBNull.Value
						end if
						
						aObj("ConflictTypeID") = aConflictDD.SelectedValue
						aObj("RequestConflictID") = aOptionsList.SelectedValue
						aObj("ReviewSourceID") = 3
						aList(0)("WFTAID") = aWftaDO.GetPropertyString("WfTaskAssignmentID")
						aObj("RevWFTAID") = aWftaDO.GetPropertyString("WfTaskAssignmentID")
						aObj("ReviewCommitteeID") = aWftaDO.GetPropertyString("ReviewCommitteeID")
						aObj.SaveData()
					End If					
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
				
		if MyBase.EventController_Save() = False then exit sub
		
		DataPresenter_SaveDataObjects()
		
		aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
		if aWftaDOList.Count > 0 then
			for each aWftaDO in aWftaDOList
				aGranteeProjectID = aWftaDO.GetPropertyInt("GranteeProjectID")
				aUserGranteeProjectID = aUser.GranteeProjectID
				if aGranteeProjectID <> aUserGranteeProjectID then
					'update each Select Pref status to Complete and Outcome, except for ModuleUser
					aWftaDO("WfTaskStatusID") = 2
					aWftaDO("WfTaskOutcomeID") = 29  'Select Pref Review Task Submitted
					aWftaDO("SubmittedDate") = System.DateTime.Now
					WebSession.DataObjectFactory.SaveDataObject(aWftaDO)
				end if
			next
		end if
		
		'Submit Select Pref review task
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