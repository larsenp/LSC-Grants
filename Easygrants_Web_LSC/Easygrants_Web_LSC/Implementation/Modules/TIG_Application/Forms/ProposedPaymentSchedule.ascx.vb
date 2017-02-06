Imports System.Xml
Imports System.Web.UI.HtmlControls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Implementation.Modules.TIG_Application.Forms

Public Class cProposedPaymentSchedule
	Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

		Protected divNoGrantTerm As HtmlGenericControl
		Protected divGrantTerm As HtmlGenericControl

		Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
			Dim aDOList As cDataObjectList = MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
			Dim aKey As String = aDataObjectElement.Attributes("Key").Value
			If aKey = "Payment1" Then
				If aDOList.Count = 0 Then
					Dim aXmlDoc As cXMLDoc
					Dim aDataObjectNode, aFiltersNode As XmlNode
					aDataObjectNode = Nothing
					aFiltersNode = Nothing
					aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("LscTigBuildProposedPaymentSchedule", aDataObjectNode, aFiltersNode)
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "wf_task_assignment_id", CType(CType(Page, cModulePage).ModuleUser, cEGWfTAUser).WfTaskAssignmentID))
					WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
					Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
				End If
			End If
			Return aDOList
		End Function

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			Dim aEnable As Boolean = True
			Dim aTigAppList As cDataObjectList = DataObjectCollection("LscTigApp")
			If aTigAppList.Count = 0 Then
				aEnable = False
			Else
				If aTigAppList(0).GetPropertyInt("GrantTermMonths", 0) = 0 Then
					aEnable = False
				End If
			End If
			If aEnable Then
				divNoGrantTerm.Visible = False
			Else
				divGrantTerm.Visible = False
			End If
		End Sub

End Class
End Namespace
