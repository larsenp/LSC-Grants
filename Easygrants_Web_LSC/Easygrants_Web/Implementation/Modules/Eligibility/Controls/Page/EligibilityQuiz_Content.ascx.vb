Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.DataAccess
Imports EasyGrants.Workflow
Imports Easygrants_Web.Controls.Base
Imports Core.DataAccess.DBAccess
Imports Core.Util
Imports Core.Web
Imports Core.Web.SvrCtls
Imports EasyGrants.DataAccess.Report
Imports EasyGrants.Web

Namespace Easygrants_Web.Implementation.Modules.Eligibility.Controls.Page
Public MustInherit Class cEligibilityQuiz_Content
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================
		Dim ctlEligibilityQuestionsList As cDataPresenterList
		Dim aEligibilityQuestionsList As Hashtable
		Dim aDataPresenter As cDataPresenterCtl
		Dim aLable As cLabel
		Dim aRadioButtonList As cRadioButtonList

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		'Here every time when we get into eligibility Task , we will be redirected to eligibility Page , 
		'but when the eligibility Task is completed we need to redirect it to Eligibility Confirmation
		Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		Dim aWFTADO As cDataObject = aUser.WfTaskAssignmentObject
		If Not aWFTADO Is Nothing Then
			If aWFTADO("WfTaskStatusID") = 2 Then
				Dim aURL As String = Request.RawUrl.ToString
				aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "EligibilityConfirm")
				Response.Redirect(aURL)
			End If
		End If
	End Sub

'-------------------------------------------------------------
	 Public Overrides Sub DataPresenter_SaveDataObjects()
		Dim aWfProjectTaskList As cDataObjectList
		Dim aEligibilityList As cDataObjectList
		Dim aXMLDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aDataObject As cDataObject
		Dim PersonID As Integer
		Dim GranteeProjectID As Integer
		Dim WfProjectTaskID As Integer

		ctlEligibilityQuestionsList = Me.FindControl("ctlEligibilityQuestionsList")
		aEligibilityQuestionsList = CType(ctlEligibilityQuestionsList.DataPresenterCollection, Hashtable)
		PersonID = CType(CType(Page, cModulePage).ModuleUser, cEGUser).PersonID
		GranteeProjectID = CType(CType(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID
		aWfProjectTaskList = CType(Me.DataObjectCollection("WfProjectTask"), cDataObjectList)

		If aWfProjectTaskList.Count > 0 Then
			WfProjectTaskID = aWfProjectTaskList(0).GetRelatedPropertyValue("WfProjectTaskID")
		End If

		Dim myEnumerator As IDictionaryEnumerator = aEligibilityQuestionsList.GetEnumerator
		While myEnumerator.MoveNext
			aDataPresenter = myEnumerator.Value
			aLable = CType(aDataPresenter.FindControl("ctlQuestionID"), cLabel)
			Dim QuestionID As Integer = aLable.Value
			aRadioButtonList = CType(aDataPresenter.FindControl("ctlAnswerList"), cRadioButtonList)
			Dim AnswerID As Integer = aRadioButtonList.SelectedValue

			aEligibilityList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Eligibility", _
						"GranteeProjectID", GranteeProjectID, "WfProjectTaskID", WfProjectTaskID, "QuestionID", QuestionID)

			If Not aEligibilityList Is Nothing Then
				If aEligibilityList.Count > 0 Then
					aEligibilityList(0)("AnswerID") = AnswerID
					WebSession.DataObjectFactory.SaveDataObject(aEligibilityList(0))
				Else
					aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Eligibility", aDataObjectNode)
					aDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
					aDataObject("PersonID") = PersonID
					aDataObject("GranteeProjectID") = GranteeProjectID
					aDataObject("WfProjectTaskID") = WfProjectTaskID
					aDataObject("QuestionID") = QuestionID
					aDataObject("AnswerID") = AnswerID
					WebSession.DataObjectFactory.SaveDataObject(aDataObject)
				End If
			End If

		End While
	 End Sub

'=============================================================
End Class
End Namespace