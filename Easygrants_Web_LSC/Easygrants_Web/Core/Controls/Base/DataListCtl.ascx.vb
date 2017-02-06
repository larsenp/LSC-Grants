Imports System.Xml
Imports System.Diagnostics
Imports System.Reflection
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Util
Imports EasyGrants.Web.User

Namespace Core_Web.Controls.Base
Public Class cDataListCtl
    Inherits Core.Web.cEventController
'================================================================================ 

    Protected tHeader As HtmlTable
	Protected trNoRecord As HtmlTableRow
	Protected tdNoRecord As HtmlTableCell
	Protected trHeader As HtmlTableRow
	Protected trNoHeaderSpace As HtmlTableRow
    Protected tdHeader As HtmlTableCell
    Protected trInstructions As HtmlTableRow
    Protected tdInstructions As HtmlTableCell
    Protected tResults As HtmlTable
    Protected tPaging As HtmlTable
    Protected tTotal As HtmlGenericControl
    Protected trBlank As HtmlTableRow
    Protected tdBlank As HtmlTableCell
    Protected ctlPaging As cPagingCtl
	Protected spnConfirm As HtmlGenericControl
    
    Private mDisplayPropertyNode As XmlNode
    Private mShowCount As Boolean
    Private mHideBlankRow As Boolean
    Private mHasChildMessage As String

    Private mControlHashtables As Hashtable = New Hashtable()
    Private mIndexControls As Boolean
    'The mControlHashtables Hashtable stores a collection of hashtables, each
    'of which contains all instances of a type of control as defined by a 
    'single Control node within the list control's DisplayProperty node.
    'Each hashtable within mControlHashtables is indexed by the ID of the 
    'control as specified within the Control node. Each control within each
    'of the child hashtables is indexed by the value of the primary key of the
    'data object represented by that instance of the control. Setting the "IndexControls"
    'property to false will disable this functionality.

    Private mControlItemCollections As Hashtable = New Hashtable()
    Private mShowColumnHeaderRow As Boolean
    Private mShowSubColumnHeaderRow As Boolean
	Private mDataObjHash As Hashtable = New Hashtable()
	
	Private mHTMLEncode As Boolean
	Private mIsSaveOnSort As Boolean

	Private mSecurityGroupCheck As Boolean = False
'================================================================================ 
	Public Property SecurityGroupCheck() As Boolean
		Get
			Return mSecurityGroupCheck
		End Get
		Set(ByVal Value As Boolean)
			mSecurityGroupCheck = Value
		End Set
	End Property

    Public readonly Property CurRowQueryString As String
        Get
            CurRowQueryString = ID.ToString() + "_CurRow"
        End Get
    End Property

'--------------------------------------------------------------------------------

    Public readonly Property CurrentRow As Integer
        Get
            if (Page.Request.QueryString(CurRowQueryString)) <> "" then
                CurrentRow = Convert.ToInt32(Page.Request.QueryString(CurRowQueryString))
            else
                CurrentRow = 1
            end if
        End Get
    End Property

'--------------------------------------------------------------------------------

    Public Overrides Property DisplayPropertyNode() As XmlNode
    Get
        DisplayPropertyNode = mDisplayPropertyNode
    End Get
    Set(ByVal Value As XmlNode)
        mDisplayPropertyNode = Value
    End Set
    End Property

'--------------------------------------------------------------------------------

	Public Property HasChildMessage() As String
		Get
			Return mHasChildMessage
		End Get
		Set(ByVal Value As String)
			mHasChildMessage = Value
		End Set
	End Property

'--------------------------------------------------------------------------------

	Public Property NoRecordMessage() As String
		Get
			Return tdNoRecord.InnerHtml
		End Get
		Set(ByVal Value As String)
			If Value <> "" Then
				trNoRecord.Visible = True
				tdNoRecord.InnerHtml = Value
			Else
				trNoRecord.Visible = False
			End If
		End Set
	End Property

'--------------------------------------------------------------------------------

	Public Property HeaderHtml() As String
	Get
		Return tdHeader.InnerHtml
	End Get
	Set(ByVal Value As String)
		If Value <> "" Then
			trHeader.Visible = True
			trNoHeaderSpace.Visible = True
			tdHeader.InnerHtml = Value
		Else
			trHeader.Visible = False
			trNoHeaderSpace.Visible = False
		End If
	End Set
	End Property

'--------------------------------------------------------------------------------

	Public Property InstructionHtml() As String
	Get
		Return tdInstructions.InnerHtml
	End Get
	Set(ByVal Value As String)
		If Value <> "" Then
			trInstructions.Visible = True
			tdInstructions.InnerHtml = Value
			trBlank.Visible = True
			tdBlank.Visible = True
		Else
			trInstructions.Visible = False
		End If
	End Set
	End Property

'--------------------------------------------------------------------------------

	Public Property IndexControls() As Boolean
	'This property must be true in order for data to be saved from a data list.
	Get
		Return mIndexControls
	End Get
	Set(ByVal Value As Boolean)
		mIndexControls = Value
	End Set
	End Property

'--------------------------------------------------------------------------------

	Public ReadOnly Property ControlCollections() As Hashtable
	Get
		Return mControlHashtables
	End Get
	End Property

