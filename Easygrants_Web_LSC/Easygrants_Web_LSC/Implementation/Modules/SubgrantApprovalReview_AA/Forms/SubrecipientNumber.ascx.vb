Imports Core.DataAccess


Namespace Implementation.Modules.SubgrantApprovalReview_AA.Forms

Public Class cSubrecipientNumber
	Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()

		'If selected subrecipient does not have a subrecipient ID, assign one.
		Dim aGPSubgrantList As cDataObjectList = DataObjectCollection("LscGranteeProjectSubgrant")
		If aGPSubgrantList.Count = 0 Then Exit Sub

		Dim aGPSubgrantDO As cDataObject = aGPSubgrantList(0)
		If aGPSubgrantDO.GetPropertyInt("SubrecipientOrganizationID", 0) = 0 Then Exit Sub 'No subrecipient designated

		If aGPSubgrantDO.GetRelatedPropertyInt("SubrecipientOrganization.LscOrganization.SubrecipientID", 0) = 0 Then
			WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscAssignSubrecipientID", "organization_id", aGPSubgrantDO.GetPropertyInt("SubrecipientOrganizationID"))
		End If
	End Sub

	Public Sub CreateNewSubrecipient()
		'Save data to ensure that LscGranteeProjectSubgrant data object has an ID
		MyBase.DataPresenter_SaveDataObjects()

		Dim aWfTASubgrantDOL As cDataObjectList = DataObjectCollection("LscWfTASubgrant")
		If aWfTASubgrantDOL.Count = 0 Then Exit Sub

		Dim aGPSubgrantDOL As cDataObjectList = DataObjectCollection("LscGranteeProjectSubgrant")
		If aGPSubgrantDOL.Count = 0 Then Exit Sub

		Dim aWfTASubgrantDO As cDataObject = aWfTASubgrantDOL(0)

		'Create, populate, and save new organization data object
		Dim aOrganizationDO As cDataObject = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Organization")
		aOrganizationDO("OrganizationName") = aWfTASubgrantDO.GetPropertyString("SubgranteeName")
		aOrganizationDO("CommonOrganizationName") = aWfTASubgrantDO.GetPropertyString("SubgranteeName")
		aOrganizationDO.SaveData()

		'Create, populate, and save new Address data object
		Dim aAddressDO As cDataObject = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Address")
		aAddressDO("EntityID") = aOrganizationDO.GetPropertyInt("OrganizationID")
		aAddressDO("EntityTypeID") = 2
		aAddressDO("Address1") = aWfTASubgrantDO.GetPropertyString("SubgranteeAddr1")
		aAddressDO("Address2") = aWfTASubgrantDO.GetPropertyString("SubgranteeAddr2")
		aAddressDO("City") = aWfTASubgrantDO.GetPropertyString("SubgranteeCity")
		aAddressDO("StateID") = aWfTASubgrantDO.GetPropertyString("SubgranteeStateProvID")
		aAddressDO("Zip") = aWfTASubgrantDO.GetPropertyString("SubgranteeZip")
		aAddressDO("IsPrimary") = True
		aAddressDO.SaveData()

		'Assign subrecipient ID
		WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscAssignSubrecipientID", "organization_id", aOrganizationDO.GetPropertyInt("OrganizationID"))

		'Associate new subrecipient with this subgrant request and set flag to indicate it's been done.
		Dim aGPSubgrantDO As cDataObject = aGPSubgrantDOL(0)
		aGPSubgrantDO("SubrecipientOrganizationID") = aOrganizationDO.GetPropertyInt("OrganizationID")
		aGPSubgrantDO("NewSubrecipientCreated") = True
		aGPSubgrantDO.SaveData()
	End Sub

End Class
End Namespace
