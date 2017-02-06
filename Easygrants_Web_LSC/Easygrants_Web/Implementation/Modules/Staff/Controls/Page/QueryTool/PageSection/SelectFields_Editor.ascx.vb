Imports System.Xml
Imports System.Diagnostics
Imports Core.DataAccess
Imports Core.DataAccess.DBAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Util
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.DataAccess.Report
Imports EasyGrants.Web
Imports EasyGrants.Web.User
Imports Easygrants_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.QueryTool.PageSection

Public MustInherit Class cSelectFields_Editor
    'Inherits Core.Web.cCoreCtl
    'Inherits Core.Web.cEventController
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
'========================================================

    Private mFieldsList As SortedList 'key represents display name; value represents actual property name
    Private mDODefinitions As Hashtable 'List of data object definitions included in field list, used to avoid duplicate entries and thus infinite loops in building fields list
    Private mAdHocQueryConfigXMLDoc As cXMLDoc 'Ad Hoc Query Configuration XML document
    Private mQueryToolDefinitionXMLDoc As cXMLDoc 'Query Tool Definition XML document
    Private mQueryToolDefinitionNode As XmlNode
	Private mJoinedDataObjects As Hashtable
	
	'Protected mTestText As String = "Test Text"
	'Protected ctlLoader As cUserCtlLoader
    'Protected spnActionText As HtmlGenericControl
	'Protected spnCategory As HtmlGenericControl
	Protected spnCategorySelected As HtmlGenericControl
    'Protected spnOutput As HtmlGenericControl
    Protected ctlSelect As cDoubleListBox
    Protected ctlSort As cDoubleListBox
    'Protected ctlBoolean As DropDownList
    'Protected ctlField As DropDownList
    'Protected ctlGroupFields As cDropDown
   ' Protected ctlOperator As DropDownList
    'Protected txtValue As TextBox
    'Protected btnAddGroup As cButton
    'Protected btnAddFilter As cButton
    'Protected btnSaveFilter As cButton
    'Protected btnCancel As cButton
   ' Protected tabFilters As HtmlTable
    'Protected tabGroupBy As HtmlTable
	Protected btnContinue As cCSSButton
	'Protected btnSaveAs As cButton
    'Protected chkDistinct As CheckBox
    Public spnSelect As HtmlGenericControl
    'Protected spnSort As HtmlGenericControl
    'Protected spnFilters As HtmlGenericControl
    'Protected spnSave As HtmlGenericControl
    Protected spnOpen As HtmlGenericControl
    'Protected lnkAll As cLink
    'Protected lnkSelect As cLink
    'Protected lnkSort As cLink
    'Protected lnkFilters As cLink
    'Protected lnkSave As cLink
   ' Protected txtQueryName As TextBox
    'Protected txtQueryDescription as TextBox
   ' Protected ddlQueryGroup As DropDownList
    'Protected chkPrivate as CheckBox
    Protected lnkView As cLink
   
	'Protected lnkExcel As cLink

    'Protected lnkMerge As cLink

	'Protected lnkEmailUtility As cLink

	Protected ctlViewResults As cNewWindowOpener
	'Protected ctlViewExcel As cNewWindowOpener
    Protected valReqSelect As RequiredFieldValidator
    'Protected valReqQueryName As RequiredFieldValidator
    'Protected valReqValue As RequiredFieldValidator
    'Protected valCusDistinctSort As CustomValidator
    'Protected valCusSave As CustomValidator
   ' Protected valCusSaveAs As CustomValidator
    
    'Private Const constPrivate = 1
    'Private Const constPublic = 2

'========================================================

    Public Property SavedQueryDO() As cSavedQuery
    Get
        Return CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).GetSavedQueryDO
    End Get
    Set(ByVal Value As cSavedQuery)
        CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).SavedQueryDO = Value
    End Set
    End Property

'--------------------------------------------------------

    Public Property AdHocQueryDefXMLDoc() As cXMLDoc
    Get
        Return SavedQueryDO.SavedQueryDefXMLDoc
    End Get
    Set(ByVal Value As cXMLDoc)
        SavedQueryDO.SavedQueryDefXMLDoc = Value
    End Set
    End Property

'-------------------------------------------------------------

    Public ReadOnly Property QueryResultsWindowURL()
        Get
            QueryResultsWindowURL = WebAppl.Build_RootURL("Implementation/Modules/Staff/Controls/Page/QueryTool/pgQueryResults.aspx?UserKey=" + CType(Page, cModulePage).ModuleUser.GetWebSessionKey)
        End Get
    End Property

'-------------------------------------------------------------

    Public ReadOnly Property ExcelWindowBaseURL()
        Get
            'Return WebAppl.Build_RootURL("Core/Controls/Base/pgReportOutputReader.aspx")
            Return WebAppl.Build_RootURL(WebAppl.Get_ControlSrc("cpgReportOutputReader"))
        End Get
    End Property

'========================================================

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
        Dim aCategory As String 'Category selected by user
		Dim aBaseDODKey As String	   'Category selected by user
		Dim aPropertiesNode as XmlNode
		Dim aQueryToolDefFileName as String
		'spnActionText.Visible = True
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		'ctlGroupFields.EnableViewState = True
		'ctlGroupFields.AutoPostBack = True

		ctlViewResults.NewWindowURL = QueryResultsWindowURL
		ctlViewResults.RefreshURL = GetCurrentQueryURL()
        Select Case Request.QueryString("Display").Substring(0,1) 'Hack. If an anchor reference is included at the end of the URL, .NET includes that anchor in the QueryString collection, so Request.QueryString("Display") might return "0#Filters". PL 4/28/05
            Case "0"
                spnSelect.Visible = True
                'spnSort.Visible = True
                'spnFilters.Visible = True
                'spnSave.Visible = True
                'lnkAll.Href = ""
            Case "1"
                spnSelect.Visible = True
                'lnkSelect.Href = ""
            Case "2"
                'spnSort.Visible = True
                'lnkSort.Href = ""
            Case "3"
                'spnFilters.Visible = True
                'lnkFilters.Href = ""
            Case "4"
                'spnSave.Visible = True
                'lnkSave.Href = ""
        End Select
        'lnkEmailUtility.Set_ServerClick(AddressOf lnkEmailUtility_Click)
        'lnkMerge.Set_ServerClick(AddressOf lnkMerge_Click)

	
        lnkView.Set_ServerClick(AddressOf lnkView_Click)
        
        'lnkExcel.Set_ServerClick(AddressOf lnkExcel_Click)
     
        'ctlGroupFields.Set_ServerIndexChange(AddressOf ctlGroupFields_Changed)

        'lnkAll.Add_Attribute("Display", "0")
        'lnkAll.Set_ServerClick(AddressOf SetDisplay)
        'lnkSelect.Add_Attribute("Display", "1")
        'lnkSelect.Set_ServerClick(AddressOf SetDisplay)
        'lnkSort.Add_Attribute("Display", "2")
        'lnkSort.Set_ServerClick(AddressOf SetDisplay)
        'lnkFilters.Add_Attribute("Display", "3")
        'lnkFilters.Set_ServerClick(AddressOf SetDisplay)
        'lnkSave.Add_Attribute("Display", "4")
        'lnkSave.Set_ServerClick(AddressOf SetDisplay)

		'commented out for new query tool, kda
		'If Request.QueryString("EditFilterKey") Is Nothing Then
		'	btnAddFilter.Set_ServerClick(AddressOf btnAddFilter_Click)
		'	btnSaveFilter.Visible = False
		'Else
		'	btnSaveFilter.Set_ServerClick(AddressOf btnSaveFilter_Click)
		'	btnAddFilter.Visible = False
		'End If
		'commented out for new query tool, kda
		'btnAddGroup.Set_ServerClick(AddressOf btnAddGroup_Click)
        btnContinue.Set_ServerClick(AddressOf btnContinue_Click)
		'btnSaveAs.Set_ServerClick(AddressOf btnSaveAs_Click)
       ' btnCancel.Set_ServerClick(AddressOf btnCancel_Click)

        mFieldsList = New SortedList()
        mDODefinitions = New Hashtable()
 
        'use node in EGConfig
        'if node is not there, use what was there as default

		aPropertiesNode = WebAppl.ConfigDoc.FindNode(WebAppl.ConfigDoc.DocElement, "Appl/Properties", _
								"Key", "Dev")
        aQueryToolDefFileName = cXMLDoc.AttributeToString(aPropertiesNode, "DataDefinition", _
									"EasyGrants\Modules\Staff\Controls\Page\Reports\AdHocQueryDefinition.xml")                
 		'aQueryToolDefFileName = cXMLDoc.AttributeToString(aPropertiesNode, "QueryToolDefinition", _
									'"EasyGrants\Modules\Staff\Controls\Page\Reports\AdHocQueryDefinition.xml") 
		aQueryToolDefFileName = aQueryToolDefFileName.Substring(aQueryToolDefFileName.LastIndexOf("/Easy"))   
        'TEMPORARY HACK BY KEITH TO ADDRESS THE MISMATCHED PROJECT/IMPLEMENTATION LAYER NAMING - 3/3/2005
        'mQueryToolDefinitionXMLDoc = New cXMLDoc(WebAppl.Build_RootFileSystemPath(aQueryToolDefFileName))		
        mQueryToolDefinitionXMLDoc = New cXMLDoc(WebAppl.Build_RootFileSystemPath("/Implementation/DataDefinition.config"))
        'END TEMPORARY HACK
        Select Case Request.QueryString("QueryType")
            Case "New"
				'btnSaveAs.Visible = False
                aCategory = Request.QueryString("Category")
                If aCategory = "" Then
                    'error case

                Else
                    'Retrieve category node from query definition document
                    mQueryToolDefinitionNode = mQueryToolDefinitionXMLDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition/QueryTool[@GroupKey='" + aCategory + "']")
                    mQueryToolDefinitionNode = mQueryToolDefinitionNode.ParentNode
                    'mQueryToolDefinitionNode = mQueryToolDefinitionXMLDoc.DocElement.SelectSingleNode("Category[@Key='" + aCategory + "']")
                    If Not IsPostBack Then
                        aBaseDODKey = cXMLDoc.AttributeToString(mQueryToolDefinitionNode, "Key")
                        'aBaseDODKey = cXMLDoc.AttributeToString(mQueryToolDefinitionNode, "BaseType")
                        'Clear out the query object in memory if there is one
                        SavedQueryDO = Nothing
                        'Instantiate new query object and set its BaseDODKey property
                        SavedQueryDO.BaseDODKey = aBaseDODKey
                        SavedQueryDO.Category = aCategory
                    End If
                End If
            Case "User"
				'If the user selects "Close" on the "Save As" page, the query tool page must load the saved query (in order to get the query name and 
				'description as last saved) but update it with the XML as saved to the session.
				If Request.QueryString("SavedQueryID") Is Nothing Then
					'btnSaveAs.Visible = False
				Else
					Dim aSavedQueryID As String = Request.QueryString("SavedQueryID")
					If aSavedQueryID <> "0" Then
						Dim aSavedQuery As cSavedQuery
						aSavedQuery = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SavedQuery", aSavedQueryID)
						If Not aSavedQuery Is Nothing Then
							aSavedQuery("DataObjectXML") = AdHocQueryDefXMLDoc.DocElement.OuterXml
							SavedQueryDO = aSavedQuery
						End If
					End If
				End If
                aCategory = SavedQueryDO.Category
                mQueryToolDefinitionNode = mQueryToolDefinitionXMLDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition/QueryTool[@GroupKey='" + aCategory + "']")
                mQueryToolDefinitionNode = mQueryToolDefinitionNode.ParentNode
                'mQueryToolDefinitionNode = mQueryToolDefinitionXMLDoc.DocElement.SelectSingleNode("Category[@Key='" + aCategory + "']")
            Case "Saved"
                SavedQueryDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SavedQuery", Request.QueryString("SavedQueryID"))
                aCategory = SavedQueryDO.Category
                mQueryToolDefinitionNode = mQueryToolDefinitionXMLDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition/QueryTool[@GroupKey='" + aCategory + "']")
                mQueryToolDefinitionNode = mQueryToolDefinitionNode.ParentNode
                'mQueryToolDefinitionNode = mQueryToolDefinitionXMLDoc.DocElement.SelectSingleNode("Category[@Key='" + aCategory + "']")
        End Select
        
       If Not Request.QueryString("QueryType") = "New" Then
			If SavedQueryDO.GetPropertyInt("UserID", 0) <> CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).UserID Then
				Response.Redirect(WebAppl.LogoutURL())
			End If
		End If

        'txtQueryName.Text = SavedQueryDO.GetPropertyString("Name")
        'txtQueryDescription.Text = SavedQueryDO.GetPropertyString("Description")
  'commented out for new query tool, kda
  '      If Request.QueryString("QueryType") = "New" Then
		'	chkPrivate.Checked = False
		'Else
		'	If Not Request.QueryString("SavedQueryID") Is Nothing Then
		'		If SavedQueryDO.GetPropertyInt("AccessTypeID") = constPrivate
		'			chkPrivate.Checked = True
		'		Else
		'			chkPrivate.Checked = False
		'		End If				
		'	Else
		'		chkPrivate.Checked = False
		'	End If	
		'End If        
        
        'spnCategory.InnerHtml = aCategory
        spnCategorySelected.InnerHtml = aCategory
        BuildFieldsList(aCategory, "", "")

        'commented out for new qt, kda
        'If cXMLDoc.AttributeToString(AdHocQueryDefXMLDoc.DocElement, "SelectType") = "Distinct" Then
        '    chkDistinct.Checked = True
        'End If
        
        PopulateSelectDoubleListBox()
       ' PopulateSortDoubleListBox()
        'ConfigureBooleanDropDown()
        'ConfigureFieldDropDown()
        'ConfigureOperatorDropDown()
        'ConfigureQueryGroupDropDown()
        'PopulateFiltersTable()
        'commented out for new query tool, kda
        'WriteGroupTableRow()
        
  'commented out for new query tool, kda
  '      If Not Request.QueryString("QueryType") = "New" Then
		'	if Request.QueryString("QueryType") <> "User" then
		'		'ddlQueryGroup.Items.FindByValue(SavedQueryDO.GetPropertyInt("QueryTypeID", 0)).Selected = True
		'	end if
		'	'If cXMLDoc.AttributeToString(AdHocQueryDefXMLDoc.DocElement, "GroupBy") = "" then
		'		'ctlGroupFields.Items.FindByValue("").Selected = True
		'	'Else
		'		'ctlGroupFields.Items.FindByValue(cXMLDoc.AttributeToString(AdHocQueryDefXMLDoc.DocElement, "GroupBy")).Selected = True
		'		'If Not Request.QueryString("GroupBy") Is Nothing Then
		'		'	ctlGroupFields.SelectedField = cXMLDoc.AttributeToString(AdHocQueryDefXMLDoc.DocElement, "GroupBy")
		'		'Else
		'		'	ctlGroupFields.SelectedField = Request.QueryString("GroupBy")
		'		'End If
		'	'End If
		'End If        
        
    End Sub

