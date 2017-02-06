Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web

Namespace Easygrants_Web.Controls.PageSection
Public Class cContact_Crspndnc
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	Protected trLoggedEmailsMessage As HtmlTableRow
'============================================================= 
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		Dim aEmailList As cDataObjectList
		MyBase.CoreCtl_Load(aSrc, aEvent)
		aEmailList = CType(Me.DataObjectCollection("EmailLogList"), cDataObjectList)
		If aEmailList.Count < 1 Then
			trLoggedEmailsMessage.Visible = False
		End If
	End Sub



'=============================================================
End Class
End Namespace
