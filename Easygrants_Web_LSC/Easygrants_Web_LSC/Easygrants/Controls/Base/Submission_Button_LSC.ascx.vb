Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports EasyGrants.Web.Modules
Imports Easygrants_Web.Modules.LOI
Imports EasyGrants.Modules.Application.Controls.Page

Namespace EasyGrants.Modules.Application.Controls.Page

Public MustInherit Class cSubmission_Button_LSC
	Inherits cSubmission_ButtonImpl
	'=================================================

		Private aWfTaskModuleObject As cWfTaskAssignment
		Private mConfirmation As String
		Protected btnSubmit As cCSSButton

'-------------------------------------------------
	Public Property Confirmation()
		Get
			Return mConfirmation
		End Get
		Set(ByVal value)
			mConfirmation = value
		End Set
	End Property



		Public Overridable Sub SubmissionContent_Submit_LSC()

		Dim aSubmitPage As cSubmissionModulePage
		Dim aWfStatusID As Integer = -1
		Dim aPDFEntityProperty As String
		
		aSubmitPage = CType(Page, cSubmissionModulePage)
		aWfTaskModuleObject = aSubmitPage.WfTaskAssignmentObject
		aWfStatusID = aWfTaskModuleObject.GetPropertyInt("WfTaskStatusID", "-1")
		'Set post-submission parameters. Navigate to default page of current module (i.e., the ApplicationChecklist page key, 
		'which uses SubmittedContent.ascx as its post-submission content control) 
		If aWfTaskModuleObject.GetRelatedPropertyDataObject("WfTask").HasProperty("WfTaskModuleConfig") AndAlso Not aWfTaskModuleObject.GetRelatedPropertyDataObject("WfTask.WfTaskModuleConfig") Is Nothing Then
		'If  Task is configured with Task Builder and Workflow builder
			aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
			aSubmitPage.PostSubmitModuleName = aWfTaskModuleObject.GetRelatedPropertyString("WfTask.WfTaskModule.ModuleName")
			aSubmitPage.Submit_UpdateData()

			If NotifyThirdParty = True Then
				SubmissionContent_NotifyThirdParty()
			End If
			aPDFEntityProperty = aWfTaskModuleObject.GetRelatedPropertyString("WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.EntityDataObjectKey") + "ID"
			If aPDFEntityProperty <> "ID" Then
				ReportOutput_Create(aWfTaskModuleObject.GetPropertyInt(aPDFEntityProperty, 0), aWfTaskModuleObject.GetRelatedPropertyInt("WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID", 0))
			End If
			aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
		Else
			'Task submission with module config and outcome config - fully configurable in outcome config file
			SubmissionContent_Submit_LSC_OutcomeConfig(aSubmitPage)

			'Task submission with module config and outcome config - original code-dependent model
			aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
			If aSubmitPage.PostSubmitModuleConfig <> "" Then
				If aSubmitPage.PostSubmitModuleConfig = "LOIModuleConfig" Then
						aSubmitPage.PostSubmitModuleName = "LOI"
						aSubmitPage.Submit_UpdateData()
						ReportOutput_Create(aWfTaskModuleObject.GetPropertyInt("WfTaskAssignmentID", 0), aWfTaskModuleObject.GetRelatedPropertyInt("GranteeProject.WfProject.ProjectSummaryReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID", 0))
						aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
				ElseIf aSubmitPage.PostSubmitModuleConfig = "ApplModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "RenewalModuleConfig" Then
						aSubmitPage.PostSubmitModuleName = "Application"
						aSubmitPage.Submit_UpdateData()
						ReportOutput_Create(aWfTaskModuleObject.GetPropertyInt("WfTaskAssignmentID", 0), aWfTaskModuleObject.GetRelatedPropertyInt("GranteeProject.WfProject.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID", 0))
						aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
				ElseIf aSubmitPage.PostSubmitModuleConfig = "ApplReviewModuleConfig" Then
						aSubmitPage.PostSubmitModuleName = "ApplReview"
						aSubmitPage.Submit_UpdateData()
						aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
				ElseIf aSubmitPage.PostSubmitModuleConfig = "RenewalReviewModuleConfig" Then
						aSubmitPage.PostSubmitModuleName = "RenewalReview"
						aSubmitPage.Submit_UpdateData()
						aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
					ElseIf aSubmitPage.PostSubmitModuleConfig = "ApplReviewModule_OPPDirConfig" Then ' newly added 
						aSubmitPage.PostSubmitModuleName = "ApplReview_OPPDir"
						aSubmitPage.Submit_UpdateData()
						aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
					ElseIf aSubmitPage.PostSubmitModuleConfig = "RenewalReviewModule_OPPDirConfig" Then	' newly added 
						aSubmitPage.PostSubmitModuleName = "RenewalReview_OPPDir"
						aSubmitPage.Submit_UpdateData()
						aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
				ElseIf aSubmitPage.PostSubmitModuleConfig = "UploadCertificationModuleConfig" Then
						aSubmitPage.PostSubmitModuleName = "UploadCertification"
						aSubmitPage.Submit_UpdateData()
						aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
				ElseIf aSubmitPage.PostSubmitModuleConfig = "GrantRequestModuleConfig" Then
						aSubmitPage.PostSubmitModuleName = "Application"
						aSubmitPage.Submit_UpdateData()
						ReportOutput_Create(aWfTaskModuleObject.GetPropertyInt("WfTaskAssignmentID", 0), aWfTaskModuleObject.GetRelatedPropertyInt("GranteeProject.WfProject.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID", 0))
						aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
				ElseIf aSubmitPage.PostSubmitModuleConfig = "ProgressReportModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "InterimReportModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "FinalReportModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "FundRequestReportModuleConfig" Then
						aSubmitPage.PostSubmitModuleName = "GranteeReports"
						aSubmitPage.Submit_UpdateData()
						ReportOutput_Create(aWfTaskModuleObject.GetPropertyInt("WfTaskAssignmentID", 0), aWfTaskModuleObject.GetRelatedPropertyInt("GranteeProject.WfProject.ReportsPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID", 0))
						aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
				ElseIf aSubmitPage.PostSubmitModuleConfig = "ActualExpensesModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ActualRevenueModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ProjectedExpensesModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ProjectedRevenueModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ActualCaseServModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ActualCaseServPAIModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ClientAgeEthGenModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ActualOpenCasesModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ActualOpenCasesPAIModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ComponentsActualPAIModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ComponentsProjectedPAIModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "OtherServicesModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "SelfInspectionModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ServiceNarrativeModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ProjectedCaseServModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ProjectedCaseServPAIModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ActualOfficeInfoModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ActualStaffingMainModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ActualStaffingBranchModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ActualStaffingSubModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ProjectedStaffingRecipModuleConfig" Or _
						aSubmitPage.PostSubmitModuleConfig = "ProjectedStaffingSubModuleConfig" Then
						aSubmitPage.PostSubmitModuleName = "GAR"
						aSubmitPage.Submit_UpdateData()
				End If
			End If
		End If

		aSubmitPage.Submit(ForceGen)

	End Sub

	Public Overridable Sub SubmissionContent_Submit_LSC_OutcomeConfig(ByVal aSubmitPage As cSubmissionModulePage)

		Dim aOutcomesEl As XmlElement = aSubmitPage.OutcomeConfigDoc.DocElement.SelectSingleNode("Outcomes")
		If Not aOutcomesEl Is Nothing Then
			aSubmitPage.PostSubmitModuleConfig = cXMLDoc.AttributeToString(aOutcomesEl, "PostSubmitModuleConfig")
			aSubmitPage.PostSubmitModuleName = cXMLDoc.AttributeToString(aOutcomesEl, "PostSubmitModuleName")
			If aSubmitPage.PostSubmitModuleConfig <> "" And aSubmitPage.PostSubmitModuleName <> "" Then
				aSubmitPage.Submit_UpdateData()
				Dim aReportOutputRelatedProperty As String = cXMLDoc.AttributeToString(aOutcomesEl, "ReportOutputRelatedProperty", "WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
				If aReportOutputRelatedProperty <> "" Then
					ReportOutput_Create(aWfTaskModuleObject.GetPropertyInt("WfTaskAssignmentID", 0), aWfTaskModuleObject.GetRelatedPropertyInt(aReportOutputRelatedProperty, 0))
				End If
				aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
			End If
		End If

	End Sub

'=================================================
End Class
End Namespace