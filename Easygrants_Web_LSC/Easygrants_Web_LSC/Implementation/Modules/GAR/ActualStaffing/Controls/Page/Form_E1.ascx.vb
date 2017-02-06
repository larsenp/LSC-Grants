Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Implementation.Modules.GAR.ActualStaffing.Controls.Page
	Public Class cForm_E1
        'Inherits Core_Web.Controls.Base.cDataPresenterCtl
        Inherits Easygrants_Web.Controls.Base.cWfTADataPresenterCtl

		Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
			Dim aDOList As cDataObjectList = MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
			If aDataObjectElement.Attributes("Key").Value = "LscOffice" Then
				If aDOList.Count = 0 Then
					'Dim aXmlDoc As cXMLDoc
					'Dim aDataObjectNode, aFiltersNode As XmlNode
					'Dim aWfTAList As cDataObjectList
					'aWfTAList = Me.DataObjectCollection("WfTaskAssignment")
					'If aWfTAList.Count = 0 Then Return Nothing
					'aDataObjectNode = Nothing
					'aFiltersNode = Nothing
					'aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("LscCopyOfficeInfo", aDataObjectNode, aFiltersNode)
					'aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "organization_id", aWfTAList(0).GetRelatedPropertyString("GranteeProject.PrimaryOrganizationID")))
					'aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "time_period_id", aWfTAList(0).GetRelatedPropertyString("WfTACompetitionYear.TimePeriodID")))
					'WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
					Dim aCommandEl As XmlElement = Me.mXMLDoc.DocElement.SelectSingleNode("DataCommand[@Key='LscCopyOfficeInfoCmd']")
					Dim aParametersEl As XmlElement = aCommandEl.SelectSingleNode("Parameters")
					EventController_SetArgumentsInNodeList(aParametersEl)
					WebSession.DataObjectFactory.ExecuteCommand(aCommandEl)
					Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
				End If
			End If
			Return aDOList
		End Function

	End Class
End Namespace
