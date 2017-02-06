Imports System.Web.UI.WebControls
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Implementation.Modules.Staff.Controls.Page.Administration
	Public Class cTaskMgmt_LSC
		Inherits Easygrants_Web.Modules.Staff.Controls.Page.cTaskMgmt

	'Protected ctlCmpt As cDropDown

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		'Note: this method duplicates the effort of the base class. It discards the unsorted list of drop-down items 
		'created by the base method and repopulates the drop-down with a sorted list of the same items.
		'I chose to make the page less efficient because it allowed me to run the rest of the code in the base
		'CoreCtl_Load, rather than having to duplicate all of that code in this derived class.
		'Peter Larsen 5/6/2008

		'If Funding Opportunity drop-down is visible, sort items in list
		If Not ProgramID = "" Then
			Dim aDataObjectList As cDataObjectList
			Dim aDataObject As cDataObject
			Dim aXMLDoc As cXMLDoc
			Dim aDOEl As XmlElement
			Dim aFiltersEl As XmlElement
			Dim aSortEl As XmlElement
			Dim aArgEl As XmlElement
			Dim aItem As ListItem

			aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Competition", aDOEl, aFiltersEl)
			aFiltersEl.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "ProgramID", ProgramID))
			aSortEl = aXMLDoc.CreateSortNode()
			aSortEl.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "CompetitionDisplayName", "", ""))
			aDOEl.AppendChild(aSortEl)
			aDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDOEl)
			ctlCmpt.Items.Clear()
			aItem = New ListItem("<None>", "")
			ctlCmpt.Items.Add(aItem)

			For Each aDataObject In aDataObjectList
				aItem = New ListItem(aDataObject.GetPropertyString("CompetitionDisplayName"), aDataObject.GetPropertyString("CompetitionID"))
				ctlCmpt.Items.Add(aItem)
			Next
			If Not CmptID = "" Then
				ctlCmpt.SelectedField = CmptID
			End If

		End If
	End Sub

	End Class
End Namespace