'--------------------------------------------------------

    Public Sub BuildFieldsList(ByVal aCategory As String, ByVal aBasePropertyName As String, ByVal aBaseDisplayName As String)
        Dim aPropertyNodeList As XmlNodeList

        aPropertyNodeList = mQueryToolDefinitionNode.SelectNodes("Properties/Property/QueryTool[@Key='" + aCategory + "']")
        'aPropertyNodeList = mQueryToolDefinitionNode.SelectNodes("Property")
        BuildFieldsListFromNodeList(aPropertyNodeList, "", aCategory)

    End Sub

'--------------------------------------------------------

    Public Sub BuildFieldsListFromNodeList(ByVal aPropertyNodeList As XmlNodeList, ByVal aBaseProperty As String, ByVal aCategory As String)
        Dim aPropertyNode As XmlNode
        Dim aPropertyName As String
        Dim aDisplayName As String
        Dim aPropertyNodeSubList As XmlNodeList
        Dim aSubCategory As String
  Dim aString As String
		
        For Each aPropertyNode In aPropertyNodeList
			aPropertyNode = aPropertyNode.ParentNode
            aPropertyName = aBaseProperty + cXMLDoc.AttributeToString(aPropertyNode, "Key")
            'aPropertyNodeSubList = aPropertyNode.SelectNodes("Property")
            dim aNode as XmlNode = aPropertyNode.SelectSingleNode("Relationship")
            'If aPropertyNodeSubList.Count > 0 Then
            If not aNode is nothing Then
				if aPropertyName.IndexOf(".") = -1 then
					aSubCategory = cXMLDoc.AttributeToString(aNode.ParentNode.SelectSingleNode("QueryTool[@Key='" + aCategory + "']"), "ChildKey")
				else
					aSubCategory = cXMLDoc.AttributeToString(aNode.ParentNode.SelectSingleNode("QueryTool[@ParentKey='" + aCategory + "']"), "ChildKey")
				end if
				
				dim aDataObjNode as XmlNode = aPropertyNode.ParentNode.ParentNode.ParentNode.SelectSingleNode("Definition[@Key='" _
					+ cXMLDoc.AttributeToString(aNode, "ChildDefinitionKey") + "']")
                aPropertyNodeSubList = aDataObjNode.SelectNodes("Properties/Property/QueryTool[@ParentKey='" + aSubCategory + "']")
				BuildFieldsListFromNodeList(aPropertyNodeSubList, aPropertyName + ".", aSubCategory)
            Else
				if aPropertyName.IndexOf(".") = -1 then
					aDisplayName = cXMLDoc.AttributeToString(aPropertyNode.SelectSingleNode("QueryTool[@Key='" + aCategory + "']"), "DisplayName")
				else
					aDisplayName = cXMLDoc.AttributeToString(aPropertyNode.SelectSingleNode("QueryTool[@ParentKey='" + aCategory + "']"), "DisplayName")
				end if
                'aDisplayName = cXMLDoc.AttributeToString(aPropertyNode, "DisplayName")
                mFieldsList.Add(aDisplayName, aPropertyName)
Debug.Flush()
aString = ""
aString = aString.Concat(aString, aCategory, ",")
aString = aString.Concat(aString, aBaseProperty, ",")
aString = aString.Concat(aString, aDisplayName, ",")
aString = aString.Concat(aString, aPropertyName, ",")
Debug.WriteLine(aString)
                'Debug.WriteLine(aDisplayName + " | " + aPropertyName)
            End If
        Next
    End Sub

'--------------------------------------------------------

    Public Sub BuildFieldsList_OriginalModel(ByVal aDODKey As String, ByVal aBasePropertyName As String, ByVal aBaseDisplayName As String)
        Dim aAHQDODNode As XmlNode 'Ad Hoc Query Data Object Definition node
        Dim aDODNode As XmlNode
        Dim aAHQPropertiesList As XmlNodeList
        Dim aAHQPropertyNode As XmlNode
        Dim aAHQPropertyKey As String
        Dim aDODPropertyNode As XmlNode
        Dim aRelationshipNode As XmlNode
        Dim aRelatedDataDefKey As String
        Dim aRelatedDataDefNode As XmlNode
        Dim aDisplayName As String
        Dim aCurrentPropertyName As String
        Dim aCurrentDisplayName As String

        mDODefinitions.Add(aDODKey, aDODKey)
        aAHQDODNode = mAdHocQueryConfigXMLDoc.DocElement.SelectSingleNode("DataObjectDefinition[@Key='" & aDODKey & "']")
        aDODNode = WebAppl.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" & aDODKey & "']")
        aAHQPropertiesList = aAHQDODNode.SelectNodes("Property")
        For Each aAHQPropertyNode In aAHQPropertiesList

            aAHQPropertyKey = cXMLDoc.AttributeToString(aAHQPropertyNode, "Key")
            If aBasePropertyName = "" Then
                aCurrentPropertyName = aAHQPropertyKey
            Else
                aCurrentPropertyName = aBasePropertyName + "." + aAHQPropertyKey
            End If

            aDisplayName = cXMLDoc.AttributeToString(aAHQPropertyNode, "DisplayName")
            If aBaseDisplayName = "" Then
                aCurrentDisplayName = aDisplayName
            Else
                aCurrentDisplayName = aBaseDisplayName + " - " + aDisplayName
            End If

            aDODPropertyNode = aDODNode.SelectSingleNode("Properties/Property[@Key='" & aAHQPropertyKey & "']")
            aRelationshipNode = aDODPropertyNode.SelectSingleNode("Relationship")
            If aRelationshipNode Is Nothing Then
                mFieldsList.Add(aCurrentPropertyName, aCurrentDisplayName)
            Else
                aRelatedDataDefKey = cXMLDoc.AttributeToString(aRelationshipNode, "ChildDefinitionKey")
                If mDODefinitions(aRelatedDataDefKey) Is Nothing Then
                    'Build field list for this data object definition only if it has not already been built.
                    BuildFieldsList(aRelatedDataDefKey, aCurrentPropertyName, aCurrentDisplayName)
                End If
            End If
        Next
    End Sub


'--------------------------------------------------------

	'commented out for new query tool, kda
    'Public Sub ConfigureCheckBoxList(ByVal aList As CheckBoxList)
    '    Dim aPropertyName As String
    '    Dim aLI As ListItem

    '    For Each aPropertyName In mFieldsList.Keys
    '        aLI = New ListItem(mFieldsList(aPropertyName), aPropertyName)
    '        aList.Items.Add(aLI)
    '    Next
    'End Sub

