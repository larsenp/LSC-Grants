Imports System.Xml
Imports System
Imports System.Diagnostics
Imports Core.Web.Navigation
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web
Imports EasyGrants.Correspondence

Namespace Easygrants_Web.Modules.Staff.Controls.PageContent

Public Class cLogin_Editor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

	Protected ctlUserType As cDropDown
	Protected tblAdminLbl As HtmlTable
	Protected tblStaffLbl As HtmlTable
	Protected trType As HtmlTableRow
	Protected trTypeLbl As HtmlTableRow
	protected mUser As cEGUser
	 Protected ctlLocked As cCheckBox
	Protected spnErrorMsg As HtmlGenericControl
		Protected spnCreatePassword As HtmlGenericControl
	Protected spnRecreatePassword As HtmlGenericControl
	Protected spnUserName As HtmlGenericControl
	Protected spnUserName1 As HtmlGenericControl
	Protected valUser As CustomValidator
	Protected spnNoPrimaryEmailMsg As HtmlGenericControl
'=============================================================



	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		ctlUserType = CType(Me.FindControl("ctlUserType"), cDropDown)
		Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		mUser = aUser
		
		If aUser.AccessLevel < 3 Then
			'tblAdminLbl.Visible = False
			trType.Visible = False
		else
			tblStaffLbl.Visible = False
			trTypeLbl.Visible = False
		End If

		Dim aUserDO As cDataObject = DataObjectCollection("User")(0)
		If aUserDO.IsNewDataObject Then
			spnRecreatePassword.Visible = False
			spnUserName1.visible = False
		Else
			spnCreatePassword.Visible = False
			spnUserName.visible = False
		End If
	End Sub

'--------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetValues()
		mybase.CoreCtl_SetValues()
		
        
        
        If mUser.AccessLevel < 3 Then
			ctlUserType.SelectedField = 1
		End If
	End Sub	
	
'--------------------------------------------------------------
'Invoked by EventController_ControlValidate
	Public Function ValidateDuplicateUserName(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aXmlDoc As cXMLDoc
		Dim aDataObject As cDataObject

		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("User", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserName", aArgs.Value))
		aDataObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

		If aDataObject Is Nothing Then
			ValidateDuplicateUserName = True
		Else
			If aDataObject.GetPropertyInt("UserID") = CType(Request.QueryString("UserID"), Integer) Then
				ValidateDuplicateUserName = True
			Else
				ValidateDuplicateUserName = False
			End If			
		End If
	End Function

	Public Sub ValidateIfUserExist(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

		Dim aUserDo As cDataObject = DataObjectCollection("User")(0)
		If aUserDo.IsNewDataObject() Then
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True
		End If
   End Sub

Public Sub SendPassword()
			Dim aUserDO As cDataObject = DataObjectCollection("User")(0)
			If aUserDO("UserID").ToString <> "" Then
				Dim aCorrespondenceDefinitionID As String
				Dim aCorrespondenceDefinition As cDataObject
				aCorrespondenceDefinitionID = "12"
				aCorrespondenceDefinition = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("CorrespondenceDefinition", aCorrespondenceDefinitionID)
				Dim aUserID As Integer = CType(WebSession.User("cEGStaffUser"), cEGUser).UserID
				Dim aCorrespondenceJob As cCorrespondenceJob = New cCorrespondenceJob(aUserID)
				aCorrespondenceJob.EmailArgs = New cEmailArgsDataObject(aUserDO.DataObjectList)
				aCorrespondenceJob.CorrespondenceDefinition = aCorrespondenceDefinition
				aCorrespondenceJob.SendEmail(WebSession.DataObjectFactory.Appl)
				aUserDO("PasswordLastSentDate") = DateTime.Now
				aUserDO.SaveData()
				CorePage.Redirect()
				spnErrorMsg.Visible = False
			Else
				spnErrorMsg.Visible = True
			End If
		End Sub

		


Protected Overrides Sub DataPresenter_SetDataObjectValuesFromCtls(ByRef aDataObjectList As cDataObjectList, ByVal aDataObjectElement As XmlNode)
 Dim aRndNum As Random = New Random()
		MyBase.DataPresenter_SetDataObjectValuesFromCtls(aDataObjectList, aDataObjectElement)
		If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "User" And aDataObjectList.Count > 0 Then
			Dim aUserDO As cDataObject = aDataObjectList(0)
			'If this is a new user record, assign a password before saving.
			'If aDataObjectList(0).IsNewDataObject Then
			'	Dim aPersonDO As cDataObject = CType(DataObjectCollection("Person"), cDataObjectList)(0)
			'	aUserDO("UserName") = aPersonDO.GetRelatedPropertyString("PersonPrimaryEMail.ContactValue1")
			'	aUserDO("Password") = aRndNum.Next(1000000, 1000000999).ToString()
			'End If

			'Check the number of failed attempts against the value of the "Locked" checkbox. If they are
			'out of sync, this means the user has clicked the checkbox. Update the value.
			If ctlLocked Is Nothing Then
				ctlLocked = CType(Me.FindControl("ctlLocked"), cCheckBox)
			End If
			If aUserDO.GetPropertyInt("FailedAttempts", 0) >= WebAppl.MaxFailedLoginAttempts And ctlLocked.Value = False Then
				aUserDO("FailedAttempts") = 0
			End If
			If aUserDO.GetPropertyInt("FailedAttempts", 0) < WebAppl.MaxFailedLoginAttempts And ctlLocked.Value = True Then
				aUserDO("FailedAttempts") = WebAppl.MaxFailedLoginAttempts
			End If
		End If
	End Sub

Public Sub CreatePassword()
		Dim aRndNum As Random = New Random()
		'This method does not save data. It must be called in the context of a save (e.g., from an Action method where AutoSave='True')
		Dim aPersonDO As cDataObject = CType(DataObjectCollection("Person"), cDataObjectList)(0)
		Dim aPrimaryEmail As String = aPersonDO.GetRelatedPropertyString("PersonPrimaryEMail.ContactValue1")
		If aPrimaryEmail = "" Then
		spnNoPrimaryEmailMsg.Visible = True
			Exit Sub
		End If
		Dim aUserDo As cDataObject = DataObjectCollection("User")(0)
		aUserDo("ChangePasswordNextLogin") = True
		aUserDo("ModifyDate") = DateTime.Now
		aUserDo("UserName") = aPrimaryEmail
		aUserDo("Password") = aRndNum.Next(1000000, 1000000999).ToString()
		aUserDo("PersonID") = aPersonDO("PersonID")
		aUserDo("UserTypeID") = ctlUserType.SelectedValue
		aUserDo("CreateDate") = System.DateTime.Now
		aUserDo("CreateUser") = mUser.UserID
		aUserDo.SaveData()
		'CreatingPassword = True
		'If EventController_Save() = False Then Exit Sub
		CorePage.Redirect("UserID", aUserDo.GetPropertyString("UserID"))
	End Sub
End Class 'cLogin_Editor

End Namespace 'Easygrants_Web.Modules.Staff.Controls.PageContent