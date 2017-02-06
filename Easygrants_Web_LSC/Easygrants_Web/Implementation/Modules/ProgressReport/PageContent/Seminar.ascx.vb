Imports Core.Web
Imports Core.Web.Modules
Imports Core.Web.User
Imports Core.Web.Navigation.CrumbTrail
Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Modules.ProgressReport.PageContent

Public MustInherit Class cSeminar
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aNode As XmlNode
		Dim aXMLDoc As cXMLDoc = New cXMLDoc()
		Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
        
        if aUser.WfTaskID = 7 then
			aXMLDoc.LoadFromXML(spnConfigXML.InnerText)
			aNode = aXMLDoc.DocElement.SelectSingleNode("DataObject/DisplayProperties/DisplayProperty[@Key='Save']/Control/Action/Parameters")
			aNode.InnerXml = "<Argument AttributeName='PageKey' Value='3rdYearRequest'/>"
			spnConfigXML.InnerText = aXMLDoc.DocElement.OuterXml
		end if
		
		MyBase.CoreCtl_Load(sender, e)
	End Sub

'=============================================================
End Class 'cStageDetail
End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
