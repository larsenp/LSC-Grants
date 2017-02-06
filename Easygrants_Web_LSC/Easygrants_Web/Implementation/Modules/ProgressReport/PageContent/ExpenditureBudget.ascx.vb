
Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports EasyGrants.Workflow
Imports System


Namespace Easygrants_Web.Implementation.Modules.ProgressReport.PageContent

Public Class cExpenditureBudget
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

  Protected tblBudgetItems As HtmlTable
	'Protected tblBudgetPeriod As HtmlTable
	'Protected tblSaveClose As HtmlTable
	'Protected tblText As HtmlTable

	Private mCategoryList As cDataObjectList
	Private mBudgetPeriod As cBudgetPeriod
	Private mBudgetItemlist As ArrayList = New ArrayList()
	'Private mBudgetUploadVisible As Boolean
	Private mIsRecalculate As Boolean
	Protected ctlPeriod As cDropDown
	Protected btnGo As cCSSButton
	Protected tblButtons As HtmlTable
	Protected spnCalculate As HtmlGenericControl
	Protected spnContinue As HtmlGenericControl
	Protected tblHeading As HtmlTable

'--------------------------------------------------------------------------------

	Public ReadOnly Property BudgetPeriod() As cBudgetPeriod
		Get
			Return mBudgetPeriod
		End Get
	End Property

'--------------------------------------------------------------------------------

	'Public Property BudgetUploadVisible() As Boolean
	'	Get
	'		Return mBudgetUploadVisible
	'	End Get
	'	Set(ByVal Value As Boolean)
	'		mBudgetUploadVisible = Value
	'	End Set
	'End Property

'--------------------------------------------------------------------------------
Public ReadOnly Property BudgetPeriodNameID() As String
			Get
			If Request.QueryString("PeriodID") Is Nothing Then Return 0
			If Request.QueryString("PeriodID") = "" Then Return 0

			Return Convert.ToInt32(Request.QueryString("PeriodID"))
		End Get
	End Property

	Public ReadOnly Property BudgetPeriodID() As Integer
		Get
			If Request.QueryString("BudgetPeriodID") Is Nothing Then Return 0
			If Request.QueryString("BudgetPeriodID") = "" Then Return 0

			Return Convert.ToInt32(Request.QueryString("BudgetPeriodID"))
		End Get
	End Property

Public Property PeriodID() As String
		Get
			Try
				Return ctlPeriod.SelectedValue
			Catch
				Return ""
			End Try
		End Get
		Set(ByVal value As String)
			ctlPeriod.SelectedField = value
		End Set
	End Property
'--------------------------------------------------------------------------------

	'Public ReadOnly Property BudgetPeriodDescriptionID() As Integer
	'	Get
	'		If request.QueryString("BudgetPeriodDescriptionID") = "" Then
	'			Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
	'			Select Case aUser.WfTaskID
	'				Case 1
	'					Return 1
	'				Case 51
	'					Return 2
	'				Case 52
	'					Return 3
	'				Case 53
	'					Return 4
	'				Case 54
	'					Return 5
	'			End Select
	'		Else
	'			BudgetPeriodDescriptionID = Convert.ToInt32(Request.QueryString("BudgetPeriodDescriptionID"))
	'		End If
	'	End Get
	'End Property


