Imports Core_Web.Controls.Base
Imports Core.Web.Navigation
Imports System.Xml
Imports Core.DataAccess.XMLAccess

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection

Public MustInherit Class cOrganizationPages
	Inherits Core.Web.Modules.cModuleCtl
'=============================================================
    
	'Protected trGoToNavigation As HtmlTableRow
        Protected ctlGoToNavigation As cHorizNavCtl

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
        
        'Displays horizontal GoTo contacts navigation
		
            'If Not ctlGoToNavigation Is Nothing Then
            '	Dim aGoToNavigationNode As XmlNode = ModulePage.ModuleNode.SelectSingleNode("descendant::GoToOrgNavigation")
            '	If Not aGoToNavigationNode Is Nothing Then
            '		If ctlGoToNavigation.MasterNavElement Is Nothing Then
            '			ctlGoToNavigation.MasterNavElement = new cXMLNavElement(true)
            '		End If				
            '		CType(ctlGoToNavigation.MasterNavElement, cXMLNavElement).XMLNavElement_Load(aGoToNavigationNode)
            '		Dim aNodeList As XmlNodeList = aGoToNavigationNode.SelectNodes("NavElement")
            '		Dim aNode As XmlNode
            '		For Each aNode in aNodeList
            '			If ctlGoToNavigation.MasterNavElement.Find_ChildElement(cXMLDoc.AttributeToString(aNode, "Key")).Key = ModulePage.PageKey Then
            '				ctlGoToNavigation.MasterNavElement.Horizontal = True
            '				'trGoToNavigation.Visible = True
            '				'ctlGoToNavigation.Visible = True
            '			End If					
            '		Next				
            '	End If
            'End If		
	End Sub

'=============================================================
End Class 'cOrganizationPages

End Namespace 'Core_Web.Controls.PageFrame