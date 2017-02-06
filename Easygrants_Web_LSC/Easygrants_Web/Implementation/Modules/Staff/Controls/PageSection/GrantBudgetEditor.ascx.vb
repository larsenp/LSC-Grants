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

Namespace Easygrants_Web.Controls.PageSection
Public Class cGrantBudgetEditor
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
	Protected ctlBudgetType As cDropDown
	Protected ctlDescription As cTextBox


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

Public ReadOnly Property Budget() As cBudget
		Get
			Return mBudget
		End Get
	End Property

'Public Property BudgetCategoryList() As cDataObjectList
'	Get
'		Return mBudgetCategoryList
'	End Get
'	Set(ByVal value As cDataObjectList)
'		mBudgetCategoryList = value
'	End Set
'End Property

Public ReadOnly Property BudgetPeriodsList() As cDataObjectList
		Get
   '         if request.QueryString("BudgetPeriodID") = "" then
			'	return mBudgetPeriodsList 
			'else
			'	BudgetPeriodsList = CType(DataObjectCollection()("BudgetPeriod"), cDataObjectList)
			'end if 

		If Request.QueryString("BudgetID") = "0" Then
			Return mBudgetPeriodsList
		Else
			Dim BudgetDO As cDataObject
			BudgetDO = CType(DataObjectCollection()("Budget"), cDataObjectList)(0)
			'for each BudgetDO in BudgetList
				Dim BudgetPeriodList As cDataObjectList
				'BudgetPeriodList = BudgetDO.GetRelatedPropertyDataObjectList("BudgetPeriods")
				'if BudgetPeriodList.Count < 1 then
					BudgetPeriodsList = mBudgetPeriodsList
					'exit For
				'end if
			'next
		End If


		End Get
	End Property

	Public ReadOnly Property BudgetPeriod() As cBudgetPeriod
		Get
			Return mBudgetPeriod
		End Get
	End Property

Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		mGranteeProject = CType(DataObjectCollection()("GranteeProject")(0), cGranteeProject)
        
		mAwardTerm = GranteeProject.GetRelatedPropertyInt("WfProject.AwardTerm", 0)

		Dim BudgetDO As cDataObject
        Dim BudgetPeriodList As cDataObjectList
        Dim BudgetList As cDataObjectList

        if request.QueryString("BudgetID") <> "0" then
		    BudgetList = Me.WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("Budget", request.QueryString("BudgetID"))
        else
            BudgetList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("Budget", "GranteeProjectID", mGranteeProject.GetPropertyInt("GranteeProjectID", 0).ToString())
        end if
        If IsPostBack = True AndAlso BudgetList(0).GetPropertyString("BudgetID") <> "" Then
		    for each BudgetDO in BudgetList
                dim aBudgetItems as cDataObjectList = BudgetDO.GetRelatedPropertyDataObjectList("BudgetPeriods.BudgetItems")
				If aBudgetItems.Count = 0 Then
					mBudget = BudgetDO
				End If
                if request.QueryString("BudgetID") <> "0" then
                    mBudget = BudgetDO    
				End If
				BudgetPeriodList = BudgetDO.GetRelatedPropertyDataObjectList("BudgetPeriods")
            next
        Elseif not BudgetList is nothing AndAlso BudgetList.Count > 0 then
            for each BudgetDO in BudgetList
                if BudgetDO.GetRelatedPropertyDataObjectList("BudgetPeriods.BudgetItems") is nothing then
                    mBudget = BudgetDO        
                End If
                if request.QueryString("BudgetID") <> "0" then
                    mBudget = BudgetDO    
				End If
				BudgetPeriodList = BudgetDO.GetRelatedPropertyDataObjectList("BudgetPeriods")
            Next
	    End If
        If IsPostBack = False AndAlso request.QueryString("BudgetID") = "0" then
            BudgetDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Budget")
		    BudgetDO("BudgetTypeID") = 1  'defaulted to Application
            BudgetDO("GranteeProjectID") =  mGranteeProject.GetPropertyInt("GranteeProjectID", 0)
		    BudgetDO.SaveData()    
			mBudget = BudgetDO
		
		End If

		Dim aBudgetPeriodDO As cDataObject
		Dim i As Integer = 0
		If Not BudgetPeriodList Is Nothing Then
			i = BudgetPeriodList.Count
		End If
		For i = (i + 1) To 5
			aBudgetPeriodDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("BudgetPeriod")
			aBudgetPeriodDO("BudgetID") = Budget.GetPropertyInt("BudgetID")
			aBudgetPeriodDO("BudgetPeriodName") = "Budget Period " + i.ToString()
			aBudgetPeriodDO("BudgetPeriodNameID") = i
			aBudgetPeriodDO("BudgetYear") = "Year " + i.ToString()
			aBudgetPeriodDO("BudgetPeriodDescription") = "Budget Period " + i.ToString()
			aBudgetPeriodDO("BudgetPeriodDescriptionID") = i
			aBudgetPeriodDO.SaveData()
		Next
       
        BudgetPeriodList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetPeriod", "BudgetID", BudgetDO.GetPropertyInt("BudgetID", 0).ToString())
		'if BudgetPeriodList.Count > 0 then
		'    BudgetPeriodList = BudgetDO.GetRelatedPropertyDataObjectList("BudgetPeriods")
			mBudgetPeriodsList = BudgetPeriodList
		'End If


		mCategoryList = Get_TopLevel_Categories(mGranteeProject.GetPropertyInt("WfProjectID").ToString())

		Dim aRightMost As Integer = 1
		BuildBudgetItems(mCategoryList, 1, aRightMost)

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
        Dim aCount as Integer = 0

		'Dim bBudgetCategoryList As SortedList = New SortedList()

		For Each aBudgetCategory In aBudgetCategoryList
			aSortedList.Add(aBudgetCategory("SortOrder"), aBudgetCategory)
			'mBudgetCategoryList = bBudgetCategoryList
			'mBudgetCategoryList.Add(aBudgetCategory)
		Next

		If aBudgetCategoryList Is Nothing Then Exit Sub
		If aBudgetCategoryList.Count = 0 Then Exit Sub

		For Each aBudgetCategory In aSortedList.Values
			aIsSubTotal = False
			If aBudgetCategory.GetPropertyBool("HasChild") = True Then
				If aBudgetCategory.GetPropertyInt("ParentID") = 0 Then

						Dim aHeadingTR As New HtmlTableRow()
						Dim aBlankTR As New HtmlTableRow()

						Dim aTD1 As New HtmlTableCell()
						Dim aTD2 As New HtmlTableCell()
						Dim aTD3 As New HtmlTableCell()
						'Dim aTD4 As New HtmlTableCell()
						'Dim aTD5 As New HtmlTableCell()
						'Dim aTD6 As New HtmlTableCell()
						'Dim aTD7 As New HtmlTableCell()
						'Dim aTD8 As New HtmlTableCell()
                        Dim aBudgetPeriodListDO as cDataObject

						'mAwardTerm = GranteeProject.GetRelatedPropertyInt("WfProject.AwardTerm", 0)

                        
                        aTD1.InnerHtml = "<b>Project Year</b>"
						aTD1.Width = "25%"
                        aHeadingTR.Cells.Add(aTD1)

						if BudgetPeriodsList.Count > 0 then
                            for each aBudgetPeriodListDO in BudgetPeriodsList
                                aCount += 1
                                aTD = New HtmlTableCell()
                                aTD.ID = aCount
                                aTD.InnerHtml = "<b>" + aBudgetPeriodListDO.GetPropertyString("BudgetYear") + "</b>"
                                aTD.Align = "Right"
						        aTD.Width = "10%"
                                aHeadingTR.Cells.Add(aTD)

              '                  aTD2.InnerHtml = "<b>Year 1</b>"
						        'aTD2.Align = "Right"
						        'aTD2.Width = "10%"

						        'aTD3.InnerHtml = "<b>Year 2</b>"
						        'aTD3.Align = "Right"
						        'aTD3.Width = "10%"

						        'aTD4.InnerHtml = "<b>Year 3</b>"
						        'aTD4.Align = "Right"
						        'aTD4.Width = "10%"

						        'aTD5.InnerHtml = "<b>Year 4</b>"
						        'aTD5.Align = "Right"
						        'aTD5.Width = "10%"

						        'aTD6.InnerHtml = "<b>Year 5</b>"
						        'aTD6.Align = "Right"
						        'aTD6.Width = "10%"

						        
                            next
                        end if
                                
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

                                'aHeadingTR.Cells.Add(aTD2)
                                'aHeadingTR.Cells.Add(aTD3)

              '                  aTD7.InnerHtml = "<b>Total for All Years</b>"
						        'aTD7.Align = "Right"
						        'aTD7.Width = "15%"

						        'aTD8.InnerHtml = "&nbsp;"
						        'aTD8.Align = "Right"
						        'aTD8.Width = "10%"

      '                  aHeadingTR.Cells.Add(aTD1)
						'aHeadingTR.Cells.Add(aTD2)
						'aHeadingTR.Cells.Add(aTD3)
						'aHeadingTR.Cells.Add(aTD4)
						'aHeadingTR.Cells.Add(aTD5)
						'aHeadingTR.Cells.Add(aTD6)
						'aHeadingTR.Cells.Add(aTD7)
						'aHeadingTR.Cells.Add(aTD8)
                        
    
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
					aTD.BgColor = "#EEEEEE"
					aTD.ColSpan = 3 + 5
					tblBudgetItems.Rows.Add(aTR)
				End If


				BuildBudgetItems(CType(aBudgetCategory.GetRelatedPropertyValue("Children"), cDataObjectList), aIndent, aRightMost)

			End If


			aTR = New HtmlTableRow()
			aRowTotal = 0
			Dim aPeriodNumber As Integer = 1
			Dim aDO As cDataObject
			Dim i As Integer
			aValue = 0
			For i = 1 To 5
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
						aTD.InnerHtml = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp" + aBudgetCategory.GetPropertyString("Description").Trim() + _
										"&nbsp;"
						aTD.ColSpan = 1
					Else
						If aBudgetCategory.GetPropertyInt("ParentID") <> 0 Then
							aTD.InnerHtml = "<b>" + _
											"Subtotal " + _
												aBudgetCategory.GetPropertyString("Description").Trim() + _
												"</b>"
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
				'aTD = Add_CellsToColumn(aTR, aRightMost - (aTD.ColSpan - 1) + aPeriodNumber)
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


					If aPeriodNumber = 5 Then
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
					'If aBudgetCategory.GetPropertyInt("BudgetCategoryID") = 103 And BudgetPeriod.GetPropertyString("BudgetPeriodName") = "Budget Period 1" Then
					'Else
						aTD.InnerHtml = "<b>" + String.Format("{0:C}", aValue) + "</b>"
						aTD.Align = "right"
					'End If
				End If
				aPeriodNumber = aPeriodNumber + 1
			Next
			tblBudgetItems.Rows.Add(aTR)

			If aIsSubTotal Then
				'Row totals
				aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
				aTD.InnerHtml = "<b>" + String.Format("{0:C}", aRowTotal) + "</b>"
				aTD.Align = "right"
				'aTD.Width = "80"

				aTR = New HtmlTableRow()
				tblBudgetItems.Rows.Add(aTR)
			End If

		Next
