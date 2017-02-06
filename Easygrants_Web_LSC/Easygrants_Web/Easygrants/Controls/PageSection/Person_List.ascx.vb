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
Public MustInherit Class cPerson_List
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================

	protected spnWinRedirect as HtmlGenericControl
	protected spnWinClose as HtmlGenericControl
	protected spnWinOpen as HtmlGenericControl
	protected mURL as String
	'Protected trName As HtmlTableRow
	Protected spnNewPerson As HtmlGenericControl
	protected tblMatchText as HtmlTable
	protected tblEmailMatchText as HtmlTable
	protected tblName as HtmlTable
	protected tblEmail as HtmlTable
	
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

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		'If there is an e-mail match, do not display the link to allow creation of the new person.
		If Request.QueryString("EmailMatch") = "True" Then
			'trName.Visible = False
			spnNewPerson.Visible = False
		'only displaying email match text and section only when in edit person mode, kda 3/21/06
		ElseIf Me.Request.QueryString("EmailMatchOnly") = "True" Or CType(Session("EmailMatchOnly"), String) <> "" Then
			tblMatchText.Visible = False
			tblEmailMatchText.Visible = True
			tblName.Visible = False
			'trName.Visible = False
			spnNewPerson.Visible = False
		End If
			
	End Sub
	
'-----------------------------------------------------

        Public Overrides Sub LoadConfigXML()
            MyBase.LoadConfigXML()
           	
           	'need to change contact details display url property for Profile module.  This property basically sets Postback=False
           	'  and opens up a read-only version of Contact Details, kda 3/21/06
			if CType(Page, cModulePage).CurrentModuleName = "Profile" then
				Dim aDataObjectElement As XmlElement = me.mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='Person2']")
				dim aDataListControlNode as XmlNode
				aDataListControlNode = aDataObjectElement.SelectSingleNode("DisplayProperties/DisplayProperty/Control[@Type='cDataListCtl']")
				dim aDataListDPNode as XmlNode = aDataListControlNode.SelectSingleNode("DisplayProperty[@PropertyKey='ContactDetailsDisplayURL']")
				aDataListDPNode.Attributes("PropertyKey").Value = "ProfileContactDetailsDisplayURL"
			end if
        End Sub
	
'-------------------------------------------------------------

	Public Sub Redirect(byval aPersonID as String)
		'URL = cWebLib.RemoveQuerystringParameter(Request.RawUrl.ToString(), "PageFrame")
		URL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "PageFrame", "Print")
		URL = cWebLib.RemoveQuerystringParameter(URL, "first")
		URL = cWebLib.AddQuerystringParameter(URL, "Page", "Contact")
		URL = cWebLib.AddQuerystringParameter(URL, "PersonID", aPersonID)
		'spnWinRedirect.Visible = True
		spnWinOpen.Visible = True
	End Sub
	
