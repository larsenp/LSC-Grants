Imports Core.Web.Modules
Imports Core.DataAccess
Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.ReviewStage.Controls.Page
Public MustInherit Class cScoresAndCommentsUploadEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	
	Private aSubmittedFileID, aWfTaskAssignmentReviewID As String

'=============================================================

	Public Overrides Function EventController_Save() As Boolean
		MyBase.EventController_Save()
		
		Dim aCommentsUpload As cUploadNew = FindControl("ctlUpload")
		
		Dim aWfTaskAssignmentReviewDO As cDataObject
		aWfTaskAssignmentReviewDO = CType(DataObjectCollection("WfTaskAssignmentReview"), cDataObjectList)(0)
		aWfTaskAssignmentReviewDO("CommentsUploadedFileID") = aCommentsUpload.SubmittedFileID
		aWfTaskAssignmentReviewDO.SaveData()
	End Function

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		
		MyBase.CoreCtl_Load(aSrc, aEvent)
		'If Not IsPostBack Then
			aSubmittedFileID = Request.QueryString("SubmittedFileID")
			aWfTaskAssignmentReviewID = Request.QueryString("WfTaskAssignmentReviewID")
			'If aSubmittedFileID <> "0" Then
				Dim aWfTaskAssignmentReviewDO As cDataObject
				aWfTaskAssignmentReviewDO = CType(DataObjectCollection("WfTaskAssignmentReview"), cDataObjectList)(0)
				If aWfTaskAssignmentReviewDO.GetPropertyInt("CommentsUploadedFileID", 0) <> aSubmittedFileID Then
					aWfTaskAssignmentReviewDO("CommentsUploadedFileID") = aSubmittedFileID
					aWfTaskAssignmentReviewDO.SaveData()
				End If
			'End If
		'End If

	End Sub
	
		Public Overrides Sub Page_Unload(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
			MyBase.Page_Unload(aSrc, aEvent)
			
			Dim aWFTAReviewDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aWfTaskAssignmentReviewID)(0)
			If Not aWFTAReviewDO Is Nothing Then
				Dim aCommentsUploadedFileID As String = aWFTAReviewDO.GetPropertyString("CommentsUploadedFileID", "0")
				If aCommentsUploadedFileID <> "0" Then
					Dim aSubmittedFileDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", aCommentsUploadedFileID)
					If aSubmittedFileDO Is Nothing Then
						aWFTAReviewDO("CommentsUploadedFileID") = 0
						aWFTAReviewDO.SaveData()
					End If
				End If
			End If
		End Sub


End Class
End Namespace