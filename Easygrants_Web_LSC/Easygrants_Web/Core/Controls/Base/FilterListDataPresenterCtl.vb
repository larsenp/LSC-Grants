Imports System.Xml
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Text

Namespace Core_Web.Controls.Base

Public Class cFilterListDataPresenterCtl
    Inherits cDataPresenterCtl
'=============================================================

    Private mCriteria As Hashtable = New Hashtable()
	
    Protected spnList As HtmlControl
    Protected spnNoResult As HtmlGenericControl
        Protected spnOrgNoResults As HtmlGenericControl
        Protected mURL As String

'=============================================================

	Public ReadOnly Property CriteriaPresent() As Boolean
	Get
		Return mCriteria.Keys.Count > 0
	End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property IsFindClicked() As Boolean
	Get
		Return Request.QueryString("Find") = "True"
	End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property ResultListsNode() As XmlNode
		Get
			Return mXMLDoc.DocElement.SelectSingleNode("ResultLists")
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property ResultListsNodeList() As XmlNodeList
		Get
			Return ResultListsNode.SelectNodes("ResultList")
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property PrimaryResultListKey() As String
		Get
			'return first ResultList Key
			Return cXMLDoc.AttributeToString(ResultListsNode.SelectSingleNode("ResultList"), "Key")
		End Get
	End Property

'=============================================================

	Public Function FilteredListsNodeList_Node(ByVal aKey As String) As XmlNode
		Return cXMLDoc.FindNode(ResultListsNode, "ResultList", "Key", aKey)
	End Function

'-------------------------------------------------------------

	Public Function Get_ResultListNode_Key(ByVal aResultNode As XmlNode) As String
		Return cXMLDoc.AttributeToString(aResultNode, "Key", "")
	End Function

'-------------------------------------------------------------

	Public Function Get_ResultListNode_InnerText(ByVal aResultNode As XmlNode) As String
		Return aResultNode.InnerText
	End Function

'-------------------------------------------------------------

	Public Function Get_ControlNode_From_DisplayNode_And_ListKey(ByVal aDisplayNode As XmlNode, ByVal aListKey As String) _
						As XmlNode
		Return cXMLDoc.FindNodeWithChildNode(aDisplayNode, "Control", "FilterList", "List", aListKey)
	End Function

'-------------------------------------------------------------

	Public Function Get_FilterListNode_From_ControlNode_And_ListKey(ByVal aControlNode As XmlNode, ByVal aListKey As String) _
						As XmlNode
		Return cXMLDoc.FindNode(aControlNode, "FilterList", "List", aListKey)
	End Function

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		Dim aResultListNode As XmlNode
		Dim aFilterDataObjectElement As XmlElement
		Dim aDisplayPropertyNodeList As XmlNodeList
		Dim aDisplayPropertyNode As XmlNode
		Dim aFilterKey As String
		Dim aControlNode As XmlNode
		Dim aValue As String
		Dim aControlID As String
		Dim aControlType As String
		Dim aControl As cCoreCtl
		Dim aDataObjectList As cDataObjectList
		Dim aNoResult As StringBuilder = New StringBuilder()

		'aDataObjectList = CType(mDataObjHash("List"), cDataObjectList)
		For Each aResultListNode In ResultListsNodeList
                aDataObjectList = CType(mDataObjHash(Get_ResultListNode_Key(aResultListNode)), cDataObjectList)
			If Not aDataObjectList Is Nothing Then
                    If mCriteria.Count > 0 And aDataObjectList.Count = 0 Then
                        If Not aResultListNode.Attributes.ItemOf("noresultspan") Is Nothing Then
							spnOrgNoResults.InnerHtml = "<p><b><font color='red'>No " & ConfigurableText(Get_ResultListNode_InnerText(aResultListNode)) & " results were found matching your search criteria."
                        Else
                            aNoResult.Append("<p><b><font color='red'>No ")
                            aNoResult.Append(Get_ResultListNode_InnerText(aResultListNode))
                            aNoResult.Append(" results were found matching your search criteria.")
                        End If

                    End If
			End If
		Next
		spnNoResult.InnerHtml = ConfigurableText(aNoResult.ToString())

		aFilterDataObjectElement = cXMLDoc.FindNode(mXMLDoc.DocElement, "DataObject", "Key", "Filter")
		aDisplayPropertyNodeList = aFilterDataObjectElement.SelectNodes("DisplayProperties/DisplayProperty")
		For Each aDisplayPropertyNode In aDisplayPropertyNodeList
			aControlNode = Get_ControlNode_From_DisplayNode_And_ListKey(aDisplayPropertyNode, PrimaryResultListKey)
			If Not aControlNode Is Nothing Then
				aFilterKey = cXMLDoc.AttributeToString(aControlNode, "FilterKey", "")
				If Not aFilterKey = "" Then
					aValue = mCriteria(aFilterKey)
					If Not aValue Is Nothing Then
						aControlID = cXMLDoc.AttributeToString(aControlNode, "ID")
						aControlType = cXMLDoc.AttributeToString(aControlNode, "Type")
						aControl = FindControl(aControlID)
						Select Case aControlType
							Case "cTextBox"
								CType(aControl, cTextBox).Value = aValue
							Case "cDropDown"
								CType(aControl, cDropDown).SelectedField = aValue
						End Select
					End If
				End If
			End If
		Next
	End Sub
	
