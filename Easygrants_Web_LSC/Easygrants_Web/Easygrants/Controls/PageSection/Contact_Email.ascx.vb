Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web
Imports Core.DataAccess.XMLAccess

Namespace Easygrants_Web.Controls.PageSection
Public Class cContact_Email
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	
'============================================================= 

	Protected ctlNewWindowOpener As cNewWindowOpener
	
'============================================================= 

    Public Sub SendEmail(ByVal aEmail As String)
    
		ctlNewWindowOpener.NewWindowURL = "mailto:" + aEmail
        ctlNewWindowOpener.Open()
        
    End Sub   

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
   
'=============================================================
End Class 'cBudgetPeriod_Editor
End Namespace
