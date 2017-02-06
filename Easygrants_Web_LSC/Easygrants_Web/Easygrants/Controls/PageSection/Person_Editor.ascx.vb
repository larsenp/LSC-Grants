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
Imports EasyGrants.Web
Imports Core_Web.Controls.Sharepoint


Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cPerson_Editor
	Inherits Core_Web.Controls.Sharepoint.cSharepointLib
'=============================================================

    Protected ctlPrefix As cDropDown
	Protected ctlFirst As cTextBox
	Protected ctlMiddle As cTextBox
	Protected ctlLast As cTextBox
    Protected ctlSuffix As cDropDown
	Protected ctlEmail As cEmailTextBox
        'Protected ctlAddress1 As cTextBox
        'Protected ctlAddress2 As cTextBox
        'Protected ctlAddress3 As cTextBox
        'Protected ctlCity As cTextBox
        'Protected ctlState As cDropDown
        'Protected ctlZip As cTextBox
        'Protected ctlCountry As cDropDown
        'Protected ctlPhone As cTextBox

	Protected trName As HtmlTableRow
    Protected trEditButtons As HtmlTableRow
    Protected trAddButtons As HtmlTableRow
	Protected spnCancel As HtmlGenericControl
	Protected TblAdminOnly As HtmlTable
	Protected trGender As HtmlTableRow
	Protected trInformalName As HtmlTableRow


    
'=============================================================

	Public ReadOnly Property FirstName() As String
		Get
			If Not Request.QueryString("first") Is Nothing Then Return Request.QueryString("first")

			Return ""
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property LastName() As String
		Get
			If Not Request.QueryString("last") Is Nothing Then Return Request.QueryString("last")

			Return ""
		End Get
	End Property


Public ReadOnly Property EGSession As cEGSession
		'get {return (cEGSession)WebSession;}
		Get
			Return Websession
		End Get
End Property

'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		ctlFirst = CType(Me.FindControl("ctlFirst"), cTextBox)
        ctlLast = CType(Me.FindControl("ctlLast"), cTextBox)
        ctlMiddle = CType(Me.FindControl("ctlMiddle"), cTextBox)
        ctlPrefix = CType(Me.FindControl("ctlPrefix"), cDropDown)
        ctlSuffix = CType(Me.FindControl("ctlSuffix"), cDropDown)
		ctlEmail = CType(Me.FindControl("ctlEmail"), cEmailTextBox)
            'ctlAddress1 = CType(Me.FindControl("ctlAddress1"), cTextBox)
            '      ctlAddress2 = CType(Me.FindControl("ctlAddress2"), cTextBox)
            '      ctlAddress3 = CType(Me.FindControl("ctlAddress3"), cTextBox)
            '      ctlCity = CType(Me.FindControl("ctlCity"), cTextBox)
            '      ctlZip = CType(Me.FindControl("ctlZip"), cTextBox)
            '      ctlState = CType(Me.FindControl("ctlState"), cDropDown)
            '      ctlCountry = CType(Me.FindControl("ctlCountry"), cDropDown)
            '      ctlEmail = CType(Me.FindControl("ctlEmail"), cTextBox)
            '      ctlPhone = CType(Me.FindControl("ctlPhone"), cTextBox)

		If Request.QueryString("ReturnURL") = "" Then
			spnCancel.Visible = False
		End If

		   If Request.QueryString("PersonID") = 0 Then
				trGender.Visible = False
				trInformalName.Visible = False
			End If

			If Not CType(Page, cModulePage).CurrentModuleName = "Staff" Then
				TblAdminOnly.Visible = False
			End If

            If Not FirstName = "" Then
                trName.Visible = True
            Else
                trName.Visible = False
            End If

            If EntityID = "0" Then
                trEditButtons.Visible = False
            Else
                trAddButtons.Visible = False
            End If

		
	End Sub

