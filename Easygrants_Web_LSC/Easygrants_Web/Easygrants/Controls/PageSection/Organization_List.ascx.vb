Imports Core.DataAccess
Imports Core.Web
Imports EasyGrants.Web.User
Imports Core.Web.Modules


Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cOrganization_List
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================

	protected spnWinRedirect as HtmlGenericControl
	protected spnWinClose as HtmlGenericControl
	protected spnWinOpen as HtmlGenericControl
    Protected mURL As String
    Protected spnEINTable As HtmlTableRow
	'Protected trName As HtmlTableRow
	Protected spnNewOrganization As HtmlGenericControl
	Protected spnOrgNameTable As HtmlTableRow

	
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
        Public ReadOnly Property EIN() As String
            Get
                If Not Request.QueryString("EIN") Is Nothing Then Return Request.QueryString("EIN")
                Return ""
            End Get
        End Property

        Public ReadOnly Property OrganizationName() As String
            Get
                If Not Request.QueryString("CommonOrgName") Is Nothing Then Return Request.QueryString("CommonOrgName")

                Return ""
            End Get
        End Property

        '-------------------------------------------------------------

        Public Sub Redirect(ByVal aOrganizationID As String)
            URL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "PageFrame", "Print")
            URL = cWebLib.RemoveQuerystringParameter(URL, "ReturnURL")
            URL = cWebLib.RemoveQuerystringParameter(URL, "OrgName")
            URL = cWebLib.RemoveQuerystringParameter(URL, "OrgType")
            URL = cWebLib.AddQuerystringParameter(URL, "Page", "OrganizationContact")
            URL = cWebLib.AddQuerystringParameter(URL, "OrganizationID", aOrganizationID)
            'spnWinRedirect.Visible = True
            spnWinOpen.Visible = True
        End Sub

        '-------------------------------------------------------------
        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)
            If Request.QueryString("EINMatch") = True Then
                spnEINTable.Visible = True
				'trName.Visible = False
				spnNewOrganization.Visible = False
            Else
                spnOrgNameTable.Visible = True
            End If

        End Sub
        '-------------------------------------------------------------

        Public Sub CreateNewOrganization()
            Dim aOrganizationDO As cDataObject
            Dim aUser As cEGUser

            aOrganizationDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Organization")
            If Request.QueryString("OrgType") <> "" Then
                aOrganizationDO("OrganizationTypeID") = Request.QueryString("OrgType")
            End If
            aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)

            aOrganizationDO("CommonOrganizationName") = Session("CommonOrgName")
            aOrganizationDO("EIN") = Session("EIN")
            'aOrganizationDO("Acronym") = Session("Acronym")
            aOrganizationDO("OrganizationTypeID") = Session("OrgType")
            aOrganizationDO("OrganizationName") = Session("OrgName")
            'aOrganizationDO("AnnualOperatingBudget") = Session("AnnualBudget")
            'aOrganizationDO("FiscalYearBeginDate") = Session("FiscalBeginDate")
            'aOrganizationDO("FiscalYearEndDate") = Session("FiscalEndDate")
            aOrganizationDO("CreateDate") = Date.Now
            aOrganizationDO("CreateUser") = aUser.UserID
            'aOrganizationDO("IsEligible") = Request.QueryString("Elig")
            'aOrganizationDO("IsTranslationalPartner") = Request.QueryString("Ptnr")
            'aOrganizationDO("IsTranslationalPartnerApplicant") = Request.QueryString("Appl")

            WebSession.DataObjectFactory.SaveDataObject(aOrganizationDO)

			'save primary business address 
            Dim aAddressDO As cDataObject
            aAddressDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Address")
            aAddressDO("EntityID") = aOrganizationDO("OrganizationID")
            aAddressDO("EntityTypeID") = 2
            aAddressDO("AddressTypeID") = 3
            aAddressDO("IsPrimary") = True
            aAddressDO("Address1") = Session("Address1")
            aAddressDO("Address2") = Session("Address2")
            aAddressDO("Address3") = Session("Address3")
            aAddressDO("City") = Request.QueryString("City")
            aAddressDO("StateID") = Request.QueryString("StateID")
            aAddressDO("CountryID") = Session("CountryID")
            if CType(me.Session("OtherRegion"), String) <> "" then
				aAddressDO("OtherRegion") = Session("OtherRegion")
			end if
            aAddressDO("Zip") = Session("Zip")
            aAddressDO("CreateDate") = Date.Now
            aAddressDO("CreateUser") = aUser.UserID

            WebSession.DataObjectFactory.SaveDataObject(aAddressDO)

			'save primary business Webaddress 
            if CType(me.Session("WebAddress"), String) <> "" then
				Dim aWebAddressDO As cDataObject
				aWebAddressDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WebAddress")
				aWebAddressDO("EntityID") = aOrganizationDO("OrganizationID")
				aWebAddressDO("EntityTypeID") = 2
				aWebAddressDO("WebAddressTypeID") = 1
				aWebAddressDO("IsPrimary") = True
				aWebAddressDO("WebAddress") = Session("WebAddress")
				aWebAddressDO("CreateDate") = Date.Now
                aWebAddressDO("CreateUser") = aUser.UserID

				WebSession.DataObjectFactory.SaveDataObject(aWebAddressDO)
			end if
			
			'save primary business Phone 
			if CType(me.Session("Phone"), String) <> "" then
				Dim aPhoneDO As cDataObject
				aPhoneDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Phone")
				aPhoneDO("EntityID") = aOrganizationDO("OrganizationID")
				aPhoneDO("EntityTypeID") = 2
				aPhoneDO("PhoneTypeID") = 1
				aPhoneDO("IsPrimary") = True
				aPhoneDO("ContactValue1") = Session("Phone")
				aPhoneDO("CreateDate") = Date.Now
                aPhoneDO("CreateUser") = aUser.UserID

				WebSession.DataObjectFactory.SaveDataObject(aPhoneDO)
			end if
			
            Session.Remove("OrgName")
            'Session.Remove("Acronym")
            'Session.Remove("AnnualBudget")
            'Session.Remove("FiscalBeginDate")
            'Session.Remove("FiscalEndDate")
            Session.Remove("CommonOrgName")
            Session.Remove("EIN")
            Session.Remove("Address1")
            Session.Remove("Address2")
            Session.Remove("Address3")
            Session.Remove("City")
            Session.Remove("StateID")
            Session.Remove("Zip")
            Session.Remove("CountryID")
            Session.Remove("WebAddress")
            Session.Remove("Phone")
            if CType(me.Session("OtherRegion"), String) <> "" then 
				Session.Remove("OtherRegion")
			end if

            'Session.Clear()

           
           
            Dim aURL As String = Request.RawUrl.ToString()
			
			'if matching occurs from PersonOrgAffil editor, need to re-direct back and pre-populate data points, 
			'  otherwise, re-direct to Organization Details page, kda 3/21/06
			if request.QueryString("Src") = "PersonOrgAffilEditor" then
				'dim aOrgDO as cDataObject = CType(DataObjectCollection("Organization"), cDataObjectList)(0)
				Session.Add("AddNewOrg", "True")
				EventController_NavigateToModulePageKey("EditOrganization", "OrganizationID=" + aOrganizationDO.GetRelatedPropertyInt("OrganizationID").ToString(), "Src=" + request.QueryString("Src").ToString(), _
				"ReturnURL=" + WebAppl.Build_RootURL("Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&Page=PersonOrgAffiliation&PersonOrganizationAffiliationID=" _
				+ Session("PersonOrgAffID") + "&PersonID=" + Session("PersonID")+ "&OrganizationID=" + aOrganizationDO.GetRelatedPropertyInt("OrganizationID").ToString() + "&Origin=" + Session("Origin") _
				+ "&ReturnURL=" + WebAppl.Build_RootURL("Implementation%2fModules%2fStaff%2fModuleContent.aspx%3fConfig%3dModuleConfig%26Page%3dPersonContact%26PersonID%3d" + Session("PersonID"))))
			else
				aURL = cWebLib.RemoveQuerystringParameter(aURL, "CommonOrgName")
				aURL = cWebLib.RemoveQuerystringParameter(aURL, "OrgName")
				aURL = cWebLib.RemoveQuerystringParameter(aURL, "City")
				aURL = cWebLib.RemoveQuerystringParameter(aURL, "StateID")
				aURL = cWebLib.RemoveQuerystringParameter(aURL, "EINMatch")
				aURL = cWebLib.RemoveQuerystringParameter(aURL, "ReturnURL")
				aURL = cWebLib.RemoveQuerystringParameter(aURL, "CancelURL")
				'if "Match" parameter is added to qs, which will only occur when Cancel is clicked on Matching Org page(kda, 3/21/06)
				if me.Request.QueryString("Match") <> "" then
					aURL = cWebLib.RemoveQuerystringParameter(aURL, "Match")
				end if
				aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "OrganizationContact")
				aURL = cWebLib.AddQuerystringParameter(aURL, "OrganizationID", aOrganizationDO.GetPropertyInt("OrganizationID", 0))
				Response.Redirect(aURL)
			end if
			
			
            'EventController_NavigateToModulePageKey("OrganizationContact")
            'EventController_NavigateToModulePageKey("OrganizationContact", "OrganizationID=" + aOrganizationDO.GetPropertyInt("OrganizationID", 0))


            'Dim aURL As String
            'aURL = Request.QueryString("ReturnURL")
            'If aURL = "" Then
            '    Response.Redirect(Request.Url.ToString())
            'Else
            '    aURL = cWebLib.AddQuerystringParameter(aURL, "OrganizationID", aOrganizationDO.GetPropertyInt("OrganizationID", 0))
            '    Response.Redirect(aURL)
            'End If

        End Sub

        '-------------------------------------------------------------

        Public Sub Cancel()
            
            If Not Request.QueryString("CancelURL") Is Nothing Then
				'Dim aURL As String = cWebLib.AddQuerystringParameter(Request.QueryString("CancelURL"), "Src", "Match")
				Dim aURL As String = cWebLib.AddQuerystringParameter(Request.QueryString("CancelURL"), "Match", "True")
				Me.EventController_NavigateToURL(aURL)
			End If
            
            If Request.QueryString("ReturnURL") Is Nothing Then
                EventController_NavigateToModulePageKey("Contact")
            Else
                EventController_NavigateToModulePageKey("Contacts")
            End If
        End Sub

        '=============================================================

		Private Sub InitializeComponent()

		End Sub
End Class
End Namespace