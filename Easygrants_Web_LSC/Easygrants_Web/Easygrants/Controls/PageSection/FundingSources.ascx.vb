Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.DataAccess
Imports System.Web.UI
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web.Modules

Namespace Easygrants.Controls.PageSection
Public MustInherit Class cFundingSources
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

	Protected tblGPTotalAllocatedAmount As HtmlTable

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		Dim aGranteeProjectDOL As cDataObjectList = Me.DataObjectCollection("GranteeProjectInfo")
		If aGranteeProjectDOL.Count > 0 AndAlso aGranteeProjectDOL(0).GetRelatedPropertyDecimal("GranteeProjectTotalAllocatedAmount.TotalAllocatedAmount", -1) > 0 Then
			tblGPTotalAllocatedAmount.Visible = True
		End If
	End Sub

	Public Sub Delete(ByVal aPrimaryKeyValue As String)
		'Dim aGPFSDO As cDataObject = Me.DataObjectCollection("GranteeProjectFundingSources")(0)
		'If Not aGPFSDO Is Nothing Then
		'	Dim aUploadDO As cDataObject
		'	Dim aUploadDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Upload", "UploadTemplateID", aPrimaryKeyValue)
		'	If aUploadDOList.Count > 0 Then
		'		For Each aUploadDO In aUploadDOList
		'			If aUploadDO.GetPropertyInt("UploadTemplateID", 0) = aPrimaryKeyValue Then
		'				aUploadDO("UploadTemplateID") = System.DBNull.Value
		'				aUploadDO.SaveData()
		'			End If
		'		Next
		'	End If
		'	EventController_Delete("UploadTemplate", aPrimaryKeyValue)
		'End If
		Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		Dim aGPFSDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("GranteeProjectFundingSources", aPrimaryKeyValue)(0)
		If Not aGPFSDO Is Nothing Then
			Dim aHistoryObj As cDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectFundingSourcesHistory")
			aHistoryObj("GranteeProjectFundingSourcesID") = aGPFSDO.GetPropertyInt("GranteeProjectFundingSourcesID", 0)
			aHistoryObj("GranteeProjectID") = aGPFSDO.GetPropertyInt("GranteeProjectID", 0)
			aHistoryObj("FundID") = aGPFSDO.GetPropertyInt("FundID", 0)
			aHistoryObj("AmountAllocated") = aGPFSDO.GetPropertyString("AmountAllocated")
			aHistoryObj("FundingSourceStatusID") = aGPFSDO.GetPropertyInt("FundingSourceStatusID", 0)
			aHistoryObj("CreateUser") = aGPFSDO.GetPropertyInt("CreateUser", 0)
			aHistoryObj("CreateDate") = aGPFSDO.GetPropertyString("CreateDate")
			aHistoryObj("ModifyUser") = aGPFSDO.GetPropertyInt("ModifyUser", 0)
			aHistoryObj("ModifyDate") = aGPFSDO.GetPropertyString("ModifyDate")
			aHistoryObj("ChangeType") = "Delete"
			aHistoryObj("HistoryModifyUser") = aUser.UserID
			aHistoryObj("HistoryModifyDate") = Date.Now
			Me.WebSession.DataObjectFactory.SaveDataObject(aHistoryObj)

			'Here after adding the record to the history table , we are deleting the date from the Table
			EventController_Delete("GranteeProjectFundingSources", aPrimaryKeyValue)
		End If
	End Sub

End Class

End Namespace