Namespace Core_Web.Controls.Base

Public MustInherit Class cdbgWorksheet
	Inherits Core.Web.cdbgCtl
'=============================================================

	Protected tblWorksheet As HtmlTable

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		If MyBase.WebSession.HasStaffUser Then
			tblWorksheet.Visible = True
		End If
	End Sub

'=============================================================
End Class

End Namespace 'Core_Web.Controls.Base
