Imports System.Web.UI.HtmlControls
Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Workflow
Imports EasyGrants.DataAccess.Budget

Namespace Implementation.Controls.PageSection
Public Class cLSCBudgetEditor
	Inherits Easygrants_Web.Controls.Base.cWfTADataPresenterCtl

Protected mCategoryList As cDataObjectList
Protected mWfTaskAssignment As cWfTaskAssignment
Protected mGranteeProject As cGranteeProject
Protected mBudget As cBudget
Protected mBudgetPeriod As cBudgetPeriod
Protected mBudgetPeriodsList As cDataObjectList
Protected mBudgetItemlist As ArrayList = New ArrayList()
Protected mTopBudgetCategoryID As Integer
Protected mAwardTerm As Integer = 1
Protected mIsRecalculate As Boolean
Protected mAmountColumn	'the number of the table column in which the amounts are displayed
Private mDisplayFundCode As Boolean

'All controls implementing this class must have a table named "tblBudgetItems" to hold the budget grid.
Protected tblBudgetItems As HtmlTable

Public Property DisplayFundCode() As Boolean
	Get
		Return mDisplayFundCode
	End Get
	Set(ByVal value As Boolean)
		mDisplayFundCode = value
	End Set
End Property

Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		mWfTaskAssignment = CType(DataObjectCollection("WfTaskAssignment")(0), cWfTaskAssignment)
		mGranteeProject = CType(DataObjectCollection("GranteeProject")(0), cGranteeProject)

		Dim BudgetDO As cDataObject
		Dim BudgetList As cDataObjectList = CType(DataObjectCollection()("Budget"), cDataObjectList)
		If BudgetList(0).GetPropertyString("BudgetID") <> "" Then
			BudgetDO = BudgetList(0)
			mBudget = BudgetDO
			mBudgetPeriodsList = CType(DataObjectCollection()("BudgetPeriod"), cDataObjectList)
			If mBudgetPeriodsList(0).GetPropertyString("BudgetPeriodID") <> "" Then
				mBudgetPeriod = mBudgetPeriodsList(0)
			End If
		End If

		mCategoryList = CType(DataObjectCollection("TopBudgetCategory"), cDataObjectList)
		If mCategoryList.Count = 0 Then
			'throw error
		Else
			mTopBudgetCategoryID = mCategoryList(0).GetPropertyInt("BudgetCategoryID")
		End If

		Dim aRightMost As Integer = 1
		BuildBudgetItems(mCategoryList, 1, aRightMost)

End Sub

Public Overridable Sub BuildBudgetItems(ByVal aBudgetCategoryList As cDataObjectList, _
									ByVal aIndent As Integer, ByRef aRightMost As Integer)
		Dim aBudgetCategory As cDataObject
		Dim aSortedList As SortedList = New SortedList()
		Dim aIsSubTotal As Boolean

		If aBudgetCategoryList Is Nothing Then Exit Sub
		If aBudgetCategoryList.Count = 0 Then Exit Sub

		For Each aBudgetCategory In aBudgetCategoryList
			aSortedList.Add(aBudgetCategory("SortOrder"), aBudgetCategory)
		Next

		For Each aBudgetCategory In aSortedList.Values
			aIsSubTotal = False
			If aBudgetCategory.GetPropertyBool("HasChild") = True Then
				If aBudgetCategory.GetPropertyInt("BudgetCategoryID") = mTopBudgetCategoryID Then
					 BuildHeaderRow()
				Else
					 BuildParentCategoryHeaderRow(aBudgetCategory, aIndent)
				End If
				BuildBudgetItems(CType(aBudgetCategory.GetRelatedPropertyValue("Children"), cDataObjectList), aIndent, aRightMost)
			End If
			If aBudgetCategory.GetPropertyBool("HasChild") Then
				BuildSubtotalRow(aBudgetCategory, aIndent, aRightMost)
			Else
				BuildDataCollectionRow(aBudgetCategory, aIndent, aRightMost)
			End If
		Next 'aBudgetCategory In aSortedList.Values
End Sub

