Imports EasyGrants.Web.User
Imports EasyGrants.Web.Modules
Imports Core.DataAccess

Namespace Implementation.Controls.PageSection

Public Class cManagementReviewList
	Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

	Private mWfTAHash As Hashtable
	Private mSubmissionModulePage As cSubmissionModulePage
	Private mUser As cEGUser

	Public ReadOnly Property WfTAHash() As Hashtable
		Get
			If mWfTAHash Is Nothing Then
				mWfTAHash = New Hashtable()
			End If
			Return mWfTAHash
		End Get
	End Property

	Protected ReadOnly Property SubmissionModulePage() As cSubmissionModulePage
		Get
			If mSubmissionModulePage Is Nothing Then
				mSubmissionModulePage = CType(Me.Page, cSubmissionModulePage)
			End If
			Return mSubmissionModulePage
		End Get
	End Property

	Protected ReadOnly Property WfTAUser() As cEGWfTAUser
		Get
			If mUser Is Nothing Then
				Try
					mUser = CType(SubmissionModulePage.ModuleUser, cEGWfTAUser)
				Catch
				End Try
			End If
			Return mUser
		End Get
	End Property

	Public Sub AddWfTA(ByVal aWfTaskAssignmentID As Integer)
		WfTAHash.Add(aWfTaskAssignmentID, CType(aWfTaskAssignmentID, Integer))
	End Sub

	Public Overloads Sub SwitchWfTA(ByVal aWfTaskAssignmentID As String, ByVal aGranteeProjectID As String)
		Me.WfTAUser.WfTaskAssignmentID = CType(aWfTaskAssignmentID, Integer)
		Me.WfTAUser.GranteeProjectID = CType(aGranteeProjectID, Integer)
	End Sub

	Public Overloads Sub SwitchWfTA(ByVal aWfTaskAssignmentID As String)
		Dim aWfTA As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID)
		SwitchWfTA(aWfTaskAssignmentID, aWfTA.GetPropertyString("GranteeProjectID"))
	End Sub

	Public Sub Submit()
		Dim aWfTAID As Integer
		For Each aWfTAID In WfTAHash.Values
			SwitchWfTA(aWfTAID.ToString())
			ReportOutput_Create(aWfTAID)
			SubmissionModulePage.Submit_UpdateData()
		Next
		CorePage.Redirect()
	End Sub

	Public Sub ReportOutput_Create(ByVal aWfTAID As Integer)
		Dim aWfTA As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTAID.ToString())
		Dim aDefinitionID As Integer = aWfTA.GetRelatedPropertyInt("WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID", 0)
		If aDefinitionID > 0 Then
			Dim aReportOutputDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReportOutput", "EntityID", aWfTAID, "DefinitionID", aDefinitionID)
			Dim aReportOutputDO As cDataObject
			If aReportOutputDOL.Count > 0 Then
				aReportOutputDO = aReportOutputDOL(0)
			End If
			If Not aReportOutputDO Is Nothing Then
				aReportOutputDO("GenStatus") = 0
				aReportOutputDO("GenResult") = "Report is in the queue to be generated."
				aReportOutputDO.SaveData()
			Else
				aReportOutputDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("ReportOutput")
				aReportOutputDO("EntityID") = aWfTAID
				aReportOutputDO("DefinitionID") = aDefinitionID
				aReportOutputDO("GenRequestDate") = DateTime.Now
				aReportOutputDO("GenStatus") = 0
				aReportOutputDO("SharepointConversionStatus") = 0
				aReportOutputDO("GenResult") = "Report is in the queue to be generated."
				WebSession.DataObjectFactory.SaveDataObject(aReportOutputDO)
			End If
		End If
	End Sub

End Class

End Namespace