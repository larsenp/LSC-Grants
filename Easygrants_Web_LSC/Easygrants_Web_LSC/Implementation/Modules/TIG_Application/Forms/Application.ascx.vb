Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Implementation.Modules.TIG_Application.Forms

Public Class cApplication
	Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

		Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
			Dim aDOList As cDataObjectList = MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
			Dim aKey As String = aDataObjectElement.Attributes("Key").Value
			If aKey = "LscTigApp" Then
				Dim aXmlDoc As cXMLDoc
				Dim aDataObjectNode, aFiltersNode As XmlNode
				aDataObjectNode = Nothing
				aFiltersNode = Nothing
				aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("LscTigCopyGrantRequestAmount", aDataObjectNode, aFiltersNode)
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "wf_task_assignment_id", CType(CType(Page, cModulePage).ModuleUser, cEGWfTAUser).WfTaskAssignmentID))
				WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
				Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
			End If
			Return aDOList
		End Function

End Class
End Namespace
