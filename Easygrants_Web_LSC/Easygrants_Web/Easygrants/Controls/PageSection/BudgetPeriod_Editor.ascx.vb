Imports System.Diagnostics
Imports System.Xml
Imports Core.Web
Imports Core.Web.Modules
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Controls.PageSection
Public Class cBudgetPeriod_Editor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================

	Protected tblBudgetItems As HtmlTable
	Protected tblBudgetItemsHdg As HtmlTable
	Protected spnBudgetError As HtmlGenericControl
	Protected spanItem As HtmlGenericControl
	Protected spanItem1 As HtmlGenericControl
	Protected spanPeriod As HtmlGenericControl
	Protected spanItem2 As HtmlGenericControl
	Protected spnSave As HtmlGenericControl

	Private mCategoryList As cDataObjectList
	Private mBudgetPeriod As cBudgetPeriod
	Private mBudgetItemlist As ArrayList = New ArrayList()
	Private mBudgetUploadVisible As Boolean
	Private mIsRecalculate As Boolean
	Private mIsNotes As Boolean
	Private mIsSaveContinue As Boolean
	Private mPageKey As String

	Protected tblGrantinfo As HtmlTable
    Private mAwardTerm As Integer
    Private mGranteeProject As cGranteeProject
    Protected ctlPeriod as cDropDown

'--------------------------------------------------------------------------------

    Public ReadOnly Property AwardTerm() As Integer
		Get
			Return mAwardTerm
		End Get
	End Property


    Public ReadOnly Property GranteeProject() As cGranteeProject
		Get
			Return mGranteeProject
		End Get
	End Property

'--------------------------------------------------------------------------------

	Public ReadOnly Property IndirectCostLimit() As Double
		Get
			If CType(Me.DataObjectCollection("BudgetPeriod"), cDataObjectList)(0).GetRelatedPropertyString("Budget.GranteeProject.WfProject.CompetitionID") = "1" Then
				Return 15.0
			Else
				Return 7.5
			End If
		End Get
	End Property

'--------------------------------------------------------------------------------

	Public ReadOnly Property BudgetPeriod() As cBudgetPeriod
		Get
			Return mBudgetPeriod
		End Get
	End Property

'--------------------------------------------------------------------------------

	Public Property BudgetUploadVisible() As Boolean
		Get
			Return mBudgetUploadVisible
		End Get
		Set(ByVal Value As Boolean)
			mBudgetUploadVisible = Value
		End Set
	End Property

'--------------------------------------------------------------------------------

	Public ReadOnly Property BudgetPeriodID() As String
		Get
			If Request.QueryString("BudgetPeriodID") Is Nothing Then Return 0
			If Request.QueryString("BudgetPeriodID") = "" Then Return 0

			Return Request.QueryString("BudgetPeriodID")
		End Get
	End Property

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		Dim ctlUpload As cUpload = CType(Me.FindControl("ctlUpload"), cUpload)
		ctlUpload.Anchor = "aUploadNarrative"

		If Request.QueryString("Anchor") <> "" Then
			Dim aURL As String = Request.RawUrl.ToString()
			aURL = Core.Web.cWebLib.RemoveQuerystringParameter(aURL, "Anchor")
			Response.Redirect(aURL + "#" + Request.QueryString("Anchor"))
		End If

		Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		If aUser.AccessLevel < 2 Then
			tblGrantinfo.Visible = False
		End If

		If Request.QueryString("BudgetError") = "True" Then
			spnBudgetError.Visible = True
		Else
			spnBudgetError.Visible = False
		End If

		If BudgetPeriodID = "0" Then
			tblBudgetItemsHdg.Visible = False
			spanItem.Visible = False
			spanItem1.Visible = False
			spanItem2.Visible = False
			spnSave.Visible = False
		Else
			spanPeriod.Visible = False
		End If

		If BudgetUploadVisible = False Then
			ctlUpload.Visible = False
		End If

        Dim aBudget As cBudget
		Dim aRightMost As Integer = 1

        mBudgetPeriod = CType(DataObjectCollection()("BudgetPeriod")(0), cBudgetPeriod)

		aBudget = CType(DataObjectCollection()("Budget")(0), cBudget)

		mCategoryList = BudgetPeriod.Get_TopLevel_Categories()

		BuildBudgetItems(mCategoryList, 1, aRightMost)
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
        Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)		
        mIsNotes = True
		EventController_Save()
		EventController_NavigateToModulePageKey("BudgetItemNotes", "ReturnURL=" + Request.Url.PathAndQuery, "ReturnPageKey=" + CType(WebSession.CurrentPage, cModulePage).PageKey, "BudgetCategoryID=" + aSrc.Attributes("BudgetCategoryID"), "BudgetPeriodID=" + BudgetPeriodID.ToString(), "GranteeProjectID=" + aUser.GranteeProjectID.ToString())
	End Sub

