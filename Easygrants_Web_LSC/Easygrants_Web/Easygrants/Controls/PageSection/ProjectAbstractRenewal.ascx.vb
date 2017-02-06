Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web
Imports System.Text
Imports Core.Web.SvrCtls

Namespace Easygrants_Web.Controls.PageSection
	Public MustInherit Class cProjectAbstractRenewal
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================

		Protected mSvButton As String
		Protected trSaveAndCancel As HtmlTableRow

'=============================================================

		Public Property SvButton() As String
			Get
				Return mSvButton
			End Get
			Set(ByVal Value As String)
				mSvButton = Value
			End Set
		End Property

'=============================================================

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)

			If SvButton = "NoShow" Then
				trSaveAndCancel.Visible = False
			End If
		End Sub

'=============================================================

	End Class
End Namespace
