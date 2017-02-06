Imports System.Xml
Imports System.Diagnostics
Imports Core.Web.Navigation
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User


Namespace Easygrants_Web.Controls.PageSection
Public Class cPeople_Editor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'=============================================================

	Protected NewPersonID As Integer

'---------------------------------------------------------------------------
	
	Public ReadOnly Property PersonRelationshipID() As Integer
		Get
            If Not Request.QueryString("PersonRelationshipID") Is Nothing Then
                Return Request.QueryString("PersonRelationshipID")
            Else
                Return 0
            End If
		End Get
	End Property

'=============================================================

	Public Function ValidateDuplicateUserName(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ValidateDuplicateUserName = True
		
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aXmlDoc As cXMLDoc
		Dim aDataObject As cDataObject
		Dim aPersonDO As cDataObject
		Dim aPersonRelationshipDO As cDataObject

		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("User", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserName", aArgs.Value))
		aDataObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

		If Not aDataObject Is Nothing Then
			If PersonRelationshipID > 0 Then
				aPersonDO = aDataObject.GetRelatedPropertyDataObject("Person")
				aPersonRelationshipDO = Me.DataObjectCollection("PersonRelationship")(0)
				If Not aPersonDO Is Nothing and Not aPersonRelationshipDO Is Nothing Then
					If aPersonRelationshipDO.GetPropertyInt("RelatedPersonID") <> aPersonDO.GetPropertyInt("PersonID") Then
						ValidateDuplicateUserName = False
					End If					
				End if
			Else
				ValidateDuplicateUserName = False
			End If
		End If
	End Function

'---------------------------------------------------------------------------
	
'Invoked by EventController_ControlValidate
	Public Function ValidateDuplicateRefType(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ValidateDuplicateRefType = True
		
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aXmlDoc As cXMLDoc
		Dim aDataObject As cDataObject

        Dim aUser As cEGUser
        aUser = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser)

	    Dim ctlType As cDropDown
		ctlType = CType(Me.FindControl("ctlType"), cDropDown)
		
		Dim iType As Integer
		iType = CType(ctlType.SelectedValue, Integer)
		
		Dim iPersonRelationshipID as Integer
		iPersonRelationshipID = CType(Request.QueryString("PersonRelationshipID"), Integer)

		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("PersonRelationship", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", aUser.PersonID))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "RelatedPersonRoleID", 4))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "RelatedPersonReferenceTypeID", iType))
		aDataObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

		If Not aDataObject Is Nothing Then
			If iPersonRelationshipID > 0 Then
				If iPersonRelationshipID <> aDataObject.GetPropertyInt("PersonRelationshipID") Then
					ValidateDuplicateRefType = False
				End If				
			Else
				ValidateDuplicateRefType = False
			End If			
		End If
	End Function

'=============================================================

	Private Sub CreatePersonUser()
		'Create Person record
		Dim aPersonDO As cDataObject
		aPersonDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Person")
		aPersonDO("FirstName") = CType(Me.FindControl("ctlFirst"), cTextBox).Value
		aPersonDO("MiddleName") = CType(Me.FindControl("ctlMiddle"), cTextBox).Value
		aPersonDO("LastName") = CType(Me.FindControl("ctlLast"), cTextBox).Value
		aPersonDO("SuffixID") = CType(Me.FindControl("ctlSuffix"), cDropDown).SelectedValue
		WebSession.DataObjectFactory.SaveDataObject(aPersonDO)

		'Create User record
		Dim aUserDO As cDataObject
		aUserDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("User")
		aUserDO("PersonID") = aPersonDO("PersonID")
		aUserDO("UserName") = CType(Me.FindControl("ctlEmail"), cTextBox).Value
		Dim aRndNum As Random = New Random()
		aUserDO("Password") = aRndNum.Next(1000000, 1000000999).ToString()
		aUserDO("UserTypeID") = 1 'Public
		WebSession.DataObjectFactory.SaveDataObject(aUserDO)

		NewPersonID = aPersonDO("PersonID")
	End Sub	

'---------------------------------------------------------------------------

	Private Sub UpdatePersonUser(ByVal aDataObject As cDataObject)
		'Update Person record
		Dim aPersonDO As cDataObject
		aPersonDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aDataObject.GetPropertyInt("RelatedPersonID"))
		aPersonDO("FirstName") = CType(Me.FindControl("ctlFirst"), cTextBox).Value
		aPersonDO("MiddleName") = CType(Me.FindControl("ctlMiddle"), cTextBox).Value
		aPersonDO("LastName") = CType(Me.FindControl("ctlLast"), cTextBox).Value
		aPersonDO("SuffixID") = CType(Me.FindControl("ctlSuffix"), cDropDown).SelectedValue
		WebSession.DataObjectFactory.SaveDataObject(aPersonDO)

		'Update User record
		Dim aUserDO As cDataObject
		aUserDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("User", aPersonDO.GetRelatedPropertyInt("User.UserID"))
		aUserDO("UserName") = CType(Me.FindControl("ctlEmail"), cTextBox).Value
		WebSession.DataObjectFactory.SaveDataObject(aUserDO)
	End Sub	

'---------------------------------------------------------------------------

	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()
		
		Dim aDataObject As cDataObject
		aDataObject = Me.DataObjectCollection("PersonRelationship")(0)
		
		If PersonRelationshipID < 1 Then
			CreatePersonUser()
			aDataObject("RelatedPersonID") = NewPersonID
			WebSession.DataObjectFactory.SaveDataObject(aDataObject)
		Else
			UpdatePersonUser(aDataObject)
		End If
	End Sub

End Class 'cPeople_Editor

End Namespace 'Easygrants_Web.Controls.PageSection