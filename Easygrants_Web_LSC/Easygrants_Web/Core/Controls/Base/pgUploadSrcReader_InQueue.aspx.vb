Namespace Core_Web.Controls.Base
Public Class pgUploadSrcReader_InQueue
	Inherits Core.Web.cCorePage

'=============================================================

	'Protected spnStyles As HtmlGenericControl

'=============================================================

	Public ReadOnly Property QueryStringParameters() As String
		Get
			If Request.Url.ToString.Contains("?") Then
				Return Request.Url.ToString.Split("?")(1)
			Else
				Return ""
			End If
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
