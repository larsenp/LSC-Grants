Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Workflow
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cToDoList_Awardees
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================
        Protected ctlNewWindowOpener As cNewWindowOpener
        Protected spnMyGrants As HtmlGenericControl
        Protected trGrants As HtmlTableRow

        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)
            If Request.QueryString("Page") = "Home" Then
                spnMyGrants.Visible = True
                trGrants.Visible = True
            Else
                spnMyGrants.Visible = False
                trGrants.Visible = False
            End If
        End Sub

	Public Sub ViewAppPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String
		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
'========================================================================

End Class
End Namespace