Imports System.Diagnostics
Imports Core.DataAccess
Imports EasyGrants.Web.Modules
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web

Namespace Implementation.Modules.ReviewReport.Controls.Page
Public MustInherit Class cResubmitReport_Content
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=================================================
		Protected valReopenCBList As CustomValidator
		Protected spnName as HtmlGenericControl
		Protected spnEmail as HtmlGenericControl
'=================================================
		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
		End Sub
'----------------------------------------------------
		Public Sub ValidateReopenCBList(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
			aArgs.IsValid = True
			Dim ctlReopen As cCheckBoxList = GetControl("ctlReopen")
			Dim aCBValues As String = ctlReopen.RetrieveRows
			If aCBValues Is Nothing Then
				valReopenCBList.ErrorMessage = "You must select at least one requirement for resubmission."
				aArgs.IsValid = False
				Exit Sub
			End If
		End Sub
        '=================================================

        Public Sub Invite()
            Dim aGranteeProjectDO As cDataObject
            Dim aReportWfTaskAssignmentDO As cDataObject = DataObjectCollection("ReportWfta")(0)

            aGranteeProjectDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", CType(CType(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID)
            aReportWfTaskAssignmentDO("PersonID") = aGranteeProjectDO.GetRelatedPropertyString("PrimaryPersonID")
            WebSession.DataObjectFactory.SaveDataObject(aReportWfTaskAssignmentDO)

            EventController_NavigateToModulePageKey("ResubmitEmail", "ReturnURL=" + Request.Url.PathAndQuery, "ReturnPageKey=" + CType(WebSession.CurrentPage, cModulePage).PageKey)
        End Sub

End Class
End Namespace
