Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports Core.DataAccess
Imports Core.Web
Imports EasyGrants.Web.Modules

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cAssignedApplication
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'========================================================================
	Protected spnSubmit As HtmlGenericControl
	Private mDataObject As cDataObject
'========================================================================
	Public ReadOnly Property WfTaskStatusID() As Integer
		Get
			WfTaskStatusID = mDataObject.GetPropertyInt("WfTaskStatusID", -1)
		End Get
	End Property
'-------------------------------------------------------------
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aWFTAList As cDataObjectList
		Dim aWFTA As cDataObject

		spnSubmit.Visible = False
		aWFTAList = Me.DataObjectCollection("WfTaskAssignmentList")
		mDataObject = CType(Me.DataObjectCollection("UserTaskAssignment"), cDataObjectList)(0)
		If WfTaskStatusID <> 2 Then
			For Each aWFTA In aWFTAList
				Try
					If aWFTA.GetRelatedPropertyString("WfTaskAssignmentReviews.Rating") <> "" Then
						spnSubmit.Visible = True
						Exit For
					End If
				Catch
					spnSubmit.Visible = False
					Exit For
				End Try
			Next
		Else
			spnSubmit.Visible = False
		End If
	End Sub

'-------------------------------------------------------------

	Public Sub RedirectToAssignment(ByVal aWfTaskAssignmentID As String)
		Dim aUser As cEGWfTAUser
		aUser = CType(Page, cModulePage).ModuleUser
		aUser.WfTaskAssignmentID = Convert.ToInt32(aWfTaskAssignmentID)
		EventController_NavigateToModulePageKey("ReviewRate")
	End Sub
'-------------------------------------------------

	Public Sub SubmissionContent_Submit()
		dim aObj as cDataObject
		Dim aDOList As cDataObjectList = ctype(me.DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
		
		for each aObj in aDOList
			aObj("WfTaskStatusID") = 2
			me.WebSession.DataObjectFactory.SaveDataObject(aObj)
		next
		
		CType(Page, cModulePage).ModulePage_RedirectToModule("Home", "HomeModuleConfig", "", "Home")
		'Dim aSubmitPage As cSubmissionModulePage

		''Set status of all review task assignments to completed
		'aDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
		'aSubmitPage = CType(Page, cSubmissionModulePage)
		'aSubmitPage.Submit(aDOList, "ReviewStage", Request.QueryString("Config"))
	End Sub
'========================================================================
End Class
End Namespace
