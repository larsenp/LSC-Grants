Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web

Namespace Implementation.Modules.Application.Controls.Page
Public MustInherit Class cMatchingContributionsBase
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================
	Protected ctlDataList As cDataListCtl
	Protected spnTotal As HtmlGenericControl
	Protected spnlblTotal As HtmlGenericControl

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
			MyBase.CoreCtl_Load(sender, e)
	End Sub
	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		Dim aMatchingContributionList As cDataObjectList
		Dim aDO As cDataObject
		Dim aAmount As Decimal
		Dim aTotal As Decimal
		aMatchingContributionList = CType(DataObjectCollection("GranteeProjectMatchingContributionList"), cDataObjectList)
		If aMatchingContributionList.Count > 0 Then
			spnlblTotal.Visible = True
			spnTotal.Visible = True
			For Each aDO In aMatchingContributionList
				aAmount = aDO.GetPropertyDecimal("ContributionAmount")
				aTotal = aTotal + aAmount
			Next
			spnTotal.InnerHtml = "$" + Convert.ToDecimal(aTotal).ToString("#,##0")
		End If
	End Sub

End Class
End Namespace
