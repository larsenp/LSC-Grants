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
Imports System.Text

Namespace Implementation.Modules.Staff.Controls.Page.QueryTool
Public MustInherit Class cSelectCriteria
     Inherits Implementation.Modules.Staff.Controls.Page.QueryTool.cPersistQueryInfo

'========================================================

	Private mAdHocQueryConfigXMLDoc As cXMLDoc 'Ad Hoc Query Configuration XML document
	Private mQueryToolDefinitionXMLDoc As cXMLDoc 'Query Tool Definition XML document
    Private mQueryToolDefinitionNode As XmlNode
    Private mDataObjectNode as XmlNode
    Private mDefPrimaryPropertyNode as XmlNode
    Protected mLookupList as SortedList
	Protected ctlBoolean As DropDownList
	Protected ctlFieldName As DropDownList
	Protected ctlField as cUserCtlLoader
    Protected ctlOperator As DropDownList
	Protected txtValue As TextBox
	Protected btnAddFilter As cCSSButton
	Protected btnSaveFilter As cCSSButton
	Protected tabFilters As HtmlTable
    Protected spnFilters As HtmlGenericControl
	Protected valReqValue As RequiredFieldValidator
	Protected trAdvFilterValues as HtmlTableRow
	Protected tabEditFilters as HtmlTable
	Protected tdBoolean as HtmlTableCell
	Protected trFilters as HtmlTableRow
	Protected tbFilters as HtmlTable
	Protected lnkAdvFilters as cLink
	Protected tdShowColumn as HtmlTableCell
	Protected trAdvFilter as HtmlTableRow
	Protected tdSpacer as HtmlTableCell
	Protected lnkLookUp as cLink
	Protected ctlLookupValues as DropDownList
	Protected ctlViewResults As cNewWindowOpener
	Protected valShowColumn as CustomValidator
	Protected spnErrorMessage as HtmlGenericControl
	Protected trErrorMessage as HtmlTableRow
	Protected tdOptions as HtmlTableCell
	Protected trParenErrorMessage as HtmlTableRow
	Protected spnParenErrorMessage as HtmlGenericControl
	
	Private mKeyID as String = "0"
''========================================================

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


'--------------------------------------------------------

    Public Property KeyID() As String
		Get
			Return mKeyID
		End Get
		Set(ByVal Value As String)
			mKeyID = Value
		End Set
    End Property
    
'-------------------------------------------------------------

    Public ReadOnly Property QueryResultsWindowURL()
        Get
            QueryResultsWindowURL = WebAppl.Build_RootURL("Implementation/Modules/Staff/Controls/Page/Reports/pgQueryResults.aspx?UserKey=" + CType(Page, cModulePage).ModuleUser.GetWebSessionKey)
        End Get
    End Property

''========================================================

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
        Dim aCategory As String 'Category selected by user
		Dim aBaseDODKey As String	   'Category selected by user
		Dim aPropertiesNode as XmlNode
		Dim aQueryToolDefFileName as String
		
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		ctlField = FindControl("ctlField")
		ctlOperator = FindControl("ctlOperator")
		
        Select Case Request.QueryString("Display").Substring(0,1) 'Hack. If an anchor reference is included at the end of the URL, .NET includes that anchor in the QueryString collection, so Request.QueryString("Display") might return "0#Filters". PL 4/28/05
            Case "0"
                spnFilters.Visible = True
            Case "3"
                spnFilters.Visible = True
        End Select

		If Request.QueryString("EditFilterKey") Is Nothing Then
			btnAddFilter.Set_ServerClick(AddressOf btnAddFilter_Click)
			btnSaveFilter.Visible = False
		Else
			btnSaveFilter.Set_ServerClick(AddressOf btnSaveFilter_Click)
			btnAddFilter.Visible = False
		End If

		'Advanced Filters
		lnkAdvFilters.Set_ServerClick(AddressOf lnkAdvFilters_Click)
		
		'Lookup Tables Values
		lnkLookUp.Set_ServerClick(AddressOf lnkLookUp_Click)
		
		mFieldsList = New SortedList()
		
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
                aCategory = Request.QueryString("Category")
                If aCategory = "" Then
                    'error case
                Else
                    'Retrieve category node from query definition document
                    mQueryToolDefinitionNode = mQueryToolDefinitionXMLDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition/QueryTool[@GroupKey='" + aCategory + "']")
                    mQueryToolDefinitionNode = mQueryToolDefinitionNode.ParentNode
                    If Not IsPostBack Then
                        aBaseDODKey = cXMLDoc.AttributeToString(mQueryToolDefinitionNode, "Key")
                        'Clear out the query object in memory if there is one
                        'Instantiate new query object and set its BaseDODKey property
                        SavedQueryDO.BaseDODKey = aBaseDODKey
                        SavedQueryDO.Category = aCategory
                    End If
                End If
            Case "User"
				'If the user selects "Close" on the "Save As" page, the query tool page must load the saved query (in order to get the query name and 
				'description as last saved) but update it with the XML as saved to the session.
				If Request.QueryString("SavedQueryID") Is Nothing Then
				End If
                aCategory = SavedQueryDO.Category
                mQueryToolDefinitionNode = mQueryToolDefinitionXMLDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition/QueryTool[@GroupKey='" + aCategory + "']")
                mQueryToolDefinitionNode = mQueryToolDefinitionNode.ParentNode
            Case "Saved"
                SavedQueryDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SavedQuery", Request.QueryString("SavedQueryID"))
                aCategory = SavedQueryDO.Category
                mQueryToolDefinitionNode = mQueryToolDefinitionXMLDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition/QueryTool[@GroupKey='" + aCategory + "']")
                mQueryToolDefinitionNode = mQueryToolDefinitionNode.ParentNode
        End Select
        
		If Not Request.QueryString("QueryType") = "New" Then
			If SavedQueryDO.GetPropertyInt("UserID", 0) <> CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).UserID Then
				Response.Redirect(WebAppl.LogoutURL())
			End If
		End If
        
        'Build Fields List
        dim aPageSection as Implementation.Modules.Staff.Controls.Page.QueryTool.PageSection.cSelectFieldName = GetControl("ctlLoaderFieldName")
        aPageSection.BuildFieldsList(aCategory, "", "", mFieldsList)
        
        'Configure Fields/Operator drop drops
        aPageSection.ConfigureFieldDropDown(mFieldsList)
        ConfigureOperatorDropDown()
     
		dim aBool as String
		dim aArgsList as XmlNodeList = SavedQueryDO.SavedQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument")
		dim aArgEl as XmlNode
		dim aBoolAttr as String
		dim aKeyAttr as Integer
		dim aKeyID as Integer
		dim aGroupAttr as String
		dim aGroup as String = ""
		dim aShowColumnAttr as String
		dim aShowColumn as Boolean = True
		dim aKeyIDBool as String
		
		if aArgsList.Count < 2 then
			'hiding Adv Filter Options link until there are 2 or more filters
			trAdvFilter.Visible = False
		end if
			
		'populate filter table rows
		PopulateFiltersTable(mFieldsList, aGroup, aShowColumn)
		
		'create table and rows for Continue and/or Cancel buttons
		dim aTR as HtmlTableRow
		dim aTD as HtmlTableCell
		
		aTR = New HtmlTableRow()
		tabFilters.Rows.Add(aTR)
		aTD = New HtmlTableCell()
		aTD.InnerHtml = "&nbsp;"
		aTR.Cells.Add(aTD)
		
		aTR = New HtmlTableRow()
		tabFilters.Rows.Add(aTR)
		
		aTD = New HtmlTableCell()
		
	
		'ADD only "Continue" button in default mode
		if request.QueryString("AdvFilterKey") = "" then
			aTD.Align = "Center"
			aTD.ColSpan = 4
			Dim aContinueButton As cCSSButton
			aContinueButton = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cCSSButton']").Attributes("ControlFile").Value), cCSSButton)
			aContinueButton.Caption = "Continue"
			aContinueButton.CausesValidation = False
			'aCancelButton.Add_Attribute("Key", aKeyID)
			aContinueButton.Set_ServerClick(AddressOf btnContinue_Click)
			aTD.Controls.Add(aContinueButton)
			aTR.Cells.Add(aTD)		
		else	
			'ADD both Continue and Cancel buttons for Adv Filter Options mode
			trAdvFilter.Visible = False
			tdOptions.Visible = False
			
			aTD = New HtmlTableCell()
			aTD.ColSpan = 2
			aTD.InnerHtml = "&nbsp;"
			aTR.Cells.Add(aTD)
			'aTD.Align = "Center"
			
			aTD = New HtmlTableCell()
			Dim aContinueButton As cCSSButton
			aContinueButton = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cCSSButton']").Attributes("ControlFile").Value), cCSSButton)
			aContinueButton.Caption = "Continue"
			aContinueButton.CausesValidation = False
			aContinueButton.Set_ServerClick(AddressOf btnContinue_Click)
			aTD.Controls.Add(aContinueButton)
			aTR.Cells.Add(aTD)			
			
			aTD = New HtmlTableCell()
			Dim aCancelButton As cCSSButton
			aCancelButton = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cCSSButton']").Attributes("ControlFile").Value), cCSSButton)
			aCancelButton.Caption = "Cancel"
			aCancelButton.CausesValidation = False
			aCancelButton.Set_ServerClick(AddressOf btnCancel_Click)
			aTD.Controls.Add(aCancelButton)
			aTR.Cells.Add(aTD)
		end if
        
    End Sub
    
'=============================================================

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		
		'Default Mode:
		'restore core controls so values are not lost when user clicks "Select from Lookup Values" link
		if request.QueryString("LookupValue") <> "" then
			txtValue.Text = request.QueryString("LookupValue")
		end if
		
		if request.QueryString("Operator") <> "" then
			ctlOperator.SelectedValue = request.QueryString("Operator")
		end if
		
		if request.QueryString("FieldName") <> "" then
			dim aCtl as cCoreCtl = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).GetControl("ctlLoaderFieldName")
			dim aFieldsDD as DropDownList = CType(aCtl.FindControl("ctlFieldName"), DropDownList)
			aFieldsDD.SelectedIndex = request.QueryString("FieldName")
		end if
		
		if request.QueryString("FilterValue") <> "" then
			dim txtValue as TextBox
			txtValue = CType(me.FindControl("txtValue"), TextBox)
			dim aString = txtValue.Text
			
			txtValue.Text = request.QueryString("FilterValue")
		end if
		
		'Adv Filter Options mode:
		'restore check box values when in Adv Filter Options mode
		if request.QueryString("ChkKey") <> "" then
			dim aCheckBox as cCheckBox
			dim aKeyIDs as String()
			dim aKey as String
			aKeyIDs = me.Request.QueryString("ChkKey").Split(",")
			for each aKey in aKeyIDs
				aCheckBox = CType(me.FindControl("chk" + aKey), cCheckBox)
				if not aCheckBox is nothing then
					aCheckBox.BaseCheckButton.Checked = False
				end if
			next
		end if
		
	End Sub

