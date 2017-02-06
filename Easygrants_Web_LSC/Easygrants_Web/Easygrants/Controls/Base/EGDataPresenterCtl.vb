Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.User
Imports Core.Web.Modules
Imports EasyGrants.Web.Modules

Namespace Easygrants_Web.Controls.Base

Public Class cEGDataPresenterCtl
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()

		EventController_Notify_DataModified(WebSession.DataObjectFactory, mDataObjHash)
	End Sub

'-----------------------------------------------------

	Public Sub SaveUser_SelectThirdParty(ByVal aEmail As String, ByVal aFirstName As String, ByVal aLastName As String, ByVal aHonorific As String, ByVal aUserType As String, ByVal aPageKey As String)
		Dim aPersonRelationshipID As String


		If EventController_SaveUser(aEmail, aFirstName, aLastName, _
									aUserType, "Person") = False Then
			Exit Sub

		End If

		aPersonRelationshipID = DataObjectCollection("PersonRelationship")(0)("PersonRelationshipID")
		CType(WebSession.CurrentPage, cSubmissionModulePage).SelectThirdParty(aPersonRelationshipID)

		If aPageKey = "" Then
			CorePage.Redirect()
		Else
			EventController_NavigateToModulePageKey(aPageKey)
		End If


	End Sub

	Public Sub SaveUser_SelectThirdParty_PageReload(ByVal aEmail As String, ByVal aFirstName As String, ByVal aLastName As String, ByVal aHonorific As String, ByVal aUserType As String, ByVal aPageKey As String, ByVal ReturnURL As String)
		Dim aPersonRelationshipID As String


		If EventController_SaveUser(aEmail, aFirstName, aLastName, _
									aUserType, "Person") = False Then
			Exit Sub
		End If

		aPersonRelationshipID = DataObjectCollection("PersonRelationship")(0)("PersonRelationshipID")
		CType(WebSession.CurrentPage, cSubmissionModulePage).SelectThirdParty(aPersonRelationshipID)

		If aPageKey = "" Then
			CorePage.Redirect()
		Else
			EventController_NavigateToModulePageKey(aPageKey, "PersonRelationshipID=" + aPersonRelationshipID.ToString, ReturnURL)
		End If
	End Sub

	Public Sub SaveUser_SelectThirdParty_NavigateToURL(ByVal aEmail As String, ByVal aFirstName As String, ByVal aLastName As String, ByVal aHonorific As String, ByVal aUserType As String, ByVal ReturnURL As String)
		Dim aPersonRelationshipID As String


		If EventController_SaveUser(aEmail, aFirstName, aLastName, _
									aUserType, "Person") = False Then
			Exit Sub
		End If

		aPersonRelationshipID = DataObjectCollection("PersonRelationship")(0)("PersonRelationshipID")
		CType(WebSession.CurrentPage, cSubmissionModulePage).SelectThirdParty(aPersonRelationshipID)

		If ReturnURL = "" Then
			CorePage.Redirect()
		Else
			EventController_NavigateToURL(ReturnURL)
		End If
	End Sub
