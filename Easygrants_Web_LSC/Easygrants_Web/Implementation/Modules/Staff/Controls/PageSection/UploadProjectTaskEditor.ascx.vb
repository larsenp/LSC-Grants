Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Easygrants.DataAccess
Imports Easygrants.DataAccess.Report
Imports EasyGrants.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection


Public Class cUploadProjectTaskEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl


		Protected ctlIncludeinTask As cCheckBox
		Protected TrDDUploadName As HtmlTableRow
		Protected TrLblUploadName As HtmlTableRow
		Protected ctlGeneralUploadCategoryType As cDropDown
		Protected ctlGeneralUploadCategory As cDropDown
		Protected TblGenUploads As HtmlTable
		Protected ctlGeneral As cCheckBox

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			ctlGeneralUploadCategoryType = Me.FindControl("ctlGeneralUploadCategoryType")
			ctlGeneralUploadCategory = Me.FindControl("ctlGeneralUploadCategory")
			ctlGeneral = Me.FindControl("ctlGeneral")
			If Request.QueryString("WfProjectTaskUploadID") = 0 Then
				ctlIncludeinTask = CType(Me.FindControl("ctlIncludeinTask"), cCheckBox)
				ctlIncludeinTask.BaseCheckButton.Checked = True
				TrDDUploadName.Visible = True
				TrLblUploadName.Visible = False
			Else
				TrDDUploadName.Visible = False
				TrLblUploadName.Visible = True
			End If
			ctlGeneralUploadCategoryType.Set_ServerIndexChange(AddressOf Me.ctlGeneralUploadCategoryType_OnClick)
			ctlGeneral.Set_ServerClick(AddressOf ctlGeneral_OnClick)


		End Sub

		Public Overrides Sub CoreCtl_setValues()
			MyBase.CoreCtl_SetValues()
			If Not Page.IsPostBack Then
				ResetGenUploadControls()
				PopulateGeneralUploadCategory()
			End If
			Dim WfProjectTaskUploadDOL As cDataObjectList
			WfProjectTaskUploadDOL = Me.DataObjectCollection("WfProjectTaskUpload")
			If WfProjectTaskUploadDOL.Count > 0 Then
				ctlGeneralUploadCategory.SelectedField = WfProjectTaskUploadDOL(0).GetPropertyString("GeneralUploadCategoryID", "")
			End If

		End Sub

		Private Sub ctlGeneral_OnClick(ByVal sender As System.Object, ByVal e As System.EventArgs)
			ResetGenUploadControls()
		End Sub

		Private Sub ResetGenUploadControls()
			If ctlGeneral.Value Then
				TblGenUploads.Visible = True
			Else
				TblGenUploads.Visible = False
				ctlGeneralUploadCategoryType.SelectedField = ""
					ctlGeneralUploadCategory.SelectedField = ""
			End If
		End Sub

		Private Sub ctlGeneralUploadCategoryType_OnClick(ByVal sender As System.Object, ByVal e As System.EventArgs)
			PopulateGeneralUploadCategory()
		End Sub

		Private Sub PopulateGeneralUploadCategory()
			Dim GeneralUploadCategoryDOL As cDataObjectList
			Dim GeneralUploadCategoryTypeDOL As cDataObjectList
			Dim aXMLDoc As cXMLDoc
			Dim aDataObjectNode As XmlNode
			Dim aFiltersNode As XmlNode
			Dim aArgNode As XmlNode

			Dim aItem As ListItem
			ctlGeneralUploadCategory.Items.Clear()
			aItem = New ListItem("<Select>", "")
			ctlGeneralUploadCategory.Items.Add(aItem)
			GeneralUploadCategoryTypeDOL = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("GeneralUploadCategoryType", "GeneralUploadCategoryTypeID", ctlGeneralUploadCategoryType.SelectedValue)
			If GeneralUploadCategoryTypeDOL.Count > 0 Then
				aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode(GeneralUploadCategoryTypeDOL(0)("DataObjectDefinitionKey"), aDataObjectNode, aFiltersNode)
				'aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", GeneralUploadCategoryTypeDOL(0)("StoredValue"), "", "NotEqual"))
				GeneralUploadCategoryDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
				For Each aDO As cDataObject In GeneralUploadCategoryDOL
						aItem = New ListItem(aDO.GetRelatedPropertyString(GeneralUploadCategoryTypeDOL(0)("DisplayValue")), aDO.GetRelatedPropertyString(GeneralUploadCategoryTypeDOL(0)("StoredValue")))
						ctlGeneralUploadCategory.Items.Add(aItem)
					Next
			End If
		End Sub

		Public Overrides Sub DataPresenter_SaveDataObjects()
			MyBase.DataPresenter_SaveDataObjects()
			Dim WfProjectTaskUploadDOL As cDataObjectList
			WfProjectTaskUploadDOL = Me.DataObjectCollection("WfProjectTaskUpload")
			WfProjectTaskUploadDOL(0)("GeneralUploadCategoryID") = ctlGeneralUploadCategory.SelectedField
			WfProjectTaskUploadDOL(0).SaveData()
		End Sub


	' Public Sub ValidateUpload(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

	'	If Request.QueryString("WfProjectTaskUploadID") > 0 Then
	'		aArgs.IsValid = True

	'	Else
	'		Dim ctlUpload As cDropDown
	'		ctlUpload = CType(FindControl("ctlUpload"), cDropDown)

	'		Dim aSelectedUploadID As String = ctlUpload.SelectedValue
	'		Dim aWfProjectTaskUploadList As cDataObjectList
	'		aWfProjectTaskUploadList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskUpload", "WfProjectTaskID", Request.QueryString("WfProjectTaskID"), "UploadId", aSelectedUploadID)
	'		If aWfProjectTaskUploadList.Count > 0 Then
	'			aArgs.IsValid = False
	'		Else
	'			aArgs.IsValid = True
	'		End If
	'	End If
	'End Sub

End Class

End Namespace