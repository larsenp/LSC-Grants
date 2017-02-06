Imports System.Xml
Imports Core.Web.Modules
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reports
Public Class cAdHocQuerySaveAs
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
'========================================================
	Protected valReqQueryName As RequiredFieldValidator
	Protected valCusSave As CustomValidator
'========================================================
    Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
		If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "SavedQuery" Then
			Dim aList as cDataObjectList = WebSession.DataObjectFactory.CreateNewDataObjectListFromKey("SavedQuery")
			aList.Remove(aList(0))
			aList.Add(CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).GetSavedQueryDO)
			'In order for values to be displayed in the control, the IsNewDataObject property must be set to false.
			aList(0).IsNewDataObject = False
			Return aList
		Else
			Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
		End If
	End Function

'--------------------------------------------------------

	Protected Sub ValidateUniqueNameSave(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		aArgs.IsValid = ValidateUniqueName("Save")
	End Sub

'--------------------------------------------------------

	Protected Function ValidateUniqueName(aAction As String) As Boolean
		'Get ID of current query
		'Dim aQueryID As Integer = SavedQueryDO.GetPropertyInt("SavedQueryID", -1)
		
		'Get list of all saved queries
		Dim aDataObjectNode As XmlNode
		Dim aXmlDoc As cXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SavedQuery", aDataObjectNode)
		Dim aQueryList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		Dim aQueryDO As cDataObject
		Dim txtQueryName As cTextBox = FindControl("txtQueryName")
		
		'Compare names of saved queries to selected name
		For Each aQueryDO In aQueryList
			'If the "Save As" button was clicked, the name should not match any existing query name.
			'If the "Save" button was clicked, the name should not match the name of any existing query with a different query ID.
			If aQueryDO.GetPropertyString("Name") = txtQueryName.Value Then
				Return False
			End If
			
		Next
		Return True
	End Function
'--------------------------------------------------------

	Public Overrides Sub DataPresenter_SaveDataObjects()
		'The IsNewDataObject property of the SavedQuery data object, which was set to False on load to force 
		'loading of the data values into the controls, must now be set back to its proper value of True so that
		'its primary key will be populated on save.
		valReqQueryName.Validate()
		valCusSave.Validate()
		If Not (valReqQueryName.IsValid And valCusSave.IsValid) Then 
			Exit Sub
		End If		
		Dim aList as cDataObjectList = DataObjectCollection("SavedQuery")
		aList(0).IsNewDataObject = True
		MyBase.DataPresenter_SaveDataObjects()
	End Sub

'========================================================

End Class
End Namespace