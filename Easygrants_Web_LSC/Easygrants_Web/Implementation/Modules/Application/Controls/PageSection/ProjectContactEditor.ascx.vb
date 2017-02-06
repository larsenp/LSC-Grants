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
Namespace Easygrants_Web.Modules.Application.Controls.PageSection
    Public Class cProjectContactEditor
        Inherits Core_Web.Controls.Base.cDataPresenterCtl
        Protected ctlIsPrimary As cCheckBox
        Protected ctlFirst As cTextBox
        Protected ctlMiddle As cTextBox
        Protected ctlLast As cTextBox
        Protected ctlEmail As cEmailTextBox
        Private aNewGranteeProjectPIID As String
        Public Sub Save()
            If MyBase.EventController_Save Then
                'Dim aUrl As String = Request.RawUrl.ToString
                'aUrl = cWebLib.AddQuerystringParameter(aUrl, "GranteeProjectPIID", aNewGranteeProjectPIID)
                'Response.Redirect(aUrl)
            End If
        End Sub
        Public Overrides Sub DataPresenter_SaveDataObjects()
            Dim aPrimList As cDataObjectList
            Dim aObjList As cDataObjectList

            ctlIsPrimary = CType(Me.FindControl("ctlIsPrimary"), cCheckBox)
            aObjList = Me.DataObjectCollection("GranteeProjectPI")

            If ctlIsPrimary.Value = True Then
                aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectPI", _
                   "GranteeProjectID", CType(CType(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID, "IsPrimary", "1")

                If Not aPrimList Is Nothing Then
                    If aPrimList.Count > 0 Then
                        If aObjList(0).GetPropertyInt("GranteeProjectPIID", 0) <> aPrimList(0).GetPropertyInt("GranteeProjectPIID", 0) Then
                            aPrimList(0)("IsPrimary") = 0
                            WebSession.DataObjectFactory.SaveDataObject(aPrimList(0))
                        End If
                    End If
                End If
            End If

            MyBase.DataPresenter_SaveDataObjects()



            If ctlIsPrimary.Value = True Then
                aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProject", _
                 "GranteeProjectID", CType(CType(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID)

                If aPrimList.Count > 0 Then
                    aPrimList(0)("GranteeID") = aObjList(0).GetPropertyString("PersonID")
                    Me.WebSession.DataObjectFactory.SaveDataObject(aPrimList(0))
                End If
            End If
        End Sub
        '-------------------------------------------------------------
        Public Overloads Overrides Function EventController_Save() As Boolean
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

			Dim aGPPIObjList As cDataObjectList = Me.DataObjectCollection("GranteeProjectPI")
			aNewGranteeProjectPIID = aGPPIObjList(0).GetPropertyString("GranteeProjectPIID")

            Dim aPersonID As String = Request.QueryString("GranteeProjectPIID")
            If aPersonID = "0" Then

				Page.Validate()
				If Page.IsValid Then
					aObjList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "ContactValue1", ctlEmail.Value)

					If aObjList.Count > 0 Then
						aGPPIObjList(0)("PersonID") = aObjList(0).GetPropertyString("EntityID")
						aGPPIObjList(0).SaveData()
						'aURL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "first", ctlFirst.Value)
						'aURL = cWebLib.AddQuerystringParameter(aURL, "PersonRelationshipID", CType(Me.DataObjectCollection("GranteeProjectPI"), cDataObjectList)(0).GetPropertyString("GranteeProjectPIID"))
						'aURL = cWebLib.AddQuerystringParameter(aURL, "last", ctlLast.Value)
						'aURL = cWebLib.AddQuerystringParameter(aURL, "middle", ctlMiddle.Value)
						'aURL = cWebLib.AddQuerystringParameter(aURL, "email", ctlEmail.Value)
						'aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "OtherContacts")
						Return True
					End If
				End If
			End If


			If Not Page.IsValid Then
				Return False
			Else
				

				If aGPPIObjList(0).GetPropertyInt("PersonID", 0) = 0 Then
					Dim aEmailList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", _
					 "ContactValue1", aGPPIObjList(0).GetPropertyString("Email"), "EntityTypeID", "1")

					If aEmailList.Count = 0 Then
						Dim aPerson As cDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Person")
						aPerson("LastName") = aGPPIObjList(0).GetPropertyString("LastName")
						aPerson("FirstName") = aGPPIObjList(0).GetPropertyString("FirstName")
						aPerson("MiddleName") = aGPPIObjList(0).GetPropertyString("MiddleName")
						aPerson("PrefixID") = aGPPIObjList(0).GetPropertyString("PrefixID")
						aPerson("SuffixID") = aGPPIObjList(0).GetPropertyString("SuffixID")
						Me.WebSession.DataObjectFactory.SaveDataObject(aPerson)

						If aGPPIObjList(0).GetPropertyString("Address1") <> "" Then
							Dim aAddr As cDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Address")
							aAddr("EntityID") = aPerson.GetPropertyString("PersonID")
							aAddr("EntityTypeID") = 1
							'aAddr("Address1") = aGPPIObjList(0).GetPropertyString("Address1")
							'aAddr("Address2") = aGPPIObjList(0).GetPropertyString("Address2")
							'aAddr("City") = aGPPIObjList(0).GetPropertyString("City")
							'aAddr("StateID") = aGPPIObjList(0).GetPropertyString("StateID")
							'aAddr("CountryID") = aGPPIObjList(0).GetPropertyString("CountryID")
							'aAddr("Zip") = aGPPIObjList(0).GetPropertyString("Zip")
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
						End If

						aGPPIObjList(0)("PersonID") = aPerson.GetPropertyString("PersonID")

						'The following code is newely added based on mantis issue # 4325. when a new record is added in GranteeprojectPI, the same person need to be added to the GranteeProjectOtherContact Table as well. 
						 Dim aGPAC As cDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectAdditionalContact")
						 aGPAC("GranteeProjectID") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID
						 aGPAC("StaffPersonID") = aPerson.GetPropertyString("PersonID")
						 Me.WebSession.DataObjectFactory.SaveDataObject(aGPAC)


					Else
						aGPPIObjList(0)("PersonID") = aEmailList(0).GetPropertyString("EntityID")
					End If

					Me.WebSession.DataObjectFactory.SaveDataObject(aGPPIObjList(0))

					EventController_Save = True

				Else
					EventController_Save = True
				End If

			End If

			'aURL = Request.QueryString("ReturnURL")
        End Function
        '=============================================================
    End Class
End Namespace