''--------------------------------------------------------

    Public Sub ConfigureOperatorDropDown()
        Dim aItem As ListItem
		'If (Not IsPostBack()) Then
			aItem = New ListItem("=", "Equals")
			ctlOperator.Items.Add(aItem)

			aItem = New ListItem("<>", "NotEqual")
			ctlOperator.Items.Add(aItem)

			aItem = New ListItem(">", "GreaterThan")
			ctlOperator.Items.Add(aItem)

			aItem = New ListItem("<", "LessThan")
			ctlOperator.Items.Add(aItem)

			aItem = New ListItem("Contains", "Like")
			ctlOperator.Items.Add(aItem)
		'End If
    End Sub

''--------------------------------------------------------

    Public Sub btnAddFilter_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)

        valReqValue.Validate()
        If Not valReqValue.IsValid Then Exit Sub
        	
        'ADD FILTER
        AddFilterArgumentNode()
        RedirectToCurrentQueryWithAnchor("Filters")
        
    End Sub

''--------------------------------------------------------

    Public Sub lnkAdvFilters_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)

        'ADV FILTER OPTIONS link
        trAdvFilter.Visible = False
        tdOptions.Visible = False
	
        RedirectToAdvFilters()
    End Sub

''--------------------------------------------------------

    Public Sub lnkLookup_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
       
        'LOOKUP VALUE link
        'display Lookup Values pop up.  
        'if Lookup table exists, list those values.  If not, pop up a "No Lookup Table" window instead.
        dim aPropertyKey as String
        dim aCtl as cCoreCtl
        dim aFieldsDD as DropDownList
        dim aURL as String
        
       'get Field Name selected value
		aCtl = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).GetControl("ctlLoaderFieldName")
		aFieldsDD = CType(aCtl.FindControl("ctlFieldName"), DropDownList)
		aPropertyKey = aFieldsDD.SelectedValue 
				
		'Redirect to Lookup control in new pop up window and refresh parent page
		Session.Add("PropertyKey", aPropertyKey)
		aURL = request.RawUrl.ToString()
		aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "LookupTable")
		aURL = cWebLib.AddQuerystringParameter(aURL, "Operator", ctlOperator.SelectedValue)
		ctlViewResults.NewWindowURL() = aURL + "&PageFrame=Print"
		ctlViewResults.RefreshURL() = GetCurrentQueryURL()
		ctlViewResults.Open()
		Me.ctlViewResults.Open()
	    
    End Sub

''--------------------------------------------------------

    Public Sub btnSaveFilter_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)

        valReqValue.Validate()
        If Not valReqValue.IsValid Then Exit Sub
		
		'Save changes to Filter in Edit Filter mode
        SaveFilterArgumentNode()
        RedirectToCurrentQueryWithAnchor("Filters")
    End Sub

''--------------------------------------------------------

    Public Sub btnDelete_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
        Dim aKey As String
        aKey = aSrc.attributes("Key")
        
        'DELETE Filter
        DeleteFilterArgumentNode(aKey)
        RedirectToCurrentQuery()
    End Sub
    