End Sub

Public Sub lnkBudgetItemNotes_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		EventController_Save()
        dim aReturnURL as String = Request.Url.PathAndQuery
        aReturnURL = cWebLib.RemoveQuerystringParameter(aReturnURL, "BudgetID")
        
		EventController_NavigateToModulePageKey("BudgetItemNotesContent", "GranteeProjectID=" + Request.QueryString("GranteeProjectID").ToString, "BudgetID=" + Me.Budget.GetPropertyInt("BudgetID").ToString(), "ReturnURL=" + aReturnURL + "&BudgetID=" + Me.Budget.GetPropertyInt("BudgetID").ToString(), "ReturnPageKey=" + CType(WebSession.CurrentPage, cModulePage).PageKey, "BudgetCategoryID=" + aSrc.Attributes("BudgetCategoryID"), "BudgetPeriodID=" + BudgetPeriod.GetPropertyInt("BudgetPeriodID").ToString())
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
		Dim aCategoryID As Integer
		Dim aPeriodID As Integer
		Dim aIndex As Integer
		Dim aCtlID As String
		Dim aTextBox As cTextBox
		Dim aDropdown As cDropDown
		ctlDescription = CType(Me.FindControl("ctlDescription"), cTextBox)
		ctlBudgetType = CType(Me.FindControl("ctlBudgetType"), cDropDown)

		dim aBudgetID as String = request.QueryString("BudgetID")
        If not mBudget is nothing And Not mBudgetPeriodsList Is Nothing Then
			'If mBudgetPeriodsList.Count > 0 Then
				For Each aBudgetItem In mBudgetItemlist
					aCtlID = aBudgetItem.GetPropertyString("BudgetCategoryID") + "_" + aBudgetItem.GetRelatedPropertyInt("BudgetPeriod.BudgetPeriodDescriptionID").ToString()
					aTextBox = CType(Me.FindControl(aCtlID), cMoneyTextBox)

					aIndex = aTextBox.ID.IndexOf("_")
					aBudgetItem("BudgetCategoryID") = aTextBox.ID.Substring(0, aIndex)
					'aBudgetItem("BudgetPeriodID") = aTextBox.ID.Substring(aIndex + 1)

					If aTextBox.Value.Trim() = "" Then
						aBudgetItem("Amount") = 0
					Else
						aBudgetItem("Amount") = aTextBox.Value
					End If
					aBudgetItem("GranteeProjectID") = GranteeProjectID

					Me.BudgetPeriod.Save_BudgetItem(aBudgetItem)

					'If aBudgetItem("Notes") Is System.DBNull.Value And (aTextBox.Value.Trim() = "" Or aTextBox.Value.Trim() = "0") Then
					'	Me.BudgetPeriod.Delete_BudgetItem(aBudgetItem)
					'End If
				Next
				mBudget("BudgetTypeID") = ctlBudgetType.SelectedValue
				mBudget("Description") = ctlDescription.Value
				mBudget("ModifyDate") = System.DateTime.Now
				mBudget("ModifyUser") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).UserID
			'End If
		Else
			If mBudget Is Nothing Then
				mBudget = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Budget")
				mBudget("GranteeProjectID") = GranteeProject.GetPropertyInt("GranteeProjectID")
				mBudget("BudgetTypeID") = ctlBudgetType.SelectedValue
				mBudget("Description") = ctlDescription.Value
				mBudget("CreateDate") = System.DateTime.Now
				mBudget("CreateUser") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).UserID
				mBudget.SaveData()
			End If
			Dim aBudgetPeriodDO As cDataObject
			Dim i As Integer
			Dim aBudgetCategoryList As cDataObjectList
			If Not mBudgetPeriodsList Is Nothing Then
			i = mBudgetPeriodsList.Count
			End If
			For i = (i + 1) To 5
				aBudgetPeriodDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("BudgetPeriod")
				aBudgetPeriodDO("BudgetID") = Budget.GetPropertyInt("BudgetID")
				aBudgetPeriodDO("BudgetPeriodName") = "Budget Period " + i.ToString()
				aBudgetPeriodDO("BudgetYear") = "Year " + i.ToString()
				aBudgetPeriodDO("BudgetPeriodDescription") = "Budget Period " + i.ToString()
				aBudgetPeriodDO("BudgetPeriodDescriptionID") = i
				aBudgetPeriodDO.SaveData()
				'mBudgetPeriodsList.Add(aBudgetPeriodDO)
			Next
			mBudgetPeriod = (CType(aBudgetPeriodDO, cBudgetPeriod))
			mBudgetPeriodsList = mBudget.GetRelatedPropertyDataObjectList("BudgetPeriods")
			aBudgetCategoryList = BudgetPeriod.Get_TopLevel_Categories()
			SaveBudgetItems(aBudgetCategoryList)
			'aBudget = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Budget", Me.BudgetPeriod.GetPropertyInt("BudgetID"))
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
				EventController_NavigateToModulePageKey("BudgetEditor", "GranteeProjectID=" + Request.QueryString("GranteeProjectID").ToString(), "BudgetID=" + Me.Budget.GetPropertyInt("BudgetID").ToString(), "ReturnURL=" + Request.QueryString("ReturnURL").ToString())
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

	Dim aDO As cDataObject
	Dim aID As String
	Dim i As Integer
	Dim aTextBox As cTextBox
	For i = 1 To 5
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