'-----------------------------------------------------

'		Public Overrides Sub LoadConfigXML()
'            'Create XML object from spnConfigXML.InnerText
'            Me.mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
            
'            if me.IsPostBack then
'				dim aObjNode as XmlNode = cXMLDoc.FindNode(mXMLDoc.DocElement, "DataObject", "Key", "Filter")
'				dim aResultNode as XmlNode = mXMLDoc.DocElement.SelectSingleNode("ResultLists")
'				mXMLDoc.LoadFromXML("<a>" + aResultNode.OuterXml + aObjNode.OuterXml + "</a>")
'			end if
'		End Sub

''-------------------------------------------------------------

'		Public Overrides Sub EventController_ControlClicked(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
'			Dim aCtl As cCoreCtl = MyBase.GetCoreControlFromEventSource(CType(aSrc, Control))
            
'            If aCtl.ClientID <> "mPageFrameCtl_ctlPageContent_btnShow" Then
                
'            End If
            
'            MyBase.EventController_ControlClicked(aSrc, aEvent)
'        End Sub
        
'-------------------------------------------------------------

	Protected Overrides Sub ProcessFilters(ByRef aDataObjectElement As XmlElement)
		Dim aFilterDataObjectElement As XmlElement
		Dim aFilterNode As XmlNode
		Dim aDisplayNodeList As XmlNodeList
		Dim aDisplayNode As XmlNode
		Dim aControlNode As XmlNode
		Dim aFilterListNode As XmlNode
		Dim aFilterProperty As String
		Dim aFilterKey As String
		Dim aFilterOperator As String
		Dim aChildProperty As String
		Dim aRelatedProperty As String
		Dim aArgumentNode As XmlNode
		Dim aRelatedPropertyNode As XmlNode
		Dim aIndex As Integer
		Dim aRelatedProperties As String()
		Dim aStr As String
		Dim aListKey As String
		Dim aMasterDefNode As XmlNode
		Dim aObjDefNode As XmlNode
		Dim aObjDefPropertyNode As XmlNode
		Dim aJoinedDataObjects As Hashtable = New Hashtable()
		Dim aJoinedDataObject As cJoinedDataObject
		Dim aObjName As String
		Dim aChildDataObjKey As String
		Dim aChildPropertyNode as XmlNode
		Dim aFilterList As XmlNodeList
		Dim aFilterListNodeList As XmlNodeList
		Dim aJoin As String
		'[aWFTADefNode = WebAppl.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='WfTaskAssignment']")

		aListKey = cXMLDoc.AttributeToString(aDataObjectElement, "Key")
		'if FilteredListsNodeList_Node(aListKey) is nothing or aListKey <> "PerList" then
		If FilteredListsNodeList_Node(aListKey) Is Nothing Then
			MyBase.ProcessFilters(aDataObjectElement)
			Exit Sub
		End If

		aStr = cXMLDoc.AttributeToString(aDataObjectElement, "DataObjectDefinitionKey", "")
		aMasterDefNode = cXMLDoc.FindNode(WebAppl.DataDefinitionDoc.DocElement, _
						"DataObjectDefinitions/Definition", "Key", aStr)
		aObjDefNode = aMasterDefNode

		aFilterDataObjectElement = cXMLDoc.FindNode(aDataObjectElement.ParentNode, "DataObject", "Key", "Filter")

		aFilterNode = aDataObjectElement.SelectSingleNode("Filters")
		If aFilterNode Is Nothing Then
			Exit Sub
		End If

		aDisplayNodeList = aFilterDataObjectElement.SelectNodes("DisplayProperties/DisplayProperty")
		For Each aDisplayNode In aDisplayNodeList
			aControlNode = cXMLDoc.FindNodeWithChildNode(aDisplayNode, "Control", "FilterList", "List", aListKey)
			If Not aControlNode Is Nothing Then
				aFilterListNodeList = cXMLDoc.FindNodes(aControlNode, "FilterList", "List", aListKey)
				Dim aFilterListNodeIndex As Integer
				Dim aArgOperator As String
				If aFilterListNodeList.Count > 1 Then
					aArgOperator = "Or"
				Else
					aArgOperator = "And"
				End If
				For aFilterListNodeIndex = 0 to aFilterListNodeList.Count - 1
					aFilterListNode = aFilterListNodeList.Item(aFilterListNodeIndex)
					aFilterProperty = cXMLDoc.AttributeToString(aFilterListNode, "Property")
					aFilterOperator = cXMLDoc.AttributeToString(aFilterListNode, "Operator", "")
					aJoin = cXMLDoc.AttributeToString(aFilterListNode, "Join", "None")
					aFilterKey = cXMLDoc.AttributeToString(aControlNode, "FilterKey")
					If aFilterKey <> "" Then
						'If a value was passed in the query string for this property, create a filter argument node.
						If Request.QueryString(aFilterKey) <> "" Then
							'Check to see if it is a related property
							aIndex = aFilterProperty.LastIndexOf(".")
							If aFilterListNodeIndex = 0 AndAlso aFilterListNodeList.Count > 1 Then
								aArgumentNode = WebSession.DataObjectFactory.CreateGroupArgumentNode(mXMLDoc, "(", "And")
								aFilterNode.AppendChild(aArgumentNode)
							End If
							If aIndex <> -1 Then
								aRelatedProperty = aFilterProperty.Substring(0, aIndex)

								aObjDefNode = aMasterDefNode
								aRelatedProperties = aRelatedProperty.Split(".")

								'The SQL Data Provider does not automatically handle elimination of duplicate joins. If a single table
								'is referenced more than once in the 
								For Each aStr In aRelatedProperties
									aObjDefPropertyNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" & aStr & "']/Relationship")
									aChildDataObjKey = cXMLDoc.AttributeToString(aObjDefPropertyNode, "ChildDefinitionKey")
									If aJoinedDataObjects(aChildDataObjKey) Is Nothing Then
										aJoinedDataObject = New cJoinedDataObject(aFilterProperty, aRelatedProperties.Length)
										aJoinedDataObjects.Add(aChildDataObjKey, aJoinedDataObject)
									ElseIf CType(aJoinedDataObjects(aChildDataObjKey), cJoinedDataObject).Depth < aRelatedProperties.Length Then
										CType(aJoinedDataObjects(aChildDataObjKey), cJoinedDataObject).Depth = aRelatedProperties.Length
										CType(aJoinedDataObjects(aChildDataObjKey), cJoinedDataObject).FilterProperty = aFilterProperty
									End If
									aObjDefNode = aObjDefNode.ParentNode.SelectSingleNode("Definition[@Key='" + aChildDataObjKey + "']")
								Next

								aChildProperty = aFilterProperty.Substring(aIndex + 1)
								If aFilterListNodeIndex = 0 AndAlso aFilterListNodeList.Count > 1 Then
									aArgumentNode = WebSession.DataObjectFactory.CreateArgumentNode(mxmldoc, "", aChildProperty, Request.QueryString(aFilterKey), "")
								Else
									aArgumentNode = WebSession.DataObjectFactory.CreateArgumentNode(mxmldoc, "", aChildProperty, Request.QueryString(aFilterKey), aArgOperator)
								End If
								
								aRelatedPropertyNode = WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(mXmlDoc, aRelatedProperty)
								'Set Join attribute to "None" for all related property nodes. This attribute will be reset
								'later as appropriate.
								mxmldoc.AddAttribute_ToNode(aRelatedPropertyNode, "Join")
								aRelatedPropertyNode.Attributes("Join").Value = aJoin
								aArgumentNode.AppendChild(aRelatedPropertyNode)

								'Add FilterProperty node to all Argument nodes so that they can be identified later
								mxmldoc.AddAttribute_ToNode(aArgumentNode, "FilterKey")
								aArgumentNode.Attributes("FilterKey").Value = aFilterProperty
							Else
								aObjDefNode = aMasterDefNode
								If aFilterListNodeIndex = 0 AndAlso aFilterListNodeList.Count > 1 Then
									aArgumentNode = WebSession.DataObjectFactory.CreateArgumentNode(mxmldoc, "", aFilterProperty, Request.QueryString(aFilterKey), "")
								Else
									aArgumentNode = WebSession.DataObjectFactory.CreateArgumentNode(mxmldoc, "", aFilterProperty, Request.QueryString(aFilterKey), aArgOperator)
								End If
								aChildProperty = aFilterProperty
							End If

							'If filter criterion comes from a textbox and textbox represents a String data type, 
							'use "like" operator instead of "equals"
							If Not aFilterOperator = "" Then
								cXMLDoc.AddAttribute_ToNode(aArgumentNode, "Operator")
								aArgumentNode.Attributes("Operator").Value = aFilterOperator
							ElseIf cXMLDoc.AttributeToString(aControlNode, "Type") = "cTextBox" Then
								aChildPropertyNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aChildProperty + "']")
								If cXMLDoc.AttributeToString(aChildPropertyNode, "DataType") = "String" Then
									cXMLDoc.AddAttribute_ToNode(aArgumentNode, "Operator")
										aArgumentNode.Attributes("Operator").Value = "Like"
								End If
							End If

							'Add argument to Filter node
							aFilterNode.AppendChild(aArgumentNode)
							'Add entry to criteria hashtable
							If mCriteria.Item(aFilterKey) Is Nothing Then
								mCriteria.Add(aFilterKey, Request.QueryString(aFilterKey))
							End If
							If aFilterListNodeIndex = aFilterListNodeList.Count - 1 AndAlso aFilterListNodeList.Count > 1 Then
								aArgumentNode = WebSession.DataObjectFactory.CreateGroupArgumentNode(mXMLDoc, ")", "")
								aFilterNode.AppendChild(aArgumentNode)
							End If
						End If
					End If
				Next
			End If
		Next
		'Loop through hashtable to turn on joins for related properties
		For Each aJoinedDataObject In aJoinedDataObjects.Values
			aFilterProperty = aJoinedDataObject.FilterProperty
			aArgumentNode = aFilterNode.SelectSingleNode("Argument[@FilterKey='" & aFilterProperty & "']")
			aRelatedPropertyNode = aArgumentNode.SelectSingleNode("RelatedProperty")
			If cXMLDoc.AttributeToString(aRelatedPropertyNode, "Join") = "None" Then
				aRelatedPropertyNode.Attributes("Join").Value = ""
			End If
		Next

		If CriteriaPresent Then
			'Set the GetData attribute in the data object element to allow it 
			'to retrieve data
			aDataObjectElement.Attributes("GetData").Value = "True"
		ElseIf IsFindClicked Then
			aDataObjectElement.Attributes("GetData").Value = "True"
		End If

		EventController_SetArgumentsInNodeList(aFilterNode)
	End Sub

