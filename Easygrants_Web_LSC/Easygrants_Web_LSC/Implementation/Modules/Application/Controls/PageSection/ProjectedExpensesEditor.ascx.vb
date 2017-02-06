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
Public Class cProjectedExpensesEditor
	Inherits Implementation.Controls.PageSection.cLSCBudgetEditor

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

	aTD3.InnerHtml = "<b>Non-LSC Expenditures<sup><a name='footref1'/><a href='#footnote1'>1</a></sup></b>"
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

Public Overrides Sub BuildSubtotalRow(ByVal aBudgetCategory As cDataObject, ByVal aIndent As Integer, _
									ByRef aRightMost As Integer)
	Dim aTR As HtmlTableRow
	Dim aValue As Double
	Dim aLscExpense As Double
	Dim aNonLscExpense As Double
	Dim aBudgetItem As cBudgetItem
	Dim aLscBudgetItem As cDataObject
	Dim aTD As HtmlTableCell

	aTR = New HtmlTableRow()
	aValue = 0

	If Not mBudgetPeriod Is Nothing Then 'edit mode
		aBudgetItem = GetBudgetItem(aBudgetCategory)
		aValue = cBudgetItem.Get_Amount(aBudgetItem)
		aLscBudgetItem = aBudgetItem.GetRelatedPropertyDataObject("LscBudgetItem")
		If aLscBudgetItem Is Nothing Then
			aLscExpense = 0
			aNonLscExpense = 0
		Else
			aLscExpense = aLscBudgetItem.GetPropertyDouble("LscExpenditures", 0)
			aNonLscExpense = aLscBudgetItem.GetPropertyDouble("NonLscExpenditures", 0)
		End If
	Else 'add mode 
		aValue = 0
		aLscExpense = 0
		aNonLscExpense = 0
	End If

	aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
	If aBudgetCategory.GetPropertyInt("BudgetCategoryID") <> mTopBudgetCategoryID Then
		aTD.InnerHtml = "<b>" + _
				"Subtotal " + _
				aBudgetCategory.GetPropertyString("Description").Trim() + _
				"</b>"
	Else
		aTD.InnerHtml = "<b>Total</b>"
	End If
	aTD.ColSpan = 1
	Dim aID As String
	aID = aBudgetCategory("BudgetCategoryID").ToString()

	If aIndent + 1 > aRightMost Then aRightMost = aIndent + 1

	'Total LSC
	aTD = Add_CellsToColumn(aTR, mAmountColumn)
	aTD.InnerHtml = "<b>" + String.Format("{0:C}", aLscExpense) + "</b>"
	aTD.Align = "right"

	'Total Non-LSC
	aTD = Add_CellsToColumn(aTR, mAmountColumn + 1)
	aTD.InnerHtml = "<b>" + String.Format("{0:C}", aNonLscExpense) + "</b>"
	aTD.Align = "right"

	'Total LSC + Non-LSC
	aTD = Add_CellsToColumn(aTR, mAmountColumn + 2)
	aTD.InnerHtml = "<b>" + String.Format("{0:C}", aValue) + "</b>"
	aTD.Align = "right"

	tblBudgetItems.Rows.Add(aTR)

	'Add spacer row
	aTR = New HtmlTableRow()
	aTD = New HtmlTableCell
	aTD.InnerHtml = "&nbsp;"
	aTR.Cells.Add(aTD)
	tblBudgetItems.Rows.Add(aTR)

End Sub

