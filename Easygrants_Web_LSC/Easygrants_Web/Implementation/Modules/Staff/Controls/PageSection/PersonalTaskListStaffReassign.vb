Imports System.Xml
Imports Core.Web.Modules
Imports Core.Web.User
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Correspondence
Imports EasyGrants.Web


Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
    Public MustInherit Class cPersonalTaskListStaffReassign
        Inherits Core_Web.Controls.Base.cDataPresenterCtl

        Protected ctlPer As cPopUpSelectorLauncher2

        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)

            'Put user code to initialize the page here
        End Sub

        Public Sub ContinueToEmail(ByVal aPersonID As String, ByVal aWfTaskAssignment As String, ByVal aGranteeProjectID As String)
            Dim aEmailMessageDO As cDataObject
            aEmailMessageDO = CType(DataObjectCollection("EmailMessage"), cDataObjectList)(0)
            ctlPer = CType(Me.FindControl("ctlPer"), cPopUpSelectorLauncher2)
            If (Request.QueryString("PersonID") <> ctlPer.ObjID) Then
                If Not aEmailMessageDO Is Nothing Then
                    WebSession.DataObjectFactory.DeleteData(aEmailMessageDO)
                End If
            End If
            dim aURL as String = Request.Url.PathAndQuery
            dim aStartIndex as Integer
            aStartIndex = aURL.IndexOf("PersonID")
            if aStartIndex <> -1 then
                    aURL = cWebLib.RemoveQuerystringParameter(aURL, "PersonID")
            End If
            EventController_NavigateToModulePageKey("ReassignmentNotify", "PersonID=" + aPersonID, "WfTaskAssignmentID=" + aWfTaskAssignment, "GranteeProjectID=" + aGranteeProjectID, "ReturnURL=" + aURL + "&PersonID=" + aPersonID, "ReturnPageKey=" + CType(WebSession.CurrentPage, cModulePage).PageKey)
        End Sub

    End Class
End Namespace

