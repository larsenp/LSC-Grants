Imports Core.DataAccess
Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports System.IO
Imports Core.Web
Imports System.Threading
Imports Core_Web.Controls.Base
Imports System.Text
Imports System.Net


Namespace Easygrants_Web.Modules.Staff.Controls.Page

Public MustInherit Class cPdfReportEditor_Content
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	 Protected DMSysIntegrationPanel As Panel
	 Protected ctlFileNamePrefix As cTextBox
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		'Here we are checking whether the SharePoint Integration is Active or not. if it is Active then we are enabling the section.
		Dim aDataObjectList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")
		If aDataObjectList.Count > 0 Then
			DMSysIntegrationPanel.Visible = True
		Else
			DMSysIntegrationPanel.Visible = False
		End If

		ctlFileNamePrefix = Me.FindControl("ctlFileNamePrefix")
	End Sub

	Public Sub ValidateDuplicatePDFKey(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

	End Sub

	Public Sub ValidatePDFFileNamePrefix(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

		Dim aDO As cDataObject = Me.DataObjectCollection("WfProjectTaskPDF")(0)
		If Not aDO Is Nothing AndAlso aDO.GetPropertyInt("WfProjectTaskPDFID", -1) > 0 Then

			Dim aDataObjectList As cDataObjectList
			Dim aXmlDoc As cXMLDoc
			Dim aDataObjectNode, aFiltersNode, aArgNode As XmlNode
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfProjectTaskPDF", aDataObjectNode, aFiltersNode)

			aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectTaskPDFID", aDO("WfProjectTaskPDFID"))
			cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
			aArgNode.Attributes("Operator").Value = "NotEqual"
			aFiltersNode.AppendChild(aArgNode)
			aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "FileNamePrefix", ctlFileNamePrefix.Value)
			aFiltersNode.AppendChild(aArgNode)

			aDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
			If aDataObjectList.Count > 0 Then
				aArgs.IsValid = False
			Else
				aArgs.IsValid = True
			End If

		End If
	End Sub

'=============================================================
End Class
End Namespace