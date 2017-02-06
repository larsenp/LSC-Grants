Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base

Namespace EasyGrants.Controls.Base

Public MustInherit Class cNewGranteeProjectByPerson
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
'================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		Dim ctlNewGranteeProjectInfo As UserControl
		ctlNewGranteeProjectInfo = FindControl("ctlNewGranteeProjectInfo")
		If Request.QueryString("WfProjectID") = "" Then
			ctlNewGranteeProjectInfo.Visible = False
		End If
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

'================================================

End Class
End Namespace