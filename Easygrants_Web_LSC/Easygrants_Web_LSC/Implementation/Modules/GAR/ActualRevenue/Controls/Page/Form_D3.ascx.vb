Imports System.Xml
Imports System.Web.UI.HtmlControls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.DataAccess.Budget
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User

Namespace Implementation.Modules.GAR.ActualRevenue.Controls.PageSection
Public Class cForm_D3
	Inherits Implementation.Controls.PageSection.cLSCBudgetEditor

Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
	Me.DisplayFundCode = True
	MyBase.CoreCtl_Load(aSrc, aEvent)
End Sub

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

Public Overrides Sub AddControlToDataCollectionRow(ByVal aTR As HtmlTableRow, ByVal aBudgetItem As cBudgetItem, _
					ByVal aBudgetCategory As cDataObject, ByVal aIndent As Integer)
	'If the current budget item is the LSC award amount, write the value as read-only.
	Dim aWfTaskID As Integer = Me.mWfTaskAssignment.GetPropertyInt("WfTaskID")
	If (aWfTaskID = 9 Or aWfTaskID = 79) AndAlso aBudgetCategory.GetPropertyInt("LscFundCode") = 10 Then
		WriteAwardAmountControl(aTR, aBudgetItem, aBudgetCategory, aIndent, aWfTaskID)
	Else 'normal budget item
		MyBase.AddControlToDataCollectionRow(aTR, aBudgetItem, aBudgetCategory, aIndent)
	End If
End Sub

Public Sub WriteAwardAmountControl(ByVal aTR As HtmlTableRow, ByVal aBudgetItem As cBudgetItem, _
					ByVal aBudgetCategory As cDataObject, ByVal aIndent As Integer, ByVal aWfTaskID As Integer)

	Dim aTD As HtmlTableCell
	Dim aRightMost As Integer
	Dim aID As String
	Dim aAmount As Integer

	If aBudgetItem Is Nothing OrElse aBudgetItem.IsNewDataObject Then
		Dim aAwardList As cDataObjectList = Me.DataObjectCollection("LscWfTAAwardAmount")
		If aAwardList.Count > 0 Then
			aAmount = aAwardList(0).GetPropertyInt("AwardAmount", -1)
			If aWfTaskID = 79 Then
				aAmount = aAmount / 2
			End If
		End If
	Else
		aAmount = aBudgetItem.GetPropertyInt("Amount", -1)
	End If
	aID = aBudgetCategory.GetPropertyString("BudgetCategoryID") + "Amount"
	aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
	aTD.ID = aID
	aRightMost = aIndent + 1
	If aAmount >= 0 Then
		aTD.InnerText = String.Format("{0:$#,0}", aAmount)
		If Not aBudgetItem Is Nothing Then
			aBudgetItem("Amount") = aAmount
		End If
	End If
	aTD.Align = "right"

End Sub

Public Overrides Sub SetBudgetItemValuesFromControls(ByVal aBudgetItem As cBudgetItem)
	'If this is the LSC award budget item, do nothing (value has already been set).
	Dim aWfTaskID As Integer = Me.mWfTaskAssignment.GetPropertyInt("WfTaskID")
	If (aWfTaskID <> 9 And aWfTaskID <> 79) OrElse aBudgetItem.GetRelatedPropertyInt("BudgetCategory.LscFundCode") <> 10 Then
		MyBase.SetBudgetItemValuesFromControls(aBudgetItem)
	Else
		Dim aCtlID As String = aBudgetItem.GetPropertyString("BudgetCategoryID") + "Amount"
		Dim aTD As HtmlTableCell = CType(Me.FindControl(aCtlID), HtmlTableCell)
		If aTD.InnerText = "" Then
			aBudgetItem("Amount") = 0
		Else
			Dim aAmount As String = aTD.InnerText
			aAmount = aAmount.Replace("$", "")
			aAmount = aAmount.Replace(",", "")
			aBudgetItem("Amount") = Int32.Parse(aAmount)
		End If
	End If
End Sub


End Class
End Namespace