Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports System.Text
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports Core.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
	Public MustInherit Class cDocument_Upload
		Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

		'=============================================================
		'Protected ctlUploadTitle As cTextBox
		'Protected ctlQueryGroup As cDropDown
		'Protected ctlTemplateType As cDropDown
		Protected DMSysIntegrationPanel As Panel

		'=============================================================

		Public ReadOnly Property SubmittedFileID() As String
			Get
				If Not Request.QueryString("SubmittedFileID") Is Nothing Then
					Return Request.QueryString("SubmittedFileID")
				Else
					Return ""
				End If
			End Get
		End Property

		'-------------------------------------------------------------

		Protected ReadOnly Property SubmittedFile() As cDataObject
			Get
				If Request.QueryString("SubmittedFileID") Is Nothing Then Return Nothing

				Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", _
				 Request.QueryString("SubmittedFileID"))
			End Get
		End Property

		'=============================================================

		Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
			MyBase.CoreCtl_Load(sender, e)

			'ctlUploadTitle = Me.FindControl("ctlUploadTitle")
			'ctlQueryGroup = FindControl("ctlQueryGroup")
			'ctlTemplateType = FindControl("ctlTemplateType")

			'Here we are checking whether the SharePoint Integration is Active or not. if it is Active then we are enabling the section.
			Dim aDataObjectList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")
			If aDataObjectList.Count > 0 Then
				DMSysIntegrationPanel.Visible = True
			Else
				DMSysIntegrationPanel.Visible = False
			End If
		End Sub

		'=============================================================

	End Class
End Namespace