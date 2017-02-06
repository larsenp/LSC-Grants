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
Public MustInherit Class cLookupTable
     Inherits Implementation.Modules.Staff.Controls.Page.QueryTool.cPersistQueryInfo

'========================================================

	Protected mDODefinitions As Hashtable 'List of data object definitions included in field list, used to avoid duplicate entries and thus infinite loops in building fields list
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
	Protected btnSelect As cCSSButton
	Protected spRefreshParentPage as HtmlGenericControl
	Protected lblFieldName as Label
	Protected tblCloseWindow As HtmlTable
    Protected spnCloseControl As HtmlGenericControl
    Protected spnCancel as HtmlGenericControl
    Protected spnClose as HtmlGenericControl
    Protected spnLookup as HtmlGenericControl
    Protected spnNoLookup as HtmlGenericControl

	Private mKeyID as String = "0"
	Private mLookUpValue as String = ""
	Private mOperatorValue as String = ""
	
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
    
'--------------------------------------------------------
    
      Public Property LookupValue() As String
		Get
			Return mLookUpValue
		End Get
		Set(ByVal Value As String)
			mLookUpValue = Value
		End Set
    End Property
    
 '--------------------------------------------------------
   
    Public Property OperatorValue() As String
		Get
			if request.QueryString("Operator") <> "" then
				mOperatorValue = request.QueryString("Operator")
			else
				mOperatorValue = ""
			end if
			Return mOperatorValue
		End Get
		Set(ByVal Value As String)
			mOperatorValue = Value
		End Set
    End Property

''========================================================

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
     
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		dim aIndex as Integer
		dim aPropertyKey as String
		dim aRelatedPropertyKey as String
		dim aDataObjectKey as String
		dim aRowSource as String
		dim aIDGenDOList as cDataObjectList
		dim aPropertyNode as XmlNode
		dim aFiltersNode as XmlNode
		dim aRelatedIndex as Integer
		Dim aValue As String
		Dim aDataObjectNode As XmlNode
		Dim aXmlDoc As cXMLDoc
		Dim aDataObjectList As cDataObjectList
		Dim aDataObject as cDataObject
		dim aPrimaryPropertyNode as XmlNode
		dim aSortNode as XmlNode
		dim aPrimaryKey as String
		Dim aLI As ListItem
		
		mQueryToolDefinitionXMLDoc = New cXMLDoc(WebAppl.Build_RootFileSystemPath("/Implementation/DataDefinition.config"))
		mLookupList = New SortedList()
		btnSelect.Set_ServerClick(AddressOf btnSelect_Click)
		
		if CType(me.Session("PropertyKey"), String) <> "" then
			aPropertyKey = me.Session("PropertyKey")
			'kill session
			Session.Remove("PropertyKey")
			aIndex = aPropertyKey.LastIndexOf(".")
			If aIndex <> -1 Then
				aRelatedPropertyKey = aPropertyKey.Substring(0, aIndex)
				aRelatedIndex = aRelatedPropertyKey.LastIndexOf(".")
				if aRelatedIndex <> -1 then
					aDataObjectKey = aRelatedPropertyKey.Substring(aRelatedIndex + 1) 
					'find DD.RowSource and check IDGen table
					mDataObjectNode = mQueryToolDefinitionXMLDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + aDataObjectKey + "']")
					aRowSource = mDataObjectNode.Attributes("RowSource").Value
					'check to see if aDataObjectKey is a lookup table, otherwise call "No Lookup Table" window
					aIDGenDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("IDGen", "TableName", aRowSource, "IsCodeTable", "True")
					if aIDGenDOList.Count > 0 then
						'show Lookup/hide NoLookup 
						spnLookup.Visible = True
						spnCancel.Visible = True
						spnNoLookup.Visible = False
						spnClose.Visible = False
						
						'get Lookup Table sorted list
						aRelatedPropertyKey = aPropertyKey.Substring(aRelatedPropertyKey.Length + 1)
						aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode(aDataObjectKey, aDataObjectNode, aFiltersNode)
						aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
						aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", aRelatedPropertyKey, ""))
						aDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
						
						aPropertyNode = mDataObjectNode.SelectSingleNode("Properties/Property[@Key='" + aRelatedPropertyKey + "']")
						aPrimaryPropertyNode = mDataObjectNode.SelectSingleNode("Properties/Property[@IsPrimaryKey='True']")
						aPrimaryKey = cXMLDoc.AttributeToString(aPrimaryPropertyNode, "Key", "")
						aPropertyNode = AdHocQueryDefXMLDoc.DocElement.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='" + aPropertyKey + "']")
						aValue = cXMLDoc.AttributeToString(aPropertyNode, "ColumnHeader")
				
						'display Field Name label
						lblFieldName = CType(me.FindControl("lblFieldName"), Label)
						lblFieldName.Text = aValue
						
						'configure Lookup drop down
						ctlLookupValues = CType(me.FindControl("ctlLookupValues"), DropDownList)
						for each aDataObject in aDataObjectList
							aLI = New ListItem()
							aLI.Value = aDataObject.GetPropertyString(aPrimaryKey, "")
							aLI.Text = aDataObject.GetPropertyString(aRelatedPropertyKey)
							ctlLookupValues.Items.Add(aLI)
						next
					'pop up "No Lookup Table" window
					else
						spnLookup.Visible = False
						spnNoLookup.Visible = True
						spnClose.Visible = True
						spnCancel.Visible = False
					end if
				'pop up "No Lookup Table" window
				else
					spnLookup.Visible = False
					spnNoLookup.Visible = True
					spnClose.Visible = True
					spnCancel.Visible = False
				end if
			else
				'pop up "No Lookup Table" window
				spnLookUp.Visible = False
				spnNoLookup.Visible = True
				spnClose.Visible = True
				spnCancel.Visible = False
			End If
		end if

	End Sub

'-------------------------------------------------------------

	Public Sub btnSelect_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		LookupValue = ctlLookupValues.SelectedItem.Text
		spRefreshParentPage.Visible = True
	End Sub
	
'-------------------------------------------------------------	
	
	Public Sub CloseWindow()
        tblCloseWindow.Visible = True
        spnCloseControl.Visible = True
    End Sub

'=============================================================

End Class

End Namespace