''--------------------------------------------------------

    Public Sub btnEdit_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
        Dim aKey As String
        
        'Edit link for editing filters
        aKey = aSrc.attributes("Key")
        RedirectToEditFilter(aKey)
    
    End Sub
 
 ''--------------------------------------------------------

    Public Sub btnAddOpenParen_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		dim aKey As String
		dim aArgumentEl as XmlNode
		dim aFiltersNode as XmlNode
		dim aGroup as String
		dim aShowColumn as Boolean
		dim aIsValid as Boolean = True
		dim aGroupCloseNodeList as XmlNodeList
		dim aGroupOpenNodeList as XmlNodeList
		dim aBool as String
		dim aKeyIDBool as String
		Dim aURL As String 
		dim txtValue as TextBox
		dim aFilterValue as String
		
		'Get current values for WriteFilterArgumentNode method
		aKey = aSrc.attributes("Key")
        aArgumentEl = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters/Argument[@Key='" + aKey + "']")
		'aKeyID = cXMLDoc.AttributeToString(aArgumentEl, "Key", "0")
		aBool = cXMLDoc.AttributeToString(aArgumentEl, "Bool", "")
		aKeyIDBool = aKey + "_" + aBool
		aShowColumn = cXMLDoc.AttributeToBool(aArgumentEl, "ShowColumn", True)
		aGroup = "("
		
		WriteDisplayPropertyNode()
		'writes group open parens filter arg node
		WriteFilterArgumentNode(aArgumentEl, aKeyIDBool, aGroup)
        
		aGroupOpenNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument[@Group='(']")
		aGroupCloseNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument[@Group=')']")
		
		'if Open parens does not match Close parens throw error message
		if aGroupOpenNodeList.Count > aGroupCloseNodeList.Count then
			aIsValid = False
		end if
		
		aURL = GetCurrentQueryURL()
		
		'Send Value of filter to qs, in order to restore this control
		txtValue = CType(FindControl("txtValue"), TextBox)
		if not txtValue is nothing then
			aFilterValue = txtValue.Text
			aURL = cWebLib.AddQuerystringParameter(aURL, "FilterValue", aFilterValue)
		end if
		
		if aIsValid = False then
			aURL = cWebLib.AddQuerystringParameter(aURL, "Key", aKey)
			aURL = cWebLib.AddQuerystringParameter(aURL, "IsValid", "False")
		end if
		
		EventController_NavigateToURL(aURL)
    
    End Sub
 
  ''--------------------------------------------------------

    Public Sub btnRemoveOpenParen_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		dim aKey As String
		dim aArgumentEl as XmlNode
		dim aFiltersNode as XmlNode
		dim aGroup as String
		dim aShowColumn as Boolean
		dim aBool as String
		dim aKeyIDBool as String
		Dim aURL As String
		dim txtValue as TextBox
		dim aFilterValue as String
		
		'Get current values for WriteFilterArgumentNode method (see below)
		aKey = aSrc.attributes("Key")
        aArgumentEl = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters/Argument[@Key='" + aKey + "']")
		aKey = cXMLDoc.AttributeToString(aArgumentEl, "Key", "0")
		aBool = cXMLDoc.AttributeToString(aArgumentEl, "Bool", "")
		aKeyIDBool = aKey + "_" + aBool
		aShowColumn = aShowColumn = cXMLDoc.AttributeToBool(aArgumentEl, "ShowColumn", True)
		aGroup = "RemoveOpenParen"
		
		WriteDisplayPropertyNode()
		'removes a particular group open parens arg node
		WriteFilterArgumentNode(aArgumentEl, aKeyIDBool, aGroup)
		
		aURL = GetCurrentQueryURL()
		
		'Send Value of filter to qs, in order to restore this control
		txtValue = CType(FindControl("txtValue"), TextBox)
		if not txtValue is nothing then
			aFilterValue = txtValue.Text
			aURL = cWebLib.AddQuerystringParameter(aURL, "FilterValue", aFilterValue)
		end if
		
		EventController_NavigateToURL(aURL)
    
    End Sub
    
  ''--------------------------------------------------------

    Public Sub btnRemoveCloseParen_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		dim aKey As String
		dim aArgumentEl as XmlNode
		dim aFiltersNode as XmlNode
		dim aGroup as String
		dim aShowColumn as Boolean
		dim aBool as String
		dim aKeyIDBool as String
		Dim aURL As String
		dim txtValue as TextBox
		dim aFilterValue as String
		
		'Get current values for WriteFilterArgumentNode method (see below)
		aKey = aSrc.attributes("Key")
        aArgumentEl = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters/Argument[@Key='" + aKey + "']")
		aKey = cXMLDoc.AttributeToString(aArgumentEl, "Key", "0")
		aBool = cXMLDoc.AttributeToString(aArgumentEl, "Bool", "")
		aKeyIDBool = aKey + "_" + aBool
		aShowColumn = cXMLDoc.AttributeToBool(aArgumentEl, "ShowColumn", True)
		aGroup = "RemoveCloseParen"
		
		WriteDisplayPropertyNode()
		'removes a particular group close parens arg node
		WriteFilterArgumentNode(aArgumentEl, aKeyIDBool, aGroup)
		
		aURL = GetCurrentQueryURL()
		
		'Send Value of filter to qs, in order to restore this control
		txtValue = CType(FindControl("txtValue"), TextBox)
		if not txtValue is nothing then
			aFilterValue = txtValue.Text
			aURL = cWebLib.AddQuerystringParameter(aURL, "FilterValue", aFilterValue)
		end if
		
		EventController_NavigateToURL(aURL)
    
    End Sub
 
  ''--------------------------------------------------------

	'Validating Open and Close Parens for Groupings
	Public Function ValidateParens(ByVal aKeyID as String) As Boolean
		dim aGroupOpenNode as XmlNode
		dim aGroupCloseNode as XmlNode
		dim aGroupCloseNodeList as XmlNodeList
		dim aGroupOpenNodeList as XmlNodeList
		dim aIsValid as Boolean = True
		
		aGroupOpenNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument[@Group='(']")
		aGroupCloseNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument[@Group=')']")
		
		'if CloseParens starts very first grouping, throw up warning
		if aGroupCloseNodeList.Count = 1 And aGroupOpenNodeList.Count = 0 then
			trParenErrorMessage.Visible = True
			spnParenErrorMessage.InnerHtml = "<br><font color='red'><b>You have started your grouping with a close parens when it must start with an open parens.</b></font>"
			exit Function
		end if
		
		'if Open parens does not match Close parens, throw error message
		if aGroupOpenNodeList.Count > aGroupCloseNodeList.Count then
			trParenErrorMessage.Visible = True
			spnParenErrorMessage.InnerHtml =  "<br><font color='red'><b>You have an extra open parens that does not have a matching closed parens.</b></font>"
			exit Function
		end if
		
		'if Close parens does not match Open parens, throw error message
		if aGroupCloseNodeList.Count > aGroupOpenNodeList.Count then
			trParenErrorMessage.Visible = True
			spnParenErrorMessage.InnerHtml =  "<br><font color='red'><b>You have an extra close parens that does not have a matching open parens.</b></font>"
			exit Function
		end if
		
		Return True
		
	End Function
 
 ''--------------------------------------------------------

    Public Sub btnAddCloseParen_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		dim aKey As String
		dim aArgumentEl as XmlNode
		dim aFiltersNode as XmlNode
		dim aGroup as String
		dim aShowColumn as Boolean
		dim aIsValid as Boolean = True
		dim aGroupCloseNodeList as XmlNodeList
		dim aGroupOpenNodeList as XmlNodeList
		dim aBool as String
		dim aKeyIDBool as String
		Dim aURL As String 
		dim txtValue as TextBox
		dim aFilterValue as String
		
		aKey = aSrc.attributes("Key")
        aArgumentEl = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters/Argument[@Key='" + aKey + "']")
		aKey = cXMLDoc.AttributeToString(aArgumentEl, "Key", "0")
		aBool = cXMLDoc.AttributeToString(aArgumentEl, "Bool", "")
		aKeyIDBool = aKey + "_" + aBool
		aShowColumn = cXMLDoc.AttributeToBool(aArgumentEl, "ShowColumn", True)
		aGroup = ")"
		
		WriteDisplayPropertyNode()
		
		'write group close paren filter arg node
		WriteFilterArgumentNode(aArgumentEl, aKeyIDBool, aGroup)

		aGroupOpenNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument[@Group='(']")
		aGroupCloseNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument[@Group=')']")
        
        if aGroupCloseNodeList.Count = 1 And aGroupOpenNodeList.Count = 0 then
			aIsValid = False
		end if
		
		'if Close parens does not match Open parens throw error message
		if aGroupCloseNodeList.Count > aGroupOpenNodeList.Count then
			aIsValid = False
		end if
		
		aURL = GetCurrentQueryURL()		
		
		'Send Value of filter to qs, in order to restore this control
		txtValue = CType(FindControl("txtValue"), TextBox)
		if not txtValue is nothing then
			aFilterValue = txtValue.Text
			aURL = cWebLib.AddQuerystringParameter(aURL, "FilterValue", aFilterValue)
		end if
		
		'send IsValid=False to qs, so that error message can be thrown up after filters are written to fitlers table
		if aIsValid = False then
			aURL = cWebLib.AddQuerystringParameter(aURL, "Key", aKey)
			aURL = cWebLib.AddQuerystringParameter(aURL, "IsValid", "False")
		end if
		
		EventController_NavigateToURL(aURL)
 
    End Sub
 
 ''--------------------------------------------------------

    Public Sub btnCancel_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		Dim aURL As String
		dim aDisplayPropertiesNode as XmlNode
		dim aDisplayPropertiesList as XmlNodeList
		dim aDisplayPropertyNode as XmlNode

        'make Adv Filter Options link visible, remove adv filter values from qs before going back to Default mode
        trAdvFilter.Visible = True
		aURL = GetCurrentQueryURL()
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "AdvFilterKey")

		'get DisplayPropert
		aDisplayPropertiesNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("DisplayProperties")
		aDisplayPropertiesList = aDisplayPropertiesNode.SelectNodes("DisplayProperty")
		
		'when cancelling out of Adv Filter Options mode, make sure all ShowColumn attribute values are set back to "True" (Default)
		for each aDisplayPropertyNode in aDisplayPropertiesList
			if not aDisplayPropertyNode.Attributes("ShowColumn") is nothing then
				aDisplayPropertyNode.Attributes("ShowColumn").Value = "True"
			end if
		next
		
		EventController_NavigateToURL(aURL)
		
    End Sub
    
  ''--------------------------------------------------------      
    
    'Validate Show Columns, making sure a user selects or de-selects all Show Column check boxes for a particular Field name
    Public Function ValidateShowColumns() As Boolean
		dim aDisplayPropertiesList as XmlNodeList
		dim aDisplayPropertyNode as XmlNode
		dim aDisplayPropertiesNode as XmlNode
		dim aArgEl as XmlNode
		dim aArgsList as XmlNodeList
		dim aRelatedPropertyNode as XmlNode
		dim aRelatedPropertyKey as String
		dim aDisplayPropertyKey as String
		dim aColumnHeader as String
		dim aShowColumns as New ArrayList()
		dim aNumbers as New ArrayList()
		dim aColumnLabel as New StringBuilder()
		dim aNumberLabel as New StringBuilder()
		dim i as Integer
		dim aIsValid as Boolean = True
		dim aValLabel as New StringBuilder()
		dim aPropertyKey as String
		dim aCheckBox as cCheckBox
		dim aConflict as Boolean = False
						
		'get DisplayProperty and Filters Arg Lists
		aDisplayPropertiesNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("DisplayProperties")
		aDisplayPropertiesList = aDisplayPropertiesNode.SelectNodes("DisplayProperty")
		aArgsList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument")
		
		for each aDisplayPropertyNode in aDisplayPropertiesList
			for each aArgEl in aArgsList
				'make sure this is not a Group filter arg element
				if aArgEl.Attributes("Group") is nothing then
					'get RelatedProperty element and PropertyKey of Filter argument node
					aRelatedPropertyNode = aArgEl.SelectSingleNode("RelatedProperty")
					aPropertyKey = aArgEl.Attributes("PropertyKey").Value
					'check to see if each Show Column check box belongs to the same Field name.  If so, we add the Show Column attr value
					'  to an array list.  We also add the Filter Key to an array list as well, which is used below in our error message letting
					'  user know what Filter numbers are inconsistent
					if not aRelatedPropertyNode is nothing then								
						aRelatedPropertyKey = aRelatedPropertyNode.Attributes("PropertyKey").Value
						'gets dot related property for filter arg element
						aDisplayPropertyKey = aRelatedPropertyKey + "." + aArgEl.Attributes("PropertyKey").Value
						'get Field name value, used for error message below so we can display what Field name is in question
						aColumnHeader = aDisplayPropertyNode.Attributes("ColumnHeader").Value
						'if DP.PropertyKey = dot related property key of Filter arg element
						if aDisplayPropertyNode.Attributes("PropertyKey").Value = aDisplayPropertyKey then
							'find checkbox of current Filter arg element
							aCheckBox = FindControl("chk" + aArgEl.Attributes("Key").Value)
							if not aCheckBox is nothing then
								'add value of Show Column check box to ShowColumns array list
								aShowColumns.Add(aCheckBox.BaseCheckButton.Checked)
							end if
							'add Key value of Filter arg element into Numbers array list
							aNumbers.Add(aArgEl.Attributes("Key").Value)
						end if
					else
						'if there is no RelatedPropertyNode for the Filter arg element, we compare the ArgEl.PropertyKey with the DP.PropertyKey
						aDisplayPropertyNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='" + aPropertyKey + "']")
						aColumnHeader = aDisplayPropertyNode.Attributes("ColumnHeader").Value
						if aDisplayPropertyNode.Attributes("PropertyKey").Value = aArgEl.Attributes("PropertyKey").Value then
							aShowColumns.Add(aDisplayPropertyNode.Attributes("ShowColumn").Value)
							aNumbers.Add(aArgEl.Attributes("Key").Value)
						end if
					end if
				end if
			next

			if aShowColumns.Count > 0 then
				'for each ShowColumn check box for a particular Field name, we check to make sure the check boxes are consistent, all True or all False.
				'  if not, we append the Field Name in the ColumnLabel, which is used in our error message below.  We exit "for" loop as soon as a 
				'  mismatch is found, so Field Name is not repeated in error message. 
				for i=0 to aShowColumns.Count - 1
					if i <> 0 then
						if aShowColumns.Item(i - 1) <> aShowColumns.Item(i) then
							if aColumnLabel.Length = 0 then
								aColumnLabel.Append(aColumnHeader)
							else
								aColumnLabel.Append(", ")
								aColumnLabel.Append(aColumnHeader)
							end if								
							aIsValid = False
							aConflict = True
							exit For
						end if
					end if
				next
				
				if aConflict = True then
					'if there is a mistach between Show Column check boxes for a Field Name, we append the filter key numbers into NumberLabel, 
					'  which is also used in the error message below
					for i=0 to aNumbers.Count - 1
						if aNumberLabel.Length = 0 then
							aNumberLabel.Append(aNumbers.Item(i))
						else
							aNumberLabel.Append(", ")
							aNumberLabel.Append(aNumbers.Item(i))
						end if
						aIsValid = False
					next
				end if	
			end if
			
			'clear array lists before comparing next DP and Filter ArgEl
			aShowColumns.Clear()
			aNumbers.Clear()																			
		
		next
						
		'if validation does not pass, we display error message label for each Field Name where its Show Column check boxes are not consistently
		'  selected or de-selected
		if aIsValid = False
			spnErrorMessage.Visible = True
			trErrorMessage.Visible = True
			'TODO:  implement so message would read:  "Field Name, Numbers: 1, 2 4; Field Name, Numbers:  3, 5"
			if aColumnLabel.Length > 0 then
				aValLabel.Append("<font color='red'>You are asking to show and hide <b>'" + _
					aColumnLabel.ToString() + "'</b> Field(s).&nbsp;&nbsp;Please make Show column check boxes consistent for Number(s):&nbsp;&nbsp;<b>'" + _
					aNumberLabel.ToString() + "'</b>.")
			end if
			spnErrorMessage.InnerHtml = "<br>" + aValLabel.ToString() + "<b>" + "</b></font><br>"
			Return False
		else
			Return True
		end if
    
    End Function
    
 '--------------------------------------------------------	
	
	Public Overrides Sub PersistQueryInfo(ByVal aPageKey as String)
		
		dim aBool as String
		dim aArgsList as XmlNodeList
		dim aArgEl as XmlNode
		dim aBoolAttr as String
		dim aKeyAttr as Integer
		dim aPKAttr as String
		dim aKeyID as Integer
		dim aPropertyKey as String
		dim aShowColumnAttr as Boolean
		dim aDisplayPropertiesList as XmlNodeList
		dim aOpenParenList as New ArrayList()
		dim aCloseParenList as New ArrayList()
		dim aKeyIDBool as String

		'View in Browser button
		if aPageKey = "" then
			'TODO:  only display columns where ShowColumn=True
			'Me.ctlViewResults.Open()
		else
			'Continue button
			'validation/re-direct to GroupSort page
			aArgsList = SavedQueryDO.SavedQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument")	
				
			For Each aArgEl in aArgsList
			
				'get values for WriteFilterArgumentNode method
				aBoolAttr = cXMLDoc.AttributeToString(aArgEl, "Bool", "")
				aKeyAttr = cXMLDoc.AttributeToInt(aArgEl, "Key", 0)
				aPKAttr = cXMLDoc.AttributeToString(aArgEl, "PropertyKey", "")
				aBool = aBoolAttr
				aKeyID = aKeyAttr
				aPropertyKey = aPKAttr
				
				'In Advanced Filter Options mode and when ArgEl is not a Filter Group Arg node, we need to update
				'  any current filter values
				if request.QueryString("AdvFilterKey") <> "" AndAlso aArgEl.Attributes("Group") is nothing then
					aKeyIDBool = aKeyID.ToString() + "_" + aBool
					'aShowColumnAttr = cXMLDoc.AttributeToBool(aArgEl, "ShowColumn")
					WriteFilterArgumentNode(aArgEl, aKeyIDBool, "")					
				end if
												
				'compare open and close paren counts and if <> then throw up error message
				if request.QueryString("AdvFilterKey") = "" AndAlso not aArgEl.Attributes("Group") is nothing then
					if aArgEl.Attributes("Group").Value = "(" then
						aOpenParenList.Add(aArgEl.Attributes("Group").Value)
					end if
					
					if aArgEl.Attributes("Group").Value = ")" then
						aCloseParenList.Add(aArgEl.Attributes("Group").Value)
					end if
				end if
					
			Next
			
			'In Advanced Filter Options mode, we call ValidateShowColumns() when more than one Field is used for filters.			
			if request.QueryString("AdvFilterKey") <> "" then
				aDisplayPropertiesList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("DisplayProperties/DisplayProperty")
				if aDisplayPropertiesList.Count > 1 then
					ValidateShowColumns()
					if ValidateShowColumns() = False
						exit Sub
					end if
				end if
			end if
			
			WriteDisplayPropertyNode()
			
			'display Paren error message if open parens do not match closed parens
			if aOpenParenList.Count <> aCloseParenList.Count then
				trParenErrorMessage.Visible = True
				spnParenErrorMessage.InnerHtml = "<br><font color='red'><b>Open parens do not match your Closed parens.  Please make sure all Open parens have a Closed parens.</b></font>"
				exit Sub
			end if
										
		end if
		
	End Sub 
	  
 ''--------------------------------------------------------

    Public Sub btnContinue_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
       
		'Calls PersistQueryInfo
		dim aPageKey as String = "GroupSort"
		PersistQueryInfo(aPageKey)
			
   End Sub
    