'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		ctlPeriod = CType(Me.FindControl("ctlPeriod"), cDropDown)
		
		Dim aXmlDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aSortNode As XmlNode
		Dim aDataObjectList As cDataObjectList
		Dim aDataObject As cDataObject
		Dim aItem As ListItem
		Dim aGPDo As cDataObject = CType(Me.DataObjectCollection("GranteeProject")(0), cDataObject)
		Dim aBudgetDo As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Budget", "GranteeProjectID", aGPDo("GranteeProjectID").ToString(), "BudgetTypeID", 1)(0)
		If aBudgetDo Is Nothing Then Exit Sub
		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("BudgetPeriod", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "BudgetID", aBudgetDo("BudgetID")))
		aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
		aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "BudgetPeriodName", ""))
		aDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		ctlPeriod.Items.Clear()
		aItem = New ListItem("<None>", "0")
		ctlPeriod.Items.Add(aItem)
		For Each aDataObject In aDataObjectList
			aItem = New ListItem("Year" + aDataObject.GetPropertyString("BudgetPeriodNameID"), aDataObject.GetPropertyString("BudgetPeriodNameID"))
			ctlPeriod.Items.Add(aItem)
		Next
		If BudgetPeriodNameID > 0 Then
			PeriodID = BudgetPeriodNameID
		End If
		btnGo.Set_ServerClick(AddressOf SelectPeriod)


		If BudgetPeriodNameID = 0 Then
			spnCalculate.Visible = False
			spnContinue.Visible = False
			tblHeading.Visible = False
		End If

		If BudgetPeriodNameID > 0 Then
			Dim aBudgetItem As cBudgetItem
			Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)



			Dim aBudget As cBudget
			Dim aRightMost As Integer = 1


			Dim BudgetList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Budget", "GranteeProjectID", aUser.GranteeProjectID.ToString(), "BudgetTypeID", "1")
			If BudgetList.Count > 0 Then
				Dim BudgetPeriodList As cDataObjectList
				Dim BudgetID As Integer = BudgetList(0).GetPropertyInt("BudgetID")
				BudgetPeriodList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetPeriod", "BudgetID", BudgetID.ToString(), "BudgetPeriodNameID", BudgetPeriodNameID)
				If BudgetPeriodList.Count > 0 Then
					mBudgetPeriod = BudgetPeriodList(0)
					aBudget = BudgetList(0)
					'exit For
				End If
			End If

			mCategoryList = BudgetPeriod.Get_TopLevel_Categories()

			Dim aTR As HtmlTableRow = New HtmlTableRow()
			Dim aTD As HtmlTableCell = New HtmlTableCell()
			aTD = Add_CellsToColumn(aTR, 4)
			aTD.InnerHtml = "<b>Award Budget</b>"
			aTD.NoWrap = True
			aTR.Cells.Add(aTD)
			'aTD = New HtmlTableCell()
			'aTR.Cells.Add(aTD)
			aTD = New HtmlTableCell()
			aTD.InnerHtml = "<b>Actual Expenses to date</b>"
			aTD.NoWrap = True
			aTD.Align = "Right"
			aTR.Cells.Add(aTD)
			aTD = New HtmlTableCell()
			aTD.InnerHtml = "<b>Balance</b>"
			aTD.NoWrap = True
			aTD.Align = "Right"
			aTR.Cells.Add(aTD)
			aTD = New HtmlTableCell()
			aTD.InnerHtml = "<b>Carry Over %</b>"
			aTD.NoWrap = True
			aTD.Align = "Right"
			aTR.Cells.Add(aTD)
			tblBudgetItems.Rows.Add(aTR)
			aTR = New HtmlTableRow
			aTD = Add_CellsToColumn(aTR, 4)
			aTD.InnerHtml = "<b>Year" + BudgetPeriodNameID + "</b>"
			aTD.NoWrap = True
			aTR.Cells.Add(aTD)
			'aTD = New HtmlTableCell()
			'aTR.Cells.Add(aTD)
			aTD = New HtmlTableCell()
			aTD.InnerHtml = "<b>Year" + BudgetPeriodNameID + "</b>"
			aTD.NoWrap = True
			aTD.Align = "Right"
			aTR.Cells.Add(aTD)
			aTD = New HtmlTableCell()
			aTD.InnerHtml = "<b>Year" + BudgetPeriodNameID + "</b>"
			aTD.NoWrap = True
			aTD.Align = "Right"
			aTR.Cells.Add(aTD)
			aTD = New HtmlTableCell()
			aTD.InnerHtml = "<b>Year" + BudgetPeriodNameID + "</b>"
			aTD.NoWrap = True
			aTD.Align = "Right"
			aTR.Cells.Add(aTD)
			tblBudgetItems.Rows.Add(aTR)

			BuildBudgetItems(mCategoryList, 1, aRightMost)

			aTD = New HtmlTableCell()
			aTR.Cells.Add(aTD)
			aTD = New HtmlTableCell()

			If BudgetPeriod.GetPropertyInt("BudgetPeriodID", 0) = 0 Then
				aBudgetItem = BudgetPeriod.Get_BudgetItem(mCategoryList(0).GetRelatedPropertyValue("BudgetCategoryID"), "new")
			Else
				aBudgetItem = BudgetPeriod.Get_BudgetItem(mCategoryList(0).GetRelatedPropertyValue("BudgetCategoryID"), True)
			End If

			mBudgetItemlist.Add(aBudgetItem)

		End If
	End Sub

