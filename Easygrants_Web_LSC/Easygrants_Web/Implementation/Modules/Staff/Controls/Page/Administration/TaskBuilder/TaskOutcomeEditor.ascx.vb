Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.TaskBuilder

Public MustInherit Class cTaskOutcomeEditor
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
    
    Protected ctlOutcome As cTextBox

	Public Sub ValidateUniqueOutcome(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aDataObjectNode As XmlNode = Nothing
		Dim aWfTaskOutcomeDOL As cDataObjectList
		Dim aFiltersNode As XmlNode = Nothing
		Dim aArgNode As XmlNode = Nothing
		Dim aXmlDoc As cXMLDoc
		ctlOutcome = FindControl("ctlOutcome")
		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskOutcome", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskOutcome", ctlOutcome.Value))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", Request.QueryString("WfTaskID")))
		If Not Request.QueryString("WfTaskOutcomeID") = "0" Then
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskOutcomeID", Request.QueryString("WfTaskOutcomeID"), "And", "NotEqual"))
		End If
		aWfTaskOutcomeDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		If aWfTaskOutcomeDOL.Count > 0 Then
			aArgs.IsValid = False
		End If
	End Sub

End Class

End Namespace