'-----------------------------------------------------

	Public Sub BuildBudgetItems(ByVal aBudgetCategoryList As cDataObjectList, _
									ByVal aIndent As Integer, ByRef aRightMost As Integer)
		Dim aBudgetCategory As cDataObject
		Dim aTR As HtmlTableRow
		Dim aTD As HtmlTableCell
		Dim aBudgetItem As cBudgetItem
		Dim aID As String
		Dim aValue As String
		Dim aTextBox As cTextBox
		Dim aLink As cLink
		Dim aSortedList As SortedList = New SortedList()
		Dim aIsSubTotal As Boolean

		For Each aBudgetCategory In aBudgetCategoryList
			aSortedList.Add(aBudgetCategory("SortOrder"), aBudgetCategory)
		Next

		If aBudgetCategoryList Is Nothing Then Exit Sub
		If aBudgetCategoryList.Count = 0 Then Exit Sub

		For Each aBudgetCategory In aSortedList.Values
			aIsSubTotal = False
			If aBudgetCategory.GetPropertyBool("HasChild") = True Then
				aTR = New HtmlTableRow()

				If aBudgetCategory.GetPropertyInt("ParentID") <> 0 Then
					aTD = Add_CellsToColumn(aTR, aIndent - 1)
					aTD.InnerHtml = "<b>" + _
										aBudgetCategory.GetPropertyString("Description").Trim() + _
										"</b>"
					aTD.BgColor = "#EEEEEE"
					aTD.ColSpan = 4
					tblBudgetItems.Rows.Add(aTR)
				Else
					aTD = Add_CellsToColumn(aTR, aIndent)
				End If

				BuildBudgetItems(CType(aBudgetCategory.GetRelatedPropertyValue("Children"), cDataObjectList), aIndent + 1, aRightMost)
			End If

			aTR = New HtmlTableRow()

			If BudgetPeriodID = 0 Then
				aBudgetItem = BudgetPeriod.Get_BudgetItem(aBudgetCategory.GetRelatedPropertyValue("BudgetCategoryID"), "new")
			Else
				aBudgetItem = BudgetPeriod.Get_BudgetItem(aBudgetCategory.GetRelatedPropertyValue("BudgetCategoryID"), True)
			End If

			If Not aBudgetCategory.GetPropertyBool("HasChild") Then
				aTD = Add_CellsToColumn(aTR, aIndent)
				mBudgetItemlist.Add(aBudgetItem)
				aTD.InnerHtml = aBudgetCategory.GetPropertyString("Description").Trim() + _
								":&nbsp;"
				aTD.ColSpan = 1
			Else
				If aBudgetCategory.GetPropertyInt("ParentID") <> 0 Then
					aTD = Add_CellsToColumn(aTR, aIndent + 1)
					aTD.InnerHtml = "<b>" + _
									"Sub-total for&nbsp;" + _
										aBudgetCategory.GetPropertyString("Description").Trim() + _
										"</b>"
					aTD.ColSpan = 1
				Else
					If aIndent > 1 Then
						aTD = Add_CellsToColumn(aTR, aIndent - 1)
					Else
						aTD = Add_CellsToColumn(aTR, aIndent)
					End If
					aTD.InnerHtml = "<b>" + _
									aBudgetCategory.GetPropertyString("Description").Trim() + _
									"</b>"
					aTR.BgColor = "#EEEEEE"
					aTD.ColSpan = 2
				End If
				aIsSubTotal = True
				'aTD.ColSpan = 2
			End If
			aID = aBudgetCategory("BudgetCategoryID").ToString()
			aValue = cBudgetItem.Get_Amount(aBudgetItem).ToString()

			tblBudgetItems.Rows.Add(aTR)

			If aIndent + 1 > aRightMost Then aRightMost = aIndent + 1
			aTD = Add_CellsToColumn(aTR, aRightMost - (aTD.ColSpan - 1))
			If Not aTD Is Nothing Then
				If Not aBudgetCategory.GetPropertyBool("HasChild") Then
					aRightMost = aIndent + 1
					aTextBox = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cTextBox']").Attributes("ControlFile").Value), cTextBox)
					aTextBox.ID = aID
					aTextBox.Value = aValue
					aTextBox.Size = "10"
					aTextBox.MaxLength = "8"
					aTextBox.BaseTextBox.Style.Add("text-align", "right")
					aTD.Align = "right"
					aTD.InnerHtml = "$"
					Dim aValidator As BaseValidator
					aValidator = New RegularExpressionValidator()
					Dim aRegExValidator As RegularExpressionValidator = CType(aValidator, RegularExpressionValidator)
					aRegExValidator.ValidationExpression = "^[+]?\d*$"
					aValidator.ControlToValidate = aID

					aValidator.ErrorMessage = "Please enter a valid " & aBudgetCategory.GetPropertyString("Description") & " amount. Do not use decimals or commas."
					aValidator.Enabled = True
					aValidator.Display = ValidatorDisplay.None
					aTD.Controls.Add(aValidator)
					aTD.Controls.Add(aTextBox)

					'add Notes link
					If aBudgetCategory.GetPropertyBool("HasNotes") Then
						aTD = Add_CellsToColumn(aTR, aRightMost - (aTD.ColSpan - 1))
						aLink = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cLink']").Attributes("ControlFile").Value), cLink)
						aLink.ID = "lnk" + aID
						aLink.Caption = "Notes"
						aLink.CausesValidation = False
						aLink.Add_Attribute("BudgetCategoryID", aID)
						aLink.Set_ServerClick(AddressOf lnkBudgetItemNotes_Click)

						aTD.Controls.Add(aLink)

					End If
				Else
					aTD.Align = "right"
                    aTD.InnerHtml = "<b>$" + aValue + "</b>"  
				End If
			End If
			If aIsSubTotal Then
				aTR = New HtmlTableRow()
				tblBudgetItems.Rows.Add(aTR)
				'aTR = New HtmlTableRow()
				'tblBudgetItems.Rows.Add(aTR)
				'aTR = New HtmlTableRow()
				'tblBudgetItems.Rows.Add(aTR)
			End If
		Next
	End Sub

