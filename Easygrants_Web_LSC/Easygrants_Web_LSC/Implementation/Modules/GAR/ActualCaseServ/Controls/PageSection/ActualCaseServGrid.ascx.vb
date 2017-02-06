Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Xml
Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports Easygrants.Web.User
Namespace Implementation.Modules.GAR.ActualCaseServ.Controls.PageSection
	Public Class cActualCaseServGrid
        Inherits Easygrants_Web.Controls.Base.cWfTADataPresenterCtl

		Private mDataPropertiesList As SortedList 'the list of data object properties being collected in each row
		Protected mCategoriesDOList As cDataObjectList 'the list containing the header categories 
		Protected mCategoriesChildProperty As String	'the related property of the rows data object list that retrieves the parent type or category ID
		Protected tblGrid As HtmlTable
        'Protected mWfTaskAssignmentID As Integer
		Protected trHeader As HtmlTableRow

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)

			mCategoriesDOList = DataObjectCollection("LscCaseCategory")
			mCategoriesChildProperty = "LscCaseTypes"
			Dim aRightMost As Integer = 1
            'mWfTaskAssignmentID = CType(CType(Page, cModulePage).ModuleUser, cEGWfTAUser).WfTaskAssignmentID

			mDataPropertiesList = New SortedList
			mDataPropertiesList.Add(1, "A")
			mDataPropertiesList.Add(2, "B")
			mDataPropertiesList.Add(3, "F")
			mDataPropertiesList.Add(4, "G")
			mDataPropertiesList.Add(5, "H")
			mDataPropertiesList.Add(6, "Ia")
			mDataPropertiesList.Add(7, "Ib")
			mDataPropertiesList.Add(8, "Ic")
			mDataPropertiesList.Add(9, "K")
			mDataPropertiesList.Add(10, "L")

			BuildGrid(mCategoriesDOList, 1, aRightMost)

		End Sub

		Public Overridable Sub BuildGrid(ByVal aCategoriesDOList As cDataObjectList, _
										ByVal aIndent As Integer, ByRef aRightMost As Integer)
			Dim aCategoryDO As cDataObject
			Dim aSortedList As SortedList = New SortedList()
			Dim aTypeID As Integer = 0
			Dim aRowsDOList As cDataObjectList
			Dim aRowDO As cDataObject
			Dim aTR As HtmlTableRow

			If aCategoriesDOList Is Nothing Then Exit Sub
			If aCategoriesDOList.Count = 0 Then Exit Sub

			'BuildHeader(tblGrid)
			For Each aCategoryDO In aCategoriesDOList
				aTR = BuildSubhead(tblGrid, aCategoryDO)
				aRowsDOList = GetCaseTypesList(aCategoryDO.GetPropertyInt("LscCaseCategoryID"))
				For Each aRowDO In aRowsDOList
					If aRowDO("EndDate") Is System.DBNull.Value OrElse aRowDO("EndDate") > DateTime.Now() Then
						aTR = BuildDetailRow(tblGrid, aRowDO)
					End If
				Next
				aTR = BuildSubtotalRow(tblGrid, aCategoryDO)
				aTR = BuildBlankRow(tblGrid)
			Next
			aTR = BuildTotalRow(tblGrid)

		End Sub

		Public Function BuildHeader(ByVal aTable As HtmlTable) As HtmlTableRow
			Dim aRow As HtmlTableRow = New HtmlTableRow
			AddCellToHeader(aRow, "&nbsp;", 30)
			AddCellToHeader(aRow, "&nbsp;", 130)
			AddCellToHeader(aRow, "Counsel and Advice")
			AddCellToHeader(aRow, "Brief Service")
			AddCellToHeader(aRow, "Referred after Assess.")
			AddCellToHeader(aRow, "Insufficient Merit")
			AddCellToHeader(aRow, "Client Withdrew")
			AddCellToHeader(aRow, "Negot. Settlement w/o Litig.")
			AddCellToHeader(aRow, "Negot. Settlement w/ Litig.")
			AddCellToHeader(aRow, "Agency Decision")
			AddCellToHeader(aRow, "Court Decision")
			AddCellToHeader(aRow, "Client Eligibility Change")
			AddCellToHeader(aRow, "Other Closure Method")
			AddCellToHeader(aRow, "Total Cases Closed")
			tblGrid.Rows.Add(aRow)
			Return aRow
		End Function

		Public Overloads Function AddCellToHeader(ByVal aRow As HtmlTableRow, ByVal aText As String, ByVal aWidth As Integer) As HtmlTableCell
			Dim aTD As HtmlTableCell
			aTD = New HtmlTableCell
			aTD.InnerHtml = aText
			aTD.Attributes.Add("class", "MinorSeparatorHdg")
			aTD.Width = aWidth
			aRow.Cells.Add(aTD)
			Return aTD
		End Function

		Public Overloads Function AddCellToHeader(ByVal aRow As HtmlTableRow, ByVal aText As String) As HtmlTableCell
			Return AddCellToHeader(aRow, aText, 60)
		End Function

		Public Function BuildSubhead(ByVal aTable As HtmlTable, ByVal aCategoryDO As cDataObject) As HtmlTableRow
			Dim aTR As HtmlTableRow
			Dim aTD As New HtmlTableCell

			'Copy column header row
			aTR = CopyHeaderRow()
			aTable.Rows.Add(aTR)

			'Separator row
			aTR = New HtmlTableRow
			aTD.Attributes.Add("class", "Subhead")
			aTD.InnerHtml = aCategoryDO.GetPropertyString("Abbr")
			aTD.ColSpan = aTable.Rows(0).Cells.Count
			aTR.Cells.Add(aTD)
			aTable.Rows.Add(aTR)

			Return aTR

		End Function

		Public Function BuildDetailRow(ByVal aTable As HtmlTable, ByVal aRowDO As cDataObject) As HtmlTableRow
			Dim aTR As New HtmlTableRow
			Dim aTD As HtmlTableCell
			Dim aDetailDOList As cDataObjectList
			Dim aDetailDO As cDataObject
			Dim aDataExists As Boolean = False
			Dim aTB As cMoneyTextBox
			Dim aProperty As String
			Dim aDecErrMsg As String = "All entries must be whole numbers, zero or positive."
			Dim aRegExErrMsg As String = "All entries must be whole numbers, zero or positive."
			Dim aCommaErrMsg As String = "Entries may not contain commas."

			Dim aRowIndexID As Integer = aRowDO.GetPropertyInt("LscCaseTypeID")

            aDetailDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscCsr", "WfTaskAssignmentID", WfTaskAssignmentID.ToString, _
       "LscCaseTypeID", aRowIndexID.ToString())
			If aDetailDOList.Count > 0 Then
				aDetailDO = aDetailDOList(0)
				aDataExists = True
			End If

			'Spacer cell
			aTD = New HtmlTableCell
			aTD.InnerHtml = "&nbsp;"
			aTR.Cells.Add(aTD)

			'Row label
			aTD = New HtmlTableCell
			aTD.InnerHtml = aRowDO.GetPropertyString("Description")
			aTD.Attributes.Add("class", "DetailRowHead")
			aTR.Cells.Add(aTD)

			'Get error messages from XML configuration
			Dim aMoneyEl As XmlElement = Me.mXMLDoc.DocElement.SelectSingleNode("MoneyTextBoxConfiguration")
			For Each aPropertyEl As XmlElement In aMoneyEl.ChildNodes
				Select Case aPropertyEl.Attributes("Key").Value
					Case "DecimalErrorMessage"
						aDecErrMsg = aPropertyEl.Attributes("Value").Value
					Case "RegExErrorMessage"
						aRegExErrMsg = aPropertyEl.Attributes("Value").Value
					Case "CommaErrorMessage"
						aCommaErrMsg = aPropertyEl.Attributes("Value").Value
				End Select
			Next

			'Data collection text boxes
			For Each aProperty In mDataPropertiesList.Values
				aTD = New HtmlTableCell
				aTD.Attributes.Add("class", "DetailTD")
				aTB = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cMoneyTextBox']").Attributes("ControlFile").Value), cMoneyTextBox)
				aTB.BaseTextBox.Attributes.Add("class", "DetailTB")
				If aDataExists Then
					aTB.Value = aDetailDO.GetPropertyString(aProperty, "0")
				Else
					aTB.Value = "0"
				End If
				aTB.MaxLength = 4
				aTB.Size = 3
				aTB.AllowInputCommas = False
				aTB.MaxInputDecimalPlaces = 0
				aTB.DecimalErrorMessage = aDecErrMsg
				aTB.RegExErrorMessage = aRegExErrMsg
				aTB.CommaErrorMessage = aCommaErrMsg
				aTB.ID = aRowIndexID.ToString + "_" + aProperty
				aTD.Controls.Add(aTB)
				aTR.Cells.Add(aTD)
			Next

			'Row Total
			aTD = New HtmlTableCell
			aTD.Attributes.Add("class", "DetailTotal")
			If aDataExists Then
				aTD.InnerHtml = aDetailDO.GetRelatedPropertyString("LscCsrTotal.Total")
			Else
				aTD.InnerHtml = "0"
			End If
			aTR.Cells.Add(aTD)

			aTable.Rows.Add(aTR)
			Return aTR

		End Function

		Public Function BuildSubtotalRow(ByVal aTable As HtmlTable, ByVal aCategoryDO As cDataObject) As HtmlTableRow
			Dim aTR As New HtmlTableRow
			Dim aTD As HtmlTableCell
			Dim aSubtotalDOList As cDataObjectList
			Dim aCategoryID As Integer

			aCategoryID = aCategoryDO.GetPropertyInt("LscCaseCategoryID")
            aSubtotalDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscCsrByCategory", "WfTaskAssignmentID", WfTaskAssignmentID.ToString, _
       "LscCaseCategoryID", aCategoryID.ToString())

			'Row header
			aTD = New HtmlTableCell
			aTD.ColSpan = 2
			aTD.Attributes.Add("class", "SubtotalRowHead")
			aTD.InnerHtml = "Subtotal " + aCategoryDO.GetPropertyString("Description")
			aTR.Cells.Add(aTD)

			'Subtotals
			If aSubtotalDOList.Count > 0 Then
				Dim aProperty As String
				Dim aSubtotalDO As cDataObject = aSubtotalDOList(0)
				For Each aProperty In mDataPropertiesList.Values
					aTD = New HtmlTableCell
					aTD.Attributes.Add("class", "Subtotal")
					aTD.InnerHtml = aSubtotalDO.GetPropertyString(aProperty)
					aTR.Cells.Add(aTD)
				Next
				aTD = New HtmlTableCell
				aTD.Attributes.Add("class", "SubtotalRowTotal")
				aTD.InnerHtml = aSubtotalDO.GetPropertyString("Total")
				aTR.Cells.Add(aTD)
			Else
				For i As Integer = 1 To mDataPropertiesList.Count
					aTD = New HtmlTableCell
					aTD.Attributes.Add("class", "Subtotal")
					aTD.InnerHtml = "0"
					aTR.Cells.Add(aTD)
				Next
				aTD = New HtmlTableCell
				aTD.Attributes.Add("class", "SubtotalRowTotal")
				aTD.InnerHtml = "0"
				aTR.Cells.Add(aTD)
			End If

			aTable.Rows.Add(aTR)
			Return aTR
		End Function

		Public Function BuildTotalRow(ByVal aTable As HtmlTable) As HtmlTableRow
			Dim aTotalDOList As cDataObjectList
			Dim aTotalDO As cDataObject
			Dim aDataExists As Boolean = False
			Dim aTR As New HtmlTableRow
			Dim aTD As HtmlTableCell

			'Row header
			aTD = New HtmlTableCell
			aTD.ColSpan = 2
			aTD.Attributes.Add("class", "TotalRowHead")
			aTD.InnerHtml = "Total"
			aTR.Cells.Add(aTD)

			'Get data
            aTotalDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscCsrByWfTA", "WfTaskAssignmentID", WfTaskAssignmentID.ToString)

			'Write data
			If aTotalDOList.Count > 0 Then
				Dim aProperty As String
				aTotalDO = aTotalDOList(0)
				For Each aProperty In mDataPropertiesList.Values
					aTD = New HtmlTableCell
					aTD.Attributes.Add("class", "Total")
					aTD.InnerHtml = aTotalDO.GetPropertyString(aProperty)
					aTR.Cells.Add(aTD)
				Next
				aTD = New HtmlTableCell
				aTD.Attributes.Add("class", "Total")
				aTD.InnerHtml = aTotalDO.GetPropertyString("Total")
				aTR.Cells.Add(aTD)
			Else
				For i As Integer = 1 To mDataPropertiesList.Count
					aTD = New HtmlTableCell
					aTD.Attributes.Add("class", "Total")
					aTD.InnerHtml = "0"
					aTR.Cells.Add(aTD)
				Next
				aTD = New HtmlTableCell
				aTD.Attributes.Add("class", "TotalRowTotal")
				aTD.InnerHtml = "0"
				aTR.Cells.Add(aTD)
			End If

			aTable.Rows.Add(aTR)
			Return aTR
		End Function

		Public Overrides Sub DataPresenter_SaveDataObjects()
			Dim aCategoryDO As cDataObject
			Dim aRowsDOList As cDataObjectList
			Dim aRowDO As cDataObject

			For Each aCategoryDO In mCategoriesDOList
				aRowsDOList = aCategoryDO.GetRelatedPropertyDataObjectList(mCategoriesChildProperty)
				For Each aRowDO In aRowsDOList
					If aRowDO("EndDate") Is System.DBNull.Value OrElse aRowDO("EndDate") > DateTime.Now() Then
						SaveRow(aRowDO)
					End If
				Next aRowDO
			Next aCategoryDO
		End Sub

		Public Sub SaveRow(ByVal aRowDO As cDataObject)
			Dim aDetailDOList As cDataObjectList
			Dim aDetailDO As cDataObject
			Dim aDataExists As Boolean = False 'Indicates whether a corresponding row already exists in the database table
			Dim aValuesExist As Boolean = False 'Indicates whether any values exist in the HTML input controls in the table row 
			Dim aTB As cTextBox
			Dim aRowIndexID As Integer
			Dim aProperty As String
			Dim aTBValues As Hashtable = New Hashtable

			'Check for existing data
			aRowIndexID = aRowDO.GetPropertyInt("LscCaseTypeID")
            aDetailDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscCsr", "WfTaskAssignmentID", WfTaskAssignmentID.ToString, _
       "LscCaseTypeID", aRowIndexID)
			If aDetailDOList.Count > 0 Then
				aDetailDO = aDetailDOList(0)
				aDataExists = True
			End If

			'Collect values from data collection controls

			'Data collection text boxes

			For Each aProperty In mDataPropertiesList.Values
				aTB = CType(Me.FindControl(aRowIndexID.ToString + "_" + aProperty), cTextBox)
				If aTB.Value <> "" Then
					aTBValues.Add(aProperty, aTB.Value)
					aValuesExist = True
				Else
					aTBValues.Add(aProperty, DBNull.Value)
				End If
			Next



			If aValuesExist Then
				If Not aDataExists Then
					'If values exist and data does not exist, create new data object and save
					aDetailDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("LscCsr")
					aDetailDO("LscCaseTypeID") = aRowIndexID
                    aDetailDO("WfTaskAssignmentID") = WfTaskAssignmentID
				End If
				'If values exist and data exists, save data
				For Each aProperty In mDataPropertiesList.Values
					aDetailDO(aProperty) = aTBValues(aProperty)
				Next
				aDetailDO.SaveData()
			Else
				'If values do not exist and data exists, delete data
				WebSession.DataObjectFactory.DeleteData(aDetailDO)
				'If values do not exist and data does not exist, do nothing
			End If
		End Sub

		Public Function CopyHeaderRow() As HtmlTableRow
			Dim aTR As New HtmlTableRow
			Dim aTDOld As HtmlTableCell
			Dim aTDNew As HtmlTableCell

			For Each aTDOld In Me.trHeader.Cells
				aTDNew = New HtmlTableCell
				aTDNew.InnerHtml = aTDOld.InnerHtml
				aTDNew.Attributes.Add("class", aTDOld.Attributes("class"))
				aTDNew.Align = aTDOld.Align
				aTDNew.VAlign = aTDOld.VAlign
				aTDNew.Width = aTDOld.Width
				aTDNew.ColSpan = aTDOld.ColSpan
				aTR.Cells.Add(aTDNew)
			Next

			Return aTR
		End Function

		Public Function BuildBlankRow(ByVal aTable As HtmlTable) As HtmlTableRow
			Dim aTR As New HtmlTableRow
			Dim aTD As New HtmlTableCell

			aTD.InnerHtml = "&nbsp;"
			aTR.Cells.Add(aTD)
			aTable.Rows.Add(aTR)
			Return aTR
		End Function

		Public Function GetCaseTypesList(ByVal aCaseCategoryID As Integer) As cDataObjectList
			Dim aDataObjectEl As XmlElement
			Dim aFilterArgEl As XmlElement
			Dim aDOList As cDataObjectList

			aDataObjectEl = Me.mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='LscCaseType']")
			aDataObjectEl.Attributes("GetData").Value = "True"
			aFilterArgEl = aDataObjectEl.SelectSingleNode("Filters/Argument")
			aFilterArgEl.Attributes("Value").Value = aCaseCategoryID.ToString
			aDOList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectEl)
			Return aDOList
		End Function

	End Class
End Namespace