'-----------------------------------------------------

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
'--------------------------------------------------------

	Public Sub lnkBudgetItemNotes_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		EventController_Save()
		EventController_NavigateToModulePageKey("BudgetItemNotes", "ReturnURL=" + Request.Url.PathAndQuery, "ReturnPageKey=" + CType(WebSession.CurrentPage, cModulePage).PageKey, "BudgetCategoryID=" + aSrc.Attributes("BudgetCategoryID"), "BudgetPeriodID=" + BudgetPeriod.GetPropertyInt("BudgetPeriodID").ToString())
	End Sub

'-----------------------------------------------------

	Public Sub BuildBudgetItems(ByVal aBudgetCategoryList As cDataObjectList, ByVal aIndent As Integer, ByRef aRightMost As Integer)
		Dim aBudgetCategory As cDataObject
		Dim aTR As HtmlTableRow
		Dim aTD As HtmlTableCell
		Dim aBudgetItem As cBudgetItem
		Dim aID As String
		Dim aID2 As String
		Dim aValue As String
		Dim aTextBox As cTextBox
		Dim aSortedList As SortedList = New SortedList()
		Dim aIsSubTotal As Boolean
		Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)


		For Each aBudgetCategory In aBudgetCategoryList
			aSortedList.Add(aBudgetCategory("SortOrder"), aBudgetCategory)
		Next

		If aBudgetCategoryList Is Nothing Then Exit Sub
		If aBudgetCategoryList.Count = 0 Then Exit Sub
		Dim aIndex As Integer = 0

		For Each aBudgetCategory In aSortedList.Values
			aIsSubTotal = False
			If aBudgetCategory.GetPropertyBool("HasChild") = True Then
				aTR = New HtmlTableRow()

				aTD = Add_CellsToColumn(aTR, aIndent)

				If aBudgetCategory.GetPropertyInt("ParentID") <> 0 Then
					aTD.InnerHtml = "<b>" + _
										aBudgetCategory.GetPropertyString("Description").Trim() + _
										"</b>"
					aTD.BgColor = "#EEEEEE"
					aTD.ColSpan = 7
					tblBudgetItems.Rows.Add(aTR)
				End If

				BuildBudgetItems(CType(aBudgetCategory.GetRelatedPropertyValue("Children"), cDataObjectList), aIndent + 1, aRightMost)
			End If

			aTR = New HtmlTableRow()

			If BudgetPeriod.GetPropertyInt("BudgetPeriodID") = 0 Then
				aBudgetItem = BudgetPeriod.Get_BudgetItem(aBudgetCategory.GetRelatedPropertyValue("BudgetCategoryID"), "new")
			Else
				aBudgetItem = BudgetPeriod.Get_BudgetItem(aBudgetCategory.GetRelatedPropertyValue("BudgetCategoryID"), True)
			End If

			aTD = Add_CellsToColumn(aTR, aIndent)
			If Not aBudgetCategory.GetPropertyBool("HasChild") Then
				mBudgetItemlist.Add(aBudgetItem)
				aTD.InnerHtml = "<b>" + aBudgetCategory.GetPropertyString("Description").Trim() + _
								"<font color='red'>*</font></b>&nbsp;"
				aTD.ColSpan = 1
				aTD.NoWrap = True
			Else
				If aBudgetCategory.GetPropertyInt("ParentID") <> 0 Then
					mBudgetItemlist.Add(aBudgetItem)
					aTD.InnerHtml = "<b>" + _
									"Sub-Total for&nbsp;" + _
										aBudgetCategory.GetPropertyString("Description").Trim() + _
										"</b>"
					aTD.ColSpan = 2
				Else
					'aTD = Add_CellsToColumn(aTR, aIndent)
					aTD.InnerHtml = "<b>" + _
									aBudgetCategory.GetPropertyString("Description").Trim() + _
									"</b>"
					aTD.Align = "right"
					aTR.BgColor = "#EEEEEE"
					aTD.ColSpan = 2
					aRightMost = 4
				End If
				aIsSubTotal = True
			End If
			aID = aBudgetCategory("BudgetCategoryID").ToString()
			aID2 = aBudgetItem("BudgetItemID").ToString()
			aValue = cBudgetItem.Get_Amount(aBudgetItem).ToString()
			Dim aList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItemExpense", _
						"BudgetItemID", aBudgetItem.GetPropertyInt("BudgetItemID", 0), "TaskID", aUser.WfTaskID.ToString())

			tblBudgetItems.Rows.Add(aTR)

			If aIndent + 1 > aRightMost Then aRightMost = aIndent + 1
			aTD = Add_CellsToColumn(aTR, aRightMost - (aTD.ColSpan - 1))
			If Not aTD Is Nothing Then
				If Not aBudgetCategory.GetPropertyBool("HasChild") Then
					aRightMost = aIndent + 1

					aTD.Align = "right"

					aTD.InnerHtml = "$" + aValue

					'aTD = Add_CellsToColumn(aTR, aRightMost - (aTD.ColSpan - 1))
					aTR.Cells.Add(aTD)
					aTD = New HtmlTableCell()
					aTextBox = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cTextBox']").Attributes("ControlFile").Value), cTextBox)
					aTextBox.ID = aID
					'Dim aList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItemExpense", _
					'	"BudgetItemID", aBudgetItem.GetPropertyInt("BudgetItemID", 0), "TaskID", aUser.WfTaskID.ToString())

					'gets totals for "Actual Expenses to date" column in budget, kda 3/24/06
					If aList.Count > 0 Then
						aTextBox.Value = aList(0).GetPropertyDouble("Expense")
					End If

					aTextBox.Size = "10"
					aTextBox.BaseTextBox.Style.Add("text-align", "right")

					aTD.Align = "Right"
					aTD.InnerHtml = "$"

					Dim aValidator As BaseValidator
					aValidator = New RegularExpressionValidator()
					Dim aRegExValidator As RegularExpressionValidator = CType(aValidator, RegularExpressionValidator)
					aRegExValidator.ValidationExpression = "^[+]?\d*$"
					aValidator.ControlToValidate = aTextBox.ID

					aValidator.ErrorMessage = "Please enter a valid " & mCategoryList(0).GetPropertyString("Description") & " amount. Do not use decimals or commas."
					aValidator.Enabled = True
					aValidator.Display = ValidatorDisplay.None
					aTD.Controls.Add(aValidator)
					aTD.Controls.Add(aTextBox)
					aTR.Cells.Add(aTD)

					aTD = New HtmlTableCell()
					aTD.Align = "Right"
					If Not aList(0) Is Nothing Then
						If aList(0).GetPropertyDouble("Balance", 0) = 0 Then
							aTD.InnerHtml = "$0.00"
						Else
							aTD.InnerHtml = "$" + aList(0).GetPropertyDouble("Balance", 0).ToString()
						End If
					Else
						aTD.InnerHtml = ""
					End If
					aTR.Cells.Add(aTD)

					aTD = New HtmlTableCell()
					aTD.Align = "Right"
					If Not aList(0) Is Nothing Then
						If aList(0).GetPropertyDouble("CarryOver", 0) = 0 Then
							aTD.InnerHtml = "0.00%"
						Else
							aTD.InnerHtml = Format(aList(0).GetPropertyDouble("CarryOver", 0), "#.##").ToString() + "%"
						End If
					Else
						aTD.InnerHtml = ""
					End If
					aTR.Cells.Add(aTD)

				Else
					aRightMost = aIndent + 1
					aTD.InnerHtml = "<b>$" + aValue + "</b>"

					aTD.Align = "right"
					aTD.Width = "100"
					'aTD = Add_CellsToColumn(aTR, aRightMost - (aTD.ColSpan - 1))
					aTR.Cells.Add(aTD)

					aTD = New HtmlTableCell()
					aTD.Align = "Right"
					If Not aList(0) Is Nothing Then
						aTD.InnerHtml = "<b>$" + aList(0).GetPropertyDouble("Expense", 0).ToString() + "</b>"
					Else
						aTD.InnerHtml = ""
					End If
					aTR.Cells.Add(aTD)

					aTD = New HtmlTableCell()
					aTD.Align = "Right"
					If Not aList(0) Is Nothing Then
						If aList(0).GetPropertyDouble("Balance", 0) = 0 Then
							aTD.InnerHtml = "<b>$0.00</b>"
						Else
							aTD.InnerHtml = "<b>$" + aList(0).GetPropertyDouble("Balance", 0).ToString() + "</b>"
						End If
					Else
						aTD.InnerHtml = ""
					End If
					aTR.Cells.Add(aTD)

					aTD = New HtmlTableCell()
					aTD.Align = "Right"
					If Not aList(0) Is Nothing Then
						If aList(0).GetPropertyDouble("CarryOver", 0) = 0 Then
							aTD.InnerHtml = "<b>0.00%</b>"
						Else
							aTD.InnerHtml = "<b>" + Format(aList(0).GetPropertyDouble("CarryOver", 0), "#.##").ToString() + "%</b>"
						End If

					Else
						aTD.InnerHtml = ""
					End If
					aTR.Cells.Add(aTD)

					'If aBudgetCategory.GetPropertyString("Description").Trim() = "Total" Then
					'	'Dim aList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItemExpense", _
					'	'	"BudgetItemID", aID2, "TaskID", aUser.WfTaskID)
					'	aTextBox = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cTextBox']").Attributes("ControlFile").Value), cTextBox)
					'	If Request.QueryString("Total") Is Nothing Then
					'		If aList.Count > 0 Then
					'			aTextBox.Value = aList(0).GetPropertyDouble("Expense", 0)
					'		End If
					'	Else
					'		aTextBox.Value = Request.QueryString("Total")
					'	End If

					'	aTextBox.ID = aID + "expense"
					'	aTextBox.Size = "10"
					'	aTextBox.BaseTextBox.Style.Add("text-align", "right")

					'	aTD = New HtmlTableCell()
					'	aTD.InnerHtml = "&nbsp;"
					'	aTR.Cells.Add(aTD)

					'	aTD = New HtmlTableCell()
					'	aTD.InnerHtml = "&nbsp;"
					'	aTD.Align = "Right"
					'	aTD.InnerHtml = "$"

					End If


				End If



				'If Not aTextBox Is Nothing Then
				'	Dim aValidator As BaseValidator
				'	aValidator = New RegularExpressionValidator()
				'	Dim aRegExValidator As RegularExpressionValidator = CType(aValidator, RegularExpressionValidator)
				'	aRegExValidator.ValidationExpression = "^[+]?\d*$"
				'	aValidator.ControlToValidate = aTextBox.ID

				'	aValidator.ErrorMessage = "Please enter a valid " & mCategoryList(0).GetPropertyString("Description") & " amount. Do not use decimals or commas."
				'	aValidator.Enabled = True
				'	aValidator.Display = ValidatorDisplay.None
				'	aTD.Controls.Add(aValidator)
				'	aTD.Controls.Add(aTextBox)
				'	aTR.Cells.Add(aTD)

				'	aTD = New HtmlTableCell()
				'	aTD.Align = "Right"
				'	If Not aList(0) Is Nothing Then
				'		aTD.InnerHtml = "$" + aList(0).GetPropertyDouble("Balance", 0).ToString()
				'	Else
				'		aTD.InnerHtml = "$"
				'	End If
				'	aTR.Cells.Add(aTD)

				'	aTD = New HtmlTableCell()
				'	aTD.Align = "Right"
				'	If Not aList(0) Is Nothing Then
				'		aTD.InnerHtml = Format(aList(0).GetPropertyDouble("CarryOver", 0), "#.##").ToString() + "%"
				'	Else
				'		aTD.InnerHtml = ""
				'	End If
				'	aTR.Cells.Add(aTD)
				'End If



			'End If
			'If aIsSubTotal Then
			'	aTR = New HtmlTableRow()
			'	tblBudgetItems.Rows.Add(aTR)
			'End If
		Next
	End Sub

