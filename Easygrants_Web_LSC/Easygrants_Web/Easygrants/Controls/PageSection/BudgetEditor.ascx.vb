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

Namespace Easygrants_Web.Controls.PageSection
Public Class cBudgetEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================

    Protected tblBudgetItems As HtmlTable
    Private mAwardTerm As Integer
    Private mGranteeProject As cGranteeProject
    Private mCategoryList As cDataObjectList
    Private mBudget As cBudget
    Private mBudgetPeriod As cBudgetPeriod
    Private mBudgetPeriodsList As cDataObjectList
    Private mBudgetItemlist As ArrayList = New ArrayList()
	Private mIsRecalculate As Boolean
	Protected tblBudget as HtmlTable
	Protected tblOtherBudget as HtmlTable
    
    
    Public Readonly Property AwardTerm As Integer
        Get
            return mAwardTerm       
        End Get
    End Property    

    Public Readonly Property GranteeProject as cGranteeProject
        Get
            return mGranteeProject       
        End Get
    End Property    
    
    Public Readonly Property Budget as cBudget
        Get
            return mBudget       
        End Get
    End Property    

    Public Readonly Property BudgetPeriodsList as cDataObjectList
        Get
   '         if request.QueryString("BudgetPeriodID") = "" then
			'	return mBudgetPeriodsList 
			'else
			'	BudgetPeriodsList = CType(DataObjectCollection()("BudgetPeriod"), cDataObjectList)
			'end if 
			
		if request.QueryString("BudgetPeriodID") = "" then
			return mBudgetPeriodsList
		else
			dim BudgetDO as cDataObject
			BudgetDO = CType(DataObjectCollection()("Budget"), cDataObjectList)(0)
			'for each BudgetDO in BudgetList
				dim BudgetPeriodList as cDataObjectList
				'BudgetPeriodList = BudgetDO.GetRelatedPropertyDataObjectList("BudgetPeriods")
				'if BudgetPeriodList.Count < 1 then
					BudgetPeriodsList = BudgetDO.GetRelatedPropertyDataObjectList("BudgetPeriods")
					'exit For
				'end if
			'next
		end if
			
			     
        End Get        
    End Property    

    Public Readonly Property BudgetPeriod as cBudgetPeriod
        Get
            return mBudgetPeriod       
        End Get        
    End Property    

'--------------------------------------------------------------------------------

    Public ReadOnly Property BudgetPeriodID() As Integer
        Get
			If Request.QueryString("BudgetPeriodID") Is Nothing Then Return 0
            If Request.QueryString("BudgetPeriodID") = "" Then Return 0

            Return Convert.ToInt32(Request.QueryString("BudgetPeriodID"))
        End Get
    End Property
    
'--------------------------------------------------------------------------------

    Public Readonly Property BudgetPeriodDescriptionID as Integer
        get
            if request.QueryString("BudgetPeriodDescriptionID") = "" then
				Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
				select case aUser.WfTaskID
					case 50
						return 1
					case 51
						return 2
					case 52
						return 3
					case 53
						return 4
					case 54
						return 5
				end select  
			else
				BudgetPeriodDescriptionID = Convert.ToInt32(Request.QueryString("BudgetPeriodDescriptionID"))
			end if    
        End Get        
    End Property    

'-----------------------------------------------------

        Public Overrides Sub LoadConfigXML()
            MyBase.LoadConfigXML()
           	
           		'need to change save and continue, cancel config for grants budget editor
				
				if request.QueryString("BudgetPeriodID") = "0" then
					Dim aDataObjectElement As XmlElement = me.mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='Base']")
					dim aDataListControlNode as XmlNode
					dim aDPControlNode as XmlNode
					
					'hide Save And Continue for grants budget editor
					tblBudget.Visible = False
					tblOtherBudget.Visible = True
			
					'change cancel method to NavigateToURL		
					aDPControlNode = aDataObjectElement.SelectSingleNode("DisplayProperties/DisplayProperty/Control[@ID='btnCancel1']")
					dim aActionNode as XmlNode = aDPControlNode.SelectSingleNode("Action")
					dim aParametersNode as XmlNode = aActionNode.SelectSingleNode("Parameters")
					dim aArgumentNode as XmlNode = aParametersNode.SelectSingleNode("Argument")
					aActionNode.Attributes("Method").Value = "EventController_NavigateToURL"
					aParametersNode.RemoveChild(aArgumentNode)
					dim aNewArgElement as XmlElement
					'Dim aXMLDoc As cXMLDoc = New cXMLDoc()
					aNewArgElement = me.mXMLDoc.XMLDocument.CreateElement("Argument")
					aNewArgElement.SetAttribute("Type", "QueryString")
					aNewArgElement.SetAttribute("TypeKey", "ReturnURL")
					aParametersNode.AppendChild(aNewArgElement)
				end if
        End Sub
	

