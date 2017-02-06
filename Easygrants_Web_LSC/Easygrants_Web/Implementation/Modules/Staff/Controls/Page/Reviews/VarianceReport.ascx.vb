Imports System.Xml
Imports Core.DataAccess.XMLAccess

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public MustInherit Class cVarianceReport
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected tblCloseWindow as HtmlTable
	Protected spnCloseControl as HtmlGenericControl

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		tblCloseWindow.Visible = True

    

	End Sub

	Public Overrides Sub LoadConfigXML()
		Me.mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
        
		if me.Request.QueryString("ReviewCommitteeID") = "" then
			dim aListNode as XmlNode = cXMLDoc.FindNode(mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='GranteeProjectReviewStage']").SelectSingleNode("Filters"), "Argument", "TypeKey", "ReviewCommitteeID")
			mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='GranteeProjectReviewStage']").SelectSingleNode("Filters").RemoveChild(aListNode)
		End If		
    End Sub
    
	Public Sub CloseWindow()
		tblCloseWindow.Visible = True
		spnCloseControl.Visible = True
	End Sub	

End Class
End Namespace

