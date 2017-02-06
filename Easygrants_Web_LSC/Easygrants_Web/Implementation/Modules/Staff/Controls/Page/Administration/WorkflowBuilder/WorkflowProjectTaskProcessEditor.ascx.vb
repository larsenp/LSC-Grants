Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder

Public MustInherit Class cWorkflowProjectTaskProcessEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlProcessType As cDropDown
	Protected ctlEvent As cDropDown
	Protected ctlShortDescription As cLabel
	Protected ctlLongDescription As cLabel

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)

		MyBase.CoreCtl_Load(aSrc, aEvent)
		ctlProcessType = FindControl("ctlProcessType")
		ctlEvent = FindControl("ctlEvent")
		ctlShortDescription = FindControl("ctlShortDescription")
		ctlLongDescription = FindControl("ctlLongDescription")
		ctlProcessType.Set_ServerIndexChange(AddressOf ctlProcessType_IndexChange)
		ctlEvent.Set_ServerIndexChange(AddressOf ctlEvent_IndexChange)
	End Sub

	Private Sub ctlProcessType_IndexChange(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aFiltersNode As XmlNode = Nothing
		Dim aDataObjectNode As XmlNode = Nothing
		Dim aXmlDoc As cXMLDoc = Nothing
		Dim aSortNode As XmlNode = Nothing
		Dim aEventManagerEventsDOL As cDataObjectList = Nothing
		Dim aEventManagerEventsDO As cDataObject = Nothing
		ctlEvent.Items.Clear()
		ctlEvent.Items.Add(New ListItem("<Select>", ""))
		If Not ctlProcessType.SelectedValue = "" Then
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("EventManagerEvents", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ProcessTypeID", ctlProcessType.SelectedValue))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "IsActive", "True"))
			aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
			aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SortOrder", ""))
			aEventManagerEventsDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
			For Each aEventManagerEventsDO In aEventManagerEventsDOL
				ctlEvent.Items.Add(New ListItem(aEventManagerEventsDO.GetPropertyString("EventName"), aEventManagerEventsDO.GetPropertyString("EventManagerEventsID")))
			Next
		End If
		ctlShortDescription.Value = ""
		ctlLongDescription.Value = ""
	End Sub

	Private Sub ctlEvent_IndexChange(ByVal sender As System.Object, ByVal e As System.EventArgs)
		If Not ctlEvent.SelectedValue = "" Then
			Dim aEventManagerEventsDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("EventManagerEvents", ctlEvent.SelectedValue)
			If Not aEventManagerEventsDO Is Nothing Then
				ctlShortDescription.Value = aEventManagerEventsDO.GetPropertyString("ShortDescription")
				ctlLongDescription.Value = aEventManagerEventsDO.GetPropertyString("LongDescription")
			End If
		End If
	End Sub

End Class
End Namespace