'--------------------------------------------------------

  'removed for new query tool, kda
  '  Public Sub ConfigureBooleanDropDown()
  '      Dim aItem As ListItem

		''If (Not IsPostBack()) Then
		'	aItem = New ListItem("<None>", "")
		'	ctlBoolean.Items.Add(aItem)
		'	ctlBoolean.Items.Add("And")
		'	ctlBoolean.Items.Add("Or")
  '      'End If
  '  End Sub

'--------------------------------------------------------

  'commented out for new query tool, kda
  '  Public Sub ConfigureFieldDropDown()
  '      Dim aItem As ListItem
  '      Dim aKey As String
  '      Dim aList As ArrayList
  '      Dim aObj As Object

  '      'ctlGroupFields.Items.Add(New ListItem("<None>", ""))
		'For Each aKey In mFieldsList.Keys
		'	aItem = New ListItem(aKey, mFieldsList(aKey))
		'	ctlField.Items.Add(aItem)
		'	'removed for new query tool, kda
		'	'ctlGroupFields.Items.Add(aItem)
		'Next
  '  End Sub
    
'--------------------------------------------------------

  'commented out for new query tool, kda
  '  Public Sub ConfigureQueryGroupDropDown()
  '      Dim aItem As ListItem
  '      Dim aDOL As cDataObjectList
  '      Dim aCompetitionDO As cDataObject
		'Dim aXmlDoc As cXMLDoc
		'Dim aDataObjectNode As XmlNode
        
  '      aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("QueryType", aDataObjectNode)
        
		'aDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		'For Each aCompetitionDO in aDOL
		'	aItem = New ListItem(aCompetitionDO.GetPropertyString("Description"), aCompetitionDO.GetPropertyInt("QueryTypeID"))
		'	ddlQueryGroup.Items.Add(aItem)
		'Next
  '  End Sub

'--------------------------------------------------------

	'commented out for new query tool, kda
  '  Public Sub ConfigureOperatorDropDown()
  '      Dim aItem As ListItem
		''If (Not IsPostBack()) Then
		'	aItem = New ListItem("=", "Equals")
		'	ctlOperator.Items.Add(aItem)

		'	aItem = New ListItem("<>", "NotEqual")
		'	ctlOperator.Items.Add(aItem)

		'	aItem = New ListItem(">", "GreaterThan")
		'	ctlOperator.Items.Add(aItem)

		'	aItem = New ListItem("<", "LessThan")
		'	ctlOperator.Items.Add(aItem)

		'	aItem = New ListItem("Contains", "Like")
		'	ctlOperator.Items.Add(aItem)
		''End If
  '  End Sub

'--------------------------------------------------------

    'commented out for new query tool, kda
    'Public Sub btnAddFilter_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)

    '    'WriteSortNode()
    '    WriteDisplayPropertiesNode()

    '    valReqValue.Validate()
    '    If Not valReqValue.IsValid Then Exit Sub

    '    AddFilterArgumentNode()
    '    RedirectToCurrentQueryWithAnchor("Filters")
    'End Sub

'--------------------------------------------------------

  'commented out for new query tool, kda
  '  Public Sub btnAddGroup_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)

  '      WriteSortNode()
  '      WriteDisplayPropertiesNode()

  '      AdHocQueryDefXMLDoc.DocElement.Attributes("GroupBy").Value = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlGroupFields:selDropDown")
		'RedirectToCurrentQuery()
  '      'AdHocQueryDefXMLDoc.DocElement.Attributes("GroupBy").Value = ctlGroupFields.SelectedValue
  '      'RedirectToCurrentQueryWithAnchor("GroupByField=" + ctlGroupFields.SelectedField)
  '  End Sub

'--------------------------------------------------------

    'commented out for new query tool, kda 
    'Public Sub btnSaveFilter_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)

    '   ' WriteSortNode()
    '    WriteDisplayPropertiesNode()

    '    valReqValue.Validate()
    '    If Not valReqValue.IsValid Then Exit Sub

    '    SaveFilterArgumentNode()
    '    RedirectToCurrentQueryWithAnchor("Filters")
    'End Sub

'--------------------------------------------------------

    Public Sub btnContinue_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
        'WriteSortNode()
        
        WriteDisplayPropertiesNode()
        SavedQueryDO.UpdateXML()
        
        'SavedQueryDO("Name") = txtQueryName.Text
        'SavedQueryDO("Description") = txtQueryDescription.Text
        'SavedQueryDO("Name") = Request.Form.Get("mPageFrameCtl:ctlPageContent:txtQueryName")
        'SavedQueryDO("Description") = Request.Form.Get("mPageFrameCtl:ctlPageContent:txtQueryDescription")
        'SavedQueryDO("QueryTypeID") = Request.Form.Get("mPageFrameCtl:ctlPageContent:ddlQueryGroup")
  '      If Request.Form.Get("mPageFrameCtl:ctlPageContent:chkPrivate") = "on" then
		'	SavedQueryDO("AccessTypeID") = constPrivate
		'Else
		'	SavedQueryDO("AccessTypeID") = constPublic
		'End If
        'SavedQueryDO("UserID") = CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).UserID

        valReqSelect.Validate()
        'valReqQueryName.Validate()
        'valCusDistinctSort.Validate()
        'valCusSave.Validate()
        If Not (valReqSelect.IsValid) Then Exit Sub

        'WebSession.DataObjectFactory.SaveDataObject(CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).SavedQueryDO)
		Dim aSavedQuery As cSavedQuery
		SavedQueryDO("DataObjectXML") = AdHocQueryDefXMLDoc.DocElement.OuterXml
		'SavedQueryDO = aSavedQuery
        'TODO:  make sure to send returnURL to qs so if user has done a search on EL they do not have to run their search twice
        EventController_NavigateToModulePageKey("SelectCriteria")
    End Sub

'--------------------------------------------------------

  'commented out for new query tool, kda
  '  Public Sub btnSaveAs_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		'Dim aNewQuery As cSavedQuery

  '      'WriteSortNode()
  '      WriteDisplayPropertiesNode()
  '      SavedQueryDO.UpdateXML()
        
  '      valReqSelect.Validate()
  '      'valReqQueryName.Validate()
  '      valCusDistinctSort.Validate()
  '      If Not (valReqSelect.IsValid And valReqQueryName.IsValid And valCusDistinctSort.IsValid) Then Exit Sub

  '      aNewQuery = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("SavedQuery")
  '      aNewQuery("DataObjectXML") = SavedQueryDO.GetPropertyString("DataObjectXML")
  '      aNewQuery("Name") = "Copy of " + SavedQueryDO.GetPropertyString("Name")
  '      aNewQuery("Description") = SavedQueryDO.GetPropertyString("Description")
  '      aNewQuery("UserID") = CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).UserID
  '      SavedQueryDO = aNewQuery
        
  '      'Navigate to Save As page, passing the current saved query ID in case the user clicks Close
  '      'to return to this page.
		'EventController_NavigateToModulePageKey("AdHocQuerySaveAs", _
		'		"PreviousSavedQueryID=" + Request.QueryString("SavedQueryID"))
  '  End Sub

'--------------------------------------------------------

	'commented out for new query tool, kda
    'Public Sub btnDelete_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
    '    Dim aKey As String
    '    Dim aFilterNode As XmlNode

    '    'WriteSortNode()
    '    WriteDisplayPropertiesNode()
    '    aKey = aSrc.attributes("Key")
    '    DeleteFilterArgumentNode(aKey)
    '    RedirectToCurrentQuery()
    'End Sub
    
    '--------------------------------------------------------

    'commented out for new query tool, kda
    'Public Sub btnDeleteGroup_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
    '    Dim aKey As String
    '    Dim aFilterNode As XmlNode

    '    'WriteSortNode()
    '    WriteDisplayPropertiesNode()
    '    AdHocQueryDefXMLDoc.DocElement.Attributes("GroupBy").Value = ""
    '    RedirectToCurrentQuery()
    'End Sub

'--------------------------------------------------------


	'commented out for new query tool, kda
    'Public Sub btnEdit_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
    '    Dim aKey As String
    '    Dim aFilterNode As XmlNode

    '    'WriteSortNode()
    '    WriteDisplayPropertiesNode()
    '    aKey = aSrc.attributes("Key")
    '    RedirectToEditFilter(aKey)
    
    'End Sub
    
'--------------------------------------------------------

    'commented out for new query tool, kda
    'Public Sub btnCancel_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
    '    EventController_NavigateToModulePageKey("AdHocQuery")
    'End Sub

'--------------------------------------------------------

      Public Sub lnkView_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
        'WriteSortNode()
        WriteDisplayPropertiesNode()
        'UpdateJoins()
        'SavedQueryDO("QuerySQL") = BuildSQL()
        SavedQueryDO.UpdateXML()
        'SavedQueryDO("Name") = txtQueryName.Text
		'SavedQueryDO("Name") = Request.Form.Get("mPageFrameCtl:ctlPageContent:txtQueryName")
        valReqSelect.Validate()
        'valCusDistinctSort.Validate()
        If Not (valReqSelect.IsValid) Then Exit Sub

        Me.ctlViewResults.Open()
    End Sub

'--------------------------------------------------------

  'commented out for new query tool, kda
  '  Public Sub lnkExcel_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
  '      'WriteSortNode()
  '      WriteDisplayPropertiesNode()
  '      SavedQueryDO.UpdateXML()
  '      'SavedQueryDO("Name") = txtQueryName.Text
		'SavedQueryDO("Name") = Request.Form.Get("mPageFrameCtl:ctlPageContent:txtQueryName")
		
  '      valReqSelect.Validate()
  '      valCusDistinctSort.Validate()
  '      If Not (valReqSelect.IsValid And valCusDistinctSort.IsValid) Then Exit Sub

  '      Export_Excel()
  '  End Sub

'--------------------------------------------------------

 'commented out for new query tool, kda
 '   Public Sub Export_Excel()
 '       Dim aURL As String
 '       Dim aEntityID As String
	'	Dim aReportOutput As cReportOutput
 '       Dim aXMLDoc As cXMLDoc
 '       Dim aRONode As XmlNode

 '       aEntityID = CType(WebSession.User("cEGStaffUser"), cEGUser).UserID.ToString
	'	aReportOutput = SavedQueryDO.Create_ReportOutput(WebSession.DataObjectFactory, aEntityID)

	'	aURL = CType(WebAppl, cEGAppl).Build_ReportOutput_ReportOutputID_URL(aReportOutput)

	'	ctlViewExcel.NewWindowURL() = aURL
	'	ctlViewExcel.RefreshURL = GetCurrentQueryURL()
	'	ctlViewExcel.Open()
	'End Sub

