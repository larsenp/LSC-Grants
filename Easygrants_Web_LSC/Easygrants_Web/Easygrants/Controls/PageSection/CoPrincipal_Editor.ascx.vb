Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web
Imports Core.DataAccess.XMLAccess

Namespace Easygrants_Web.Controls.PageSection
Public Class cCoPrincipal_Editor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'============================================================= 

    Protected ctlIsPrimary As cCheckBox
    Protected ctlFirst As cTextBox
    Protected ctlMiddle As cTextBox
    Protected ctlLast As cTextBox
    Protected ctlOrganizationName As cTextBox
    Protected ctlEmail As cEmailTextBox

    Private aNewGranteeProjectPIID As String
       
'=============================================================

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
						"GranteeProjectID", CType(Ctype(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID, "IsPrimary", "1")
						
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
		

		
		if ctlIsPrimary.Value = True then
			aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProject", _
				"GranteeProjectID", CType(Ctype(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID)
			
			if aPrimList.Count > 0 then
				aPrimList(0)("GranteeID") = aObjList(0).GetPropertyString("PersonID")
				me.WebSession.DataObjectFactory.SaveDataObject(aPrimList(0))
			end if
		end if
	End Sub
	
'-------------------------------------------------------------

	Public Overloads Overrides Function EventController_Save() As Boolean
		Page.validate()
		If Page.isvalid = False Then
			Exit Function
		End If
		MyBase.EventController_Save()

		Dim aXmlDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aArgNode As XmlNode
		Dim aObjList As cDataObjectList
		Dim aURL As String

		ctlFirst = CType(Me.FindControl("ctlFirst"), cTextBox)
		ctlLast = CType(Me.FindControl("ctlLast"), cTextBox)
		ctlMiddle = CType(Me.FindControl("ctlMiddle"), cTextBox)
		ctlEmail = CType(Me.FindControl("ctlEmail"), cEmailTextBox)

		Dim aPersonID As String = Request.QueryString("GranteeProjectPIID")
		If aPersonID = "0" Then

			aObjList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "ContactValue1", ctlEmail.Value)

			If (aObjList.Count > 0 And aPersonID = "0") Or aObjList.Count > 1 Then
				'aURL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "first", ctlFirst.Value)
				aURL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "GranteeProjectPIID", CType(Me.DataObjectCollection("GranteeProjectPI"), cDataObjectList)(0).GetPropertyString("GranteeProjectPIID"))
	'            aURL = cWebLib.AddQuerystringParameter(aURL, "last", ctlLast.Value)
				'aURL = cWebLib.AddQuerystringParameter(aURL, "middle", ctlMiddle.Value)
				'aURL = cWebLib.AddQuerystringParameter(aURL, "email", ctlEmail.Value)
				aURL = cWebLib.AddQuerystringParameter(aURL, "Config", Request.Querystring("Config"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "Page", request.Querystring("Page"))
				Response.Redirect(aURL)
			End If
		End If


		If Not Page.IsValid Then
			Return False
		Else
			Dim aGPPIObjList As cDataObjectList = Me.DataObjectCollection("GranteeProjectPI")
			aNewGranteeProjectPIID = aGPPIObjList(0).GetPropertyString("GranteeProjectPIID")

			If aGPPIObjList(0).GetPropertyInt("PersonID", 0) = 0 Then
				Dim aEmailList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", _
					"ContactValue1", aGPPIObjList(0).GetPropertyString("Email"), "EntityTypeID", "1")

				If aEmailList.Count = 0 Then
					Dim aPerson As cDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Person")
					aPerson("LastName") = aGPPIObjList(0).GetPropertyString("LastName")
					aPerson("FirstName") = aGPPIObjList(0).GetPropertyString("FirstName")
					aPerson("MiddleName") = aGPPIObjList(0).GetPropertyString("MiddleName")
					Me.WebSession.DataObjectFactory.SaveDataObject(aPerson)

					If aGPPIObjList(0).GetPropertyString("Address1") <> "" Then
						Dim aAddr As cDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Address")
						aAddr("EntityID") = aPerson.GetPropertyString("PersonID")
						aAddr("EntityTypeID") = 1
						aAddr("Address1") = aGPPIObjList(0).GetPropertyString("Address1")
						aAddr("Address2") = aGPPIObjList(0).GetPropertyString("Address2")
						aAddr("City") = aGPPIObjList(0).GetPropertyString("City")
						aAddr("StateID") = aGPPIObjList(0).GetPropertyString("StateID")
						aAddr("CountryID") = aGPPIObjList(0).GetPropertyString("CountryID")
						aAddr("Zip") = aGPPIObjList(0).GetPropertyString("Zip")
						aAddr("IsPrimary") = True
						Me.WebSession.DataObjectFactory.SaveDataObject(aAddr)
					End If

					If aGPPIObjList(0).GetPropertyString("PhoneNumber") <> "" Then
						Dim aPhone As cDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Phone")
						aPhone("EntityID") = aPerson.GetPropertyString("PersonID")
						aPhone("EntityTypeID") = 1
						aPhone("ContactValue1") = aGPPIObjList(0).GetPropertyString("PhoneNumber")
						aPhone("PhoneExt") = aGPPIObjList(0).GetPropertyString("PhoneExt")
						aPhone("IsPrimary") = True
						Me.WebSession.DataObjectFactory.SaveDataObject(aPhone)
					End If

					If aGPPIObjList(0).GetPropertyString("FaxNumber") <> "" Then
						Dim aPhone As cDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Phone")
						aPhone("EntityID") = aPerson.GetPropertyString("PersonID")
						aPhone("EntityTypeID") = 1
						aPhone("PhoneTypeID") = 5
						aPhone("ContactValue1") = aGPPIObjList(0).GetPropertyString("FaxNumber")
						aPhone("IsPrimary") = True
						Me.WebSession.DataObjectFactory.SaveDataObject(aPhone)
					End If

					If aGPPIObjList(0).GetPropertyString("WebSite") <> "" Then
						Dim aWeb As cDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WebAddress")
						aWeb("EntityID") = aPerson.GetPropertyString("PersonID")
						aWeb("EntityTypeID") = 1
						aWeb("WebAddress") = aGPPIObjList(0).GetPropertyString("WebSite")
						aWeb("IsPrimary") = True
						Me.WebSession.DataObjectFactory.SaveDataObject(aWeb)
					End If

					If aGPPIObjList(0).GetPropertyString("Email") <> "" Then
						Dim aEmail As cDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Email")
						aEmail("EntityID") = aPerson.GetPropertyString("PersonID")
						aEmail("EntityTypeID") = 1
						aEmail("ContactValue1") = aGPPIObjList(0).GetPropertyString("Email")
						aEmail("IsPrimary") = True
						Me.WebSession.DataObjectFactory.SaveDataObject(aEmail)

						Dim aRndNum As Random = New Random()
						Dim aUserDO As cDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("User")
						aUserDO("UserName") = aGPPIObjList(0).GetPropertyString("Email")
						aUserDO("Password") = aRndNum.Next(1000000, 1000000999).ToString()
						aUserDO("PersonID") = aPerson.GetPropertyString("PersonID")
						aUserDO("UserTypeID") = 1
						Me.WebSession.DataObjectFactory.SaveDataObject(aUserDO)
					End If

					aGPPIObjList(0)("PersonID") = aPerson.GetPropertyString("PersonID")
				Else
					aGPPIObjList(0)("PersonID") = aEmailList(0).GetPropertyString("EntityID")
				End If

				Me.WebSession.DataObjectFactory.SaveDataObject(aGPPIObjList(0))
			End If

		End If

		Return True
		'aURL = Request.QueryString("ReturnURL")

		'If aURL = "" Then
		'    Response.Redirect(Request.Url.ToString())
		'Else
		'    aPersonID = (CType(Me.DataObjectCollection("GranteeProjectPI"), cDataObjectList))(0).GetPropertyString("PersonID")
		'    aURL = cWebLib.AddQuerystringParameter(aURL, "PersonID", aPersonID)
		'    Response.Redirect(aURL)
		'End If

	End Function

'=============================================================
End Class 'cBudgetPeriod_Editor
End Namespace