''--------------------------------------------------------

	Public Sub PopulateFiltersTable(ByVal mFieldsList As Object, ByVal aGroup As String, ByVal aShowColumn As Boolean)
		Dim aFiltersNode As XmlNode
		Dim aFilterArgsList As XmlNodeList
		Dim aFilterArgEl As XmlElement
		dim aBool as String
		Dim aTR As HtmlTableRow
		Dim aTD As HtmlTableCell
		Dim aPropertyKey As String
		Dim aRelatedPropertyEl As XmlElement
		dim aCtl as cCoreCtl
		dim aFieldsDD as DropDownList
		dim aKeyIDBool as String
		
		aFiltersNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters")
		aFilterArgsList = aFiltersNode.SelectNodes("Argument")
		
		'Build list of filters saved into query
		For Each aFilterArgEl In aFilterArgsList
			'get values for WriteFilterTableRow and WriteAdvFilterTableRow methods below
			KeyID = cXMLDoc.AttributeToString(aFilterArgEl, "Key", "0")
			aBool = cXMLDoc.AttributeToString(aFilterArgEl, "Bool", "And")
			aKeyIDBool = KeyID + "_" + aBool
			aShowColumn = cXMLDoc.AttributeToBool(aFilterArgEl, "ShowColumn", True)
			'if in Adv Filter Options mode, call WriteADVFilterTableRow, otherwise call WriteFilterTableRow instead.
			if request.QueryString("AdvFilterKey") is nothing AndAlso KeyID <> "0" then
				WriteFilterTableRow(aFilterArgEl, mFieldsList, aKeyIDBool, aGroup)
			elseif not request.QueryString("AdvFilterKey") is nothing AndAlso KeyID <> "0" then
				WriteAdvFilterTableRow(aFilterArgEl, mFieldsList, aKeyIDBool, aGroup, aShowColumn)
			end if
		Next
		
		'Initially, Open/Close paren validation is done when user clicks open or close paren button.  But, in order for us 
		'  to display parens as last entered, we need to write filter group arg nodes before throwing error message.  So, 
		'  "IsValid" parameter is sent to qs if validation does not pass when open or close parent button is clicked.  
		'  Then, here, after filter rows are written to table, we call ValidateParens() function that will actually throw the error message.
		if request.QueryString("IsValid") = "False" then
			ValidateParens(request.QueryString("Key"))
		end if
			
		'If editing a filter, load filter values into editor controls
		If Not Request.QueryString("EditFilterKey") Is Nothing Then
			aFilterArgEl = aFiltersNode.SelectSingleNode("Argument[@Key='" + Request.QueryString("EditFilterKey") + "']")
			'FIELD NAME drop down
			If cXMLDoc.AttributeToString(aFilterArgEl, "PropertyKey") <> "" Then
				aPropertyKey = cXMLDoc.AttributeToString(aFilterArgEl, "PropertyKey")
				aRelatedPropertyEl = aFilterArgEl.SelectSingleNode("RelatedProperty")
				If Not aRelatedPropertyEl Is Nothing Then
					aPropertyKey = cXMLDoc.AttributeToString(aRelatedPropertyEl, "PropertyKey") + "." + aPropertyKey
				End If
				aCtl = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).GetControl("ctlLoaderFieldName")
				aFieldsDD = CType(aCtl.FindControl("ctlFieldName"), DropDownList)
				aFieldsDD.SelectedValue = aPropertyKey
			End If
			'OPERATOR drop down
			If cXMLDoc.AttributeToString(aFilterArgEl, "Operator") <> "" Then
				ctlOperator.SelectedValue = cXMLDoc.AttributeToString(aFilterArgEl, "Operator")
			End If
			'VALUE text box
			If cXMLDoc.AttributeToString(aFilterArgEl, "Value") <> "" Then
				txtValue.Text = cXMLDoc.AttributeToString(aFilterArgEl, "Value")
			End If
		End If
	End Sub
	
