Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web

Namespace Easygrants_Web.Controls.PageSection
Public Class cPrincipals_Editor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'============================================================= 

    Protected ctlIsPrimary As cCheckBox
    Protected ctlFirst As cTextBox
    Protected ctlMiddle As cTextBox
    Protected ctlLast As cTextBox
    Protected ctlDegree As cTextBox
    Protected ctlOrganizationName As cTextBox
    Protected ctlAddress1 As cTextBox
    Protected ctlAddress2 As cTextBox
    Protected ctlCity As cTextBox
    Protected ctlState As cDropDown
    Protected ctlZip As cTextBox
    Protected ctlCountry As cDropDown
    Protected ctlPhoneNumber As cTextBox
    Protected ctlPhoneExt As cTextBox
    Protected ctlFaxNumber As cTextBox
    Protected ctlWebSite As cTextBox
    Protected ctlEmail As cEmailTextBox
    'aNewGranteeProjectPIID is the GranteeProjectPIID of the saved dataobject 
    Private aNewGranteeProjectPIID As String
    
    
'=============================================================

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		dim aGranteeProjectPIList as cDataObjectList = CType(Me.DataObjectCollection("GranteeProjectPI"), cDataObjectList)
		
		if request.QueryString("GranteeProjectPIID") = "0" AndAlso aGranteeProjectPIList.Count = 0 then
			dim aUser as cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			dim aPersonID as String = aUser.PersonID.ToString()
			dim aPersonList as cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Person", _
				"PersonID", aPersonID)
				
			if aPersonList.Count > 0 then
				ctlFirst = CType(Me.FindControl("ctlFirst"), cTextBox)
				ctlFirst.Value = aPersonList(0).GetPropertyString("FirstName")
				ctlMiddle = CType(Me.FindControl("ctlMiddle"), cTextBox)
				ctlMiddle.Value = aPersonList(0).GetPropertyString("MiddleName")
				ctlLast = CType(Me.FindControl("ctlLast"), cTextBox)
				ctlLast.Value = aPersonList(0).GetPropertyString("LastName")
				ctlDegree = CType(Me.FindControl("ctlDegree"), cTextBox)
				ctlDegree.Value = aPersonList(0).GetPropertyString("Degree")
				dim aPerOrgList as cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonOrganizationAffiliation", _
					"PersonID", aPersonID, "IsPrimary", "True")
					
				if aPerOrgList.Count > 0 then
					ctlOrganizationName = CType(Me.FindControl("ctlOrganizationName"), cTextBox)
					ctlOrganizationName.Value = aPerOrgList(0).GetRelatedPropertyString("Organization.OrganizationName")
				end if
				
				ctlAddress1 = CType(Me.FindControl("ctlAddress1"), cTextBox)
				ctlAddress1.Value = aPersonList(0).GetRelatedPropertyString("PrimaryAddress.Address1")
				ctlAddress2 = CType(Me.FindControl("ctlAddress2"), cTextBox)
				ctlAddress2.Value = aPersonList(0).GetRelatedPropertyString("PrimaryAddress.Address2")
				ctlCity = CType(Me.FindControl("ctlCity"), cTextBox)
				ctlCity.Value = aPersonList(0).GetRelatedPropertyString("PrimaryAddress.City")
				ctlState = CType(Me.FindControl("ctlState"), cDropDown)
				ctlState.SelectedField = aPersonList(0).GetRelatedPropertyString("PrimaryAddress.StateID")
				ctlZip = CType(Me.FindControl("ctlZip"), cTextBox)
				ctlZip.Value = aPersonList(0).GetRelatedPropertyString("PrimaryAddress.Zip")
				ctlCountry = CType(Me.FindControl("ctlCountry"), cDropDown)
				ctlCountry.SelectedField = aPersonList(0).GetRelatedPropertyString("PrimaryAddress.CountryID")
				ctlPhoneNumber = CType(Me.FindControl("ctlPhoneNumber"), cTextBox)
				ctlPhoneNumber.Value = aPersonList(0).GetRelatedPropertyString("PersonPrimaryPhone.ContactValue1")
				ctlPhoneExt = CType(Me.FindControl("ctlPhoneExt"), cTextBox)
				ctlPhoneExt.Value = aPersonList(0).GetRelatedPropertyString("PersonPrimaryPhone.PhoneExt")
				dim aFaxList as cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Phone", _
					"EntityID", aPersonID, "EntityTypeID", "1", "PhoneTypeID", "5")
				ctlFaxNumber = CType(Me.FindControl("ctlFaxNumber"), cTextBox)
					
				if aFaxList.Count = 0 then
					aFaxList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Phone", _
						"EntityID", aPersonID, "EntityTypeID", "1", "PhoneTypeID", "8")
				end if
				
				if aFaxList.Count = 0 then
					aFaxList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Phone", _
						"EntityID", aPersonID, "EntityTypeID", "1", "PhoneTypeID", "11")
				end if
				
				if aFaxList.Count > 0 then
					ctlFaxNumber.Value = aFaxList(0).GetPropertyString("ContactValue1")
				end if
				
				ctlWebSite = CType(Me.FindControl("ctlWebSite"), cTextBox)
				ctlWebSite.Value = aPersonList(0).GetRelatedPropertyString("PersonPrimaryWeb.WebAddress")
				ctlEmail = CType(Me.FindControl("ctlEmail"), cEmailTextBox)
				ctlEmail.Value = aPersonList(0).GetRelatedPropertyString("PersonPrimaryEMail.ContactValue1")
			end if
		end if
	End Sub

