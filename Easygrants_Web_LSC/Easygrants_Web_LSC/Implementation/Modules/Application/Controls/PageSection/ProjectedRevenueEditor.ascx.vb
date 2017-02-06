Imports System.Xml
Imports System.Web.UI.HtmlControls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.DataAccess.Budget
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User

Namespace Implementation.Modules.Application.Controls.PageSection
Public Class cProjectedRevenueEditor
	Inherits Implementation.Controls.PageSection.cLSCBudgetEditor

Public Overrides Sub BuildHeaderRow()
	Dim aHeadingTR As New HtmlTableRow()
	Dim aBlankTR As New HtmlTableRow()
	Dim aTD As HtmlTableCell
	Dim aTD1 As New HtmlTableCell()
	Dim aTD2 As New HtmlTableCell()
	Dim aTD3 As New HtmlTableCell()
	Dim aTD4 As New HtmlTableCell()

	aTD1.InnerHtml = "&nbsp;"
	aTD1.Width = "35%"
	aTD1.BgColor = "DDDDDD"

	aTD2.InnerHtml = "<b>Fund Codes</b>"
	aTD2.Align = "Right"
	aTD2.Width = "20%"
	aTD2.BgColor = "DDDDDD"

	aTD3.InnerHtml = "<b>Amount</b>"
	aTD3.Align = "Right"
	aTD3.Width = "15%"
	aTD3.BgColor = "DDDDDD"
	mAmountColumn = 3	'Total and subtotal amounts are displayed in the third cell of the column.

	aTD4.InnerHtml = "&nbsp;"

	aHeadingTR.Cells.Add(aTD1)
	aHeadingTR.Cells.Add(aTD2)
	aHeadingTR.Cells.Add(aTD3)
	aHeadingTR.Cells.Add(aTD4)

	aTD = New HtmlTableCell
	aTD.InnerHtml = "&nbsp;"
	aBlankTR.Cells.Add(aTD)

	tblBudgetItems.Rows.Add(aHeadingTR)
	tblBudgetItems.Rows.Add(aBlankTR)

End Sub



End Class
End Namespace