'--------------------------------------------------------

	'commented out for new query tool, kda
	'Public Sub lnkEmailUtility_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
	'	'Dim aReportOutput As cReportOutput
	'	Dim aDataObjList As cDataObjectList
	'	Dim aDataObjNode As XmlNode
	'	Dim aBaseDODKey As String
	'	Dim aBaseDODNode As XmlNode
	'	Dim aBasePrimaryKeyNode As XmlNode
	'	Dim aBasePrimaryKey As String
	'	Dim aDisplayPropertiesEl As XmlElement
	'	Dim aPrimaryKeyEl As XmlElement

	'	'WriteSortNode()
	'	WriteDisplayPropertiesNode()
	'	'UpdateJoins()
	'	'SavedQueryDO("QuerySQL") = BuildSQL()

	'	aDataObjNode = SavedQueryDO.GetRelationalDataObjectNode()

	'	'SavedQueryDO.UpdateXML()
	'	'SavedQueryDO("Name") = txtQueryName.Text
	'	SavedQueryDO("Name") = Request.Form.Get("mPageFrameCtl:ctlPageContent:txtQueryName")

	'	valReqSelect.Validate()
	'	valCusDistinctSort.Validate()
	'	If Not (valReqSelect.IsValid And valCusDistinctSort.IsValid) Then Exit Sub

	'	Try
	'		aDataObjList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjNode)
	'		Catch aExc As Exception
	'			WebSession.CurrentException = aExc
	'			Me.EventController_NavigateToModulePageKey("Exception")
	'	End Try

	'	CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).SetEmailArgs(aDataObjList)
	'	EventController_NavigateToModulePageKey("EmailSend", "ReturnURL=" + Request.Url.PathAndQuery, "ReturnPageKey=" + CType(WebSession.CurrentPage, cModulePage).PageKey)
	'End Sub
	
'--------------------------------------------------------

	'commented out for new query tool, kda
	'Public Sub lnkMerge_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
	'	EventController_NavigateToModulePageKey("WordMerge", "ReturnURL=" + Request.Url.PathAndQuery, "ReturnPageKey=" + CType(WebSession.CurrentPage, cModulePage).PageKey)
	'End Sub

'--------------------------------------------------------

	Private Sub SetDisplay(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		Dim aDisplay As String
		Dim aURL As String

		aDisplay = CType(aSrc, HtmlControl).Attributes("Display")
		WriteDisplayPropertiesNode()
		'WriteSortNode()
		RedirectToCurrentQuery(aDisplay)
	End Sub

'--------------------------------------------------------

	Public Sub PopulateSelectDoubleListBox()
		Dim aDisplayPropertiesNodeList As XmlNodeList
		Dim aDisplayPropertyEl As XmlElement
		Dim aItem As ListItem
		Dim aList As SortedList
		Dim aObj As Object
		Dim i As Integer

		'aList = New SortedList(mFieldsList)
		' Core.Util.cLib.OrderHashtableValues(mFieldsList)
		'If Not IsPostBack Then
			aDisplayPropertiesNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("DisplayProperties/DisplayProperty")

			Dim aKeyList As IList = mFieldsList.GetKeyList()
			Dim aValueList As IList = mFieldsList.GetValueList()

			For i = 0 To mFieldsList.Count - 1
				'Add every item to the left hand box
				aItem = New ListItem(aKeyList(i), aValueList(i))
				ctlSelect.AddItemLeft(aItem)
			Next

			'For each display property node, move the corresponding list item to the right-hand box.
			For Each aDisplayPropertyEl In aDisplayPropertiesNodeList
				aItem = ctlSelect.GetItemByValue(FullPropertyKey(aDisplayPropertyEl))
				If Not aItem Is Nothing Then
					ctlSelect.AddItemRight(aItem)
				End If
			Next
		'End If
	End Sub

'--------------------------------------------------------

	'commented out for new query tool, kda
	'Public Sub PopulateSortDoubleListBox()
	'	Dim aSortNodeList As XmlNodeList
	'	Dim aSortArgEl As XmlElement
	'	Dim aItem As ListItem
	'	Dim aList As SortedList
	'	Dim aObj As Object
	'	Dim i As Integer

	'	'aList = New SortedList(mFieldsList)
	'	'Core.Util.cLib.OrderHashtableValues(mFieldsList)
	'	'If Not IsPostBack Then
	'		aSortNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Sort/Argument")

	'		Dim aKeyList As IList = mFieldsList.GetKeyList()
	'		Dim aValueList As IList = mFieldsList.GetValueList()

	'		For i = 0 To mFieldsList.Count - 1
	'			'Add every item to the left hand box
	'			aItem = New ListItem(aKeyList(i), aValueList(i))
	'			ctlSort.AddItemLeft(aItem)
	'		Next

	'		'For each display property node, move the corresponding list item to the right-hand box.
	'		For Each aSortArgEl In aSortNodeList
	'			aItem = ctlSort.GetItemByValue(FullPropertyKey(aSortArgEl))
	'			If Not aItem Is Nothing Then
	'				ctlSort.AddItemRight(aItem)
	'			End If
	'		Next
	'	'End If
	'End Sub

'--------------------------------------------------------

	'commented out for new query tool, kda
	'Public Sub PopulateFiltersTable()
	'	Dim aFiltersNode As XmlNode
	'	Dim aFilterArgsList As XmlNodeList
	'	Dim aFilterArgEl As XmlElement
	'	aFiltersNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters")
	'	aFilterArgsList = aFiltersNode.SelectNodes("Argument")
		
	'	'Build list of filters saved into query
	'	For Each aFilterArgEl In aFilterArgsList
	'		WriteFilterTableRow(aFilterArgEl)
	'	Next
		
	'	'If editing a filter, load filter values into editor controls
	'	If Not Request.QueryString("EditFilterKey") Is Nothing Then
	'		aFilterArgEl = aFiltersNode.SelectSingleNode("Argument[@Key='" + Request.QueryString("EditFilterKey") + "']")
	'		If cXMLDoc.AttributeToString(aFilterArgEl, "Bool") <> "" Then
	'			ctlBoolean.SelectedValue = cXMLDoc.AttributeToString(aFilterArgEl, "Bool")
	'		End If
	'		If cXMLDoc.AttributeToString(aFilterArgEl, "PropertyKey") <> "" Then
	'			Dim aPropertyKey As String = cXMLDoc.AttributeToString(aFilterArgEl, "PropertyKey")
	'			Dim aRelatedPropertyEl As XmlElement = aFilterArgEl.SelectSingleNode("RelatedProperty")
	'			If Not aRelatedPropertyEl Is Nothing Then
	'				aPropertyKey = cXMLDoc.AttributeToString(aRelatedPropertyEl, "PropertyKey") + "." + aPropertyKey
	'			End If
	'			ctlField.SelectedValue = aPropertyKey
	'		End If
	'		If cXMLDoc.AttributeToString(aFilterArgEl, "Operator") <> "" Then
	'			ctlOperator.SelectedValue = cXMLDoc.AttributeToString(aFilterArgEl, "Operator")
	'		End If
	'		If cXMLDoc.AttributeToString(aFilterArgEl, "Value") <> "" Then
	'			txtValue.Text = cXMLDoc.AttributeToString(aFilterArgEl, "Value")
	'		End If
	'	End If
	'End Sub
	
'--------------------------------------------------------

	'commented out for new query tool, kda
	'Public Sub WriteFilterTableRow(ByVal aFilterArgEl As XmlElement)
	'	Dim aTR As HtmlTableRow
	'	Dim aTD As HtmlTableCell
	'	Dim aPropertyKey As String
	'	Dim aButton As cButton
	'	Dim aOperator As String

	'	aTR = New HtmlTableRow()
	'	tabFilters.Rows.Add(aTR)
	'	cWebLib.Add_TableCell(aTR, cXMLDoc.AttributeToString(aFilterArgEl, "Bool"))
	'	aPropertyKey = FullPropertyKey(aFilterArgEl)
	'	cWebLib.Add_TableCell(aTR, cLib.GetDictionaryKey(mFieldsList, aPropertyKey).ToString)
	'	aOperator = cXMLDoc.AttributeToString(aFilterArgEl, "Operator")
	'	If aOperator = "Like" Then aOperator = "Contains"
	'	cWebLib.Add_TableCell(aTR, aOperator)
	'	cWebLib.Add_TableCell(aTR, cXMLDoc.AttributeToString(aFilterArgEl, "Value"))

	'	'Add "Edit" button
	'	aTD = New HtmlTableCell()
	'	aButton = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cButton']").Attributes("ControlFile").Value), cButton)
	'	aButton.Caption = "Edit"
	'	aButton.Add_Attribute("Key", cXMLDoc.AttributeToString(aFilterArgEl, "Key"))
	'	aButton.Set_ServerClick(AddressOf btnEdit_Click)
	'	aTD.Controls.Add(aButton)
	'	aTR.Cells.Add(aTD)

	'	'Add "Delete" button
	'	aTD = New HtmlTableCell()
	'	aButton = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cButton']").Attributes("ControlFile").Value), cButton)
	'	aButton.Caption = "Delete"
	'	aButton.Add_Attribute("Key", cXMLDoc.AttributeToString(aFilterArgEl, "Key"))
	'	aButton.Set_ServerClick(AddressOf btnDelete_Click)
	'	aTD.Controls.Add(aButton)
	'	aTR.Cells.Add(aTD)

	'End Sub

'--------------------------------------------------------

	'commented out for new query tool, kda
	'Public Sub WriteGroupTableRow()
	'	Dim aTR As HtmlTableRow
	'	Dim aTD As HtmlTableCell
	'	Dim aSelectedValue As String = cXMLDoc.AttributeToString(AdHocQueryDefXMLDoc.DocElement, "GroupBy")
	'	Dim aSelectedKey As String
	'	Dim aButton As cButton
	'	Dim aOperator As String
		
	'	If Not aSelectedValue = "" Then

	'		aTR = New HtmlTableRow()
	'		tabGroupBy.Rows.Add(aTR)
			
	'		cWebLib.Add_TableCell(aTR, "Selected Group By Field : ")
	'		'aSelectedKey = ctlGroupFields.Items.FindByValue(aSelectedValue).Text
	'		cWebLib.Add_TableCell(aTR, aSelectedKey)

	'		'Add "Delete" button
	'		aTD = New HtmlTableCell()
	'		aButton = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cButton']").Attributes("ControlFile").Value), cButton)
	'		aButton.Caption = "Delete"
	'		aButton.Set_ServerClick(AddressOf btnDeleteGroup_Click)
	'		aTD.Controls.Add(aButton)
	'		aTR.Cells.Add(aTD)
		
	'	End If

	'End Sub

