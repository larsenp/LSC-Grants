Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core_Web.Controls.Sharepoint

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cOrganization_Editor
	Inherits Core_Web.Controls.Sharepoint.cSharepointLib

'=============================================================

    Protected ctlOrgName As cTextBox
	Protected ctlIsEligible As cCheckBox
	Protected ctlIsTranslationalPartner As cCheckBox
	Protected ctlIsTranslationalPartnerApplicant As cCheckBox
    Protected trEditButtons As HtmlTableRow
    Protected ctlEIN As cTextBox
    Protected ctlState As cDropDown
    Protected ctlCity As cTextBox
    Protected ctlCommonOrgName As cTextBox
    'Protected ctlAcronym As cTextBox
    Protected ctlAddress1 As cTextBox
    Protected ctlAddress2 As cTextBox
    Protected ctlAddress3 As cTextBox
	Protected ctlZip As cTextBox
    Protected ctlCountry As cDropDown
    'Protected ctlAnnualBudget As cTextBox
    'Protected ctlFiscalBeginDate As cDateTextBox
    'Protected ctlFiscalEndDate As cDateTextBox
    Protected ctlWeb As cTextBox
    Protected ctlPhone As cTextBox
	Protected trAddButtons As HtmlTableRow
	Protected ctlOrgType As cDropDown

	Protected ctlspnAvailableInSelector As cCheckBox
	
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		If Request.QueryString("OrganizationID") = 0 Then
			trEditButtons.Visible = False
		Else
			trAddButtons.Visible = False
		End If
		
		ctlOrgName = CType(me.FindControl("ctlOrgName"), cTextBox)
		'ctlAcronym = CType(me.FindControl("ctlAcronym"), cTextBox)
		'ctlAnnualBudget = CType(me.FindControl("ctlAnnualBudget"), cMoneyTextBox)
		'ctlFiscalBeginDate = CType(me.FindControl("ctlFiscalBeginDate"), cDateTextBox)
		'ctlFiscalEndDate = CType(me.FindControl("ctlFiscalEndDate"), cDateTextBox)
		ctlCommonOrgName = CType(me.FindControl("ctlCommonOrgName"), cTextBox)
		ctlEIN = CType(me.FindControl("ctlEIN"), cTextBox)
		ctlAddress1 = CType(me.FindControl("ctlAddress1"), cTextBox)
		ctlAddress2 = CType(me.FindControl("ctlAddress2"), cTextBox)
		ctlAddress3 = CType(me.FindControl("ctlAddress3"), cTextBox)
		ctlCity = CType(me.FindControl("ctlCity"), cTextBox)
		ctlState = CType(me.FindControl("ctlState"), cDropDown)
		ctlZip = CType(me.FindControl("ctlZip"), cTextBox)
		ctlCountry = CType(me.FindControl("ctlCountry"), cDropDown)	
		ctlWeb = CType(me.FindControl("ctlWeb"), cTextBox)	
		ctlPhone = 	CType(me.FindControl("ctlPhone"), cTextBox)	
		ctlOrgType = CType(me.FindControl("ctlOrgType"), cDropDown)	

		ctlspnAvailableInSelector = CType(Me.FindControl("ctlspnAvailableInSelector"), cCheckBox)
		ctlspnAvailableInSelector.BaseCheckButton.Checked = True
	End Sub	
	
'------------------------------------------------------------------------------------------------------------------------------

        Public Overrides Sub CoreCtl_SetValues()
 			'if there is a match and user clicks "Cancel" button on matching page, we pre-populate controls
 			If Request.QueryString("Match") = "True" Then
				ctlOrgName.Value = Session("OrgName")
				'ctlAcronym.Value = Session("Acronym")
				'ctlAnnualBudget.Value = Session("AnnualBudget")
				'ctlFiscalBeginDate.DateString = Session("FiscalBeginDate")
				'ctlFiscalEndDate.DateString = Session("FiscalEndDate")
				ctlCommonOrgName.Value = Session("CommonOrgName")
				ctlOrgType.SelectedField = Session("OrgType")
				ctlEIN.Value = Session("EIN")
				ctlAddress1.Value = Session("Address1")
				ctlAddress2.Value = Session("Address2")
				ctlAddress3.Value = Session("Address3")
				ctlCity.Value = Session("City")
				ctlState.SelectedField = Session("StateID")
				ctlZip.Value = Session("Zip")
				ctlCountry.SelectedField = Session("CountryID")
				ctlWeb.Value = Session("WebAddress")
				ctlPhone.Value = Session("Phone")
			Else
				MyBase.CoreCtl_SetValues()
			End If

         End Sub

