Imports System.Xml
Imports Core.DataAccess.XMLAccess

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public MustInherit Class cRatingsByApp
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Public Overrides Sub LoadConfigXML()
		Me.mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
        
		if me.Request.QueryString("ID") = "" then
			dim aNode as XmlNode = cXMLDoc.FindNode(mXMLDoc.DocElement.SelectSingleNode("DataObject/Filters"), "Argument", "TypeKey", "ID")
			me.mXMLDoc.DocElement.SelectSingleNode("DataObject/Filters").RemoveChild(aNode)
		End If		
    End Sub
    
End Class
End Namespace