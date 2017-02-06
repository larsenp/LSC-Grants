Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base


Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Easygrants_Web.Controls.Base
Imports System.Diagnostics
Imports Core.DataAccess.DBAccess
Imports Core.Util
Imports Core.Web
Imports Core.Web.SvrCtls
Imports EasyGrants.DataAccess.Report
Imports EasyGrants.Web


Namespace Easygrants_Web.Controls.PageSection

Public MustInherit Class cLookupTableViewer
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

'===========================================================

#Region " Web Form Designer Generated Code "

	'This call is required by the Web Form Designer.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

	End Sub

	'NOTE: The following placeholder declaration is required by the Web Form Designer.
	'Do not delete or move it.
	Private designerPlaceholderDeclaration As System.Object

	Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
		'CODEGEN: This method call is required by the Web Form Designer
		'Do not modify it using the code editor.
		InitializeComponent()
	End Sub

#End Region

'===========================================================
	Protected spnFilterLabel As HtmlGenericControl
	Protected ctlFilterDD As cDropDown
	Protected tblFilter As HtmlTable

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		Dim aDataDefinitionNode As XmlNode
		Dim aDataDefinitionKey As String
		Dim aPKNode As XmlNode
		Dim aPKProperty As String
		Dim aXMLDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aControlNode As XmlNode
		Dim aAddArgNode As XmlNode
		Dim aEditArgNode As XmlNode
		Dim aPropKeyNode As XmlNode
		Dim aLkupPropKeysDO As cDataObject

		Dim aTieredPropNode As XmlNode
		Dim aTieredPropDisplayPropKey As String = ""
		Dim aTieredRelationNode As XmlNode
		Dim aTieredChildDefinitionKey As String = ""
		Dim aTieredRelationPropNode As XmlNode
		Dim aTieredchildProperty As String = ""
		Dim aConfigurableHeader As String = ""
		Dim aTableNameNode As XmlNode
		Dim aTableName As String = ""

		Dim aParentTieredPropNode As XmlNode
		Dim aParentTieredRelationNode As XmlNode
		Dim aParentTieredChildDefinitionKey As String = ""
		Dim aParentTieredRelationPropNode As XmlNode
		Dim aParentTieredchildProperty As String = ""
		Dim aParentTieredPropDisplayPropKey As String = ""
		ctlFilterDD = CType(Me.FindControl("ctlFilterDD"), cDropDown)




		If Not Request.QueryString("TableName") Is Nothing Then
			'Get data definition key based on table name
			aDataDefinitionNode = WebAppl.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@RowSource='" + _
						Request.QueryString("TableName") + "']")
			aDataDefinitionKey = cXMLDoc.AttributeToString(aDataDefinitionNode, "Key")
			aPKNode = aDataDefinitionNode.SelectSingleNode("Properties/Property[@IsPrimaryKey='True']")
			aPKProperty = cXMLDoc.AttributeToString(aPKNode, "Key")

			If Request.QueryString("LookupTableTypeID") = 3 Then
				tblFilter.Visible = True

				'*****************************************************************************************************************************************
				'This is the new code for Tiered functionality.
				aTieredPropNode = aDataDefinitionNode.SelectSingleNode("Properties/Property[@Tiered='True']")
				If Not aTieredPropNode Is Nothing Then
					aTieredPropDisplayPropKey = cXMLDoc.AttributeToString(aTieredPropNode, "DisplayPropertyKey")
					aTieredRelationNode = aDataDefinitionNode.SelectSingleNode("Properties/Property[@Tiered='True']/Relationship")
					aTieredChildDefinitionKey = cXMLDoc.AttributeToString(aTieredRelationNode, "ChildDefinitionKey")
					aConfigurableHeader = cXMLDoc.AttributeToString(aTieredPropNode, "ConfigurableHeader")

					aTableNameNode = WebAppl.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@Key='" + _
					aTieredChildDefinitionKey + "']")
					aTableName = cXMLDoc.AttributeToString(aTableNameNode, "RowSource")

					aTieredRelationPropNode = aDataDefinitionNode.SelectSingleNode("Properties/Property[@Tiered='True']/Relationship/RelationshipProperties/RelationshipProperty")
					aTieredchildProperty = cXMLDoc.AttributeToString(aTieredRelationPropNode, "childProperty")

					If aConfigurableHeader <> "" Then
						spnFilterLabel.InnerText = GetLabel(aConfigurableHeader)
					Else
						spnFilterLabel.InnerText = aTableName
					End If

					'Here if a Parent Node has a Parent Tiered Node then from the drop down we need to Update the display value.
					If Not aTableNameNode Is Nothing Then
						aParentTieredPropNode = aTableNameNode.SelectSingleNode("Properties/Property[@Tiered='True']")
						If Not aParentTieredPropNode Is Nothing Then
							aParentTieredRelationNode = aParentTieredPropNode.SelectSingleNode("Relationship")
							aParentTieredChildDefinitionKey = cXMLDoc.AttributeToString(aParentTieredRelationNode, "ChildDefinitionKey")

							aParentTieredRelationPropNode = aParentTieredPropNode.SelectSingleNode("Relationship/RelationshipProperties/RelationshipProperty")
							aParentTieredchildProperty = cXMLDoc.AttributeToString(aParentTieredRelationPropNode, "childProperty")

							aParentTieredPropDisplayPropKey = cXMLDoc.AttributeToString(aParentTieredPropNode, "DisplayPropertyKey")
						End If
					End If


					Dim aDataObjectNodeDefKey As XmlNode = Nothing
					Dim aXmlDocDefKey As cXMLDoc = Nothing
					Dim aFiltersNodeDefKey As XmlNode = Nothing
					Dim aChildDefDO As cDataObject
					aXmlDocDefKey = WebSession.DataObjectFactory.CreateDataObjectNode(aTieredChildDefinitionKey, aDataObjectNodeDefKey, aFiltersNodeDefKey)
					Dim aChildDefDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNodeDefKey)
					Dim aLItem As ListItem = New ListItem("<Select>", "")
					ctlFilterDD.Items.Add(aLItem)
					Dim aDO As cDataObject
					If aChildDefDOList.Count > 0 Then
						For Each aChildDefDO In aChildDefDOList
							Dim aLI As ListItem
							'Here we are getting the Parent's Parent Display Propoerty key Value and then concatinating with the child display Value and show it in the dropdown.
							If aParentTieredChildDefinitionKey <> "" Then
								aDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter(aParentTieredChildDefinitionKey, aParentTieredchildProperty, aChildDefDO.GetPropertyString(aParentTieredchildProperty))(0)
								If Not aDO Is Nothing Then
									Dim aParentDisplayName As String = aDO.GetPropertyString(aParentTieredPropDisplayPropKey)
									aLI = New ListItem(aChildDefDO.GetPropertyString(aTieredPropDisplayPropKey) + " - " + aParentDisplayName, aChildDefDO.GetPropertyString(aTieredchildProperty))
								Else
									aLI = New ListItem(aChildDefDO.GetPropertyString(aTieredPropDisplayPropKey), aChildDefDO.GetPropertyString(aTieredchildProperty))
								End If
							Else
								aLI = New ListItem(aChildDefDO.GetPropertyString(aTieredPropDisplayPropKey), aChildDefDO.GetPropertyString(aTieredchildProperty))
							End If

							ctlFilterDD.Items.Add(aLI)
						Next
					End If
				End If

				If Request.QueryString("FilterID") <> "" Then
					ctlFilterDD.SelectedField = Request.QueryString("FilterID")
				End If
				'*****************************************************************************************************************************************
			End If


			'Get configuration XML for this data presenter
			aXMLDoc = New cXMLDoc()
			aXMLDoc.LoadFromXML(spnConfigXML.InnerText)

			'Update DataObjectDefinitionKey in DataObject node
			aDataObjectNode = aXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='LookupTableList']")
			aDataObjectNode.Attributes("DataObjectDefinitionKey").Value = aDataDefinitionKey

			'Update name of ID property for configuration of Add button and remove "marker" attribute
			aAddArgNode = aDataObjectNode.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='']/Control/Action/Parameters/Argument[@AttributeName='ID']")
			aAddArgNode.Attributes("Value").Value = aPKProperty + "=0"
			'aAddArgNode.Attributes.RemoveNamedItem("AttributeName")

			'Update DataObjectDefinitionKey in Control node for data object list
			aControlNode = aDataObjectNode.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='DataObjectDefinitionKey']/Control")
			aControlNode.Attributes("DataObjectDefinitionKey").Value = aDataDefinitionKey

			'Update name of ID property for configuration of Edit button
			aEditArgNode = aControlNode.SelectSingleNode("DisplayProperty/Control[@ID='ctlEdit']/Action/Parameters/Argument[@Type='DataObject']")
			aEditArgNode.Attributes("TypeKey").Value = aPKProperty
			aEditArgNode.Attributes("AttributeName").Value = aPKProperty
			'aEditArgNode.Attributes("BaseValue").Value = aPKProperty + "="


			If Not aTieredPropNode Is Nothing Then
				Dim actlListNode As XmlNode = aDataObjectNode.SelectSingleNode("DisplayProperties/DisplayProperty/Control[@ID='ctlList']")
				Dim aDynamicDispNode As XmlNode = actlListNode.SelectSingleNode("DisplayProperty[@ID='Dynamic']")
				aDynamicDispNode.Attributes("PropertyKey").Value = aTieredChildDefinitionKey + "." + aTieredPropDisplayPropKey
				'Here if the configurableHeader is not set then we are displaying the Table name.
				If aConfigurableHeader <> "" Then
					aDynamicDispNode.Attributes("ColumnHeader").Value = GetLabel(aConfigurableHeader)
				Else
					aDynamicDispNode.Attributes("ColumnHeader").Value = aTableName
				End If

				Dim aDynamicArgumentNode As XmlNode = actlListNode.SelectSingleNode("DisplayProperty[@ID='Dynamic']/Sortable/Argument")
				aDynamicArgumentNode.Attributes("PropertyKey").Value = aTieredPropDisplayPropKey

				Dim aDynamicRelatedPropertyNode As XmlNode = actlListNode.SelectSingleNode("DisplayProperty[@ID='Dynamic']/Sortable/Argument/RelatedProperty")
				aDynamicRelatedPropertyNode.Attributes("PropertyKey").Value = aTieredChildDefinitionKey

				'Here we are Updating the Filter Element when the QueryString Value for FilterID is not Nothinig
				If Request.QueryString("FilterID") <> "" Then
					Dim aFilterNode As XmlNode = aDataObjectNode.SelectSingleNode("Filters/Argument")
					aFilterNode.Attributes("PropertyKey").Value = aTieredchildProperty
				End If
			Else
				Dim actlListNode As XmlNode = aDataObjectNode.SelectSingleNode("DisplayProperties/DisplayProperty/Control[@ID='ctlList']")

				'Here we are removing the DisplayProperty whose ID is Dynamic
				Dim aDynamicDispNode As XmlNode = actlListNode.SelectSingleNode("DisplayProperty[@ID='Dynamic']")
				If Not aDynamicDispNode Is Nothing Then
					actlListNode.RemoveChild(aDynamicDispNode)
				End If

				'Here we are removing the Filter Element to the Main DataObject
				Dim aFilterNode As XmlNode = aDataObjectNode.SelectSingleNode("Filters")
				If Not aFilterNode Is Nothing Then
					aDataObjectNode.RemoveChild(aFilterNode)
				End If
			End If


			aLkupPropKeysDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LookupTablePropertyKeyMapping", "TableName", aDataDefinitionKey)(0)
			If Not aLkupPropKeysDO Is Nothing Then

				'Update PropertyKey for Description
				aPropKeyNode = aControlNode.SelectSingleNode("DisplayProperty[@ColumnHeader='Description']")
				If Not aPropKeyNode Is Nothing Then
					aPropKeyNode.Attributes("PropertyKey").Value = aLkupPropKeysDO.GetPropertyString("Description")
				End If
				'Update PropertyKey for Description in Sortable Node
				aPropKeyNode = aControlNode.SelectSingleNode("DisplayProperty/Sortable/Argument[@PropertyKey='Description']")
				If Not aPropKeyNode Is Nothing Then
					aPropKeyNode.Attributes("PropertyKey").Value = aLkupPropKeysDO.GetPropertyString("Description")
				End If

				'Update PropertyKey for SortOrder
				aPropKeyNode = aControlNode.SelectSingleNode("DisplayProperty[@ColumnHeader='Sort Order']")
				If Not aPropKeyNode Is Nothing Then
					aPropKeyNode.Attributes("PropertyKey").Value = aLkupPropKeysDO.GetPropertyString("SortOrder")
				End If
				'Update PropertyKey for SortOrder in Sortable Node
				aPropKeyNode = aControlNode.SelectSingleNode("DisplayProperty/Sortable/Argument[@PropertyKey='SortOrder']")
				If Not aPropKeyNode Is Nothing Then
					aPropKeyNode.Attributes("PropertyKey").Value = aLkupPropKeysDO.GetPropertyString("SortOrder")
				End If

				'Update PropertyKey for Abbr
				aPropKeyNode = aControlNode.SelectSingleNode("DisplayProperty[@ColumnHeader='Abbreviation']")
				If Not aPropKeyNode Is Nothing Then
					aPropKeyNode.Attributes("PropertyKey").Value = aLkupPropKeysDO.GetPropertyString("Abbr")
				End If
				'Update PropertyKey for Abbr in Sortable Node
				aPropKeyNode = aControlNode.SelectSingleNode("DisplayProperty/Sortable/Argument[@PropertyKey='Abbr']")
				If Not aPropKeyNode Is Nothing Then
					aPropKeyNode.Attributes("PropertyKey").Value = aLkupPropKeysDO.GetPropertyString("Abbr")
				End If

				'Update PropertyKey for EndDate
				aPropKeyNode = aControlNode.SelectSingleNode("DisplayProperty[@ColumnHeader='Status']")
				If Not aPropKeyNode Is Nothing Then
					aPropKeyNode.Attributes("PropertyKey").Value = aLkupPropKeysDO.GetPropertyString("EndDate")
				End If

				'Update PropertyKey for EndDate in Parameters Node
				aPropKeyNode = aControlNode.SelectSingleNode("DisplayProperty/Parameters/Argument[@Operator='Equal']")
				If Not aPropKeyNode Is Nothing Then
					aPropKeyNode.Attributes("ValueKey").Value = aLkupPropKeysDO.GetPropertyString("EndDate")
				End If

				aPropKeyNode = aControlNode.SelectSingleNode("DisplayProperty/Parameters/Argument[@Operator='GreaterThan']")
				If Not aPropKeyNode Is Nothing Then
					aPropKeyNode.Attributes("ValueKey").Value = aLkupPropKeysDO.GetPropertyString("EndDate")
				End If

				aPropKeyNode = aControlNode.SelectSingleNode("DisplayProperty/Parameters/Argument[@Operator='LessThanEqual']")
				If Not aPropKeyNode Is Nothing Then
					aPropKeyNode.Attributes("ValueKey").Value = aLkupPropKeysDO.GetPropertyString("EndDate")
				End If
				'Update PropertyKey for EndDate in Sortable Node
				aPropKeyNode = aControlNode.SelectSingleNode("DisplayProperty/Sortable/Argument[@PropertyKey='EndDate']")
				If Not aPropKeyNode Is Nothing Then
					aPropKeyNode.Attributes("PropertyKey").Value = aLkupPropKeysDO.GetPropertyString("EndDate")
				End If
			End If

			'Persist changes to spnConfigXML
			spnConfigXML.InnerText = aXMLDoc.DocElement.OuterXml
		End If
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

	' This subprocedure will get the dropdown selectvalue and pass it to the query string
	Public Sub Find()

		Dim aURL As String
		aURL = Request.RawUrl.ToString()

		aURL = cWebLib.AddQuerystringParameter(aURL, "FilterID", ctlFilterDD.SelectedValue)

		Response.Redirect(aURL)
	End Sub

	' This subprocedure will clear the dropdown selectvalue and pass it to the query string
	Public Sub Clear()

		Dim aURL As String
		aURL = Request.RawUrl.ToString()

		aURL = cWebLib.AddQuerystringParameter(aURL, "FilterID", "0")

		Response.Redirect(aURL)
	End Sub
'===========================================================
End Class

End Namespace