'=============================================================

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)

		mGranteeProject = CType(DataObjectCollection()("GranteeProject")(0), cGranteeProject)
		mAwardTerm = GranteeProject.GetRelatedPropertyInt("WfProject.AwardTerm", 0)
		
		dim BudgetDO as cDataObject
		dim BudgetList as cDataObjectList = CType(DataObjectCollection()("Budget"), cDataObjectList)
		if BudgetList.Count = 0 then
			mBudget = CType(GranteeProject.GetRelatedPropertyDataObject("Budget"), cBudget)
			mBudget = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Budget")
			mBudget("GranteeProjectID") = GranteeProject.GetPropertyInt("GranteeProjectID")
			mBudget("BudgetTypeID") = 2 'Recommended ???
			mBudget("Description") = mAwardTerm.ToString() + " Years Budget"
			mBudget("CreateDate") = System.DateTime.Now
			mBudget.SaveData()
			mBudgetPeriodsList = Budget.GetRelatedPropertyDataObjectList("BudgetPeriods")
		else
			for each BudgetDO in BudgetList
				dim BudgetPeriodList as cDataObjectList
				BudgetPeriodList = BudgetDO.GetRelatedPropertyDataObjectList("BudgetPeriods")
				if BudgetList.Count > 1 and BudgetPeriodList.Count < 1 then
					mBudgetPeriodsList = BudgetPeriodList
					mBudget = BudgetDO
					exit For
				elseif (BudgetList.Count > 1 and BudgetPeriodList.Count > 1) And request.QueryString("BudgetTypeID") = "" then
					mBudgetPeriodsList = BudgetPeriodList
					mBudget = BudgetDO
					exit For
				elseif (BudgetList.Count > 1 and BudgetPeriodList.Count > 1) And request.QueryString("BudgetTypeID") <> "" then
					BudgetDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Budget", request.QueryString("BudgetID"))
					'if BudgetList.Count > 0 then 
						mBudgetPeriodsList = BudgetDO.GetRelatedPropertyDataObjectList("BudgetPeriods")
						mBudget = BudgetDO
						exit For
					'end if
				else
					mBudgetPeriodsList = BudgetPeriodList
					mBudget = BudgetDO
				end if
			next		
		
		end if
	
		If mBudgetPeriodsList.Count < 1 Then
			Dim aBudgetPeriodDO As cDataObject
			Dim i As Integer
			For i = 1 To AwardTerm
				aBudgetPeriodDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("BudgetPeriod")
				aBudgetPeriodDO("BudgetID") = Budget.GetPropertyInt("BudgetID")
				aBudgetPeriodDO("BudgetPeriodName") = "Budget Period " + i.ToString()
				aBudgetPeriodDO("BudgetYear") = "Year " + i.ToString()
				aBudgetPeriodDO("BudgetPeriodDescription") = "Budget Period " + i.ToString()
				aBudgetPeriodDO("BudgetPeriodDescriptionID") = i
				aBudgetPeriodDO.SaveData()
				mBudgetPeriodsList.Add(aBudgetPeriodDO)
				If i=1 Then
					mBudgetPeriod = CType(aBudgetPeriodDO, cBudgetPeriod)
				End If
			Next
		Else
			mBudgetPeriod = CType(mBudgetPeriodsList(0), cBudgetPeriod)
		End If        

		mCategoryList = BudgetPeriod.Get_TopLevel_Categories()

		Dim aRightMost As Integer = 1
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
		EventController_Save()
        EventController_NavigateToModulePageKey("BudgetItemNotes", "ReturnURL=" + Request.Url.PathAndQuery, "ReturnPageKey=" + CType(WebSession.CurrentPage, cModulePage).PageKey, "BudgetCategoryID=" + aSrc.Attributes("BudgetCategoryID"), "BudgetPeriodID=" + BudgetPeriod.GetPropertyInt("BudgetPeriodID").ToString())
    End Sub

