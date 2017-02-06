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

Namespace Easygrants_Web.Controls.Base

Public MustInherit Class cQTFieldList
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

    Protected mTestText As String = "Test Text"
    Protected ctlLoader As cUserCtlLoader

    Protected spnCategory As HtmlGenericControl
    Protected spnOutput As HtmlGenericControl
    Protected ctlSelect As cDoubleListBox
    Protected ctlSort As cDoubleListBox
    Protected ctlBoolean As DropDownList
    Protected ctlField As DropDownList
    Protected ctlOperator As DropDownList
    Protected txtValue As TextBox
	Protected btnAddFilter As cCSSButton
	'Protected btnCancel As cCSSButton
    Protected tabFilters As HtmlTable
	Protected btnSave As cCSSButton
    Protected spnSelect As HtmlGenericControl
    Protected spnSort As HtmlGenericControl
    Protected spnFilters As HtmlGenericControl
    Protected spnSave As HtmlGenericControl
    Protected spnOpen As HtmlGenericControl
    Protected txtQueryName As TextBox
    Protected txtQueryDescription As TextBox
    Protected ctlViewResults As cNewWindowOpener
    Protected ctlViewExcel As cNewWindowOpener
    Protected valReqSelect As RequiredFieldValidator
    Protected valReqQueryName As RequiredFieldValidator
    Protected valReqValue As RequiredFieldValidator
    Protected valCusDistinctSort As CustomValidator

    Protected ctlFields As cTextArea
    Protected ctlBaseType As cDropDown
    Protected tblFields As HtmlTable

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

    Public Sub ShowFields(ByVal aBaseType As String)
        Dim aCategory As String 'Category selected by user
        Dim aBaseDODKey As String 'Category selected by user
        Dim aPropertiesNode As XmlNode
        Dim aQueryToolDefFileName As String

        ctlFields.Value = ""
        tblFields.Visible = True
        'MyBase.CoreCtl_Load(aSrc, aEvent)

        'btnCancel.Set_ServerClick(AddressOf btnCancel_Click)

        mFieldsList = New SortedList()
        mDODefinitions = New Hashtable()

        'use node in EGConfig
        'if node is not there, use what was there as default

        aPropertiesNode = WebAppl.ConfigDoc.FindNode(WebAppl.ConfigDoc.DocElement, "Appl/Properties", _
                                "Key", "Dev")
        'aQueryToolDefFileName = cXMLDoc.AttributeToString(aPropertiesNode, "DataDefinition", _
        '                            "EasyGrants\Modules\Staff\Controls\Page\Reports\AdHocQueryDefinition.xml")
         'aQueryToolDefFileName = cXMLDoc.AttributeToString(aPropertiesNode, "QueryToolDefinition", _
                                    '"EasyGrants\Modules\Staff\Controls\Page\Reports\AdHocQueryDefinition.xml") 
        'aQueryToolDefFileName = aQueryToolDefFileName.Substring(aQueryToolDefFileName.LastIndexOf("/Easy"))
        'TEMPORARY HACK BY KEITH TO ADDRESS THE MISMATCHED PROJECT/IMPLEMENTATION LAYER NAMING - 3/3/2005
        'mQueryToolDefinitionXMLDoc = New cXMLDoc(WebAppl.Build_RootFileSystemPath(aQueryToolDefFileName))		
		mQueryToolDefinitionXMLDoc = WebAppl.DataDefinitionDoc 'New cXMLDoc(WebAppl.Build_RootFileSystemPath("/Implementation/DataDefinition.config"))
        'END TEMPORARY HACK.
                aCategory = aBaseType.ToString()
                'aCategory = Request.QueryString("Category")
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

        'spnCategory.InnerHtml = aCategory
        BuildFieldsList(aCategory, "", "")
    End Sub
