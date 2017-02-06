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
Imports Implementation.Modules.Staff.Controls.Page.QueryTool.cSelectCriteria

Namespace Implementation.Modules.Staff.Controls.Page.QueryTool.PageSection
Public MustInherit Class cSelectFieldName
     Inherits Implementation.Modules.Staff.Controls.Page.QueryTool.cPersistQueryInfo

'========================================================

	Private mQueryToolDefinitionXMLDoc As cXMLDoc 'Query Tool Definition XML document
    Private mQueryToolDefinitionNode As XmlNode

	Protected ctlFieldName As DropDownList

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

''========================================================

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
        Dim aCategory As String 'Category selected by user
		Dim aBaseDODKey As String	   'Category selected by user
		Dim aPropertiesNode as XmlNode
		Dim aQueryToolDefFileName as String
		
		MyBase.CoreCtl_Load(aSrc, aEvent)

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
    End Sub

'--------------------------------------------------------

    Public Sub BuildFieldsList(ByVal aCategory As String, ByVal aBasePropertyName As String, ByVal aBaseDisplayName As String, _
								ByVal mFieldsList as Object)
        Dim aPropertyNodeList As XmlNodeList

        aPropertyNodeList = AdHocQueryDefXMLDoc.DocElement.SelectNodes("DisplayProperties/DisplayProperty")
        BuildFieldsListFromNodeList(aPropertyNodeList, "", aCategory, mFieldsList)

    End Sub

'--------------------------------------------------------

    Public Sub BuildFieldsListFromNodeList(ByVal aPropertyNodeList As XmlNodeList, ByVal aBaseProperty As String, ByVal aCategory As String, _
		ByVal mFieldsList as Object)
        Dim aPropertyNode As XmlNode
        Dim aPropertyName As String
        Dim aDisplayName As String
        Dim aPropertyNodeSubList As XmlNodeList
        Dim aSubCategory As String
		Dim aString As String
		
        For Each aPropertyNode In aPropertyNodeList            
            aPropertyName = cXMLDoc.AttributeToString(aPropertyNode, "PropertyKey")
			aDisplayName = cXMLDoc.AttributeToString(aPropertyNode, "ColumnHeader") 
            mFieldsList.Add(aDisplayName, aPropertyName)
        Next
    End Sub

''--------------------------------------------------------

    Public Sub ConfigureFieldDropDown(ByVal mFieldsList As Object)
        Dim aItem As ListItem
        Dim aKey As String

		For Each aKey In mFieldsList.Keys
			aItem = New ListItem(aKey, mFieldsList(aKey))
			ctlFieldName.Items.Add(aItem)
		Next
    End Sub
    
'========================================================
End Class
End Namespace