'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetValues()

		if Request.QueryString("Match") = "True" Then
			ctlFirst.Value = Session("FirstName")
			ctlLast.Value = Session("LastName")
			ctlMiddle.Value = Session("MiddleName")
			ctlPrefix.SelectedField = Session("PrefixID")
			ctlSuffix.SelectedField = Session("SuffixID")
			ctlEmail.Value = Session("Email")
                'ctlAddress1.Value = Session("Address1")
                'ctlAddress2.Value = Session("Address2")
                'ctlAddress3.Value = Session("Address3")
                'ctlCity.Value = Session("City")
                'ctlZip.Value = Session("Zip")
                'ctlState.SelectedField = Session("StateID")
                'ctlCountry.SelectedField = Session("CountryID")
                'ctlPhone.Value = Session("Phone")
		else
			MyBase.CoreCtl_SetValues()
			
			'ctlFirst = CType(Me.FindControl("ctlFirst"), cTextBox)
			'ctlPreferFirst = CType(Me.FindControl("ctlPreferFirst"), cTextBox)
	        
			'if ctlPreferFirst.Value = "" then
			'	ctlPreferFirst.Value = ctlPreferFirst.Value
			'end if
		end if
	End Sub
	
'-------------------------------------------------------------

        Public Sub AddSessionVariables()
            Session.Add("FirstName", ctlFirst.Value)
            Session.Add("LastName", ctlLast.Value)
            Session.Add("MiddleName", ctlMiddle.Value)
            Session.Add("PrefixID", ctlPrefix.SelectedValue)
            Session.Add("SuffixID", ctlSuffix.SelectedValue)
            Session.Add("Email", ctlEmail.Value)
            'Session.Add("Address1", ctlAddress1.Value)
            '         Session.Add("Address2", ctlAddress2.Value)
            '         Session.Add("Address3", ctlAddress3.Value)
            '         Session.Add("City", ctlCity.Value)
            '         Session.Add("Zip", ctlZip.Value)
            '         Session.Add("StateID", ctlState.SelectedValue)
            '         Session.Add("CountryID", ctlCountry.SelectedValue)
            '         Session.Add("Phone", ctlPhone.Value)
         End Sub

'-------------------------------------------------------------

        Public Sub RemoveSessionVariables()
            Session.Remove("FirstName")
            Session.Remove("LastName")
            Session.Remove("MiddleName")
            Session.Remove("PrefixID")
            Session.Remove("SuffixID")
            Session.Remove("Email")
			Session.Remove("Address1")
			Session.Remove("Address2")
			Session.Remove("Address3")
			Session.Remove("City")
			Session.Remove("Zip")
			Session.Remove("StateID")
			Session.Remove("CountryID")
			Session.Remove("Phone")
         End Sub