''--------------------------------------------------------

	Public Sub WriteFilterTableRow(ByVal aFilterArgEl As XmlElement, ByVal mFieldsList As Object, ByVal aKeyIDBool As String, _
										ByVal aGroup As String)
		
		Dim aTR As HtmlTableRow
		Dim aTD As HtmlTableCell
		Dim aPropertyKey As String
		Dim aButton As cCSSButton
		Dim aOperator As String
		dim aBoolDropDown as cDropDown
		dim aBool as String
		dim aIndex as Integer
		dim aGroupIndex as Integer
		dim aQTGroupFilterKeyID as Integer
		dim aGroupItems as String()
		dim aGroupItem as String
		Dim aItem As ListItem
		dim aString as String
		dim aID as String
		dim aControlIndex as Integer
		dim aKeyItem as String
		dim aControls as String()
		dim aControl as String
		dim aCount as Integer = 0
		dim aFiltersGroupArgNode as XmlNode
		dim aArgNode as XmlNode
		dim aPropertyNode as XmlNode
		dim aValue as String
		dim aGroupsOpen As StringBuilder = New StringBuilder()
		dim aGroupsClose as StringBuilder = New StringBuilder()
		dim aOpenParenList as New ArrayList()
		dim aCloseParenList as New ArrayList()
		dim aGroupArgNodeList as XmlNodeList 
		dim aArgsEl as XmlNode
		dim aStartIndex as Integer
		
		tdSpacer.Visible = False
		
		'Create table for filters
		aTR = New HtmlTableRow()
		tabFilters.Rows.Add(aTR)
		aTD = New HtmlTableCell()

		'extract KeyID and Boolean from aKeyIDBool parameter:  KeyID is ID of control and aBool is boolean drop down selection
		aIndex = aKeyIDBool.IndexOf("_")
		KeyID = aKeyIDBool.Substring(0, aIndex)
		aBool = aKeyIDBool.Substring(aIndex + 1)
		
		'Load/Configure controls for each filter row
		
		'BOOLEAN drop down
		'  we do not load/configure this control for 1st Filter row
		if cXMLDoc.AttributeToString(aFilterArgEl, "Key") <> "1" AndAlso KeyID <> "0" then
			dim aKey as String = cXMLDoc.AttributeToString(aFilterArgEl, "Key")
			
			'load boolean drop down
			aBoolDropDown = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cDropDown']").Attributes("ControlFile").Value), cDropDown)
			
			'configure drop down
			aItem = New ListItem("<None>", "")
			aBoolDropDown.Items.Add(aItem)
			aBoolDropDown.Items.Add("And")
			aBoolDropDown.Items.Add("Or")
			aControlIndex = 0
			'in order to retain boolean selection in view state, need to use Request.Form in order to find control and then
			'  store that value in the Boolean control.  This is done by splitting each key in Request.Form.AllKeys and finding
			'  the KeyID for each Request.Form.Key.Item.  Then, if the current Filter.KeyID = Request.Form.Key.Item(KeyID), we
			'  use the index of that Request.Form.Key to get the value and set the control.
			if request.Form.AllKeys.Length <> 0 then
				for each aKeyItem in request.Form.Keys
					'mPageFrameCtl:ctlPageContent:4:selDropDown
					aControls = aKeyItem.Split(":")
					for each aControl in aControls
						dim aEndIndex as Integer
						if aControl = "selDropDown" then
							aEndIndex = (aKeyItem.Length - aControl.Length) - 1
							aStartIndex = aKeyItem.Substring(0, aEndIndex).LastIndexOf(":") + 1
							'gets us the KeyID of drop down from the CoreCtl_ClientID.  In the example above, it would be "4".
							aID = aKeyItem.Substring(aStartIndex, aEndIndex - aStartIndex)
							'if ID in CoreCtl_ClientID = Current Filter.KeyID, we use the index of this Request.Form.Key.Item
							'  in order to set our boolean drop down
							if aID = KeyID then
								aControlIndex = aCount
								exit for
							end if
						end if
					next
					aCount += 1
				next
				'if there are no Boolean drop downs, we set drop down to its default "And".
				if aControlIndex = 0 then
					aBoolDropDown.SelectedField = "And"
				else
					'set Boolean drop down, which we get in above "for" loop.
					aBoolDropDown.SelectedField = Request.Form.Get(aControlIndex)
					aKeyIDBool = KeyID + "_" + Request.Form.Get(aControlIndex)
					WriteFilterArgumentNode(aFilterArgEl, aKeyIDBool, "")
				end if
			'if Request.Form.AllKeys.Length = 0, then we use "aBool" property to set our control
			elseif aBool <> "" then
				aBoolDropDown.SelectedField = aBool
			elseif aBool = "" then
				aFiltersGroupArgNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters/Argument[@QTGroupFilterKey='" + KeyID + "']")
				aArgNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters/Argument[@Key='" + KeyID + "']")
				if not aFiltersGroupArgNode is nothing then
						'when user is using group open/close parens buttons, we need to make sure when a Filter argument node Bool attribute
						'  value is nothing that we instead us the Bool attribute of the Group argument node to set
						'  the Boolean drop down control.  If we do not, the Boolean drop down will always be set to "And".
						if aArgNode.Attributes("Key").Value = aFiltersGroupArgNode.Attributes("QTGroupFilterKey").Value
							if aFiltersGroupArgNode.Attributes("Bool").Value <> "" then
								aBoolDropDown.SelectedField = aFiltersGroupArgNode.Attributes("Bool").Value
							end if
						end if
				else
					aBoolDropDown.SelectedField = "And"
				end if
			end if
			'assign ID to boolean control and add to table cell
			aBoolDropDown.ID = aKey
			aTD.Controls.Add(aBoolDropDown)
			aTR.Cells.Add(aTD)
		else
			aTD.InnerHtml = "&nbsp;"
			aTR.Cells.Add(aTD)
		end if
	
		'FIELD NAME:
		'Get DP.FullPropertyKey in order to get current DP
		aPropertyKey = FullPropertyKey(aFilterArgEl)
		if aPropertyKey <> "" then
			aPropertyNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='" + aPropertyKey + "']")
			aValue = cXMLDoc.AttributeToString(aPropertyNode, "ColumnHeader")
			aGroupArgNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument[@QTGroupFilterKey='" + KeyID.ToString() + "']")
			
			aTD = New HtmlTableCell()		
			
			'get all Group "Open" arg nodes for the current Filter row and append them to an array list, so multiple open parens
			'  for a particular Filter can be displayed
			if aGroupArgNodeList.Count > 0 then
				for each aArgsEl in aGroupArgNodeList
					if aArgsEl.Attributes("Group").Value = "(" then
						if aArgsEl.Attributes("QTGroupFilterKey").Value = KeyID then
							aGroupsOpen.Append(aArgsEl.Attributes("Group").Value)
						end if
					end if
				next
				'display open parens before Field Name for current Filter
				aTD.InnerHtml = "<b><font color='blue'>" + aGroupsOpen.ToString() + "</font></b>" + "&nbsp;&nbsp;" + aValue
			else
				'if there are no Group arg nodes, just display Field name 
				aTD.InnerHtml = aValue
			end if
			aTR.Cells.Add(aTD)		
		end if
		
		'OPERATOR:
		aOperator = cXMLDoc.AttributeToString(aFilterArgEl, "Operator")
		If aOperator = "Like" Then aOperator = "Contains"
		cWebLib.Add_TableCell(aTR, aOperator)
		
		'VALUE:
		aTD = New HtmlTableCell()
		aValue = cXMLDoc.AttributeToString(aFilterArgEl, "Value")
		'get all Group "Close" arg nodes for the current Filter row and append them to an array list, so multiple close parens
			'  for a particular Filter can be displayed
		if aGroupArgNodeList.Count > 0 then
			for each aArgsEl in aGroupArgNodeList
				if aArgsEl.Attributes("Group").Value = ")" then
					if aArgsEl.Attributes("QTGroupFilterKey").Value = KeyID then
						aGroupsClose.Append(aArgsEl.Attributes("Group").Value)
					end if
				end if
			next
			'display open parens after Field Name for current Filter
			aTD.InnerHtml = aValue + "&nbsp;&nbsp;" + "<b><font color='blue'>" + aGroupsClose.ToString() + "</font></b>"
		else
			'if there are no Group arg nodes, just display Field name 
			aTD.InnerHtml = aValue
		end if
		aTR.Cells.Add(aTD)



		'ADD OPEN PARENS button:
		aTD = New HtmlTableCell()
		aButton = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cCSSButton']").Attributes("ControlFile").Value), cCSSButton)
		aButton.Caption = "Add"
aButton.CausesValidation = False
		aButton.Add_Attribute("Key", cXMLDoc.AttributeToString(aFilterArgEl, "Key"))
		aButton.Set_ServerClick(AddressOf btnAddOpenParen_Click)
		aTD.Controls.Add(aButton)
		aTR.Cells.Add(aTD)
		
		'REMOVE OPEN PARENS button:
		aTD = New HtmlTableCell()
		aButton = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cCSSButton']").Attributes("ControlFile").Value), cCSSButton)
		aButton.Caption = "hide"
		aButton.CausesValidation = False
		aButton.Add_Attribute("Key", cXMLDoc.AttributeToString(aFilterArgEl, "Key"))
		aButton.Set_ServerClick(AddressOf btnRemoveOpenParen_Click)
		aTD.Controls.Add(aButton)
		aTR.Cells.Add(aTD)
		
		'ADD CLOSE PARENS button:
		aTD = New HtmlTableCell()
		aButton = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cCSSButton']").Attributes("ControlFile").Value), cCSSButton)
		aButton.Caption = "Add_"
		aButton.CausesValidation = False
		aButton.Add_Attribute("Key", cXMLDoc.AttributeToString(aFilterArgEl, "Key"))
		aButton.Set_ServerClick(AddressOf btnAddCloseParen_Click)
		aTD.Controls.Add(aButton)
		aTR.Cells.Add(aTD)
		
		'REMOVE CLOSE PARENS button:
		aTD = New HtmlTableCell()
		aButton = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cCSSButton']").Attributes("ControlFile").Value), cCSSButton)
		aButton.Caption = "Hide"
		aButton.CausesValidation = False
		aButton.Add_Attribute("Key", cXMLDoc.AttributeToString(aFilterArgEl, "Key"))
		aButton.Set_ServerClick(AddressOf btnRemoveCloseParen_Click)
		aTD.Controls.Add(aButton)
		aTR.Cells.Add(aTD)
		
		
		'EDIT button:
		aTD = New HtmlTableCell()
		aButton = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cCSSButton']").Attributes("ControlFile").Value), cCSSButton)
		aButton.Caption = "Edit"
		aButton.CausesValidation = False
		aButton.Add_Attribute("Key", cXMLDoc.AttributeToString(aFilterArgEl, "Key"))
		aButton.Set_ServerClick(AddressOf btnEdit_Click)
		aTD.Controls.Add(aButton)
		aTR.Cells.Add(aTD)

		'DELETE button:
		aTD = New HtmlTableCell()
		aButton = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cCSSButton']").Attributes("ControlFile").Value), cCSSButton)
		aButton.Caption = "Delete"
		aButton.CausesValidation = False
		aButton.Add_Attribute("Key", cXMLDoc.AttributeToString(aFilterArgEl, "Key"))
		aButton.Set_ServerClick(AddressOf btnDelete_Click)
		aTD.Controls.Add(aButton)
		aTR.Cells.Add(aTD)

	End Sub

''--------------------------------------------------------

	Public Sub WriteAdvFilterTableRow(ByVal aFilterArgEl As XmlElement, ByVal mFieldsList As Object, ByVal aKeyIDBool As String, _
										ByVal aGroup as String, ByVal aShowColumn As Boolean)
		Dim aTR As HtmlTableRow
		Dim aTD As HtmlTableCell
		Dim aPropertyKey As String
		Dim aButton As cCSSButton
		Dim aOperator As String
		dim aBoolDropDown as cDropDown
		dim aKey as String
		dim aBool as String
		dim aIndex as Integer = 0
		dim aBoolLabel as cLabel
		dim aString as String
		dim aID as String
		dim aContainerIndex as Integer = 0
		dim aDisplayName as String 
		
		
		'In Adv Filter Options mode, we need to hide Boolean drop downs and replace Edit/Delete buttons with Show Column
		'  check boxes instead
		tdBoolean.Visible = False
		tdShowColumn.Visible = True
		tdSpacer.Visible = True
		
		aTR = New HtmlTableRow()
		tabFilters.Rows.Add(aTR)
		
		'add spacer cell
		aTD = New HtmlTableCell()
		aTD.Width = "1%"
		aTD.InnerHtml = "&nbsp;"
		aTR.Cells.Add(aTD)
		
		aTD = New HtmlTableCell()
		aTD.Width = "40%"
		aKey = cXMLDoc.AttributeToString(aFilterArgEl, "Key")
			
		'extract KeyID and aBool from aKeyIDBool parameter
		aIndex = aKeyIDBool.IndexOf("_")
		KeyID = aKeyIDBool.Substring(0, aIndex)
		aBool = aKeyIDBool.Substring(aIndex + 1)
		
		'Load/Configure NUMBER and FIELD NAME label:
		aBoolLabel = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cLabel']").Attributes("ControlFile").Value), cLabel)

		'set Field Name and add label to table cell
		aPropertyKey = FullPropertyKey(aFilterArgEl)
		aDisplayName = cLib.GetDictionaryKey(mFieldsList, aPropertyKey).ToString
		aBoolLabel.Value = KeyID + ".&nbsp;&nbsp;" + aDisplayName					
		aBoolLabel.ID = aKey
		aTD.Controls.Add(aBoolLabel)
		aTR.Cells.Add(aTD)
					
		'OPERATOR:
		aOperator = cXMLDoc.AttributeToString(aFilterArgEl, "Operator")
		If aOperator = "Like" Then aOperator = "Contains"
		aTD = New HtmlTableCell()
		aTD.Width = "10%"
		aTD.InnerHtml = aOperator
		aTR.Cells.Add(aTD)

		'VALUE:
		dim aValue as String = cXMLDoc.AttributeToString(aFilterArgEl, "Value")
		aTD = New HtmlTableCell()
		aTD.Width = "30%"
		aTD.InnerHtml = aValue
		aTR.Cells.Add(aTD)

		'SHOW COLUMN check boxes:
		aTD = New HtmlTableCell()
		dim aCheckBox as cCheckBox

		aCheckBox = FindControl("chk" + KeyID)
		aCheckBox = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cCheckBox']").Attributes("ControlFile").Value), cCheckBox)
		aCheckBox.ID = "chk" + KeyID
		aTD.Controls.Add(aCheckBox)
		aTR.Cells.Add(aTD)
		'set Show Column check box default to "True"
		aCheckBox.BaseCheckButton.Checked = True

		'set Show Column control
		WriteFilterArgumentNode(aFilterArgEl, aKeyIDBool, "")
		WriteDisplayPropertyNode()
		
	End Sub
	