Public Sub SaveBudgetItems1(ByVal aBudgetCategoryList As cDataObjectList)

Dim aBudgetCategory As cDataObject
Dim aBudgetItem As cBudgetItem
If aBudgetCategoryList Is Nothing Then Exit Sub
If aBudgetCategoryList.Count = 0 Then Exit Sub
Dim i As Integer
For i = 1 To 5
	Dim aDO As cDataObject
	Dim aID As String

	Dim aTextBox As cTextBox
	For Each aBudgetCategory In aBudgetCategoryList
		If aBudgetCategory.GetPropertyBool("HasChild") = True Then
			SaveBudgetItems1(CType(aBudgetCategory.GetRelatedPropertyValue("Children"), cDataObjectList))

		End If



		mBudgetPeriod = CType(mBudgetPeriodsList(i - 1), cBudgetPeriod)
		aBudgetItem = BudgetPeriod.Get_BudgetItem(aBudgetCategory.GetRelatedPropertyValue("BudgetCategoryID"), "new")
		aBudgetItem("BudgetPeriodID") = BudgetPeriod.GetPropertyInt("BudgetPeriodID")
		aBudgetItem("CategoryTypeID") = aBudgetCategory.GetPropertyInt("CategoryTypeID", 0)

		If Not aBudgetCategory.GetPropertyBool("HasChild") Then
		aID = aBudgetCategory("BudgetCategoryID").ToString() + "_" + i.ToString()
		aTextBox = CType(Me.FindControl(aID), cTextBox)
		aBudgetItem("Amount") = aTextBox.Value
		Me.BudgetPeriod.Save_BudgetItem(aBudgetItem)
		End If


	Next

Next

End Sub

Public Sub Close(ByVal aReturnURL as String)
    Dim aBudgetPeriodDOL As cDataObjectList
    Dim aBudgetDOL As cDataObjectList
    Dim aBudgetDO, aBudgetPeriodDO as cDataObject
    Dim aBudgetID as String

    'because we save the budget and budget period records on load, we need to delete those records and redirect if no data is saved for budget
    '  otherwise, we just redirect (kda, 7/24/08)
    if request.QueryString("BudgetID") = "0" then
        aBudgetDOL = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("Budget", "GranteeProjectID", mGranteeProject.GetPropertyInt("GranteeProjectID", 0).ToString())  
        if aBudgetDOL.Count > 0 then
            aBudgetID = aBudgetDOL(aBudgetDOL.Count - 1).GetPropertyString("BudgetID", "")
            aBudgetPeriodDOL = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetPeriod", "BudgetID", aBudgetID) 
            me.WebSession.DataObjectFactory.DeleteData(aBudgetPeriodDOL)  
            me.WebSession.DataObjectFactory.DeleteData(aBudgetDOL(aBudgetDOL.Count - 1))  
        End If
    end if
    me.EventController_NavigateToURL(aReturnURL)
   
End Sub


End Class
End Namespace
