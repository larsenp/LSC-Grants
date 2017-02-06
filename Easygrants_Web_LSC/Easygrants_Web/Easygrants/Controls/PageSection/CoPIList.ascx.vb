Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cCoPIList
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================

	protected spnWinRedirect as HtmlGenericControl
	protected spnWinClose as HtmlGenericControl
	protected spnWinOpen as HtmlGenericControl
	protected mURL as String
	
'=============================================================

	Public Property URL() As String
		Get
			Return mURL
		End Get
		Set(ByVal Value As String)
			mURL = Value
		End Set
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property FirstName() As String
		Get
			If Not Request.QueryString("first") Is Nothing Then Return Request.QueryString("First")

			Return ""
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property LastName() As String
		Get
			If Not Request.QueryString("last") Is Nothing Then Return Request.QueryString("Last")

			Return ""
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property MiddleName() As String
		Get
			If Not Request.QueryString("middle") Is Nothing Then Return Request.QueryString("middle")

			Return ""
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property Email() As String
		Get
			If Not Request.QueryString("email") Is Nothing Then Return Request.QueryString("email")

			Return ""
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property GPDC() As String
		Get
			If Not Request.QueryString("PersonRelationshipID") Is Nothing Then 
				Return Request.QueryString("PersonRelationshipID")
			Else
				Return ""
			End If
		End Get
	End Property

'-------------------------------------------------------------
	Public Sub Redirect(ByVal aPersonID as String)
		URL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "PageFrame", "Print")
		URL = cWebLib.RemoveQuerystringParameter(URL, "first")
		URL = cWebLib.AddQuerystringParameter(URL, "Page", "Contact")
		URL = cWebLib.AddQuerystringParameter(URL, "PersonID", aPersonID)
		'spnWinRedirect.Visible = True
		spnWinOpen.Visible = True
	End Sub
	
'-------------------------------------------------------------

	Public Sub SelectPerson(ByVal aPersonID as String)
		Dim aGPDC As cDataObject
		aGPDC = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProjectPI", CType(GPDC, Integer))

        Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
        Dim aPersonDO As cDataObject
        Dim aUserDOList As cDataObjectList
        Dim aUserDO As cDataObject
        Dim aLoginUserName As String

        aPersonDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", CType(aPersonID, Integer))
        aUserDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("User", "PersonID", CType(aPersonID, Integer))
        if aUserDOList.Count > 0 then aLoginUserName = aUserDOList(0).GetPropertyString("UserName")

        If Not aGPDC Is Nothing Then
            aGPDC("PersonID") = aPersonID
            aGPDC("GranteeProjectID") = aUser.GranteeProjectID
			aGPDC("PITypeID") = 2
			aGPDC("EntityTypeID") = 1
            'aGPDC("RelatedPersonID") = aPersonID
            'aGPDC("RelatePersonDisplayPrefix") = aPersonDO.GetPropertyInt("PrefixID", 0)
            'aGPDC("RelatePersonDisplaySuffixID") = aPersonDO.GetPropertyInt("SuffixID", 0)
            aGPDC("FirstName") = aPersonDO.GetPropertyString("FirstName", "")
            aGPDC("MiddleName") = aPersonDO.GetPropertyString("MiddleName", "")
            aGPDC("LastName") = aPersonDO.GetPropertyString("LastName", "")
            aGPDC("Degree") = aPersonDO.GetPropertyString("Degree", "")

            aGPDC("Address1") = aPersonDO.GetRelatedPropertyString("PrimaryAddress.Address1")
            aGPDC("Address2") = aPersonDO.GetRelatedPropertyString("PrimaryAddress.Address2")
            aGPDC("Address3") = aPersonDO.GetRelatedPropertyString("PrimaryAddress.Address3")
            aGPDC("City") = aPersonDO.GetRelatedPropertyString("PrimaryAddress.City")
            aGPDC("StateID") = aPersonDO.GetRelatedPropertyInt("PrimaryAddress.StateID")
            aGPDC("CountryID") = aPersonDO.GetRelatedPropertyInt("PrimaryAddress.CountryID")
            aGPDC("Zip") = aPersonDO.GetRelatedPropertyString("PrimaryAddress.Zip")
            aGPDC("Title") = aPersonDO.GetRelatedPropertyString("PrimaryAddress.Title")

            aGPDC("PhoneNumber") = aPersonDO.GetRelatedPropertyString("PersonPrimaryPhone.ContactValue1")
            aGPDC("Email") = aPersonDO.GetRelatedPropertyString("PersonPrimaryEMail.ContactValue1")

            'aGPDC("RelatedPersonRoleID") = 11

            WebSession.DataObjectFactory.SaveDataObject(aGPDC)


            If aPersonDO Is Nothing And aLoginUserName = "" Then

                Dim aList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("User", "PersonID", aPersonID)

                If aList.Count = 0 Then
                    aUserDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("User")
                    aUserDO("PersonID") = aPersonID
                    aUserDO("UserName") = aPersonDO.GetRelatedPropertyString("PersonPrimaryEMail.ContactValue1")
                    Dim aRndNum As Random = New Random()
                    aUserDO("Password") = aRndNum.Next(1000000, 1000000999).ToString()
                    aUserDO("UserTypeID") = 1 'Applicant
                    WebSession.DataObjectFactory.SaveDataObject(aUserDO)
                End If
            End If
                EventController_NavigateToModulePageKey("PrincipalInvestigator")
        End If
 
	End Sub
	
