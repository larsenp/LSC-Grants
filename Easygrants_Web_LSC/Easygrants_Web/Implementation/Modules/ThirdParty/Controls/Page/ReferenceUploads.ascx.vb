Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.Modules
Namespace Implementation.Modules.ThirdParty.Controls.Page

    Public MustInherit Class cReferenceUploads
        Inherits Easygrants_Web.Controls.Base.cValidationDataPresenterCtl

        Protected ctlNewWindowOpener As cNewWindowOpener
        Protected tblUploads As HtmlTable
        Protected tblPostSubmission As HtmlTable
        Protected tblSubmission As HtmlTable
        Protected spnSubmit As HtmlGenericControl
        Private aWfTaskAssignmentObject As cWfTaskAssignment
        Protected mForceGen As Boolean = True
        Private aWfDataObject As cWfTaskAssignment
        Dim aApplicationWfTaskAssignmentDOL As cDataObjectList
'===================================================================================================
        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            TblUploads.Visible = True
            MyBase.CoreCtl_Load(aSrc, aEvent)
            Dim aValidationNode As XmlNode
            Dim aValid As Boolean

            aValidationNode = (CType(Page, cModulePage)).ValidationNode
            aWfDataObject = CType(mDataObjHash("WfTaskAssignment")(0), cWfTaskAssignment)

            aValid = Validate(aValidationNode, WebSession.DataObjectFactory)

            If Not aValid Then
                spnSubmit.Visible = False
            End If
        End Sub
        '===================================================================================================
        Public Sub ViewAppPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
            Dim aHref As String
            aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID, "False")
            ctlNewWindowOpener.NewWindowURL = aHref
            ctlNewWindowOpener.Open()
        End Sub
        '===================================================================================================
        Protected Overrides Sub OnPreRender(ByVal e As EventArgs)
            MyBase.OnPreRender(e)
            Dim aUser As cEGUser
            Dim aStatus As Integer = 0

            Dim aWFTaskAssignmentDo As cDataObject = Me.DataObjectCollection("WfTaskAssignment")(0)

            If Not aWFTaskAssignmentDo Is Nothing Then
                aStatus = aWFTaskAssignmentDo("WfTaskStatusID")
            End If
            If aStatus = 1 Or aStatus = 4 Then
                tblPostSubmission.Visible = False
                tblSubmission.Visible = True
                tblUploads.Visible = True
            ElseIf aStatus = 2 Then
                tblPostSubmission.Visible = True
                tblSubmission.Visible = False
                tblUploads.Visible = False
            End If
        End Sub
        '===================================================================================================
        Public Sub SubmissionContent_Submit()
            Me.Page.Validate()
            If Me.Page.IsValid = True Then
                Dim aSubmitPage As cSubmissionModulePage
                Dim aApplicationWfTaskAssignmentDOL As cDataObjectList

                aSubmitPage = CType(Page, cSubmissionModulePage)
                aWfTaskAssignmentObject = aSubmitPage.WfTaskAssignmentObject
                'Set post-submission parameters. Navigate to default page of current module (i.e., the ApplicationChecklist page key, 
                'which uses SubmittedContent.ascx as its post-submission content control) 
                If aWfTaskAssignmentObject.GetRelatedPropertyDataObject("WfTask").HasProperty("WfTaskModuleConfig") AndAlso Not aWfTaskAssignmentObject.GetRelatedPropertyDataObject("WfTask.WfTaskModuleConfig") Is Nothing Then
                    'If  Task is configured with Task Builder and Workflow builder
                    aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
                    aSubmitPage.PostSubmitModuleName = aWfTaskAssignmentObject.GetRelatedPropertyString("WfTask.WfTaskModule.ModuleName")
                    aSubmitPage.Submit_UpdateData()

                    aApplicationWfTaskAssignmentDOL = Me.DataObjectCollection("ApplicationWfTaskAssignment")
                    ReportOutput_Create(aWfTaskAssignmentObject.GetPropertyInt("WfTaskAssignmentID", 0), aWfTaskAssignmentObject.GetRelatedPropertyInt("WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID", 0))
                    ReportOutput_Create(aApplicationWfTaskAssignmentDOL(0).GetPropertyInt("WfTaskAssignmentID", 0), aApplicationWfTaskAssignmentDOL(0).GetRelatedPropertyInt("WfProjectTask.StaffPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID", 0))
                    aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
                End If
            End If
        End Sub
        Public Sub ReportOutput_Create(ByVal aEntityID As Integer, ByVal aDefinitionID As Integer)
            If aDefinitionID > 0 Then
                Dim aReportOutputDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReportOutput", "EntityID", aEntityID, "DefinitionID", aDefinitionID)
                Dim aReportOutputDO As cDataObject
                If aReportOutputDOL.Count > 0 Then
                    aReportOutputDO = aReportOutputDOL(0)
                End If
                If Not aReportOutputDO Is Nothing Then
                    aReportOutputDO("GenStatus") = 0
                    aReportOutputDO.SaveData()
                Else
                    aReportOutputDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("ReportOutput")
                    aReportOutputDO("EntityID") = aEntityID
                    aReportOutputDO("DefinitionID") = aDefinitionID
                    aReportOutputDO("GenRequestDate") = DateTime.Now
                    aReportOutputDO("GenStatus") = 0
                    aReportOutputDO("GenResult") = "Report is in the queue to be generated."
                    WebSession.DataObjectFactory.SaveDataObject(aReportOutputDO)
                End If
            End If
        End Sub
        Public Sub ValidateUploads(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            Dim aValidationNode As XmlNode
            Dim aValid As Boolean
            aValidationNode = (CType(Page, cModulePage)).ValidationNode
            aValid = Validate(aValidationNode, WebSession.DataObjectFactory)
            If aValid = False Then
                aArgs.IsValid = False
            Else
                aArgs.IsValid = True
            End If
        End Sub

    End Class
End Namespace