Namespace Core_Web.Controls.Base
Public Class pgUploadReader_InQueue
    Inherits Core.Web.cCorePage

'=============================================================

	'Protected spnStyles As HtmlGenericControl

'=============================================================

    Public ReadOnly Property SubmittedFileID() As String
        Get
            SubmittedFileID = Request.QueryString("SubmittedFileID")
        End Get
    End Property

'=============================================================

    Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		'Set Href property for technical support link

		'CorePage_LoadStyles(spnStyles)
    End Sub

'=============================================================

End Class
End Namespace
