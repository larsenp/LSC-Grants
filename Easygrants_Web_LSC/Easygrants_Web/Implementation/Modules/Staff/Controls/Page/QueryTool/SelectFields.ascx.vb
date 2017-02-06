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

Namespace Implementation.Modules.Staff.Controls.Page.QueryTool

Public Class cSelectFields
    Inherits Implementation.Modules.Staff.Controls.Page.QueryTool.cPersistQueryInfo
    
'========================================================

    Private mDODefinitions As Hashtable 'List of data object definitions included in field list, used to avoid duplicate entries and thus infinite loops in building fields list
    Private mAdHocQueryConfigXMLDoc As cXMLDoc 'Ad Hoc Query Configuration XML document
    Private mQueryToolDefinitionXMLDoc As cXMLDoc 'Query Tool Definition XML document
    Private mQueryToolDefinitionNode As XmlNode
	Private mJoinedDataObjects As Hashtable
	
	Protected spnCategorySelected As HtmlGenericControl
    Protected ctlSelect As cDoubleListBox
    Protected ctlSort As cDoubleListBox
	Protected btnContinue As cCSSButton
    Protected spnSelect As HtmlGenericControl
    Protected spnOpen As HtmlGenericControl
	Protected ctlViewResults As cNewWindowOpener
    Protected valReqSelect As RequiredFieldValidator
 
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

		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		'find DoubleListBox and set Size attr
		ctlSelect = CType(me.FindControl("ctlSelect"), cDoubleListBox)
		ctlSelect.Size = 10
		
        Select Case Request.QueryString("Display").Substring(0,1) 'Hack. If an anchor reference is included at the end of the URL, .NET includes that anchor in the QueryString collection, so Request.QueryString("Display") might return "0#Filters". PL 4/28/05
            Case "0"
                spnSelect.Visible = True
            Case "1"
                spnSelect.Visible = True
            Case "2"
            Case "3"
            Case "4"
        End Select

        mFieldsList = New SortedList()
        mDODefinitions = New Hashtable()
 
        'use node in EGConfig
        'if node is not there, use what was there as default

		aPropertiesNode = WebAppl.ConfigDoc.FindNode(WebAppl.ConfigDoc.DocElement, "Appl/Properties", _
								"Key", "Dev")
        aQueryToolDefFileName = cXMLDoc.AttributeToString(aPropertiesNode, "DataDefinition", _
									"EasyGrants\Modules\Staff\Controls\Page\Reports\AdHocQueryDefinition.xml")                
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
                    'mQueryToolDefinitionNode = mQueryToolDefinitionXMLDoc.DocElement.SelectSingleNode("Category[@Key='" + aCategory + "']")
                    If Not IsPostBack Then
                        aBaseDODKey = cXMLDoc.AttributeToString(mQueryToolDefinitionNode, "Key")
                        'Clear out the query object in memory if there is one
                        SavedQueryDO = Nothing
                        'Instantiate new query object and set its BaseDODKey property
                        SavedQueryDO.BaseDODKey = aBaseDODKey
                        SavedQueryDO.Category = aCategory
                    End If
                End If
            Case "User"
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

		
        
        
        spnCategorySelected.InnerHtml = aCategory
        BuildFieldsList(aCategory, "", "")
        
        PopulateSelectDoubleListBox()        
    End Sub

'--------------------------------------------------------

    Public Sub BuildFieldsList(ByVal aCategory As String, ByVal aBasePropertyName As String, ByVal aBaseDisplayName As String)
        Dim aPropertyNodeList As XmlNodeList

        aPropertyNodeList = mQueryToolDefinitionNode.SelectNodes("Properties/Property/QueryTool[@Key='" + aCategory + "']")
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
            dim aNode as XmlNode = aPropertyNode.SelectSingleNode("Relationship")
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
                mFieldsList.Add(aDisplayName, aPropertyName)
				Debug.Flush()
				aString = ""
				aString = aString.Concat(aString, aCategory, ",")
				aString = aString.Concat(aString, aBaseProperty, ",")
				aString = aString.Concat(aString, aDisplayName, ",")
				aString = aString.Concat(aString, aPropertyName, ",")
				Debug.WriteLine(aString)
            End If
        Next
    End Sub

