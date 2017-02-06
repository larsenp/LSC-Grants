Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Implementation.Modules.LOI.Controls.Page
	Public Class cBoardMembersList
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
			Dim aDOList As cDataObjectList = MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
			Dim aKey As String = aDataObjectElement.Attributes("Key").Value
			If aKey = "MemberList" Or aKey = "LscBoardStructure" Then
				If aDOList.Count = 0 OrElse aDOList(0).IsNewDataObject Then
					Dim aDataObjectKey As String
					Select Case aKey
						Case "MemberList"
							aDataObjectKey = "LscCopyBoardMemberInfo"
						Case "LscBoardStructure"
							aDataObjectKey = "LscCopyBoardStructureInfo"
					End Select
					Dim aXmlDoc As cXMLDoc
					Dim aDataObjectNode, aFiltersNode As XmlNode
					aDataObjectNode = Nothing
					aFiltersNode = Nothing
					aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode(aDataObjectKey, aDataObjectNode, aFiltersNode)
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "wf_task_assignment_id", _
							CType(CType(Page, cModulePage).ModuleUser, cEGWfTAUser).WfTaskAssignmentID))
					WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
					Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
				End If
			End If
			Return aDOList
		End Function

	End Class
End Namespace