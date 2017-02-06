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
    Public MustInherit Class cDocument_Editor
        Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

        '=============================================================

        'protected ctlUploadType as cDropDown
        Protected ctlUploadTitle As cTextBox
        Protected ctlQueryGroup As cDropDown
		Protected ctlTemplateType As cDropDown
		'Protected ctlUpload As cUpload

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

			ctlUploadTitle = me.FindControl("ctlUploadTitle")
			ctlQueryGroup = FindControl("ctlQueryGroup")
			ctlTemplateType = FindControl("ctlTemplateType")
			'ctlUpload = FindControl("ctlUpload")

			'ctlUpload.FindControl("ctlStaffUpload").Visible = False

			'Here we are checking whether the SharePoint Integration is Active or not. if it is Active then we are enabling the section.
			Dim aDataObjectList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")
			If aDataObjectList.Count > 0 Then
				DMSysIntegrationPanel.Visible = True
			Else
				DMSysIntegrationPanel.Visible = False
			End If
        End Sub

        '-------------------------------------------------------------

        'Private Sub DropDown_Selected(ByVal sender As System.Object, ByVal e As System.EventArgs)
        '    Dim aURL As String = Request.RawUrl.ToString()

        '    ctlUploadTitle = Me.FindControl("ctlUploadTitle")
        '    aURL = cWebLib.AddQuerystringParameter(aURL, "title", ctlUploadTitle.Value)
        '    Response.Redirect(aURL)
        'End Sub

        ''-------------------------------------------------------------

        'Private Sub TitleChange(ByVal sender As System.Object, ByVal e As System.EventArgs)
        '    ctlUploadTitle = Me.FindControl("ctlUploadTitle")
        '    response.Redirect(cWebLib.AddQuerystringParameter(request.RawUrl.ToString(), "title", ctlUploadTitle.Value))
        'End Sub

        '-------------------------------------------------------------

        Public Overrides Sub CoreCtl_SetValues()
            MyBase.CoreCtl_SetValues()

            'ctlUploadType = me.FindControl("ctlUploadType")
            Dim aType As String = request.QueryString("type")

            If aType <> "" Then
                'ctlUploadType.SelectedField = aType
            End If

            ctlUploadTitle = Me.FindControl("ctlUploadTitle")
            Dim aTitle As String = request.QueryString("title")
            Dim aQueryBaseTypeID As String = Request.QueryString("QueryBaseTypeID")
            Dim aTemplateTypeID As String = Request.QueryString("TemplateTypeID")

            If aTitle <> "" Then
                ctlUploadTitle.Value = aTitle
            End If
            
            If aQueryBaseTypeID <> "" Then
				ctlQueryGroup.BaseControl.SelectedValue = aQueryBaseTypeID
			End If
			
			If aTemplateTypeID <> "" Then
				ctlTemplateType.BaseControl.SelectedValue = aTemplateTypeID
			End If
        End Sub

        '-------------------------------------------------------------

        Public Sub GoClick(ByVal aValue As String)
            Dim aURL As String
            aURL = Request.RawUrl.ToString()
            cWebLib.RemoveQuerystringParameter(aURL, "FileTypeID")
            aURL = cWebLib.AddQuerystringParameter(aURL, "FileTypeID", aValue)

            Response.Redirect(aURL)
        End Sub

        '-------------------------------------------------------------

        Public Sub SaveToQuery()
            ctlUploadTitle = CType(Me.FindControl("ctlUploadTitle"), cTextBox)

            Dim aURL As String = Request.RawUrl.ToString()
            aURL = cWebLib.AddQuerystringParameter(aURL, "title", ctlUploadTitle.Value)
			aURL = cWebLib.AddQuerystringParameter(aURL, "QueryBaseTypeID", ctlQueryGroup.SelectedValue)
			aURL = cWebLib.AddQuerystringParameter(aURL, "TemplateTypeID", ctlTemplateType.SelectedValue)
            Response.Redirect(aURL)
        End Sub

        '=============================================================

        Public Overrides Sub DataPresenter_SaveDataObjects()
            MyBase.DataPresenter_SaveDataObjects()

            If SubmittedFileID > 0 Then
                'ctlUploadType = me.FindControl("ctlUploadType")
                ctlUploadTitle = CType(Me.FindControl("ctlUploadTitle"), cTextBox)

                Dim aDataObject As cDataObject
                aDataObject = Me.DataObjectCollection("SubmittedFile")(0)

                If Not aDataObject Is Nothing Then
                    'aDataObject("FileTypeID") = ctlUploadType.SelectedValue
                    aDataObject("UploadTitle") = ctlUploadTitle.Value
                    If Not ctlQueryGroup.SelectedValue = "" Then
						aDataObject("QueryBaseTypeID") = ctlQueryGroup.SelectedValue
					End If
					If Not ctlTemplateType.SelectedValue = "" Then
						aDataObject("WordMergeTemplateTypeID") = ctlTemplateType.SelectedValue
					End If
                    Dim aUser As cEGUser
                    aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
                    aDataObject("UploadedByID") = aUser.PersonID

                    WebSession.DataObjectFactory.SaveDataObject(aDataObject)
                End If
            End If
        End Sub

        '=============================================================

    End Class
End Namespace