'========================================================

    Public Sub BuildTable(ByVal aCategory As String, ByVal aDisplayName As String, ByVal aPropertyName As String, ByVal aPropertyDesc As String)

        Dim aTR As HtmlTableRow
        Dim aTD As HtmlTableCell

        aTR = New HtmlTableRow()
        tblFields.Rows.Add(aTR)

        aTD = New HtmlTableCell()
        aTD.InnerHtml = aDisplayName
        aTR.Cells.Add(aTD)

        aTD = New HtmlTableCell()
        aTD.InnerHtml = aPropertyDesc
        aTR.Cells.Add(aTD)

        aTD = New HtmlTableCell()
        aTD.InnerHtml = aPropertyName
        aTR.Cells.Add(aTD)

        'aTD = New HtmlTableCell()
        'aTD.InnerHtml = aCategory
        'aTR.Cells.Add(aTD)

    End Sub

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
        Dim aCategory As String 'Category selected by user
        Dim aBaseDODKey As String 'Category selected by user
        Dim aPropertiesNode As XmlNode
        Dim aQueryToolDefFileName As String

        MyBase.CoreCtl_Load(aSrc, aEvent)

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
        Dim aPropertyDesc As String
        Dim aPropertyNodeSubList As XmlNodeList
        Dim aSubCategory As String
        Dim aQueryNode As XmlNode
        Dim aBaseNode As XmlNode

        For Each aPropertyNode In aPropertyNodeList
            aPropertyNode = aPropertyNode.ParentNode
            aPropertyName = aBaseProperty + cXMLDoc.AttributeToString(aPropertyNode, "Key")
            'aPropertyNodeSubList = aPropertyNode.SelectNodes("Property")
            Dim aNode As XmlNode = aPropertyNode.SelectSingleNode("Relationship")
            'If aPropertyNodeSubList.Count > 0 Then

            If Not aNode Is Nothing Then
                If aPropertyName.IndexOf(".") = -1 Then
                    aSubCategory = cXMLDoc.AttributeToString(aNode.ParentNode.SelectSingleNode("QueryTool[@Key='" + aCategory + "']"), "ChildKey")
                Else
                    aSubCategory = cXMLDoc.AttributeToString(aNode.ParentNode.SelectSingleNode("QueryTool[@ParentKey='" + aCategory + "']"), "ChildKey")
                End If

                Dim aDataObjNode As XmlNode = aPropertyNode.ParentNode.ParentNode.ParentNode.SelectSingleNode("Definition[@Key='" _
                    + cXMLDoc.AttributeToString(aNode, "ChildDefinitionKey") + "']")
                aPropertyNodeSubList = aDataObjNode.SelectNodes("Properties/Property/QueryTool[@ParentKey='" + aSubCategory + "']")
                BuildFieldsListFromNodeList(aPropertyNodeSubList, aPropertyName + ".", aSubCategory)
            Else
                If aPropertyName.IndexOf(".") = -1 Then
                    aDisplayName = cXMLDoc.AttributeToString(aPropertyNode.SelectSingleNode("QueryTool[@Key='" + aCategory + "']"), "DisplayName")
                    aPropertyDesc = cXMLDoc.AttributeToString(aPropertyNode.SelectSingleNode("QueryTool[@Key='" + aCategory + "']"), "Description")
                Else
                    aDisplayName = cXMLDoc.AttributeToString(aPropertyNode.SelectSingleNode("QueryTool[@ParentKey='" + aCategory + "']"), "DisplayName")
                    aPropertyDesc = cXMLDoc.AttributeToString(aPropertyNode.SelectSingleNode("QueryTool[@ParentKey='" + aCategory + "']"), "Description")
                End If
                'aDisplayName = cXMLDoc.AttributeToString(aPropertyNode, "DisplayName")
                mFieldsList.Add(aDisplayName, aPropertyName)

                If aPropertyDesc = "" Then
                    aPropertyDesc = aDisplayName
                End If

                BuildTable(aCategory, aDisplayName, aPropertyName, aPropertyDesc)

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

End Class
End Namespace