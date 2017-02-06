Imports Core.Web
Imports Core.Web.Modules
Imports Core.Web.User
Imports Core.Web.Navigation.CrumbTrail
Imports Core_Web.Controls.Base
Namespace Implementation.Modules.Staff.Controls.Page.Grants

    Public MustInherit Class cAdvancedGrantsEL
        Inherits Core_Web.Controls.Base.cFilterListDataPresenterCtl
        '=============================================================

        'Protected WithEvents ctlCrumbTrail As cCrumbTrailDisplay
        ''=============================================================
		Protected WithEvents spnShow As Global.System.Web.UI.HtmlControls.HtmlGenericControl
		Protected WithEvents spnShowLink As Global.System.Web.UI.HtmlControls.HtmlGenericControl
		Protected WithEvents spnHide As Global.System.Web.UI.HtmlControls.HtmlGenericControl
		Protected WithEvents spnHideLink As Global.System.Web.UI.HtmlControls.HtmlGenericControl
		Protected WithEvents tbSearchParameters As Global.System.Web.UI.HtmlControls.HtmlTable

        Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
            MyBase.CoreCtl_Load(sender, e)

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
                Response.Write("<script language='JavaScript'>" + Chr(13) + Chr(10))
                Response.Write("alert('There is no project task for this record.');" + Chr(13) + Chr(10))
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
		

    End Class 'cStageDetail
End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
