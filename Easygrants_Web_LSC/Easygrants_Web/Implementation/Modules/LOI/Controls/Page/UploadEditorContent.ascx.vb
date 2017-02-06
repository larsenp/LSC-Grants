Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.LOI.Controls.Page
Public MustInherit Class cUploadEditorContent
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlUpload As cUploadNew
	Protected TblInstructions As HtmlTable
	
'============================================================= 

     Public Overrides Sub LoadConfigXML()
		Me.mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
		if me.Request.QueryString("SubmittedFileID") = "" then
			dim aUpdatableAttr as XmlAttribute = mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='SubmittedFile']").Attributes("Updatable")
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