'=============================================================

	Public Overloads Overrides Function EventController_Save() As Boolean
		Dim aBudgetPeriodList As cDataObjectList
        aBudgetPeriodList = Me.DataObjectCollection("BudgetPeriod")

        Dim aBudgetPeriodDO As cDataObject
                ctlPeriod = CType(me.FindControl("ctlPeriod"), cDropDown)
		        'Dim i As Integer
		        'Dim aBudgetCategoryList As cDataObjectList
		        'For i = 1 To AwardTerm
			        'aBudgetPeriodDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("BudgetPeriod")
			        'aBudgetPeriodDO("BudgetID") = aBudget.GetPropertyInt("BudgetID")
                    'aBudgetPeriodDO = Me.DataObjectCollection("BudgetPeriod")
			        aBudgetPeriodList(0)("BudgetPeriodName") = "Budget Period " + ctlPeriod.SelectedValue
			        aBudgetPeriodList(0)("BudgetYear") = "Year " + ctlPeriod.SelectedValue
			        aBudgetPeriodList(0)("BudgetPeriodDescription") = "Budget Period " + ctlPeriod.SelectedValue
			        'aBudgetPeriodDO("BudgetPeriodDescriptionID") = ctlPeriod.SelectedValue
			        'aBudgetPeriodList(0).SaveData()
		        'Next

        MyBase.EventController_Save()

		If Page.IsValid Then
			Dim aURL As String
			If BudgetPeriodID = 0 Then
				'Dim aBudgetPeriodList As cDataObjectList
				Dim mBudgetPeriodID As Integer

				'aBudgetPeriodList = Me.DataObjectCollection("BudgetPeriod")
				mBudgetPeriodID = aBudgetPeriodList(0).GetRelatedPropertyInt("BudgetPeriodID")

				aURL = Request.RawUrl.ToString()
				aURL = cWebLib.AddQuerystringParameter(aURL, "BudgetPeriodID", mBudgetPeriodID)
				'Dim aUser As cEGUser
		        'aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
                Dim aBudget As cBudget
		        aBudget = CType(DataObjectCollection()("Budget")(0), cBudget)
                aURL = cWebLib.AddQuerystringParameter(aURL, "BudgetID", aBudget.GetPropertyString("BudgetID", "0"))

		        'mGranteeProject = CType(DataObjectCollection()("GranteeProject")(0), cGranteeProject)

		        'mAwardTerm = GranteeProject.GetRelatedPropertyInt("WfProject.AwardTerm", 0)

	         '   Dim aBudgetPeriodDO As cDataObject
          '      ctlPeriod = CType(me.FindControl("ctlPeriod"), cDropDown)
		        ''Dim i As Integer
		        ''Dim aBudgetCategoryList As cDataObjectList
		        ''For i = 1 To AwardTerm
			       ' 'aBudgetPeriodDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("BudgetPeriod")
			       ' 'aBudgetPeriodDO("BudgetID") = aBudget.GetPropertyInt("BudgetID")
          '          'aBudgetPeriodDO = Me.DataObjectCollection("BudgetPeriod")
			       ' aBudgetPeriodList(0)("BudgetPeriodName") = "Budget Period " + ctlPeriod.SelectedValue
			       ' aBudgetPeriodList(0)("BudgetYear") = "Year " + ctlPeriod.SelectedValue
			       ' aBudgetPeriodList(0)("BudgetPeriodDescription") = "Budget Period " + ctlPeriod.SelectedValue
			       ' 'aBudgetPeriodDO("BudgetPeriodDescriptionID") = ctlPeriod.SelectedValue
			       ' aBudgetPeriodList(0).SaveData()
		        ''Next

                CorePage.Redirect(aURL)
			End If

			'Dim aTextBox As cTextBox
			Dim aBudgetItem As cBudgetItem

			'For Each aBudgetItem In mBudgetItemlist
			'	aTextBox = CType(Me.FindControl(aBudgetItem("BudgetCategoryID")), cTextBox)
			'	aBudgetItem("BudgetCategoryID") = aTextBox.ID
			'	aBudgetItem("Amount") = aTextBox.Value
			'	aBudgetItem("BudgetPeriodID") = BudgetPeriod("BudgetPeriodID")
			'	Me.BudgetPeriod.Save_BudgetItem(aBudgetItem)

			'	If aBudgetItem("Notes") Is System.DBNull.Value And (aTextBox.Value.Trim() = "" Or aTextBox.Value.Trim() = "0") Then
			'		Me.BudgetPeriod.Delete_BudgetItem(aBudgetItem)
			'	End If
			'Next

			'Me.BudgetPeriod.CalculateBudget(mCategoryList)

			Dim aTotalCategoryID As String
			Dim aIndirectCategoryID As String
			Dim aGotTotal As Boolean = False
			Dim aGotIndirect As Boolean = False
			Dim aBudgetList as cDataObjectList
			Dim aGranteeProjectID as Integer
			Dim aWfProjectID as Integer

			Dim aBudgetItemList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItem", _
				"BudgetPeriodID", BudgetPeriodID)
			
			For Each aBudgetItem In aBudgetItemList
				If aBudgetItem.GetRelatedPropertyString("BudgetCategory.Description").Trim() = "Direct Costs" Then
					aTotalCategoryID = aBudgetItem.GetPropertyString("BudgetCategoryID")
					aGotTotal = True
				End If

				If aBudgetItem.GetRelatedPropertyString("BudgetCategory.Description").Trim() = "Indirect Costs" Then
					aIndirectCategoryID = aBudgetItem.GetPropertyString("BudgetCategoryID")
					aGotIndirect = True
				End If

				If aGotTotal = True And aGotIndirect = True Then Exit For
			Next

			If BudgetPeriod.Get_BudgetItem_Amount(aIndirectCategoryID) > BudgetPeriod.Get_BudgetItem_Amount(aTotalCategoryID) * IndirectCostLimit / 100 Then
				aURL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "BudgetError", "True")
				Response.Redirect(aURL)
			Else
				aURL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "BudgetError", "False")
			End If

			'Dim aBudget As cBudget
			'aBudget = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Budget", Me.BudgetPeriod.GetPropertyInt("BudgetID"))
			'aBudget.UpdateBudgetTotal()

			If mIsNotes Then
				mIsNotes = False
			Else
				If mIsSaveContinue Then
					mIsSaveContinue = False
					EventController_NavigateToModulePageKey(mPageKey)
				Else
					CorePage.Redirect(aURL)
				End If
			End If
		End If

	End Function

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
		ctlPeriodName = CType(Me.FindControl("ctlPeriod"), cDropDown)

		Dim iType As Integer
		iType = CType(ctlPeriodName.SelectedValue, Integer)

		Dim aBudget As cBudget
		aBudget = CType(DataObjectCollection()("Budget")(0), cBudget)

		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("BudgetPeriod", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "BudgetID", aBudget.GetPropertyString("BudgetID", "0")))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "BudgetPeriodNameID", iType))
		aDataObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

		If Not aDataObject Is Nothing Then
			If BudgetPeriodID > 0 Then
				If Me.BudgetPeriodID <> aDataObject.GetPropertyInt("BudgetPeriodID") Then
					ValidateDuplicateName = False
				End If
			Else
				ValidateDuplicateName = False
			End If
		End If
	End Function