'--------------------------------------------------------

	'Public Sub WriteDisplayPropertiesNode()
	'	Dim aDisplayPropertiesNode As XmlNode
	'	Dim aDisplayPropertiesList As XmlNodeList
	'	Dim aDisplayPropertyEl As XmlElement
	'	Dim aRelatedPropertyEl As XmlElement
	'	Dim aItemValue As String
	'	Dim aAttr As XmlAttribute
	'	Dim aSelectedItems As String()
	'	Dim aPropertyKey As String
	'	Dim aRelatedPropertyKey As String
	'	Dim aIndex As Integer

	'	If spnSelect.Visible Then
	'		'Dim aChkVal As String = Request.Form.Get("mPageFrameCtl:ctlPageContent:chkDistinct")
	'		'If chkDistinct.Checked Then
	'		If Request.Form.Get("mPageFrameCtl:ctlPageContent:chkDistinct") = "on" Then
	'			AdHocQueryDefXMLDoc.DocElement.Attributes("SelectType").Value = "Distinct"
	'		Else
	'			AdHocQueryDefXMLDoc.DocElement.Attributes("SelectType").Value = "All"
	'		End If
	'		'AdHocQueryDefXMLDoc.DocElement.Attributes("GroupBy").Value = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlGroupFields:selDropDown")
	'		aDisplayPropertiesNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("DisplayProperties")
	'		aDisplayPropertiesList = aDisplayPropertiesNode.SelectNodes("DisplayProperty")
	'		For Each aDisplayPropertyEl In aDisplayPropertiesList
	'			aDisplayPropertiesNode.RemoveChild(aDisplayPropertyEl)
	'		Next

	'		aSelectedItems = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlSelect:hdnList").Split(",")
			
	'		'aSelectedItems = ctlSelect.SelectedValueList().Split(",")

	'		For Each aItemValue In aSelectedItems
	'			aDisplayPropertyEl = AdHocQueryDefXMLDoc.XMLDocument.CreateElement("DisplayProperty")
	'			aPropertyKey = aItemValue
	'			'aIndex = aPropertyKey.IndexOf(".")
	'			'If aIndex <> -1 Then
	'			'    aRelatedPropertyKey = aPropertyKey.Substring(0, aIndex)
	'			'    aPropertyKey = aPropertyKey.Substring(aIndex + 1)
	'			'    aRelatedPropertyEl = AdHocQueryDefXMLDoc.XMLDocument.CreateElement("RelatedProperty")
	'			'    aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aRelatedPropertyEl, "PropertyKey")
	'			'    aAttr.Value = aRelatedPropertyKey
	'			'    aDisplayPropertyEl.AppendChild(aRelatedPropertyEl)
	'			'End If
	'			aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aDisplayPropertyEl, "PropertyKey")
	'			aAttr.Value = aPropertyKey
	'			aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aDisplayPropertyEl, "ColumnHeader")
	'			aAttr.Value = cLib.GetDictionaryKey(mFieldsList, aPropertyKey)
	'			aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aDisplayPropertyEl, "Join")
	'			'aAttr.Value = "None"
	'			aDisplayPropertiesNode.AppendChild(aDisplayPropertyEl)
	'		Next
	'	End If
	'End Sub

'--------------------------------------------------------

	'Public Sub WriteSortNode()
	'	Dim aSortNode As XmlNode
	'	Dim aSortArgsList As XmlNodeList
	'	Dim aSortArgEl As XmlElement
	'	Dim aRelatedPropertyEl As XmlElement
	'	Dim aItemValue As String
	'	Dim aAttr As XmlAttribute
	'	Dim aSelectedItems As String()
	'	Dim aPropertyKey As String
	'	Dim aRelatedPropertyKey As String
	'	Dim aIndex As Integer

	'	If spnSort.Visible Then
	'		aSortNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Sort")
	'		If aSortNode Is Nothing Then Return
	'		aSortArgsList = aSortNode.SelectNodes("Argument")

	'		For Each aSortArgEl In aSortArgsList
	'			aSortNode.RemoveChild(aSortArgEl)
	'		Next

	'		'If ctlSort.SelectedValueList() <> "" Then
	'			'aSelectedItems = ctlSort.SelectedValueList().Split(",")
				
	'		If Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlSort:hdnList") <> "" Then
	'			aSelectedItems = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlSort:hdnList").Split(",")

	'			For Each aItemValue In aSelectedItems
	'				aSortArgEl = AdHocQueryDefXMLDoc.XMLDocument.CreateElement("Argument")
	'				aPropertyKey = aItemValue
	'				aIndex = aPropertyKey.LastIndexOf(".")
	'				If aIndex <> -1 Then
	'					aRelatedPropertyKey = aPropertyKey.Substring(0, aIndex)
	'					aPropertyKey = aPropertyKey.Substring(aIndex + 1)
	'					aRelatedPropertyEl = AdHocQueryDefXMLDoc.XMLDocument.CreateElement("RelatedProperty")
	'					aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aRelatedPropertyEl, "PropertyKey")
	'					aAttr.Value = aRelatedPropertyKey
	'					aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aRelatedPropertyEl, "Join")
	'					'aAttr.Value = "None"
	'					aSortArgEl.AppendChild(aRelatedPropertyEl)
	'				End If
	'				aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aSortArgEl, "PropertyKey")
	'				aAttr.Value = aPropertyKey
	'				aSortNode.AppendChild(aSortArgEl)
	'			Next
	'		End If
	'	End If
	'End Sub

'--------------------------------------------------------

	Public Sub WriteDisplayPropertiesNode()
		Dim aDisplayPropertiesNode As XmlNode
		Dim aDisplayPropertiesList As XmlNodeList
		Dim aDisplayPropertyEl As XmlElement
		Dim aRelatedPropertyEl As XmlElement
		Dim aItemValue As String
		Dim aAttr As XmlAttribute
		Dim aSelectedItems As String()
		Dim aPropertyKey As String
		Dim aRelatedPropertyKey As String
		Dim aIndex As Integer

		If spnSelect.Visible Then
			
			'commented out for new query tool, kda
			'If Request.Form.Get("mPageFrameCtl:ctlPageContent:chkDistinct") = "on" Then
				'AdHocQueryDefXMLDoc.DocElement.Attributes("SelectType").Value = "Distinct"
			'Else
				'AdHocQueryDefXMLDoc.DocElement.Attributes("SelectType").Value = "All"
			'End If
			
			aDisplayPropertiesNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("DisplayProperties")
			aDisplayPropertiesList = aDisplayPropertiesNode.SelectNodes("DisplayProperty")
			For Each aDisplayPropertyEl In aDisplayPropertiesList
				aDisplayPropertiesNode.RemoveChild(aDisplayPropertyEl)
			Next

			aSelectedItems = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlSelect:hdnList").Split(",")
			

			For Each aItemValue In aSelectedItems
				aDisplayPropertyEl = AdHocQueryDefXMLDoc.XMLDocument.CreateElement("DisplayProperty")
				aPropertyKey = aItemValue
				'aIndex = aPropertyKey.IndexOf(".")
				'If aIndex <> -1 Then
				'    aRelatedPropertyKey = aPropertyKey.Substring(0, aIndex)
				'    aPropertyKey = aPropertyKey.Substring(aIndex + 1)
				'    aRelatedPropertyEl = AdHocQueryDefXMLDoc.XMLDocument.CreateElement("RelatedProperty")
				'    aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aRelatedPropertyEl, "PropertyKey")
				'    aAttr.Value = aRelatedPropertyKey
				'    aDisplayPropertyEl.AppendChild(aRelatedPropertyEl)
				'End If
				aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aDisplayPropertyEl, "PropertyKey")
				aAttr.Value = aPropertyKey
				aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aDisplayPropertyEl, "ColumnHeader")
				aAttr.Value = cLib.GetDictionaryKey(mFieldsList, aPropertyKey)
				aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aDisplayPropertyEl, "Join")
				'aAttr.Value = "None"
				aDisplayPropertiesNode.AppendChild(aDisplayPropertyEl)
			Next
		End If
	End Sub


	'commented out for new query tool, kda
	'Public Sub WriteSortNode()
	'	Dim aSortNode As XmlNode
	'	Dim aSortArgsList As XmlNodeList
	'	Dim aSortArgEl As XmlElement
	'	Dim aRelatedPropertyEl As XmlElement
	'	Dim aItemValue As String
	'	Dim aAttr As XmlAttribute
	'	Dim aSelectedItems As String()
	'	Dim aPropertyKey As String
	'	Dim aRelatedPropertyKey As String
	'	Dim aIndex As Integer

	'	If spnSort.Visible Then
	'		aSortNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Sort")
	'		If aSortNode Is Nothing Then Return
	'		aSortArgsList = aSortNode.SelectNodes("Argument")

	'		For Each aSortArgEl In aSortArgsList
	'			aSortNode.RemoveChild(aSortArgEl)
	'		Next
				
	'		If Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlSort:hdnList") <> "" Then
	'			aSelectedItems = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlSort:hdnList").Split(",")

	'			For Each aItemValue In aSelectedItems
	'				aSortArgEl = AdHocQueryDefXMLDoc.XMLDocument.CreateElement("Argument")
	'				aPropertyKey = aItemValue
	'				aIndex = aPropertyKey.LastIndexOf(".")
	'				If aIndex <> -1 Then
	'					aRelatedPropertyKey = aPropertyKey.Substring(0, aIndex)
	'					aPropertyKey = aPropertyKey.Substring(aIndex + 1)
	'					aRelatedPropertyEl = AdHocQueryDefXMLDoc.XMLDocument.CreateElement("RelatedProperty")
	'					aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aRelatedPropertyEl, "PropertyKey")
	'					aAttr.Value = aRelatedPropertyKey
	'					aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aRelatedPropertyEl, "Join")
	'					'aAttr.Value = "None"
	'					aSortArgEl.AppendChild(aRelatedPropertyEl)
	'				End If
	'				aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aSortArgEl, "PropertyKey")
	'				aAttr.Value = aPropertyKey
	'				aSortNode.AppendChild(aSortArgEl)
	'			Next
	'		End If
	'	End If
	'End Sub
	
'--------------------------------------------------------

	'commented out for new query tool, kda
	'Public Sub AddFilterArgumentNode()
	'	Dim aFiltersNode As XmlNode
	'	Dim aArgumentEl As XmlElement
	'	Dim aAttr As XmlAttribute
	'	Dim aKey As Integer

	'	aFiltersNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters")
	'	aArgumentEl = AdHocQueryDefXMLDoc.XMLDocument.CreateElement("Argument")
		
	'	dim aArgEl as XmlNode
	'	dim aArgsList as XmlNodeList = aFiltersNode.SelectNodes("Argument")
	'	dim aNewKey as Integer = 1
	'	For Each aArgEl in aArgsList
	'		aKey = cXMLDoc.AttributeToInt(aArgEl, "Key", 0)
	'		If  aKey >= aNewKey Then
	'			aNewKey = aKey + 1
	'		End If
	'	Next
	'	aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Key")
	'	aAttr.Value = aNewKey.ToString
		
	'	'aKey = aFiltersNode.SelectNodes("Argument").Count + 1
	'	'aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Key")
	'	'aAttr.Value = aKey.ToString

	'	aFiltersNode.AppendChild(aArgumentEl)
	'	WriteFilterArgumentNode(aArgumentEl)

	'	'Add key attribute so that individual arguments can be identified for purposes of deletion
	'End Sub

