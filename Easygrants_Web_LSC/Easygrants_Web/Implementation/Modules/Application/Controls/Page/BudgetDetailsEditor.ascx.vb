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
Namespace Easygrants_Web.Implementation.Modules.Application.Controls.Page
    Public Class cBudgetDetailsEditor
        Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

        Protected tblBudgetItems As HtmlTable
        Private mAwardTerm As Integer
        Private mGranteeProject As cGranteeProject
        Private mCategoryList As cDataObjectList
        Private mBudget As cBudget
        Private mBudgetPeriod As cBudgetPeriod
        Private mIsRecalculate As Boolean
        Private mBudgetPeriodsList As cDataObjectList
        Private mBudgetItemlist As ArrayList = New ArrayList()
        Private mBudgetCategoryList As cDataObjectList
        Dim objBudget As cDataObjectList
        Dim BudgetPeriodList As cDataObjectList
		Dim BudgetID As Integer
		Private WfProjectDOL As cDataObjectList
		Protected btnContinue As cCSSButton
		Protected btnContinueNextPage As cCSSButton
		Protected btnCancel As cCSSButton


        Public ReadOnly Property GranteeProject() As cGranteeProject
            Get
                Return mGranteeProject
            End Get
        End Property
        Public ReadOnly Property Budget() As cBudget
            Get
                Return mBudget
            End Get
        End Property
        Public ReadOnly Property BudgetPeriod() As cBudgetPeriod
            Get
                Return mBudgetPeriod
            End Get
        End Property
        Public ReadOnly Property BudgetPeriodsList() As cDataObjectList
            Get
                Return mBudgetPeriodsList
            End Get
        End Property
        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)
            mGranteeProject = CType(DataObjectCollection()("GranteeProject")(0), cGranteeProject)

            mAwardTerm = GranteeProject.GetRelatedPropertyInt("WfProject.AwardTerm", 0)

            Dim BudgetDO As cDataObject
            Dim BudgetList As cDataObjectList
			If Request.QueryString("BudgetID") > 0 Then
				objBudget = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Budget", "GranteeProjectID", CType(CType(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID.ToString, _
							"BudgetID", Request.QueryString("BudgetID"), "BudgetTypeID", "1")
				Me.DataObjectCollection.Remove("Budget")
				Me.DataObjectCollection.Add("Budget", objBudget)
			Else
				objBudget = CType(DataObjectCollection()("Budget"), cDataObjectList)
			End If

            If objBudget.Count > 0 Then
                BudgetID = objBudget(0).GetPropertyInt("BudgetID")
            Else
                BudgetID = 0
            End If

            If BudgetID <> 0 Then
                BudgetList = Me.WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("Budget", BudgetID)
            Else
                BudgetList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("Budget", "GranteeProjectID", mGranteeProject.GetPropertyInt("GranteeProjectID", 0).ToString(), "BudgetTypeID", "1")
            End If
            If IsPostBack = True AndAlso BudgetList(0).GetPropertyString("BudgetID") <> "" Then
                For Each BudgetDO In BudgetList
                    Dim aBudgetItems As cDataObjectList = BudgetDO.GetRelatedPropertyDataObjectList("BudgetPeriods.BudgetItems")
                    If aBudgetItems.Count = 0 Then
                        BudgetPeriodList = BudgetDO.GetRelatedPropertyDataObjectList("BudgetPeriods")
                        mBudgetPeriodsList = BudgetPeriodList
                        mBudget = BudgetDO
                    End If
                    If BudgetID > 0 Then
                        mBudget = BudgetDO
                    End If
                Next
            ElseIf Not BudgetList Is Nothing AndAlso BudgetList.Count > 0 Then
                For Each BudgetDO In BudgetList
                    If BudgetDO.GetRelatedPropertyDataObjectList("BudgetPeriods.BudgetItems") Is Nothing Then
                        mBudget = BudgetDO
                    End If
                    If BudgetID > 0 Then
                        mBudget = BudgetDO
                    End If
                Next
			End If
			WfProjectDOL = Me.DataObjectCollection("WfProject")
            If IsPostBack = False AndAlso BudgetID = 0 Then
                BudgetDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Budget")
                BudgetDO("BudgetTypeID") = 1  'defaulted to Application
                BudgetDO("GranteeProjectID") = mGranteeProject.GetPropertyInt("GranteeProjectID", 0)
                BudgetDO.SaveData()
                mBudget = BudgetDO
				mBudgetPeriodsList = BudgetDO.GetRelatedPropertyDataObjectList("BudgetPeriods")


                Dim aBudgetPeriodDO As cDataObject
                Dim i As Integer = 0
                If Not BudgetPeriodsList Is Nothing Then
                    i = BudgetPeriodsList.Count
                End If
				For i = (i + 1) To WfProjectDOL(0).GetPropertyInt("AwardTerm", 0)
					aBudgetPeriodDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("BudgetPeriod")
					aBudgetPeriodDO("BudgetID") = Budget.GetPropertyInt("BudgetID")
					aBudgetPeriodDO("BudgetPeriodName") = "Budget Period " + i.ToString()
					aBudgetPeriodDO("BudgetPeriodNameID") = i
					aBudgetPeriodDO("BudgetYear") = "Year " + i.ToString()
					aBudgetPeriodDO("BudgetPeriodDescription") = "Budget Period " + i.ToString()
					aBudgetPeriodDO("BudgetPeriodDescriptionID") = i
					aBudgetPeriodDO.SaveData()
				Next
            End If

			mBudgetPeriodsList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetPeriod", "BudgetID", BudgetDO.GetPropertyInt("BudgetID", 0).ToString())
			'If BudgetPeriodList.Count > 0 Then
			'    'BudgetPeriodList = BudgetDO.GetRelatedPropertyDataObjectList("BudgetPeriods")
			'    mBudgetPeriodsList = BudgetPeriodList
			'End If

            mCategoryList = Get_TopLevel_Categories(mGranteeProject.GetPropertyInt("WfProjectID").ToString())

            Dim aRightMost As Integer = 1
			BuildBudgetItems(mCategoryList, 1, aRightMost)

			btnContinueNextPage = Me.FindControl("btnContinueNextPage")
			btnContinue = Me.FindControl("btnContinue")
			btnCancel = Me.FindControl("btnCancel")

			If Request.QueryString("ReturnURL") = "" Then
				btnContinueNextPage.Visible = True
				btnContinue.Visible = False
				btnCancel.Visible = False
			Else
				btnContinueNextPage.Visible = False
				btnContinue.Visible = True
				btnCancel.Visible = True
			End If

        End Sub
        Public Function Get_TopLevel_Categories(ByVal ProjectID As String) As cDataObjectList
            Dim aXmlDoc As cXMLDoc
            Dim aDataObjectNode, aFiltersNode, aArgNode As XmlNode

            aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("BudgetCategory", aDataObjectNode, aFiltersNode)
            aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ProjectID", ProjectID.ToString()))
            aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ParentID", 0.ToString(), "And"))

            Return WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
        End Function
		Public Sub BuildBudgetItems(ByVal aBudgetCategoryList As cDataObjectList, _
		 ByVal aIndent As Integer, ByRef aRightMost As Integer)
			Dim aBudgetCategory As cDataObject
			Dim aTR As HtmlTableRow
			Dim aTD As HtmlTableCell
			Dim aBudgetItem As cBudgetItem
			Dim aID As String
			Dim aID2 As String
			Dim aValue As Double
			Dim aTextBox As cMoneyTextBox
			Dim aLink As cLink
			Dim aLabel As cLabel
			Dim aSortedList As SortedList = New SortedList()
			Dim aIsSubTotal As Boolean
			Dim aRowTotal As Double
			Dim intDirectTotal As Integer = 0
			Dim aCount As Integer = 0

			For Each aBudgetCategory In aBudgetCategoryList
				aSortedList.Add(aBudgetCategory("SortOrder"), aBudgetCategory)
			Next

			If aBudgetCategoryList Is Nothing Then Exit Sub
			If aBudgetCategoryList.Count = 0 Then Exit Sub


			For Each aBudgetCategory In aSortedList.Values
				aIsSubTotal = False
				If aBudgetCategory.GetPropertyBool("HasChild") = True Then
					If aBudgetCategory.GetPropertyInt("ParentID") = 0 Then

						Dim aHeadingTR As New HtmlTableRow()
						Dim aBlankTR As New HtmlTableRow()

						aHeadingTR.BgColor = "#EEEEEE"

						Dim aTD1 As New HtmlTableCell()
						Dim aTD2 As New HtmlTableCell()
						Dim aTD3 As New HtmlTableCell()
						'Dim aBudgetPeriodListDO As cDataObject

						aTD1.InnerHtml = "<b>Project Year</b>"
						aTD1.Width = "25%"
						aHeadingTR.Cells.Add(aTD1)

						If BudgetPeriodsList.Count > 0 Then
						  For j As Integer = 1 To WfProjectDOL(0).GetPropertyInt("AwardTerm", 0)
								aCount += 1
								aTD = New HtmlTableCell()
								aTD.ID = aCount
								aTD.InnerHtml = "<b>" + "Year " & j.ToString + "</b>"
								aTD.Align = "Right"
								aTD.Width = "10%"
								aHeadingTR.Cells.Add(aTD)
							Next
						End If

						aTD = New HtmlTableCell()
						aTD.InnerHtml = "<b>Total for All Years</b>"
						aTD.Align = "Right"
						aTD.Width = "15%"
						aHeadingTR.Cells.Add(aTD)

						aTD = New HtmlTableCell()
						aTD.InnerHtml = "&nbsp;"
						aTD.Align = "Right"
						aTD.Width = "10%"
						aHeadingTR.Cells.Add(aTD)
						aTD = New HtmlTableCell()
						aTD.InnerHtml = "&nbsp;"
						aBlankTR.Cells.Add(aTD)

						tblBudgetItems.Rows.Add(aHeadingTR)
						tblBudgetItems.Rows.Add(aBlankTR)

					End If

					If aBudgetCategory.GetPropertyInt("ParentID") <> 0 Then
						aTR = New HtmlTableRow()
						aTD = Add_CellsToColumn(aTR, aIndent)
						aTD.InnerHtml = "<b>" + _
							 aBudgetCategory.GetPropertyString("Description").Trim() + _
							 "</b>"
						'aTD.BgColor = "#EEEEEE"
						aTD.ColSpan = 3 + 5
						tblBudgetItems.Rows.Add(aTR)
					End If
					BuildBudgetItems(CType(aBudgetCategory.GetRelatedPropertyValue("Children"), cDataObjectList), aIndent, aRightMost)
				End If

				aTR = New HtmlTableRow()
				aRowTotal = 0
				Dim aPeriodNumber As Integer = 1
				'Dim aDO As cDataObject
				Dim i As Integer
				aValue = 0
				For i = 1 To WfProjectDOL(0).GetPropertyInt("AwardTerm", 0)
					'showing the saved data - edit mode
					If Not aBudgetCategory.GetPropertyBool("HasChild") Then
						aID2 = aBudgetCategory("BudgetCategoryID").ToString() + "_" + i.ToString()
					End If

					If Not mBudgetPeriodsList Is Nothing Then
						If Not mBudgetPeriodsList(i - 1) Is Nothing Then
							mBudgetPeriod = CType(mBudgetPeriodsList(i - 1), cBudgetPeriod)
							aBudgetItem = BudgetPeriod.Get_BudgetItem(aBudgetCategory.GetRelatedPropertyValue("BudgetCategoryID"), True)

							If Not aBudgetCategory.GetPropertyBool("HasChild") Then
								'aID2 = aBudgetCategory("BudgetCategoryID").ToString() + "_" + BudgetPeriod("BudgetPeriodID").ToString()
								mBudgetItemlist.Add(aBudgetItem)
							End If
							aBudgetItem("BudgetPeriodID") = BudgetPeriod.GetPropertyInt("BudgetPeriodID")
							aBudgetItem("CategoryTypeID") = aBudgetCategory.GetPropertyInt("CategoryTypeID", 0)

							aValue = cBudgetItem.Get_Amount(aBudgetItem)
							aRowTotal = aRowTotal + aBudgetItem.GetPropertyDouble("Amount", 0)
						Else 'add mode 
							aValue = 0
						End If
					End If

					If aPeriodNumber = 1 Then
						aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
						If Not aBudgetCategory.GetPropertyBool("HasChild") Then
							aTD.InnerHtml = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + aBudgetCategory.GetPropertyString("Description").Trim() + _
								"&nbsp;"
							aTD.ColSpan = 1
						Else
							If aBudgetCategory.GetPropertyInt("ParentID") <> 0 Then
								aTD.InnerHtml = "<b>" + _
									"Subtotal " + _
									 aBudgetCategory.GetPropertyString("Description").Trim() + _
									 "</b>"
								If intDirectTotal = 0 Then intDirectTotal = 1
							Else
								aTD.InnerHtml = "<b>" + _
									aBudgetCategory.GetPropertyString("Description").Trim() + _
									"</b>"
								'aTR.BgColor = "#EEEEEE"
							End If
							aIsSubTotal = True
							aTD.ColSpan = 1

						End If
						aID = aBudgetCategory("BudgetCategoryID").ToString()
					End If

					If aIndent + 1 > aRightMost Then aRightMost = aIndent + 1
					aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
					If Not aBudgetCategory.GetPropertyBool("HasChild") Then
						aRightMost = aIndent + 1
						aTextBox = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cMoneyTextBox']").Attributes("ControlFile").Value), cMoneyTextBox)
						aTextBox.ID = aID2
						aTextBox.Value = aValue.ToString()
						aTextBox.Size = 7
						aTextBox.MaxLength = 9
						aTextBox.BaseTextBox.Style.Add("text-align", "right")
						aTextBox.MaxInputDecimalPlaces = 2
						aTextBox.DecimalErrorMessage = aBudgetCategory.GetPropertyString("Description") + " " + "Year " + i.ToString() + " requires a valid currency format (Example: 100,000.00)."
						aTextBox.RegExErrorMessage = aBudgetCategory.GetPropertyString("Description") + " " + "Year " + i.ToString() + " requires a valid currency format (Example: 100,000.00)."
						aTD.InnerHtml = "$"
						aTD.Controls.Add(aTextBox)
						aTD.Align = "right"
						If aPeriodNumber = WfProjectDOL(0).GetPropertyInt("AwardTerm", 0) Then
							'Row totals
							aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
							aTD.InnerHtml = "<b>" + String.Format("{0:C}", aRowTotal) + "</b>"
							aTD.Align = "right"
							'aTD.Width = "80"

							'add Notes link
							If aBudgetCategory.GetPropertyBool("HasNotes") Then
								'aTD = Add_CellsToColumn(aTR, aRightMost - (aTD.ColSpan - 1) + aPeriodNumber + 1)
								aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
								If Me.Budget Is Nothing Then
									aLabel = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cLabel']").Attributes("ControlFile").Value), cLabel)
									aLabel.ID = "lbl" + aID
									aLabel.Value = ""
									aTD.Controls.Add(aLabel)
								Else
									aLink = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cLink']").Attributes("ControlFile").Value), cLink)
									aLink.ID = "lnk" + aID
									aLink.Caption = "Notes"
									aLink.CausesValidation = False
									aLink.Add_Attribute("BudgetCategoryID", aID)
									aLink.Set_ServerClick(AddressOf lnkBudgetItemNotes_Click)
									aTD.Controls.Add(aLink)

								End If

							End If
						End If
					Else
						aTD.InnerHtml = "<b>" + String.Format("{0:C}", aValue) + "</b>"
						aTD.Align = "right"
					End If
					aPeriodNumber = aPeriodNumber + 1
				Next
				tblBudgetItems.Rows.Add(aTR)

				If aIsSubTotal Then
					' Dim aSubTR As HtmlTableRow
					'Row totals
					aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
					aTD.InnerHtml = "<b>" + String.Format("{0:C}", aRowTotal) + "</b>"
					aTD.Align = "right"
					aTR = New HtmlTableRow()
					tblBudgetItems.Rows.Add(aTR)

					If aBudgetCategory.GetPropertyInt("ParentID") = 0 Then
						aTR = New HtmlTableRow()
						aTD = New HtmlTableCell()
						aTD = Add_CellsToColumn(aTR, aIndent)
						aTD.InnerHtml = "<hr>"
						aTD.ColSpan = 3 + 5
						tblBudgetItems.Rows.Add(aTR)
					Else
						If intDirectTotal = 1 Then
							intDirectTotal = 2
							'aSubTR = New HtmlTableRow()
							aTR = New HtmlTableRow()
							aTD = New HtmlTableCell()
							aTD = Add_CellsToColumn(aTR, aIndent)
							aTD.InnerHtml = "&nbsp;"
							aTD.ColSpan = 3 + 5
							tblBudgetItems.Rows.Add(aTR)

							aTR = New HtmlTableRow()
							aTD = New HtmlTableCell()
							aTD = Add_CellsToColumn(aTR, aIndent)
							aTD.InnerHtml = "<hr>"
							aTD.ColSpan = 3 + 5
							tblBudgetItems.Rows.Add(aTR)
						ElseIf intDirectTotal = 2 Then
							aTR = New HtmlTableRow()
							aTD = New HtmlTableCell()
							aTD = Add_CellsToColumn(aTR, aIndent)
							aTD.InnerHtml = "&nbsp;"
							aTD.ColSpan = 3 + 5
							tblBudgetItems.Rows.Add(aTR)

						End If
					End If
				End If

			Next
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
        Public Overrides Sub DataPresenter_SaveDataObjects()

            Dim aBudgetItem As cBudgetItem
			'Dim aCategoryID As Integer
			'Dim aPeriodID As Integer
            Dim aIndex As Integer
            Dim aCtlID As String
            Dim aTextBox As cTextBox
			'Dim aDropdown As cDropDown

            'Dim aBudgetID As String = Request.QueryString("BudgetID")
            If Not mBudget Is Nothing And Not mBudgetPeriodsList Is Nothing Then
                'If mBudgetPeriodsList.Count > 0 Then
                For Each aBudgetItem In mBudgetItemlist
                    aCtlID = aBudgetItem.GetPropertyString("BudgetCategoryID") + "_" + aBudgetItem.GetRelatedPropertyInt("BudgetPeriod.BudgetPeriodDescriptionID").ToString()
                    aTextBox = CType(Me.FindControl(aCtlID), cMoneyTextBox)

                    aIndex = aTextBox.ID.IndexOf("_")
                    aBudgetItem("BudgetCategoryID") = aTextBox.ID.Substring(0, aIndex)
                    If aTextBox.Value.Trim() = "" Then
                        aBudgetItem("Amount") = 0
                    Else
                        aBudgetItem("Amount") = aTextBox.Value
                    End If
                    aBudgetItem("GranteeProjectID") = GranteeProjectID

                    Me.BudgetPeriod.Save_BudgetItem(aBudgetItem)

                Next
                mBudget("BudgetTypeID") = 1
                mBudget("ModifyDate") = System.DateTime.Now
                mBudget("ModifyUser") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).UserID
            Else
                If mBudget Is Nothing Then
                    mBudget = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Budget")
                    mBudget("GranteeProjectID") = GranteeProject.GetPropertyInt("GranteeProjectID")
                    mBudget("BudgetTypeID") = 1
                    mBudget("CreateDate") = System.DateTime.Now
                    mBudget("CreateUser") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).UserID
                    mBudget.SaveData()
                End If
                Dim aBudgetPeriodDO As cDataObject
                Dim i As Integer
                Dim aBudgetCategoryList As cDataObjectList
				'For i = 1 To WfProjectDOL(0).GetPropertyInt("AwardTerm", 0)
				'	aBudgetPeriodDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("BudgetPeriod")
				'	aBudgetPeriodDO("BudgetID") = Budget.GetPropertyInt("BudgetID")
				'	aBudgetPeriodDO("BudgetPeriodName") = "Budget Period " + i.ToString()
				'	aBudgetPeriodDO("BudgetYear") = "Year " + i.ToString()
				'	aBudgetPeriodDO("BudgetPeriodDescription") = "Budget Period " + i.ToString()
				'	aBudgetPeriodDO("BudgetPeriodDescriptionID") = i
				'	aBudgetPeriodDO.SaveData()
				'Next
                mBudgetPeriod = (CType(aBudgetPeriodDO, cBudgetPeriod))
                mBudgetPeriodsList = mBudget.GetRelatedPropertyDataObjectList("BudgetPeriods")
                aBudgetCategoryList = BudgetPeriod.Get_TopLevel_Categories()
                SaveBudgetItems(aBudgetCategoryList)
            End If

            Dim aDO As cDataObject
            For Each aDO In mBudgetPeriodsList
                mBudgetPeriod = CType(aDO, cBudgetPeriod)

                If BudgetPeriod.GetPropertyInt("BudgetPeriodID", 0) > 0 Then
                    Me.BudgetPeriod.CalculateBudget(mCategoryList)
                End If
            Next
            Me.Budget.UpdateBudgetTotal()
            If mIsRecalculate Then
                mIsRecalculate = False
				EventController_NavigateToModulePageKey(Request.QueryString("Page"), "BudgetID=" & Budget.GetPropertyInt("BudgetID"), "ReturnURL=" & Request.QueryString("ReturnURL"))
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

				'Dim aDO As cDataObject
                Dim aID As String
                Dim i As Integer
                Dim aTextBox As cTextBox
				For i = 1 To WfProjectDOL(0).GetPropertyInt("AwardTerm", 0)
					mBudgetPeriod = CType(mBudgetPeriodsList(i - 1), cBudgetPeriod)
					aBudgetItem = BudgetPeriod.Get_BudgetItem(aBudgetCategory.GetRelatedPropertyValue("BudgetCategoryID"), "new")
					aBudgetItem("BudgetPeriodID") = BudgetPeriod.GetPropertyInt("BudgetPeriodID")
					aBudgetItem("CategoryTypeID") = aBudgetCategory.GetPropertyInt("CategoryTypeID", 0)
					aBudgetItem("CreateUser") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).UserID
					aBudgetItem("CreateDate") = System.DateTime.Now

					If Not aBudgetCategory.GetPropertyBool("HasChild") Then
						aID = aBudgetCategory("BudgetCategoryID").ToString() + "_" + i.ToString()
						aTextBox = CType(Me.FindControl(aID), cTextBox)
						aBudgetItem("Amount") = aTextBox.Value
						Me.BudgetPeriod.Save_BudgetItem(aBudgetItem)
					End If
				Next
            Next
		End Sub

		Public Sub lnkBudgetItemNotes_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
			EventController_Save()
			EventController_NavigateToModulePageKey("BudgetItemNotes", "ReturnURL=" + Request.Url.PathAndQuery, "ReturnPageKey=" + CType(WebSession.CurrentPage, cModulePage).PageKey, "BudgetCategoryID=" + aSrc.Attributes("BudgetCategoryID"), "BudgetPeriodID=" + BudgetPeriod.GetPropertyInt("BudgetPeriodID").ToString())
		End Sub
    End Class
End Namespace