'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
		Dim aTextBox As cTextBox
		Dim aBudgetItem As cBudgetItem

		For Each aBudgetItem In mBudgetItemlist
			aTextBox = CType(Me.FindControl(aBudgetItem("BudgetCategoryID")), cTextBox)
			aBudgetItem("BudgetCategoryID") = aTextBox.ID
			If aTextBox.Value.Trim() = "" Then
				aBudgetItem("Amount") = 0
			Else
				aBudgetItem("Amount") = aTextBox.Value
			End If
			aBudgetItem("BudgetPeriodID") = BudgetPeriod("BudgetPeriodID")
			aBudgetItem("GranteeProjectID") = Request.QueryString("GranteeProjectID")
			Me.BudgetPeriod.Save_BudgetItem(aBudgetItem)
		Next

		If BudgetPeriodID() > 0 Then
			Me.BudgetPeriod.CalculateBudget(mCategoryList)
		End If

		If mIsRecalculate Then
			mIsRecalculate = False
			CorePage.Redirect()
		Else
			MyBase.DataPresenter_SaveDataObjects()

			Dim aBudget As cBudget
			aBudget = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Budget", Me.BudgetPeriod.GetPropertyInt("BudgetID"))
			aBudget.UpdateBudgetTotal()
		End If
	End Sub

'=============================================================

	Public Sub RecalculateBudget()
		mIsRecalculate = True
		DataPresenter_SaveDataObjects()
	End Sub
'=============================================================

	Public Sub SaveContinue(ByVal aPageKey As String)
        mIsSaveContinue = True
		mPageKey = aPageKey
		EventController_Save()
	End Sub

'=============================================================

End Class 'cBudgetPeriod_Editor
End Namespace