'-------------------------------------------------------------

        Public Sub AddSessionVariables()
            Session.Add("OrgName", ctlOrgName.Value)
           ' Session.Add("Acronym", ctlAcronym.Value)
            'Session.Add("AnnualBudget", ctlAnnualBudget.Value)
            'Session.Add("FiscalBeginDate", ctlFiscalBeginDate.DateString)
            'Session.Add("FiscalEndDate", ctlFiscalEndDate.DateString)
            Session.Add("CommonOrgName", ctlCommonOrgName.Value)
            Session.Add("OrgType", ctlOrgType.SelectedValue)
            Session.Add("EIN", ctlEIN.Value)
            Session.Add("Address1", ctlAddress1.Value)
            Session.Add("Address2", ctlAddress2.Value)
            Session.Add("Address3", ctlAddress3.Value)
            Session.Add("City", ctlCity.Value)
            Session.Add("StateID", ctlState.SelectedValue)
            Session.Add("Zip", ctlZip.Value)
            Session.Add("CountryID", ctlCountry.SelectedValue)
            Session.Add("WebAddress", ctlWeb.Value)
            Session.Add("Phone", ctlPhone.Value)
        End Sub

'-------------------------------------------------------------

        Public Sub RemoveSessionVariables()
            Session.Remove("OrgName")
            'Session.Remove("Acronym")
            'Session.Remove("AnnualBudget")
            'Session.Remove("FiscalBeginDate")
            'Session.Remove("FiscalEndDate")
            Session.Remove("CommonOrgName")
            Session.Remove("OrgType")
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
        End Sub


'=============================================================

    Public Overloads Overrides Function EventController_Save() As Boolean
            Dim aURL As String
            Dim aOrganizationID As String
            Page.Validate()
            If Not Page.IsValid Then
                Return False
            End If
            OrgEINMatch()
            OrgNameMatch()

         

            MyBase.EventController_Save()

            If Page.IsValid Then
               Return True 
            else 
               Return False
            End If

			'remove session variables
			RemoveSessionVariables()


            ''EventController_NavigateToModulePageKey("OrganizationContact")

            'aURL = Request.QueryString("ReturnURL")

            'If aURL = "" Then
            '    Response.Redirect(Request.Url.ToString())
            'Else
            '    aOrganizationID = (CType(Me.DataObjectCollection("Organization"), cDataObjectList))(0).GetPropertyString("OrganizationID")
            '    aURL = cWebLib.AddQuerystringParameter(aURL, "OrganizationID", aOrganizationID)
            '    Response.Redirect(aURL)
            'End If

        End Function
        
  '-------------------------------------------------------------

	Public Overrides Sub DataPresenter_SaveDataObject(ByVal aDataObjectElement as XmlElement)
		
		If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "Phone" Then
			Dim aPhoneList As cDataObjectList = DataObjectCollection("Phone")
			If aPhoneList(0).IsNewDataObject And ctlPhone.Value = "" Then
				Exit Sub
			End If
		End If
		
		If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "WebAddress" Then
			Dim aWebAddressList As cDataObjectList = DataObjectCollection("WebAddress")
			If aWebAddressList(0).IsNewDataObject And ctlWeb.Value = "" Then
				Exit Sub
			End If
		End If

		If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "Organization" Then
			Dim OrganizationID As String = Request.QueryString("OrganizationID")
			'The rename to be executed when editing the name but not when creating a new one.
			If OrganizationID > 0 Then
				Dim aSPIntegrationDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")(0)
				If Not aSPIntegrationDO Is Nothing Then
					'Here definition key is the Table Name

					Dim aEventTypeID As Integer = 5
					Dim aDefinitionKey As String = "Organization"
					Dim aUniqueID As Integer = OrganizationID

					Dim aOrganizationDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("Organization", OrganizationID)(0)
					Dim aCommonOrgName As String = aOrganizationDO.GetPropertyString("CommonOrganizationName", "")
					Dim aOldFolderName As String = OrganizationID & "_" & CorePage.TruncateFolderName(TruncateSpecialCharacters(aSPIntegrationDO, aCommonOrgName), "Organization")

					MyBase.DataPresenter_SaveDataObject(aDataObjectElement)

					Dim aNewFolderName As String = OrganizationID & "_" & CorePage.TruncateFolderName(TruncateSpecialCharacters(aSPIntegrationDO, ctlCommonOrgName.Value), "Organization")

					'Here we are comparing the Values before save and after save. if they both are different then we need to rename the Folder in sharepoint.
					If aOldFolderName <> aNewFolderName Then
						RenameFolder(aEventTypeID, aDefinitionKey, aUniqueID, aOldFolderName, aNewFolderName, aSPIntegrationDO, aOrganizationDO)
					End If
					'Here we need to exit because otherwise DataPresenter_SaveDataObject will be executed at the end again
					Exit Sub
				End If

				
			End If
		End If


		MyBase.DataPresenter_SaveDataObject(aDataObjectElement)
	End Sub      
