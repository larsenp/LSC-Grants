Imports System.Web.UI.HtmlControls
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User

Namespace Implementation.Modules.Application.Controls.Page
Public Class cPolicyBoardStructure
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Protected trAddStructure As HtmlTableRow
		Protected trPolicyBoardList As HtmlTableRow
		Protected tblNewApplicantNoBoard As HtmlTable
	

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			DisplayNoBoardCheckBox()
		End Sub

		Public Sub DisplayNoBoardCheckBox()
			Dim aList As cDataObjectList = DataObjectCollection("WfTaskAssignment")
			If aList.Count > 0 Then
				Dim aWfTA As cWfTaskAssignment = aList(0)
				If aWfTA("WfTaskID") = 4 Or aWfTA("WfTaskID") = 66 Or aWfTA("WfTaskID") = 67 Then
					tblNewApplicantNoBoard.Visible = False
				End If
			End If
		End Sub

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
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "wf_task_assignment_id", CType(CType(Page, cModulePage).ModuleUser, cEGWfTAUser).WfTaskAssignmentID))
					WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
					Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
				End If
			End If
			Return aDOList
		End Function

End Class
End Namespace
