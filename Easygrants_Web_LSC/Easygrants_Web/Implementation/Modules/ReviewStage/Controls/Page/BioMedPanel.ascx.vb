Imports Core.DataAccess
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page

Public MustInherit Class cBioMedPanel
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	 
	protected ctlList as cDataListCtl
	protected errMsg As String
	private isValidScore As Boolean = True
	Protected ctlNewWindowOpener As cNewWindowOpener

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		
		if Not IsPostBack Then
			Dim aWftaDOList As cDataObjectList
			Dim aWftaDO As cDataObject
			Dim aBtnAddCommentHash As Hashtable
			Dim aBtnEditCommentHash As Hashtable
			Dim aBtnAddComment As cCSSButton
			Dim aBtnEditComment As cCSSButton
			ctlList = FindControl("ctlList")
			aBtnAddCommentHash = ctlList.DataListCtl_GetControlCollection("btnAddComment")
			aBtnEditCommentHash = ctlList.DataListCtl_GetControlCollection("btnEditComment")
			aWftaDOList = CType(DataObjectCollection("BioMedPanelReviewList"), cDataObjectList)
			For Each aWftaDO In aWftaDOList
				aBtnAddComment = CType(aBtnAddCommentHash(aWftaDO.GetPropertyInt("RevWftaID")), cCSSButton)
				aBtnEditComment = CType(aBtnEditCommentHash(aWftaDO.GetPropertyInt("RevWftaID")), cCSSButton)
				If (Not aBtnAddComment Is Nothing) And (Not aBtnEditComment Is Nothing) Then
					aBtnAddComment.Visible = False
					aBtnEditComment.Visible = False
					If aWftaDO.GetPropertyInt("RevWfTaskStatusID") = 1 Then
						If aWftaDO.GetPropertyString("Comments", "") = "" Then
							aBtnAddComment.Visible = True
						Else
							aBtnEditComment.Visible = True
						End If
					End If
				End If
			Next
		End If
	End Sub

	Public Sub SavePanelScore(aWfTaskAssignmentID As String)
		Dim aWftaDO As cDataObject
		Dim aScoreHash As Hashtable
		Dim aScoreTextbox As cTextBox
		Dim aRegex As RegularExpressionValidator
		Dim aScore As Single
		
		If aWfTaskAssignmentID <> "" Then
			ctlList = FindControl("ctlList")
			aScoreHash = ctlList.DataListCtl_GetControlCollection("ctlRating")
			
			aWftaDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID)
			aScoreTextbox = CType(aScoreHash(Convert.ToInt32(aWfTaskAssignmentID)), cTextBox)
			If Not aScoreTextbox Is Nothing Then
				If aScoreTextbox.Value = "" Then
					WebSession.DataObjectFactory.SaveDataObject(aWftaDO)
					Return
				End If			
				Try
					aScore = Convert.ToSingle(aScoreTextbox.Value)
				Catch
					aScore = 0
				End Try
				'aRegex = new RegularExpressionValidator()
				'aRegex.ValidationExpression = "^([1234]{1})(\.)(\d{1})$|^(5\.0)$"
				'aRegex.ControlToValidate = aScore
				'aRegex.Validate
				If aScore < 1.0 or aScore > 5.0 Then
					errMsg = "Please enter a valid score (i.e., 1.0, 1.2, etc.) that is formatted with one decimal place and is within the range 1.0 to 5.0, inclusive."
					isValidScore = False
				Else
					aWftaDO("ReviewRating") = Convert.ToDouble(aScoreTextbox.Value)
					WebSession.DataObjectFactory.SaveDataObject(aWftaDO)
				End If
			End If
		End If
	End Sub

	Public Sub SaveAllPanelScores()
		Dim aDOList As cDataObjectList
		Dim aDO As cDataObject
		aDOList = CType(DataObjectCollection("BioMedPanelReviewList"), cDataObjectList)
		For Each aDO In aDOList
			SavePanelScore(aDO.GetPropertyString("RevWftaID"))
		Next
	End Sub
	
	Public Sub SubmitPanelScore(aWfTaskAssignmentID As String)
		'Can save blank scores, but not submit them.  Save everything but throw an error
		'if the score to submit is blank.
		Dim aScoreHash As Hashtable
		Dim aScoreTextbox As cTextBox
		ctlList = FindControl("ctlList")
		aScoreHash = ctlList.DataListCtl_GetControlCollection("ctlRating")
		aScoreTextbox = CType(aScoreHash(Convert.ToInt32(aWfTaskAssignmentID)), cTextBox)
		If aScoreTextbox.Value = "" Then
			errMsg = "Please enter a valid score (i.e., 1.0, 1.2, etc.) that is formatted with one decimal place and is within the range 1.0 to 5.0, inclusive."
			isValidScore = False
		End If
		SaveAllPanelScores()

		'Submit
		If isValidScore Then
			Dim aWftaDO As cDataObject
			aWftaDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID)
			aWftaDO("WfTaskStatusID") = 2
			aWftaDO("SubmittedDate") = System.DateTime.Now
			WebSession.DataObjectFactory.SaveDataObject(aWftaDO)
			Response.Redirect(Request.RawUrl)
		End If
	End Sub
	
	Public Sub EditPanelComments(aEditorPageKey As String, aWfTaskAssignmentID As String, aGranteeProjectID As String)
		SaveAllPanelScores()
		If isValidScore Then
			Me.EventController_NavigateToModulePageKey(aEditorPageKey, "WfTaskAssignmentID=" + aWfTaskAssignmentID, "GranteeProjectID=" + aGranteeProjectID)
		End If
	End Sub
	
	Public Sub ViewReviewerPDF(aEntityID As String, aDefinitionID As String)
		Dim aURL As String = "../../../Core/Controls/Base/pgReportOutputReader.aspx?" + _
			"EntityID=" + aEntityID + "&DefinitionID=" + aDefinitionID
		ctlNewWindowOpener.NewWindowURL = aURL
		ctlNewWindowOpener.Open()
	End Sub

End Class
End Namespace