Imports Core.DataAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page

Public MustInherit Class cBioMedConflicts
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	
	Protected spnSubmitted As HtmlGenericControl
	Protected spnUnsubmitted As HtmlGenericControl
	Protected trSave1 As HtmlTableRow
	Protected trSave2 As HtmlTableRow
	Protected ctlList as cDataListCtl

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)

		Dim aWftaDOList As cDataObjectList	
		Dim aWftaDO As cDataObject
		Dim aWftaID As Integer
		Dim aOptionsHash As Hashtable
		Dim aOptionsList As cRadioButtonList

		Dim IsSubmitted As Boolean = True
		aWftaDOList = CType(DataObjectCollection("MedPhysicianRCList"), cDataObjectList)
        ctlList = FindControl("ctlList")
        aOptionsHash =  ctlList.DataListCtl_GetControlCollection("ctlOptions")
		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				If aWftaDO.GetPropertyInt("WfTaskStatusID", 0) = 1 Then
					IsSubmitted = False
				End If
				aWftaID = aWftaDO.GetPropertyInt("RevWftaID")
				aOptionsList = CType(aOptionsHash(aWftaID), cRadioButtonList)
				if (not aOptionsList is nothing) then
					if not IsDBNull(aWftaDO("RequestConflictID")) then
						aOptionsList.SelectedField = aWftaDO.GetPropertyInt("RequestConflictID").ToString()
					else
						aOptionsList.SelectedField = "0"
					end if
				end if
			Next
		End If

		If IsSubmitted Then
			spnSubmitted.Visible = True
			spnUnsubmitted.Visible = False
			trSave1.Visible = False
			trSave2.Visible = False
		Else
			spnSubmitted.Visible = False
			spnUnsubmitted.Visible = True
		End If
	End Sub

	Public Overrides Sub DataPresenter_SaveDataObjects()
		Dim aWftaDOList As cDataObjectList
		Dim aWftaDO As cDataObject
		Dim aGranteeProjectID As Integer
		Dim aObj As cDataObject
		Dim aWftaID As Integer
		Dim aWfTaskID As Integer
		Dim aOptionsHash As Hashtable
		Dim aOptionsList As cRadioButtonList
		Dim aList As cDataObjectList
		Dim aRevWftaDO As cDataObject

        aWftaDOList = CType(DataObjectCollection("MedPhysicianRCList"), cDataObjectList)
		
		ctlList = FindControl("ctlList")
		aOptionsHash =  ctlList.DataListCtl_GetControlCollection("ctlOptions")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("RevWftaID")
				aRevWftaDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWftaID)
				aWfTaskID = aWftaDO.GetPropertyInt("RevWfTaskID")
				aOptionsList = CType(aOptionsHash(aWftaID), cRadioButtonList)
				aGranteeProjectID = aWftaDO.GetPropertyInt("GranteeProjectID")
				If Not aOptionsList Is Nothing Then
					aRevWftaDO("ReviewPreferenceTypeID") = aOptionsList.SelectedValue
					aRevWftaDO.SaveData()

					aList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleConflict", _
						"ReviewCycleID", aRevWftaDO.GetRelatedPropertyString("ReviewCycleStage.ReviewCycleID"), _
						"RevPersonID", aWftaDO.GetPropertyString("ReviewerID"), _
						"AppPersonID", aWftaDO.GetRelatedPropertyString("AppPersonID"))
					
					If aList.Count > 0 Then
						If aList(0)("ReviewSourceID") <> 3 And aList(0)("RequestConflictID") = 2 And aOptionsList.SelectedValue < 2 Then
						'do not do anything if reviewer wants to override a non external conflict
						Else
							aList(0)("RequestConflictID") = aOptionsList.SelectedValue
							If aList(0).Modified Then
								'aList(0)("WFTAID") = aWftaDO.GetPropertyString("RevWftaID")
								aList(0)("RevWFTAID") = aWftaDO.GetPropertyString("RevWftaID")
								aList(0)("ReviewSourceID") = 3 'external
								aList(0).SaveData()
							End If
						End If
					Else
						aObj = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("ReviewCycleConflict")
						aObj("ReviewCycleID") = aRevWftaDO.GetRelatedPropertyString("ReviewCycleStage.ReviewCycleID")
						aObj("RevPersonID") = aWftaDO.GetPropertyString("ReviewerID")
						aObj("AppPersonID") = aWftaDO.GetRelatedPropertyString("AppPersonID")
						aObj("RequestConflictID") = aOptionsList.SelectedValue
						aObj("ReviewSourceID") = 3 'external
						aObj("RevWFTAID") = aWftaDO.GetPropertyInt("RevWftaID")
						aObj("ReviewCommitteeID") = aRevWftaDO.GetPropertyInt("ReviewCommitteeID")
						aObj.SaveData()
					End If
				end if
			Next
		End If	
	End Sub 

	Public Sub Submit()
		Dim aUser As cEGUser
		Dim aWftaDOList As cDataObjectList
		Dim aWftaDO As cDataObject
		Dim aGranteeProjectID As Integer
		Dim aRevWftaDO As cDataObject
        
        aUser = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser)

		If MyBase.EventController_Save() = False Then
			Exit Sub
		End If
		DataPresenter_SaveDataObjects()
		
		aWftaDOList = CType(DataObjectCollection("MedPhysicianRCList"), cDataObjectList)
		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aGranteeProjectID = aWftaDO.GetPropertyInt("GranteeProjectID")
				aRevWftaDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWftaDO.GetPropertyInt("RevWftaID"))
				If aGranteeProjectID <> aUser.GranteeProjectID Then
					'update each Select Pref status to Complete and Outcome, except for ModuleUser
					aRevWftaDO("WfTaskStatusID") = 2
					'aWftaDO("WfTaskOutcomeID") = 29  'Select Pref Review Task Submitted
					aRevWftaDO("SubmittedDate") = System.DateTime.Now
					WebSession.DataObjectFactory.SaveDataObject(aRevWftaDO)
				End If
			Next
		End If
		
		'Submit Select Pref review task
		Dim aSubmitPage As cSubmissionModulePage
		aSubmitPage = CType(Page, cSubmissionModulePage)
		aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
		aSubmitPage.PostSubmitModuleName = "ReviewStage"
		aSubmitPage.PostSubmitPageKey = "Conflicts"
		aSubmitPage.Submit(False)
	End Sub

End Class
End Namespace