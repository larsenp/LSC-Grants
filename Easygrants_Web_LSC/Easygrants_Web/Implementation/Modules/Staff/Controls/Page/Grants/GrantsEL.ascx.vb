Imports Core.Web
Imports Core.Web.Modules
Imports Core.Web.User
Imports Core.Web.Navigation.CrumbTrail

Namespace Implementation.Modules.Staff.Controls.Page.Grants

Public MustInherit Class cGrantsEL
    Inherits Core_Web.Controls.Base.cFilterListDataPresenterCtl

'=============================================================

	'Protected WithEvents ctlCrumbTrail As cCrumbTrailDisplay
	Protected tbSearchParameters As HtmlTable
	Protected spnShow As HtmlGenericControl
	Protected spnHide As HtmlGenericControl
	Protected spnShowLink As HtmlGenericControl
        Protected WithEvents CUserCtlLoader1 As Core.Web.SvrCtls.cUserCtlLoader
        Protected WithEvents ctlCrumbTrail As Core.Web.Navigation.CrumbTrail.cCrumbTrailDisplay
        Protected WithEvents spnLastName As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnFirstName As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnMiddleName As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnOrg As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnInstitutionalComponent As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnEmail As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnGrantNumber As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnProgram As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnCompetition As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnProject As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnTask As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnGrantsStatus As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnFind As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnClear As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnGrantList As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected spnHideLink As HtmlGenericControl

''=============================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)
'        ctlCrumbTrail.CrumbTrail = CType(CType(Page, cModulePage).ModuleUser, cWebUser).CrumbTrail
'        ctlCrumbTrail.CrumbTrail.Validate_Root("Contacts", "", "Contacts", Request.Url.AbsoluteUri)
'        ctlCrumbTrail.Visible = True

    '    If Request.QueryString("Find") = "True" Then
    '        'btnShow = CType(FindControl("btnShow"), cButton)
    '        spnShow.Visible = False
    '        spnHide.Visible = True
            
    '        If Request.QueryString("ShowParams") <> "True" Then
				'spnShow.Visible = True
				'spnHide.Visible = False
				'tbSearchParameters.Visible = False
    '        end if
    '    Else
    '        spnShow.Visible = False
    '        spnHide.Visible = True
    '    End If
    
		If Request.QueryString("Find") = "True" Then
            'btnShow = CType(FindControl("btnShow"), cButton)
            spnShow.Visible = False
            spnShowLink.Visible = False
            spnHide.Visible = True
            spnHideLink.Visible = True
            If Request.QueryString("ShowParams") <> "True" Then
                spnShow.Visible = True
                spnShowLink.Visible = True
                spnHide.Visible = False
                spnHideLink.Visible = False
                tbSearchParameters.Visible = False
            End If
        Else
            spnShow.Visible = False
            spnShowLink.Visible = False
            spnHide.Visible = True
            spnHideLink.Visible = True
        End If

		If Request.QueryString("Task") = "No" Then
			Response.Write("<script language='JavaScript'>"+chr(13)+chr(10))
			Response.Write("alert('There is no project task for this record.');"+chr(13)+chr(10))
			Response.Write("</script>")
			spnShow.Visible = True
			spnHide.Visible = False
			tbSearchParameters.Visible = False
		End If
		
   End Sub

        '-------------------------------------------------------------------------

        Public Sub ShowSearchParameters()
            'tbSearchParameters.Visible = True
            Dim aURL As String = cWebLib.AddQuerystringParameter(Request.RawUrl().ToString(), "ShowParams", "True")
			aURL = cWebLib.RemoveQuerystringParameter(aURL, "Task")
            Response.Redirect(aURL)
        End Sub
        
'-------------------------------------------------------------------------

        Public Sub HideSearchParameters()
            Dim aURL As String = cWebLib.AddQuerystringParameter(Request.Url().ToString(), "ShowParams", "False")
			aURL = cWebLib.RemoveQuerystringParameter(aURL, "Task")
            Response.Redirect(aURL)
        End Sub
   
'=============================================================

        Private Sub InitializeComponent()

        End Sub
    End Class 'cStageDetail
End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