'=============================================================

'Invoked by EventController_ControlValidate
	Public Function ValidateDuplicateName(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ValidateDuplicateName = True

		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aXmlDoc As cXMLDoc
		Dim aDataObject As cDataObject

		Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)

		Dim ctlPeriodName As cDropDown
		ctlPeriodName = CType(Me.FindControl("ctlPeriodName"), cDropDown)

		Dim iType As Integer
		iType = CType(ctlPeriodName.SelectedValue, Integer)

		Dim aBudget As cBudget
		aBudget = CType(DataObjectCollection()("Budget")(0), cBudget)

		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("BudgetPeriod", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "BudgetID", aBudget.GetPropertyString("BudgetID", "0")))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "BudgetPeriodNameID", iType))
		aDataObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

		If Not aDataObject Is Nothing Then
			If BudgetPeriod.GetPropertyInt("BudgetPeriodID") > 0 Then
				If BudgetPeriod.GetPropertyInt("BudgetPeriodID") <> aDataObject.GetPropertyInt("BudgetPeriodID") Then
					ValidateDuplicateName = False
				End If
			Else
				ValidateDuplicateName = False
			End If
		End If
	End Function

'=============================================================

 Public Overrides Sub DataPresenter_SaveDataObjects()

		'If Not mIsRecalculate Then
		'	MyBase.DataPresenter_SaveDataObjects()

		'	Dim aBudget As cBudget
		'	aBudget = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Budget",Me.BudgetPeriod.GetPropertyInt("BudgetID"))
		'	aBudget.UpdateBudgetTotal()
		'End If

		'if BudgetPeriodID = 0 then exit Sub



		Dim aTextBox As cTextBox
		Dim aBudgetItem As cBudgetItem
		Dim aExpense As cDataObject
		Dim aID As Integer
		Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)

		For Each aBudgetItem In mBudgetItemlist
			If aBudgetItem.GetRelatedPropertyInt("BudgetCategory.HasChild") = 1 Then
				'aTextBox = CType(Me.FindControl(aBudgetItem.GetRelatedPropertyInt("BudgetCategory.BudgetCategoryID").ToString() + "expense"), cTextBox)
				'aBudgetItem("BudgetCategoryID") = aBudgetItem.GetRelatedPropertyInt("BudgetCategory.BudgetCategoryID")

				'Here when we don't have values for BudgetItem , and in CalBudgetExpenseCategory we are trying to save the BudgetItemID
				'that's why we need to exit the save. This form is basically used for GranteeReports Task. but if we use this task before 
				'entering the Budget Items from Grant File Budget , then we get error , that's the reason why we  need to exit without saving

				If aBudgetItem.GetPropertyString("BudgetItemID") = "" Then Exit Sub

				mCategoryList = Me.BudgetPeriod.Get_Categories(aBudgetItem.GetPropertyInt("BudgetCategoryID"))
				Dim aTotal As Double = Me.BudgetPeriod.CalBudgetExpenseCategory(mCategoryList, GranteeProjectID, aUser.WfTaskID)
				If aBudgetItem.GetPropertyDouble("Amount") > 0 Then


				End If
			Else
				aTextBox = CType(Me.FindControl(aBudgetItem("BudgetCategoryID")), cTextBox)
				'aBudgetItem("BudgetCategoryID") = aTextBox.ID
				If aTextBox.Value.Trim() <> "" Then

					'Here when we don't have values for BudgetItem , then we need to exit the save. since BudgetItemID needs to be save in BudgetItemExpenses table. 
					'This form is basically used for GranteeReports Task. but if we use this task before entering the Budget Items from Grant File Budget , then we get error , that's the reason why we  need to exit 							'without saving


					If aBudgetItem.GetPropertyString("BudgetItemID") = "" Then Exit Sub

					Dim aList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItemExpense", _
						"BudgetItemID", aBudgetItem.GetPropertyString("BudgetItemID"), "TaskID", aUser.WfTaskID)

					If aList.Count > 0 Then
						aExpense = aList(0)
					Else
						aExpense = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("BudgetItemExpense")
					End If

					aExpense("BudgetItemID") = aBudgetItem.GetPropertyString("BudgetItemID")
					aExpense("GranteeProjectID") = GranteeProjectID
					aExpense("TaskID") = aUser.WfTaskID
					aExpense("Expense") = aTextBox.Value
					Dim exp As Double = aBudgetItem.GetPropertyDouble("Amount", 0) - Double.Parse(aTextBox.Value)
					aExpense("Balance") = exp
					If aBudgetItem.GetPropertyDouble("Amount") > 0 Then
					aExpense("CarryOver") = (exp / aBudgetItem.GetPropertyDouble("Amount")) * 100
					End If
					Me.WebSession.DataObjectFactory.SaveDataObject(aExpense)
				End If
			End If
			'if not aTextBox is nothing then


				aBudgetItem("BudgetPeriodID") = BudgetPeriod("BudgetPeriodID")
				aBudgetItem("GranteeProjectID") = GranteeProjectID
				Me.BudgetPeriod.Save_BudgetItem(aBudgetItem)

				'If aBudgetItem("Notes") Is System.DBNull.Value And (aTextBox.Value.Trim() = "" Or aTextBox.Value.Trim() = "0") Then
				'	Me.BudgetPeriod.Delete_BudgetItem(aBudgetItem)
				'End If
			'end if
		Next

		'If BudgetPeriod.GetPropertyInt("BudgetPeriodID", 0) > 0 Then
		'	Me.BudgetPeriod.CalculateBudget(mCategoryList)
		'End If

		'If mIsRecalculate Then
		'	mIsRecalculate = False
		'	CorePage.Redirect()
		'Else
		'	MyBase.DataPresenter_SaveDataObjects()

		'	Dim aBudget As cBudget
		'	aBudget = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Budget", Me.BudgetPeriod.GetPropertyInt("BudgetID"))
		'	aBudget.UpdateBudgetTotal()
		'End If

	End Sub

