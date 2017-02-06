Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports EasyGrants.Web

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cGrantTaskAssignHistory
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

	'=============================================================
	Protected ctlNewWindowOpener As cNewWindowOpener
	'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

'========================================================================
	Public Sub ViewAppPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String = ""
		Dim aWFTADo As cDataObject
		Dim AppWftaID As String = ""
		Dim AppDefinitionID As String = ""

		aWFTADo = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "WfTaskAssignmentID", aEntityID)(0)
		AppWftaID = aWFTADo.GetPropertyInt("AppWftaID", -1)

		If AppWftaID > 0 Then
			AppDefinitionID = aWFTADo.GetRelatedPropertyInt("AppWfta.WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID", -1)
			aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(AppWftaID, AppDefinitionID)
		Else
			aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
		End If

		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
	
	Public Sub ViewComments(ByVal PageKey As String, ByVal WfTaskAssignmentID As String)
	
		Dim aURL As String = Request.Url.ToString
		Dim aReturnURL As String = "&ReturnURL=" + request.QueryString("ReturnURL")
		aURL = aURL.Replace(aReturnURL, "")
		aURL = cWebLib.AddQuerystringParameter(aURL, "Page", PageKey)
		Dim aWFTADO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", WfTaskAssignmentID)
		aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskAssignmentID", WfTaskAssignmentID)
		Dim aWfTaskAssignmentReviewDO As cDataObject = aWFTADO.GetRelatedPropertyDataObject("WfTaskAssignmentReview")
		If Not aWfTaskAssignmentReviewDO Is Nothing Then
			aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskAssignmentReviewID", aWfTaskAssignmentReviewDO.GetPropertyString("WfTaskAssignmentReviewID"))
		Else
			aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskAssignmentReviewID", "0")
		End If

		If Not aReturnURL Is Nothing Then
			aURL = cWebLib.AddQuerystringParameter(aURL, aReturnURL, Server)
		End If

		Response.Redirect(aURL)
	End Sub

	End Class
End Namespace