'-------------------------------------------------------------

    Public Overloads Overrides Function EventController_Save() As Boolean
        Dim aXmlDoc As cXMLDoc
        Dim aDataObjectNode As XmlNode
        Dim aFiltersNode As XmlNode
        Dim aArgNode As XmlNode
        Dim aObjList As cDataObjectList
        Dim aURL As String

 		
        Dim aPersonID As String = Request.QueryString("PersonID")

		If (aPersonID = "0" Or aPersonID = "") And CType(Page, cModulePage).CurrentModuleName = "Staff" then
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Person", aDataObjectNode, aFiltersNode)
			aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", _
						"FirstName", ctlFirst.Value)
			cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
			aArgNode.Attributes("Operator").Value = "Like"

			aFiltersNode.AppendChild(aArgNode)

			aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", _
						"LastName", ctlLast.Value)
			cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
			aArgNode.Attributes("Operator").Value = "Like"

			aFiltersNode.AppendChild(aArgNode)

			aObjList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)

			dim aEmailObjList as cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "ContactValue1", ctlEmail.Value)

			If (aObjList.Count > 0 And aPersonID = "0") Or (aObjList.Count > 1 And aPersonID = "0") Then
				aURL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "first", ctlFirst.Value)
				aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "PersonList")
				aURL = cWebLib.AddQuerystringParameter(aURL, "last", ctlLast.Value)
				aURL = cWebLib.AddQuerystringParameter(aURL, "middle", ctlMiddle.Value)
				aURL = cWebLib.AddQuerystringParameter(aURL, "email", ctlEmail.Value)
				aURL = cWebLib.AddQuerystringParameter(aURL, "CancelURL", Server.UrlEncode(Request.RawUrl))
				if aEmailObjList.Count > 0 then
					aURL = cWebLib.AddQuerystringParameter(aURL, "EmailMatch", "True")
				end if
				AddSessionVariables()
				Response.Redirect(aURL)
			End If

			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Person", aDataObjectNode, aFiltersNode)
			aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", _
						"FirstName", ctlFirst.Value)
			cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
			aArgNode.Attributes("Operator").Value = "Like"

			aFiltersNode.AppendChild(aArgNode)

			aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", _
						"LastName", ctlMiddle.Value)
			cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
			aArgNode.Attributes("Operator").Value = "Like"

			aFiltersNode.AppendChild(aArgNode)

			aObjList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)

			If (aObjList.Count > 0 And aPersonID = "0") Or (aObjList.Count > 1 And aPersonID = "0") Then
				aURL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "first", ctlFirst.Value)
				aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "PersonList")
				aURL = cWebLib.AddQuerystringParameter(aURL, "last", ctlLast.Value)
				aURL = cWebLib.AddQuerystringParameter(aURL, "middle", ctlMiddle.Value)
				aURL = cWebLib.AddQuerystringParameter(aURL, "email", ctlEmail.Value)
				aURL = cWebLib.AddQuerystringParameter(aURL, "CancelURL", Server.UrlEncode(Request.RawUrl))
				if aEmailObjList.Count > 0 then
					aURL = cWebLib.AddQuerystringParameter(aURL, "EmailMatch", "True")
				end if
				AddSessionVariables()
				Response.Redirect(aURL)
			End If

			'This Check is for Email Match when The First Name and the Last Name is not Matched.
			Dim aEmailObjList1 As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "ContactValue1", ctlEmail.Value, _
				"IsPrimary", True)
			If aEmailObjList1.Count > 0 Then
				If ctlEmail.Value <> "" And (aEmailObjList1(0).GetPropertyInt("EntityID").ToString() <> EntityID) Then
					aURL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "EmailMatchOnly", "True")
					aURL = cWebLib.AddQuerystringParameter(aURL, "email", ctlEmail.Value)
					aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "PersonList")
					aURL = cWebLib.AddQuerystringParameter(aURL, "CancelURL", Server.UrlEncode(Request.RawUrl))
					AddSessionVariables()
					Response.Redirect(aURL)
				End If
			End If
		else
			'edit person needs to check for email match only
			dim aEmailObjList as cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "ContactValue1", ctlEmail.Value, _
				"IsPrimary", True)
			if aEmailObjList.Count > 0 then
				if ctlEmail.Value <> "" And (aEmailObjList(0).GetPropertyInt("EntityID").ToString() <> EntityID) then
					aURL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "EmailMatchOnly", "True")
					aURL = cWebLib.AddQuerystringParameter(aURL, "email", ctlEmail.Value)
					aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "PersonList")
					aURL = cWebLib.AddQuerystringParameter(aURL, "CancelURL", Server.UrlEncode(Request.RawUrl))
					AddSessionVariables()
					Response.Redirect(aURL)
				end if
			end if
		end if
		
		Return MyBase.EventController_Save()

	End Function

'-------------------------------------------------------------

	Public Overrides Sub DataPresenter_SaveDataObject(ByVal aDataObjectElement as XmlElement)
	
		If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "Email" Then
			'If no e-mail data object exists and no address has been provided, do not create new data object
			Dim ctlEmail As cEmailTextBox = GetControl("ctlEmail")
			Dim aEmailList As cDataObjectList = DataObjectCollection("Email")
			
			If aEmailList(0).IsNewDataObject And ctlEmail.Value = "" Then
				Exit Sub
			End If
			
			'if aEmailList(0).IsNewDataObject = False and ctlEmail.Value = "" then
			'	WebSession.DataObjectFactory.DeleteData(aEmailList(0))
			'end if

		End If

		If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "Person" Then
			'The rename to be executed when editing the name but not when creating a new one.
			Dim PersonID As String = Request.QueryString("PersonID")
			If PersonID > 0 Then
				Dim aSPIntegrationDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")(0)
				If Not aSPIntegrationDO Is Nothing Then
					'Here definition key is the Table Name
					Dim aEventTypeID As Integer = 4
					Dim aDefinitionKey As String = "Person"
					Dim aUniqueID As Integer = PersonID

					Dim aPersonDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("Person", PersonID)(0)
					Dim aPersonNameOld As String = aPersonDO.GetPropertyString("FirstName") + aPersonDO.GetPropertyString("LastName") + aPersonDO.GetPropertyString("MiddleName", "")
					Dim aOldFolderName As String = PersonID & "_" & CorePage.TruncateFolderName(TruncateSpecialCharacters(aSPIntegrationDO, aPersonNameOld), "Person")

					MyBase.DataPresenter_SaveDataObject(aDataObjectElement)

					Dim aPersonNameNew As String = ctlFirst.Value & ctlLast.Value & ctlMiddle.Value
					Dim aNewFolderName As String = PersonID & "_" & CorePage.TruncateFolderName(TruncateSpecialCharacters(aSPIntegrationDO, aPersonNameNew), "Person")

					'Here we are comparing the Values before save and after save. if they both are different then we need to rename the Folder in sharepoint.
					If aOldFolderName <> aNewFolderName Then
						RenameFolder(aEventTypeID, aDefinitionKey, aUniqueID, aOldFolderName, aNewFolderName, aSPIntegrationDO, aPersonDO)
					End If
					'Here we need to exit because otherwise DataPresenter_SaveDataObject will be executed at the end again
					Exit Sub
				End If
				
			End If
		End If

		MyBase.DataPresenter_SaveDataObject(aDataObjectElement)
	End Sub
	
