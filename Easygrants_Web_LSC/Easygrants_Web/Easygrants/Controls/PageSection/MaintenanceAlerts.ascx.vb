Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cMaintenanceAlerts
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'=============================================================

	Protected ctlShow As cNewWindowOpener

'=============================================================

	Public Sub OnPreview()
		Dim BaseQueryString As String
		BaseQueryString = WebAppl.Build_RootURL("Easygrants/Controls/PageSection/pgMaintenanceAlertPreview.aspx")
		ctlShow.NewWindowURL = BaseQueryString
		ctlShow.Open()				        
	End Sub

'=============================================================

End Class
End Namespace