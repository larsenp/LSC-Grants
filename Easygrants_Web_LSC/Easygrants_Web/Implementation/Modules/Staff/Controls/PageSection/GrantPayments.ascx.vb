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

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cGrantPayments
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================
	Protected ctlDataList As cDataListCtl
	Protected spnReqTotal As HtmlGenericControl
	Protected spnReqTotalLbl As HtmlGenericControl
	Protected spnPayTotal As HtmlGenericControl
	Protected spnPayTotalLbl As HtmlGenericControl

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
			MyBase.CoreCtl_Load(sender, e)
	End Sub
	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		Dim aPaymentList As cDataObjectList
		Dim aDO As cDataObject
		Dim aPaymentAmount As Decimal
		Dim aReqAmount As Decimal
		Dim aPayTotal As Decimal
		Dim aReqTotal As Decimal
		aPaymentList = CType(DataObjectCollection("PaymentList"), cDataObjectList)
		If aPaymentList.Count > 0 Then
			spnReqTotal.Visible = True
			spnReqTotalLbl.Visible = True
			spnPayTotal.Visible = True
			spnPayTotalLbl.Visible = True
			For Each aDO In aPaymentList
				aPaymentAmount = aDO.GetPropertyDecimal("PaymentAmount")
				aPayTotal = aPayTotal + aPaymentAmount
				aReqAmount = aDO.GetPropertyDecimal("RequestedAmount")
				aReqTotal = aReqTotal + aReqAmount
			Next
			spnPayTotal.InnerHtml = "$" + Convert.ToDecimal(aPayTotal).ToString("#,##0.00")
			spnReqTotal.InnerHtml = "$" + Convert.ToDecimal(aReqTotal).ToString("#,##0.00")
		End If
	End Sub

End Class
End Namespace