Public Overridable Sub BuildHeaderRow()

End Sub

Public Function Add_CellsToColumn(ByVal aTR As HtmlTableRow, ByVal aColNum As Integer) _
						As HtmlTableCell
		Dim aIndex As Integer
		Dim aTD As HtmlTableCell

		For aIndex = aTR.Cells.Count To aColNum - 1
			aTD = New HtmlTableCell()
			aTD.InnerHtml = "&nbsp;"
			aTR.Cells.Add(aTD)
		Next

		Return aTD
End Function

Public Sub RecalculateBudget()
	Page.Validate()
	If Page.IsValid() Then
		mIsRecalculate = True
		DataPresenter_SaveDataObjects()
	End If

End Sub

Public Overridable Sub BuildDataCollectionRow(ByVal aBudgetCategory As cDataObject, ByVal aIndent As Integer, _
									ByRef aRightMost As Integer)

	Dim aTR As HtmlTableRow
	Dim aValue As Double
	Dim aBudgetItem As cBudgetItem
	Dim aTD As HtmlTableCell

	aTR = New HtmlTableRow()
	aValue = 0


	If Not mBudgetPeriod Is Nothing Then 'edit mode
		aBudgetItem = GetBudgetItem(aBudgetCategory)
		aValue = cBudgetItem.Get_Amount(aBudgetItem)
	Else 'add mode 
		aValue = 0
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

	AddControlToDataCollectionRow(aTR, aBudgetItem, aBudgetCategory, aIndent)

	aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
	aTD.InnerHtml = "&nbsp;"
	tblBudgetItems.Rows.Add(aTR)

End Sub

Public Function GetBudgetItem(ByVal aBudgetCategory As cDataObject) As cBudgetItem

	Dim aBudgetItem As cBudgetItem
	aBudgetItem = mBudgetPeriod.Get_BudgetItem(aBudgetCategory.GetRelatedPropertyValue("BudgetCategoryID"), True)
	If Not aBudgetCategory.GetPropertyBool("HasChild") Then
		mBudgetItemlist.Add(aBudgetItem)
	End If
	aBudgetItem("BudgetPeriodID") = mBudgetPeriod.GetPropertyInt("BudgetPeriodID")
	aBudgetItem("CategoryTypeID") = aBudgetCategory.GetPropertyInt("CategoryTypeID", 0)
	Return aBudgetItem

End Function

Public Overridable Sub BuildParentCategoryHeaderRow(ByVal aBudgetCategory As cDataObject, ByVal aIndent As Integer)
	 Dim aTR As HtmlTableRow
	 Dim aTD As HtmlTableCell

	aTR = New HtmlTableRow()
	aTD = New HtmlTableCell
	aTD.ColSpan = mAmountColumn
	aTD.InnerHtml = "<b>" + _
						aBudgetCategory.GetPropertyString("Description").Trim() + _
						"</b>"
	aTD.BgColor = "#EEEEEE"
	aTR.Cells.Add(aTD)
	tblBudgetItems.Rows.Add(aTR)
End Sub

Public Overridable Sub BuildSubtotalRow(ByVal aBudgetCategory As cDataObject, ByVal aIndent As Integer, _
									ByRef aRightMost As Integer)
	Dim aTR As HtmlTableRow
	Dim aValue As Double
	Dim aBudgetItem As cBudgetItem
	Dim aTD As HtmlTableCell

	aTR = New HtmlTableRow()
	aValue = 0

	If Not mBudgetPeriod Is Nothing Then 'edit mode
		aBudgetItem = GetBudgetItem(aBudgetCategory)
		aValue = cBudgetItem.Get_Amount(aBudgetItem)
	Else 'add mode 
		aValue = 0
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

	aTD = Add_CellsToColumn(aTR, mAmountColumn)
	aTD.InnerHtml = "<b>" + String.Format("{0:$#,0}", aValue) + "</b>"
	aTD.Align = "right"
	tblBudgetItems.Rows.Add(aTR)

	'Add spacer row
	aTR = New HtmlTableRow()
	aTD = New HtmlTableCell
	aTD.InnerHtml = "&nbsp;"
	aTR.Cells.Add(aTD)
	tblBudgetItems.Rows.Add(aTR)