'-----------------------------------------------------

	Public Sub FilterListDataPresenter_Find()
		Dim aURL As String
		Dim aKey As String
		Dim aDataObjectNode As XmlNode
		Dim aDisplayNodeList As XmlNodeList
		Dim aDataObjNodeList As XmlNodeList
		Dim aDisplayNode As XmlNode
		Dim aControlNode As XmlNode
		Dim aCtl As cCoreCtl
		Dim aFilterKey As String
		Dim aControlType As String
		Dim aValue As String
		Dim aControlID As String

		Page.Validate
		If Not Page.IsValid Then
			Exit Sub
		End If
		
		If mURL = "" Then
			aURL = Request.Url.ToString
		Else
			aURL = mURL
		End If

		For Each aKey In mCriteria.Keys
			aURL = cWebLib.RemoveQuerystringParameter(aURL, aKey)
		Next

		'aURL = cWebLib.RemoveQuerystringParameter(aURL, "ShowParams")
		aURL = cWebLib.AddQuerystringParameter(aURL, "ShowParams", "False")

		
		aDataObjNodeList = mXMLDoc.DocElement.SelectNodes("DataObject")

		For Each aDataObjectNode In aDataObjNodeList
			If aDataObjectNode.Attributes("Key").Value.ToString() <> "Filter" Then
				aControlID = aDataObjectNode.SelectSingleNode("DisplayProperties/DisplayProperty/Control").Attributes("ID").Value.ToString()
				aURL = cWebLib.RemoveQuerystringParameter(aURL, aControlID + "_" + "ctlPaging_CurRow")
			End If
		Next

		'aURL = cWebLib.RemoveQuerystringParameter(aURL, "ctlPaging_CurRow")

		'Adding "Find=True" to the querystring to identify that Find button has been clicked. This is to handle FIND ALL
		aURL = cWebLib.AddQuerystringParameter(aURL, "Find", "True")

		'Get collection of all criteria controls
		aDataObjectNode = cXMLDoc.FindNode(mXMLDoc.DocElement, "DataObject", "Key", "Filter")
		aDisplayNodeList = aDataObjectNode.SelectNodes("DisplayProperties/DisplayProperty")
		For Each aDisplayNode In aDisplayNodeList
			aControlNode = Get_ControlNode_From_DisplayNode_And_ListKey(aDisplayNode, PrimaryResultListKey)
			If Not aControlNode Is Nothing Then
				aFilterKey = cXMLDoc.AttributeToString(aControlNode, "FilterKey", "")
				If aFilterKey <> "" Then
					'For each criteria control, get control and value
					aCtl = FindControl(cXMLDoc.AttributeToString(aControlNode, "ID"))
					aControlType = cXMLDoc.AttributeToString(aControlNode, "Type")
					Select Case aControlType
						Case "cTextBox"
							aValue = CType(aCtl, cTextBox).Value
						Case "cDropDown"
							aValue = CType(aCtl, cDropDown).SelectedField
					End Select
					'If control value is something, add query string
					If aValue <> "" Then
						aURL = cWebLib.AddQuerystringParameter(aURL, aFilterKey, aValue)
					Else
						aURL = cWebLib.RemoveQuerystringParameter(aURL, aFilterKey)
					End If
				End If
			End If
		Next

		'Navigate to URL plus query string
		EventController_NavigateToURL(aURL)
	End Sub

'=============================================================

	Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList

		If Request.QueryString("Find") = "True" Then
			Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
		Else
			'Get filter definitions from spnConfigXML
			ProcessFilters(aDataObjectElement)

			'Get sort definitions from spnConfigXML
			ProcessSorts(aDataObjectElement)
			Return Nothing
		End If
	End Function

'=============================================================

Private Class cJoinedDataObject

'=============================================================

	Private mFilterProperty As String
	Private mDepth As String


'=============================================================

	Public Property FilterProperty() As String
	Get
		Return mFilterProperty
	End Get
	Set(ByVal Value As String)
		mFilterProperty = Value
	End Set
	End Property

'-----------------------------------------------------

	Public Property Depth() As String
	Get
		Return mDepth
	End Get
	Set(ByVal Value As String)
		mDepth = Value
	End Set
	End Property

'=============================================================

	Public Sub New(ByVal aFilterProperty As String, ByVal aDepth As String)
		FilterProperty = aFilterProperty
		Depth = aDepth
	End Sub

'=============================================================

End Class
'=============================================================
'=============================================================
End Class

End Namespace