'-------------------------------------------------------------

        
        Public Sub SaveRedirect(ByVal aPersonID As String, ByVal aReturnURL as String)
        
			RemoveSessionVariables()
			'if saving from Person Org Affiliation editor from Org Details area, we re-direct to Edit Person mode and save on Edit Person page,
			'  re-directs user back to Person Org Affiliation editor, pre-populating data points, kda 3/21/06
			if request.QueryString("Src") = "PersonOrgAffilEditor" then
				dim aPersonDO as cDataObject = CType(DataObjectCollection("Person"), cDataObjectList)(0)
				Session.Add("AddNewPerson", "True")
				EventController_NavigateToModulePageKey("EditPerson", "PersonID=" + aPersonDO.GetRelatedPropertyInt("PersonID").ToString(), "Src=EditPerson", _
				"ReturnURL=" + WebAppl.Build_RootURL("Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&Page=POAEditorOrg&PersonOrganizationAffiliationID=" _
				+ Session("PersonOrgAffID") + "&PersonID=" + Session("PersonID")+ "&OrganizationID=" + aPersonDO.GetRelatedPropertyInt("PersonID").ToString() + "&Origin=" + Session("Origin") _
				+ "&ReturnURL=" + WebAppl.Build_RootURL("Implementation%2fModules%2fStaff%2fModuleContent.aspx%3fConfig%3dModuleConfig%26Page%3dOrganizationContact%26OrganizationID%3d" + Session("OrgID"))))
			'when adding a new person from  Person Org Affiliation editor, save on new person page needs to re-direct to Edit Person mode, 
			'  then save on Edit Person page re-directs user back to Person Org Affiliation editor pre-populating data points, kda 3/21/06
            ElseIf Request.QueryString("Src") = "PersonAffiliationEditor" Then
                Dim aPersonDO As cDataObject = CType(DataObjectCollection("Person"), cDataObjectList)(0)
                Session.Add("AddNewPerson", "True")
                EventController_NavigateToModulePageKey("EditPerson", "PersonID=" + aPersonDO.GetRelatedPropertyInt("PersonID").ToString(), "Src=EditPerson", _
                "ReturnURL=" + WebAppl.Build_RootURL("Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&Page=PersonAffiliationEditor&AffilEntityID=" _
                + Session("AffilEntityID") + "&EntityID=" + Session("EntityID") + "&PersonID=" + aPersonDO.GetRelatedPropertyInt("PersonID").ToString() + "&EntityTypeID=1&Origin=" + Session("Origin") _
                + "&ReturnURL=" + WebAppl.Build_RootURL("Implementation%2fModules%2fStaff%2fModuleContent.aspx%3fConfig%3dModuleConfig%26Page%3dPersonContact%26PersonID%3d" + Session("EntityID") + "%26Origin%3d" + Session("Origin"))))
            ElseIf Request.QueryString("Src") = "EditPerson" Then
                Dim aPersonDO As cDataObject = CType(DataObjectCollection("Person"), cDataObjectList)(0)
                Session.Add("AddNewPerson", "True")
                EventController_NavigateToModulePageKey("POAEditorOrg", "PersonOrganizationAffiliationID=" + Session("PersonOrgAffID"), _
                "PersonID=" + aPersonDO.GetPropertyInt("PersonID").ToString(), "OrganizationID=" + Session("OrgID"), "Origin=" + Session("Origin"), _
                "ReturnURL=" + WebAppl.Build_RootURL("Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&Page=OrganizationContact&OrganizationID=" _
                + Session("OrgID") + "&Origin=" + Session("Origin")))
                'if in another module (like Profile), just refresh page on save
			elseif CType(Page, cModulePage).CurrentModuleName <> "Staff" then
				CorePage.Redirect()
			're-direct to Edit Person mode, after save on Add Person page, kda 3/21/06
			ElseIf Request.QueryString("Src") = "GrantPrimaryContactEditor" Then
				EventController_NavigateToURL(aReturnURL)
			Else
				If aReturnURL.Contains("&PersonID=") = False Then
					aReturnURL = aReturnURL + "&PersonID=" + aPersonID
				End If
				'EventController_NavigateToModulePageKey("EditPerson", "PersonID=" + aPersonID, "ReturnURL=" + aReturnURL)
				'redirect to Person Details page
				EventController_NavigateToModulePageKey("PersonContact", "PersonID=" + aPersonID, "Origin=Person")
			end if
        End Sub

