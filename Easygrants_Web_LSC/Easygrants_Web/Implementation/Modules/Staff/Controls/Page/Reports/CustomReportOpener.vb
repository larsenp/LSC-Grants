Imports System.Xml
Imports Core.DataAccess.XMLAccess
'Imports Easygrants_v4_YMCA_r1.Modules.Staff.Controls.PageSection

'Namespace Easygrants_v4_YMCA_r1.Modules.Staff.Controls.PageSection
Namespace Easygrants_Web.Modules.Staff.Controls.PageSection

Public Class cCustomReportOpener
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================
	Protected ctlStdReportOpen As cStandardReports_Open
'=============================================================
	Protected Sub Populate_FormattedReportNode_Arguments()
		Dim aFormattedReportNode As XmlNode
		Dim aDataObjectsNL As XmlNodeList
		Dim aDataObject As XmlNode

		aFormattedReportNode = ctlStdReportOpen.FormattedReportNode
		aDataObjectsNL = aFormattedReportNode.SelectNodes("DataObject")
		For Each aDataObject In aDataObjectsNL
			Dim aArgumentsNL As XmlNodeList
			Dim aArgumentNode As XmlNode

			aArgumentsNL = aDataObject.SelectNodes("Filters/Argument")

			For Each aArgumentNode In aArgumentsNL
				Dim aValue As String

				aValue = EventController_GetArgumentValue(aArgumentNode, Nothing)
				If Not aValue = "" Then
					cXMLDoc.AddAttribute_ToNode(aArgumentNode, "Value", aValue)
				End If
			Next
		Next
	End Sub
'----------------------------------------------------

	Public Overridable Sub OpenReport()
		Populate_FormattedReportNode_Arguments()

		ctlStdReportOpen.OpenReport()
	End Sub

'=============================================================
End Class
End Namespace