'=============================================================

       Public Sub SaveRedirect(ByVal aOrgID As String, ByVal aReturnURL as String, ByVal aRedirect as String)
        
			RemoveSessionVariables()
			'if saving from Person Org Affiliation editor from Contact Details area, we re-direct to Edit Organization mode and save on Edit Org page
			'  re-directs user back to Person Org Affiliation editor, pre-populating data points, kda 3/21/06			
			if request.QueryString("Src") = "PersonOrgAffilEditor" then
				dim aOrgDO as cDataObject = CType(DataObjectCollection("Organization"), cDataObjectList)(0)
				Session.Add("AddNewOrg", "True")
				EventController_NavigateToModulePageKey("EditOrganization", "OrganizationID=" + aOrgDO.GetRelatedPropertyInt("OrganizationID").ToString(), "Src=" + Request.QueryString("Src").ToString(), _
				"ReturnURL=" + WebAppl.Build_RootURL("Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&Page=POAEditorPerson&PersonOrganizationAffiliationID=" _
				+ Session("PersonOrgAffID") + "&PersonID=" + Session("PersonID") + "&OrganizationID=" + aOrgDO.GetRelatedPropertyInt("OrganizationID").ToString() + "&Origin=" + Session("Origin") _
				+ "&ReturnURL=" + WebAppl.Build_RootURL("Implementation%2fModules%2fStaff%2fModuleContent.aspx%3fConfig%3dModuleConfig%26Page%3dPersonContact%26PersonID%3d" + Session("PersonID"))))
			ElseIf Request.QueryString("Src") = "GrantPrimaryContactEditor" Then
				EventController_NavigateToURL(aReturnURL)
			else
                'refresh page
                if aRedirect = "False" then
                    me.DataPresenter_Reload_After_Save("OrganizationID=" + aOrgID)
                else
				're-direct to Edit Organization page			
                'EventController_NavigateToModulePageKey("EditOrganization", "OrganizationID=" + aOrgID, "ReturnURL=" + WebAppl.Build_RootURL("Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&Page=OrganizationContact&OrganizationID=" + aOrgID))
                'redirect to Organization Details page
                EventController_NavigateToModulePageKey("OrganizationContact", "OrganizationID=" + aOrgID, "Origin=Organization")
                End If
			end if
        End Sub
 
