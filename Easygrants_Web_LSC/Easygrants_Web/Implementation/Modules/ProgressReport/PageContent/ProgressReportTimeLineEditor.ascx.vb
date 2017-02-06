Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.ProgressReport.PageContent
	Public MustInherit Class cProgressReportTimeLineEditor
		Inherits Easygrants_Web.Controls.Base.cEGDataPresenterCtl

'=============================================================

	Protected ctlTargetDate As cDateTextBox
	Protected spnTargetDateView As HtmlGenericControl
	
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		ctlTargetDate = FindControl("ctlTargetDate")
		If Request.QueryString("ProjectTimelineID") = "0" Then
			ctlTargetDate.Visible = True
			spnTargetDateView.Visible = False
		Else
			ctlTargetDate.Visible = False
			spnTargetDateView.Visible = True
		End If
	End Sub


'=============================================================

	End Class
End Namespace
