Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports EasyGrants.Web.Modules
Imports Easygrants_Web.Modules.LOI
Imports Easygrants_Web.Controls.Base
Imports EasyGrants.Web.User


Imports System.Diagnostics
Imports System.Web.UI
Imports EasyGrants.Web



Namespace Easygrants_Web.Modules.ReviewStage.Controls.PageSection

Public MustInherit Class cReviewStageSubmission_Button
	Inherits cValidationDataPresenterCtl
'=================================================

	Protected spnSubmitButton As HtmlGenericControl
	Private aWfTaskModuleObject As cWfTaskAssignment
	Protected mForceGen As Boolean = True
	Private aWfDataObject As cWfTaskAssignment

'=================================================

	Public Property ForceGen() As Boolean
		Get
			Return mForceGen
		End Get
		Set(ByVal Value As Boolean)
			mForceGen = Value
		End Set
	End Property

'=================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
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


		MyBase.CoreCtl_Load(aSrc, aEvent)

		Dim aValidationNode As XmlNode
		Dim aValid As Boolean


		aValidationNode = (CType(Page, cModulePage)).ValidationNode
		aWfDataObject = CType(mDataObjHash("WfTaskAssignment")(0), cWfTaskAssignment)

		aValid = Validate(aValidationNode, WebSession.DataObjectFactory)

		If Not aValid Then
			'spnInvalidText.Visible = True
			spnSubmitButton.Visible = False
		Else
			'if aWfDataObject.GetPropertyInt("WfTaskStatusID") = 1 then
			'	spnSubmitText.Visible = True
			'end if
		End If
	End Sub

'-------------------------------------------------

	Public Sub SubmissionContent_Submit()
			Dim aSubmitPage As cSubmissionModulePage
			Dim aWftaDOL As cDataObjectList
			Dim aRevWftaDOL As cDataObjectList
			Dim aUser As cEGUser
			Dim i As Integer = 0
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			aSubmitPage = CType(Page, cSubmissionModulePage)
			Dim PostSubmissionModuleName As String = ""
			aRevWftaDOL = Me.DataObjectCollection("RevWfTaskAssignment")
			'For Each aRevWftaDO As cDataObject In aRevWftaDOL
			'	If aRevWftaDO.GetPropertyInt("RevWfTaskStatusID", 0) = 1 Or aRevWftaDO.GetPropertyInt("RevWfTaskStatusID", 0) = 4 Then
			'		aWftaDOL(i) = New cDataObject
			'		aWftaDOL.Insert(WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "WfTaskAssignmentID", aRevWftaDO("RevWftaID"))(0), i)
			'		aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
			'		aSubmitPage.PostSubmitModuleName = aWftaDOL(0).GetRelatedPropertyString("WfTask.WfTaskModule.ModuleName")
			'		i = i + 1
			'	End If
			'Next
			aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
			aSubmitPage.PostSubmitModuleName = aRevWftaDOL(0).GetRelatedPropertyString("WfTask.WfTaskModule.ModuleName")
			aSubmitPage.Submit_UpdateData(aRevWftaDOL)
			aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
	End Sub


'=================================================
End Class
End Namespace