End Sub

Public Overridable Sub SetBudgetItemValuesFromControls(ByVal aBudgetItem As cBudgetItem)
	Dim aCtlID As String = aBudgetItem.GetPropertyString("BudgetCategoryID")
	Dim aTextBox As cTextBox = CType(Me.FindControl(aCtlID), cMoneyTextBox)
	If aTextBox.Value.Trim() = "" Then
		aBudgetItem("Amount") = 0
	Else
		aBudgetItem("Amount") = aTextBox.Value
	End If
End Sub

Public Sub SaveBudgetItems(ByVal aBudgetCategoryList As cDataObjectList)

Dim aBudgetCategory As cDataObject
Dim aBudgetItem As cBudgetItem
If aBudgetCategoryList Is Nothing Then Exit Sub
If aBudgetCategoryList.Count = 0 Then Exit Sub

For Each aBudgetCategory In aBudgetCategoryList
	If aBudgetCategory.GetPropertyBool("HasChild") = True Then
		SaveBudgetItems(CType(aBudgetCategory.GetRelatedPropertyValue("Children"), cDataObjectList))
	End If

	aBudgetItem = mBudgetPeriod.Get_BudgetItem(aBudgetCategory.GetRelatedPropertyValue("BudgetCategoryID"), "new")
	aBudgetItem("BudgetPeriodID") = mBudgetPeriod.GetPropertyInt("BudgetPeriodID")
	aBudgetItem("CategoryTypeID") = aBudgetCategory.GetPropertyInt("CategoryTypeID", 0)
	aBudgetItem("GranteeProjectID") = mGranteeProject.GetPropertyInt("GranteeProjectID", 0)
	aBudgetItem("CreateUser") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).UserID
	aBudgetItem("CreateDate") = System.DateTime.Now

	If Not aBudgetCategory.GetPropertyBool("HasChild") Then
		SetBudgetItemValuesFromControls(aBudgetItem)
		mBudgetPeriod.Save_BudgetItem(aBudgetItem)
		mBudgetItemlist.Add(aBudgetItem)
	End If
Next

End Sub

	Public Overrides Sub DataPresenter_SaveDataObjects()
		Dim aBudgetItem As cBudgetItem
		If mBudget Is Nothing Then
			mBudget = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Budget")
			mBudget("GranteeProjectID") = mGranteeProject.GetPropertyInt("GranteeProjectID")
			Select Case mWfTaskAssignment.GetPropertyInt("WfTaskID")
				Case 2 'Application
					mBudget("BudgetTypeID") = 1
				Case 4 'Renewal
					mBudget("BudgetTypeID") = 2
				Case Else
					If mWfTaskAssignment.GetRelatedPropertyInt("WfTask.WfTaskTypeID") = 3 Then 'Grantee report
						mBudget("BudgetTypeID") = 3
					End If
			End Select
			mBudget("CreateDate") = System.DateTime.Now
			mBudget("CreateUser") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).UserID
			mBudget.SaveData()
		End If
		If mBudgetPeriod Is Nothing Then
			Dim aBudgetPeriodDO As cDataObject
			Dim aAwardTermID As Integer
			aBudgetPeriodDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("BudgetPeriod")
			aBudgetPeriodDO("BudgetID") = mBudget.GetPropertyInt("BudgetID")
			aAwardTermID = mWfTaskAssignment.GetPropertyInt("AwardTermID", -1)
			If aAwardTermID > -1 Then
				aBudgetPeriodDO("BudgetPeriodDescriptionID") = aAwardTermID
				aBudgetPeriodDO("BudgetPeriodName") = "Budget Period " + aAwardTermID.ToString()
				aBudgetPeriodDO("BudgetPeriodNameID") = aAwardTermID
				aBudgetPeriodDO("BudgetYear") = "Year " + aAwardTermID.ToString()
				aBudgetPeriodDO("BudgetPeriodDescription") = "Budget Period " + aAwardTermID.ToString()
			Else
				aBudgetPeriodDO("BudgetPeriodNameID") = 1
			End If
			aBudgetPeriodDO.SaveData()
			mBudgetPeriod = (CType(aBudgetPeriodDO, cBudgetPeriod))
			mBudgetPeriodsList = mBudget.GetRelatedPropertyDataObjectList("BudgetPeriods")
			SaveBudgetItems(mCategoryList)
		Else
			For Each aBudgetItem In mBudgetItemlist
				aBudgetItem("GranteeProjectID") = Me.mBudget.GetPropertyInt("GranteeProjectID")
				SetBudgetItemValuesFromControls(aBudgetItem)
				mBudgetPeriod.Save_BudgetItem(aBudgetItem)
			Next
			mBudget("ModifyDate") = System.DateTime.Now
			mBudget("ModifyUser") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).UserID
		End If

			Dim aDO As cDataObject
			For Each aDO In mBudgetPeriodsList
				mBudgetPeriod = CType(aDO, cBudgetPeriod)

				If mBudgetPeriod.GetPropertyInt("BudgetPeriodID", 0) > 0 Then
					mBudgetPeriod.CalculateBudget(mCategoryList)
				End If
			Next
			mBudget.UpdateBudgetTotal()
			If mIsRecalculate Then
				mIsRecalculate = False
				'CorePage.Redirect() ***this line commented out 1/5/2009 for grantee reporting. Needs to be reviewed in application/renewal. Peter Larsen.
			End If

			EventController_Notify_DataModified(WebSession.DataObjectFactory, mDataObjHash)

	End Sub

