Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web
Imports Core.Web


Namespace Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page

Public MustInherit Class cPreliminaryViewScoresAndComments
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

	Protected TblOtherReviewer As HtmlTable
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

		aOtherExternalReviewApplicationsListDOL = Me.DataObjectCollection("OtherExternalReviewApplicationsList")

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
			aTD.InnerHtml = "Rating: " + aOtherExternalReviewApplicationsListDO.GetRelatedPropertyString("ReviewRating")
			aTR.Cells.Add(aTD)
			TblOtherReviewer.Rows.Add(aTR)

			aRevWftaID = aOtherExternalReviewApplicationsListDO.GetPropertyString("RevWftaID")
			Dim aWfTaskAssignmentReviewDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aRevWftaID)
			If Not aWfTaskAssignmentReviewDOL Is Nothing AndAlso aWfTaskAssignmentReviewDOL.Count > 0 Then
				Dim aCommentsUploadedFileID As String = aWfTaskAssignmentReviewDOL(0).GetPropertyString("CommentsUploadedFileID")
				BtnOtherViewCritique = LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cButton']").Attributes("ControlFile").Value)
				BtnOtherViewCritique.ID = aCommentsUploadedFileID
				BtnOtherViewCritique.Caption = "View"
				Dim aViewerNode As XmlNode = WebAppl.ConfigDoc.DocElement.SelectSingleNode("UploadViewerControls/Control[@Type='Viewer']")
				Dim aHref As String
				If aViewerNode Is Nothing Then
					aHref = "pgUploadReader.aspx"
				Else
					aHref = WebAppl.Build_RootURL(cXMLDoc.AttributeToString(aViewerNode, "URL"))
				End If
				aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aCommentsUploadedFileID)
				BtnOtherViewCritique.Href = aHref
				BtnOtherViewCritique.Target = "_blank"
				aTR = New HtmlTableRow()
				aTD = New HtmlTableCell()
				aTD.Controls.Add(BtnOtherViewCritique)
				aTR.Cells.Add(aTD)
				TblOtherReviewer.Rows.Add(aTR)
			End If

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

	Public Sub ViewPDF(ByVal aExternalReviewApplicationsListDOL As cDataObject)

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