'-----------------------------------------------------

	Public Overloads Function EventController_SaveUser(ByVal aEmail As String, ByVal aFirstName As String, ByVal aLastName As String, _
										ByVal aUserType As String, ByVal aDOCollectionKey As String) As Boolean

		Dim aXmlDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aUserDO As cDataObject
		Dim aPersonID As Integer
		Dim aRndNum As Random = New Random()
		Dim aPersonDOList As cDataObjectList
		Dim aEmailDOList As cDataObjectList

		 Page.Validate()
		If Not Page.IsValid Then
			Return False
		End If

		If ValidUser(aEmail, aUserDO, "1", aEmailDOList) = False Then	 'add new user & person

			If aEmailDOList.count <= 0 Then
				aPersonDOList = WebSession.DataObjectFactory.CreateNewDataObjectListFromKey("Person")
				aPersonDOList(0)("FirstName") = aFirstName
				aPersonDOList(0)("LastName") = aLastName
				WebSession.DataObjectFactory.SaveDataObject(aPersonDOList(0))
			Else
				aPersonDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Person", "PersonID", aEmailDOList(0).GetPropertyString("EntityID"))
			End If

			DataObjectCollection.Add(aDOCollectionKey, aPersonDOList)

			'create user
			If aUserDO Is Nothing Then
				CreateUser(aPersonDOList(0)("PersonID"), aUserType, aEmail)
			End If

			'add Contact record for e-mail address
			If aEmailDOList.count <= 0 Then
				If Not cXMLDoc.FindNode(aPersonDOList.ObjDefNode, "Properties/Property", "Key", "Email") Is Nothing Then
					Dim aEmailAdd As cDataObject

					aEmailAdd = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Email")
					aEmailAdd("IsPrimary") = True 'set primary to true
					aEmailAdd("EntityTypeID") = 1 'person
					aEmailAdd("EntityID") = aPersonDOList(0)("PersonID")
					aEmailAdd("ContactValue1") = aEmail
					WebSession.DataObjectFactory.SaveDataObject(aEmailAdd)

				ElseIf Not cXMLDoc.FindNode(aPersonDOList.ObjDefNode, "Properties/Property", "Key", "Contact") Is Nothing Then
					Dim aContactDO As cDataObject

					aContactDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Contact")
					aContactDO("ContactValue1") = aEmail
					aContactDO("EntityTypeID") = 1
					aContactDO("EntityID") = aPersonDOList(0)("PersonID")
					aContactDO("ContactTypeID") = 7
					WebSession.DataObjectFactory.SaveDataObject(aContactDO)
				End If
			End If

			DataPresenter_SaveDataObjects()
		Else 'add Person data object to the DataObjectCollection
			DataObjectCollection.Add(aDOCollectionKey, WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("Person", aUserDO.GetPropertyString("PersonID")))
			If EventController_Save() = False Then 'if cannot Save, exit
				Return False
			End If
		End If

		Return True

	End Function

'-----------------------------------------------------

	Public Function ValidUser(ByVal aEmail As String, ByRef aUserDO As cDataObject, ByVal aEntityTypeID As String) As Boolean
		Return ValidUser(aEmail, aUserDO, aEntityTypeID, Nothing)
	End Function

	Public Function ValidUser(ByVal aEmail As String, ByRef aUserDO As cDataObject, ByVal aEntityTypeID As String, ByRef aEmailDOList As cDataObjectlist) As Boolean
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aXmlDoc As cXMLDoc


		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("User", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserName", aEmail))
		aUserDO = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

		aEmailDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "ContactValue1", aEmail, "EntityTypeID", aEntityTypeID)


		If aUserDO Is Nothing And aEmailDOList.Count = 0 Then
			Return False
		Else
			If aUserDO Is Nothing Then
				aUserDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("User", "PersonID", aEmailDOList(0).GetPropertyString("EntityID"))(0)
			End If
			If aUserDO Is Nothing Then
				Return False
			Else
				Return True
			End If
		End If

	End Function

'-----------------------------------------------------

	Public Function CreateUser(ByVal aPersonID As Integer, ByVal aUserType As Integer, ByVal aEmail As String) As cDataObject

		Dim aXmlDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aUserDO As cDataObject
		Dim aRndNum As Random = New Random()

		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("User", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserName", aEmail))
		aUserDO = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

		'create user
		aUserDO = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
		aUserDO("UserName") = aEmail
		aUserDO("Password") = aRndNum.Next(1000000, 1000000999).ToString()
		aUserDO("PersonID") = aPersonID
		aUserDO("UserTypeID") = aUserType

		WebSession.DataObjectFactory.SaveDataObject(aUserDO)

		Return aUserDO

	End Function
'-----------------------------------------------------

	Public Overloads Overrides Sub EventController_SaveUser(ByVal aEmail As String, ByVal aFirstName As String, ByVal aLastName As String, ByVal aUserType As String)

	If EventController_SaveUser(aEmail, aFirstName, aLastName, aUserType, "Person") Then
		CorePage.Redirect()
	End If

	End Sub

'-----------------------------------------------------

	Public Overloads Sub EventController_SaveUser(ByVal aEmail As String, ByVal aFirstName As String, ByVal aLastName As String, ByVal aUserType As String, ByVal aPageKey As String, ByVal aDOCollectionKey As String)

	If EventController_SaveUser(aEmail, aFirstName, aLastName, aUserType, aDOCollectionKey) Then
		EventController_NavigateToModulePageKey(aPageKey)
	End If

	End Sub


'=============================================================
End Class

End Namespace 'Easygrants_Web.Controls.Base