Public Overridable Overloads Sub AddControlToDataCollectionRow(ByVal aTR As HtmlTableRow, ByVal aBudgetItem As cBudgetItem, _
					ByVal aBudgetCategory As cDataObject, ByVal aIndent As Integer)
	'Used to place a single text box on a row to collect the BudgetItem.Amount
	AddControlToDataCollectionRow(aTR, aBudgetItem, aBudgetCategory, aIndent, "Amount", "", "")
End Sub

Public Overloads Sub AddControlToDataCollectionRow(ByVal aTR As HtmlTableRow, ByVal aBudgetItem As cBudgetItem, ByVal aBudgetCategory As cDataObject, _
					ByVal aIndent As Integer, ByVal aPropertyKey As String, ByVal aIDTag As String, ByVal aErrorMessageLabel As String)

	'Used to collect data items other than BudgetItem.Amount or when placing more than one text box on a row
	Dim aTD As HtmlTableCell
	Dim aRightMost As Integer
	Dim aTextBox As cMoneyTextBox
	Dim aID As String

	'Text box
	aID = aBudgetCategory.GetPropertyString("BudgetCategoryID") + aIDTag
	aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
	aRightMost = aIndent + 1
	aTextBox = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cMoneyTextBox']").Attributes("ControlFile").Value), cMoneyTextBox)
	aTextBox.ID = aID
	If Not IsPostBack And Not aBudgetItem Is Nothing Then
		aTextBox.Value = aBudgetItem.GetRelatedPropertyString(aPropertyKey)
	End If
	aTextBox.Size = 7
	aTextBox.MaxLength = 9
	aTextBox.BaseTextBox.Style.Add("text-align", "right")
	aTextBox.MaxInputDecimalPlaces = 0
	aTextBox.AllowInputCommas = True
	If aErrorMessageLabel.Length > 0 Then aErrorMessageLabel = " " + aErrorMessageLabel
	aTextBox.DecimalErrorMessage = aBudgetCategory.GetPropertyString("Description") + aErrorMessageLabel + " must be a whole number."
	aTextBox.RegExErrorMessage = aBudgetCategory.GetPropertyString("Description") + aErrorMessageLabel + " requires a valid currency format (Example: 100,000)."
	aTD.InnerHtml = "$"
	aTD.Controls.Add(aTextBox)
	aTD.Align = "right"

End Sub



End Class

End Namespace
