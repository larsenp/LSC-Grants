Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web
Imports Core.Web


Namespace Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page

Public MustInherit Class cPreviousStageScoresAndDetailedComments
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

	Protected TblOtherReviewer As HtmlTable
	Protected TblReviewerDetailedComments As HtmlTable
	Protected ctlNewWindowOpener As cNewWindowOpener
	Dim BtnOtherViewCritique As cCSSButton
	Private mReportOuputDefinitionTypeID As String = "1"
	Private mDefinitionID As String
	Private mEditorPageKey As String
	Private mIsUserBased As Boolean = False

	Public Property EditorPageKeyName() As String
		Get
			Return mEditorPageKey
		End Get
		Set(ByVal value As String)
			mEditorPageKey = value
		End Set
	End Property

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

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		Dim aTR As HtmlTableRow
		Dim aTD As HtmlTableCell
		Dim aOtherExternalReviewApplicationsListDOL As cDataObjectList
		Dim ReviewerNo As Integer = 2
		Dim aRevWftaID As Integer = 0

		'Update the table with the detailed comments of the reviewer
		Dim aExternalReviewApplicationsListWithoutCommentsDOL As cDataObjectList = Me.DataObjectCollection("ExternalReviewApplicationsListWithoutComments")
		If aExternalReviewApplicationsListWithoutCommentsDOL.Count > 0 Then
			Dim aExternalReviewApplicationsListWithoutCommentsDO As cDataObject = aExternalReviewApplicationsListWithoutCommentsDOL(0)
			Dim aFiltersNode As XmlNode = Nothing
			Dim aDataObjectNode As XmlNode = Nothing
			'Dim aXmlDoc As cXMLDoc
			Dim aXmlDoc As cXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentReview", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskAssignmentID", aExternalReviewApplicationsListWithoutCommentsDO.GetPropertyString("RevWftaID")))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCommentsID", "null"))
			Dim aWfTaskAssignmentReviewOverallCommentsDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
			If aWfTaskAssignmentReviewOverallCommentsDOL.Count > 0 Then
				aTR = New HtmlTableRow()
				aTD = New HtmlTableCell()
				aTD.InnerHtml = "<B>" + "Overall Assessment: </B>" + aWfTaskAssignmentReviewOverallCommentsDOL(0).GetPropertyString("Comments")
				aTR.Cells.Add(aTD)
				TblReviewerDetailedComments.Rows.Add(aTR)
			End If

			aFiltersNode = Nothing
			aDataObjectNode = Nothing
			Dim aSortNode As XmlNode = Nothing
			Dim aArgNode As XmlNode = Nothing
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentReview", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskAssignmentID", aExternalReviewApplicationsListWithoutCommentsDO.GetPropertyString("RevWftaID")))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCommentsID", "null", "And", "NotEqual"))
			aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
			aArgNode = aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SortOrder", ""))
			aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "ReviewComments"))
			Dim aWfTaskAssignmentReviewDetailedCommentsDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
			Dim aWfTaskAssignmentReviewDetailedCommentsDO As cDataObject
			For Each aWfTaskAssignmentReviewDetailedCommentsDO In aWfTaskAssignmentReviewDetailedCommentsDOL
				If aWfTaskAssignmentReviewDetailedCommentsDO.GetPropertyString("Comments", "") <> "" Then
					aTR = New HtmlTableRow()
					aTD = New HtmlTableCell()
					aTD.InnerHtml = "<B>" + aWfTaskAssignmentReviewDetailedCommentsDO.GetRelatedPropertyString("ReviewComments.Description") + ": </B>" + aWfTaskAssignmentReviewDetailedCommentsDO.GetPropertyString("Comments")
					aTR.Cells.Add(aTD)
					TblReviewerDetailedComments.Rows.Add(aTR)
				End If
			Next
		End If

		'Update the table with the detailed comments of other reviewers
		aOtherExternalReviewApplicationsListDOL = Me.DataObjectCollection("OtherExternalReviewApplicationsListWithoutComments")

		For Each aOtherExternalReviewApplicationsListDO As cDataObject In aOtherExternalReviewApplicationsListDOL
			aTR = New HtmlTableRow()
			aTD = New HtmlTableCell()
			aTD.InnerHtml = "<b>Reviewer " + ReviewerNo.ToString + ":</b>"
			aTR.Cells.Add(aTD)
			TblOtherReviewer.Rows.Add(aTR)

			aTR = New HtmlTableRow()
			aTD = New HtmlTableCell()
			aTD.InnerHtml = "Review Stage: " + aOtherExternalReviewApplicationsListDO.GetRelatedPropertyString("RevWfta.ReviewCycleStage.Name")
			aTR.Cells.Add(aTD)
			TblOtherReviewer.Rows.Add(aTR)

			aTR = New HtmlTableRow()
			aTD = New HtmlTableCell()
			aTD.InnerHtml = "Rating: " + aOtherExternalReviewApplicationsListDO.GetRelatedPropertyString("RevWfta.Rating.Name")
			aTR.Cells.Add(aTD)
			TblOtherReviewer.Rows.Add(aTR)

			Dim aFiltersNode As XmlNode = Nothing
			Dim aDataObjectNode As XmlNode = Nothing
			Dim aXmlDoc As cXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentReview", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskAssignmentID", aOtherExternalReviewApplicationsListDO.GetPropertyString("RevWftaID")))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCommentsID", "null"))
			Dim aWfTaskAssignmentReviewOverallCommentsDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
			If aWfTaskAssignmentReviewOverallCommentsDOL.Count > 0 Then
				aTR = New HtmlTableRow()
				aTD = New HtmlTableCell()
				aTD.InnerHtml = "Overall Assessment: " + aWfTaskAssignmentReviewOverallCommentsDOL(0).GetPropertyString("Comments")
				aTR.Cells.Add(aTD)
				TblOtherReviewer.Rows.Add(aTR)
			End If

			aFiltersNode = Nothing
			aDataObjectNode = Nothing
			Dim aSortNode As XmlNode = Nothing
			Dim aArgNode As XmlNode = Nothing
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentReview", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskAssignmentID", aOtherExternalReviewApplicationsListDO.GetPropertyString("RevWftaID")))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCommentsID", "null", "And", "NotEqual"))
			aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
			aArgNode = aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SortOrder", ""))
			aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "ReviewComments"))
			Dim aWfTaskAssignmentReviewDetailedCommentsDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
			Dim aWfTaskAssignmentReviewDetailedCommentsDO As cDataObject
			For Each aWfTaskAssignmentReviewDetailedCommentsDO In aWfTaskAssignmentReviewDetailedCommentsDOL
				If aWfTaskAssignmentReviewDetailedCommentsDO.GetPropertyString("Comments", "") <> "" Then
					aTR = New HtmlTableRow()
					aTD = New HtmlTableCell()
					aTD.InnerHtml = aWfTaskAssignmentReviewDetailedCommentsDO.GetRelatedPropertyString("ReviewComments.Description") + ": " + aWfTaskAssignmentReviewDetailedCommentsDO.GetPropertyString("Comments")
					aTR.Cells.Add(aTD)
					TblOtherReviewer.Rows.Add(aTR)
				End If
			Next

			aTR = New HtmlTableRow()
			aTD = New HtmlTableCell()
			aTD.InnerHtml = "<hr>"
			aTR.Cells.Add(aTD)
			TblOtherReviewer.Rows.Add(aTR)

			aTR = New HtmlTableRow()
			aTD = New HtmlTableCell()
			aTD.InnerHtml = "&nbsp;"
			aTR.Cells.Add(aTD)
			TblOtherReviewer.Rows.Add(aTR)

			ReviewerNo = ReviewerNo + 1
		Next

	End Sub

	Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
		If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "PreviousReviewCycleStage" Then
			Dim aReviewWfTaskAssignmentDOL As cDataObjectList = CType(DataObjectCollection("ReviewWfTaskAssignment"), cDataObjectList)
			Dim aPreviousReviewCycleStageDOL As cDataObjectList = Nothing
			If aReviewWfTaskAssignmentDOL.Count > 0 Then
				Dim aCurrentReviewStageID As String = aReviewWfTaskAssignmentDOL(0).GetPropertyString("ReviewCycleStageID")
				Dim aCurrentReviewStageDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("ReviewCycleStage", aCurrentReviewStageID)
				Dim aReviewCycleID As String = aCurrentReviewStageDO.GetPropertyString("ReviewCycleID")
				Dim aCurrentListOrder As String = aCurrentReviewStageDO.GetPropertyString("ListOrder")
				'Dim aPreviousReviewStageID As Integer
				Dim aFiltersNode As XmlNode = Nothing
				Dim aDataObjectNode As XmlNode = Nothing
				Dim aSortNode As XmlNode = Nothing
				Dim aArgNode As XmlNode = Nothing
				Dim aXmlDoc As cXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("ReviewCycleStage", aDataObjectNode, aFiltersNode)
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCycleID", aReviewCycleID))
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ListOrder", aCurrentListOrder, "And", "LessThan"))
				aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
				aArgNode = aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ListOrder", ""))
				cXMLDoc.AddAttribute_ToNode(aArgNode, "Direction", "Descending")
				Dim aAllPreviousReviewCycleStageDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
				aPreviousReviewCycleStageDOL = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleStage", "ReviewCycleID", aReviewCycleID, "ListOrder", aAllPreviousReviewCycleStageDOL(0).GetPropertyString("ListOrder"))
			End If
			Return aPreviousReviewCycleStageDOL
		Else
			Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
		End If
	End Function

	Public Sub ViewPDF(ByVal aExternalReviewApplicationsListWithoutCommentsDOL As cDataObject)

		Dim aHref As String
		Dim EntityID As String = aExternalReviewApplicationsListWithoutCommentsDOL.GetPropertyString("AppWftaID")
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

	Public Sub ViewCommentsUploadedFile(ByVal aRevWftaID As String)
		Dim aHref As String

		aHref = WebAppl.Build_RootURL("Core/Controls/Base/pgUploadReader.aspx")
		Dim aCommentsUploadedFileID As String = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aRevWftaID)(0).GetPropertyString("CommentsUploadedFileID")
		aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aCommentsUploadedFileID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub

End Class
End Namespace