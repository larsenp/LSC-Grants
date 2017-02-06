Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports System.Xml
Imports EasyGrants.DataAccess

Imports EasyGrants.Web

Namespace Easygrants_Web.Modules.Staff.Controls.PageContent
Public MustInherit Class cPersonWfTasklist
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================
	Protected ctlNewWindowOpener As cNewWindowOpener
    'Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
	   ' Dim aUser As cEGUser
	   ' Dim aPerson As cPerson
	    
	   ' aUser = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser)
	   ' aPerson = CType(Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aUser.PersonID), cPerson)
	   ' dim  aList  as cDataObjectList  =  aPerson.Person_Updated_WorkgroupTaskList()
	   ' aList.DataObjectNode = aDataObjectElement.ParentNode.SelectSingleNode("DataObject")
    '    Return aList
    'End Function
	Public Sub ViewAppPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String = ""
		Dim aWFTADo As cDataObject
		Dim AppWftaID As String = ""
		Dim AppDefinitionID As String = ""

		aWFTADo = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "WfTaskAssignmentID", aEntityID)(0)
		AppWftaID = aWFTADo.GetPropertyInt("AppWftaID", -1)

		If AppWftaID > 0 Then
			AppDefinitionID = aWFTADo.GetRelatedPropertyInt("AppWfta.WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID", -1)
			aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(AppWftaID, AppDefinitionID)
		Else
			aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
		End If

		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
'=============================================================

End Class
End Namespace