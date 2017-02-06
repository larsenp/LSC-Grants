Imports System.Web.UI.HtmlControls
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Implementation.Modules.GAR.ActualOfficeInfo.Controls.Page
	Public Class cForm_E0
        'Inherits Core_Web.Controls.Base.cDataPresenterCtl
        Inherits Easygrants_Web.Controls.Base.cWfTADataPresenterCtl
		Protected trAddMain As HtmlTableRow

		Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
			Dim aDOList As cDataObjectList = MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
			If aDataObjectElement.Attributes("Key").Value = "LscOffice" Then
				If aDOList.Count = 0 Then
					Dim aXmlDoc As cXMLDoc
					Dim aDataObjectNode, aFiltersNode As XmlNode
					Dim aWfTAList As cDataObjectList
					aWfTAList = Me.DataObjectCollection("WfTaskAssignment")
					If aWfTAList.Count = 0 Then Return Nothing
					aDataObjectNode = Nothing
					aFiltersNode = Nothing
					aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("LscCopyOfficeInfo", aDataObjectNode, aFiltersNode)
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "organization_id", aWfTAList(0).GetRelatedPropertyString("GranteeProject.PrimaryOrganizationID")))
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "time_period_id", aWfTAList(0).GetRelatedPropertyString("WfTACompetitionYear.TimePeriodID")))
					WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
					Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
				End If
			End If
			Return aDOList
		End Function

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			Dim aMainList As cDataObjectList = DataObjectCollection("LscOfficeMain")
			If aMainList.Count > 0 Then
				trAddMain.Visible = False
			End If
		End Sub

	End Class
End Namespace
