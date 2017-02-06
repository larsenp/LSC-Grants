Imports Core.DataAccess
Imports Core.Web
Imports EasyGrants.Web
Imports EasyGrants.Web.Modules
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.ThirdParty.PageContent

Public MustInherit Class cThirdParty_Uploads
    Inherits Easygrants_Web.Controls.Base.cValidationDataPresenterCtl
'=================================================

    Protected spnInvalidText As HtmlGenericControl
    Protected spnNoReportText As HtmlGenericControl
    Protected spnSubmitText As HtmlGenericControl
    Protected spnSubmitButton As HtmlGenericControl
    
	Protected mForceGen As Boolean = True
	
	protected valUpload as CustomValidator
	protected ctlLetterSupportUpload as cUploadSaveAll
	protected ctlAHAMembershipNo as cTextBox
	
	protected lblValidationMessage as Label
	Protected ctlNewWindowOpener As cNewWindowOpener

'=================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

'-------------------------------------------------

	Public Sub SubmissionContent_Submit()
		Dim aSubmitPage as cSubmissionModulePage	
		dim aFilesList as cDataObjectList
		dim aFileObj as cDataObject
		dim aStatus as Integer
		dim aWfTaskAssignmentDO as cDataObject
		
		aSubmitPage = CType(Page, cSubmissionModulePage)
		aSubmitPage.Submit(False)
	End Sub
	
'-----------------------------------------------------
  
    Public Sub ValidateUpload(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		dim aFilesList as cDataObjectList
		dim aFileObj as cDataObject
		dim aStatus as Integer
		dim aWfTaskAssignmentDO as cDataObject
		
		aWfTaskAssignmentDO = Me.DataObjectCollection("WfTaskAssignment")(0)				

		aFilesList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile","EntityID",aWfTaskAssignmentDO.GetPropertyInt("WfTaskAssignmentID"))
		If aFilesList.Count > 0 Then
			For Each aFileObj In aFilesList
				If aFileObj.GetPropertyInt("FileTypeID") = 41 Then
					aStatus = aFileObj.GetPropertyInt("ConversionStatus", 0)
					Exit For
				End If
			Next
		Else
			aStatus = 3
		End If
				
		Select Case aStatus
			Case 3
				valUpload.ErrorMessage = "The Document Upload file is required before you may submit."
				aArgs.IsValid = False
				exit Sub				
			Case System.Int32.MinValue
				valUpload.ErrorMessage = "The Document Upload file is required before you may submit."				
				aArgs.IsValid = False
				exit Sub		
			Case >=0
				valUpload.ErrorMessage = "The Document Upload file is in the queue awaiting processing by the system."				
				aArgs.IsValid = False
				exit Sub
			Case -2, -3  'File not converted - -2: not valid, -3: exception caught
				valUpload.ErrorMessage = "There was an error while the system processed the Document Upload file.  Please click the <font color='black'><b>View PDF</b></font> button to view the specific error message."				
				aArgs.IsValid = False
				exit Sub
		End Select					
   End Sub 	
   
'==============================================================

	Public Sub ViewAppPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String
		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub	
'=================================================
End Class
End Namespace