'------------------------------------------------------------
        
        Public Sub ContinueRedirect(ByVal aPageKey as String, ByVal aOrgID as String)
			
			RemoveSessionVariables()
			're-direct to  Person Org Affiliation editor, pre-populating data points, kda 3/21/06		
			if request.QueryString("Src") = "PersonOrgAffilEditor" then
				dim aOrgDO as cDataObject = CType(DataObjectCollection("Organization"), cDataObjectList)(0)
				Session.Add("AddNewOrg", "True")
				EventController_NavigateToModulePageKey("POAEditorPerson", "PersonOrganizationAffiliationID=" + Session("PersonOrgAffID"), _
				"PersonID=" + Session("PersonID"), "OrganizationID=" + aOrgDO.GetRelatedPropertyInt("OrganizationID").ToString(), _
				"Origin=" + Session("Origin"), "ReturnURL=" + WebAppl.Build_RootURL("Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&Page=PersonContact&PersonID=" _
				+ Session("PersonID") + "&Origin=" + Session("Origin")))
			else
				're-direct Org Details page
				EventController_NavigateToModulePageKey(aPageKey, aOrgID)
			end if		
		End Sub  
		      
       
'=============================================================
        Public Sub OrgEINMatch()
            Dim aXmlDoc As cXMLDoc
            Dim aDataObjectNode As XmlNode
            Dim aFiltersNode As XmlNode
            Dim aArgNode As XmlNode
            Dim aObjList As cDataObjectList
            Dim aURL As String
            ctlEIN = CType(Me.FindControl("ctlEIN"), cTextBox)
            Dim aOrganizationID As String = Request.QueryString("OrganizationID")
            If aOrganizationID Is Nothing Then
                aOrganizationID = "0"
            End If

            If (aOrganizationID = "0" Or aOrganizationID = "")  and ctlEIN.Value <> "" Then
				If LCase(ctlEIN.Value) <> "n/a" AndAlso LCase(ctlEIN.Value) <> "na" Then
					aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Organization", aDataObjectNode, aFiltersNode)
					aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "EIN", ctlEIN.Value)
					cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
					aArgNode.Attributes("Operator").Value = "Equal"
					aFiltersNode.AppendChild(aArgNode)

					aObjList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)

					If (aObjList.Count > 0 And aOrganizationID = "0") Or aObjList.Count > 1 Then
						aURL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "EIN", ctlEIN.Value)
						aURL = cWebLib.AddQuerystringParameter(aURL, "EINMatch", "True")
						aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "OrganizationList")
						aURL = cWebLib.AddQuerystringParameter(aURL, "CancelURL", Server.UrlEncode(Request.RawUrl))
						AddSessionVariables()

						Response.Redirect(aURL)
					End If
				End If
			End If
        End Sub
        '=============================================================
        Public Sub OrgNameMatch()
            Dim aXmlDoc As cXMLDoc
            Dim aDataObjectNode As XmlNode
            Dim aFiltersNode As XmlNode
            Dim aArgNode As XmlNode
            Dim aArgNode2 As XmlNode
            Dim aObjList As cDataObjectList
            Dim aURL As String
   '         ctlOrgName = CType(Me.FindControl("ctlOrgName"),cTextBox)
   '         ctlEIN = CType(Me.FindControl("ctlEIN"), cTextBox)
   '         ctlAcronym = CType(Me.FindControl("ctlAcronym"), cTextBox)
   '         ctlState = CType(Me.FindControl("ctlState"), cDropDown)
   '         ctlCommonOrgName = CType(Me.FindControl("ctlCommonOrgName"), cTextBox)
   '         ctlCity = CType(Me.FindControl("ctlCity"), cTextBox)
   '         ctlAddress1 = CType(Me.FindControl("ctlAddress1"), cTextBox)
   '         ctlAddress2 = CType(Me.FindControl("ctlAddress2"), cTextBox)
   '         ctlAddress3 = CType(Me.FindControl("ctlAddress3"), cTextBox)

			'ctlZip = CType(Me.FindControl("ctlZip"), cTextBox)
   '         ctlAnnualBudget = CType(Me.FindControl("ctlAnnualBudget"), cTextBox)
   '         ctlCountry = CType(Me.FindControl("ctlCountry"), cDropDown)
   '         ctlFiscalBeginDate = CType(Me.FindControl("ctlFiscalBeginDate"), cDateTextBox)
   '         ctlFiscalEndDate = CType(Me.FindControl("ctlFiscalEndDate"), cDateTextBox)
   '         ctlWeb = CType(Me.FindControl("ctlWeb"), cTextBox)
   '         ctlPhone = CType(Me.FindControl("ctlPhone"), cTextBox)
            
            Dim aOrganizationID As String = Request.QueryString("OrganizationID")
            If aOrganizationID Is Nothing Then
                aOrganizationID = "0"
            End If


            If aOrganizationID = "0" Or aOrganizationID = "" Then
                aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Organization", aDataObjectNode, aFiltersNode)

				aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "CommonOrganizationName", ctlCommonOrgName.Value)
                cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
				aArgNode.Attributes("Operator").Value = "Like"
				aArgNode.Attributes("Bool").Value = ""
				aFiltersNode.AppendChild(aArgNode)

				aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "OrganizationName", ctlOrgName.Value)
				cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
				aArgNode.Attributes("Operator").Value = "Like"
				aArgNode.Attributes("Bool").Value = "OR"
				aFiltersNode.AppendChild(aArgNode)

                aObjList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)

                If (aObjList.Count > 0 And aOrganizationID = "0") Or aObjList.Count > 1 Then
                    If (aObjList(0).GetRelatedPropertyString("PrimaryAddress.City") = ctlCity.Value) And (aObjList(0).GetRelatedPropertyString("PrimaryAddress.StateID") = ctlState.SelectedField) Then
                        aURL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "CommonOrgName", ctlCommonOrgName.Value)
                        aURL = cWebLib.AddQuerystringParameter(aURL, "OrgName", ctlOrgName.Value)
						aURL = cWebLib.AddQuerystringParameter(aURL, "City", ctlCity.Value)
                        aURL = cWebLib.AddQuerystringParameter(aURL, "StateID", ctlState.SelectedField)
						aURL = cWebLib.AddQuerystringParameter(aURL, "EINMatch", "False")
						aURL = cWebLib.AddQuerystringParameter(aURL, "CancelURL", Server.UrlEncode(Request.RawUrl))
						AddSessionVariables()
						aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "OrganizationList")
                        Response.Redirect(aURL)
                    End If
                End If
            End If

        End Sub

        '=============================================================

        Private Sub InitializeComponent()

		End Sub
		
		Public Sub DuplicateEINCheck(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
			
			'No need to test for a duplicate EIN unless it has been entered.
			ctlEIN = CType(Me.FindControl("ctlEIN"), cTextBox)
			if ctlEIN.Value = "" then
			   exit Sub
			end if
			
			'Test for Duplicate EIN on Add.
			Dim aOrganizationID as String = Request.QueryString("OrganizationID")
			if aOrganizationID = "0" then
				dim aListAdd as cDataObjectList = _
					 WebSession.DataObjectFactory.GetDataObjectListWithFilter("Organization", "EIN", ctlEin.Value)
           	if alistAdd.Count = 0 then
					aArgs.IsValid = True
				else
					aArgs.IsValid = False
				end if
           
         else
            'Test for Duplicate EIN On Edit, Only if the original value of the EIN has changed since the Organization
            'was added. Get the original value from the DataPresenter's Hash Table. aListEdit will contain a recordset.
             dim aListOriginalRecordSet as cDataObjectList = Ctype(DataObjectCollection("Organization"), cDataObjectList)
             'Get the first row of the dataset.
             dim aDataObjectOriginal  as cDataObject = aListOriginalRecordSet(0)
             'Get the specific column in the row.
             dim aOriginalEINValue as String = aDataObjectOriginal.GetPropertyString("EIN")
             if aOriginalEINValue <> ctlEIN.Value then
                dim aListEdit as cDataObjectList = _
					 WebSession.DataObjectFactory.GetDataObjectListWithFilter("Organization", "EIN", ctlEin.Value)
					 if alistEdit.Count = 0 then
						 aArgs.IsValid = True
					 else
						aArgs.IsValid = False
					 end if
		       end if 'End if Original Value changed.
        end if 'End if Add Organization
		End Sub
		
    End Class
End Namespace