'=============================================================

	Public Sub RecalculateBudget()
		Dim aIndex As Integer
		Dim aTotal As Double = 0
		Dim aTextBox As cTextBox

		'For aIndex = 0 To mBudgetItemlist.Count - 2
		'	aTextBox = CType(Me.FindControl(mBudgetItemlist(aIndex)("BudgetCategoryID")), cTextBox)

		'	If aTextBox.Value.Trim() <> "" Then
		'		aTotal = aTotal + aTextBox.Value
		'	End If
		'Next

		'Dim aURL As String = Request.RawUrl.ToString()
		'aURL = cWebLib.AddQuerystringParameter(aURL, "Total", aTotal.ToString())
		'response.Redirect(aURL)
		CorePage.Redirect()
		'mIsRecalculate = True
		'DataPresenter_SaveDataObjects()

	End Sub

'=============================================================

	Public Sub SavePeriod()

		MyBase.EventController_Save()

		Dim aBudgetPeriod As cDataObject
		aBudgetPeriod = Me.DataObjectCollection("BudgetPeriod")(0)
		Dim aUrl As String
		aUrl = Request.RawUrl.ToString()
		aUrl = cWebLib.RemoveQuerystringParameter(aURL, "BudgetPeriodID")
		aURL = cWebLib.AddQuerystringParameter(aURL, "BudgetPeriodID", aBudgetPeriod.GetPropertyInt("BudgetPeriodID", 0))
		Response.Redirect(aURL)

	End Sub

	Private Sub SelectPeriod(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aURL As String

		aURL = Request.RawUrl
		aURL = cWebLib.AddQuerystringParameter(aURL, "PeriodID", ctlPeriod.SelectedValue)
		Response.Redirect(aURL)
	End Sub

End Class

End Namespace