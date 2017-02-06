Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User
Imports Easygrants_Web.Controls.Base
Imports Core.Web

Namespace Implementation.Modules.ThirdParty.PageContent

Public MustInherit Class cCouncilSponsor_Uploads
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
	protected valRexText as RegularExpressionValidator
	protected valReqSelect as RequiredFieldValidator

'=================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

	End Sub

'-------------------------------------------------

	Public Sub SubmissionContent_Submit()
		Dim aSubmitPage as cSubmissionModulePage	
		'dim aFilesList as cDataObjectList
		'dim aFileObj as cDataObject
		'dim aStatus as Integer
		'dim aWfTaskAssignmentDO as cDataObject
		
		valUpload.Enabled = True
		
		if MyBase.EventController_Save() = False then exit sub
		
		ctlAHAMembershipNo = CType(Me.FindControl("ctlAHAMembershipNo"), cTextBox)
		
		if ctlAHAMembershipNo.Value = "" then
			ctlAHAMembershipNo.RequiredFieldValidator.IsValid = False
		else
			ctlAHAMembershipNo.RequiredFieldValidator.IsValid = False
		end if
		
		aSubmitPage = CType(Page, cSubmissionModulePage)
		aSubmitPage.Submit(False)

	End Sub
	
'==============================================================

	Public Sub ViewAppPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String
		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
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
				If aFileObj.GetPropertyInt("FileTypeID") = 38 Then
					aStatus = aFileObj.GetPropertyInt("ConversionStatus", 0)
					Exit For
				End If
			Next
		Else
			aStatus = 3
		End If

		ctlAHAMembershipNo = CType(Me.FindControl("ctlAHAMembershipNo"), cTextBox)
				
		Select Case aStatus
			Case 3
				valUpload.ErrorMessage = "The Letter of Support file is required before you may submit."
				aArgs.IsValid = False
				exit Sub				
			Case System.Int32.MinValue
				valUpload.ErrorMessage = "You must upload your Letter of Support file."				
				aArgs.IsValid = False
				exit Sub		
			Case >=0
				valUpload.ErrorMessage = "The Letter of Support file is in the queue awaiting processing by the system."				
				aArgs.IsValid = False
				exit Sub
			Case -2, -3  'File not converted - -2: not valid, -3: exception caught
				valUpload.ErrorMessage = "There was an error while the system processed the Letter of Support file.  Please click the <font color='black'><b>View PDF</b></font> button to view the specific error message."				
				aArgs.IsValid = False
				exit Sub
		End Select					
   End Sub 
   
'=================================================
End Class
End Namespace