'--------------------------------------------------------

	'commented out for new query tool, kda
	'Public Sub AddGroupByElement()

	'	Dim aFiltersNode As XmlNode
	'	Dim aArgumentEl As XmlElement
	'	Dim aAttr As XmlAttribute
	'	Dim aKey As Integer

	'	aFiltersNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters")
	'	aArgumentEl = AdHocQueryDefXMLDoc.XMLDocument.CreateElement("Argument")
		
	'	dim aArgEl as XmlNode
	'	dim aArgsList as XmlNodeList = aFiltersNode.SelectNodes("Argument")
	'	dim aNewKey as Integer = 1
	'	For Each aArgEl in aArgsList
	'		aKey = cXMLDoc.AttributeToInt(aArgEl, "Key", 0)
	'		If  aKey >= aNewKey Then
	'			aNewKey = aKey + 1
	'		End If
	'	Next
	'	aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Key")
	'	aAttr.Value = aNewKey.ToString
		
	'	'aKey = aFiltersNode.SelectNodes("Argument").Count + 1
	'	'aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Key")
	'	'aAttr.Value = aKey.ToString

	'	aFiltersNode.AppendChild(aArgumentEl)
	'	WriteFilterArgumentNode(aArgumentEl)
		
	'End Sub	

'--------------------------------------------------------

	'commented out for new query tool, kda
	'Public Sub SaveFilterArgumentNode()
	'	Dim aFiltersNode As XmlNode
	'	Dim aArgumentEl As XmlElement
	
	'	aArgumentEl = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters/Argument[@Key='" + Request.QueryString("EditFilterKey") + "']")
	'	WriteFilterArgumentNode(aArgumentEl)
	'End Sub
	
'--------------------------------------------------------

	'commented out for new query tool, kda
	'Public Sub WriteFilterArgumentNode(ByRef aArgumentEl As XmlElement)
	'	Dim aAttr As XmlAttribute
	'	Dim aPropertyKey As String
	'	Dim aIndex As Integer
	'	Dim aRelatedPropertyEl As XmlElement
	'	Dim aRelatedPropertyKey As String
	'	Dim aHasBoolAttr As Boolean = False
	'	Dim aHasPKAttr As Boolean = False
	'	Dim aHasOperatorAttr As Boolean = False
	'	Dim aHasValueAttr As Boolean = False
		
	'	For Each aAttr In aArgumentEl.Attributes
	'		Select Case aAttr.Name
	'			Case "Bool"
	'				aHasBoolAttr = True
	'			Case "PropertyKey"
	'				aHasPKAttr = True
	'			Case "Operator"
	'				aHasOperatorAttr = True
	'			Case "Value"
	'				aHasValueAttr = True
	'		End Select
	'	Next

	'	aAttr = aArgumentEl.Attributes("Bool")
	'	'Dim aSelItemValue As String = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlBoolean")
	'	'If ctlBoolean.SelectedItem.Value <> "" Then
	'	If Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlBoolean") <> "" Then
	'		If Not aHasBoolAttr Then
	'			aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Bool")
	'		End If
	'		aAttr.Value = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlBoolean")
	'	Else
	'		If aHasBoolAttr Then
	'			aArgumentEl.Attributes.Remove(aAttr)
	'		End If
	'	End If

	'	'aPropertyKey = ctlField.SelectedItem.Value
	'	aPropertyKey = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlField")
	'	aIndex = aPropertyKey.LastIndexOf(".")
	'	If aIndex <> -1 Then
	'		aRelatedPropertyKey = aPropertyKey.Substring(0, aIndex)
	'		aPropertyKey = aPropertyKey.Substring(aIndex + 1)
	'		aRelatedPropertyEl = AdHocQueryDefXMLDoc.XMLDocument.CreateElement("RelatedProperty")
	'		aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aRelatedPropertyEl, "PropertyKey")
	'		aAttr.Value = aRelatedPropertyKey
	'		aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aRelatedPropertyEl, "Join")
	'		'aAttr.Value = "None"
	'		aArgumentEl.AppendChild(aRelatedPropertyEl)
	'	End If
	'	If aHasPKAttr Then
	'		aAttr = aArgumentEl.Attributes("PropertyKey")
	'	Else
	'		aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "PropertyKey")
	'	End If
	'	aAttr.Value = aPropertyKey

	'	If aHasOperatorAttr Then
	'		aAttr = aArgumentEl.Attributes("Operator")
	'	Else
	'		aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Operator")
	'	End If
	'	'aAttr.Value = ctlOperator.SelectedItem.Value
	'	aAttr.Value = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlOperator")

	'	If aHasValueAttr Then
	'		aAttr = aArgumentEl.Attributes("Value")
	'	Else
	'		aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Value")
	'	End If
	'	'aAttr.Value = txtValue.Text
	'	aAttr.Value = Request.Form.Get("mPageFrameCtl:ctlPageContent:txtValue")
	
	'End Sub

'--------------------------------------------------------

	'commented out for new query tool, kda
	'Public Sub DeleteFilterArgumentNode(ByVal aKey As String)
	'	Dim aFiltersNode As XmlNode
	'	Dim aArgumentNode As XmlNode

	'	aFiltersNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters")
	'	aArgumentNode = aFiltersNode.SelectSingleNode("Argument[@Key='" + aKey + "']")
	'	aFiltersNode.RemoveChild(aArgumentNode)
	'End Sub

'--------------------------------------------------------

	Private Function FullPropertyKey(ByVal aNode As XmlNode) As String
		Dim aRelatedPropertyNode As XmlNode
		Dim aKey As String

		aKey = cXMLDoc.AttributeToString(aNode, "PropertyKey")

		Select Case aNode.Name
			Case "Argument"
				aRelatedPropertyNode = aNode.SelectSingleNode("RelatedProperty")
				If Not aRelatedPropertyNode Is Nothing Then
					aKey = cXMLDoc.AttributeToString(aRelatedPropertyNode, "PropertyKey") + "." + aKey
				End If
			Case "DisplayProperty"
				'Return the key you've already got.
		End Select

		Return aKey
	End Function

'--------------------------------------------------------

	Private Sub UpdateJoins()
	'Because the DataProviderSQL does not properly handle the case where the same related data object definition
	'(i.e., the same joined table) is referenced more than once in the sort and/or filter nodes, we need to manage
	'those nodes after they are all created and before they are saved and used to retrieve data. The process here
	'is similar to that implemented in the Easylist control (cFilterListDataPresenterCtl) for the same reason.

	'We loop through all the sort and filter argument nodes with related property nodes and set the Join attribute
	'in the RelatedProperty node to "None". We then populate a hashtable with one item per related data object definition
	'referenced in the combined sort and filter nodes. Each hashtable item holds a reference to one argument node that 
	'refers to that related data object definition. Those argument nodes whose keys are contained in the hashtable
	'then have their Join attribute reset to "". Thus, these argument nodes cause exactly one join clause to be 
	'created for each joined table in the SQL statement.
		Dim aKey As String
		Dim aArgsList As XmlNodeList
		Dim aArgNode As XmlNode
		Dim aRelatedPropertyNode As XmlNode
		Dim aJoinedDataObject As cJoinedDataObject
		Dim aParentNodeKey As String
		Dim aNodeName As String

		mJoinedDataObjects = New Hashtable()
		UpdateJoinsInNodeList("Sort")
		UpdateJoinsInNodeList("Filters")
		UpdateJoinsInDisplayPropertyNodelist()

		'Because we are not using the DataObjectFactory to return data, this code is not currently relevant.
		'Peter Larsen 11/11/2003
		For Each aKey In mJoinedDataObjects.Keys
			'Find the argument node corresponding to that key
				'Get appropriate argument node list (filter or sort)
			aJoinedDataObject = CType(mJoinedDataObjects(aKey), cJoinedDataObject)
			aParentNodeKey = aJoinedDataObject.ParentNodeKey
			If aParentNodeKey = "DisplayProperties" Then
				aNodeName = "DisplayProperty"
			Else
				aNodeName = "Argument"
			End If

			aArgsList = AdHocQueryDefXMLDoc.DocElement.SelectNodes(aJoinedDataObject.ParentNodeKey + "/" + aNodeName)
			'Loop through list and apply FullPropertyKey to each node
			For Each aArgNode In aArgsList
				'Compare value returned by FullPropertyKey to Key property of JoinedDataObject
				'If equal, This is your node
				If aJoinedDataObject.Key = FullPropertyKey(aArgNode) Then
					If aParentNodeKey = "DisplayProperties" Then
						aArgNode.Attributes("Join").Value = "Left"
					Else
						'Get its related property node
						aRelatedPropertyNode = aArgNode.SelectSingleNode("RelatedProperty")
						'Set the Join attribute = ""
						aRelatedPropertyNode.Attributes("Join").Value = ""
					End If
					'exit loop
					Exit For
				End If
			Next
		Next
	End Sub
'--------------------------------------------------------

	Private Function GetCurrentQueryURL() As String
		Dim aURL As String

		aURL = Request.Url.PathAndQuery
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "BaseDODKey")
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "QueryID")
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "EditFilterKey")
		aURL = cWebLib.AddQuerystringParameter(aURL, "QueryType", "User", Server)
		aURL = cWebLib.AddQuerystringParameter(aURL, "Display", Request.QueryString("Display"), Server)
		Return aURL
	End Function
'--------------------------------------------------------

	Private Sub RedirectToCurrentQuery()

		EventController_NavigateToURL(GetCurrentQueryURL())
	End Sub

'--------------------------------------------------------

	Private Sub RedirectToCurrentQuery(ByVal aDisplayValue As String)
		Dim aURL As String

		aURL = GetCurrentQueryURL()
		aURL = cWebLib.AddQuerystringParameter(aURL, "Display", aDisplayValue, Server)
		EventController_NavigateToURL(aURL)
	End Sub

'--------------------------------------------------------

	Private Sub RedirectToCurrentQueryWithAnchor(ByVal aAnchorName As String)
		Dim aURL As String

		aURL = GetCurrentQueryURL()
		aURL += "&#" + aAnchorName
		EventController_NavigateToURL(aURL)
	End Sub
	
'--------------------------------------------------------

	'commented out for new query tool, kda
	'Private Sub RedirectToEditFilter(aFilterKey As String)
	'	Dim aURL As String = GetCurrentQueryURL()
	'	aURL = cWebLib.AddQuerystringParameter(aURL, "EditFilterKey", aFilterKey)
	'	aURL += "&#Filters"
	'	EventController_NavigateToURL(aURL)
	'End Sub
	
