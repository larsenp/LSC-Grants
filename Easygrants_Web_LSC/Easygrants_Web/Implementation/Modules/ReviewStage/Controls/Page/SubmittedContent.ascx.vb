Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web

Namespace Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page

Public MustInherit Class cSubmittedContent
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlList As cDataListCtl
	Protected errMsg As String
	Private isValidScore As Boolean = True
	Protected ctlNewWindowOpener As cNewWindowOpener


	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)

		Dim aXmlDoc As cXMLDoc = Nothing
		Dim aDataObjectFiltersNode As XmlNode = Nothing
		Dim aReviewCycleProjectTaskDOL As cDataObjectList
		Dim aArgNode As XmlNode = Nothing
		Dim aUser As cEGUser
		Dim aWFTaskAssignmentDo As cDataObject
		Dim Position As Integer = 0

		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		aWFTaskAssignmentDo = aUser.WfTaskAssignmentObject
		aReviewCycleProjectTaskDOL = aWFTaskAssignmentDo.GetRelatedPropertyDataObjectList("ReviewCycleStage.ReviewCycle.ReviewCycleProjectTask")

		aXmlDoc = New cXMLDoc()
		aXmlDoc.LoadFromXML(spnConfigXML.InnerText)
		aDataObjectFiltersNode = aXmlDoc.DocElement.SelectSingleNode("DataObject[@Key='ExternalReviewApplicationsList']/Filters")

		aArgNode = aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCycleStageID", aWFTaskAssignmentDo.GetPropertyInt("ReviewCycleStageID", -1)))
		aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))

		For Each aReviewCycleProjectTaskDO As cDataObject In aReviewCycleProjectTaskDOL
			If Position = 0 Then
				aArgNode = aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectTaskID", aReviewCycleProjectTaskDO.GetPropertyInt("WfProjectTaskID", -1), ""))
			Else
				aArgNode = aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectTaskID", aReviewCycleProjectTaskDO.GetPropertyInt("WfProjectTaskID", -1), "Or"))
			End If
			Position = Position + 1
		Next
		aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
		spnConfigXML.InnerText = aXmlDoc.DocElement.OuterXml

		MyBase.CoreCtl_Load(sender, e)

		
	End Sub


	
	Public Sub ViewReviewerPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String
		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID, "False")
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub

End Class
End Namespace