''--------------------------------------------------------

	Public Sub AddFilterArgumentNode()
		Dim aFiltersNode As XmlNode
		Dim aArgumentEl As XmlElement
		Dim aAttr As XmlAttribute
		Dim aKey As Integer
		dim aBoolAttr as XmlAttribute
		dim aBool as String = ""
		dim aShowColumn as Boolean = True
		dim aKeyIDBool as String
		dim aArgNode as XmlNode
		dim aArgEl as XmlNode
		dim aArgsList as XmlNodeList
		dim aNewKey as Integer = 1
		
		aFiltersNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters")
			
		aArgumentEl = AdHocQueryDefXMLDoc.XMLDocument.CreateElement("Argument")
		aArgsList = aFiltersNode.SelectNodes("Argument")
		For Each aArgEl in aArgsList
			aKey = cXMLDoc.AttributeToInt(aArgEl, "Key", 0)
			If  aKey >= aNewKey Then
				aNewKey = aKey + 1
			End If
		Next
		aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Key")
		aAttr.Value = aNewKey.ToString
		KeyID = aAttr.Value
		
		aKeyIDBool = KeyID + "_"
		aFiltersNode.AppendChild(aArgumentEl)
		'write new Filter argument node
		WriteFilterArgumentNode(aArgumentEl, aKeyIDBool, "")
		'When a Filter is created, we first add "ShowColumn=True" to each DP, which will be used in Adv Filter Options mode
		WriteDisplayPropertyNode()

		'Add key attribute so that individual arguments can be identified for purposes of deletion
	End Sub

''--------------------------------------------------------

	Public Sub SaveFilterArgumentNode()
		Dim aFiltersNode As XmlNode
		Dim aArgumentEl As XmlElement
		dim aKeyID as String
		dim aBool as String
		dim aKeyIDBool as String
		
		WriteDisplayPropertyNode()
		
		'gets Arg node being edited
		aArgumentEl = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters/Argument[@Key='" + Request.QueryString("EditFilterKey") + "']")
		'get values for WriteFilterArgumentNode method below
		aKeyID = cXMLDoc.AttributeToString(aArgumentEl, "Key", "0")
		aBool = cXMLDoc.AttributeToString(aArgumentEl, "Bool", "")
		aKeyIDBool = aKeyID + "_" + aBool
		'write Filter changes
		WriteFilterArgumentNode(aArgumentEl, aKeyIDBool, "")
	End Sub

''--------------------------------------------------------

	Public Sub WriteDisplayPropertyNode()
		dim aDisplayPropertiesNode as XmlNode 
		dim aDisplayPropertiesList as XmlNodeList
		dim aDisplayPropertyNode as XmlNode
		dim aAttr as XmlAttribute
		dim aCheckBox as cCheckBox
		dim aArgsList as XmlNodeList
		dim aArgEl as XmlNode
		dim aRelatedPropertyNode as XmlNode
		dim aRelatedPropertyKey as String
		dim aFullPropertyKey as String
		dim aColumnHeader as String
		dim aShowColumns as New ArrayList()
		dim aNumbers as New ArrayList()
		dim aColumnLabel as New StringBuilder()
		dim aValLabel2 as New StringBuilder()
		dim i as Integer
		dim aIsValid as Boolean = True
		dim aValLabel as New StringBuilder()
		dim aPropertyKey as String
		dim aShowColumn as String
					
		aDisplayPropertiesNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("DisplayProperties")
		aDisplayPropertiesList = aDisplayPropertiesNode.SelectNodes("DisplayProperty")
		aArgsList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument")								
		
		'we are adding/setting ShowColumn attribute values for each DP
		for each aDisplayPropertyNode in aDisplayPropertiesList
			'In Default mode, we are adding ShowColumn attribute and default value of "True" if ShowColumn attribute
			'  does not exist already
			aPropertyKey = aDisplayPropertyNode.Attributes("PropertyKey").Value
			if request.QueryString("AdvFilterKey") = "" then
				if aDisplayPropertyNode.Attributes("ShowColumn") is nothing then
					aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aDisplayPropertyNode, "ShowColumn")
					aAttr.Value = "True"
				else
					aAttr = aDisplayPropertyNode.Attributes("ShowColumn")
						aAttr.Value = "True"
				end if
			else
				'In Adv Filter Options mode, we are adding ShowColumn attribute if it is nothing.  Otherwise, we set
				'  ShowColumn attribute values
				if aDisplayPropertyNode.Attributes("ShowColumn") is nothing then
					aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aDisplayPropertyNode, "ShowColumn")
					aAttr.Value = "True"
				else
					for each aArgEl in aArgsList
						'for each aArgEl (which is not a Group arg node), we are checking to see if an aArgEl belongs
						'  to the Current DP.  If it does, then we change the DP.ShowColumn attribute to "False" or "True" 
						'  based on user selection. 
						if aArgEl.Attributes("Group") is nothing then
							aRelatedPropertyNode = aArgEl.SelectSingleNode("RelatedProperty")
							'if aRelatedPropertyNode exists, we compare DP.PropertyKey to aArgEl.FullPropertyKey, otherwise
							'  we compare DP.PropertyKey to aArgEl.PropertyKey in order to compare the Show Column check boxes
							'  that belong to a particular DP
							if not aRelatedPropertyNode is nothing then								
								aRelatedPropertyKey = aRelatedPropertyNode.Attributes("PropertyKey").Value
								'aArgEl FullProperty
								aFullPropertyKey = aRelatedPropertyKey + "." + aArgEl.Attributes("PropertyKey").Value
								'Show Column check box for current Filter
								aCheckBox = FindControl("chk" + aArgEl.Attributes("Key").Value)
							else
								aCheckBox = FindControl("chk" + aArgEl.Attributes("Key").Value)
								aFullPropertyKey = aArgEl.Attributes("PropertyKey").Value
							end if
							if not aCheckBox is nothing then
								'add Show Column check box value(s) when only one DP exists, so that we can avoid
								'  validation on one DP (Field Name).  See "If" statement below the parent "for" loop.
								if aDisplayPropertiesList.Count = 1 then
									aShowColumns.Add(aCheckBox.BaseCheckButton.Checked)
								else
									'this handles a user going back-and-forth between selecting and de-selecting any
									'  Show Column check box for a particular Field Name.
									if aPropertyKey = aFullPropertyKey AndAlso aCheckBox.BaseCheckButton.Checked = False then
										aDisplayPropertyNode.Attributes("ShowColumn").Value = "False"
									elseif aPropertyKey = aFullPropertyKey AndAlso aDisplayPropertyNode.Attributes("ShowColumn").Value = "False" then
										if aCheckBox.BaseCheckButton.Checked = True
											aDisplayPropertyNode.Attributes("ShowColumn").Value = "True"
										end if
									end if									
								end if
							end if
							'else
							'	'if an aArgEl does not have a RelatedProperty node, then we compare DP.PropertyKey with aArgEl.PropertyKey
							'	'if aPropertyKey = aArgEl.Attributes("PropertyKey").Value AndAlso aShowColumn = "False" then
							'		aCheckBox = FindControl("chk" + aArgEl.Attributes("Key").Value)
							'		aFullPropertyKey = aArgEl.Attributes("PropertyKey").Value
							'		if not aCheckBox is nothing then
							'			'aShowColumn = CType(aCheckBox.BaseCheckButton.Checked, String)
							'			'add Show Column check box value(s) when only one DP exists, so that we can avoid
							'			'  validation on one DP (Field Name).  See "If" statement below the parent "for" loop.
							'			if aDisplayPropertiesList.Count = 1 then
							'				aShowColumns.Add(aCheckBox.BaseCheckButton.Checked)
							'			else
							'				'this handles a user going back-and-forth between selecting and de-selecting any
							'				'  Show Column check box for a particular Field Name.
							'				if aPropertyKey = aFullPropertyKey AndAlso aCheckBox.BaseCheckButton.Checked = False then
							'					aDisplayPropertyNode.Attributes("ShowColumn").Value = "False"
							'				elseif aPropertyKey = aFullPropertyKey AndAlso aDisplayPropertyNode.Attributes("ShowColumn").Value = "False" then
							'					if aCheckBox.BaseCheckButton.Checked = True
							'						aDisplayPropertyNode.Attributes("ShowColumn").Value = "True"
							'					end if
							'				end if									
							'			end if
							'		end if
							'	'end if
							'end if
						end if
					next
				end if
			end if
		next
		
		'since we do not trigger validation when only one field name is used for filters, we need to set ShowColumn attribute value
		'  to "True" in cases where some ShowColumn check boxes are de-selected.
		if aShowColumns.Count > 1 then
			for i=0 to aShowColumns.Count - 1
				if i <> 0 then
					if aShowColumns.Item(i - 1) <> aShowColumns.Item(i) then
						aDisplayPropertiesList.Item(0).Attributes("ShowColumn").Value = "True"
					end if
				end if
			next
		end if
		
	End Sub

