Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core.DataAccess
Namespace Easygrants_Web.Modules.Application.Controls.Page
	Public MustInherit Class cStaffUploadEditorContent
		Inherits Core_Web.Controls.Base.cDataPresenterCtl
		'============================================================= 
		Public Overrides Sub LoadConfigXML()
			Me.mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
			If Me.Request.QueryString("SubmittedFileID") = "" Then
				Dim aUpdatableAttr As XmlAttribute = mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='SubmittedFile']").Attributes("Updatable")
				aUpdatableAttr.Value = "False"
			End If
		End Sub

		Protected Overrides Sub OnPreRender(ByVal e As EventArgs)
			MyBase.OnPreRender(e)
			Dim GPAdditionalContactDOL As cDataObjectList = Me.DataObjectCollection("ParticipantUploadGranteeProjectAdditionalContact")
			Dim SubmittedFileDOL As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", "SubmittedFileID", Request.QueryString("SubmittedFileID"))
			If SubmittedFileDOL.Count > 0 And GPAdditionalContactDOL.Count > 0 Then
				SubmittedFileDOL(0)("EntityID") = Request.QueryString("GranteeProjectID")
				SubmittedFileDOL(0)("GeneralUploadCategoryTypeID") = Request.QueryString("GeneralUploadCategoryTypeID")
				SubmittedFileDOL(0)("GeneralUploadCategoryID") = Request.QueryString("GeneralUploadCategoryID")
				SubmittedFileDOL(0)("GeneralUploadDataObjectPrimarykeyID") = GPAdditionalContactDOL(0).GetPropertyString("GranteeProjectAdditionalContactID", "")
				SubmittedFileDOL(0).SaveData()
			End If
		End Sub


		'=============================================================

	End Class
End Namespace