'-------------------------------------------------------------

		Public Sub Cancel(ByVal aReturnURL as String)
			Dim aPersonID As String = Request.QueryString("PersonID")
			Dim aURL As String = Request.QueryString("ReturnURL")
			If aURL = "" Then
				CType(WebSession, cEGSession).RedirectToModule("Home", "HomeModuleConfig", "Home")
			Else
				aURL = cWebLib.AddQuerystringParameter(aURL, "PersonID", aPersonID, Server)
				EventController_NavigateToURL(aURL)
			end if				
		End Sub

'-------------------------------------------------------------
		Public Sub ContinueRedirect(ByVal aPageKey as String, ByVal aPersonID as String)
			
			RemoveSessionVariables()
			're-direct to  Person Org Affiliation editor, pre-populating data points, kda 3/21/06		
			if request.QueryString("Src") = "PersonOrgAffilEditor" then
				dim aPersonDO as cDataObject = CType(DataObjectCollection("Person"), cDataObjectList)(0)
				Session.Add("AddNewPerson", "True")
                EventController_NavigateToModulePageKey("POAEditorOrg", "PersonOrganizationAffiliationID=" + Session("PersonOrgAffID"), _
                "PersonID=" + aPersonDO.GetPropertyInt("PersonID").ToString(), "OrganizationID=" + Session("OrgID"), _
                "Origin=" + Session("Origin"), "ReturnURL=" + WebAppl.Build_RootURL("Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&Page=OrganizationContact&OrganizationID=" _
                + Session("OrgID") + "&Origin=" + Session("Origin")))
            ElseIf Request.QueryString("Src") = "PersonAffiliationEditor" Then
                Dim aPersonDO As cDataObject = CType(DataObjectCollection("Person"), cDataObjectList)(0)
                Session.Add("AddNewPerson", "True")
                EventController_NavigateToModulePageKey("PersonAffiliationEditor", "AffilEntityID=" + Session("AffilEntityID"), _
                "EntityID=" + Session("EntityID"), "PersonID=" + aPersonDO.GetPropertyInt("PersonID").ToString(), "EntityTypeID=1", _
                "Origin=" + Session("Origin"), "ReturnURL=" + WebAppl.Build_RootURL("Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&Page=PersonContact&PersonID=" _
                + Session("EntityID") + "&Origin=" + Session("Origin")))
            Else
                're-direct to Person Details page
                EventController_NavigateToModulePageKey(aPageKey, aPersonID)
			end if

		End Sub				
	
'-------------------------------------------------------------

'Invoked by EventController_ControlValidate
	Public Function ValidateDuplicateUserName(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aXmlDoc As cXMLDoc
		Dim aDataObject As cDataObject
        Dim aEmailDOList as cDataObjectList
		Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)


		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("User", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserName", aArgs.Value))
		aDataObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

        ctlEmail = Me.FindControl("ctlEmail")
		aEmailDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "ContactValue1", _
		                    ctlEmail.Value, "IsPrimary", "True")

		If aDataObject Is Nothing And aEmailDOList.Count = 0 Then
			ValidateDuplicateUserName = True
		Else
			If aEmailDOList(0).GetPropertyInt("EntityID") = CType(Request.QueryString("PersonID"), Integer) Then
				ValidateDuplicateUserName = True
			Else
				ValidateDuplicateUserName = False
			End If			
		End If
	End Function
	
'=============================================================
End Class
End Namespace