''--------------------------------------------------------

	Public Sub WriteFilterArgumentNode(ByRef aArgumentEl As XmlElement, ByVal aKeyIDBool As String, ByVal aGroup As String)
		Dim aAttr As XmlAttribute
		Dim aPropertyKey As String
		Dim aIndex As Integer
		Dim aRelatedPropertyEl As XmlElement
		Dim aRelatedPropertyKey As String
		Dim aHasBoolAttr As Boolean = False
		Dim aHasPKAttr As Boolean = False
		Dim aHasOperatorAttr As Boolean = False
		Dim aHasValueAttr As Boolean = False
		dim aNewAttr as XmlAttribute
		dim aHasShowColumn as Boolean = False
		dim aFiltersNode as XmlNode
		dim aQTGroupFilterKeyAttr as Boolean = False
		dim aGroupArgNode as XmlNode
		dim aGroupArgEl as XmlElement
		dim aBool as String
		dim aKeyID as String
		dim aGroupArgNodeList as XmlNodeList 
		dim aArgsEl as XmlNode
		dim aCount as Integer
		dim aGroupFiltersNodeList as XmlNodeList

		aFiltersNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters")
		
		For Each aAttr In aArgumentEl.Attributes
			Select Case aAttr.Name
				Case "Bool"
					aHasBoolAttr = True
				Case "PropertyKey"
					aHasPKAttr = True
				Case "Operator"
					aHasOperatorAttr = True
				Case "Value"
					aHasValueAttr = True
				Case "QTGroupFilterKey"
					aQTGroupFilterKeyAttr = True
			End Select
		Next
		
		aAttr = aArgumentEl.Attributes("Bool")

		'extract KeyID and Bool from aKeyIDBool parameter
		aIndex = aKeyIDBool.IndexOf("_")
		aKeyID = aKeyIDBool.Substring(0, aIndex)
		aBool = aKeyIDBool.Substring(aIndex + 1)

		'if request.QueryString("AdvFilterKey") = "" then
			
		aPropertyKey = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlLoaderFieldName:ctlFieldName")
			
		if aPropertyKey <> "" then
			
			aIndex = aPropertyKey.LastIndexOf(".")
			
			'we need the second part of this "If" condition, so that when old Filters are written first that a
			'  RelatedProperty element is not created again.  So, since a New Filter argument node will only
			'  contain one attribute when it is added, we use aArgumentEl.Attribute.Count.
			If aIndex <> -1 AndAlso aArgumentEl.Attributes.Count = 1 Then
				aRelatedPropertyKey = aPropertyKey.Substring(0, aIndex)
				aPropertyKey = aPropertyKey.Substring(aIndex + 1)
				aRelatedPropertyEl = AdHocQueryDefXMLDoc.XMLDocument.CreateElement("RelatedProperty")
				aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aRelatedPropertyEl, "PropertyKey")
				aAttr.Value = aRelatedPropertyKey
				aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aRelatedPropertyEl, "Join")
				'aAttr.Value = "None"
				aArgumentEl.AppendChild(aRelatedPropertyEl)
			End If
			
			
			'ADD GROUP "(" argument node
			if request.QueryString("AdvFilterKey") = "" AndAlso aGroup = "(" then
				if aKeyID = cXMLDoc.AttributeToString(aArgumentEl, "Key") then
					'if first argument node, insert Group "(" as first node, otherwise insert before current arg element
					'if aKeyID = 1 then
					'	aFiltersNode.PrependChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(AdHocQueryDefXMLDoc, "(", "") )
					'else
						aFiltersNode.InsertBefore(WebSession.DataObjectFactory.CreateGroupArgumentNode(AdHocQueryDefXMLDoc, "(", ""), aArgumentEl)
					'end if
					if not aQTGroupFilterKeyAttr then
						aGroupArgNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument[@Group='(']")
						if aGroupArgNodeList.Count > 0 then
							for each aGroupArgNode in aGroupArgNodeList
								if aGroupArgNode.Attributes("QTGroupFilterKey") is nothing then
									'if adding a Group arg node before a Filter arg node that contains a Bool attribute value already
									'  we need to use this value for the Bool attribute value in the Group arg node and
									'  remove the Bool attribute value from the Filter arg node
									if aArgumentEl.Attributes("Bool").Value <> "" then
										aGroupArgNode.Attributes("Bool").Value = aArgumentEl.Attributes("Bool").Value
										aArgumentEl.Attributes("Bool").Value = ""
									end if
									'add QTGroupFilterKey attribute to Group arg node
									aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aGroupArgNode, "QTGroupFilterKey")
								end if
							next
						end if
					end if
					'sets QTGroupFilterKey value
					aAttr.Value = aKeyID
				end if
				
			'Remove Open Paren
			elseif aGroup = "RemoveOpenParen"
				'aGroupArgNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument[@Group='(']")
				'if aGroupArgNodeList.Count > 0 then
					aGroupFiltersNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument[@Group='('][@QTGroupFilterKey='" + aKeyID + "']")
					aCount = aGroupFiltersNodeList.Count
					
					aFiltersNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters")
					
					'when there is only 1 Group arg node, we simply remove it.  If there is more than one, we remove the
					'  last one added.
					if aGroupFiltersNodeList.Count < 2 then
						'for each aGroupArgNode in aGroupArgNodeList
							'if aGroupFiltersNodeList(aCount - 1).Attributes("QTGroupFilterKey").Value = aKeyID then
								'if we are removing a Group arg node that contains a Bool attribute value, we first take that value
								'  and add it to the Filter arg node Bool attribute value.  Then, remove the Group arg node.
								if aGroupFiltersNodeList(aCount - 1).Attributes("Bool").Value <> "" then
									aArgumentEl.Attributes("Bool").Value = aGroupFiltersNodeList(aCount - 1).Attributes("Bool").Value
								end if
								aFiltersNode.RemoveChild(aGroupFiltersNodeList(aCount - 1))
								'exit for
							'end if
						'next
					else	
						'if we are removing a Group arg node that contains a Bool attribute value, we first take that value
							'  and add it to the Filter arg node Bool attribute value.  Then, remove the Group arg node.
						if aGroupFiltersNodeList(aCount - 1).Attributes("Bool").Value <> "" then 
							aGroupFiltersNodeList(aCount - 2).Attributes("Bool").Value = aGroupFiltersNodeList(aCount - 1).Attributes("Bool").Value
						end if
						aFiltersNode.RemoveChild(aGroupFiltersNodeList(aCount - 1))
					
					end if
				'end if
			end if
			
			'ADD GROUP ")" argument node
			if aGroup = ")" then
				if aKeyID = cXMLDoc.AttributeToString(aArgumentEl, "Key") then
					'Inserts Group arg node after current Filter arg node
					aFiltersNode.InsertAfter(WebSession.DataObjectFactory.CreateGroupArgumentNode(AdHocQueryDefXMLDoc, ")", ""), aArgumentEl)
					'if QTGroupFilterKey attribute does not exist, we add it and set its value with current Filter arg KeyID
					if not aQTGroupFilterKeyAttr then
						aGroupArgNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument[@Group=')']")
						if aGroupArgNodeList.Count > 0 then
							for each aGroupArgNode in aGroupArgNodeList
								if aGroupArgNode.Attributes("QTGroupFilterKey") is nothing then
									aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aGroupArgNode, "QTGroupFilterKey")
								end if
							next
						end if
					end if
					'sets QTGroupFilterKey value
					aAttr.Value = aKeyID
				end if
				
			'Remove Close Paren
			elseif aGroup = "RemoveCloseParen"
				aGroupArgNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument[@Group=')']")
				if aGroupArgNodeList.Count > 0 then
					for each aGroupArgNode in aGroupArgNodeList
						'if Group Arg Node Key = current Filter arg Key, then we remove the Group arg node
						if aGroupArgNode.Attributes("QTGroupFilterKey").Value = aKeyID then
							aFiltersNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters")
							aFiltersNode.RemoveChild(aGroupArgNode)
							exit For
						end if
					next
				end if
			end if
			
			'FIELD NAME
			'Edit Filter mode
			if request.QueryString("EditFilterKey") <> "" then
				if request.QueryString("EditFilterKey") = aKeyID then
					aPropertyKey = aPropertyKey.Substring(aIndex + 1)
					aAttr = aArgumentEl.Attributes("PropertyKey")
					aAttr.Value = aPropertyKey
				end if
			else
				If aHasPKAttr Then
					aAttr = aArgumentEl.Attributes("PropertyKey")
					aAttr.Value = aAttr.Value
				Else
					aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "PropertyKey")
					aAttr.Value = aPropertyKey
				End If
			end if
			
			'OPERATOR
			'Edit Filter mode
			if request.QueryString("EditFilterKey") <> "" then
				if request.QueryString("EditFilterKey") = aKeyID then
					aAttr = aArgumentEl.Attributes("Operator")
					aAttr.Value = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlOperator")
				end if
			else
				If aHasOperatorAttr Then
					aAttr = aArgumentEl.Attributes("Operator")
					aAttr.Value = aAttr.Value
				Else
					aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Operator")
					aAttr.Value = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlOperator")
				End If
			end if
			
			'VALUE
			'Edit Filter mode
			if request.QueryString("EditFilterKey") <> "" then
				if request.QueryString("EditFilterKey") = aKeyID then
					aAttr = aArgumentEl.Attributes("Value")
					aAttr.Value = Request.Form.Get("mPageFrameCtl:ctlPageContent:txtValue")
				end if
			'Lookup Table Values mode
			elseif request.QueryString("LookupValue") <> "" then
				If aHasValueAttr Then
					aAttr = aArgumentEl.Attributes("Value")
					aAttr.Value = aAttr.Value
				Else
					aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Value")
					aAttr.Value = request.QueryString("LookupValue")
				End If
			else
				If aHasValueAttr Then
					aAttr = aArgumentEl.Attributes("Value")
					aAttr.Value = aAttr.Value
				Else
					aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Value")
					aAttr.Value = Request.Form.Get("mPageFrameCtl:ctlPageContent:txtValue")
				End If
			end if
			
			'BOOL	
			'set Bool attr value but not when first adding a group arg node
			'In Default mode
			if request.QueryString("AdvFilterKey") = "" then
				if aGroup = "" then
					if not aHasBoolAttr Then
						aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Bool")
					else
						aAttr = aArgumentEl.Attributes("Bool")
					end if
					aGroupArgNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters/Argument[@QTGroupFilterKey='" + aArgumentEl.Attributes("Key").Value + "']")
					if not aGroupArgNode is nothing then
						'make sure Group Key = Filter Key before setting Bool attribute value
						if aArgumentEl.Attributes("Key").Value = aGroupArgNode.Attributes("QTGroupFilterKey").Value
							if aGroupArgNode.Attributes("Bool").Value = "" then
								aAttr.Value = aBool
							else
								'make sure aBool <> "" so that "" does not replace "And" or "Or" for Bool attribute value
								if aBool <> "" then
									if aGroupArgNode.Attributes("Bool").Value <> aBool then
										if aAttr.Value = "" then
											aGroupArgNode.Attributes("Bool").Value = aBool
										end if
									end if
								end if
							end if
						end if
					else
						aAttr.Value = aBool
					end if
				end if
			'In Adv Filter Options mode
			else
				'if there is no Bool attribute for Filter arg node, we add it and set the default for bool attribute value, which is "And".
				if not aHasBoolAttr Then
					aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Bool")
					aAttr.Value = "And"
				end if
			end if
		end if
		
		'Adv Filter Options mode	
		'else
			
		'	if not aQTGroupFilterKeyAttr then
			
		'		aPropertyKey = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlLoaderFieldName:ctlFieldName")
		'		if aPropertyKey <> "" then
		'			aIndex = aPropertyKey.LastIndexOf(".")
					
		'			'need this check so that filters already created do not keep adding RelatedProperty nodes
		'			'  when a New filter is added for first time attribute count = 1, when Old filter arg is written count is always > 1
		'			If aIndex <> -1 AndAlso aArgumentEl.Attributes.Count = 1 Then
		'				aRelatedPropertyKey = aPropertyKey.Substring(0, aIndex)
		'				aPropertyKey = aPropertyKey.Substring(aIndex + 1)
		'				aRelatedPropertyEl = AdHocQueryDefXMLDoc.XMLDocument.CreateElement("RelatedProperty")
		'				aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aRelatedPropertyEl, "PropertyKey")
		'				aAttr.Value = aRelatedPropertyKey
		'				aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aRelatedPropertyEl, "Join")
		'				'aAttr.Value = "None"
		'				aArgumentEl.AppendChild(aRelatedPropertyEl)
		'			End If
					
		'			'FIELD NAME
		'			if request.QueryString("EditFilterKey") <> "" then
		'				if request.QueryString("EditFilterKey") = aKeyID then
		'					aPropertyKey = aPropertyKey.Substring(aIndex + 1)
		'					aAttr = aArgumentEl.Attributes("PropertyKey")
		'					aAttr.Value = aPropertyKey
		'				end if
		'			else
		'				If aHasPKAttr Then
		'					aAttr = aArgumentEl.Attributes("PropertyKey")
		'					aAttr.Value = aAttr.Value
		'				Else
		'					aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "PropertyKey")
		'					aAttr.Value = aPropertyKey
		'				End If
		'			end if
					
					
		'			'OPERATOR
		'			if request.QueryString("EditFilterKey") <> "" then
		'				if request.QueryString("EditFilterKey") = aKeyID then
		'					aAttr = aArgumentEl.Attributes("Operator")
		'					aAttr.Value = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlOperator")
		'				end if
		'			else
		'				If aHasOperatorAttr Then
		'					aAttr = aArgumentEl.Attributes("Operator")
		'					aAttr.Value = aAttr.Value
		'				Else
		'					aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Operator")
		'					aAttr.Value = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlOperator")
		'				End If
		'			end if
					
		'			'VALUE
		'			if request.QueryString("EditFilterKey") <> "" then
		'				if request.QueryString("EditFilterKey") = aKeyID then
		'					aAttr = aArgumentEl.Attributes("Value")
		'					aAttr.Value = Request.Form.Get("mPageFrameCtl:ctlPageContent:txtValue")
		'				end if
		'			elseif request.QueryString("LookupValue") <> "" then
		'				If aHasValueAttr Then
		'					aAttr = aArgumentEl.Attributes("Value")
		'					aAttr.Value = aAttr.Value
		'				Else
		'					aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Value")
		'					aAttr.Value = request.QueryString("LookupValue")
		'				End If
		'			else
		'				If aHasValueAttr Then
		'					aAttr = aArgumentEl.Attributes("Value")
		'					aAttr.Value = aAttr.Value
		'				Else
		'					aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Value")
		'					aAttr.Value = Request.Form.Get("mPageFrameCtl:ctlPageContent:txtValue")
		'				End If
		'			end if
			
		'		end if
				
		'		''SHOW COLUMN
		'		''sets show column attributes based on selections made in Adv Filter Options mode
		'		'dim aCheckBox as cCheckBox
		'		'aCheckBox = FindControl("chk" + aKeyID)
		'		'If aHasShowColumn Then
		'		'	aAttr = aArgumentEl.Attributes("ShowColumn")
		'		'Else
		'		'	aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "ShowColumn")
		'		'End If
		'		'if aCheckBox is nothing then
		'		'	aAttr.Value = "True"
		'		'else
		'		'	aAttr.Value = aCheckBox.BaseCheckButton.Checked
		'		'end if
				
		'		'BOOL
		'		'need to default to "And" in Adv Filter Options mode, since user cannot select a Boolean
		'		if not aHasBoolAttr Then
		'			aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aArgumentEl, "Bool")
		'			aAttr.Value = "And"
		'		end if
				
				
		'	end if
		'end if	
		
	End Sub

