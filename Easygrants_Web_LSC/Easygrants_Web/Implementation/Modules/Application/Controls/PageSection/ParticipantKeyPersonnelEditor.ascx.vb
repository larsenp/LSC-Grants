Imports Core.DataAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Easygrants_Web.Controls.Base
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports System.Xml
Imports Core.DataAccess.XMLAccess

Namespace Easygrants_Web.Modules.Application.Controls.PageSection
	Public Class cParticipantKeyPersonnelEditor
		Inherits Core_Web.Controls.Base.cDataPresenterCtl


		Protected ctlEmail As cEmailTextBox
		Protected ctlFirst As cTextBox
		Protected ctlMiddle As cTextBox
		Protected ctlLast As cTextBox
		Protected ctlPrefix As cDropDown
		Protected ctlSuffix As cDropDown
		Protected ctlPhone As cTextBox
		Protected ctlExtension As cTextBox
		Protected spnEmail As HtmlGenericControl
		Protected spnLblEmail As HtmlGenericControl
		Protected TrEmailInst As HtmlTableRow

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			ctlEmail = Me.FindControl("ctlEmail")
			ctlFirst = Me.FindControl("ctlFirst")
			ctlMiddle = Me.FindControl("ctlMiddle")
			ctlLast = Me.FindControl("ctlLast")
			ctlPrefix = Me.FindControl("ctlPrefix")
			ctlSuffix = Me.FindControl("ctlSuffix")
			ctlPhone = Me.FindControl("ctlPhone")
			ctlExtension = Me.FindControl("ctlExtension")

			If Request.QueryString("GranteeProjectAdditionalContactID") > 0 Then
				spnEmail.Visible = False
				spnLblEmail.Visible = True
				TrEmailInst.Visible = False
			Else
				spnEmail.Visible = True
				spnLblEmail.Visible = False
				TrEmailInst.Visible = True
			End If
		End Sub

		Public Function ValidUser(ByVal aEmail As String, ByRef aPersonDO As cDataObject, ByVal aEntityTypeID As String) As Boolean
			Dim aDataObjectNode As XmlNode
			Dim aFiltersNode As XmlNode
			Dim aXmlDoc As cXMLDoc
			Dim aEmailDOList As cDataObjectList
			Dim aUserDo As cDataObject


			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("User", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserName", aEmail))
			aUserDO = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

			aEmailDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "ContactValue1", aEmail, "EntityTypeID", aEntityTypeID)


			If aUserDO Is Nothing And aEmailDOList.Count = 0 Then
				Return False
			Else
				If Not aUserDo Is Nothing Then
					aPersonDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Person", "PersonID", aUserDo.GetPropertyString("PersonID"))(0)
				ElseIf aEmailDOList.Count > 0 Then
					aPersonDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Person", "PersonID", aEmailDOList(0).GetPropertyString("EntityID"))(0)
				End If
				Return True
			End If
	End Function

		Public Sub SaveUser_PageReload(ByVal aEmail As String, ByVal aFirstName As String, ByVal aMiddleName As String, ByVal aLastName As String, ByVal aPrefix As String, ByVal aSuffix As String, _
					 ByVal aPhone As String, ByVal aPhoneExtension As String, ByVal aUserType As String, ByVal aPageKey As String, ByVal ReturnURL As String)
			Dim GranteeProjectAdditionalContactID As Integer
			If EventController_SaveUser(aEmail, aFirstName, aMiddleName, aLastName, aPrefix, aSuffix, _
					  aPhone, aPhoneExtension, aUserType, "Person") = False Then
				Exit Sub
			End If

			GranteeProjectAdditionalContactID = DataObjectCollection("ParticipantOtherKeyPersonnelEditorGranteeProjectAdditionalContact")(0)("GranteeProjectAdditionalContactID")

			If aPageKey = "" Then
				CorePage.Redirect()
			Else
				EventController_NavigateToModulePageKey(aPageKey, "GranteeProjectAdditionalContactID=" + GranteeProjectAdditionalContactID.ToString, ReturnURL)
			End If
		End Sub

		Public Sub NavigateToUploadEditor(ByVal PageKey As String, ByVal UploadID As String, ByVal GranteeProjectAdditionalContactID As String, ByVal GeneralUploadCategoryID As String, ByVal GeneralUploadCategoryTypeID As String, ByVal ReturnUrl As String)
			Page.Validate()
			If Not Page.IsValid Then
				Exit Sub
			Else
				DataPresenter_SaveDataObjects()
				If EventController_SaveUser(ctlEmail.Value, ctlFirst.Value, ctlMiddle.Value, ctlLast.Value, ctlPrefix.SelectedValue, ctlSuffix.SelectedValue, _
					 ctlPhone.Value, ctlExtension.Value, 1, "Person") = False Then
					Exit Sub
				End If
			End If
			GranteeProjectAdditionalContactID = "GranteeProjectAdditionalContactID="
			GranteeProjectAdditionalContactID = GranteeProjectAdditionalContactID + CType(DataObjectCollection("ParticipantOtherKeyPersonnelEditorGranteeProjectAdditionalContact")(0), cDataObject).GetRelatedPropertyString("GranteeProjectAdditionalContactID")
			Dim SubmittedFileDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", "GeneralUploadCategoryID", GeneralUploadCategoryID, "GeneralUploadCategoryTypeID", GeneralUploadCategoryTypeID, "UploadID", UploadID)
			If SubmittedFileDOL.Count = 0 Then
				EventController_NavigateToModulePageKey(PageKey, "UploadID=" + UploadID, GranteeProjectAdditionalContactID, "GeneralUploadCategoryID=" + GeneralUploadCategoryID, _
					"GeneralUploadCategoryTypeID=" + GeneralUploadCategoryTypeID, "EntityDataObjectKey=GranteeProject", ReturnUrl)
			Else
				EventController_NavigateToModulePageKey(PageKey, "UploadID=" + UploadID, GranteeProjectAdditionalContactID, "GeneralUploadCategoryID=" + GeneralUploadCategoryID, _
					"GeneralUploadCategoryTypeID=" + GeneralUploadCategoryTypeID, "SubmittedFileID=" + SubmittedFileDOL(0).GetPropertyString("SubmittedFileID", ""), "EntityDataObjectKey=GranteeProject", ReturnUrl)
			End If
		End Sub

		Public Overloads Function EventController_SaveUser(ByVal aEmail As String, ByVal aFirstName As String, ByVal aMiddleName As String, ByVal aLastName As String, ByVal aPrefix As String, ByVal aSuffix As String, _
					 ByVal aPhone As String, ByVal aPhoneExtension As String, ByVal aUserType As String, ByVal aDOCollectionKey As String) As Boolean

			'Dim aXmlDoc As cXMLDoc
			'Dim aDataObjectNode As XmlNode
			'Dim aFiltersNode As XmlNode
			'Dim aPersonID As Integer
			Dim aRndNum As Random = New Random()
			Dim aPersonDOList As cDataObjectList
			Dim aPersonDO As cDataObject

			 Page.Validate()
			If Not Page.IsValid Then
				Return False
			End If

			If ValidUser(aEmail, aPersonDO, "1") = False Then	'add new user & person

				aPersonDOList = WebSession.DataObjectFactory.CreateNewDataObjectListFromKey("Person")
				aPersonDOList(0)("PrefixID") = aPrefix
				aPersonDOList(0)("FirstName") = aFirstName
				aPersonDOList(0)("MiddleName") = aMiddleName
				aPersonDOList(0)("LastName") = aLastName
				aPersonDOList(0)("SuffixID") = aSuffix
				WebSession.DataObjectFactory.SaveDataObject(aPersonDOList(0))

				DataObjectCollection.Add(aDOCollectionKey, aPersonDOList)
				'create user


				'add Contact record for e-mail address
				If Not cXMLDoc.FindNode(aPersonDOList.ObjDefNode, "Properties/Property", "Key", "Email") Is Nothing Then
					Dim aEmailAdd As cDataObject

					aEmailAdd = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Email")
					aEmailAdd("IsPrimary") = True 'set primary to true
					aEmailAdd("EntityTypeID") = 1 'person
					aEmailAdd("EntityID") = aPersonDOList(0)("PersonID")
					aEmailAdd("ContactValue1") = aEmail
					WebSession.DataObjectFactory.SaveDataObject(aEmailAdd)
				End If

				'add Contact record for Phone 
				If Not cXMLDoc.FindNode(aPersonDOList.ObjDefNode, "Properties/Property", "Key", "Phone") Is Nothing Then
					Dim aPhoneAdd As cDataObject

					aPhoneAdd = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Phone")
					aPhoneAdd("IsPrimary") = True 'set primary to true
					aPhoneAdd("EntityTypeID") = 1 'person
					aPhoneAdd("PhoneTypeID") = 2 'person
					aPhoneAdd("EntityID") = aPersonDOList(0)("PersonID")
					aPhoneAdd("ContactValue1") = aPhone
					aPhoneAdd("PhoneExt") = aPhoneExtension
					WebSession.DataObjectFactory.SaveDataObject(aPhoneAdd)
				End If

				DataPresenter_SaveDataObjects()
			Else 'add Person data object to the DataObjectCollection
				DataObjectCollection.Add(aDOCollectionKey, WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("Person", aPersonDO("PersonID")))

				If EventController_Save() = False Then 'if cannot Save, exit
					Return False
				End If
			End If

			Return True
		End Function
	End Class
End Namespace