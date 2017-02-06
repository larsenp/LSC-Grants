Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports EasyGrants.Correspondence
Imports System.Xml
Imports Core.Web.User
Imports Core.Web.Navigation.CrumbTrail

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Grants

    Public MustInherit Class cProgressReportEL_LSC
        Inherits Easygrants_Web.Modules.Staff.Controls.Page.Grants.cProgressReportEL

        Public Overridable Sub LSC_EventController_NavigateToURL_NewWindowOpener(ByVal aURL As String)
            Dim ctlNewWindowOpener As cNewWindowOpener
            ctlNewWindowOpener = Me.FindControl("ctlNewWindowOpener")
            ctlNewWindowOpener.NewWindowURL = aURL
            ctlNewWindowOpener.Open()

        End Sub

        Public Overridable Sub LSC_EventController_NavigateFromModulePageKey_NewWindowOpener(ByVal aPageKey As String, ByVal aQuery1 As String)
            Dim aURL As String
            Dim aQueries() As String
            aQueries = New String() {aQuery1}
            aURL = BuildURLFromPageAndQueries(aPageKey, aQueries)
            LSC_EventController_NavigateToURL_NewWindowOpener(aURL)
        End Sub

        Public Overridable Sub LSC_EventController_NavigateFromModulePageKey_NewWindowOpener(ByVal aPageKey As String, ByVal aQuery1 As String, ByVal aQuery2 As String)
            Dim aURL As String
            Dim aQueries() As String
            aQueries = New String() {aQuery1, aQuery2}
            aURL = BuildURLFromPageAndQueries(aPageKey, aQueries)
            LSC_EventController_NavigateToURL_NewWindowOpener(aURL)
        End Sub

        Public Overridable Sub LSC_EventController_NavigateFromModulePageKey_NewWindowOpener(ByVal aPageKey As String, ByVal aQuery1 As String, ByVal aQuery2 As String, ByVal aQuery3 As String)
            Dim aURL As String
            Dim aQueries() As String
            aQueries = New String() {aQuery1, aQuery2, aQuery3}
            aURL = BuildURLFromPageAndQueries(aPageKey, aQueries)
            LSC_EventController_NavigateToURL_NewWindowOpener(aURL)
        End Sub

        Public Overridable Sub LSC_EventController_NavigateFromModulePageKey_NewWindowOpener(ByVal aPageKey As String, ByVal aQuery1 As String, ByVal aQuery2 As String, ByVal aQuery3 As String, ByVal aQuery4 As String)
            Dim aURL As String
            Dim aQueries() As String
            aQueries = New String() {aQuery1, aQuery2, aQuery3, aQuery4}
            aURL = BuildURLFromPageAndQueries(aPageKey, aQueries)
            LSC_EventController_NavigateToURL_NewWindowOpener(aURL)
        End Sub


        Public Overridable Function BuildURLFromPageAndQueries(ByVal aPageKey As String, ByVal aQueries() As String)
            Dim aURL As String
            Dim i As Integer

            'Method can accept aPageKey as stand-alone page key ("GrantEditor") or as name-value pair ("Page=GrantEditor")
            If aPageKey.Substring(0, 5) = "Page=" Then
                aPageKey = aPageKey.Substring(5)
            End If
            aURL = Request.Url.ToString().Substring(0, Request.Url.ToString().IndexOf("?"))
            aURL = cWebLib.AddQuerystringParameter(aURL, "Config", Request.QueryString("Config"))
            aURL = cWebLib.AddQuerystringParameter(aURL, "Page", aPageKey)
            If Not aQueries Is Nothing Then
                For i = 0 To aQueries.Length - 1
                    aURL = cWebLib.AddQuerystringParameter(aURL, aQueries(i), Server)
                Next
            End If
            Return aURL
        End Function

        Public Sub Submit_UnSubmit(ByVal awftaID As String)
            'Get the Wf_task_assignment_id data object 
            Dim awftado As cDataObject

            awftado = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", CType(awftaID, Integer)) ' .ToString / request a row from the data object
            'awftado = Convert.ToString(awftaID)

            'Chcek the status
            Dim aNewStatusId As Integer
            Dim aNewOutcome As String

            Select Case awftado.GetPropertyInt("WfTaskStatusID")
                Case 1 'Incomplete
                    aNewStatusId = 2
                    aNewOutcome = "SUBMITTED"
                Case 2 'Complete
                    aNewStatusId = 1
                    aNewOutcome = "IN PROC"
                Case 3 'Inactive
                    Exit Sub

            End Select


            'Determine new wf_task_outcome_id 
            Dim aNewOutcomeDO As cDataObject

            aNewOutcomeDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskOutcome", "WfTaskOutcome_Abbr", aNewOutcome, "WfTaskID", awftado.GetPropertyInt("WfTaskID"))(0)

            'Update Data object and save
            awftado("WfTaskStatusID") = aNewStatusId
            awftado("WfTaskOutcomeID") = aNewOutcomeDO.GetPropertyInt("WfTaskOutcomeID")
            awftado.SaveData()

            'Reload page to display updated data
            CorePage.Redirect()

        End Sub
       
    End Class
End Namespace

