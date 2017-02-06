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
Public Class cBudgetPeriodReport_Editor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================

    Protected tblBudgetItems As HtmlTable
    Protected tblBudgetPeriod As HtmlTable
    Protected tblSaveClose As HtmlTable
    Protected tblText As HtmlTable
    
    Private mCategoryList As cDataObjectList
    Private mBudgetPeriod As cBudgetPeriod
    Private mBudgetItemlist As ArrayList = New ArrayList()
	Private mBudgetUploadVisible As Boolean
	Private mIsRecalculate As Boolean
    
'--------------------------------------------------------------------------------

    Public Readonly Property BudgetPeriod as cBudgetPeriod
        get
            return mBudgetPeriod       
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


'=============================================================

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)

		Dim aBudgetItem As cBudgetItem
		Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
        
        If aUser.AccessLevel > 1 Then
            Dim aCtl As cUpload
            aCtl = CType(Me.FindControl("ctlBudgetUpload"), cUpload)
            aCtl.Visible = False
            tblSaveClose.Visible = False
        End If

		If aUser.AccessLevel < 2 Then
            tblBudgetPeriod.Visible = False
            tblText.Visible = True
        End If

        Dim aBudget As cBudget
        Dim aRightMost As Integer = 1

        'mBudgetPeriod = CType(DataObjectCollection()("BudgetPeriod")(0), cBudgetPeriod)

        'aBudget = CType(DataObjectCollection()("Budget")(0), cBudget)
             
        dim BudgetDO as cDataObject
        dim BudgetPeriodDO as cDataObject
		dim BudgetList as cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Budget", "GranteeProjectID", aUser.GranteeProjectID.ToString(), "BudgetTypeID", "1")
		if BudgetList.Count > 0 then
			dim BudgetPeriodList as cDataObjectList
			dim BudgetID as Integer = BudgetList(0).GetPropertyInt("BudgetID")
			BudgetPeriodList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetPeriod", "BudgetID", BudgetID.ToString(), "BudgetPeriodDescriptionID", BudgetPeriodDescriptionID.ToString())
			if BudgetPeriodList.Count > 0 then
				mBudgetPeriod = BudgetPeriodList(0)
				aBudget = BudgetList(0)
				'exit For
			end if		
		end if
        
        mCategoryList = BudgetPeriod.Get_TopLevel_Categories()

		dim aTR as HtmlTableRow = new HtmlTableRow()
		dim aTD as HtmlTableCell = new HtmlTableCell()
		aTD = Add_CellsToColumn(aTR, 4)
		aTD.InnerHtml = "<b>Proposed Budget</b>"
		aTD.NoWrap = True
		aTR.Cells.Add(aTD)
		aTD  = new HtmlTableCell()
		aTR.Cells.Add(aTD)
		aTD  = new HtmlTableCell()
		aTD.InnerHtml = "<b>Actual Expenses to date</b>"
		aTD.NoWrap = True
        aTD.Align = "Right"
		aTR.Cells.Add(aTD)
		tblBudgetItems.Rows.Add(aTR)
				
        BuildBudgetItems(mCategoryList, 1, aRightMost)
        
        'aTR  = new HtmlTableRow()
        'aTD = Add_CellsToColumn(aTR, 3)
  '      dim aDate as String = aUser.WfTaskAssignmentObject.GetRelatedPropertyFormattedString("DueDate", "M/d/yyyy")
        
  '      if aDate = "" then
		'	aDate = aUser.WfTaskAssignmentObject.GetRelatedPropertyFormattedString("WfProjectTask.DueDate", "M/d/yyyy")
  '      end if
        
		'aTD.InnerHtml = "<b>Total Actual</b> <" + aDate + ">"
		'aTD.NoWrap = True
		'aTR.Cells.Add(aTD)
		aTD  = new HtmlTableCell()
		aTR.Cells.Add(aTD)
		aTD  = new HtmlTableCell()
		
		If BudgetPeriod.GetPropertyInt("BudgetPeriodID", 0) = 0 Then
            aBudgetItem = BudgetPeriod.Get_BudgetItem(mCategoryList(0).GetRelatedPropertyValue("BudgetCategoryID"), "new")
        Else
            aBudgetItem = BudgetPeriod.Get_BudgetItem(mCategoryList(0).GetRelatedPropertyValue("BudgetCategoryID"), True)
        End If
        
        mBudgetItemlist.Add(aBudgetItem)
  '      dim aID as String = mCategoryList(0)("BudgetCategoryID").ToString()
  '      dim aTextBox as cTextBox = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cTextBox']").Attributes("ControlFile").Value), cTextBox)
  '      aTextBox.ID = aID
        
  '      if request.QueryString("Total") is nothing then
		'	dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItemExpense", _
		'		"BudgetItemID", aBudgetItem.GetPropertyString("BudgetItemID"), "TaskID", aUser.WfTaskID)
			
		'	if aList.Count > 0 then
		'		aTextBox.Value = aList(0).GetPropertyDouble("Expense", 0)
		'	end if
		'else
		'	aTextBox.Value = request.QueryString("Total")
		'end if
		'aTextBox.Size = "10"
		'aTextBox.BaseTextBox.Style.Add("text-align", "right")

		'aTD.InnerHtml = "$"
		'Dim aValidator As BaseValidator
		'aValidator = New RegularExpressionValidator()
		'Dim aRegExValidator As RegularExpressionValidator = CType(aValidator, RegularExpressionValidator)
		'aRegExValidator.ValidationExpression = "^[+]?\d*$"
  '      aValidator.ControlToValidate = aID

  '      aValidator.ErrorMessage = "Please enter a valid " & mCategoryList(0).GetPropertyString("Description") & " amount. Do not use decimals or commas."
  '      aValidator.Enabled = True
  '      aValidator.Display = ValidatorDisplay.None
  '      aTD.Controls.Add(aValidator)
  '      aTD.Controls.Add(aTextBox)
        
  '      aTR.Cells.Add(aTD)
		'tblBudgetItems.Rows.Add(aTR)
		
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
		Dim aTextBox As cTextBox
		Dim aTextBox2 As cTextBox
        Dim aLink As cLink
        Dim aSortedList As SortedList = New SortedList()
        Dim aIsSubTotal As Boolean
		Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
        dim aArray as ArrayList
        
		'commented out following because baseline is not saving these data points, kda 3/24/06   
		'if aUser.WfTaskID > 8 then
			'dim aObj as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", _
			'	aUser.GranteeProjectID.ToString())
				
			'dim aPeriodID as String = aObj.GetRelatedPropertyString("Budget.BudgetPeriods.BudgetPeriodID")
			'aObj = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("BudgetPeriod", _
			'	aPeriodID)	
			'aArray = new ArrayList()
			'aArray.Add(aObj.GetPropertyString("TotalSalary"))
			'aArray.Add(aObj.GetPropertyString("TotalMaterials"))
			'aArray.Add(aObj.GetPropertyString("TotalEquipment"))
			'aArray.Add(aObj.GetPropertyString("TotalTravel"))
			'aArray.Add(aObj.GetPropertyString("TotalOther"))
			'aArray.Add(aObj.GetPropertyString("IndirectCosts"))
			'aArray.Add(aObj.GetPropertyString("GrandTotal"))
   '     end if
        
        For Each aBudgetCategory In aBudgetCategoryList
            aSortedList.Add(aBudgetCategory("SortOrder"), aBudgetCategory)
        Next

        If aBudgetCategoryList Is Nothing Then Exit Sub
        If aBudgetCategoryList.Count = 0 Then Exit Sub
		dim aIndex as Integer = 0
		
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
                    aTD.ColSpan = 5
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
                    aTD.InnerHtml = "<b>" + _
                                    "Sub-Total for&nbsp;" + _
                                        aBudgetCategory.GetPropertyString("Description").Trim() + _
                                        "</b>"
                Else
                    aTD.InnerHtml = "<b>" + _
                                    aBudgetCategory.GetPropertyString("Description").Trim() + _
                                    "</b>"
                    aTD.Align = "right"
                    aTR.BgColor = "#EEEEEE"
                End If
				aIsSubTotal = True
                aTD.ColSpan = 2
            End If
			aID = aBudgetCategory("BudgetCategoryID").ToString()
			aID2 = aBudgetItem("BudgetItemID").ToString()

			'commented out following because baseline is not using the array, kda 3/24/06 
			'if aUser.WfTaskID > 8 then
				'aValue = aArray(aIndex)
				'aIndex = aIndex + 1
			'else
				'gets budget item amount for "Proposed budget" column totals
				aValue = cBudgetItem.Get_Amount(aBudgetItem).ToString()
			'end if
			
			
			
			'else
			'	dim aTaskList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTask", _
			'		"WfTaskID", aUser.WfTaskID.ToString())
					
			'	if aTaskList.Count > 0 then
			'		aTaskList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTask", _
			'			"SortOrder", (aTaskList(0).GetPropertyInt("SortOrder", 0) - 1).ToString(), "WfTaskTypeID", "3")
			'	end if
				
			'	if aTaskList.Count > 0 then
			'		dim aExpenseList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItemExpense", _
			'			"BudgetItemID", aBudgetItem.GetPropertyInt("BudgetItemID", 0), "TaskID", aTaskList(0).GetPropertyString("WfTaskID"))
					
			'		if aExpenseList.Count > 0 then
			'			aValue = aExpenseList(0).GetPropertyDouble("Expense")
			'		else
			'			aValue = 0
			'		end if
			'	end if
			'end if
			
            tblBudgetItems.Rows.Add(aTR)

            If aIndent + 1 > aRightMost Then aRightMost = aIndent + 1
            aTD = Add_CellsToColumn(aTR, aRightMost - (aTD.ColSpan - 1))
            If Not aTD Is Nothing Then
                If Not aBudgetCategory.GetPropertyBool("HasChild") Then
                    aRightMost = aIndent + 1

					aTD.Align = "right"
					
					aTD.InnerHtml = "$" + aValue
					
					aTD = Add_CellsToColumn(aTR, aRightMost - (aTD.ColSpan - 1))
                    aTextBox = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cTextBox']").Attributes("ControlFile").Value), cTextBox)
                    aTextBox.ID = aID
                    dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItemExpense", _
						"BudgetItemID", aBudgetItem.GetPropertyInt("BudgetItemID", 0), "TaskID", aUser.WfTaskID.ToString())
					
					'gets totals for "Actual Expenses to date" column in budget, kda 3/24/06
					if aList.Count > 0 then
						aTextBox.Value = aList(0).GetPropertyDouble("Expense")
                    end if
                    
					aTextBox.Size = "10"
					aTextBox.BaseTextBox.Style.Add("text-align", "right")

					aTD.Align = "Right"
                    aTD.InnerHtml = "$"

					'Dim aValidator As BaseValidator
					'aValidator = New RegularExpressionValidator()
					'Dim aRegExValidator As RegularExpressionValidator = CType(aValidator, RegularExpressionValidator)
					'aRegExValidator.ValidationExpression = "^[+]?\d*$"
     '               aValidator.ControlToValidate = aID

     '               aValidator.ErrorMessage = "Please enter a valid " & aBudgetCategory.GetPropertyString("Description") & " amount. Do not use decimals or commas."
     '               aValidator.Enabled = True
     '               aValidator.Display = ValidatorDisplay.None
     '               aTD.Controls.Add(aValidator)
     '               aTD.Controls.Add(aTextBox)

                    'add Notes link
                    'If aBudgetCategory.GetPropertyBool("HasNotes") Then
                    '    aTD = Add_CellsToColumn(aTR, aRightMost - (aTD.ColSpan - 1))
                    '    aLink = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cLink']").Attributes("ControlFile").Value), cLink)
                    '    aLink.ID = "lnk" + aID
                    '    aLink.Caption = "Notes"
                    '    aLink.Add_Attribute("BudgetCategoryID", aID)
                    '    aLink.Set_ServerClick(AddressOf lnkBudgetItemNotes_Click)

                    '    aTD.Controls.Add(aLink)

                    'End If
				Else
					'if aUser.WfTaskID > 8 then
						'aTD.InnerHtml = "<b>$" + aArray(6) + "</b>"
					'else
						aTD.InnerHtml = "<b>$" + aValue + "</b>"
					'end if
					aTD.Align = "right"
					aTD.Width = "100"
                    aTR.Cells.Add(aTD)

 
                    'dim aBudgetItemDO as cDataObject
                    'if aList.Count = 0 then
                         'aBudgetItemDO = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("BudgetItem", aID2)
                    'end if

                    'If (aID = 1 or aID = 200 or aID = 218) then
                    if aBudgetCategory.GetPropertyString("Description").Trim() = "Total" then
                        dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItemExpense", _
				            "BudgetItemID", aID2, "TaskID", aUser.WfTaskID)
                        aTextBox = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cTextBox']").Attributes("ControlFile").Value), cTextBox)
                        if request.QueryString("Total") is nothing then
			                'dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItemExpense", _
				               ' "BudgetItemID", aBudgetItem.GetPropertyString("BudgetItemID"), "TaskID", aUser.WfTaskID)
			                if aList.Count > 0 then
				                aTextBox.Value = aList(0).GetPropertyDouble("Expense", 0)
			                end if
		                else
			                aTextBox.Value = request.QueryString("Total")
		                end if

                        aTextBox.ID = aID + "expense"
		                aTextBox.Size = "10"
		                aTextBox.BaseTextBox.Style.Add("text-align", "right")

		                aTD = New HtmlTableCell()
                        aTD.InnerHtml = "&nbsp;"
                        aTR.Cells.Add(aTD)
                        
                        aTD = New HtmlTableCell()
                        aTD.InnerHtml = "&nbsp;"
                        aTD.Align = "Right"
                        aTD.InnerHtml = "$"

		                'Dim aValidator As BaseValidator
		                'aValidator = New RegularExpressionValidator()
		                'Dim aRegExValidator As RegularExpressionValidator = CType(aValidator, RegularExpressionValidator)
		                'aRegExValidator.ValidationExpression = "^[+]?\d*$"
                  '      aValidator.ControlToValidate = aID + "expense"

                  '      aValidator.ErrorMessage = "Please enter a valid " & mCategoryList(0).GetPropertyString("Description") & " amount. Do not use decimals or commas."
                  '      aValidator.Enabled = True
                  '      aValidator.Display = ValidatorDisplay.None
                  '      aTD.Controls.Add(aValidator)
                  '      aTD.Controls.Add(aTextBox)
                  '      aTR.Cells.Add(aTD)                   
                    End If


                 '  If aList.Count > 0 AndAlso (aID = 1 or aID = 200 or aID = 218) Then

                  '      aTextBox = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cTextBox']").Attributes("ControlFile").Value), cTextBox)

                  '      aTextBox.ID = aID + "expense"
                  '  'Else 

                  '  '    aTextBox = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cTextBox']").Attributes("ControlFile").Value), cTextBox)

                  '  '    aTextBox.ID = aID + "expense"

                                         
                  '      if request.QueryString("Total") is nothing then
			               ' 'dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItemExpense", _
				              ' ' "BudgetItemID", aBudgetItem.GetPropertyString("BudgetItemID"), "TaskID", aUser.WfTaskID)
                			
			               ' if aList.Count > 0 then
				              '  aTextBox.Value = aList(0).GetPropertyDouble("Expense", 0)
			               ' end if
		                'else
			               ' aTextBox.Value = request.QueryString("Total")
		                'end if

		                'aTextBox.Size = "10"
		                'aTextBox.BaseTextBox.Style.Add("text-align", "right")

		                'aTD = New HtmlTableCell()
                  '      aTD.InnerHtml = "&nbsp;"
                  '      aTR.Cells.Add(aTD)
                        
                  '      aTD = New HtmlTableCell()
                  '      aTD.InnerHtml = "&nbsp;"
                  '      aTD.Align = "Right"
                  '      aTD.InnerHtml = "$"

		                'Dim aValidator As BaseValidator
		                'aValidator = New RegularExpressionValidator()
		                'Dim aRegExValidator As RegularExpressionValidator = CType(aValidator, RegularExpressionValidator)
		                'aRegExValidator.ValidationExpression = "^[+]?\d*$"
                  '      aValidator.ControlToValidate = aID + "expense"

                  '      aValidator.ErrorMessage = "Please enter a valid " & mCategoryList(0).GetPropertyString("Description") & " amount. Do not use decimals or commas."
                  '      aValidator.Enabled = True
                  '      aValidator.Display = ValidatorDisplay.None
                  '      aTD.Controls.Add(aValidator)
                  '      aTD.Controls.Add(aTextBox)
                  '      aTR.Cells.Add(aTD)
                  '  End if
				End If



                if not aTextBox is nothing then
                    'aTextBox.ID = aID + "expense"
	                'aTextBox.Size = "10"
	                'aTextBox.BaseTextBox.Style.Add("text-align", "right")

	                'aTD = New HtmlTableCell()
                 '   aTD.InnerHtml = "&nbsp;"
                 '   aTR.Cells.Add(aTD)
                    
                 '   aTD = New HtmlTableCell()
                 '   aTD.InnerHtml = "&nbsp;"
                 '   aTD.Align = "Right"
                 '   aTD.InnerHtml = "$"

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
                end if


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

		'If Not mIsRecalculate Then
		'	MyBase.DataPresenter_SaveDataObjects()

		'	Dim aBudget As cBudget
		'	aBudget = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Budget",Me.BudgetPeriod.GetPropertyInt("BudgetID"))
		'	aBudget.UpdateBudgetTotal()
		'End If

		'if BudgetPeriodID = 0 then exit Sub



		Dim aTextBox As cTextBox
		Dim aBudgetItem As cBudgetItem
		dim aExpense as cDataObject
		dim aID as Integer
		Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
        	
		For Each aBudgetItem In mBudgetItemlist
            if aBudgetItem.GetRelatedPropertyString("BudgetCategory.Description").Trim() = "Total" then
			    aTextBox = CType(Me.FindControl(aBudgetItem.GetRelatedPropertyInt("BudgetCategory.BudgetCategoryID").ToString() + "expense"), cTextBox)
                aBudgetItem("BudgetCategoryID") = aBudgetItem.GetRelatedPropertyInt("BudgetCategory.BudgetCategoryID")
            else
                aTextBox = CType(Me.FindControl(aBudgetItem("BudgetCategoryID")), cTextBox)
                aBudgetItem("BudgetCategoryID") = aTextBox.ID
            end if
			'if not aTextBox is nothing then
                
			    If aTextBox.Value.Trim() <> "" Then
				    dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItemExpense", _
					    "BudgetItemID", aBudgetItem.GetPropertyString("BudgetItemID"), "TaskID", aUser.WfTaskID)
    				
				    if aList.Count > 0 then
					    aExpense = aList(0)
				    else
					    aExpense = me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("BudgetItemExpense")
				    end if
    				
				    aExpense("BudgetItemID") = aBudgetItem.GetPropertyString("BudgetItemID")
				    aExpense("GranteeProjectID") = GranteeProjectID
				    aExpense("TaskID") = aUser.WfTaskID
				    aExpense("Expense") = aTextBox.Value
				    me.WebSession.DataObjectFactory.SaveDataObject(aExpense)
			    End If
			    aBudgetItem("BudgetPeriodID") = BudgetPeriod("BudgetPeriodID")
			    aBudgetItem("GranteeProjectID") = GranteeProjectID
			    Me.BudgetPeriod.Save_BudgetItem(aBudgetItem)

			    'If aBudgetItem("Notes") Is System.DBNull.Value And (aTextBox.Value.Trim() = "" Or aTextBox.Value.Trim() = "0") Then
			    '	Me.BudgetPeriod.Delete_BudgetItem(aBudgetItem)
			    'End If
            'end if
		Next
		
		If BudgetPeriod.GetPropertyInt("BudgetPeriodID", 0) > 0 Then
			Me.BudgetPeriod.CalculateBudget(mCategoryList)
		End If

		If mIsRecalculate Then
			mIsRecalculate = False
			CorePage.Redirect()
		Else
			MyBase.DataPresenter_SaveDataObjects()

			Dim aBudget As cBudget
			aBudget = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Budget",Me.BudgetPeriod.GetPropertyInt("BudgetID"))
			aBudget.UpdateBudgetTotal()
		End If

	End Sub

'=============================================================

	Public Sub RecalculateBudget()
		dim aIndex as Integer
		dim aTotal as Double = 0
		Dim aTextBox As cTextBox
		
		for aIndex = 0 to mBudgetItemlist.Count - 2
			aTextBox = CType(Me.FindControl(mBudgetItemlist(aIndex)("BudgetCategoryID")), cTextBox)
			
			If aTextBox.Value.Trim() <> "" Then
				aTotal = aTotal + aTextBox.Value
			end if
		next
		
		dim aURL as String = Request.RawUrl.ToString()
		aURL = cWebLib.AddQuerystringParameter(aURL, "Total", aTotal.ToString())
		response.Redirect(aURL)
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

'=============================================================
End Class 'cBudgetPeriod_Editor
End Namespace