'--------------------------------------------------------

	Public Sub PopulateSelectDoubleListBox()
		Dim aDisplayPropertiesNodeList As XmlNodeList
		Dim aDisplayPropertyEl As XmlElement
		Dim aItem As ListItem
		Dim aList As SortedList
		Dim aObj As Object
		Dim i As Integer

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

	End Sub

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
			
		aDisplayPropertiesNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("DisplayProperties")
		aDisplayPropertiesList = aDisplayPropertiesNode.SelectNodes("DisplayProperty")
		For Each aDisplayPropertyEl In aDisplayPropertiesList
			aDisplayPropertiesNode.RemoveChild(aDisplayPropertyEl)
		Next

		aSelectedItems = ctlSelect.SelectedValueList.Split(",")
			
		For Each aItemValue In aSelectedItems
			aDisplayPropertyEl = AdHocQueryDefXMLDoc.XMLDocument.CreateElement("DisplayProperty")
			aPropertyKey = aItemValue
			aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aDisplayPropertyEl, "PropertyKey")
			aAttr.Value = aPropertyKey
			aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aDisplayPropertyEl, "ColumnHeader")
			aAttr.Value = cLib.GetDictionaryKey(mFieldsList, aPropertyKey)
			aAttr = AdHocQueryDefXMLDoc.AddAttribute_ToNode(aDisplayPropertyEl, "Join")
			aDisplayPropertiesNode.AppendChild(aDisplayPropertyEl)
		Next

	End Sub

'--------------------------------------------------------	
	
	Public Overrides Sub PersistQueryInfo(ByVal aPageKey as String)
		
		WriteDisplayPropertiesNode()
		if request.QueryString("SavedQueryID") <> "" then
			'if saved query, we need to make comparison between XML in session and XML in data base.
			'  This code is needed in regards to "Return" button in header so that a pop up will *not* be called
			'  asking user if they want to save their changes when in fact no changes have been made.
			Dim aSavedQueryDO as cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SavedQuery", Request.QueryString("SavedQueryID"))
			If AdHocQueryDefXMLDoc.DocElement.OuterXml <> aSavedQueryDO.GetPropertyString("DataObjectXML") then	
				SavedQueryDO.UpdateXML()
				SavedQueryDO("DataObjectXML") = AdHocQueryDefXMLDoc.DocElement.OuterXml
				SavedQueryDO("UserID") = CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).UserID
			End If
		else
			SavedQueryDO.UpdateXML()
			SavedQueryDO("DataObjectXML") = AdHocQueryDefXMLDoc.DocElement.OuterXml
			SavedQueryDO("UserID") = CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).UserID
		end if
		
		'if user selects no "Available" fields, then an empty PropertyKey.Value is added to SavedQueryDO.DataObjectXML,
		'  so we need to do a check for this scenario and remove the DisplayProperty if this is the case.
		'  if we do not remove the empty PropertyKey.Value, then an empty row will appear in "Selected (right)"
		'  box of DoubleListBox control.  The blank row will not appear with other selected items already selected,
		'  so just checking for first DisplayProperty node, kda 7/18/06.
		If not SavedQueryDO("DataObjectXML") is nothing
			Dim aDisplayPropertiesNode as XmlNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("DisplayProperties")
			If not aDisplayPropertiesNode is nothing then
				dim aDisplayPropertyNode as XmlNode = aDisplayPropertiesNode.SelectSingleNode("DisplayProperty")
				if not aDisplayPropertyNode is nothing then
					if aDisplayPropertyNode.Attributes("PropertyKey").Value = "" then
						aDisplayPropertiesNode.RemoveAll()
					end if
				end if
			End If
		End If
		
        valReqSelect.Validate()
        If Not (valReqSelect.IsValid) Then Exit Sub
		
        EventController_NavigateToModulePageKey(aPageKey, "QueryType=" + Request.QueryString("QueryType"), _
			"Category=" + Request.QueryString("Category"), "Display=" + Request.QueryString("Display").Substring(0,1), _
			"ReturnURL=" + request.Url.PathAndQuery)
			
	End Sub

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
	
'=============================================================


	
End Class
End Namespace