Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.User
Imports Core.Web.Modules
Imports EasyGrants.Web
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports Core.Web.Navigation.CrumbTrail


Namespace Easygrants_Web.Modules.Staff.Controls.Page

Public MustInherit Class cProgramMgmt_Content
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

	End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

	Protected btnProgramsClear As cCSSButton
    Protected ctlCompetitionListing As cDataPresenterCtl
    Protected ctlWfProgramListing As cDataPresenterCtl
	'Protected ctlWfTaskListing As cDataPresenterCtl
	Protected ctlWfTaskOutcomeListing As cDataPresenterCtl
	Protected tblProgramManagement As HtmlTable
	Protected WithEvents spnHistoryLabel As System.Web.UI.HtmlControls.HtmlGenericControl
    Protected WithEvents ctlCrumbTrail As cCrumbTrailDisplay
    Protected ctlFundingOppCycleInfo As cDataPresenterCtl
    Protected ctlWorkflowMain As cDataPresenterCtl
    Protected ctlWorkflowValidation As cDataPresenterCtl
    Protected ctlGoToNavigation As cHorizNavCtl
    Protected WorkflowBuilderTabPlaceHolder As PlaceHolder

'=============================================================

    Protected ReadOnly Property ProgramID() As String
        Get
            ProgramID = Request.QueryString("ProgramID")
        End Get
    End Property

'-------------------------------------------------------------

    Protected ReadOnly Property CompetitionID() As String
        Get
            CompetitionID = Request.QueryString("CompetitionID")
        End Get
    End Property

'-------------------------------------------------------------

    Protected ReadOnly Property WfProjectID() As String
        Get
            WfProjectID = Request.QueryString("WfProjectID")
        End Get
    End Property

'-------------------------------------------------------------

    Protected ReadOnly Property WfTaskID() As String
        Get
            WfTaskID = Request.QueryString("WfTaskID")
        End Get
    End Property

'-------------------------------------------------------------

    Protected ReadOnly Property WfTaskAssignmentID() As String
        Get
            WfTaskAssignmentID = Request.QueryString("WfTaskAssignmentID")
        End Get
    End Property
    
    Protected ReadOnly Property PageKey() As String
        Get
            PageKey = Request.QueryString("Page")
        End Get
    End Property

'-------------------------------------------------------------


    Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		ctlFundingOppCycleInfo.Visible = False
        If ProgramID = "" Then
            ctlCrumbTrail.CrumbTrail = CType(CType(Page, cModulePage).ModuleUser, cWebUser).CrumbTrail
            ctlCrumbTrail.CrumbTrail.Validate_Root("Programs", "", "Program Management", Request.Url.AbsoluteUri)
            ctlCrumbTrail.Visible = False
        End If
        If ProgramID <> "" Then
            tblProgramManagement.Visible = False
            ctlCompetitionListing.Visible = True
            btnProgramsClear.Visible = ctlCompetitionListing.Visible
            If CompetitionID = "" Then
                ctlCrumbTrail.CrumbTrail = CType(CType(Page, cModulePage).ModuleUser, cWebUser).CrumbTrail
                ctlCrumbTrail.CrumbTrail.Validate("Competitions", "", "Funding Opportunity Management", Request.Url.AbsoluteUri)
                ctlCrumbTrail.Visible = True
            End If
                If CompetitionID <> "" Then
                ctlWfProgramListing.Visible = True
                ctlCompetitionListing.Visible = False
                If WfProjectID = "" Then
                    ctlCrumbTrail.CrumbTrail = CType(CType(Page, cModulePage).ModuleUser, cWebUser).CrumbTrail
                        ctlCrumbTrail.CrumbTrail.Validate("Projects", "", "Funding Cycle Management", Request.Url.AbsoluteUri)
                    ctlCrumbTrail.Visible = True
                End If
                If WfProjectID <> "" Then
                    'ctlWfTaskListing.Visible = False
                    ctlGoToNavigation = GetNewCoreControl("cHorizNavCtl")
                    ctlGoToNavigation.NavKey = "GoToWorkflowBuilder"
                    WorkflowBuilderTabPlaceHolder.Controls.Add(ctlGoToNavigation)
                    ctlWfProgramListing.Visible = False
                    
                    Select PageKey
						Case "EligibilityWorkflow", "ApplicationWorkflow", "ReviewWorkflow", "GranteeReportingWorkflow", "GrantTaskWorkflow"
							ctlWorkflowMain.Visible = True
							ctlFundingOppCycleInfo.Visible = True
						Case "WorkflowValidation"
							ctlWorkflowValidation.Visible = True
							ctlFundingOppCycleInfo.Visible = True
						Case Else
							ctlFundingOppCycleInfo.Visible = True
					End Select
                    
                    If WfTaskID = "" Then
						ctlCrumbTrail.CrumbTrail = CType(CType(Page, cModulePage).ModuleUser, cWebUser).CrumbTrail
						If PageKey = "WorkflowValidation" Then
							ctlCrumbTrail.CrumbTrail.Validate("Validation", "", "Validation", Request.Url.AbsoluteUri)
						Else
							ctlCrumbTrail.CrumbTrail.Validate("Tasks", "", "Workflow Builder", Request.Url.AbsoluteUri)
						End If
                        ctlCrumbTrail.Visible = True
                    End If
                    If WfTaskID <> "" Then
						ctlWfTaskOutcomeListing.Visible = True
						'ctlWfTaskListing.Visible = False
						ctlCrumbTrail.CrumbTrail = CType(CType(Page, cModulePage).ModuleUser, cWebUser).CrumbTrail
                            ctlCrumbTrail.CrumbTrail.Validate("Assignments", "", "Task Outcomes", Request.Url.AbsoluteUri)
                        ctlCrumbTrail.Visible = True
                    End If
                End If
            End If
        End If

		spnHistoryLabel.Visible = ctlCrumbTrail.Visible

        MyBase.CoreCtl_Load(sender, e)

    End Sub

