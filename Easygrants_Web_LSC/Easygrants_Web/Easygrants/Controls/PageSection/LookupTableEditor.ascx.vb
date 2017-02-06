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

Public MustInherit Class cLookupTableEditor
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

	Protected chkStatus As CheckBox
	Protected aPKProperty As String
	Private mLookupDO As cDataObject
	'Private mStatusCheckedOnLoad As Boolean

	Dim aTieredRelationPropNode As XmlNode
	Dim aTieredparentProperty As String
	Protected spnFilterLabel As HtmlGenericControl
	Protected ctlFilterDD As cDropDown
	Protected tblFilter As HtmlTable
	Protected spnEditFilterDD As HtmlGenericControl
	Dim aEditName As String = ""
'===========================================================	

	Public ReadOnly Property LookupDO() As cDataObject
		Get
			If mLookupDO Is Nothing Then
				Dim aLookupDOList As cDataObjectList = DataObjectCollection("LookupTable")
				If aLookupDOList.Count > 0 Then
					mLookupDO = aLookupDOList(0)
				End If
			End If
			Return mLookupDO
		End Get
	End Property

'===========================================================	

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		Dim aDataDefinitionNode As XmlNode
		Dim aDataDefinitionKey As String
		Dim aPKNode As XmlNode
		Dim aXMLDoc As cXMLDoc
		Dim aDataObjectNodeList As XmlNodeList
		Dim aDataObjectNode As XmlNode
		Dim aFilterArgNode As XmlNode
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
				aTieredRelationPropNode = aDataDefinitionNode.SelectSingleNode("Properties/Property[@Tiered='True']/Relationship/RelationshipProperties/RelationshipProperty")
				aTieredparentProperty = cXMLDoc.AttributeToString(aTieredRelationPropNode, "parentProperty")

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

					'The below if case will be executed when the user tries to add a new record and else part will be created when the user clicks on the edit
					If Request.QueryString("OperationType") = "Add" Then
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

						If Request.QueryString("FilterID") <> "" Then
							ctlFilterDD.SelectedField = Request.QueryString("FilterID")
						End If
					ElseIf Request.QueryString("OperationType") = "Edit" Then
						'This elseif mainly to get the FilterDropdown name and Place it in a Label

						Dim aCurrentTableDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey(aDataDefinitionKey, Request.QueryString("ID"))(0)
						Dim aChildDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey(aTieredChildDefinitionKey, aCurrentTableDO.GetPropertyString(aTieredchildProperty))(0)
						If Not aChildDO Is Nothing Then
							aEditName = aChildDO.GetPropertyString(aTieredPropDisplayPropKey)
							If aParentTieredChildDefinitionKey <> "" Then
								aDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter(aParentTieredChildDefinitionKey, aParentTieredchildProperty, aChildDO.GetPropertyString(aParentTieredchildProperty))(0)
								If Not aDO Is Nothing Then
									Dim aParentDisplayName As String = aDO.GetPropertyString(aParentTieredPropDisplayPropKey)
									aEditName = aChildDO.GetPropertyString(aTieredPropDisplayPropKey) + " - " + aParentDisplayName
								End If
							End If
						End If

						spnEditFilterDD.InnerText = aEditName
						ctlFilterDD.Visible = False
						spnEditFilterDD.Visible = True

					End If
				End If
			End If

			'Get configuration XML for this data presenter
			aXMLDoc = New cXMLDoc()
			aXMLDoc.LoadFromXML(spnConfigXML.InnerText)


			aDataObjectNodeList = aXMLDoc.DocElement.SelectNodes("DataObject[@DataObjectDefinitionKey='set_in_code']")
			For Each aDataObjectNode In aDataObjectNodeList
				'Update DataObjectDefinitionKey in DataObject nodes
				aDataObjectNode.Attributes("DataObjectDefinitionKey").Value = aDataDefinitionKey

				'Update Filter argument for DataObject node
				aFilterArgNode = aDataObjectNode.SelectSingleNode("Filters/Argument[@PropertyKey='set_in_code']")
				aFilterArgNode.Attributes("PropertyKey").Value = aPKProperty

				aLkupPropKeysDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LookupTablePropertyKeyMapping", "TableName", aDataDefinitionKey)(0)
				If Not aLkupPropKeysDO Is Nothing Then
					'Update Abbr Property Key
					aPropKeyNode = aDataObjectNode.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='Abbr']")
					If Not aPropKeyNode Is Nothing Then
						aPropKeyNode.Attributes("PropertyKey").Value = aLkupPropKeysDO.GetPropertyString("Abbr")
					End If
					'Update Description Property Key
					aPropKeyNode = aDataObjectNode.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='Description']")
					If Not aPropKeyNode Is Nothing Then
						aPropKeyNode.Attributes("PropertyKey").Value = aLkupPropKeysDO.GetPropertyString("Description")
					End If
					'Update SortOrder Property Key
					aPropKeyNode = aDataObjectNode.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='SortOrder']")
					If Not aPropKeyNode Is Nothing Then
						aPropKeyNode.Attributes("PropertyKey").Value = aLkupPropKeysDO.GetPropertyString("SortOrder")
					End If
				End If
			Next

			'Persist changes to spnConfigXML
			spnConfigXML.InnerText = aXMLDoc.DocElement.OuterXml
		End If
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