'-----------------------------------------------------

    Public Sub BuildBudgetItems(ByVal aBudgetCategoryList As cDataObjectList, _
                                    ByVal aIndent As Integer, ByRef aRightMost As Integer)
        Dim aBudgetCategory As cDataObject
        Dim aTR As HtmlTableRow
        Dim aTD As HtmlTableCell
        Dim aBudgetItem As cBudgetItem
		Dim aID As String
		Dim aID2 As String
		Dim aValue As String
		Dim aTextBox As cMoneyTextBox
        Dim aLink As cLink
        Dim aSortedList As SortedList = New SortedList()
        Dim aIsSubTotal As Boolean
        Dim aRowTotal As Double
		
        For Each aBudgetCategory In aBudgetCategoryList
            aSortedList.Add(aBudgetCategory("SortOrder"), aBudgetCategory)
        Next

        If aBudgetCategoryList Is Nothing Then Exit Sub
        If aBudgetCategoryList.Count = 0 Then Exit Sub

        For Each aBudgetCategory In aSortedList.Values
			aIsSubTotal = False
            If aBudgetCategory.GetPropertyBool("HasChild") = True Then
                aTR = New HtmlTableRow()

                aTD = Add_CellsToColumn(aTR, aIndent)
                
                
						dim aHeadingTR1 as New HtmlTableRow()
						dim aHeadingTR2 as New HtmlTableRow()
						dim aBlankTR as New HtmlTableRow()
						
						dim aTD1 as New HtmlTableCell()
						dim aTD2 as New HtmlTableCell()
						dim aTD3 as New HtmlTableCell()
						dim aTD4 as New HtmlTableCell()
						dim aTD5 as New HtmlTableCell()
						dim aTD6 as New HtmlTableCell()
						dim aTD7 as New HtmlTableCell()
						dim aTD8 as New HtmlTableCell()
						dim aTD9 as New HtmlTableCell()
						
						'aHeadingTR1 = New HtmlTableRow
						'aHeadingTR2 = New HtmlTableRow
						
						'aTD1 = New HtmlTableCell()
						'aTD2 = New HtmlTableCell()
						'aTD3 = New HtmlTableCell()
						'aTD4 = New HtmlTableCell()
						'aTD5 = New HtmlTableCell()
						'aTD6 = New HtmlTableCell()
						'aTD7 = New HtmlTableCell()
						'aTD8 = New HtmlTableCell()
						
						'aTD2 = Add_CellsToColumn(aTR2, aTR2.Cells.Count + 1)
						
						'aTR2 = New HtmlTableRow
						'aTD2 = New HtmlTableCell()
						aTD1.InnerHtml = "&nbsp;"
						
						aTD2.InnerHtml = "<b>Year 1</b>"
						aTD2.Align = "Right"
						
						aTD3.InnerHtml = "<b>Year 2</b>"
						aTD3.Align = "Right"
						
						aTD4.InnerHtml = "<b>Year 3</b>"
						aTD4.Align = "Right"
						
						aTD5.InnerHtml = "<b>Year 4</b>"
						aTD5.Align = "Right"
						
						aTD6.InnerHtml = "<b>Year 5</b>"
						aTD6.Align = "Right"
						
						aTD7.InnerHtml = "<b>Total for</b><br>"
						aTD7.ColSpan = 7
						aTD7.Align = "Right"
						
						aTD8.InnerHtml = "<b>All Years</b><br>"
						aTD8.Align = "Right"
						
						aTD9.InnerHtml = "&nbsp;"
						aTD9.ColSpan = 8
						
						aHeadingTR1.Cells.Add(aTD7)
						
						aHeadingTR2.Cells.Add(aTD1)
						aHeadingTR2.Cells.Add(aTD2)
						aHeadingTR2.Cells.Add(aTD3)
						aHeadingTR2.Cells.Add(aTD4)
						aHeadingTR2.Cells.Add(aTD5)
						aHeadingTR2.Cells.Add(aTD6)
						aHeadingTR2.Cells.Add(aTD8)
						
						aBlankTR.Cells.Add(aTD9)
						
						tblBudgetItems.Rows.Add(aHeadingTR1)
						tblBudgetItems.Rows.Add(aHeadingTR2)
						tblBudgetItems.Rows.Add(aBlankTR)

						
						'aTR2.Cells.Add(aTD)
						'aTR2.Cells.Add(aTD2)
						'tblBudgetItems.Rows.Add(aTR2)
						
						'aTR.Cells.Add(aTD2)
						'tblBudgetItems.Rows.Add(aTR2)
						
                If aBudgetCategory.GetPropertyInt("ParentID") <> 0 Then
                    aTD.InnerHtml = "<b>" + _
                                        aBudgetCategory.GetPropertyString("Description").Trim() + _
                                        "</b>"
                    aTD.BgColor = "#EEEEEE"
                    aTD.ColSpan = 2 + mAwardTerm
                    tblBudgetItems.Rows.Add(aTR)
                End If

                BuildBudgetItems(CType(aBudgetCategory.GetRelatedPropertyValue("Children"), cDataObjectList), aIndent, aRightMost)
            End If
            
            
   '         if aBudgetCategory.GetPropertyBool("HasChild") = False then
					
			'			aTR2 = New HtmlTableRow
			'			aTD2 = New HtmlTableCell()
						
			'			aTD2 = Add_CellsToColumn(aTR2, aTR2.Cells.Count + 1)
						
			'			'aTD2 = New HtmlTableCell()
			'			aTD2.InnerHtml = "<b>" + BudgetPeriod.GetPropertyString("BudgetYear") + "</b>"
			'			aTD2.Align = "Right"
			'			'aTR2.Cells.Add(aTD)
			'			'aTR2.Cells.Add(aTD2)
			'			'tblBudgetItems.Rows.Add(aTR2)
			'end if
            
            
            
            aTR = New HtmlTableRow()
            
            
   '       
            
            'aTR = New HtmlTableRow()
            

			aRowTotal = 0
			Dim aPeriodNumber As Integer = 1
			Dim aDO As cDataObject
			For Each aDO In mBudgetPeriodsList
				mBudgetPeriod = CType(aDO, cBudgetPeriod)

				If BudgetPeriod.GetPropertyInt("BudgetPeriodID") = 0 Then
					aBudgetItem = BudgetPeriod.Get_BudgetItem(aBudgetCategory.GetRelatedPropertyValue("BudgetCategoryID"), "new")
				Else
					aBudgetItem = BudgetPeriod.Get_BudgetItem(aBudgetCategory.GetRelatedPropertyValue("BudgetCategoryID"), True)
				End If
				
				aBudgetItem("BudgetPeriodID") = BudgetPeriod.GetPropertyInt("BudgetPeriodID")
				aBudgetItem("CategoryTypeID") = aBudgetCategory.GetPropertyInt("CategoryTypeID", 0)

				If Not aBudgetCategory.GetPropertyBool("HasChild") Then
					if aBudgetCategory.GetPropertyInt("BudgetCategoryID") = 107 and BudgetPeriod.GetPropertyString("BudgetPeriodName") = "Budget Period 1" then
					else
						mBudgetItemlist.Add(aBudgetItem)
					end if
				End If

				aValue = cBudgetItem.Get_Amount(aBudgetItem).ToString()
				aRowTotal = aRowTotal + aBudgetItem.GetPropertyDouble("Amount", 0)

				If aPeriodNumber = 1 Then
					'aTD = Add_CellsToColumn(aTR, aIndent)
					aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
					If Not aBudgetCategory.GetPropertyBool("HasChild") Then
						aTD.InnerHtml = aBudgetCategory.GetPropertyString("Description").Trim() + _
										":&nbsp;"
						aTD.ColSpan = 1
					Else
						If aBudgetCategory.GetPropertyInt("ParentID") <> 0 Then
							aTD.InnerHtml = "<b>" + _
											"Sub-Total for " + _
												aBudgetCategory.GetPropertyString("Description").Trim() + _
												"</b>"
						Else
							aTD.InnerHtml = "<b>" + _
											aBudgetCategory.GetPropertyString("Description").Trim() + _
											"</b>"
							aTR.BgColor = "#EEEEEE"
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

					
						
					
					if aBudgetCategory.GetPropertyInt("BudgetCategoryID") = 107 and BudgetPeriod.GetPropertyString("BudgetPeriodName") = "Budget Period 1" then
					else	
					
						aID2 = aBudgetCategory("BudgetCategoryID").ToString() + "_" + BudgetPeriod("BudgetPeriodID").ToString()
						
						
						
						aTextBox = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cMoneyTextBox']").Attributes("ControlFile").Value), cMoneyTextBox)
						aTextBox.ID = aID2
						aTextBox.Value = aValue
						aTextBox.Size = 7
						aTextBox.MaxLength = 9
						aTextBox.BaseTextBox.Style.Add("text-align", "right")
						aTextBox.MaxInputDecimalPlaces = 2
						aTextBox.DecimalErrorMessage = "You can only enter up to 2 decimals (ex. 100.25)."
						aTextBox.RegExErrorMessage = "Only numbers are allowed for " + aBudgetCategory.GetPropertyString("Description") + " " + BudgetPeriod.GetPropertyString("BudgetYear") + "."
						
						aTD.InnerHtml = "$"
						'Dim aValidator As BaseValidator
						'aValidator = New RegularExpressionValidator()
						'Dim aRegExValidator As RegularExpressionValidator = CType(aValidator, RegularExpressionValidator)
						'aRegExValidator.ValidationExpression = "^[+]?\d*$"
						'aValidator.ControlToValidate = aID2

						'aValidator.ErrorMessage = "Please enter a valid " & aBudgetCategory.GetPropertyString("Description") & " amount. Do not use decimals or commas."
						'aValidator.Enabled = True
						'aValidator.Display = ValidatorDisplay.None
						'aTD.Controls.Add(aValidator)
						aTD.Controls.Add(aTextBox)
						aTD.Align = "right"
					end if
					
					If aPeriodNumber = mAwardTerm Then
						'Row totals
						aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
						aTD.InnerHtml = "<b>$" + aRowTotal.ToString() + "</b>"
						aTD.Align = "right"
						aTD.Width = "80"
			
						'add Notes link
						If aBudgetCategory.GetPropertyBool("HasNotes") Then
							'aTD = Add_CellsToColumn(aTR, aRightMost - (aTD.ColSpan - 1) + aPeriodNumber + 1)
							aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
							aLink = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cLink']").Attributes("ControlFile").Value), cLink)
							aLink.ID = "lnk" + aID
							aLink.Caption = "Notes"
							aLink.CausesValidation = False
							aLink.Add_Attribute("BudgetCategoryID", aID)
							aLink.Set_ServerClick(AddressOf lnkBudgetItemNotes_Click)
							aTD.Controls.Add(aLink)
						End If
					End If
				Else
					if aBudgetCategory.GetPropertyInt("BudgetCategoryID") = 103 and BudgetPeriod.GetPropertyString("BudgetPeriodName") = "Budget Period 1" then
					else
						aTD.InnerHtml = "<b>$" + aValue + "</b>"
						aTD.Align = "right"
					end if
				End If
				aPeriodNumber = aPeriodNumber + 1
			Next

			tblBudgetItems.Rows.Add(aTR)
			
            If aIsSubTotal Then
				'Row totals
				aTD = Add_CellsToColumn(aTR, aTR.Cells.Count + 1)
				aTD.InnerHtml = "<b>$" + aRowTotal.ToString() + "</b>"
				aTD.Align = "right"
				aTD.Width = "80"
						
				aTR = New HtmlTableRow()
				tblBudgetItems.Rows.Add(aTR)
			End If
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
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "BudgetPeriodDescriptionID", iType))
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
		Dim aTextBox As cMoneyTextBox
		Dim aBudgetItem As cBudgetItem
		Dim aCategoryID As Integer
		Dim aPeriodID As Integer
		Dim aIndex As Integer
		Dim aCtlID As String

		For Each aBudgetItem In mBudgetItemlist
			aCtlID = aBudgetItem.GetPropertyString("BudgetCategoryID") + "_" + aBudgetItem.GetPropertyString("BudgetPeriodID")
			aTextBox = CType(Me.FindControl(aCtlID), cMoneyTextBox)
		
			aIndex = aTextBox.ID.IndexOf("_")
			aBudgetItem("BudgetCategoryID") = aTextBox.ID.Substring(0, aIndex)
			aBudgetItem("BudgetPeriodID") = aTextBox.ID.Substring(aIndex+1)
			
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
		
		Dim aDO As cDataObject
		For Each aDO In mBudgetPeriodsList
			mBudgetPeriod = CType(aDO, cBudgetPeriod)

			If BudgetPeriod.GetPropertyInt("BudgetPeriodID", 0) > 0 Then
				Me.BudgetPeriod.CalculateBudget(mCategoryList)
			End If
		Next

		If mIsRecalculate Then
			mIsRecalculate = False
			CorePage.Redirect()
		Else
			MyBase.DataPresenter_SaveDataObjects()

			Dim aBudget As cBudget
			aBudget = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Budget",Me.BudgetPeriod.GetPropertyInt("BudgetID"))
			aBudget.UpdateBudgetTotal()
                aBudget("ModifyDate") = Date.Now
			aBudget.SaveData()
		End If

	End Sub

'=============================================================

	Public Sub RecalculateBudget()
		mIsRecalculate = True
		DataPresenter_SaveDataObjects()
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

'=============================================================
End Class 'cBudgetEditor
End Namespace