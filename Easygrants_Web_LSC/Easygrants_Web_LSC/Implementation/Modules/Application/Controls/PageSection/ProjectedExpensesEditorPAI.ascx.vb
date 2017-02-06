Imports System.Web.UI.HtmlControls
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Implementation.Modules.Application.Controls.PageSection

Public Class cProjectedExpensesEditorPAI
	Inherits Implementation.Modules.Application.Controls.PageSection.cProjectedExpensesEditor

Public Overrides Sub BuildHeaderRow()
	Dim aHeadingTR As New HtmlTableRow()
	Dim aBlankTR As New HtmlTableRow()
	Dim aTD As HtmlTableCell
	Dim aTD1 As New HtmlTableCell()
	Dim aTD2 As New HtmlTableCell()
	Dim aTD3 As New HtmlTableCell()
	Dim aTD4 As New HtmlTableCell()
	Dim aTD5 As New HtmlTableCell()

	aTD1.InnerHtml = "&nbsp;"
	aTD1.Width = "35%"
	aTD1.BgColor = "DDDDDD"

	aTD2.InnerHtml = "<b>LSC Expenditures</b>"
	aTD2.Align = "Right"
	aTD2.Width = "25%"
	aTD2.BgColor = "DDDDDD"
	mAmountColumn = 2	'Total and subtotal amounts are displayed in the second cell of the column.

	aTD3.InnerHtml = "<b>Non-LSC Expenditures"
	aTD3.Align = "Right"
	aTD3.Width = "25%"
	aTD3.BgColor = "DDDDDD"

	aTD4.InnerHtml = "<b>Total</b>"
	aTD4.Align = "Right"
	aTD4.Width = "15%"
	aTD4.BgColor = "DDDDDD"

	aTD5.InnerHtml = "&nbsp;"
	aTD5.BgColor = "DDDDDD"

	aHeadingTR.Cells.Add(aTD1)
	aHeadingTR.Cells.Add(aTD2)
	aHeadingTR.Cells.Add(aTD3)
	aHeadingTR.Cells.Add(aTD4)
	aHeadingTR.Cells.Add(aTD5)

	aTD = New HtmlTableCell
	aTD.InnerHtml = "&nbsp;"
	aBlankTR.Cells.Add(aTD)

	tblBudgetItems.Rows.Add(aHeadingTR)
	tblBudgetItems.Rows.Add(aBlankTR)

End Sub

	Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
		Dim aDOList As cDataObjectList = MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
		If aDataObjectElement.Attributes("Key").Value = "Budget" Or aDataObjectElement.Attributes("Key").Value = "BudgetPeriod" Then
			If aDOList.Count = 0 OrElse aDOList(0).IsNewDataObject Then
				Dim aXmlDoc As cXMLDoc
				Dim aDataObjectNode, aFiltersNode As XmlNode
				aDataObjectNode = Nothing
				aFiltersNode = Nothing
				aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("LscCopyAppBudgetInfo", aDataObjectNode, aFiltersNode)
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "wf_task_assignment_id", CType(CType(Page, cModulePage).ModuleUser, cEGWfTAUser).WfTaskAssignmentID))
				WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
				Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
			End If
		End If
		Return aDOList
	End Function


End Class

End Namespace