Public Overrides Sub BuildDataCollectionRow(ByVal aBudgetCategory As cDataObject, ByVal aIndent As Integer, _
									ByRef aRightMost As Integer)

	Dim aTR As HtmlTableRow
	Dim aBudgetItem As cBudgetItem
	Dim aTD As HtmlTableCell

	aTR = New HtmlTableRow()

	If Not mBudgetPeriod Is Nothing Then 'edit mode
		aBudgetItem = GetBudgetItem(aBudgetCategory)
	End If

	aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
	aTD.InnerHtml = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + aBudgetCategory.GetPropertyString("Description").Trim() + _
			"&nbsp;"
	aTD.ColSpan = 1

	If aIndent + 1 > aRightMost Then aRightMost = aIndent + 1

	'Fund Code
	If Me.DisplayFundCode Then
		aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
		aTD.InnerHtml = aBudgetCategory.GetPropertyString("LscFundCode")
		aTD.Align = "Right"
	End If

	'Text boxes
	AddControlToDataCollectionRow(aTR, aBudgetItem, aBudgetCategory, aIndent, "LscBudgetItem.LscExpenditures", "_LSC", "LSC Expenditures")
	AddControlToDataCollectionRow(aTR, aBudgetItem, aBudgetCategory, aIndent, "LscBudgetItem.NonLscExpenditures", "_NonLSC", "Non-LSC Expenditures")

	'Row total
	aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
	If aBudgetItem Is Nothing Then
		aTD.InnerHtml = "<b>$0.00</b>"
	Else
		aTD.InnerHtml = "<b>" + String.Format("{0:C}", aBudgetItem.GetPropertyInt("Amount", 0)) + "</b>"
	End If
	aTD.Align = "right"

	aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
	aTD.InnerHtml = "&nbsp;"
	tblBudgetItems.Rows.Add(aTR)

End Sub

Public Overrides Sub SetBudgetItemValuesFromControls(ByVal aBudgetItem As cBudgetItem)

	Dim aLscBudgetItemList As cDataObjectList
	Dim aLscBudgetItem As cDataObject

	aLscBudgetItemList = aBudgetItem.GetRelatedPropertyDataObjectList("LscBudgetItem")
	If aLscBudgetItemList.Count = 0 Then
		If aBudgetItem("BudgetItemID") Is System.DBNull.Value Then
			aBudgetItem.SaveData()
		End If
		aLscBudgetItem = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("LscBudgetItem")
		aLscBudgetItem("BudgetItemID") = aBudgetItem.GetPropertyInt("BudgetItemID")
	Else
		aLscBudgetItem = aLscBudgetItemList(0)
	End If

	'LSC Expenditures
	Dim aCtlID1 As String = aBudgetItem.GetPropertyString("BudgetCategoryID") + "_LSC"
	Dim aBox1 As cTextBox = CType(Me.FindControl(aCtlID1), cMoneyTextBox)
	Dim aLscExpenditures As Double
	If aBox1.Value.Trim() = "" Then
		aLscExpenditures = 0
	Else
		aLscExpenditures = aBox1.Value
	End If
	aLscBudgetItem("LscExpenditures") = aLscExpenditures

	'Non-LSC Expenditures
	Dim aCtlID2 As String = aBudgetItem.GetPropertyString("BudgetCategoryID") + "_NonLSC"
	Dim aBox2 As cTextBox = CType(Me.FindControl(aCtlID2), cMoneyTextBox)
	Dim aNonLscExpenditures As Double
	If aBox2.Value.Trim() = "" Then
		aNonLscExpenditures = 0
	Else
		aNonLscExpenditures = aBox2.Value
	End If
	aLscBudgetItem("NonLscExpenditures") = aNonLscExpenditures
	aLscBudgetItem.SaveData()

	'Budget item
	aBudgetItem("Amount") = aLscExpenditures + aNonLscExpenditures

End Sub

Public Overrides Sub DataPresenter_SaveDataObjects()

	mIsRecalculate = False 'Keeps base method from redirecting
	MyBase.DataPresenter_SaveDataObjects()
	UpdateLscBudgetItemParents(mBudgetItemlist)
	'CorePage.Redirect()

End Sub

Public Overloads Sub UpdateLscBudgetItemParents(ByVal aBudgetItemList As ArrayList)

	Dim aHash As New Hashtable
	Dim aBudgetItem As cBudgetItem
	For Each aBudgetItem In aBudgetItemList
		aHash.Add(aBudgetItem.GetPropertyInt("BudgetCategoryID"), aBudgetItem)
	Next
	UpdateLscBudgetItemParents(aHash)