'-----------------------------------------------------------	

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		If Not LookupDO Is Nothing Then
			If LookupDO.GetPropertyValue("EndDate") Is System.DBNull.Value Then
				chkStatus.Checked = True
			ElseIf LookupDO.GetPropertyValue("EndDate") > System.DateTime.Today Then
				chkStatus.Checked = True
			Else
				chkStatus.Checked = False
			End If
		End If
	End Sub

'-----------------------------------------------------------	

	'Public Overloads Overrides Function EventController_Save() As Boolean
	'	Dim aReturnValue As Boolean
	'	aReturnValue = MyBase.EventController_Save()
	'	'If Page.IsValid Then
	'		If chkStatus.Checked Then
	'			If Not LookupDO("EndDate") Is System.DBNull.Value Then
	'				If LookupDO("EndDate") <= System.DateTime.Today Then
	'					LookupDO("EndDate") = System.DBNull.Value
	'					'LookupDO.SaveData()
	'				End If
	'			End If
	'		Else
	'			If LookupDO("EndDate") Is System.DBNull.Value Then
	'				LookupDO("EndDate") = System.DateTime.Today
	'				LookupDO.SaveData()
	'			ElseIf LookupDO("EndDate") > System.DateTime.Today Then
	'				LookupDO("EndDate") = System.DateTime.Today
	'				'LookupDO.SaveData()
	'			End If
	'		End If

	'		If Not LookupDO Is Nothing Then
	'			If Not aTieredparentProperty Is Nothing AndAlso ctlFilterDD.SelectedValue <> "" Then
	'				LookupDO(aTieredparentProperty) = ctlFilterDD.SelectedValue
	'				'LookupDO.SaveData()
	'			End If
	'		End If
	'		LookupDO.SaveData()
	'		'Return MyBase.EventController_Save()
	'	'End If

	'End Function

	Public Overrides Sub DataPresenter_SaveDataObject(ByVal aDataObjectElement As XmlElement)

		Dim aDataObjKey As String
		Dim aDataObjList As cDataObjectList
		Dim aDataObj As cDataObject
		aDataObjKey = cXMLDoc.AttributeToString(aDataObjectElement, "Key")
		If aDataObjKey = "LookupTable" Then
			aDataObjList = mDataObjHash(aDataObjKey)
			If aDataObjList.Count = 0 Then
				aDataObjList = DataPresenter_Get_DataObjectList(aDataObjectElement)
			End If
			DataPresenter_SetDataObjectValuesFromCtls(aDataObjList, aDataObjectElement)
			aDataObjList.UserID = GetUserID()


			If chkStatus.Checked Then
				If Not aDataObjList(0)("EndDate") Is System.DBNull.Value Then
					If aDataObjList(0)("EndDate") <= System.DateTime.Today Then
						aDataObjList(0)("EndDate") = System.DBNull.Value
					End If
				End If
			Else
				If aDataObjList(0)("EndDate") Is System.DBNull.Value Then
					aDataObjList(0)("EndDate") = System.DateTime.Today
				ElseIf aDataObjList(0)("EndDate") > System.DateTime.Today Then
					aDataObjList(0)("EndDate") = System.DateTime.Today
				End If
			End If

			If Not aDataObjList(0) Is Nothing Then
				If Not aTieredparentProperty Is Nothing AndAlso ctlFilterDD.SelectedValue <> "" Then
					aDataObjList(0)(aTieredparentProperty) = ctlFilterDD.SelectedValue
				End If
			End If
			WebSession.DataObjectFactory.SaveDataObject(aDataObjList)
		End If
	End Sub

	Public Sub DataPresenter_Save_And_Reload()

		Dim aPKPropertyValue As String = LookupDO(aPKProperty)
		Dim aFilterKeyValue As String
		If Request.QueryString("FilterID") = "0" Then
			aFilterKeyValue = "FilterID=" + ctlFilterDD.SelectedValue
		Else
			aFilterKeyValue = "FilterID=" + Request.QueryString("FilterID")
		End If
		MyBase.DataPresenter_Reload_After_Save("ID=" + aPKPropertyValue, aFilterKeyValue)

	End Sub

	Public Sub ValFilter(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		If ctlFilterDD.Visible Then
			If ctlFilterDD.SelectedValue = "" Then
				aArgs.IsValid = False
			Else
				aArgs.IsValid = True
			End If
		End If
	End Sub
'===========================================================	
End Class
End Namespace