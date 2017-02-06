Imports Core.Web.SvrCtls

Namespace Implementation.Modules.Staff.Controls.Page.Contacts
Public MustInherit Class cGrantProjectActivity
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
'================================================

	Protected uclPersonLinks As cUserCtlLoader
	Protected uclOrgLinks As cUserCtlLoader
	Protected uclPersonSum As cUserCtlLoader
	Protected uclOrgSum As cUserCtlLoader
	
'================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		Dim aOrigin As String = "GranteeProject"
		
		If Not Request.QueryString("Origin") Is Nothing Then
			aOrigin = Request.QueryString("Origin")
		End If
		
		Select Case aOrigin
			Case "GranteeProject"
			Case "Person"
				uclOrgLinks.Visible = False
				uclOrgSum.Visible = False
			Case "Organization"
				uclPersonLinks.Visible = False
				uclPersonSum.Visible = False
            End Select

            If Not Request.QueryString("OrganizationID") Is Nothing Then
                uclPersonLinks.Visible = False
                uclPersonSum.Visible = False
            End If

	End Sub
	
'================================================

End Class
End Namespace