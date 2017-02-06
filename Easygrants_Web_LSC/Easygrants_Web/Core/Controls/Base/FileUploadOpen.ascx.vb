Imports System.Xml
Imports Core.DataAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Easygrants.Web

Namespace Core_Web.Controls.Base

    Public MustInherit Class cFileUploadOpen
        Inherits Core.Web.cCoreCtl
        '=============================================================

        Protected ctlNewWindowOpener As cNewWindowOpener

        '=============================================================

        Protected Sub Open_Report(ByVal aURL As String)
            ctlNewWindowOpener.NewWindowURL = aURL
            ctlNewWindowOpener.Open()
        End Sub

        '-------------------------------------------------------------

        Public Sub Open_WfTaskAssignment_ReportOutput(ByVal aWfTaskAssignmentID As String, _
                    ByVal aReportOutputDefID As String)
            Dim aURL As String

            aURL = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aWfTaskAssignmentID, aReportOutputDefID)

            Open_Report(aURL)
        End Sub

        '-------------------------------------------------------------

        Public Sub Open_GranteeProjectReviewStage_ReportOutput(ByVal aGranteeProjectReviewStageID As String, _
                    ByVal aReportOutputDefID As String)
            Dim aGranteeProjectReviewStage As cDataObject

            aGranteeProjectReviewStage = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProjectReviewStage", _
                    aGranteeProjectReviewStageID)

            Open_WfTaskAssignment_ReportOutput(aGranteeProjectReviewStage.GetPropertyString("AppWfTaskAssignmentID"), _
                        aReportOutputDefID)
        End Sub

        '-------------------------------------------------------------

        Public Sub Open_GranteeProjectReviewStage_ReportOutput(ByVal aGranteeProjectReviewStageID As String)
            Dim aGranteeProjectReviewStage As cDataObject

            aGranteeProjectReviewStage = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", _
                    aGranteeProjectReviewStageID)

            Open_WfTaskAssignment_ReportOutput(aGranteeProjectReviewStage.GetPropertyString("SubmittedFileID"), "1")
                        'aGranteeProjectReviewStage.GetRelatedPropertyString("AppWfTaskAssignment.WfTask.ReviewerReportOutputDefinitionID"))
        End Sub


        '=============================================================
    End Class
End Namespace