'--------------------------------------------------------

	Private Function BuildSQL() As String
		Dim aBaseObjDefNode As XmlNode
		Dim aBaseTableName As String
		Dim aSelectClause As String
		Dim aFromClause As String
		Dim aWhereClause As String
		Dim aSortClause As String

		aBaseObjDefNode = WebAppl.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + SavedQueryDO.BaseDODKey + "']")
		aBaseTableName = cXMLDoc.AttributeToString(aBaseObjDefNode, "RowSource")

		aSelectClause = BuildSelectClause(aBaseObjDefNode, aBaseTableName)
		aFromClause = BuildFromClause(aBaseObjDefNode, aBaseTableName)
		aWhereClause = BuildWhereClause(aBaseObjDefNode, aBaseTableName)
		aSortClause = BuildSortClause(aBaseObjDefNode, aBaseTableName)

		Return aSelectClause + " " + aFromClause + " " + aWhereClause + " " + aSortClause

	End Function

'--------------------------------------------------------

	Private Function BuildSortClause(ByVal aBaseObjDefNode As XmlNode, ByVal aBaseTableName As String) As String
		Dim aResult As String
		Dim aSortNodeList As XmlNodeList
		Dim aSortArgNode As XmlNode
		Dim aFilterPropertyNode As XmlNode
		Dim aCriterion As String
		Dim aDirection As String
		Dim aFilterNodeList As XmlNodeList

		aResult = "ORDER BY "
		aSortNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Sort/Argument")
		If aSortNodeList.Count = 0 Then
			Return " "
		End If
		For Each aSortArgNode In aSortNodeList
			aCriterion = GetTableDotField(aBaseObjDefNode, aBaseTableName, aSortArgNode, aFilterPropertyNode)
			aDirection += cXMLDoc.AttributeToString(aSortArgNode, "Direction")
			If aDirection = "Descending" Then
				aCriterion += " DESC"
			Else
				aCriterion += " ASC"
			End If
			aResult += aCriterion + ", "
		Next

		'Remove trailing comma and space, then return result
		aResult = aResult.Substring(0, aResult.Length - 2) + " "
		Return aResult
	End Function


'--------------------------------------------------------

	Private Function GetTableDotField(ByVal aBaseObjDefNode As XmlNode, ByVal aBaseTableName As String, _
										ByVal aArgumentNode As XmlNode, ByRef aFilterPropertyNode As XmlNode) As String
		Dim aRelatedPropertyNode As XmlNode
		Dim aRelatedObjDefNode As XmlNode
		Dim aIndex As Integer
		Dim aFilterTableName As String
		Dim aFilterFieldName As String

		aRelatedPropertyNode = aArgumentNode.SelectSingleNode("RelatedProperty")
		If Not aRelatedPropertyNode Is Nothing Then
			Dim aRelationshipNode As XmlNode
			Dim aRelatedTableName As String
			Dim aRelatedPropertyKeys As String()
			Dim aRelatedPropertyKey As String

			aRelatedObjDefNode = aBaseObjDefNode
			aRelatedPropertyKey = cXMLDoc.AttributeToString(aRelatedPropertyNode, "PropertyKey")
			aRelatedPropertyKeys = aRelatedPropertyKey.Split(".")

			For aIndex = 0 To aRelatedPropertyKeys.Length - 1
				aRelationshipNode = cXMLDoc.GetRelationshipNode(aRelatedObjDefNode, aRelatedPropertyKeys(aIndex))

				aRelatedObjDefNode = aRelatedObjDefNode.OwnerDocument.DocumentElement.SelectSingleNode( _
									"DataObjectDefinitions/Definition[@Key='" + cXMLDoc.AttributeToString(aRelationshipNode, "ChildDefinitionKey") + "']")
			Next aIndex
			aRelatedTableName = cXMLDoc.AttributeToString(aRelatedObjDefNode, "RowSource")
			aFilterPropertyNode = aRelatedObjDefNode.SelectSingleNode("Properties/Property[@Key='" + cXMLDoc.AttributeToString(aArgumentNode, "PropertyKey") + "']")
			aFilterTableName = aRelatedTableName
		Else
			'need to get the FilterPropertyNode, because it was not retrieved above
			aFilterTableName = aBaseTableName
			aFilterPropertyNode = aBaseObjDefNode.SelectSingleNode("Properties/Property[@Key='" + cXMLDoc.AttributeToString(aArgumentNode, "PropertyKey") + "']")
		End If
		aFilterFieldName = cXMLDoc.AttributeToString(aFilterPropertyNode, "ColumnSource")

		Return aFilterTableName + "." + aFilterFieldName

	End Function
'--------------------------------------------------------

	Private Function BuildWhereClause(ByVal aBaseObjDefNode As XmlNode, ByVal aBaseTableName As String) As String
		Dim aResult As String
		Dim aFilterNodeList As XmlNodeList
		Dim aFilterArgNode As XmlNode
		Dim aFilterPropertyNode As XmlNode
		Dim aCriterion As String
		Dim aFirstArgNode As Boolean = True

		aResult = "WHERE "
		aFilterNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument")
		If aFilterNodeList.Count = 0 Then
			Return " "
		End If
		For Each aFilterArgNode In aFilterNodeList
			If aFirstArgNode Then
				aFirstArgNode = False
			Else
				aCriterion = " " + cXMLDoc.AttributeToString(aFilterArgNode, "Bool", "AND") + " "
			End If
			aCriterion += GetTableDotField(aBaseObjDefNode, aBaseTableName, aFilterArgNode, aFilterPropertyNode)
			aCriterion += CType(WebSession.DataObjectFactory.GetDataProvider("EGDatabase"), cDataProviderSQL).Condition_RValue(aFilterPropertyNode, aFilterArgNode)
			aResult += aCriterion
		Next
			Return aResult
	End Function

'--------------------------------------------------------

	Private Function BuildSelectClause(ByVal aBaseObjDefNode As XmlNode, ByVal aBaseTableName As String) As String
		Dim aDPList As XmlNodeList
		Dim aDPNode As XmlNode
		Dim aResult As String
		Dim aTableName As String
		Dim aDPKey As String
		Dim aTruncatedDPKey As String
		Dim aPropertyKeys As String()
		Dim aPropertyKey As String
		Dim aLastDPKey As String
		Dim aRelationshipNode As XmlNode
		Dim aObjDefNode As XmlNode
		Dim aRelatedObjDefNode As XmlNode
		Dim aRelatedTableName As String
		Dim aDPDefNode As XmlNode
		Dim aFieldName As String

		aResult = "SELECT DISTINCT "
		aDPList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("DisplayProperties/DisplayProperty")
		For Each aDPNode In aDPList
			aObjDefNode = aBaseObjDefNode
			aDPKey = cXMLDoc.AttributeToString(aDPNode, "PropertyKey")

			'Get table name
			If aDPKey.IndexOf(".") > 0 Then
				aTruncatedDPKey = aDPKey.Substring(0, aDPKey.LastIndexOf("."))
				aLastDPKey = aDPKey.Substring(aDPKey.LastIndexOf(".") + 1)
				aPropertyKeys = aTruncatedDPKey.Split(".")
				aRelatedTableName = aBaseTableName
				For Each aPropertyKey In aPropertyKeys
					aRelationshipNode = cXMLDoc.GetRelationshipNode(aObjDefNode, aPropertyKey)
					aRelatedObjDefNode = aObjDefNode.OwnerDocument.DocumentElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + cXMLDoc.AttributeToString(aRelationshipNode, "ChildDefinitionKey") + "']")
					aObjDefNode = aRelatedObjDefNode
					aRelatedTableName = cXMLDoc.AttributeToString(aRelatedObjDefNode, "RowSource")
				Next
				aTableName = aRelatedTableName
			Else
				aTableName = aBaseTableName
				aLastDPKey = aDPKey
			End If

			'Get field name
			aDPDefNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aLastDPKey + "']")
			aFieldName = cXMLDoc.AttributeToString(aDPDefNode, "ColumnSource")
			aResult += aTableName + "." + aFieldName + " AS " + aLastDPKey + ", "
		Next aDPNode

		'Remove trailing comma and space, then return result
		aResult = aResult.Substring(0, aResult.Length - 2) + " "
		Return aResult
	End Function

'--------------------------------------------------------

	Private Function BuildFromClause(ByVal aBaseObjDefNode As XmlNode, ByVal aBaseTableName As String) As String
		Dim aObjDefNode As XmlNode
		Dim aTableName As String
		Dim aRelatedTableName As String
		Dim aKey As String
		Dim aJoinedDataObject As cJoinedDataObject
		Dim aJDOKey As String
		Dim aPropertyKeys As String()
		Dim aPropertyKey As String
		Dim aRelationshipNode As XmlNode
		Dim aRelatedObjDefNode As XmlNode
		Dim aRelationshipProperties As XmlNodeList
		Dim aResult As String
		Dim aRelationshipFiltersArgsNodeList As XmlNodeList
		Dim aRelationshipProperty As XmlNode
		Dim aParentPropertyNode As XmlNode
		Dim aChildPropertyKey As String
		Dim aChildPropertyNode As XmlNode
		Dim aJoinExpression As String

		aResult = "FROM " + aBaseTableName + " "

		For Each aKey In mJoinedDataObjects.Keys
			aJoinedDataObject = CType(mJoinedDataObjects(aKey), cJoinedDataObject)
			aJDOKey = aJoinedDataObject.Key
			'Remove final property key from string, as it represents a "flat" data object property
			aJDOKey = aJDOKey.Substring(0, aJDOKey.LastIndexOf("."))
			aPropertyKeys = aJDOKey.Split(".")
			aObjDefNode = aBaseObjDefNode
			aTableName = aBaseTableName

			For Each aPropertyKey In aPropertyKeys
				aJoinExpression = ""
				aRelationshipNode = cXMLDoc.GetRelationshipNode(aObjDefNode, aPropertyKey)
				aRelatedObjDefNode = aObjDefNode.OwnerDocument.DocumentElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + cXMLDoc.AttributeToString(aRelationshipNode, "ChildDefinitionKey") + "']")
				aRelatedTableName = cXMLDoc.AttributeToString(aRelatedObjDefNode, "RowSource")
				aResult += " LEFT "
				aRelationshipProperties = aRelationshipNode.SelectNodes("RelationshipProperties/RelationshipProperty")

				aRelationshipFiltersArgsNodeList = aRelationshipNode.SelectNodes("RelationshipFilters/Argument")
				If aRelationshipFiltersArgsNodeList.Count = 0 Then
					aResult += "JOIN " + aRelatedTableName + " ON "
				Else
					aResult += "JOIN (" + aRelatedTableName
					aResult += CType(WebSession.DataObjectFactory.GetDataProvider("EGDatabase"), cDataProviderSQL).AddJoinsToFromClause(aRelationshipFiltersArgsNodeList, aRelatedObjDefNode, "")
					aResult += ") ON "
				End If

				For Each aRelationshipProperty In aRelationshipProperties
					'ParentPropertyKey
					aParentPropertyNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" + cXMLDoc.AttributeToString(aRelationshipProperty, "parentProperty") + "']")

					'ChildPropertyKey
					aChildPropertyKey = cXMLDoc.AttributeToString(aRelationshipProperty, "childProperty")
					aChildPropertyNode = aRelatedObjDefNode.SelectSingleNode("Properties/Property[@Key='" + aChildPropertyKey + "']")

					If aParentPropertyNode Is Nothing Then
						If aJoinExpression <> "" Then aJoinExpression += " AND "
						aJoinExpression += aRelatedTableName + "." + cXMLDoc.AttributeToString(aChildPropertyNode, "ColumnSource") + _
								" = " + cXMLDoc.AttributeToString(aRelationshipProperty, "Data")

					Else 'line 485
						If aJoinExpression <> "" Then aJoinExpression += " AND "
						aJoinExpression += " " + aTableName + "." + _
										cXMLDoc.AttributeToString(aParentPropertyNode, "ColumnSource") + _
										" = " + aRelatedTableName + "." + cXMLDoc.AttributeToString(aChildPropertyNode, "ColumnSource")
					End If
				Next aRelationshipProperty

				aResult += aJoinExpression
				aObjDefNode = aRelatedObjDefNode
				aTableName = aRelatedTableName
			Next aPropertyKey

		Next aKey 'In mJoinedDataObjects.Keys

		Return aResult
	End Function