End Sub

Public Overloads Sub UpdateLscBudgetItemParents(ByVal aBudgetItemHash As Hashtable)

	Dim aParentID As Integer
	Dim aParentHash As New Hashtable
	Dim aBudgetItem As cBudgetItem
	Dim aParentBudgetItemList As cDataObjectList
	Dim aParentBudgetItem As cBudgetItem
	Dim aPeriodID As Integer = mBudgetPeriod.GetPropertyInt("BudgetPeriodID")
	Dim aParentLscBudgetItem As cDataObject
	Dim aChildCategoriesList As cDataObjectList
	Dim aChildCategory As cDataObject
	Dim aChildBudgetItemList As cDataObjectList
	Dim aChildBudgetItem As cDataObject
	Dim aChildBudgetItemLscList As cDataObjectList
	Dim aChildBudgetItemLsc As cDataObject
	Dim aLscExpensesTotal As Double = 0
	Dim aNonLscExpensesTotal As Double = 0

	'Create a hashtable of the budget items that are parents to the items passed in in the hashtable
	For Each aBudgetItem In aBudgetItemHash.Values
		aParentID = aBudgetItem.GetRelatedPropertyInt("BudgetCategory.ParentID")
		If Not aParentHash.ContainsKey(aParentID) Then
			aParentBudgetItemList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItem", _
							"BudgetCategoryID", aParentID.ToString, "BudgetPeriodID", aPeriodID.ToString)
			If aParentBudgetItemList.Count > 0 Then
				aParentBudgetItem = aParentBudgetItemList(0)
				aParentHash.Add(aParentBudgetItem.GetPropertyInt("BudgetCategoryID"), aParentBudgetItem)
			End If
		End If
	Next

	For Each aParentBudgetItem In aParentHash.Values
		'Get or create related LscBudgetItem data object
		If aParentBudgetItem.GetRelatedPropertyDataObjectList("LscBudgetItem").Count > 0 Then
			aParentLscBudgetItem = aParentBudgetItem.GetRelatedPropertyDataObject("LscBudgetItem")
		Else
			aParentLscBudgetItem = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("LscBudgetItem")
			aParentLscBudgetItem("BudgetItemID") = aParentBudgetItem.GetPropertyInt("BudgetItemID")
		End If

		'Get child budget items, starting by getting list of child budget categories.
		aChildCategoriesList = aParentBudgetItem.GetRelatedPropertyDataObjectList("BudgetCategory.Children")
		For Each aChildCategory In aChildCategoriesList
			aChildBudgetItemList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItem", _
						"BudgetCategoryID", aChildCategory.GetPropertyString("BudgetCategoryID"), "BudgetPeriodID", aPeriodID.ToString)
			'For each child budget item, get corresponding LscBudget item
			If aChildBudgetItemList.Count > 0 Then
				aChildBudgetItem = aChildBudgetItemList(0)
				aChildBudgetItemLscList = aChildBudgetItem.GetRelatedPropertyDataObjectList("LscBudgetItem")
				If aChildBudgetItemLscList.Count > 0 Then
					'Add up LSC expenses and non-LSC expenses to populate into the parent.
					aChildBudgetItemLsc = aChildBudgetItemLscList(0)
					aLscExpensesTotal += aChildBudgetItemLsc.GetPropertyDouble("LscExpenditures")
					aNonLscExpensesTotal += aChildBudgetItemLsc.GetPropertyDouble("NonLscExpenditures")
				End If
			End If

		Next

		'Populate totals into parent
		aParentLscBudgetItem("LscExpenditures") = aLscExpensesTotal
		aParentLscBudgetItem("NonLscExpenditures") = aNonLscExpensesTotal
		aParentLscBudgetItem.SaveData()
		aLscExpensesTotal = 0
		aNonLscExpensesTotal = 0

		'Update the parent's parent
		UpdateLscBudgetItemParents(aParentHash)
	Next

End Sub

End Class
End Namespace