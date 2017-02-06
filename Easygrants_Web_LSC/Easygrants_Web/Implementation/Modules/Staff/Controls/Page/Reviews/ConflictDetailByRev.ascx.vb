Imports System.Xml
Imports Core.DataAccess.XMLAccess

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public MustInherit Class cConflictDetailByRev
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Public Overrides Sub LoadConfigXML()
		mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
        
		If Request.QueryString("RevPersonID") = "-1" Then
			Dim aNode As XmlNode = cXMLDoc.FindNode(mXMLDoc.DocElement.SelectSingleNode("DataObject/Filters"), "Argument", "TypeKey", "RevPersonID")
			mXMLDoc.DocElement.SelectSingleNode("DataObject/Filters").RemoveChild(aNode)
		End If		
    End Sub

End Class
End Namespace