'-------------------------------------------------------------

	Public Sub Save
		If MyBase.EventController_Save Then
			Dim aUrl As String = Request.RawUrl.ToString
			aUrl = cWebLib.AddQuerystringParameter(aUrl, "GranteeProjectPIID", aNewGranteeProjectPIID)
			Response.Redirect(aUrl)
		End If
	End Sub	
'-------------------------------------------------------------

	Public Overrides Sub DataPresenter_SaveDataObjects()
        Dim aPrimList As cDataObjectList
		Dim aObjList As cDataObjectList
		
        ctlIsPrimary = CType(Me.FindControl("ctlIsPrimary"), cCheckBox)
        aObjList = me.DataObjectCollection("GranteeProjectPI")
        
        if ctlIsPrimary.Value = True then
			aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectPI", _
						"GranteeProjectID", CType(Ctype(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID.ToString(), "IsPrimary", "1")
						
			if not aPrimList is nothing then
				if aPrimList.Count > 0 then 
					if aObjList(0).GetPropertyInt("GranteeProjectPIID", 0) <> aPrimList(0).GetPropertyInt("GranteeProjectPIID", 0) then 
						aPrimList(0)("IsPrimary") = 0
						WebSession.DataObjectFactory.SaveDataObject(aPrimList(0))
					end if
				end if
			End If			
		End If        
        
		MyBase.DataPresenter_SaveDataObjects()
		
		aNewGranteeProjectPIID = aObjList(0).GetPropertyString("GranteeProjectPIID")
        
        if aObjList(0).GetPropertyInt("PersonID", 0) = 0 and ctlIsPrimary.Value = True then
			dim aEmailList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", _
				"ContactValue1", aObjList(0).GetPropertyString("Email"), "EntityTypeID", "1")
			
			if aEmailList.Count = 0 then
				dim aPerson as cDataObject = me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Person")
				aPerson("LastName") = aObjList(0).GetPropertyString("LastName")
				aPerson("FirstName") = aObjList(0).GetPropertyString("FirstName")
				aPerson("MiddleName") = aObjList(0).GetPropertyString("MiddleName")
				me.WebSession.DataObjectFactory.SaveDataObject(aPerson)
				
				if aObjList(0).GetPropertyString("Address1") <> "" then
					dim aAddr as cDataObject = me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Address")
					aAddr("EntityID") = aPerson.GetPropertyString("PersonID")
					aAddr("EntityTypeID") = 1
					aAddr("Address1") = aObjList(0).GetPropertyString("Address1")
					aAddr("Address2") = aObjList(0).GetPropertyString("Address2")
					aAddr("City") = aObjList(0).GetPropertyString("City")
					aAddr("StateID") = aObjList(0).GetPropertyString("StateID")
					aAddr("CountryID") = aObjList(0).GetPropertyString("CountryID")
					aAddr("Zip") = aObjList(0).GetPropertyString("Zip")
					aAddr("IsPrimary") = 1
					me.WebSession.DataObjectFactory.SaveDataObject(aAddr)
				end if
				
				if aObjList(0).GetPropertyString("PhoneNumber") <> "" then
					dim aPhone as cDataObject = me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Phone")
					aPhone("EntityID") = aPerson.GetPropertyString("PersonID")
					aPhone("EntityTypeID") = 1
					aPhone("ContactValue1") = aObjList(0).GetPropertyString("PhoneNumber")
					aPhone("PhoneExt") = aObjList(0).GetPropertyString("PhoneExt")
					aPhone("IsPrimary") = 1
					me.WebSession.DataObjectFactory.SaveDataObject(aPhone)
				end if
				
				if aObjList(0).GetPropertyString("FaxNumber") <> "" then
					dim aPhone as cDataObject = me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Phone")
					aPhone("EntityID") = aPerson.GetPropertyString("PersonID")
					aPhone("EntityTypeID") = 1
					aPhone("PhoneTypeID") = 5
					aPhone("ContactValue1") = aObjList(0).GetPropertyString("FaxNumber")
					aPhone("IsPrimary") = 1
					me.WebSession.DataObjectFactory.SaveDataObject(aPhone)
				end if
				
				if aObjList(0).GetPropertyString("WebSite") <> "" then
					dim aWeb as cDataObject = me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WebAddress")
					aWeb("EntityID") = aPerson.GetPropertyString("PersonID")
					aWeb("EntityTypeID") = 1
					aWeb("WebAddress") = aObjList(0).GetPropertyString("WebSite")
					aWeb("IsPrimary") = 1
					me.WebSession.DataObjectFactory.SaveDataObject(aWeb)
				end if
				
				if aObjList(0).GetPropertyString("ContactValue1") <> "" then
					dim aEmail as cDataObject = me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Email")
					aEmail("EntityID") = aPerson.GetPropertyString("PersonID")
					aEmail("EntityTypeID") = 1
					aEmail("ContactValue1") = aObjList(0).GetPropertyString("ContactValue1")
					aEmail("IsPrimary") = 1
					me.WebSession.DataObjectFactory.SaveDataObject(aEmail)
				end if
				
				aObjList(0)("PersonID") = aPerson.GetPropertyString("PersonID")
			else
				aObjList(0)("PersonID") = aEmailList(0).GetPropertyString("EntityID")
			end if
			
			me.WebSession.DataObjectFactory.SaveDataObject(aObjList(0))
		end if
		
		if ctlIsPrimary.Value = True then
			aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProject", _
				"GranteeProjectID", CType(Ctype(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID)
			
			if aPrimList.Count > 0 then
				aPrimList(0)("GranteeID") = aObjList(0).GetPropertyString("PersonID")
				me.WebSession.DataObjectFactory.SaveDataObject(aPrimList(0))
			end if
		end if
	End Sub
	
'=============================================================
End Class 'cBudgetPeriod_Editor
End Namespace