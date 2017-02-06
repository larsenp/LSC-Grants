Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Implementation.Modules.Review.Controls.Page

Namespace Easygrants_Web.Modules.Review.Controls.Page


Public Class cInternalReview_LSC
	Inherits cInternalReview
		Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
			Dim aDOList As cDataObjectList = MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
			If aDataObjectElement.Attributes("Key").Value = "Organization" Then
				If aDOList(0).GetPropertyValue("LegacyOrganizationID") Is System.DBNull.Value Then
					Dim aXmlDoc As cXMLDoc
					Dim aDataObjectNode, aFiltersNode As XmlNode
					aDataObjectNode = Nothing
					aFiltersNode = Nothing
					aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("LscAssignRecipientID", aDataObjectNode, aFiltersNode)
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "wf_task_assignment_id", CType(CType(Page, cModulePage).ModuleUser, cEGWfTAUser).WfTaskAssignmentID))
					WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
					Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
				End If
			End If
			Return aDOList
		End Function

End Class
End Namespace