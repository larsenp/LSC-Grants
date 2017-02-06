Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports EasyGrants.Web


Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cContact_Phone
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================

    
'=============================================================

    Public Overrides Sub LoadConfigXML()
		Me.mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
        
        If CType(Page, cModulePage).CurrentModuleName = "Staff" Then 
            dim aAddNode as XmlNode = cXMLDoc.FindNode(mXMLDoc.DocElement.SelectSingleNode("DataObject/DisplayProperties/DisplayProperty/Control"), "Action", "ID", "Add")           
            aAddNode.Attributes("Object").Value = "EventController"
            aAddNode.Attributes("Method").Value = "EventController_NavigateToModulePageKey"

            dim aEditNode as XmlNode = cXMLDoc.FindNode(mXMLDoc.DocElement.SelectSingleNode("DataObject/DisplayProperties/DisplayProperty/Control/DisplayProperty[@ID='Edit']/Control"), "Action", "ID", "Edit") 
            aEditNode.Attributes("Object").Value = "EventController"
            aEditNode.Attributes("Method").Value = "EventController_NavigateToModulePageKey"
        End If

    End Sub


	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub


'=============================================================
End Class
End Namespace