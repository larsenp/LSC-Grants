Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
    Public MustInherit Class cImportEditor
        Inherits Core_Web.Controls.Base.cDataPresenterCtl
        '=============================================================

        Protected ctlImportType As cDropDown
        Protected ctlImportFile As cImport
        Protected spnErrorMessage as HtmlGenericControl
        Protected trErrorMessage as HtmlTableRow

        '=============================================================

        Public ReadOnly Property ImportTypeID() As String
            Get
                If Not Request.QueryString("ImportTypeID") Is Nothing Then
                    Return Request.QueryString("ImportTypeID")
                Else
                    Return "-1"
                End If
            End Get
        End Property

        '=============================================================

        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)
            spnErrorMessage = CType(Me.FindControl("spnErrorMessage"), HtmlGenericControl)
            spnErrorMessage.Visible = False
            ctlImportType = CType(Me.FindControl("ctlImportType"), cDropDown)
            If ImportTypeID > "0" Then
                ctlImportType.SelectedField = ImportTypeID
                ctlImportFile = CType(Me.FindControl("ctlImportFile"), cImport)
                ctlImportFile.ImportTypeID = ImportTypeID
            Elseif ImportTypeID = "0" AndAlso Page.IsPostBack
                'if aValue = "" then
                    spnErrorMessage.Visible = True
                'End If
            End If
        End Sub

        '=============================================================

        Public Sub ChangeImportType(ByVal aValue As String)
            Dim aURL As String
            aURL = Request.RawUrl.ToString()
            aURL = cWebLib.AddQuerystringParameter(aURL, "ImportTypeID", aValue)
            Response.Redirect(aURL)
        End Sub

        '=============================================================

        'Public Sub DoImport(ByVal aValue As String)
        '    Dim aURL As String
        '    ctlImportType = CType(Me.FindControl("ctlImportType"), cDropDown)
        '    ctlImportFile = CType(Me.FindControl("ctlImportFile"), cImport)
        '    if aValue = "" then
        '        spnErrorMessage.Visible = True
        '        CorePage.Redirect()
        '    End If
        'End Sub

        '=============================================================



    End Class
End Namespace