'-------------------------------------------------------------

	Public Sub CreateNewPerson()
	
		Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		
		Dim aPersonDO As cDataObject
		aPersonDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Person")
		
		'If Request.QueryString("Gender") <> "" Then
		'	aPersonDO("GenderID") = Request.QueryString("Gender")
		'End If
		'If Request.QueryString("Prefix") <> "" Then
		'	aPersonDO("PrefixID") = Request.QueryString("Prefix")
		'End If
		'If Request.QueryString("Suffix") <> "" Then
		'	aPersonDO("SuffixID") = Request.QueryString("Suffix")
		'End If
		'aPersonDO("FirstName") = FirstName()
		'aPersonDO("MiddleName") = MiddleName()
		'aPersonDO("LastName") = LastName()
		'aPersonDO("Degree") = Request.QueryString("Degree")
		
		'save person
            aPersonDO("FirstName") = Session("FirstName")
            If Session("InformalName") <> Nothing Then
                aPersonDO("PreferredFirstName") = Session("InformalName")
            End If
            aPersonDO("LastName") = Session("LastName")
            aPersonDO("MiddleName") = Session("MiddleName")
            aPersonDO("PrefixID") = Session("PrefixID")
            aPersonDO("SuffixID") = Session("SuffixID")
            'aPersonDO("FirstName") = Session("Email")
            If Session("GenderID") <> Nothing Then
                aPersonDO("GenderID") = Session("GenderID")
            End If
            aPersonDO("CreateDate") = Date.Now
            If aUser.UserID <> Nothing Then
                aPersonDO("CreateUser") = aUser.UserID
            End If

            WebSession.DataObjectFactory.SaveDataObject(aPersonDO)

            'save Business email (primary)
            If CType(Me.Session("Email"), String) <> "" Then
                Dim aEmailDO As cDataObject
                aEmailDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Email")
                aEmailDO("EntityID") = aPersonDO.GetPropertyInt("PersonID")
                aEmailDO("EntityTypeID") = 1
                aEmailDO("EmailTypeID") = 1
                aEmailDO("CreateDate") = Date.Now
                aEmailDO("CreateUser") = aUser.UserID
                aEmailDO("ModifyDate") = Date.Now
                aEmailDO("IsPrimary") = True
                aEmailDO("ContactValue1") = Session("Email")
                WebSession.DataObjectFactory.SaveDataObject(aEmailDO)
            End If

            'save Business address (primary)
            Dim aBusinessAddress As cDataObject
            aBusinessAddress = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Address")
            If aPersonDO.GetPropertyInt("PersonID") <> Nothing Then
                aBusinessAddress("EntityID") = aPersonDO.GetPropertyInt("PersonID")
            End If
            aBusinessAddress("EntityTypeID") = 1
            aBusinessAddress("AddressTypeID") = 3
            aBusinessAddress("CreateUser") = aUser.UserID
            aBusinessAddress("CreateDate") = Date.Now
            'aBusinessAddress("ModifyDate") = Date.Now
            If Session("Address1") <> Nothing Then
                aBusinessAddress("Address1") = Session("Address1")
            End If
            If Session("Address2") <> Nothing Then
                aBusinessAddress("Address2") = Session("Address2")
            End If
            If Session("Address3") <> Nothing Then
                aBusinessAddress("Address3") = Session("Address3")
            End If
            If Session("City") <> Nothing Then
                aBusinessAddress("City") = Session("City")
            End If
            If Session("Zip") <> Nothing Then
                aBusinessAddress("Zip") = Session("Zip")
            End If
            If Session("StateID") <> Nothing Then
                aBusinessAddress("StateID") = Session("StateID")
            End If
            If Session("CountryID") <> Nothing Then
                aBusinessAddress("CountryID") = Session("CountryID")
            End If
            aBusinessAddress("IsPrimary") = True
            WebSession.DataObjectFactory.SaveDataObject(aBusinessAddress)

            'save primary phone
            If CType(Me.Session("Phone"), String) <> "" Then
                Dim aPhone As cDataObject
                aPhone = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Phone")
                aPhone("EntityID") = aPersonDO.GetPropertyInt("PersonID")
                aPhone("EntityTypeID") = 1
                aPhone("PhoneTypeID") = 1
                aPhone("IsPrimary") = True
                aPhone("CreateUser") = aUser.UserID
                aPhone("CreateDate") = Date.Now
                aPhone("ContactValue1") = Session("Phone")
                WebSession.DataObjectFactory.SaveDataObject(aPhone)
            End If

            'save fax number
            If CType(Me.Session("Fax"), String) <> "" Then
                Dim aFax As cDataObject
                aFax = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Phone")
                aFax("EntityID") = aPersonDO.GetPropertyInt("PersonID")
                aFax("EntityTypeID") = 1
                aFax("PhoneTypeID") = 4
                aFax("CreateUser") = aUser.UserID
                aFax("CreateDate") = Date.Now
                aFax("ContactValue1") = Session("Fax")
                WebSession.DataObjectFactory.SaveDataObject(aFax)
            End If

            'save mobile phone
            If CType(Me.Session("Mobile"), String) <> "" Then
                Dim aMobile As cDataObject
                aMobile = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Phone")
                aMobile("EntityID") = aPersonDO.GetPropertyInt("PersonID")
                aMobile("EntityTypeID") = 1
                aMobile("PhoneTypeID") = 3
                aMobile("CreateUser") = aUser.UserID
                aMobile("CreateDate") = Date.Now
                aMobile("ContactValue1") = Session("Mobile")
                WebSession.DataObjectFactory.SaveDataObject(aMobile)
            End If

            'remove sessions	
            Session.Remove("FirstName")
            Session.Remove("InformalName")
            Session.Remove("LastName")
            Session.Remove("MiddleName")
            Session.Remove("PrefixID")
            Session.Remove("SuffixID")
            Session.Remove("Email")
            Session.Remove("GenderID")
            Session.Remove("Address1")
            Session.Remove("Address2")
            Session.Remove("Address3")
            Session.Remove("City")
            Session.Remove("StateID")
            Session.Remove("CountryID")
            Session.Remove("Zip")
            Session.Remove("Phone")
            Session.Remove("Fax")
            Session.Remove("Mobile")


            're-direct to appropriate page
            Dim aURL As String
            aURL = Request.QueryString("ReturnURL")
            If aURL = "" Then
                Response.Redirect(Request.Url.ToString())
                'when matching occurs from person affiliation editor from Org Details page, we re-direct back to editor and pre-populate data points, kda 3/21/06
            ElseIf Request.QueryString("Src") = "PersonOrgAffilEditor" Then
                Session.Add("AddNewPerson", "True")
                EventController_NavigateToModulePageKey("EditPerson", "PersonID=" + aPersonDO.GetPropertyInt("PersonID").ToString(), "Src=EditPerson", _
                "ReturnURL=" + WebAppl.Build_RootURL("Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&Page=PersonOrgAffiliation&PersonOrganizationAffiliationID=" _
                + Session("PersonOrgAffID") + "&PersonID=" + aPersonDO.GetPropertyInt("PersonID").ToString() + "&OrganizationID=" + Session("OrgID") + "&Origin=" + Session("Origin") _
                + "&ReturnURL=" + WebAppl.Build_RootURL("Implementation%2fModules%2fStaff%2fModuleContent.aspx%3fConfig%3dModuleConfig%26Page%3dOrganizationContact%26OrganizationID%3d" + Session("OrgID"))))
            Else
                'remove matching qs parameters, when match occurs otherwise just re-direct to Contact Details page, kda 3/21/06
                If Request.QueryString("Match") = "True" Then
                    aURL = cWebLib.RemoveQuerystringParameter(aURL, "first")
                    aURL = cWebLib.RemoveQuerystringParameter(aURL, "middle")
                    aURL = cWebLib.RemoveQuerystringParameter(aURL, "last")
                    aURL = cWebLib.RemoveQuerystringParameter(aURL, "email")
                    aURL = cWebLib.RemoveQuerystringParameter(aURL, "Page")
                    aURL = cWebLib.RemoveQuerystringParameter(aURL, "ReturnURL")
                    aURL = cWebLib.RemoveQuerystringParameter(aURL, "CancelURL")
                    If Me.Request.QueryString("Match") <> "" Then
                        aURL = cWebLib.RemoveQuerystringParameter(aURL, "Match")
                    End If
                    If Me.Request.QueryString("EmailMatch") <> "" Then
                        aURL = cWebLib.RemoveQuerystringParameter(aURL, "EmailMatch")
                    End If
                End If
                aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "PersonContact")
                aURL = cWebLib.AddQuerystringParameter(aURL, "PersonID", aPersonDO.GetPropertyInt("PersonID", 0))
                Response.Redirect(aURL)
            End If

        End Sub

'-------------------------------------------------------------

	Public Sub Cancel()
		
		'adding "Match" parameter, so data points are set by sessions added in prior page (Person_Editor), kda 3/21/06
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
		'if request.QueryString("ReturnURL") = "" then
		'	spnWinClose.Visible = True
		'else
		'	URL = cWebLib.RemoveQuerystringParameter(Request.RawUrl.ToString(), "PageFrame")
		'	URL = cWebLib.AddQuerystringParameter(URL, "Page", "Contacts")
		'	spnWinRedirect.Visible = True
		'end if
	End Sub

'=============================================================
End Class
End Namespace