'-------------------------------------------------------------

	Public Sub CreateNewPerson()
		Dim aGPDC As cDataObject
		aGPDC = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProjectDepartmentChair", CType(GPDC, Integer))
		If Not aGPDC Is Nothing Then
			'Create Person record
			Dim aPersonDO As cDataObject
			aPersonDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Person")
			aPersonDO("PrefixID") = aGPDC("PrefixID")
			aPersonDO("SuffixID") = aGPDC("SuffixID")
			aPersonDO("FirstName") = aGPDC("FirstName")
			aPersonDO("MiddleName") = aGPDC("MiddleName")
			aPersonDO("LastName") = aGPDC("LastName")
			aPersonDO("Degree") = aGPDC("Degree")
			WebSession.DataObjectFactory.SaveDataObject(aPersonDO)
		
			'Create User record
			Dim aUserDO As cDataObject
			aUserDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("User")
			aUserDO("PersonID") = aPersonDO("PersonID")
			aUserDO("UserName") = aGPDC("Email")
			Dim aRndNum As Random = New Random()
			aUserDO("Password") = aRndNum.Next(1000000, 1000000999).ToString()
			aUserDO("UserTypeID") = 1 'Applicant
			WebSession.DataObjectFactory.SaveDataObject(aUserDO)

			'Create Address record
			Dim aAddressDO As cDataObject
			aAddressDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Address")
			aAddressDO("EntityID") = aPersonDO("PersonID")
			aAddressDO("EntityTypeID") = 1 'person
			aAddressDO("Address1") = aGPDC("Address1")
			aAddressDO("Address2") = aGPDC("Address2")
			aAddressDO("Address3") = aGPDC("Address3")
			aAddressDO("City") = aGPDC("City")
			aAddressDO("StateID") = aGPDC("StateID")
			aAddressDO("CountryID") = aGPDC("CountryID")
			aAddressDO("Zip") = aGPDC("Zip")
			aAddressDO("Title") = aGPDC("Title")
			aAddressDO("IsPrimary") = True
			WebSession.DataObjectFactory.SaveDataObject(aAddressDO)

			'Create Email record
			Dim aEmailDO As cDataObject
			aEmailDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Email")
			aEmailDO("EntityID") = aPersonDO("PersonID")
			aEmailDO("EntityTypeID") = 1 'person
			aEmailDO("ContactValue1") = aGPDC("Email")
			aEmailDO("EmailTypeID") = 1 'business
			aEmailDO("IsPrimary") = True
			WebSession.DataObjectFactory.SaveDataObject(aEmailDO)

			'Create Phone record
			Dim aPhoneDO As cDataObject
			aPhoneDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Phone")
			aPhoneDO("EntityID") = aPersonDO("PersonID")
			aPhoneDO("EntityTypeID") = 1 'person
			aPhoneDO("ContactValue1") = aGPDC("PhoneNumber")
			aPhoneDO("PhoneTypeID") = 1 'work
			aPhoneDO("IsPrimary") = True
			WebSession.DataObjectFactory.SaveDataObject(aPhoneDO)
		
			aGPDC("PersonID")  = aPersonDO("PersonID")
			WebSession.DataObjectFactory.SaveDataObject(aGPDC)
			EventController_NavigateToModulePageKey("AdditionalInstitutionContacts")
		End If		
	End Sub

'-------------------------------------------------------------

	Public Sub Cancel()
		Dim aGPDC As cDataObject
		aGPDC = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProjectPI", CType(GPDC, Integer))
		If Not aGPDC Is Nothing Then
			WebSession.DataObjectFactory.DeleteData(aGPDC)
			EventController_NavigateToModulePageKey("PrincipalInvestigator")
		End If		
	End Sub

'=============================================================
End Class
End Namespace