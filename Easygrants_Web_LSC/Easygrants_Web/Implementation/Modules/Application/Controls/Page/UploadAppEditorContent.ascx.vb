Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Namespace Easygrants_Web.Modules.Application.Controls.Page
    Public MustInherit Class cUploadAppEditorContent
        Inherits Core_Web.Controls.Base.cDataPresenterCtl
		'============================================================= 
		Protected ctlUpload As cUploadNew
		Protected TblInstructions As HtmlTable

        Public Overrides Sub LoadConfigXML()
            Me.mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
            If Me.Request.QueryString("SubmittedFileID") = "" Then
                Dim aUpdatableAttr As XmlAttribute = mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='SubmittedFile']").Attributes("Updatable")
                aUpdatableAttr.Value = "False"
            End If
		End Sub

	Protected Overrides Sub OnPreRender(ByVal e As EventArgs)
		MyBase.OnPreRender(e)
		If spnPageContent.InnerHtml.Trim.Length > 0 Then
			ctlUpload = Me.FindControl("ctlUpload")
			ctlUpload.HideInstructions = False
		Else
			TblInstructions.Visible = False
		End If
	End Sub
		'=============================================================

	End Class
End Namespace