''--------------------------------------------------------

	Public Sub DeleteFilterArgumentNode(ByVal aKey As String)
		Dim aFiltersNode As XmlNode
		Dim aArgumentNode As XmlNode
		Dim aGroupOpenArgNode as XmlNode
		Dim aGroupCloseArgNode as XmlNode
		dim aGroupArgNode as XmlNode
		dim aGroupArgNodeList as XmlNodeList
		dim aArgNodeList as XmlNodeList
		
		'make sure when deleting a Filter arg node that we also delete the corresponding Group arg nodes.
		aFiltersNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("Filters")
		aArgumentNode = aFiltersNode.SelectSingleNode("Argument[@Key='" + aKey + "']")
		aArgNodeList = aFiltersNode.SelectNodes("Argument")
		for each aGroupArgNode in aArgNodeList
			if not aGroupArgNode.Attributes("QTGroupFilterKey") is nothing AndAlso aGroupArgNode.Attributes("QTGroupFilterKey").Value = aKey then
				aFiltersNode.RemoveChild(aGroupArgNode)
			end if	
		next
		aFiltersNode.RemoveChild(aArgumentNode)
	End Sub

''--------------------------------------------------------

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

''--------------------------------------------------------

	Private Function GetCurrentQueryURL() As String
		Dim aURL As String
		dim aBool as String
		dim myArrayList as New ArrayList()
		dim aArgNodeList as XmlNodeList
		dim aArgEl as XmlNode
		dim aShowColumn as Boolean
		dim aChkKeys as New StringBuilder()
		dim aCheckBox as cCheckBox
		dim aBoolean as Boolean
		
		aURL = Request.Url.PathAndQuery
		'remove following parameters, so they can be re-set when necessary
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "BaseDODKey")
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "QueryID")
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "EditFilterKey")
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "FilterValue")
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "ChkKey")
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "IsValid")
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "Key")
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "FieldName")
		if request.QueryString("LookupValue") <> "" then
			aURL = cWebLib.RemoveQuerystringParameter(aURL, "LookupValue")
		end if
		if request.QueryString("Operator") <> "" then
			aURL = cWebLib.RemoveQuerystringParameter(aURL, "Operator")
		end if
		
		'we send current Field Name selection, so that user's last selection is retained in order to make it more user-friendly.
		dim aCtl as cCoreCtl = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).GetControl("ctlLoaderFieldName")
		dim aFieldsDD as DropDownList = CType(aCtl.FindControl("ctlFieldName"), DropDownList)
		aURL = cWebLib.AddQuerystringParameter(aURL, "FieldName", aFieldsDD.SelectedIndex.ToString())
		
		'In Adv Filter Options mode
		if request.QueryString("AdvFilterKey") <> "" then
			'since we cannot keep any de-selected Show Column check boxes in view state, we get 
			'  the "False" values at last moment possible, store them into a StringBuilder and then send those values
			'  to qs, so that we can set the Show Column check boxes in CoreCtl_SetValues.
			aArgNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("Filters/Argument")
			for each aArgEl in aArgNodeList
				if aArgEl.Attributes("Group") is nothing then
					KeyID = aArgEl.Attributes("Key").Value
					aCheckBox = FindControl("chk" + KeyID)
					if not aCheckBox is nothing then
						aBoolean = aCheckBox.BaseCheckButton.Checked
						if aBoolean = False
							if aChkKeys.Length = 0 then
								aChkKeys = aChkKeys.Append(KeyID)
							else
								aChkKeys = aChkKeys.Append("," + KeyID)
							end if
						end if
					end if
				end if
			next
			aURL = cWebLib.AddQuerystringParameter(aURL, "ChkKey", aChkKeys.ToString())
		end if
		
		aURL = cWebLib.AddQuerystringParameter(aURL, "QueryType", "User", Server)
		aURL = cWebLib.AddQuerystringParameter(aURL, "Display", Request.QueryString("Display"), Server)
		Return aURL
	End Function
	
''--------------------------------------------------------

	Private Sub RedirectToCurrentQuery()

		EventController_NavigateToURL(GetCurrentQueryURL())
	End Sub

''--------------------------------------------------------

	Private Sub RedirectToCurrentQueryWithAnchor(ByVal aAnchorName As String)
		Dim aURL As String

		aURL = GetCurrentQueryURL()
		aURL += "&#" + aAnchorName
	
		EventController_NavigateToURL(aURL)
	End Sub
	
''--------------------------------------------------------

	Private Sub RedirectToEditFilter(aFilterKey As String)
		Dim aURL As String = GetCurrentQueryURL()
		aURL = cWebLib.AddQuerystringParameter(aURL, "EditFilterKey", aFilterKey)
		aURL += "&#Filters"
		EventController_NavigateToURL(aURL)
	End Sub
	
''--------------------------------------------------------

	Private Sub RedirectToAdvFilters()
		Dim aURL As String = GetCurrentQueryURL()
		aURL = cWebLib.AddQuerystringParameter(aURL, "AdvFilterKey", "True")
		aURL += "&#Filters"
		EventController_NavigateToURL(aURL)
	End Sub

'========================================================

		
End Class
End Namespace