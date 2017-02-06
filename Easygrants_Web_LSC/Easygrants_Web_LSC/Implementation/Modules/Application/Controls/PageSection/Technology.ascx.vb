Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Implementation.Modules.Application.Controls.PageSection
	Public Class cTechnology
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
			Dim aDOList As cDataObjectList = MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
			If aDataObjectElement.Attributes("Key").Value = "LscTechnology" Then
				If aDOList.Count = 0 OrElse aDOList(0).IsNewDataObject Then
					Dim aXmlDoc As cXMLDoc
					Dim aDataObjectNode, aFiltersNode As XmlNode
					aDataObjectNode = Nothing
					aFiltersNode = Nothing
					aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("LscCopyTechnologyInfo", aDataObjectNode, aFiltersNode)
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "wf_task_assignment_id", CType(CType(Page, cModulePage).ModuleUser, cEGWfTAUser).WfTaskAssignmentID))
					WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
					Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
				End If
			End If
			Return aDOList
		End Function


	End Class
End Namespace
