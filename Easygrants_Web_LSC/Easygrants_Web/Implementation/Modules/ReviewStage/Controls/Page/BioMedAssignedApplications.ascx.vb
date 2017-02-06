Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports EasyGrants.Web.Modules
Imports Easygrants_Web.Modules.Application
'Imports Easygrants_Web.Modules.ReviewStage
Imports Easygrants_Web.Controls.Base
Imports EasyGrants.Web.User
Imports System.Text
Imports Core.Web

Namespace Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page

Public MustInherit Class cBioMedAssignedApplications
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	 
'=============================================================
	protected ctlList as cDataListCtl
	protected errMsg As String
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		Dim aDOList As cDataObjectList
		Dim aDO as cDataObject
		Dim aWftaID as Integer
		Dim aOptionsHash as Hashtable
		Dim aOptionsList as cRadioButtonList
		Dim aRevWftaDO As cDataObject
		Dim aReviewRating As Double

        aDOList = CType(DataObjectCollection("BioMedAssignedApplicationsList"), cDataObjectList)
		ctlList = FindControl("ctlList")
		aOptionsHash = ctlList.DataListCtl_GetControlCollection("ctlOptions")

		For Each aDO In aDOList
			aWftaID = aDO.GetPropertyInt("RevWftaID")
			aRevWftaDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWftaID)
			aOptionsList = CType(aOptionsHash(aWftaID), cRadioButtonList)
			If Not aOptionsList Is Nothing Then
				aReviewRating = aRevWftaDO.GetPropertyDouble("ReviewRating", 0)
				aOptionsList.SelectedField = CType(Math.Floor(aReviewRating), Integer).ToString()
			End If
		Next
	End Sub
   
'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
		Dim aWftaDOList As cDataObjectList
		dim aWftaDO as cDataObject
		dim aGranteeProjectID as Integer
		dim aObj as cDataObject
		dim aWftaID as Integer
		dim aReviewCycleStageID as Integer
		dim aCheckboxHash2 as Hashtable
		dim aOptionsHash as Hashtable
		dim aOptionsList as cRadioButtonList
		dim aList as cDataObjectList
		dim aRevWftaDO As cDataObject

        aWftaDOList = CType(DataObjectCollection("BioMedAssignedApplicationsList"), cDataObjectList)
		
		ctlList = FindControl("ctlList")
		aOptionsHash =  ctlList.DataListCtl_GetControlCollection("ctlOptions")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("RevWftaID")
				aRevWftaDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWftaID)
				aOptionsList = CType(aOptionsHash(aWftaID), cRadioButtonList)
				If Not aOptionsList Is Nothing Then
					Dim aReviewRating As String = CType(Math.Floor(aRevWftaDO.GetPropertyDouble("ReviewRating", 0)), Integer).ToString()
					If aOptionsList.SelectedValue <> aReviewRating Then
						aRevWftaDO("ReviewRating") = aOptionsList.SelectedValue
						WebSession.DataObjectFactory.SaveDataObject(aRevWftaDO)
					End If
				End If
			Next
		End If	
	End Sub 
	
'=============================================================

	Public Sub Submit(CommentsRequired As String, Anchor As String)
		dim aFound as Boolean
		dim aDOList as cDataObjectList
		dim aDO as cDataObject
		dim aWftaDOList as cDataObjectList
		dim aWftaDO as cDataObject
		dim aGranteeProjectID as Integer
		dim aUserGranteeProjectID as Integer
		dim aUser As cEGUser
		dim aRevWftaDO As cDataObject
		dim aCommentsRequired = Convert.ToBoolean(CommentsRequired)
		dim aRatingError As StringBuilder = new StringBuilder()
		dim aCommentError As StringBuilder = new StringBuilder()
        errMsg = ""
        aUser = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser)
				
		'if MyBase.EventController_Save() = False then exit sub
		'DataPresenter_SaveDataObjects()
		
		aDOList = DataObjectCollection("BioMedAssignedApplicationsList")
		aWftaDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "PersonID", aUser.PersonID, "WfTaskID", aUser.WfTaskID)
		
		For Each aWftaDO In aWftaDOList
			aFound = False
			For Each aDO In aDOList
				If aWftaDO.GetPropertyInt("WfTaskAssignmentID") = aDO.GetPropertyInt("RevWftaID")
					aFound = True
				End If				
			Next
			If aFound Then
				If aWftaDO.GetPropertyDouble("ReviewRating", 0) = 0 Then
					aRatingError.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.FirstName") + " " + aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastName") + ", ")
					'exit Sub
				End If			
				If aCommentsRequired Then
					If aWftaDO.GetRelatedPropertyDataObject("WfTaskAssignmentReview") Is Nothing or aWftaDO.GetRelatedPropertyValue("WfTaskAssignmentReview.Comments") Is System.DBNull.Value Then
						aCommentError.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.FirstName") + " " + aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastName") + ", ")
						'exit Sub
					End If
				End If
			End If
		Next
		Dim aURL As String = Request.RawUrl
		If aURL.IndexOf("&#") > -1
			aURL = aURL.Substring(0, aURL.IndexOf("&#"))
		End If

		If aRatingError.ToString() <> "" Then
			aRatingError = new StringBuilder("You are required to select a rating for the following program directors: " + _
				aRatingError.ToString().Substring(0, aRatingError.ToString().Length - 2) + ".<BR><BR>")
		End If
		If aCommentError.ToString() <> "" Then
			aCommentError = new StringBuilder("You are required to enter a comment for the following program directors: " + _
				aCommentError.ToString().Substring(0, aCommentError.ToString().Length - 2) + _
				". To enter a comment, please click on the Add button located under the Comment column.<BR><BR>")
		End If
		errMsg = aRatingError.ToString() + aCommentError.ToString()
		
		if errMsg <> "" then
			'We'd like to remove any anchor, but if we redirect we lose the error message.
			'EventController_NavigateToURL(aURL)
			exit sub
		End If
		'Submit Select Pref review task
		Dim aSubmitPage as cSubmissionModulePage
		aSubmitPage = CType(Page, cSubmissionModulePage)
		aSubmitPage.Submit(aWftaDOList, "ReviewStage", Request.QueryString("Config"))
		
		aURL += "&#" + Anchor
		EventController_NavigateToURL(aURL)
	End Sub

'========================================================================

	Public Sub EditComments(aEditorPageKey As String, aWfTaskAssignmentID As String, aGranteeProjectID As String, aReturnURL As String)
		DataPresenter_SaveDataObjects()
		EventController_NavigateToModulePageKey(aEditorPageKey, "WfTaskAssignmentID=" + aWfTaskAssignmentID, "GranteeProjectID=" + aGranteeProjectID, "ReturnURL=" + aReturnURL)
	End Sub

'========================================================================

	Public Sub Save(Anchor As String)
		DataPresenter_SaveDataObjects()
		Dim aURL As String = Request.RawUrl
		If aURL.IndexOf("&#") > -1
			aURL = aURL.Substring(0, aURL.IndexOf("&#"))
		End If
		aURL += "&#" + Anchor
		EventController_NavigateToURL(aURL)
	End Sub
	
	Public Sub RedirectToCommentsEditor(aEditorPageKey As String, aWfTaskAssignmentID As String, aGranteeProjectID As String, aReturnURL As String)
		EventController_Save
		EventController_NavigateToModulePageKey(aEditorPageKey, aWfTaskAssignmentID, aGranteeProjectID, aReturnURL)
			
	End Sub

'========================================================================

End Class
End Namespace