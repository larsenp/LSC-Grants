Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Easygrants.DataAccess
Imports Easygrants.DataAccess.Report
Imports EasyGrants.Web
Imports Core_Web.Controls.Base


Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cUpload_Editor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

'Protected ctlFileTypes As cDoubleListBox

 Protected ctlListBox As ListBox
 Private mSelectedList As String = ""
 Protected ctlTemplate As cDropDown
 Protected DMSysIntegrationPanel As Panel
	
 Protected ctlFileNamePrefix As cTextBox

Protected valUploadFileNamePrefix As CustomValidator

Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)


		Dim aListItemsDataObjList As cDataObjectList
		Dim aDataObj As cDataObject
		Dim aLI As ListItem
		Dim aExtensionList As String
		Dim aItem As String
		ctlListBox.Items.Clear()
		aListItemsDataObjList = DataObjectCollection("FileExtensions")
		For Each aDataObj In aListItemsDataObjList
					aLI = New ListItem()
					aLI.Value = aDataObj.GetRelatedPropertyString("FileExtensionID")
					aLI.Text = aDataObj.GetRelatedPropertyString("Abbr")
					AddItemLeft(aLI)
		Next
		If Not Request.QueryString("UploadID") <> "0" Then
			aDataObj = DataObjectCollection("Upload")(0)
			aExtensionList = aDataObj.GetPropertyString("AllowedFileExtensions", "")
			If aExtensionList <> "" Then
				Dim aSelectedItems As String()
				aSelectedItems = aExtensionList.Split(",")
				For Each aItem In aSelectedItems
					 SelectItemByValue(aItem.Trim())
				Next
			End If

		End If

		'Here we are checking whether the SharePoint Integration is Active or not. if it is Active then we are enabling the section.
		Dim aDataObjectList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")
		If aDataObjectList.Count > 0 Then
			DMSysIntegrationPanel.Visible = True
		Else
			DMSysIntegrationPanel.Visible = False
		End If

		ctlFileNamePrefix = Me.FindControl("ctlFileNamePrefix")
  End Sub

Public Property SelectedList() As String
	Get
		SelectedList = mSelectedList
	End Get
	Set(ByVal value As String)
		mSelectedList = value
	End Set
End Property

Public Sub AddItemLeft(ByVal aListItem As ListItem)
		Dim aLI As ListItem

		aLI = New ListItem()
		aLI.Value = aListItem.Value
		aLI.Text = aListItem.Text
		ctlListBox.Items.Add(aLI)
	End Sub

Public Sub SelectItemByValue(ByVal aValue As String)
		If ctlListBox.Items.FindByText(aValue) Is Nothing Then
			' Value Does Not Exist
			'selDropDown.Items.FindByValue("").Selected = True
		Else
			ctlListBox.Items.FindByText(aValue).Selected = True
		End If
	End Sub

Public Overloads Overrides Function EventController_Save() As Boolean

	Page.Validate()
	If Page.IsValid = True Then

		valUploadFileNamePrefix = Me.FindControl("valUploadFileNamePrefix")
		valUploadFileNamePrefix.Visible = True
		valUploadFileNamePrefix.Validate()
		If valUploadFileNamePrefix.IsValid Then
			Dim aReturnValue As Boolean
			aReturnValue = MyBase.EventController_Save()
			Dim aUploadDataObj As cDataObject = DataObjectCollection("Upload")(0)
			Dim aUploadTemplateDataObj As cDataObject
			Dim aUploadTemplateDOList As cDataObjectList = DataObjectCollection("UploadTemplate")

			Dim i As Integer
			'Dim aListCount As Integer
			For i = 0 To ctlListBox.Items.Count - 1
				If ctlListBox.Items(i).Selected Then
					If SelectedList = "" Then
						SelectedList = ctlListBox.Items(i).Text
					Else
						SelectedList = SelectedList & ", " & ctlListBox.Items(i).Text
					End If
				End If
			Next
			aUploadDataObj("AllowedFileExtensions") = mSelectedList
			WebSession.DataObjectFactory.SaveDataObject(aUploadDataObj)
			ctlTemplate = CType(FindControl("ctlTemplate"), cDropDown)
			If ctlTemplate.SelectedValue <> "" Then
				aUploadTemplateDataObj = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("UploadTemplate", ctlTemplate.SelectedValue)
				aUploadTemplateDataObj("IsUsed") = True
				WebSession.DataObjectFactory.SaveDataObject(aUploadTemplateDataObj)
			Else
				For Each aUploadTemplateDataObj In aUploadTemplateDOList
					Dim aUploadTemplateID As String = aUploadTemplateDataObj.GetPropertyString("UploadTemplateID")
					Dim aUploadCount As Integer = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Upload", "UploadTemplateID", aUploadTemplateID).Count
					If aUploadCount > 0 Then
						aUploadTemplateDataObj("IsUsed") = True
					Else
						aUploadTemplateDataObj("IsUsed") = False
					End If
					WebSession.DataObjectFactory.SaveDataObject(aUploadTemplateDataObj)
				Next
			End If
			Return True
		End If

		

	End If
End Function


	Public Sub ValidatePDFFileNamePrefix(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

		Dim aDO As cDataObject = Me.DataObjectCollection("Upload")(0)
		If Not aDO Is Nothing Then

			Dim aDataObjectList As cDataObjectList
			Dim aXmlDoc As cXMLDoc
			Dim aDataObjectNode, aFiltersNode, aArgNode As XmlNode
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Upload", aDataObjectNode, aFiltersNode)

                If Request.QueryString("UploadID") <> "0" Then
                    aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UploadID", aDO("UploadID"))
                    cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
                    aArgNode.Attributes("Operator").Value = "NotEqual"
                    aFiltersNode.AppendChild(aArgNode)
                End If
                aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "FileNamePrefix", ctlFileNamePrefix.Value)
                aFiltersNode.AppendChild(aArgNode)

                aDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
                If aDataObjectList.Count > 0 Then
                    aArgs.IsValid = False
                Else
                    aArgs.IsValid = True
                End If

            End If

	End Sub
End Class
End Namespace