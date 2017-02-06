Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web
Imports EasyGrants.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports Core.Web
Imports System.Text

Namespace Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page
Public MustInherit Class cScoresAndDetailedCommentsEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

'========================================================================

	Protected ctlNewWindowOpener As cNewWindowOpener
	Private mReportOuputDefinitionTypeID As String = "1"
	Private mDefinitionID As String
	Private mIsUserBased As Boolean = False
	Protected tblComments As HtmlTable

	Public Property ReportOuputDefinitionTypeID() As String
		Get
			Return mReportOuputDefinitionTypeID
		End Get
		Set(ByVal value As String)
			mReportOuputDefinitionTypeID = value
		End Set
	End Property

	Public Property IsUserBased() As Boolean
		Get
			Return mIsUserBased
		End Get
		Set(ByVal value As Boolean)
			mIsUserBased = value
		End Set
	End Property
'========================================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		BuildDetailedCommentsTable()
	End Sub

	Private Sub BuildDetailedCommentsTable()
		Dim aRevWFTAID As String = Request.QueryString("RevWftaID")
		Dim aWFTAReviewDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aRevWFTAID)(0)
		Dim aFiltersNode As XmlNode = Nothing
		Dim aDataObjectNode As XmlNode = Nothing
		Dim aSortNode As XmlNode = Nothing
		Dim aXmlDoc As cXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("ReviewComments", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "RatingTypeID", "5"))
		aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
		aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SortOrder", ""))
		Dim aReviewCommentsDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		Dim aReviewCommentsDO As cDataObject
		For Each aReviewCommentsDO In aReviewCommentsDOL
			Dim aAbbrTR As HtmlTableRow
			Dim aAbbrTD As HtmlTableCell
			Dim aDescriptionTR As HtmlTableRow
			Dim aDescriptionTD As HtmlTableCell
			Dim aTextAreaTR As HtmlTableRow
			Dim aTextAreaTD As HtmlTableCell
			Dim aCommentsTextArea As cTextArea
			aAbbrTR = New HtmlTableRow()
			aAbbrTD = New HtmlTableCell()
			aAbbrTD.InnerHtml = "<B><U>" + aReviewCommentsDO.GetPropertyString("Abbr") + "</U></B>"
			aAbbrTR.Cells.Add(aAbbrTD)
			tblComments.Rows.Add(aAbbrTR)
			aDescriptionTR = New HtmlTableRow()
			aDescriptionTD = New HtmlTableCell()
			aDescriptionTD.InnerHtml = aReviewCommentsDO.GetPropertyString("Description")
			aDescriptionTR.Cells.Add(aDescriptionTD)
			tblComments.Rows.Add(aDescriptionTR)
			aTextAreaTR = New HtmlTableRow()
			aTextAreaTD = New HtmlTableCell()
			aCommentsTextArea = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cTextArea']").Attributes("ControlFile").Value), cTextArea)
			aCommentsTextArea.Rows = 5
			aCommentsTextArea.Cols = 100
			aCommentsTextArea.TooLongMessage = "Limit your " + aReviewCommentsDO.GetPropertyString("Abbr") + " to 5000 characters."
			aCommentsTextArea.MaxLength = 5000
			Dim aWfTaskAssignmentReviewDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aRevWFTAID, "ReviewCommentsID", aReviewCommentsDO.GetPropertyString("ReviewCommentsID"))
			If aWfTaskAssignmentReviewDOL.Count > 0 Then
				aCommentsTextArea.Value = aWfTaskAssignmentReviewDOL(0).GetPropertyString("Comments", "")
			Else
				aCommentsTextArea.Value = ""
			End If
			aCommentsTextArea.ID = aRevWFTAID + "_" + aReviewCommentsDO.GetPropertyString("ReviewCommentsID")
			aTextAreaTD.Controls.Add(aCommentsTextArea)
			aTextAreaTR.Cells.Add(aTextAreaTD)
			tblComments.Rows.Add(aTextAreaTR)
			Dim aEmptyTR As HtmlTableRow = New HtmlTableRow()
			Dim aEmptyTD As HtmlTableCell = New HtmlTableCell()
			aEmptyTD.InnerHtml = "&nbsp"
			aEmptyTR.Cells.Add(aEmptyTD)
			tblComments.Rows.Add(aEmptyTR)
		Next
	End Sub

	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()

		Dim aWfTADOL As cDataObjectList = CType(DataObjectCollection("WfTaskAssignment"), cDataObjectList)
		aWfTADOL(0)("ReviewRating") = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Rating", "RatingID", aWfTADOL(0)("ReviewRatingID"))(0).GetPropertyInt("Rating")
		aWfTADOL(0).SaveData()
		Dim aRevWFTAID As String = Request.QueryString("RevWftaID")
		'Dim aWFTAReviewDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aRevWFTAID)(0)
		Dim aFiltersNode As XmlNode = Nothing
		Dim aDataObjectNode As XmlNode = Nothing
		Dim aSortNode As XmlNode = Nothing
		Dim aXmlDoc As cXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("ReviewComments", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "RatingTypeID", "5"))
		aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
		aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SortOrder", ""))
		Dim aReviewCommentsDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		Dim aReviewCommentsDO As cDataObject
		Dim aCommentsText As String
		For Each aReviewCommentsDO In aReviewCommentsDOL
			Dim aControlID As String = aRevWFTAID + "_" + aReviewCommentsDO.GetPropertyString("ReviewCommentsID")
			Dim aWfTaskAssignmentReviewDO As cDataObject
			Dim aWfTaskAssignmentReviewDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aRevWFTAID, "ReviewCommentsID", aReviewCommentsDO.GetPropertyString("ReviewCommentsID"))
			aCommentsText = Request.Form.Item("mPageFrameCtl:ctlPageContent:" + aControlID + ":txtText")
			If aWfTaskAssignmentReviewDOL.Count > 0 Then
				aWfTaskAssignmentReviewDO = aWfTaskAssignmentReviewDOL(0)
				aWfTaskAssignmentReviewDO("Comments") = aCommentsText
			Else
				aWfTaskAssignmentReviewDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignmentReview")
				aWfTaskAssignmentReviewDO("WfTaskAssignmentID") = Convert.ToInt32(aRevWFTAID)
				aWfTaskAssignmentReviewDO("Comments") = aCommentsText
				aWfTaskAssignmentReviewDO("ReviewCommentsID") = aReviewCommentsDO.GetPropertyInt("ReviewCommentsID")
			End If
			aWfTaskAssignmentReviewDO.SaveData()
		Next
	End Sub

	Public Sub ViewReviewerPDF(ByVal aExternalReviewApplicationsListDOL As cDataObject)

		Dim aHref As String
		Dim EntityID As String = aExternalReviewApplicationsListDOL.GetPropertyString("AppWftaID")
		Dim aWftaDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("WfTaskAssignment", EntityID)(0)
		If IsUserBased = True Then
			Dim aUser As cEGUser
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			Dim aUserDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("User", aUser.UserID)(0)
			If aUserDO.GetPropertyString("UserTypeID") = 1 Then
				mDefinitionID = aWftaDO.GetRelatedPropertyString("WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
			ElseIf aUserDO.GetPropertyString("UserTypeID") = 2 Or aUserDO.GetPropertyString("UserTypeID") = 3 Then
				mDefinitionID = aWftaDO.GetRelatedPropertyString("WfProjectTask.StaffPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
			End If
		ElseIf ReportOuputDefinitionTypeID = 1 Then
			mDefinitionID = aWftaDO.GetRelatedPropertyString("WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
		ElseIf ReportOuputDefinitionTypeID = 2 Then
			mDefinitionID = aWftaDO.GetRelatedPropertyString("WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
		ElseIf ReportOuputDefinitionTypeID = 3 Then
			mDefinitionID = aWftaDO.GetRelatedPropertyString("WfProjectTask.StaffPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
		End If

		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(EntityID, mDefinitionID, "False")
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub

	Public Sub ViewParticipantSummary(ByVal aPageKey As String, ByVal aGranteeProjectID As String)
		If Not EventController_Save(True) Then
			Exit Sub
		End If
		Dim aNewWindowUrl As String = Request.Url.ToString
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "Page", aPageKey)
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "PageFrame=Print")
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, aGranteeProjectID)
		ctlNewWindowOpener.NewWindowURL() = aNewWindowUrl
		ctlNewWindowOpener.Open()
	End Sub

End Class
End Namespace