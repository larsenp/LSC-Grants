Imports System.Xml
Imports System.Web.UI.HtmlControls
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base

Namespace Implementation.Controls.PageSection
Public Class cLSCDataCollectionGrid
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

'GLOBALS
	Protected mGridEl As XmlElement
	Protected mGridDataEl As XmlElement
	Protected mColsDataList As cDataObjectList
	Protected mRowsDataList As cDataObjectList
	Protected mGridDataList As cDataObjectList
	Protected mGridSortedList As SortedList
	Protected mColsEl As XmlElement
	Protected mRowsEl As XmlElement
	Protected mMainColsEl As XmlElement
	Protected mTotalsColsEl As XmlElement
	Protected mMainRowsEl As XmlElement
	Protected mFooterRowsEl As XmlElement
	Protected mContainer As HtmlGenericControl
	Protected mGridTable As HtmlTable
	Protected mLastColSortOrder As Integer
	Protected mGridDisplayPropertyEl As XmlElement
	Protected mGridControlEl As XmlElement
	Protected mRowTotalsHash As Hashtable = New Hashtable 'hashtable containing sorted lists of data for each totals row
        Protected mColTotalsHash As Hashtable = New Hashtable 'hashtable containing sorted lists of data for each totals column

	Protected btnSave As cCSSButton


