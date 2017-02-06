Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Xml
Imports System.Reflection
Imports Core.Web.User
Imports Core.DataAccess
Imports Core.DataAccess.DBAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules
Imports Core.Web.SvrCtls
Imports Core_Web.Controls.Base
Imports Core.Util
Imports System.Net
Imports EasyGrants.Web.User
Imports System.Text.RegularExpressions

Namespace Core_Web.Controls.Sharepoint

Public Class cSharepointLib
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

	Public Sub RenameFolder(ByVal aEventTypeID As Integer, ByVal aDefinitionKey As String, ByVal aUniqueID As Integer, ByVal aOldFolderName As String, ByVal aNewFolderName As String, ByVal aSPIntegrationDO As cDataObject, ByVal aTypeDO As cDataObject)
		Dim aRenameStatus As Boolean

		'Here we are getting the FolderUrl and then Truncating it to 128 characters as sharepoint supports only supports 128 character Folder Name
		Dim aOldFONameUrl As String = GetFolderUrl(aEventTypeID, aSPIntegrationDO, aTypeDO, aOldFolderName)
		'aOldFONameUrl = cWebLib.TruncateFolderName(aOldFONameUrl)
		Dim aNewFONameUrl As String = GetFolderUrl(aEventTypeID, aSPIntegrationDO, aTypeDO, aNewFolderName)
		'aNewFONameUrl = cWebLib.TruncateFolderName(aNewFONameUrl)

		Dim myCred As New System.Net.NetworkCredential(aSPIntegrationDO.GetPropertyString("UserName"), aSPIntegrationDO.GetPropertyString("Password"))
		Dim aSPUrl As String = cWebLib.GetFormattedUrl(aSPIntegrationDO.GetPropertyString("SharePointURL"))

		Dim aEgSPService As EgSharepointService.EasygrantsSharepointService = New EgSharepointService.EasygrantsSharepointService
		aEgSPService.Url = aSPUrl & "_vti_bin/EasygrantsSharepointService.asmx"
		aEgSPService.Credentials = myCred
		Try
			'Here when the old Folder exists , it will update it to new folder . but if oldfolder doesn't exists then we don't do any thing to update. it returns false.
			aRenameStatus = aEgSPService.Rename(aOldFONameUrl, aNewFONameUrl)

		Catch we As WebException
			If we.Status = WebExceptionStatus.ConnectFailure Then
				LogSharePointUpdate(aEventTypeID, aDefinitionKey, aUniqueID, aOldFolderName, aNewFolderName)
			End If
		Catch ex As Exception

		End Try
	End Sub

	Public Sub LogSharePointUpdate(ByVal aEventTypeID As Integer, ByVal aDefinitionKey As String, ByVal UniqueID As Integer, ByVal OldValue As String, ByVal NewValue As String)
		Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		Dim aSharePointLog As cDataObject = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("SharePointLog")

		aSharePointLog("EventTypeID") = aEventTypeID
		aSharePointLog("DefinitionKey") = aDefinitionKey
		aSharePointLog("UniqueID") = UniqueID
		aSharePointLog("OldValue") = OldValue
		aSharePointLog("NewValue") = NewValue
		aSharePointLog("SharepointConversionStatus") = 0
		aSharePointLog("CreateDate") = DateAndTime.Now
		aSharePointLog("CreateUser") = aUser.UserID
		WebSession.DataObjectFactory.SaveDataObject(aSharePointLog)
	End Sub

	Public Function TruncateSpecialCharacters(ByVal aSPIntegrationDO As cDataObject, ByVal aFolderName As String)
		'string pattern = "[^~\"#%&*:<>?\\//{|}.]*"
		Return Regex.Replace(aFolderName, aSPIntegrationDO.GetPropertyString("InvalidCharacterRegex"), "")
	End Function


	Public Function GetFolderUrl(ByVal aEventTypeID As Integer, ByVal aSPIntegrationDO As cDataObject, ByVal aTypeDO As cDataObject, ByVal aFolderName As String) As String
		Dim aUrl As String = ""
		Dim aSPUrl As String
		Dim aSiteName As String
		Dim aGrantsName As String
		Dim aProgName As String
		Dim aFOName As String
		Dim aContactsName As String
		Dim aPersons As String
		Dim aOrganizations As String

		aSPUrl = cWebLib.GetFormattedUrl(aSPIntegrationDO.GetPropertyString("SharePointURL"))
		aSiteName = cWebLib.GetFormattedUrl(aSPIntegrationDO.GetPropertyString("SiteName"))
		If aEventTypeID = 1 Then
			aGrantsName = "Grants"

			aUrl = aSPUrl & aSiteName & aGrantsName & "/" & aFolderName
		ElseIf aEventTypeID = 2 Then
			aGrantsName = "Grants/"
			aProgName = aTypeDO.GetPropertyString("ProgramID") & "_" & TruncateSpecialCharacters(aSPIntegrationDO, aTypeDO.GetRelatedPropertyString("WfProgram.ShortName"))

			aUrl = aSPUrl & aSiteName & aGrantsName & aProgName & "/" & aFolderName
		ElseIf aEventTypeID = 3 Then
			aGrantsName = "Grants/"

			aFOName = aTypeDO.GetPropertyString("CompetitionID") & "_" & TruncateSpecialCharacters(aSPIntegrationDO, aTypeDO.GetRelatedPropertyString("WfCompetition.ShortName"))
			aProgName = aTypeDO.GetRelatedPropertyString("WfCompetition.ProgramID") & "_" & TruncateSpecialCharacters(aSPIntegrationDO, aTypeDO.GetRelatedPropertyString("WfCompetition.WfProgram.ShortName"))

			aUrl = aSPUrl & aSiteName & aGrantsName & aProgName & "/" & aFOName & "/" & aFolderName
		ElseIf aEventTypeID = 4 Then

			aContactsName = "Contacts/"
			aPersons = "Persons"

			aUrl = aSPUrl & aSiteName & aContactsName & aPersons & "/" & aFolderName

		ElseIf aEventTypeID = 5 Then

			aContactsName = "Contacts/"
			aOrganizations = "Organizations"

			aUrl = aSPUrl & aSiteName & aContactsName & aOrganizations & "/" & aFolderName

		ElseIf aEventTypeID = 6 Then
			aGrantsName = "Projects/"

			aUrl = aSPUrl & aSiteName & aGrantsName & aFolderName
		End If

		Return cWebLib.TruncateFolderName(aUrl)
	End Function


End Class

End Namespace
