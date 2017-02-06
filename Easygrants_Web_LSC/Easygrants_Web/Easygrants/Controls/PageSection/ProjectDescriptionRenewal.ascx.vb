Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports System.Xml
Imports Core.Web.User
Imports Easygrants_Web.Controls
Imports Easygrants_Web.Controls.PageSection
Imports System.Diagnostics
Imports System.Web.UI
Imports Core.Web.SvrCtls

Namespace Easygrants_Web.Controls.PageSection
	Public MustInherit Class cProjectDescriptionRenewal

		Inherits Core_Web.Controls.Base.cDataPresenterCtl

'============================================================= 

		Protected ctlProjectDescription As cUpload

'============================================================= 

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)

			ctlProjectDescription = CType(FindControl("ctlProjectDescription"), cUpload)

			ctlProjectDescription.Anchor = "aProjectDescription"

			If request.QueryString("Anchor") <> "" Then
				Dim aURL As String = Request.RawUrl.ToString()
				aURL = Core.Web.cWebLib.RemoveQuerystringParameter(aURL, "Anchor")
				response.Redirect(aURL + "#" + request.QueryString("Anchor"))
			End If

		End Sub

  '======================================================

	End Class
End Namespace