'PROPERTIES
	Public Overridable Property GridEl() As XmlElement
		Get
			Return mGridEl
		End Get
		Set(ByVal value As XmlElement)
			mGridEl = value
		End Set
	End Property

	Public Overridable Property ColsDataList() As cDataObjectList
		Get
			Return mColsDataList
		End Get
		Set(ByVal value As cDataObjectList)
			mColsDataList = value
		End Set
	End Property

        Public Overridable Property RowsDataList() As cDataObjectList
            Get
                Return mRowsDataList
            End Get
            Set(ByVal value As cDataObjectList)
                mRowsDataList = value
            End Set
        End Property

        Public Overridable Property GridDataList() As cDataObjectList
            Get
                Return mGridDataList
            End Get
            Set(ByVal value As cDataObjectList)
                mGridDataList = value
            End Set
        End Property

        Public Overridable Property GridSortedList() As SortedList
            Get
                If mGridSortedList Is Nothing Then
                    mGridSortedList = New SortedList()
                End If
                Return mGridSortedList
            End Get
            Set(ByVal value As SortedList)
                mGridSortedList = value
            End Set
        End Property

        Public Overridable Property LastColSortOrder() As Integer
            Get
                If mLastColSortOrder = 0 Then
                    Dim aLastColDO As cDataObject = ColsDataList(ColsDataList.Count - 1)
                    mLastColSortOrder = aLastColDO.GetPropertyInt(cXMLDoc.AttributeToString(mMainColsEl, "SortPropertyKey"))
                End If
                Return mLastColSortOrder
            End Get
            Set(ByVal value As Integer)
                mLastColSortOrder = value
            End Set
        End Property


        'LOAD AND CONFIGURE
        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)
            ConfigureDataCollectionGrid()
        End Sub

        Public Overridable Sub ConfigureDataCollectionGrid()
            ConfigureFromXml()
            BuildGridDataSortedList()
            BuildTotalsSortedLists()
            BuildGrid()
        End Sub

        Public Sub ConfigureFromXml()
            mGridEl = mXMLDoc.DocElement.SelectSingleNode("DataCollectionGrid")
            If mGridEl Is Nothing Then Exit Sub

            mColsEl = GridEl.SelectSingleNode("Columns")
            mMainColsEl = GridEl.SelectSingleNode("Columns/MainColumns")
            Dim aColsDataKey As String = cXMLDoc.AttributeToString(mMainColsEl, "DataObjectKey")
            ColsDataList = DataObjectCollection(aColsDataKey)

            mTotalsColsEl = GridEl.SelectSingleNode("Columns/TotalsColumns")

            mRowsEl = GridEl.SelectSingleNode("Rows")
            mMainRowsEl = GridEl.SelectSingleNode("Rows/MainRows")
            Dim aRowsDataKey As String = cXMLDoc.AttributeToString(mMainRowsEl, "DataObjectKey")
            RowsDataList = DataObjectCollection(aRowsDataKey)
            mFooterRowsEl = GridEl.SelectSingleNode("Rows/FooterRows")

            mGridDataEl = GridEl.SelectSingleNode("GridData")
            mGridDisplayPropertyEl = mGridDataEl.SelectSingleNode("DisplayProperty")
            mGridControlEl = cXMLDoc.GetControlNode(mGridDisplayPropertyEl)

            Dim aContainerName As String = cXMLDoc.AttributeToString(mGridEl, "Container")
            mContainer = Me.FindControl(aContainerName)
            mGridTable = New HtmlTable()
            Dim aCss As String = cXMLDoc.AttributeToString(mGridEl, "CssClass", "")
            If aCss <> "" Then
                mGridTable.Attributes.Add("class", aCss)
            End If
            mContainer.Controls.Add(mGridTable)

        End Sub

        Public Overridable Sub BuildGridDataSortedList()
            'Get data set of collected data
            'Add all data objects to a SortedList, using GridDataPropertyKey attribute from MainColumns and MainRows elements to build concatenated keys
            Dim aGridDataKey As String = cXMLDoc.AttributeToString(mGridDataEl, "DataObjectKey")
            Dim aGridPropertyKey As String = cXMLDoc.AttributeToString(mGridDataEl, "PropertyKey")
            GridDataList = DataObjectCollection(aGridDataKey)
            For Each aGridDO As cDataObject In GridDataList
                GridSortedList.Add(GetGridKeyFromGridData(aGridDO), aGridDO)
            Next

        End Sub

        Public Overridable Sub BuildTotalsSortedLists()
            BuildColumnTotalsSortedLists()
            BuildRowTotalsSortedLists()
        End Sub

        Public Overridable Sub BuildColumnTotalsSortedLists()
            Dim aTotalsColList As XmlNodeList = mTotalsColsEl.SelectNodes("Column")
            For Each aColumnEl As XmlElement In aTotalsColList
                BuildRowColumnTotalsSortedList(aColumnEl, mColTotalsHash)
            Next
        End Sub

        Public Overridable Sub BuildRowColumnTotalsSortedList(ByVal aRowColumnEl As XmlElement, ByVal aTotalsHash As Hashtable)
            Dim aDOList As cDataObjectList = DataObjectCollection(cXMLDoc.AttributeToString(aRowColumnEl, "DataObjectKey"))
            Dim aSortedList As SortedList = New SortedList()
            For Each aDO As cDataObject In aDOList
                aSortedList.Add(aDO(cXMLDoc.AttributeToString(aRowColumnEl, "JoinPropertyKey")), aDO)
            Next
            aTotalsHash.Add(cXMLDoc.AttributeToString(aRowColumnEl, "Key"), aSortedList)
        End Sub

        Public Overridable Sub BuildRowTotalsSortedLists()
            Dim aFooterRowsList As XmlNodeList = mFooterRowsEl.SelectNodes("Row")
            For Each aRowEl As XmlElement In aFooterRowsList
                BuildRowColumnTotalsSortedList(aRowEl, mRowTotalsHash)
            Next
        End Sub

        Public Overridable Function GetGridKeyFromGridData(ByVal aGridDO As cDataObject) As Int64
            Dim aRowsDataPropertyKey As String = cXMLDoc.AttributeToString(mGridDataEl, "RowsDataPropertyKey")
            Dim aColsDataPropertyKey As String = cXMLDoc.AttributeToString(mGridDataEl, "ColsDataPropertyKey")
            Return aGridDO.GetPropertyInt(aRowsDataPropertyKey) * LastColSortOrder + aGridDO.GetPropertyInt(aColsDataPropertyKey)
        End Function

        Public Overridable Function GetGridKeyFromRowAndColumn(ByVal aRowDO As cDataObject, ByVal aColDO As cDataObject) As Int64
            Dim aRowsDataPropertyKey As String = cXMLDoc.AttributeToString(mMainRowsEl, "GridDataPropertyKey")
            Dim aColsDataPropertyKey As String = cXMLDoc.AttributeToString(mMainColsEl, "GridDataPropertyKey")
            Return aRowDO.GetPropertyInt(aRowsDataPropertyKey) * LastColSortOrder + aColDO.GetPropertyInt(aColsDataPropertyKey)
        End Function


        'BUILD AND POPULATE DATA GRID
        Public Overridable Sub BuildGrid()
            Dim CategoryNode As XmlNode = GridEl.SelectSingleNode("Rows/CategoryRows")
            If IsNothing(CategoryNode) = False Then
                Dim CategoryDataObjectKey As String = cXMLDoc.AttributeToString(CategoryNode, "DataObjectKey", "")
                Dim GridDataPropertyKey As String = cXMLDoc.AttributeToString(mMainRowsEl, "GridDataPropertyKey", "")
                Dim GridCategoryDataPropertyKey As String = cXMLDoc.AttributeToString(mMainRowsEl, "GridCategoryDataPropertyKey", "")
                Dim CategoryRowsDataList As cDataObjectList = DataObjectCollection(CategoryDataObjectKey)
                Dim SubTotalsNode As XmlNode = CategoryNode.SelectSingleNode("SubTotals")
                Dim FirstRow As Boolean = True
                BuildHeaderRows(True)
                For Each aCatRowDO As cDataObject In CategoryRowsDataList
                    FirstRow = True
                    Dim aTR As New HtmlTableRow()
                    Dim LineItems As cDataObjectList = FilterDataObjectList(RowsDataList, GridCategoryDataPropertyKey, aCatRowDO.GetPropertyString(GridDataPropertyKey, -1))
                    Dim RowSpan As Integer = LineItems.Count
                    If aCatRowDO.GetPropertyInt(GridCategoryDataPropertyKey, -1) > 0 Then WriteRowCategoryHeaderCell(aCatRowDO, aTR, RowSpan)
                    For Each aRowDO As cDataObject In LineItems
                        If FirstRow = False Then aTR = New HtmlTableRow()
                        BuildGridRow(aRowDO, aTR)
                        mGridTable.Rows.Add(aTR)
                        FirstRow = False
                    Next

                    If IsNothing(SubTotalsNode) = False Then BuildSubTotalRows(aCatRowDO, SubTotalsNode)
                Next
                BuildFooterRows(True)
            Else
                BuildHeaderRows(False)
                For Each aRowDO As cDataObject In RowsDataList
                    Dim aTR As New HtmlTableRow()
                    BuildGridRow(aRowDO, aTR)
                    mGridTable.Rows.Add(aTR)
                Next
                BuildFooterRows(False)
            End If

        End Sub

        Public Overridable Sub BuildHeaderRows(ByVal IsCategoryExists As Boolean)
            Dim aHeaderRowsList As XmlNodeList = mRowsEl.SelectNodes("HeaderRows/HeaderRow")
            For Each aHeaderRowEl As XmlElement In aHeaderRowsList
                Dim aTR As HtmlTableRow = New HtmlTableRow
                Dim aTD As HtmlTableCell = New HtmlTableCell
                aTD.InnerHtml = "&nbsp;"
                If IsCategoryExists Then aTD.ColSpan = 2
                aTR.Cells.Add(aTD)
                For Each aColDO As cDataObject In ColsDataList
                    BuildRowHeaderCell(aHeaderRowEl, aColDO, aTR)
                Next
                Dim aExtraColumnsList As XmlNodeList = aHeaderRowEl.SelectNodes("ExtraColumns/Column")
                For Each aColumnEl As XmlElement In aExtraColumnsList
                    aTD = New HtmlTableCell
                    aTD.InnerHtml = cXMLDoc.AttributeToString(aColumnEl, "Text")
                    Dim aCss As String = cXMLDoc.AttributeToString(aColumnEl, "CssClass", "")
                    If aCss <> "" Then
                        aTD.Attributes.Add("class", aCss)
                    End If
                    aTR.Cells.Add(aTD)
                Next
                mGridTable.Rows.Add(aTR)
            Next
        End Sub

        Public Overridable Function BuildRowHeaderCell(ByVal aHeaderRowEl As XmlElement, ByVal aColDO As cDataObject, ByVal aTR As HtmlTableRow)
            Dim aTD As HtmlTableCell = New HtmlTableCell
            Dim aPropertyKey As String = cXMLDoc.AttributeToString(aHeaderRowEl, "ColDataPropertyKey")
            Dim aCss As String = cXMLDoc.AttributeToString(aHeaderRowEl, "CssClass", "")
            aTD.InnerText = aColDO.GetRelatedPropertyString(aPropertyKey)
            If aCss <> "" Then
                aTD.Attributes.Add("class", aCss)
            End If
            aTR.Cells.Add(aTD)
            Return aTD
        End Function

        Public Overridable Function BuildGridRow(ByVal aRowDO As cDataObject, ByVal aTR As HtmlTableRow) As HtmlTableRow
            WriteRowHeaderCell(aRowDO, aTR)
            For Each aColDO As cDataObject In ColsDataList
                BuildGridCell(aRowDO, aColDO, aTR)
            Next
            WriteRowFooterCells(aRowDO, aTR)
            Return aTR
        End Function

        Public Overridable Function WriteRowHeaderCell(ByVal aRowDO As cDataObject, ByVal aTR As HtmlTableRow) As HtmlTableCell
            Dim aTD As HtmlTableCell = New HtmlTableCell
            Dim aPropertyKey As String = cXMLDoc.AttributeToString(mMainRowsEl, "RowHeaderPropertyKey")
            aTD.InnerText = aRowDO.GetRelatedPropertyString(aPropertyKey)
            Dim aCss As String = cXMLDoc.AttributeToString(mMainRowsEl, "RowHeaderCssClass", "")
            If aCss <> "" Then
                aTD.Attributes.Add("class", aCss)
            End If
            aTR.Cells.Add(aTD)
            Return aTD
        End Function

        Public Overridable Function WriteRowCategoryHeaderCell(ByVal aRowDO As cDataObject, ByVal aTR As HtmlTableRow, ByVal aRowSpan As Integer) As HtmlTableCell
            Dim aTD As HtmlTableCell = New HtmlTableCell
            aTD.RowSpan = aRowSpan
            Dim aPropertyKey As String = cXMLDoc.AttributeToString(mMainRowsEl, "RowHeaderPropertyKey")
            aTD.InnerText = aRowDO.GetRelatedPropertyString(aPropertyKey)
            Dim aCss As String = cXMLDoc.AttributeToString(mMainRowsEl, "RowHeaderCssClass", "")
            If aCss <> "" Then
                aTD.Attributes.Add("class", aCss)
            End If
            aTR.Cells.Add(aTD)
            Return aTD
        End Function

        Public Overridable Function WriteRowFooterCells(ByVal aRowDO As cDataObject, ByVal aTR As HtmlTableRow) As HtmlTableCell
            Dim aTotalsColsList = mTotalsColsEl.SelectNodes("Column")
            Dim aKey As String
            Dim aTD As HtmlTableCell
            Dim aColDOList As SortedList
            Dim aColDO As cDataObject
            Dim aRowSortKey As String = cXMLDoc.AttributeToString(mMainRowsEl, "SortPropertyKey")
            Dim aRowSort As Integer = aRowDO.GetPropertyInt(aRowSortKey)
            For Each aColumnEl As XmlElement In aTotalsColsList
                aKey = cXMLDoc.AttributeToString(aColumnEl, "Key")
                aTD = New HtmlTableCell
                aColDOList = mColTotalsHash(aKey)
                aColDO = aColDOList(aRowSort)
                If aColDO Is Nothing Then
                    aTD.InnerHtml = "&nbsp;"
                Else
                    Dim aFormat As String = cXMLDoc.AttributeToString(aColumnEl, "Format", "")
                    If aFormat <> "" Then
                        aTD.InnerText = aColDO.GetRelatedPropertyFormattedString(cXMLDoc.AttributeToString(aColumnEl, "DataPropertyKey"), aFormat)
                    Else
                        aTD.InnerText = aColDO.GetRelatedPropertyString(cXMLDoc.AttributeToString(aColumnEl, "DataPropertyKey"))
                    End If
                    Dim aCss As String = cXMLDoc.AttributeToString(aColumnEl, "CssClass", "")
                    If aCss <> "" Then
                        aTD.Attributes.Add("class", aCss)
                    End If
                End If
                aTR.Cells.Add(aTD)
            Next
        End Function

        Public Overridable Function BuildGridCell(ByVal aRowDO As cDataObject, ByVal aColDO As cDataObject, ByVal aTR As HtmlTableRow) As HtmlTableCell
            Dim aTD As HtmlTableCell = New HtmlTableCell
            Dim aCtl As cCoreCtl
            Dim aGridKey As Int64 = GetGridKeyFromRowAndColumn(aRowDO, aColDO)
            Dim aID As String = cXMLDoc.AttributeToString(mGridControlEl, "ID") + aGridKey.ToString
            aCtl = GetControl(aTD, mGridControlEl, aID)
            aCtl.EventController = Me
            aCtl.DisplayPropertyNode = Me.mGridDisplayPropertyEl
            aCtl.CoreCtl_Configure(mGridDisplayPropertyEl, Nothing)
            BuildGridCellValidatorControls(aID)
            aTD.Controls.Add(aCtl)
            aTR.Cells.Add(aTD)
            SetGridCellValue(aCtl, aGridKey)
            Dim aCss As String = cXMLDoc.AttributeToString(mGridDataEl, "CssClass", "")
            If aCss <> "" Then
                aTD.Attributes.Add("class", aCss)
            End If
            Return aTD
        End Function

        Protected Sub BuildGridCellValidatorControls(ByVal aControlID As String)
            Dim aValidationNodeList As XmlNodeList = mGridControlEl.SelectNodes("Validation")
            Dim aValidationNode As XmlNode
            Dim aValidator As BaseValidator

            For Each aValidationNode In aValidationNodeList
                aValidator = BuildValidatorControl(aValidationNode, aControlID)
                If Not aValidator Is Nothing Then
                    Controls.Add(aValidator)
                End If
            Next
        End Sub

        Public Overridable Sub SetGridCellValue(ByVal aCtl As cCoreCtl, ByVal aGridKey As Int64)
            If mGridSortedList Is Nothing Then Return
            Dim aGridDO As cDataObject = CType(mGridSortedList(aGridKey), cDataObject)
            aCtl.CoreCtl_SetCtlValueFromDataObject(aGridDO)
            'Dim aPropertyKey As String = cXMLDoc.AttributeToString(mGridDisplayPropertyEl, "PropertyKey")
            'Select Case cXMLDoc.AttributeToString(mGridControlEl, "Type")
            '	Case "cMoneyTextBox"
            '		Dim aBox As cMoneyTextBox = CType(aCtl, cMoneyTextBox)
            '		If Not aGridDO(aPropertyKey) Is System.DBNull.Value Then
            '			aBox.NumericValue = aGridDO.GetPropertyDecimal(aPropertyKey)
            '		End If
            '	Case "cLabel"
            '		Dim aLabel As cLabel = CType(aCtl, cLabel)
            '		If Not aGridDO(aPropertyKey) Is System.DBNull.Value Then
            '			aLabel.CoreCtl_SetCtlValueFromDataObject(aGridDO)
            '		End If
            'End Select
        End Sub

        Public Overridable Sub BuildFooterRows(ByVal IsCategoriesExists As Boolean)
            Dim aFooterRowsList As XmlNodeList = mRowsEl.SelectNodes("FooterRows/Row")
            For Each aRowEl As XmlElement In aFooterRowsList
                BuildFooterRow(aRowEl, IsCategoriesExists)
            Next
        End Sub

        Public Overridable Sub BuildFooterRow(ByVal aRowEl As XmlElement, ByVal IsCategoriesExists As Boolean)
            Dim aTR As HtmlTableRow = New HtmlTableRow
            Dim aTD As HtmlTableCell
            aTD = New HtmlTableCell
            If IsCategoriesExists Then aTD.ColSpan = 2
            aTD.InnerText = cXMLDoc.AttributeToString(aRowEl, "HeaderText")
            Dim aCss As String = cXMLDoc.AttributeToString(aRowEl, "HeaderCssClass", "")
            If aCss <> "" Then
                aTD.Attributes.Add("class", aCss)
            End If
            aTR.Cells.Add(aTD)
            For Each aColDO As cDataObject In ColsDataList
                BuildFooterRowCell(aRowEl, aColDO, aTR)
            Next
            Dim aExtraRowsList As XmlNodeList = aRowEl.SelectNodes("ExtraCells/Cell")
            For Each aCellEl As XmlElement In aExtraRowsList
                BuildFooterRowExtraCell(aCellEl, aTR)
            Next
            mGridTable.Rows.Add(aTR)
        End Sub

        Public Overridable Sub BuildFooterRowCell(ByVal aRowEl As XmlElement, ByVal aColDO As cDataObject, ByVal aTR As HtmlTableRow)
            Dim aTD As HtmlTableCell = New HtmlTableCell
            Dim aPropertyKey As String = cXMLDoc.AttributeToString(aRowEl, "JoinPropertyKey")
            Dim aJoinValue As Integer = aColDO.GetPropertyInt(aPropertyKey)
            Dim aRowKey As String = cXMLDoc.AttributeToString(aRowEl, "Key")
            Dim aRowList As SortedList = mRowTotalsHash(aRowKey)
            Dim aRowDO As cDataObject = aRowList(aJoinValue)
            If aRowDO Is Nothing Then
                aTD.InnerHtml = "&nbsp;"
            Else
                Dim aDataPropertyKey As String = cXMLDoc.AttributeToString(aRowEl, "DataPropertyKey")
                Dim aFormat As String = cXMLDoc.AttributeToString(aRowEl, "Format")
                If aFormat = "" Then
                    aTD.InnerText = aRowDO.GetRelatedPropertyString(aDataPropertyKey)
                Else
                    aTD.InnerText = aRowDO.GetRelatedPropertyFormattedString(aDataPropertyKey, aFormat)
                End If
                Dim aCss As String = cXMLDoc.AttributeToString(aRowEl, "CssClass", "")
                If aCss <> "" Then
                    aTD.Attributes.Add("class", aCss)
                End If
            End If

            aTR.Cells.Add(aTD)
        End Sub

        Public Overridable Sub BuildSubTotalRows(ByVal CatDo As cDataObject, ByVal SubTotalsNode As XmlNode)
            Dim RowNode As XmlNode = SubTotalsNode.SelectSingleNode("Row[@Key='SubTotals']")
            Dim aTR As New HtmlTableRow()
            Dim aTD As HtmlTableCell = New HtmlTableCell()
            Dim aPropertyKey As String = cXMLDoc.AttributeToString(mMainRowsEl, "RowHeaderPropertyKey")
            aTD.InnerText = cXMLDoc.AttributeToString(SubTotalsNode, "HeaderPrefix") + " " + CatDo.GetRelatedPropertyString(aPropertyKey)
            aTD.ColSpan = 2
            Dim aCss As String = cXMLDoc.AttributeToString(RowNode, "CssClass", "")
            If aCss <> "" Then
                aTD.Attributes.Add("class", aCss)
            End If
            aTR.Cells.Add(aTD)
            For Each aColDO As cDataObject In ColsDataList
                BuildSubTotalRowCell(CatDo, aColDO, RowNode, aTR)
            Next
            Dim ExtraCellNode As XmlNode = SubTotalsNode.SelectSingleNode("Row/ExtraCells/Cell")
            BuildSubTotalRowExtraCell(CatDo, ExtraCellNode, aTR)
            mGridTable.Rows.Add(aTR)
        End Sub

        Public Overridable Sub BuildSubTotalRowCell(ByVal CatDo As cDataObject, ByVal aColDO As cDataObject, ByVal RowNode As XmlNode, ByVal aTR As HtmlTableRow)
            Dim aTD As HtmlTableCell = New HtmlTableCell
            If IsNothing(RowNode) Then Exit Sub
            Dim aCss As String = cXMLDoc.AttributeToString(RowNode, "CssClass", "")
            If aCss <> "" Then
                aTD.Attributes.Add("class", aCss)
            End If
            Dim aRowsDataPropertyKey As String = cXMLDoc.AttributeToString(RowNode, "RowsDataPropertyKey")
            Dim aColsDataPropertyKey As String = cXMLDoc.AttributeToString(RowNode, "ColsDataPropertyKey")
            Dim DataPropertyKey As String = cXMLDoc.AttributeToString(RowNode, "DataPropertyKey")
            Dim aFormat As String = cXMLDoc.AttributeToString(RowNode, "Format")
            Dim aDOKey As String = cXMLDoc.AttributeToString(RowNode, "DataObjectKey")
            Dim aDOL As cDataObjectList = DataObjectCollection(aDOKey)
            Dim aPropertyKey() As String = {aRowsDataPropertyKey, aColsDataPropertyKey}
            Dim aOperator() As String = {"Equals", "Equals"}
            Dim aValue() As String = {CatDo.GetPropertyString(aRowsDataPropertyKey, "-1"), aColDO.GetPropertyString(aColsDataPropertyKey, "-1")}
            Dim aFilteredDOL As cDataObjectList = FilterDataObjectList(aDOL, aPropertyKey, aValue, aOperator)

            If (aFilteredDOL.Count = 0) Then
                aTD.InnerHtml = "&nbsp;"
            Else
                aTD.InnerHtml = aFilteredDOL(0).GetRelatedPropertyFormattedString(DataPropertyKey, aFormat)
            End If

            aTR.Cells.Add(aTD)
        End Sub

        Public Overridable Sub BuildSubTotalRowExtraCell(ByVal CatDo As cDataObject, ByVal ExtraCellNode As XmlNode, ByVal aTR As HtmlTableRow)
            Dim aTD As HtmlTableCell = New HtmlTableCell
            If IsNothing(ExtraCellNode) Then Exit Sub
            Dim aCss As String = cXMLDoc.AttributeToString(ExtraCellNode, "CssClass", "")
            If aCss <> "" Then
                aTD.Attributes.Add("class", aCss)
            End If
            Dim aRowsDataPropertyKey As String = cXMLDoc.AttributeToString(ExtraCellNode, "RowsDataPropertyKey")
            Dim aFormat As String = cXMLDoc.AttributeToString(ExtraCellNode, "Format")
            Dim aDOKey As String = cXMLDoc.AttributeToString(ExtraCellNode, "DataObjectKey")
            Dim DataPropertyKey As String = cXMLDoc.AttributeToString(ExtraCellNode, "DataPropertyKey")
            Dim aDOL As cDataObjectList = DataObjectCollection(aDOKey)
            Dim aPropertyKey() As String = {aRowsDataPropertyKey}
            Dim aOperator() As String = {"Equals"}
            Dim aValue() As String = {CatDo.GetPropertyString(aRowsDataPropertyKey, "-1")}
            Dim aFilteredDOL As cDataObjectList = FilterDataObjectList(aDOL, aPropertyKey, aValue, aOperator)

            If (aFilteredDOL.Count = 0) Then
                aTD.InnerHtml = "&nbsp;"
            Else
                aTD.InnerHtml = aFilteredDOL(0).GetRelatedPropertyFormattedString(DataPropertyKey, aFormat)
            End If

            aTR.Cells.Add(aTD)
        End Sub

        Public Overridable Sub BuildFooterRowExtraCell(ByVal aCellEl As XmlElement, ByVal aTR As HtmlTableRow)
            Dim aTD As HtmlTableCell = New HtmlTableCell
            Dim aDOList As cDataObjectList = DataObjectCollection(cXMLDoc.AttributeToString(aCellEl, "DataObjectKey"))
            If (Not aDOList Is Nothing) AndAlso aDOList.Count > 0 Then
                Dim aDO As cDataObject = aDOList(0)
                Dim aDataPropertyKey As String = cXMLDoc.AttributeToString(aCellEl, "DataPropertyKey")
                Dim aFormat As String = cXMLDoc.AttributeToString(aCellEl, "Format")
                aTD.InnerText = aDO.GetRelatedPropertyFormattedString(aDataPropertyKey, aFormat)
                Dim aCss As String = cXMLDoc.AttributeToString(aCellEl, "CssClass", "")
                If aCss <> "" Then
                    aTD.Attributes.Add("class", aCss)
                End If
                aTR.Cells.Add(aTD)
            End If
        End Sub



        'SAVE DATA
        Public Overrides Sub DataPresenter_SaveDataObjects()
            MyBase.DataPresenter_SaveDataObjects()
            SaveGridData()
        End Sub

        Public Overridable Sub SaveGridData()
            Dim aID As String
            Dim aCtl As cCoreCtl
            Dim aValue As String
            Dim aGridDO As cDataObject
            Dim aPropertyKey As String = cXMLDoc.AttributeToString(mGridDisplayPropertyEl, "PropertyKey")
            For Each aRowDO As cDataObject In RowsDataList
                For Each aColDO As cDataObject In ColsDataList
                    aID = BuildDataControlID(aRowDO, aColDO)
                    aCtl = GetControl(aID)

                    If mGridSortedList Is Nothing Then
                        aGridDO = CreateNewGridDataObject(aRowDO, aColDO)
                    Else
                        aGridDO = mGridSortedList(GetGridKeyFromRowAndColumn(aRowDO, aColDO))
                        If aGridDO Is Nothing Then
                            aGridDO = CreateNewGridDataObject(aRowDO, aColDO)
                        End If
                    End If
                    SetDataObjectValueFromControl(aGridDO, aCtl)
                    aGridDO.SaveData()
                Next
            Next
        End Sub

        Public Function BuildDataControlID(ByVal aRowDO As cDataObject, ByVal aColDO As cDataObject) As String
            Return cXMLDoc.AttributeToString(mGridControlEl, "ID") + GetGridKeyFromRowAndColumn(aRowDO, aColDO).ToString
        End Function

        Public Sub SetDataObjectValueFromControl(ByRef aDO As cDataObject, ByVal aCtl As cCoreCtl)
            Dim aPropertyKey As String = cXMLDoc.AttributeToString(mGridDisplayPropertyEl, "PropertyKey")
            Select Case cXMLDoc.AttributeToString(mGridControlEl, "Type")
                Case "cMoneyTextBox"
                    Dim aBox As cMoneyTextBox = CType(aCtl, cMoneyTextBox)
                    If aBox.NumericValue = System.Decimal.MinValue Then
                        aDO(aPropertyKey) = System.DBNull.Value
                    Else
                        aDO(aPropertyKey) = aBox.NumericValue
                    End If
            End Select
        End Sub

        Public Function CreateNewGridDataObject(ByVal aRowDO, ByVal aColDO) As cDataObject

            Dim aDOKey As String = cXMLDoc.AttributeToString(mGridDataEl, "DataObjectKey")
            Dim aDOEl As XmlElement = Me.mxmldoc.DocElement.SelectSingleNode("DataObject[@Key='" + aDOKey + "']")
            Dim aDefaultValuesList As XmlNodeList = aDOEl.SelectNodes("DefaultValues/Argument")

            Dim aGridDO As cDataObject = WebSession.DataObjectFactory.CreateNewDataObjectFromKey(aDOKey)

            'set default values from DataObject element
            DataPresenter_SetDefaultValues(aDefaultValuesList, aGridDO)

            'Set default values from row and column data objects
            Dim aGridColumnDataProperty As String = cXMLDoc.AttributeToString(mGridDataEl, "ColsDataPropertyKey")
            Dim aGridRowDataProperty As String = cXMLDoc.AttributeToString(mGridDataEl, "RowsDataPropertyKey")
            Dim aColumnDataProperty As String = cXMLDoc.AttributeToString(mMainColsEl, "GridDataPropertyKey")
            Dim aRowDataProperty As String = cXMLDoc.AttributeToString(mMainRowsEl, "GridDataPropertyKey")
            aGridDO(aGridColumnDataProperty) = aColDO(aColumnDataProperty)
            aGridDO(aGridRowDataProperty) = aRowDO(aRowDataProperty)
            Return aGridDO
        End Function

        Public Function FilterDataObjectListSorted(ByVal DOL As cDataObjectList, ByVal aExpression As [String], ByVal aSort As [String]) As cDataObjectList
            Dim aDataObjectList As New cDataObjectList(DOL.ObjDefNode, DOL.DataObjectNode, DOL.DefinitionKey, WebSession.DataObjectFactory)
            Dim foundRows As DataRow() = Nothing
            Dim aClassNode As XmlNode
            If DOL.ObjDataTable Is Nothing Then
                For Each aDataObject As cDataObject In DOL.DataObjectList
                    aDataObjectList.ObjDataSet.Tables(DOL.DefinitionKey).ImportRow(aDataObject.DataObjectRow)
                Next
            End If
            foundRows = DOL.ObjDataTable.[Select](aExpression, aSort)
            aClassNode = DOL.ObjDefNode.SelectSingleNode("Class")
            For i As Integer = 0 To foundRows.Length - 1
                Dim aDataObject As cDataObject
                aDataObject = WebSession.DataObjectFactory.CreateDataObject(foundRows(i), DOL, aClassNode)
                aDataObjectList.Add(aDataObject)
            Next

            Return aDataObjectList
        End Function

        Public Function FilterDataObjectList(ByVal DOL As cDataObjectList, ByVal aPropertyKey As [String](), ByVal aValue As [String](), ByVal aOperator As [String]()) As cDataObjectList
            Dim aColumnName As [String] = ""
            Dim aExpression As [String] = ""
            Dim aOperatorSymbol As [String] = ""
            For i As Integer = 0 To aPropertyKey.Length - 1
                aOperatorSymbol = GetOperatorByText(aOperator(i))
                If i < aPropertyKey.Length - 1 Then
                    aExpression = Convert.ToString(aExpression + aPropertyKey(i) + aOperatorSymbol) & "'" & Convert.ToString(aValue(i)) & "' AND "
                Else
                    aExpression = Convert.ToString(aExpression + aPropertyKey(i) + aOperatorSymbol) & "'" & Convert.ToString(aValue(i)) & "'"
                End If
            Next
            Return FilterDataObjectListSorted(DOL, aExpression, "")
        End Function

        Public Function FilterDataObjectList(ByVal DOL As cDataObjectList, ByVal aPropertyKey As [String], ByVal aValue As [String]) As cDataObjectList
            Return FilterDataObjectListSorted(DOL, Convert.ToString(aPropertyKey) & "='" & Convert.ToString(aValue) & "'", "")
        End Function

        Public Function GetOperatorByText(ByVal aOperator As [String]) As [String]
            Select Case aOperator
                Case "", "Equals"
                    Return " = "
                Case "GreaterThan"
                    Return " > "
                Case "GreaterThanEqual"
                    Return " >= "
                Case "LessThan"
                    Return " < "
                Case "LessThanEqual"
                    Return " <= "
                Case "NotEqual"
                    Return " <> "
            End Select
            Return ""
        End Function


    End Class
End Namespace