'--------------------------------------------------------

	Private Sub UpdateJoinsInDisplayPropertyNodelist()
		Dim aDPList As XmlNodeList
		Dim aDPNode As XmlNode
		Dim aPropertyKey As String
		Dim aRelatedPropertyKey As String
		Dim aRelatedPropertyNames As String()
		Dim aPropertyName As String
		Dim aObjDefNode As XmlNode
		Dim aObjDefPropertyNode As XmlNode
		Dim aChildDataObjKey As String
		Dim aJoinedDataObject As cJoinedDataObject

		aDPList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("DisplayProperties/DisplayProperty")
		For Each aDPNode In aDPList
			aPropertyKey = cXMLDoc.AttributeToString(aDPNode, "PropertyKey")
			If aPropertyKey.IndexOf(".") <> -1 Then
				aRelatedPropertyKey = aPropertyKey.Substring(0, aPropertyKey.LastIndexOf("."))
				aRelatedPropertyNames = aRelatedPropertyKey.Split(".")
				aObjDefNode = WebAppl.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + SavedQueryDO.BaseDODKey + "']")
				For Each aPropertyName In aRelatedPropertyNames
					aObjDefPropertyNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" & aPropertyName & "']/Relationship")
					aChildDataObjKey = cXMLDoc.AttributeToString(aObjDefPropertyNode, "ChildDefinitionKey")
					aObjDefNode = aObjDefNode.ParentNode.SelectSingleNode("Definition[@Key='" + aChildDataObjKey + "']")
					If mJoinedDataObjects(aChildDataObjKey) Is Nothing Then
						aJoinedDataObject = New cJoinedDataObject(aPropertyKey, aRelatedPropertyNames.Length, "DisplayProperties")
						mJoinedDataObjects.Add(aChildDataObjKey, aJoinedDataObject)
						cXMLDoc.AddAttribute_ToNode(aDPNode, "Join")
						'aDPNode.Attributes("Join").Value = "Left"
					ElseIf CType(mJoinedDataObjects(aChildDataObjKey), cJoinedDataObject).Depth < aRelatedPropertyNames.Length Then
						CType(mJoinedDataObjects(aChildDataObjKey), cJoinedDataObject).Depth = aRelatedPropertyNames.Length
						CType(mJoinedDataObjects(aChildDataObjKey), cJoinedDataObject).Key = aPropertyName
						CType(mJoinedDataObjects(aChildDataObjKey), cJoinedDataObject).ParentNodeKey = "DisplayProperty"
					End If
				Next
			End If
		Next
	End Sub

'--------------------------------------------------------

	'commented out for new query tool, kda
	'Protected Sub ValidateDistinctSort(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
	'	Dim aSelectPropertyList As String
	'	Dim aSelectProperties As String()
	'	Dim aSelectProperty As String
	'	Dim aSortPropertyList As String
	'	Dim aSortProperties As String()
	'	Dim aSortProperty As String
	'	Dim aSearchResult As Integer
	'	Dim aValid As Boolean

	'	'If "Select Distinct" is checked on the editor page, all selected Sort fields must be part
	'	'of the list of Select fields. Otherwise, a SQL error will be thrown.
	'	If cXMLDoc.AttributeToString(AdHocQueryDefXMLDoc.DocElement, "SelectType") = "Distinct" Then
	'		'aSelectPropertyList = ctlSelect.SelectedValueList
	'		aSelectPropertyList = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlSelect:hdnList")
	'		aSelectProperties = aSelectPropertyList.Split(",")
	'		'aSortPropertyList = ctlSort.SelectedValueList
	'		aSortPropertyList = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlSort:hdnList")
	'		If aSortPropertyList <> "" Then
	'			aSortProperties = aSortPropertyList.Split(",")
	'			For Each aSortProperty In aSortProperties
	'				'aSearchResult = Array.BinarySearch(aSelectProperties, aSortProperty)
	'				'If aSearchResult < 0 Then
	'				'    aArgs.IsValid = False
	'				'    Return
	'				'End If
	'				For Each aSelectProperty In aSelectProperties
	'					If aSelectProperty = aSortProperty Then
	'						aValid = True
	'						Exit For
	'					End If
	'					aValid = False
	'				Next
	'				If Not aValid Then
	'					aArgs.IsValid = False
	'					Return
	'				End If
	'			Next
	'		End If
	'	End If
	'	aArgs.IsValid = True
	'End Sub

'--------------------------------------------------------

	'commented out for new query tool, kda
	'Protected Sub ValidateUniqueNameSave(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
	'	aArgs.IsValid = ValidateUniqueName("Save")
	'End Sub

'--------------------------------------------------------

	'commented out for new query tool, kda
	'Protected Sub ValidateUniqueNameSaveAs(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
	'	aArgs.IsValid = ValidateUniqueName("SaveAs")
	'End Sub

'--------------------------------------------------------

	'commented out for new query tool, kda
	'Protected Function ValidateUniqueName(aAction As String) As Boolean
	'	'Get ID of current query
	'	Dim aQueryID As Integer = SavedQueryDO.GetPropertyInt("SavedQueryID", -1)
		
	'	'Get list of all saved queries
	'	Dim aDataObjectNode As XmlNode
	'	Dim aXmlDoc As cXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SavedQuery", aDataObjectNode)
	'	Dim aQueryList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
	'	Dim aQueryDO As cDataObject
		
	'	'Compare names of saved queries to selected name
	'	For Each aQueryDO In aQueryList
	'		'If the "Save As" button was clicked, the name should not match any existing query name.
	'		'If the "Save" button was clicked, the name should not match the name of any existing query with a different query ID.
	'		If aQueryDO.GetPropertyString("Name") = Request.Form.Get("mPageFrameCtl:ctlPageContent:txtQueryName") And _
	'				(aAction = "SaveAs" Or aQueryDO.GetPropertyInt("SavedQueryID") <> aQueryID) Then
	'			Return False
	'		End If
	'	Next
	'	Return True
	'End Function
	
'--------------------------------------------------------

	Private Sub UpdateJoinsInNodeList(ByVal aParentNodeKey As String)
		Dim aArgsList As XmlNodeList
		Dim aJoinedDataObject As cJoinedDataObject
		Dim aArgumentNode As XmlNode
		Dim aRelatedPropertyNode As XmlNode
		Dim aRelatedPropertyNames As String()
		Dim aPropertyName As String
		Dim aObjDefNode As XmlNode
		Dim aObjDefPropertyNode As XmlNode
		Dim aChildDataObjKey As String

		aArgsList = AdHocQueryDefXMLDoc.DocElement.SelectNodes(aParentNodeKey + "/Argument")

		For Each aArgumentNode In aArgsList
			aRelatedPropertyNode = aArgumentNode.SelectSingleNode("RelatedProperty")
			If Not aRelatedPropertyNode Is Nothing Then
				aRelatedPropertyNode.Attributes("Join").Value = "None"
				aRelatedPropertyNames = cXMLDoc.AttributeToString(aRelatedPropertyNode, "PropertyKey").Split(".")
				aObjDefNode = WebAppl.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + SavedQueryDO.BaseDODKey + "']")
				For Each aPropertyName In aRelatedPropertyNames
					aObjDefPropertyNode = aObjDefNode.SelectSingleNode("Properties/Property[@Key='" & aPropertyName & "']/Relationship")
					aChildDataObjKey = cXMLDoc.AttributeToString(aObjDefPropertyNode, "ChildDefinitionKey")
					aObjDefNode = aObjDefNode.ParentNode.SelectSingleNode("Definition[@Key='" + aChildDataObjKey + "']")
					If mJoinedDataObjects(aChildDataObjKey) Is Nothing Then
						aJoinedDataObject = New cJoinedDataObject(FullPropertyKey(aArgumentNode), aRelatedPropertyNames.Length, aParentNodeKey)
						mJoinedDataObjects.Add(aChildDataObjKey, aJoinedDataObject)
					ElseIf CType(mJoinedDataObjects(aChildDataObjKey), cJoinedDataObject).Depth < aRelatedPropertyNames.Length Then
						CType(mJoinedDataObjects(aChildDataObjKey), cJoinedDataObject).Depth = aRelatedPropertyNames.Length
						CType(mJoinedDataObjects(aChildDataObjKey), cJoinedDataObject).Key = aPropertyName
						CType(mJoinedDataObjects(aChildDataObjKey), cJoinedDataObject).ParentNodeKey = aParentNodeKey
					End If
				Next
			End If
		Next
	End Sub
'=============================================================
'=============================================================
Private Class cJoinedDataObject

'=============================================================

	Private mKey As String
	Private mParentNodeKey As String
	Private mDepth As String


'=============================================================

	Public Property Key() As String
	Get
		Return mKey
	End Get
	Set(ByVal Value As String)
		mKey = Value
	End Set
	End Property

'-----------------------------------------------------

	Public Property ParentNodeKey() As String
	Get
		Return mParentNodeKey
	End Get
	Set(ByVal Value As String)
		mParentNodeKey = Value
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

	Public Sub New(ByVal aKey As String, ByVal aDepth As String, ByVal aParentNodeKey As String)
		Key = aKey
		Depth = aDepth
		ParentNodeKey = aParentNodeKey
	End Sub

'=============================================================

End Class
'=============================================================
'=============================================================
'========================================================

		Public Overrides Sub CoreCtl_Reset()

		End Sub
End Class
End Namespace