'--------------------------------------------------------------------------------

	Public Property ShowCount() As Boolean
	Get
		Return mShowCount
	End Get
	Set(ByVal Value As Boolean)
		mShowCount = Value
	End Set
	End Property

        '--------------------------------------------------------------------------------

        Public Property HideBlankRow() As Boolean
            Get
                Return mHideBlankRow
            End Get
            Set(ByVal Value As Boolean)
                mHideBlankRow = Value
            End Set
		End Property

		 Public ReadOnly Property DatalistResults() As HtmlTable
			Get
				Return tResults
			End Get
		End Property

        '--------------------------------------------------------------------------------

        Public Property ShowColumnHeaderRow() As Boolean
            Get
                Return mShowColumnHeaderRow
            End Get
            Set(ByVal Value As Boolean)
                mShowColumnHeaderRow = Value
            End Set
        End Property
        
       '--------------------------------------------------------------------------------

        Public Property ShowSubColumnHeaderRow() As Boolean
            Get
                Return mShowSubColumnHeaderRow
            End Get
            Set(ByVal Value As Boolean)
                mShowSubColumnHeaderRow = Value
            End Set
        End Property
        '================================================================================ 

        Private Function ColumnName(ByVal aDisplayPropertyNode As XmlNode) As String

            ColumnName = cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey")

        End Function

        '--------------------------------------------------------------------------------

		Protected Overridable Function Column_Should_Display(ByVal aDisplayPropertyNode As XmlNode) As Boolean
			Dim aSecGroupVis As Boolean = cXMLDoc.AttributeToBool(aDisplayPropertyNode, "SecurityGroupVisible", False)
			'If aSecGroupVis AndAlso SecurityGroupCheck Then
			'	Return True
			'ElseIf aSecGroupVis AndAlso Not SecurityGroupCheck Then
			'	Return False
			'ElseIf Not aSecGroupVis Then
			'	Return True
			'End If
			If aSecGroupVis AndAlso Not SecurityGroupCheck Then
				Return False
			End If
			Return True
		End Function

        '--------------------------------------------------------------------------------

        Private Function ColumnHeader(ByVal aDisplayPropertyNode As XmlNode) As String
			If ConfigurableHeader(aDisplayPropertyNode) = True Then
				ColumnHeader = GetLabel(cXMLDoc.AttributeToString(aDisplayPropertyNode, "ColumnHeader"))
			Else
				ColumnHeader = ConfigurableText(cXMLDoc.AttributeToString(aDisplayPropertyNode, "ColumnHeader"))
			End If

			If ColumnHeader = "" Then
				ColumnHeader = cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey")
			End If
		End Function

		Private Function ConfigurableHeader(ByVal aDisplayPropertyNode As XmlNode) As String
			ConfigurableHeader = cXMLDoc.AttributeToString(aDisplayPropertyNode, "ConfigurableHeader", "False")
		End Function

        '--------------------------------------------------------------------------------

        Private Function SubColumnHeader(ByVal aDisplayPropertyNode As XmlNode) As String

            SubColumnHeader = cXMLDoc.AttributeToString(aDisplayPropertyNode, "SubColumnHeader")

            If SubColumnHeader = "" Then
                SubColumnHeader = ""
            End If

        End Function

       '--------------------------------------------------------------------------------   

        Private Function HeaderColspan(ByVal aDisplayPropertyNode As XmlNode) As String

            HeaderColspan = cXMLDoc.AttributeToString(aDisplayPropertyNode, "HeaderColspan")

            If HeaderColspan = "" Then
                HeaderColspan = "1"
            End If

        End Function

        '--------------------------------------------------------------------------------   

        Private Function HeaderAlign(ByVal aDisplayPropertyNode As XmlNode) As String

            HeaderAlign = cXMLDoc.AttributeToString(aDisplayPropertyNode, "HeaderAlign")

            If HeaderAlign = "" Then
                HeaderAlign = "Left"
            End If

        End Function


        '--------------------------------------------------------------------------------   

        Private Function DataColspan(ByVal aDisplayPropertyNode As XmlNode) As String

            DataColspan = cXMLDoc.AttributeToString(aDisplayPropertyNode, "DataColspan")

            If DataColspan = "" Then
                DataColspan = "1"
            End If

        End Function

		'--------------------------------------------------------------------------------   

        Private Function DataAlign(ByVal aDisplayPropertyNode As XmlNode) As String

            DataAlign = cXMLDoc.AttributeToString(aDisplayPropertyNode, "DataAlign")

            If DataAlign = "" Then
                DataAlign = "Left"
            End If

        End Function

        '--------------------------------------------------------------------------------

        Public Function DataList_ColumnHeaderTD(ByVal aDataObjectList As cDataObjectList, _
             ByVal aDisplayPropertyNode As XmlNode) As HtmlTableCell
            Dim aTD As HtmlTableCell
            Dim aTDInnerHtml As String
            Dim aWidth As String

            aTD = New HtmlTableCell()
            aTDInnerHtml = "<B>" & ColumnHeader(aDisplayPropertyNode) & "</B>"

            aWidth = cXMLDoc.AttributeToString(aDisplayPropertyNode, "Width", "")
            If Not aWidth = "" Then
                aTD.Width = aWidth
            End If

            aTD.NoWrap = cXMLDoc.AttributeToBool(aDisplayPropertyNode, "NoWrap", "False")

            If aDisplayPropertyNode.SelectSingleNode("Sortable") Is Nothing Then
                aTD.InnerHtml = aTDInnerHtml
            Else
                'Dim aSortCtl As cSortCtl = New cSortCtl()
                Dim aSortCtl As cSaveCtl = New cSaveCtl()
				aSortCtl.IsSaveOnSort = mIsSaveOnSort
                Dim aDataPresenter As cDataPresenterCtl = CType(Me.EventController(), cDataPresenterCtl)

                aSortCtl.PagingCtl = ctlPaging
                aSortCtl.CaptionHtml = aTDInnerHtml
                aSortCtl.QueryKey = aDataPresenter.Get_DataObjectSortQueryKey(aDataObjectList.DataObjectNode)
                aSortCtl.QueryValue = aDataPresenter.Get_DataObjectSortQueryValue(ID, aDisplayPropertyNode)
                aSortCtl.AnchorName = ctlPaging.AnchorName

                aTD.Controls.Add(aSortCtl)
            End If

            aTD.Align = HeaderAlign(aDisplayPropertyNode)
            aTD.ColSpan = HeaderColspan(aDisplayPropertyNode)

            Return aTD
        End Function

       '--------------------------------------------------------------------------------

        Public Function DataList_SubColumnHeaderTD(ByVal aDataObjectList As cDataObjectList, _
             ByVal aDisplayPropertyNode As XmlNode) As HtmlTableCell
            Dim aTD As HtmlTableCell
            Dim aTDInnerHtml As String
            Dim aWidth As String

            aTD = New HtmlTableCell()
            aTDInnerHtml = "<B>" & SubColumnHeader(aDisplayPropertyNode) & "</B>"

            aWidth = cXMLDoc.AttributeToString(aDisplayPropertyNode, "Width", "")
            If Not aWidth = "" Then
                aTD.Width = aWidth
            End If

            aTD.NoWrap = cXMLDoc.AttributeToBool(aDisplayPropertyNode, "NoWrap", "False")

            If aDisplayPropertyNode.SelectSingleNode("Sortable") Is Nothing Then
                aTD.InnerHtml = aTDInnerHtml
            Else
                'Dim aSortCtl As cSortCtl = New cSortCtl()
                Dim aSortCtl As cSaveCtl = New cSaveCtl()
				aSortCtl.IsSaveOnSort = mIsSaveOnSort
                Dim aDataPresenter As cDataPresenterCtl = CType(Me.EventController(), cDataPresenterCtl)

                aSortCtl.PagingCtl = ctlPaging
                aSortCtl.CaptionHtml = aTDInnerHtml
                aSortCtl.QueryKey = aDataPresenter.Get_DataObjectSortQueryKey(aDataObjectList.DataObjectNode)
                aSortCtl.QueryValue = aDataPresenter.Get_DataObjectSortQueryValue(ID, aDisplayPropertyNode)
                aSortCtl.AnchorName = ctlPaging.AnchorName

                aTD.Controls.Add(aSortCtl)
            End If

            aTD.Align = HeaderAlign(aDisplayPropertyNode)
            aTD.ColSpan = HeaderColspan(aDisplayPropertyNode)

            Return aTD
        End Function

        '--------------------------------------------------------------------------------

        Public Overrides Sub CoreCtl_Configure(ByVal aDisplayControlNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
            Dim aDisplayPropertyNodeList As XmlNodeList
            Dim aDisplayPropertyNode As XmlNode
            Dim aMainControlNode As XmlNode
            Dim aControlNode As XmlNode
            Dim aNoRecordMsg As String
            Dim aSeparatorWidth As String
            Dim aSeparatorColor As String
            Dim aHeaderNode As XmlNode
            Dim aInstructionNode As XmlNode
            Dim aResultsNode As XmlNode
            Dim aParametersNode As XmlNode
            Dim aTotalRows As Integer
            Dim aCtl As cCoreCtl
            Dim aColName As String

            Dim aColName1() As String
            Dim aColName2() As String
            Dim aArgValueStr() As String
            Dim aOperator() As String
            'Dim aBool() As String
            Dim aItemValue(10) As Boolean

            Dim aChildColName As String
            Dim aFormat As String
            Dim aControlNodeList As XmlNodeList
            Dim aHash As Hashtable
            Dim aControlID As String
            Dim aArgumentNodeList As XmlNodeList
            Dim aArgumentNode As XmlNode
            Dim aArgumentInnerValue As String
            Dim aArgumentControlNode As XmlNode
            Dim aPropertyKey As String
            Dim aTR As HtmlTableRow
            Dim aTD As HtmlTableCell
            Dim aSeparatorNode As XmlNode
            Dim aLabel As HtmlGenericControl
            Dim aContainerCtl As HtmlContainerControl
            Dim aFirstDisplayProperty As Boolean
            Dim aFirstDataObject As Boolean
            Dim aDataObject As cDataObject
            Dim aRecordCount As Integer = 0
            Dim aFirstObjectRendered As Integer
            Dim aLastObjectRendered As Integer
            Dim aIndex As Integer
            Dim aDisplayPropertyFiltersNode As XmlNode
            Dim aColValue As Object
            Dim aDataObj As cDataObject
            Dim aTotal(9) As Double
            Dim aTotalIndex As Integer
            Dim aDisplayTotal(9) As String
            Dim aDisplayTotalFormat(9) As String
            Dim aTotalDisplay As Boolean = False
            Dim aRepeatColumns As Integer
            Dim aClmCnt As Integer = 0
            Dim aMaxPerPage As Integer
            Dim aCnt As Integer
            Dim aPageNum As Integer = 0
            Dim aTDCnt As Integer = 0
			Dim aNegativeNumberFormat As XmlNode
			Dim aGroupPropertyKey As String

            If Not Me.Visible Then Exit Sub

            If aDataObjectList Is Nothing Then 
                tResults.Visible = False
                ctlPaging.Visible = False
                tPaging.Visible = False
				trHeader.Visible = False
				trNoHeaderSpace.Visible = False
                trInstructions.Visible = False
				Exit Sub
			End If

			for each aDataObj in aDataObjectList
				If Not aDataObj.PrimaryKey Is Nothing Then
					If mDataObjHash.ContainsKey(aDataObj.GetPropertyString(aDataObj.PrimaryKey)) Then
						aDataObj.Checked = True
					Else
						mDataObjHash.Add(aDataObj.GetPropertyString(aDataObj.PrimaryKey), aDataObj)
					End If
				End If
			next
			
			for aIndex = 0 to aDataObjectList.Count - 1
				if aDataObjectList(aIndex).Checked = True
					aDataObjectList.Remove(aDataObjectList(aIndex))
					aIndex = aIndex - 1
				End If		
				
				if aIndex > aDataObjectList.Count - 2
					exit for	
				end if
			Next			

            ctlPaging.UniqueHash = ID

            Me.DisplayPropertyNode = aDisplayControlNode

            aMainControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
            
            mIsSaveOnSort = cXMLDoc.AttributeToBool(aMainControlNode, "IsSaveOnSort", False)

            IndexControls = cXMLDoc.AttributeToBool(aMainControlNode, "IndexControls", True)

            If aDataObjectList.Count = 0 Then
				aNoRecordMsg = ConfigurableText(cXMLDoc.AttributeToString(aMainControlNode, "NoRecordMessage"))

                If aNoRecordMsg <> "" Then
                    NoRecordMessage = aNoRecordMsg
                End If
            End If

            aHeaderNode = aMainControlNode.SelectSingleNode("HeaderHtml")
            If Not aHeaderNode Is Nothing Then
                HeaderHtml = aHeaderNode.InnerXml
            End If
            aInstructionNode = aMainControlNode.SelectSingleNode("InstructionHtml")
            If Not aInstructionNode Is Nothing Then
                InstructionHtml = aInstructionNode.InnerXml
            End If
            ''If no results then make table invisible
            aResultsNode = aMainControlNode.SelectSingleNode("DisplayProperty")
            If aResultsNode Is Nothing Then
                tResults.Visible = False
                ctlPaging.Visible = False
                tPaging.Visible = False
            End If
            aMaxPerPage = cXMLDoc.AttributeToInt(aMainControlNode, "MaxPerPage", 0)
            ctlPaging.NumRowsToView = aMaxPerPage
            If aDataObjectList.Count <= ctlPaging.NumRowsToView Or ctlPaging.NumRowsToView = 0 Then
                ctlPaging.Visible = False
                tPaging.Visible = False
            End If
            'ctlPaging.AnchorName = "Results"
            ctlPaging.AnchorName = cXMLDoc.AttributeToString(aMainControlNode, "ID", "Results")

            If aDataObjectList.Count = 0 Then
				trHeader.Visible = False
				trNoHeaderSpace.Visible = False
                trInstructions.Visible = False
                Exit Sub
            End If
            aTotalRows = aDataObjectList.Count

            ''Get list of display property nodes
            aDisplayPropertyNodeList = aDisplayControlNode.SelectNodes("Control/DisplayProperty")
			aRepeatColumns = cXMLDoc.AttributeToInt(aMainControlNode, "RepeatColumns", 1)
			aGroupPropertyKey = cXMLDoc.AttributeToString(aMainControlNode, "GroupPropertyKey", "")
			Dim aPreviousGroup As String = ""
			Dim aCurrentGroup As String = ""

	        mHTMLEncode = cXMLDoc.AttributeToBool(DisplayPropertyNode, "HtmlEncode", True)
            

            ''Create header columns 
            ShowColumnHeaderRow = cXMLDoc.AttributeToBool(aMainControlNode, "ShowColumnHeaderRow", True)
            If ShowColumnHeaderRow Then
                aTR = New HtmlTableRow()

                While aClmCnt < aRepeatColumns
					For Each aDisplayPropertyNode In aDisplayPropertyNodeList

						If cXMLDoc.AttributeToString(aDisplayPropertyNode, "DisplayTotal") <> "" Then
							aTotalDisplay = True
							aDisplayTotal(aTotalIndex) = cXMLDoc.AttributeToString(aDisplayPropertyNode, "DisplayTotal")
							aDisplayTotalFormat(aTotalIndex) = cXMLDoc.AttributeToString(aDisplayPropertyNode, "Format")

							For Each aDataObj In aDataObjectList
								aTotal(aTotalIndex) = aTotal(aTotalIndex) + aDataObj.GetPropertyDouble(cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey"))
							Next aDataObj
						End If

						aTotalIndex = aTotalIndex + 1

						If Column_Should_Display(aDisplayPropertyNode) Then
							'Currently, if a display property shares a table cell with the previous display property
							'(i.e., the "NewCell" attribute is set to false), no column header will render for that display
							'property.
							If cXMLDoc.AttributeToBool(aDisplayPropertyNode, "NewCell", True) Then
								aTD = DataList_ColumnHeaderTD(aDataObjectList, aDisplayPropertyNode)
								aTR.Cells.Add(aTD)
								aTDCnt = aTDCnt + 1
								'add a spacer cell
								aTD = New HtmlTableCell()
								aTD.InnerHtml = "&nbsp;"
								'aTD.Width = "5"
								aTR.Cells.Add(aTD)
								aTDCnt = aTDCnt + 1
							End If
						End If
					Next aDisplayPropertyNode

                    aTD = New HtmlTableCell()
                    aTD.InnerHtml = "&nbsp;&nbsp;&nbsp;&nbsp;"
                    aTR.Cells.Add(aTD)
                    aClmCnt = aClmCnt + 1
                End While

                tResults.Rows.Add(aTR)
                aTD = Nothing
            End If
            
			ShowSubColumnHeaderRow = cXMLDoc.AttributeToBool(aMainControlNode, "ShowSubColumnHeaderRow", False)
			If ShowSubColumnHeaderRow Then
                aTR = New HtmlTableRow()

                While aClmCnt = aRepeatColumns
                    For Each aDisplayPropertyNode In aDisplayPropertyNodeList

                        If Column_Should_Display(aDisplayPropertyNode) Then
                            'Currently, if a display property shares a table cell with the previous display property
                            '(i.e., the "NewCell" attribute is set to false), no column header will render for that display
                            'property.
                            If cXMLDoc.AttributeToBool(aDisplayPropertyNode, "NewCell", True) Then
                                aTD = DataList_SubColumnHeaderTD(aDataObjectList, aDisplayPropertyNode)
                                aTR.Cells.Add(aTD)
                                aTDCnt = aTDCnt + 1
                                'add a spacer cell
                                aTD = New HtmlTableCell()
                                aTD.InnerHtml = "&nbsp;"
                                'aTD.Width = "5"
                                aTR.Cells.Add(aTD)
                                aTDCnt = aTDCnt + 1
                            End If
                        End If
                    Next aDisplayPropertyNode

                    aTD = New HtmlTableCell()
                    aTD.InnerHtml = "&nbsp;&nbsp;&nbsp;&nbsp;"
                    aTR.Cells.Add(aTD)
                    aClmCnt = aClmCnt + 1
                End While

                tResults.Rows.Add(aTR)
                aTD = Nothing
            End If
            If IndexControls Then
                'Create a new hashtable for each different control definition within the data list control. Each
                'hashtable will store a reference to all instances of this particular control (i.e., to all controls
                'in a single column)
                aControlNodeList = aDisplayControlNode.SelectNodes("Control/DisplayProperty/Control")
                For Each aControlNode In aControlNodeList
                    aHash = New Hashtable()
                    aControlID = cXMLDoc.AttributeToString(aControlNode, "ID")
                    mControlHashtables.Add(aControlID, aHash)
                Next
                aControlNodeList = aDisplayControlNode.SelectNodes("Control/DisplayProperty/Parameters/Argument/Control")
                For Each aControlNode In aControlNodeList
                    aHash = New Hashtable()
                    aControlID = cXMLDoc.AttributeToString(aControlNode, "ID")
                    mControlHashtables.Add(aControlID, aHash)
                Next
            End If

            'Iterate through data objects and write out data and controls as specified in the display property nodes
            aFirstDataObject = True
            ctlPaging.TotalRows = aDataObjectList.Count
            
            if cXMLDoc.AttributeToString(aMainControlNode, "DisableShowAll", "False") = "True" then
				ctlPaging.DisableShowAll = True
            end if

            If ctlPaging.Visible And ctlPaging.NumRowsToView <> 0 Then
				if me.Request.QueryString(ctlPaging.CurRowQueryString) = "ShowAll" then
					aFirstObjectRendered = 0
					dim aNode as XmlNode = me.WebAppl.ConfigDoc.DocElement.SelectSingleNode("Appl/DataList")
					
					if aNode is nothing then
						aLastObjectRendered = aDataObjectList.Count - 1
					else
						aLastObjectRendered = aNode.Attributes("MaxToDisplay").Value - 1
						ctlPaging.NumRowsToView = aNode.Attributes("MaxToDisplay").Value
					end if
					
					ctlPaging.ShowAll = False
            	else
					aFirstObjectRendered = ctlPaging.CurrentRow - 1
					aLastObjectRendered = ctlPaging.CurrentRow + ctlPaging.NumRowsToView - 2
            	End If				
            Else
                aFirstObjectRendered = 0
                aLastObjectRendered = aDataObjectList.Count - 1
            End If

            If aLastObjectRendered > aDataObjectList.Count - 1 Then
                aLastObjectRendered = aDataObjectList.Count - 1
            End If

            'wt: 06/16/2004 - add separator at beginning
            aSeparatorWidth = cXMLDoc.AttributeToString(aMainControlNode, "SeparatorWidth")
            aSeparatorColor = cXMLDoc.AttributeToString(aMainControlNode, "SeparatorColor")

            If aSeparatorWidth <> "" Then
                aTR = New HtmlTableRow()
                tResults.Rows.Add(aTR)

                For aClmCnt = 1 To aRepeatColumns
                    aTD = New HtmlTableCell()
                    aTD.ColSpan = aTDCnt / aRepeatColumns
                    aTD.Height = "1"
                    If aSeparatorColor <> "" Then
                        aTD.BgColor = aSeparatorColor
                    Else
                        aTD.BgColor = "Black"
                    End If
                    aTR.Cells.Add(aTD)
                    aTD = New HtmlTableCell()
                    aTR.Cells.Add(aTD)
                Next
            End If
            'wt: 06/16/2004 - end

            For aIndex = aFirstObjectRendered To aLastObjectRendered
                aTR = New HtmlTableRow()
                aClmCnt = 0

                If aMaxPerPage <> 0 Then
                    aPageNum = aIndex \ aMaxPerPage
                End If

                While aClmCnt < aRepeatColumns
                    aDataObject = aDataObjectList(aIndex)
                    tResults.Rows.Add(aTR)
					aFirstDisplayProperty = True

					If Not aGroupPropertyKey = "" Then
						aCurrentGroup = aDataObject.GetRelatedPropertyString(aGroupPropertyKey)
						If Not aCurrentGroup = aPreviousGroup Then
							aTD = New HtmlTableCell
							aTD.InnerHtml = "&nbsp;"
							aTR.Cells.Add(aTD)

							aTR = New HtmlTableRow
							tResults.Rows.Add(aTR)
							aTD = New HtmlTableCell
							aTD.ColSpan = aTDCnt / aRepeatColumns
							aTD.InnerHtml = "<B>" + aCurrentGroup + "</B>"
							aTR.Cells.Add(aTD)

							aTR = New HtmlTableRow
							tResults.Rows.Add(aTR)
						End If
						aPreviousGroup = aCurrentGroup
					End If

                    For Each aDisplayPropertyNode In aDisplayPropertyNodeList
                        aArgumentNodeList = aDisplayPropertyNode.SelectNodes("Parameters/Argument")
						aControlNode = cXMLDoc.GetControlNode(aDisplayPropertyNode)

						If Column_Should_Display(aDisplayPropertyNode) Then

							'Create a new table cell unless otherwise specified in the display property node.
							If aTD Is Nothing Or cXMLDoc.AttributeToBool(aDisplayPropertyNode, "NewCell", True) Then
								If aFirstDisplayProperty Then
									aFirstDisplayProperty = False
								Else
									'add a spacer cell
									aTD = New HtmlTableCell()
									aTD.InnerHtml = "&nbsp;"
									aTR.Cells.Add(aTD)
								End If
								aTD = New HtmlTableCell()
								aTD.VAlign = "Top"
								aTD.ColSpan = DataColspan(aDisplayPropertyNode)
								aTD.Align = DataAlign(aDisplayPropertyNode)
								aTR.Cells.Add(aTD)
								If WordBreak(aDisplayPropertyNode) Then
									aTD.Attributes.Add("Class", "DatalistWordBreak")
								End If
								aContainerCtl = aTD
							Else
								'If we are not creating a new table cell for this display property, we must add a separator if one
								'is specified in the XML to separate this item visually from the one just rendered.

								'Create separator
								aSeparatorNode = aDisplayPropertyNode.SelectSingleNode("Separator")
								If Not aSeparatorNode Is Nothing Then
									aLabel = New HtmlGenericControl()
									aLabel.InnerHtml = aSeparatorNode.InnerXml
									aTD.Controls.Add(aLabel)
								End If
								'Create container
								If aArgumentNodeList.Count > 0 Or Not aControlNode Is Nothing Then
									'If this condition is true, this means we will be rendering cCoreCtl objects in the data list. In this case, we must 
									'add a container control to the current table cell because every control rendered in a data list
									'must have a parent container control and must be the only control within its container control.
									'The first control rendered in a table cell has the table cell itself as a container control. Every
									'additional control rendered in that same table cell must have a separate container control.                        
									aContainerCtl = New HtmlGenericControl()
									aTD.Controls.Add(aContainerCtl)
								End If
							End If

							If aArgumentNodeList.Count > 0 Then
								'if the display property has arguments, then set the value for the innertext appropriately             		
								For Each aArgumentNode In aArgumentNodeList
									aArgumentControlNode = aArgumentNode.SelectSingleNode("Control")
									'aColName1 = cXMLDoc.AttributeToString(aArgumentNode, "ValueKey")
									'aColName2 = cXMLDoc.AttributeToString(aArgumentNode, "CompareKey")
									'aArgValueStr = cXMLDoc.AttributeToString(aArgumentNode, "Value")
									'aOperator = cXMLDoc.AttributeToString(aArgumentNode, "Operator")

									aColName1 = cXMLDoc.AttributeToString(aArgumentNode, "ValueKey").Split(","c)
									aColName2 = cXMLDoc.AttributeToString(aArgumentNode, "CompareKey").Split(","c)
									aArgValueStr = cXMLDoc.AttributeToString(aArgumentNode, "Value").Split(","c)
									aOperator = cXMLDoc.AttributeToString(aArgumentNode, "Operator").Split(","c)
									'aBool = cXMLDoc.AttributeToString(aArgumentNode, "Bool").Split(","c)

									aItemValue(0) = False
									Dim i As Integer = 0
									For i = 0 To aColName1.Length - 1
										If aOperator(i).Trim = "" Then
											aOperator(i) = "Equal"
										End If

										If aArgValueStr(i).Trim = "True" Or aArgValueStr(i).Trim = "False" Then
											Select Case aOperator(i).Trim
												Case "Equal"
													If aDataObject.GetRelatedPropertyBool(aColName1(i).Trim) = aArgValueStr(i).Trim Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "NotEqual"
													If aDataObject.GetRelatedPropertyBool(aColName1(i).Trim) <> aArgValueStr(i).Trim Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
											End Select
										ElseIf aArgValueStr(i).Trim = "CurrentDate" Then
											Dim dtPropertyValue As Date
											If aDataObject.GetRelatedPropertyString(aColName1(i).Trim) <> "" Then
												dtPropertyValue = CType(aDataObject.GetRelatedPropertyValue(aColName1(i).Trim), Date)
											Else
												dtPropertyValue = #1/1/1900#
											End If
											Select Case aOperator(i).Trim
												Case "Equal"
													If dtPropertyValue = System.DateTime.Today Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "NotEqual"
													If dtPropertyValue <> System.DateTime.Today Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "GreaterThan"
													If dtPropertyValue > System.DateTime.Today Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "GreaterThanEqual"
													If dtPropertyValue >= System.DateTime.Today Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "LessThan"
													If dtPropertyValue < System.DateTime.Today Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "LessThanEqual"
													If dtPropertyValue <= System.DateTime.Today Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
											End Select
										ElseIf aArgValueStr(i).Trim = "CurrentDateTime" Then
											Dim dtPropertyValue As Date
											If aDataObject.GetRelatedPropertyString(aColName1(i).Trim) <> "" Then
												dtPropertyValue = CType(aDataObject.GetRelatedPropertyValue(aColName1(i).Trim), Date)
											Else
												dtPropertyValue = #1/1/1900#
											End If
											Select Case aOperator(i).Trim
												Case "Equal"
													If dtPropertyValue = System.DateTime.Now Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "NotEqual"
													If dtPropertyValue <> System.DateTime.Now Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "GreaterThan"
													If dtPropertyValue > System.DateTime.Now Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "GreaterThanEqual"
													If dtPropertyValue >= System.DateTime.Now Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "LessThan"
													If dtPropertyValue < System.DateTime.Now Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "LessThanEqual"
													If dtPropertyValue <= System.DateTime.Now Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
											End Select
										ElseIf aArgValueStr(i).Trim = "Compare" Then 'Compares two date key values
											Dim aOperand1 As String
											Dim aOperand2 As String
											Dim aOperandDate1 As Date
											Dim aOperandDate2 As Date

											aOperand1 = aDataObject.GetRelatedPropertyString(aColName1(i).Trim)
											aOperand2 = aDataObject.GetRelatedPropertyString(aColName2(i).Trim)
											If aOperand1 = "" Then
												aOperandDate1 = #1/1/1900#
											Else
												aOperandDate1 = CType(aDataObject.GetRelatedPropertyValue(aColName1(i).Trim), Date)
											End If
											If aOperand2 = "" Then
												aOperandDate2 = #1/1/1900#
											Else
												aOperandDate2 = CType(aDataObject.GetRelatedPropertyValue(aColName2(i).Trim), Date)
											End If

											Select Case aOperator(i).Trim
												Case "Equal"
													If aOperandDate1 = aOperandDate2 Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "NotEqual"
													If aOperandDate1 <> aOperandDate2 Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "GreaterThan"
													If aOperandDate1 > aOperandDate2 Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "GreaterThanEqual"
													If aOperandDate1 >= aOperandDate2 Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "LessThan"
													If aOperandDate1 < aOperandDate2 Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "LessThanEqual"
													If aOperandDate1 <= aOperandDate2 Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
											End Select
										Else
											Select Case aOperator(i).Trim
												Case "Equal"
													If aDataObject.GetRelatedPropertyString(aColName1(i).Trim) = aArgValueStr(i).Trim Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "NotEqual"
													If aDataObject.GetRelatedPropertyString(aColName1(i).Trim) <> aArgValueStr(i).Trim Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "GreaterThan"
													'If CType(aDataObject.GetRelatedPropertyString(aColName1(i).Trim), Double) > CType(aArgValueStr(i).Trim, Double) Then
													If aDataObject.GetRelatedPropertyDouble(aColName1(i).Trim) > CType(aArgValueStr(i).Trim, Double) Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "GreaterThanEqual"
													'If CType(aDataObject.GetRelatedPropertyString(aColName1(i).Trim), Double) >= CType(aArgValueStr(i).Trim, Double) Then
													If aDataObject.GetRelatedPropertyDouble(aColName1(i).Trim) >= CType(aArgValueStr(i).Trim, Double) Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "LessThan"
													'If CType(aDataObject.GetRelatedPropertyString(aColName1(i).Trim), Double) < CType(aArgValueStr(i).Trim, Double) Then
													If aDataObject.GetRelatedPropertyDouble(aColName1(i).Trim) < CType(aArgValueStr(i).Trim, Double) Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
												Case "LessThanEqual"
													'If CType(aDataObject.GetRelatedPropertyString(aColName1(i).Trim), Double) <= CType(aArgValueStr(i).Trim, Double) Then
													If aDataObject.GetRelatedPropertyDouble(aColName1(i).Trim) <= CType(aArgValueStr(i).Trim, Double) Then
														aItemValue(i) = True
													Else
														aItemValue(i) = False
													End If
											End Select
										End If
									Next

									Dim j As Integer = 0
									For j = 0 To aColName1.Length - 1
										If Not aItemValue(j) Then
											aItemValue(0) = aItemValue(j)
											Exit For
										End If
									Next

									If Not aArgumentControlNode Is Nothing Then
										If cXMLDoc.AttributeToString(aArgumentNode, "DisplayValue") = "Control" Then
											If aItemValue(0) Then
												aControlID = cXMLDoc.AttributeToString(aArgumentControlNode, "ID")
												aParametersNode = aArgumentControlNode.SelectSingleNode("Action/Parameters")
												aCtl = GetControl(aTD, aArgumentControlNode, "")
												aCtl.EventController = Me
												aTD.Controls.Add(aCtl)
												If IndexControls Then
													If Not CType(mControlHashtables(aControlID), Hashtable).Contains(aDataObject(aDataObject.PrimaryKey)) Then 'Added NS:09/14/04
														CType(mControlHashtables(aControlID), Hashtable).Add(aDataObject(aDataObject.PrimaryKey), aCtl)
													End If
												End If
												aCtl.CoreCtl_Configure(aArgumentNode, aDataObjectList)
												''Display link
												aCtl.CoreCtl_SetCtlValueFromDataObject(aDataObject)
												If Not aParametersNode Is Nothing Then
													DataListCtl_AddAttributes_From_Arguments(aCtl, aDataObject, aParametersNode)
												End If
												Exit For
											End If
										End If
									Else
										If aItemValue(0) Then
											aPropertyKey = cXMLDoc.AttributeToString(aArgumentNode, "PropertyKey")
											If aPropertyKey <> "" Then
												aFormat = cXMLDoc.AttributeToString(aArgumentNode, "Format")
												'aTD.InnerHtml = aDataObject.GetRelatedPropertyFormattedString(aPropertyKey, aFormat)
												aContainerCtl.InnerHtml = aDataObject.GetRelatedPropertyFormattedString(aPropertyKey, aFormat)
											Else
												'aTD.InnerHtml = cXMLDoc.AttributeToString(aArgumentNode, "DisplayValue")
												aContainerCtl.InnerHtml = cXMLDoc.AttributeToString(aArgumentNode, "DisplayValue")
											End If
											aContainerCtl.InnerHtml = EncodeHTML(aContainerCtl.InnerHtml)
											Exit For
										End If
									End If
								Next
							Else 'argumentnodelist.count =0
								If aControlNode Is Nothing Then
									''iterates through a "List" and displays with <br> tags
									If cXMLDoc.AttributeToBool(aDisplayPropertyNode, "List") Then
										''iterates and "Count"(s) the items for display
										If cXMLDoc.AttributeToBool(aDisplayPropertyNode, "Count") Then
											Dim aListCount As Integer
											aListCount = aDataObject.GetRelatedPropertyDataObjectList(ColumnName(aDisplayPropertyNode)).Count
											aContainerCtl.InnerHtml = aListCount.ToString()
										Else
											Dim aChildDataObjectList As cDataObjectList
											Dim aChildDataObject As cDataObject
											Dim aChildDisplayPropertyNode As XmlNode
											Dim aChildFiltersNode As XmlNode
											Dim aChildSortNode As XmlNode
											Dim aChildDisplayPropertyNodeList As XmlNodeList
											Dim aChildCount As Integer
											Dim aFirstChildDPNode As Boolean = True

											aColName = ColumnName(aDisplayPropertyNode)

											aChildDisplayPropertyNodeList = aDisplayPropertyNode.SelectNodes("DisplayProperties/DisplayProperty")

											For Each aChildDisplayPropertyNode In aChildDisplayPropertyNodeList
												If aFirstChildDPNode Then
													aFirstChildDPNode = False
												Else
													aTD = New HtmlTableCell()
													aTR.Cells.Add(aTD)
												End If
												aContainerCtl = New HtmlGenericControl()
												aTD.Controls.Add(aContainerCtl)

												aColName = ColumnName(aDisplayPropertyNode)
												aChildColName = ColumnName(aChildDisplayPropertyNode)

												aChildFiltersNode = aDisplayPropertyNode.SelectSingleNode("Filters")
												aChildSortNode = aDisplayPropertyNode.SelectSingleNode("Sort")

												If Not aChildFiltersNode Is Nothing Then
													EventController_SetArgumentsInNodeList(cXMLDoc.GetArgumentsList(aChildFiltersNode), aDataObject)
												End If

												aChildDataObjectList = aDataObject.GetRelatedPropertyDataObjectList(aColName, aChildFiltersNode, aChildSortNode)

												aContainerCtl.InnerHtml = ""

												Dim aProperty As String = cXMLDoc.AttributeToString(aDisplayPropertyNode, "ListReplaceProperty")
												Dim aValue As String = cXMLDoc.AttributeToString(aDisplayPropertyNode, "ListReplacedValue")
												Dim aSep As String = cXMLDoc.AttributeToString(aDisplayPropertyNode, "ListSeparator", "<br>")

												If aProperty <> "" And aValue <> "" Then
													For Each aChildDataObject In aChildDataObjectList
														If aValue = aChildDataObject.GetRelatedPropertyString(aChildColName) Then
															aContainerCtl.InnerHtml += aChildDataObject.GetRelatedPropertyString(aProperty)
														Else
															aContainerCtl.InnerHtml += aChildDataObject.GetRelatedPropertyString(aChildColName)
														End If
														aContainerCtl.InnerHtml += aSep
													Next
												Else
													For Each aChildDataObject In aChildDataObjectList
														aContainerCtl.InnerHtml += aChildDataObject.GetRelatedPropertyString(aChildColName)
														aContainerCtl.InnerHtml += aSep
													Next
												End If
												If aSep <> "" Then
													'aContainerCtl.InnerHtml = aContainerCtl.InnerHtml.Trim(Convert.ToChar(aSep))
													Dim aLastIndex As Integer = aContainerCtl.InnerHtml.LastIndexOf(aSep)
													If aLastIndex <> -1 Then
														aContainerCtl.InnerHtml = aContainerCtl.InnerHtml.Remove(aLastIndex, aSep.Length)
													End If
												End If

												Dim aDisplayNullText As String = cXMLDoc.AttributeToString(aDisplayPropertyNode, "DisplayNullText", "")
												If aContainerCtl.InnerHtml = "" AndAlso aDisplayNullText <> "" Then
													aContainerCtl.InnerHtml = "&lt;" & aDisplayNullText & "&gt;"
												End If

												aContainerCtl.InnerHtml = EncodeHTML(aContainerCtl.InnerHtml)

												aChildCount = aChildCount + 1
											Next
										End If
									Else
										'Write database value to table cell
										aColName = ColumnName(aDisplayPropertyNode)

										'Flter related properties in Data List
										If cXMLDoc.AttributeToString(aDisplayPropertyNode, "RelatedPropertyKey") <> "" Then
											aDisplayPropertyFiltersNode = aDisplayPropertyNode.SelectSingleNode("Filters")
											Dim aDataObjList As cDataObjectList
											aDataObjList = aDataObject.GetRelatedPropertyValue(cXMLDoc.AttributeToString(aDisplayPropertyNode, "RelatedPropertyKey"), aDisplayPropertyFiltersNode)
											Dim aRelatedDataObject As cDataObject
											aRelatedDataObject = aDataObjList(0)

											'need to break out the following if statement into its own function,
											'also used below
											If Not aRelatedDataObject Is Nothing Then
												aFormat = cXMLDoc.AttributeToString(aDisplayPropertyNode, "Format")
												If aFormat = "" Then
													aContainerCtl.InnerHtml = aRelatedDataObject.GetRelatedPropertyString(aColName)
												Else
													aContainerCtl.InnerHtml = aRelatedDataObject.GetRelatedPropertyFormattedString(aColName, aFormat)
												End If
											Else
												aContainerCtl.InnerHtml = "&nbsp;"
											End If
											aContainerCtl.InnerHtml = EncodeHTML(aContainerCtl.InnerHtml)
										Else
											If Not aDataObject.GetRelatedPropertyValue(aColName) Is Nothing Then
												aFormat = cXMLDoc.AttributeToString(aDisplayPropertyNode, "Format")
												If aFormat = "" Then
													If aColName = "IsPrimary" Then
														Dim aColVal As String = aDataObject.GetRelatedPropertyString(aColName)
														Dim aImagePath As String = WebSession.WebAppl.Build_RootURL("Core/images/")

														If aColVal = "True" Then
															aContainerCtl.InnerHtml = "Yes"
														Else
															aContainerCtl.InnerHtml = "No"
														End If
													Else
														aContainerCtl.InnerHtml = aDataObject.GetRelatedPropertyString(aColName)
													End If
												Else
													aContainerCtl.InnerHtml = aDataObject.GetRelatedPropertyFormattedString(aColName, aFormat)
												End If
											Else
												If aColName = "IsPrimary" Then
													aContainerCtl.InnerHtml = "No"
												Else
													aContainerCtl.InnerHtml = cXMLDoc.AttributeToString(aDisplayPropertyNode, "NullDisplay")
												End If
											End If
											aNegativeNumberFormat = aDisplayPropertyNode.SelectSingleNode("NegativeNumberFormat")
											If Not aNegativeNumberFormat Is Nothing AndAlso aDataObject.GetRelatedPropertyString(aColName) < "0" AndAlso aNegativeNumberFormat.InnerXml.Contains("~") Then
												aContainerCtl.InnerHtml = aNegativeNumberFormat.InnerXml.Replace("~", aDataObject.GetRelatedPropertyFormattedString(aColName, aFormat))
											Else
												aContainerCtl.InnerHtml = EncodeHTML(aContainerCtl.InnerHtml)
											End If

											'aContainerCtl.InnerHtml = EncodeHTML(aContainerCtl.InnerHtml)

										End If
									End If
								Else
									'Create control
									aControlID = cXMLDoc.AttributeToString(aControlNode, "ID")
									aParametersNode = aControlNode.SelectSingleNode("Action/Parameters")
									aCtl = GetControl(aContainerCtl, aControlNode, "")
									aCtl.EventController = Me
									aTD.Controls.Add(aCtl)
									If IndexControls Then
										If Not CType(mControlHashtables(aControlID), Hashtable).ContainsKey(aDataObject(aDataObject.PrimaryKey)) Then
											CType(mControlHashtables(aControlID), Hashtable).Add(aDataObject(aDataObject.PrimaryKey), aCtl)
										End If
									End If
									aCtl.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)

									If cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey") <> "" Then
										'Added NS:11/4/04 for App Status Page
										If cXMLDoc.AttributeToString(aDisplayPropertyNode, "RelatedPropertyKey") <> "" Then
											aDisplayPropertyFiltersNode = aDisplayPropertyNode.SelectSingleNode("Filters")
											Dim aDataObjList As cDataObjectList
											aDataObjList = aDataObject.GetRelatedPropertyValue(cXMLDoc.AttributeToString(aDisplayPropertyNode, "RelatedPropertyKey"), aDisplayPropertyFiltersNode)
											Dim aRelatedDataObject As cDataObject
											If Not aDataObjList Is Nothing AndAlso aDataObjList.Count > 0 Then
												aRelatedDataObject = aDataObjList(0)
												If Not aRelatedDataObject Is Nothing Then
													aCtl.CoreCtl_SetCtlValueFromDataObject(aRelatedDataObject)
												End If
											End If
										Else
											aCtl.CoreCtl_SetCtlValueFromDataObject(aDataObject)
										End If
									End If
									If Not aParametersNode Is Nothing Then
										DataListCtl_AddAttributes_From_Arguments(aCtl, aDataObject, aParametersNode)
									End If
								End If
							End If
						End If

                    Next aDisplayPropertyNode

                    aFirstDataObject = False
                    aClmCnt = aClmCnt + 1

                    If aClmCnt < aRepeatColumns Then
                        aIndex = aIndex + 1
                        aTD = New HtmlTableCell()
                        aTD.InnerHtml = "&nbsp;"
                        aTR.Cells.Add(aTD)
                        aTD = New HtmlTableCell()
                        aTD.InnerHtml = "&nbsp;"
                        aTR.Cells.Add(aTD)
                    End If

                    If (aPageNum + 2) * aMaxPerPage < aTotalRows Then
                        If aIndex - aPageNum * aMaxPerPage + 1 > aMaxPerPage Then Exit While
                    End If

                    If aIndex >= aTotalRows Then Exit While
                End While

                If aSeparatorWidth <> "" Then
                    aTR = New HtmlTableRow()
                    tResults.Rows.Add(aTR)

                    For aCnt = 1 To aClmCnt
                        aTD = New HtmlTableCell()
                        aTD.ColSpan = aTDCnt / aRepeatColumns
                        aTD.Height = aSeparatorWidth

                        If aSeparatorColor <> "" Then
                            aTD.BgColor = aSeparatorColor
                        Else
                            aTD.BgColor = "LightGrey"
                        End If
                        aTR.Cells.Add(aTD)
                        aTD = New HtmlTableCell()
                        aTR.Cells.Add(aTD)
                    Next
                End If
            Next aIndex

            If aTotalDisplay Then
                aTR = New HtmlTableRow()
                tResults.Rows.Add(aTR)

                For aIndex = 0 To aTotalIndex
                    aTD = New HtmlTableCell()

                    If aTotal(aIndex) <> 0.0 Then
                        If aDisplayTotalFormat(aIndex) <> "" Then
                            aTD.InnerHtml = "<b>" & String.Format("{0:" + aDisplayTotalFormat(aIndex) + "}", aTotal(aIndex)) & "</b>"
                        Else
                            aTD.InnerHtml = "<b>" & aTotal(aIndex) & "</b>"
                        End If
                    Else
                        aTD.InnerHtml = "<b>" & aDisplayTotal(aIndex + 1) & "</b>"
                    End If

                    aTR.Cells.Add(aTD)
                    aTD = New HtmlTableCell()
                    aTD.InnerHtml = "&nbsp;"
                    aTR.Cells.Add(aTD)
                Next aIndex
            End If

            'add blank row at the end
            HideBlankRow = cXMLDoc.AttributeToBool(aMainControlNode, "HideBlankRow", False)
            If Not HideBlankRow Then
                aTR = New HtmlTableRow()
                tResults.Rows.Add(aTR)
                aTD = New HtmlTableCell()
                aTD.InnerHtml = "&nbsp;"
                aTR.Cells.Add(aTD)
            End If

            ShowCount = cXMLDoc.AttributeToBool(aMainControlNode, "ShowCount", False)
            If ShowCount Then
                tTotal.Visible = True
                If aTotalRows = 1 Then
                    tTotal.InnerText = "1 Row"
                Else
                    tTotal.InnerText = aTotalRows.ToString() + " Rows"
                End If
            End If
        End Sub


        '-----------------------------------------------------
        ' method that iterates through aArgumentNodeList
        ' and actually adds the attributes
        Private Sub DataListCtl_AddAttributes_From_ArgumentNodeList(ByVal aCtl As cCoreCtl, ByVal aDataObject As cDataObject, ByVal aArgumentNodeList As XmlNodeList)
            Dim aArgumentNode As XmlNode
            Dim aType As String
            Dim aPropertyName As String
            Dim aValue As String

            For Each aArgumentNode In aArgumentNodeList
                aType = cXMLDoc.AttributeToString(aArgumentNode, "Type")
                aPropertyName = cXMLDoc.AttributeToString(aArgumentNode, "AttributeName")
                If Not aPropertyName = "" Then
                    aValue = EventController_GetArgumentValue(aArgumentNode, aDataObject)
                    aCtl.Attributes.Add(aPropertyName, aValue)
                End If
            Next
        End Sub

        '-----------------------------------------------------

        Private Sub DataListCtl_AddAttributes_From_Arguments(ByVal aCtl As cCoreCtl, ByVal aDataObject As cDataObject, ByVal aParametersNode As XmlNode)
            Dim aArgumentNodeList As XmlNodeList

            aArgumentNodeList = cXMLDoc.GetArgumentsList(aParametersNode)
            If Not aArgumentNodeList Is Nothing Then
                DataListCtl_AddAttributes_From_ArgumentNodeList(aCtl, aDataObject, aArgumentNodeList)
            End If

            aArgumentNodeList = aParametersNode.SelectNodes("ActionParameters/Argument")
            If Not aArgumentNodeList Is Nothing Then
                DataListCtl_AddAttributes_From_ArgumentNodeList(aCtl, aDataObject, aArgumentNodeList)
            End If
        End Sub

        '-------------------------------------------------------------

        Public Overloads Sub EventController_Delete(ByVal aPrimaryKeyValue As String)
            Dim aDefinitionNode As XmlNode
            Dim aDefinitionKey As String
            Dim aRelatedDataObjNode As XmlNode
            Dim aRecordCheckNode As XmlNode
            Dim aDataObjNodeList As XmlNodeList
			dim aDataObj as cDataObject
			
            aDefinitionNode = Me.DisplayPropertyNode.SelectSingleNode("Control")
            aDefinitionKey = cXMLDoc.AttributeToString(aDefinitionNode, "DataObjectDefinitionKey")
			
			if aDefinitionKey = "" then
				aDefinitionKey = cXMLDoc.AttributeToString(aDefinitionNode.SelectSingleNode("ancestor::DataObject"), "DataObjectDefinitionKey")
			end if
			
            aRecordCheckNode = aDefinitionNode.SelectSingleNode("DisplayProperty/Control/Action/Parameters/ChildRecordCheck")

            If aRecordCheckNode Is Nothing Then
                aRecordCheckNode = aDefinitionNode.SelectSingleNode("DisplayProperty/Parameters/Argument/Control/Action/Parameters/ChildRecordCheck")
            End If

            If Not aRecordCheckNode Is Nothing Then
                If HasChildRecord(aRecordCheckNode, aDefinitionKey, aPrimaryKeyValue) Then
                    HasChildMessage = cXMLDoc.AttributeToString(aRecordCheckNode, "HasChildMessage")
                    spnConfirm.Visible = True
                    Exit Sub
                End If
            End If

            aRelatedDataObjNode = aDefinitionNode.SelectSingleNode("DisplayProperty/Control/Action/Parameters/RelatedDataObjects")

            If aRelatedDataObjNode Is Nothing Then
                aRelatedDataObjNode = aDefinitionNode.SelectSingleNode("DisplayProperty/Parameters/Argument/Control/Action/Parameters/RelatedDataObjects")
            End If

            If Not aRelatedDataObjNode Is Nothing Then
                EventController_Delete(aRelatedDataObjNode, aDefinitionKey, aPrimaryKeyValue, GetUserID())
                'EventController_Delete(aRelatedDataObjNode, aDefinitionKey, aPrimaryKeyValue)
            End If
				
            aDataObj = mDataObjHash(aPrimaryKeyValue)
            aDataObj.DataObjectList.UserID = GetUserID()
			
			me.WebSession.DataObjectFactory.DeleteData(aDataObj)
            'EventController_Delete(aDefinitionKey, aPrimaryKeyValue)
            CorePage.Redirect()
        End Sub

        '-----------------------------------------------------

        Private Function GetUserID() As Integer
			if not WebSession.User("cEGStaffUser") is nothing then
				return CType(WebSession.User("cEGStaffUser"), cEGUser).UserID
			else if not WebSession.User("cEGHomeUser") is nothing then
				return CType(WebSession.User("cEGHomeUser"), cEGUser).UserID
			else if not WebSession.User("cEGGuestUser") is nothing then
				return CType(WebSession.User("cEGGuestUser"), cEGUser).UserID
			end if
			
			return 0
		End Function

		'-----------------------------------------------------

        Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
            Dim i As Integer = 0

            Dim aDataObjectList As cDataObjectList
            Dim aChildDataObject As cDataObject
            Dim aControlNodeList As XmlNodeList
            Dim aControlNode As XmlNode
            Dim aChildDisplayPropertyNode As XmlNode
            Dim aCtl As cCoreCtl
            Dim aControlID As String

            If IndexControls Then
                aControlNodeList = aDisplayPropertyNode.SelectNodes("Control/DisplayProperty/Control")
                If Not aDataObject Is Nothing Then
                    aDataObjectList = aDataObject.DataObjectList
                    For Each aChildDataObject In aDataObjectList
                        For Each aControlNode In aControlNodeList
                            aChildDisplayPropertyNode = aControlNode.ParentNode
                            aControlID = cXMLDoc.AttributeToString(aControlNode, "ID")
							aCtl = CType(mControlHashtables(aControlID)(aChildDataObject(aChildDataObject.PrimaryKey)), cCoreCtl)
							if not aCtl is nothing then
								aCtl.CoreCtl_SetDataObjectValueFromCtl(aChildDisplayPropertyNode, aChildDataObject)
							end if
                        Next
                    Next
                End If
            End If
        End Sub

        '-----------------------------------------------------

        Public Overrides Sub CoreCtl_SetDataObjectCheckedPropertyFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByRef aDataObjectList As cDataObjectList)
            Dim aControlNode As XmlNode
            Dim aChildDisplayPropertyNode As XmlNode
            Dim aCtl As cCoreCtl
            Dim aControlID As String
            Dim aIndex As Integer
            Dim aCount As Integer

            If IndexControls Then
                aControlNode = aDisplayPropertyNode.SelectSingleNode("Control/DisplayProperty/Control")
                aCount = aDataObjectList.Count - 1

                For aIndex = 0 To aCount
                    aChildDisplayPropertyNode = aControlNode.ParentNode
                    aControlID = cXMLDoc.AttributeToString(aControlNode, "ID")
                    aCtl = CType(mControlHashtables(aControlID)(aDataObjectList(aIndex)(aDataObjectList(aIndex).PrimaryKey)), cCoreCtl)
                    aCtl.CoreCtl_SetDataObjectValueFromCtl(aChildDisplayPropertyNode, aDataObjectList(aIndex))

                    If aDataObjectList(aIndex).Checked = False Then
                        aDataObjectList.Remove(aDataObjectList(aIndex))

                        If aDataObjectList.Count = aIndex Then Exit For

                        aIndex = aIndex - 1
                    End If
                Next
            End If
        End Sub

        '-----------------------------------------------------

        Public Overloads Overrides Function EventController_GetActionTarget(ByVal aActionKey As String, _
                  ByVal aActionNode As XmlNode, ByVal aSrc As Object) As Object
            Select Case aActionKey
                Case "DataPresenter"
                    Return Me.EventController
                Case "DataPresenterControl"
                    Return Me.EventController.EventController_GetActionTarget("EventControllerControl", aActionNode, aSrc)
                Case Else
                    Return MyBase.EventController_GetActionTarget(aActionKey, aActionNode, aSrc)
            End Select
        End Function

        '-----------------------------------------------------

        Public Overrides Function EventController_GetArgumentValue(ByVal aArgumentNode As XmlNode, ByVal aDataObject As cDataObject) As String
            Dim aType As String
            Dim aTypeKey As String

            aType = cXMLDoc.AttributeToString(aArgumentNode, "Type")
            aTypeKey = cXMLDoc.AttributeToString(aArgumentNode, "TypeKey")

            Select Case aType
                Case "DataPresenter"
                    Return cReflection.Invoke_Property((Me.EventController), aTypeKey).ToString()
                Case "DataObjectCollection"
                    Return Me.EventController.EventController_GetArgumentValue(aArgumentNode, aDataObject)
                Case Else
                    Return MyBase.EventController_GetArgumentValue(aArgumentNode, aDataObject)
            End Select
        End Function

        '-----------------------------------------------------

        Public Function DataListCtl_GetControl(ByVal aColID As String, ByVal aRowKey As Integer) As cCoreCtl
            Dim aHash As Hashtable
            Dim aCtl As cCoreCtl

            aHash = DataListCtl_GetControlCollection(aColID)
            aCtl = CType(aHash(aRowKey), cCoreCtl)
            Return aCtl

        End Function

        '-----------------------------------------------------

        Public Function DataListCtl_GetControlCollection(ByVal aColID As String) As Hashtable

            Return CType(mControlHashtables(aColID), Hashtable)

        End Function
        
        '-------------------------------------------------------------

        Public Overloads Sub EventController_Copy(ByVal aPrimaryKeyValue As String, aDescriptionKey As String)
            Dim aDefinitionNode As XmlNode
            Dim aDefinitionKey As String
            Dim aRelatedDataObjNode As XmlNode
            Dim aRecordCheckNode As XmlNode
            Dim aDataObjNodeList As XmlNodeList
			dim aDataObj as cDataObject
			
            aDefinitionNode = Me.DisplayPropertyNode.SelectSingleNode("Control")
            aDefinitionKey = cXMLDoc.AttributeToString(aDefinitionNode, "DataObjectDefinitionKey")
			
			if aDefinitionKey = "" then
				aDefinitionKey = cXMLDoc.AttributeToString(aDefinitionNode.SelectSingleNode("ancestor::DataObject"), "DataObjectDefinitionKey")
			end if

            EventController_Copy(aDefinitionKey, aPrimaryKeyValue, aDescriptionKey)
			
            CorePage.Redirect()
        End Sub
        
        Private Function EncodeHTML(ByVal aValue As String) As String
			If mHTMLEncode Then
				Return Server.HtmlEncode(aValue)
			Else
				Return aValue
			End If
		End Function

		'--------------------------------------------------------------------------------   

		Private Function WordBreak(ByVal aDisplayPropertyNode As XmlNode) As Boolean
			WordBreak = cXMLDoc.AttributeToString(aDisplayPropertyNode, "WordBreak", "False")
		End Function


        '================================================================================ 
End Class 'cDataListCtl

End Namespace 'Core_Web.Controls.Base
