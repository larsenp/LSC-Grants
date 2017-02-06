Imports System.Xml
Imports Core.DataAccess.XMLAccess

Namespace Implementation.Modules.ThirdParty.Controls.PageSection
    Public MustInherit Class cReferenceUploadsEditor
        Inherits Core_Web.Controls.Base.cDataPresenterCtl

        '============================================================= 

        Public Overrides Sub LoadConfigXML()
            Me.mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
            If Me.Request.QueryString("SubmittedFileID") = "" Then
                Dim aUpdatableAttr As XmlAttribute = mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='SubmittedFile']").Attributes("Updatable")
                aUpdatableAttr.Value = "False"
            End If
        End Sub

        '=============================================================

    End Class
End Namespace
