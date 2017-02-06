Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports System.Text.RegularExpressions
Imports Core_Web.Controls.Base
Imports System.Xml

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.TaskBuilder
Public MustInherit Class cTaskFormEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
	Protected ctlNavigationName As cTextBox
	Protected ctlSortOrder As cTextBox
	Protected ctlForm As cDropDown
	Protected ctlDescription As cLabel
	Protected TrSubmissionValidation As HtmlTableRow

	Public ReadOnly Property WfTaskModuleConfigNavElementID() As String
		Get
			If Not Request.QueryString("WfTaskModuleConfigNavElementID") Is Nothing Then Return Request.QueryString("WfTaskModuleConfigNavElementID")
				Return ""
		End Get
	End Property

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)

		Dim aXmlDoc As cXMLDoc = Nothing
		Dim aDisplayPropertyFiltersNode As XmlNode = Nothing
		Dim aWfTaskModuleConfigNavElementDOL As cDataObjectList
		Dim aArgNode As XmlNode = Nothing

		Dim Position As Integer = 0
		Dim aDataObjectNode As XmlNode = Nothing
		Dim aFiltersNode As XmlNode = Nothing
		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskModuleConfigNavElement", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", Request.QueryString("WfTaskID")))
		If Not WfTaskModuleConfigNavElementID = "0" Then
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskModuleConfigNavElementID", WfTaskModuleConfigNavElementID, "And", "NotEqual"))
		End If
		aWfTaskModuleConfigNavElementDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		aXmlDoc = New cXMLDoc()
		aXmlDoc.LoadFromXML(spnConfigXML.InnerText)
		aDisplayPropertyFiltersNode = aXmlDoc.DocElement.SelectSingleNode("DataObject[@Key='WfTaskModuleConfigNavElement']/DisplayProperties/DisplayProperty/Control[@ID='ctlParentNavItem']/Filters")

		If Not aWfTaskModuleConfigNavElementDOL Is Nothing AndAlso aWfTaskModuleConfigNavElementDOL.Count > 0 Then
			aDisplayPropertyFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))

			For Each aWfTaskModuleConfigNavElementDO As cDataObject In aWfTaskModuleConfigNavElementDOL
				'If WfTaskModuleConfigNavElementID <> aWfTaskModuleConfigNavElementDO.GetPropertyString("WfTaskModuleConfigNavElementID", -1) Then
					If Position = 0 Then
						aArgNode = aDisplayPropertyFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "StandardFormsID", aWfTaskModuleConfigNavElementDO.GetPropertyString("StandardFormsID", "-1"), ""))
					Else
						aArgNode = aDisplayPropertyFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "StandardFormsID", aWfTaskModuleConfigNavElementDO.GetPropertyString("StandardFormsID", "-1"), "Or"))
					End If
					Position = Position + 1
				'End If
			Next
			aDisplayPropertyFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
		End If
		
		spnConfigXML.InnerText = aXmlDoc.DocElement.OuterXml


		MyBase.CoreCtl_Load(aSrc, aEvent)
		ctlNavigationName = FindControl("ctlNavigationName")
		ctlForm = FindControl("ctlForm")
		ctlDescription = FindControl("ctlDescription")
		ctlForm.Set_ServerIndexChange(AddressOf ctlForm_IndexChange)
		If Not Request.QueryString("WfTaskModuleConfigNavElementID") = "0" Then
			ctlDescription.Value = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskModuleConfigNavElement", Request.QueryString("WfTaskModuleConfigNavElementID")).GetRelatedPropertyString("StandardForms.Description")
		End If

		ctlSortOrder = FindControl("ctlSortOrder")
		If Request.QueryString("MasterFormTypeID") = "1" Then
			ctlSortOrder.Value = "0"
			ctlSortOrder.Disabled = True
		End If

		If Request.QueryString("MasterFormTypeID") = "1" Or Request.QueryString("MasterFormTypeID") = "3" Then
			TrSubmissionValidation.Visible = False
		End If

	End Sub
	
	Private Sub ctlForm_IndexChange(ByVal sender As System.Object, ByVal e As System.EventArgs)
		If Not ctlForm.SelectedValue = "" Then
			Dim aStandardFormsDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("StandardForms", ctlForm.SelectedValue)
			If Not aStandardFormsDO Is Nothing Then
				ctlDescription.Value = aStandardFormsDO.GetPropertyString("Description")
			End If
		Else
			ctlDescription.Value = ""
		End If
	End Sub
	
	Public Sub ValidateUniqueNavigationName(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aDataObjectNode As XmlNode = Nothing
		Dim aWfTaskModuleConfigNavElementDOL As cDataObjectList
		Dim aFiltersNode As XmlNode = Nothing
		Dim aArgNode As XmlNode = Nothing
		Dim aXmlDoc As cXMLDoc
		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskModuleConfigNavElement", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "NavTitle", ctlNavigationName.Value))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", Request.QueryString("WfTaskID")))
		If Not Request.QueryString("WfTaskModuleConfigNavElementID") = "0" Then
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskModuleConfigNavElementID", Request.QueryString("WfTaskModuleConfigNavElementID"), "And", "NotEqual"))
		End If
		aWfTaskModuleConfigNavElementDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		If aWfTaskModuleConfigNavElementDOL.Count > 0 Then
			aArgs.IsValid = False
		End If
	End Sub
	
	Public Sub ValidateUniqueForm(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aDataObjectNode As XmlNode = Nothing
		Dim aWfTaskModuleConfigNavElementDOL As cDataObjectList
		Dim aFiltersNode As XmlNode = Nothing
		Dim aArgNode As XmlNode = Nothing
		Dim aXmlDoc As cXMLDoc
		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskModuleConfigNavElement", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "StandardFormsID", ctlForm.SelectedValue))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", Request.QueryString("WfTaskID")))
		If Not Request.QueryString("WfTaskModuleConfigNavElementID") = "0" Then
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskModuleConfigNavElementID", Request.QueryString("WfTaskModuleConfigNavElementID"), "And", "NotEqual"))
		End If
		aWfTaskModuleConfigNavElementDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		If aWfTaskModuleConfigNavElementDOL.Count > 0 Then
			aArgs.IsValid = False
		End If
	End Sub
	
	Public Overrides Sub DataPresenter_SaveDataObjects()
		
		CType(DataObjectCollection("WfTaskModuleConfigNavElement"), cDataObjectList)(0)("NavKey") = Regex.Replace(ctlNavigationName.TextBox, "[^\w\.@-]", "")
		MyBase.DataPresenter_SaveDataObjects()
		
	End Sub
	
End Class
End Namespace