'=============================================================

    Public Sub ProjectsContent_ViewCompetitionsForPrograms(ByVal aProgramID As String)
        Dim aNewURL As String

        aNewURL = CType(CorePage, cModulePage).PageURL
        aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "ProgramID", aProgramID)
        Response.Redirect(aNewURL)
    End Sub

'-------------------------------------------------------------

    Public Sub ProjectsContent_ViewProjectForProgram(ByVal aCompetitionID As String)
        Dim aNewURL As String

        aNewURL = CType(CorePage, cModulePage).PageURL
        aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "ProgramID", ProgramID)
        aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "CompetitionID", aCompetitionID)
        Response.Redirect(aNewURL)
    End Sub

'-------------------------------------------------------------

    Public Sub ProjectsContent_ViewTasksForProject(ByVal aWfProjectID As String)
        Dim aNewURL As String

        aNewURL = CType(CorePage, cModulePage).PageURL
        aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "Page", "EligibilityWorkflow")
        aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "ProgramID", ProgramID)
        aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "CompetitionID", CompetitionID)
        aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "WfProjectID", aWfProjectID)
        'redirect the user to the Eligibility Workflow tab by default
        aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "TaskTypeID", "5")
        Response.Redirect(aNewURL)
    End Sub

'-------------------------------------------------------------

	Public Sub ProjectsContent_ViewOutcomesForTask(ByVal aWfTaskID As String)
		Dim aNewURL As String

		aNewURL = CType(CorePage, cModulePage).PageURL
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "ProgramID", ProgramID)
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "CompetitionID", CompetitionID)
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "WfProjectID", WfProjectID)
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "WfTaskID", aWfTaskID)
		Response.Redirect(aNewURL)
	End Sub
'-------------------------------------------------------------

    Public Overloads Sub EventController_Delete(ByVal aDataObjectNode As XmlNode)
        Dim aProgramID As Integer
        aProgramID = cXMLDoc.AttributeToInt(aDataObjectNode, "Value", 0)
        MyBase.EventController_Delete(aDataObjectNode)
        CorePage.Redirect()
	End Sub
	
'-------------------------------------------------------------
	
	Public Sub NavigateToWorkFlowBuilderEditor(ByVal aPageKey As String, ByVal aWfProjectTaskOutcomeID As String, ByVal aNextWfProjectTaskID As String, ByVal aReturnURL As String, ByVal aTaskTypeID As String)
		Dim aNewURL As String
		aNewURL = CType(CorePage, cModulePage).PageURL
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, aPageKey)
        aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "ProgramID", ProgramID)
        aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "CompetitionID", CompetitionID)
        aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "WfProjectID", WfProjectID)
	    aNewURL = cWebLib.AddQuerystringParameter(aNewURL, aWfProjectTaskOutcomeID)
	    aNewURL = cWebLib.AddQuerystringParameter(aNewURL, aNextWfProjectTaskID)
	    aNewURL = cWebLib.AddQuerystringParameter(aNewURL, aTaskTypeID)
        aNewURL = cWebLib.AddQuerystringParameter(aNewURL, aReturnURL, Server)
        Response.Redirect(aNewURL)
	End Sub
	
'=============================================================
End Class

End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
