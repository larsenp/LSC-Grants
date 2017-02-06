Imports System.Xml
Imports System.Diagnostics
Imports Core.Web.Navigation
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web


Namespace Easygrants_Web.Controls.PageSection
Public Class cProjectPersonnelEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'=============================================================

	Protected NewPersonID As Integer
	Protected ctlRole As cDropDown
	Protected ctlEmail as cEmailTextBox
	Protected ctlPhone as cTextBox
	Protected ctlPhoneExt as cTextBox

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

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)
			
		ctlRole = me.FindControl("ctlRole")
		dim aPersonID as String = CType(CType(Page, cModulePage).ModuleUser, cEGUser).PersonID.ToString()
		dim aGPID as String = CType(CType(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID.ToString()
		dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonRelationship", _
			"PersonID", aPersonID, "GranteeProjectID", aGPID, "RelatedPersonRoleID", "102")
		
		if aList.Count > 0 then
			if aList(0).GetPropertyString("RelatedPersonRoleID") <> me.Request.QueryString("RelatedPersonRoleID") then
				ctlRole.Items.Remove(ctlRole.Items.FindByValue("102"))
			end if
		end if
		
		aList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonRelationship", _
			"PersonID", aPersonID, "GranteeProjectID", aGPID, "RelatedPersonRoleID", "103")
		
		if aList.Count > 0 then
			if aList(0).GetPropertyString("RelatedPersonRoleID") <> me.Request.QueryString("RelatedPersonRoleID") then
				ctlRole.Items.Remove(ctlRole.Items.FindByValue("103"))
			end if
		end if
		
		aList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonRelationship", _
			"PersonID", aPersonID, "GranteeProjectID", aGPID, "RelatedPersonRoleID", "104")
		
		if aList.Count > 0 then
			if aList(0).GetPropertyString("RelatedPersonRoleID") <> me.Request.QueryString("RelatedPersonRoleID") then
				ctlRole.Items.Remove(ctlRole.Items.FindByValue("104"))
			end if
		end if
		
		aList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonRelationship", _
			"PersonID", aPersonID, "GranteeProjectID", aGPID, "RelatedPersonRoleID", "109")
		
		if aList.Count > 0 then
			if aList(0).GetPropertyString("RelatedPersonRoleID") <> me.Request.QueryString("RelatedPersonRoleID") then
				ctlRole.Items.Remove(ctlRole.Items.FindByValue("109"))
			end if
		end if
		
		aList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonRelationship", _
			"PersonID", aPersonID, "GranteeProjectID", aGPID, "RelatedPersonRoleID", "112")
		
		if aList.Count > 0 then
			if aList(0).GetPropertyString("RelatedPersonRoleID") <> me.Request.QueryString("RelatedPersonRoleID") then
				ctlRole.Items.Remove(ctlRole.Items.FindByValue("112"))
			end if
		end if
		
		aList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonRelationship", _
			"PersonID", aPersonID, "GranteeProjectID", aGPID, "RelatedPersonRoleID", "113")
		
		if aList.Count > 0 then
			if aList(0).GetPropertyString("RelatedPersonRoleID") <> me.Request.QueryString("RelatedPersonRoleID") then
					ctlRole.Items.Remove(ctlRole.Items.FindByValue("113"))
			End If			
		end if
	End Sub

'-----------------------------------------------------

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
				'aPersonDO = aDataObject.GetRelatedPropertyDataObject("Person")
				aPersonRelationshipDO = Me.DataObjectCollection("PersonRelationship")(0)
				aPersonRelationshipDO("RelatedPersonID") = aDataObject.GetPropertyString("PersonID")
			'	If Not aPersonDO Is Nothing and Not aPersonRelationshipDO Is Nothing Then
			'		If aPersonRelationshipDO.GetPropertyInt("RelatedPersonID") <> aPersonDO.GetPropertyInt("PersonID") Then
			'			ValidateDuplicateUserName = False
			'		End If					
			'	End if
			'Else
			'	ValidateDuplicateUserName = False
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

	 '   Dim ctlType As cDropDown
		'ctlType = CType(Me.FindControl("ctlType"), cDropDown)
		
		'Dim iType As Integer
		'iType = CType(ctlType.SelectedValue, Integer)
		
		Dim iPersonRelationshipID as Integer
		iPersonRelationshipID = CType(Request.QueryString("PersonRelationshipID"), Integer)

		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("PersonRelationship", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", aUser.PersonID))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "RelatedPersonRoleID", 8))
		'aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "RelatedPersonReferenceTypeID", iType))
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

    Private Sub CreatePersonUser(ByVal aDataObject As cDataObject)
        Dim aEmail As String = CType(Me.FindControl("ctlEmail"), cTextBox).Value
        Dim aList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("User", _
            "UserName", aEmail)
        'Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
        Dim aPersonDO As cDataObject
        Dim aEmailDOList As cDataObjectList
        Dim aEmailDO As cDataObject
        Dim aExistingPersonID As Integer

        aEmailDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "ContactValue1", aEmail)
        If aEmailDOList.Count > 0 Then
            aExistingPersonID = aEmailDOList(0).GetPropertyString("EntityID")
            aPersonDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aExistingPersonID)
        End If

        If aList.Count > 0 Then
            aExistingPersonID = aList(0).GetPropertyString("PersonID")
            aPersonDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aExistingPersonID)
        End If

        If aList.Count = 0 Then
            If aPersonDO Is Nothing Then
                'Create Person record
                aPersonDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Person")
                aPersonDO("FirstName") = CType(Me.FindControl("ctlFirst"), cTextBox).Value
                aPersonDO("MiddleName") = CType(Me.FindControl("ctlMiddle"), cTextBox).Value
                aPersonDO("LastName") = CType(Me.FindControl("ctlLast"), cTextBox).Value
                aPersonDO("SuffixID") = CType(Me.FindControl("ctlSuffix"), cDropDown).SelectedValue
                WebSession.DataObjectFactory.SaveDataObject(aPersonDO)
            End If

            'Create User record
            Dim aUserDO As cDataObject
            aUserDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("User")
            aUserDO("PersonID") = aPersonDO("PersonID")
            aUserDO("UserName") = aEmail
            Dim aRndNum As Random = New Random()
            aUserDO("Password") = aRndNum.Next(1000000, 1000000999).ToString()
            aUserDO("UserTypeID") = 1 'Public
            WebSession.DataObjectFactory.SaveDataObject(aUserDO)

            NewPersonID = aPersonDO("PersonID")
        Else
            NewPersonID = aList(0).GetPropertyInt("PersonID")
        End If
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

		dim aObj as cDataObject
        Dim aDataObject As cDataObject
        aDataObject = Me.DataObjectCollection("PersonRelationship")(0)
        
        dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("AdditionalContactRole", _
			"AdditionalContactRoleID", aDataObject.GetPropertyString("RelatedPersonRoleID"))
			
		aDataObject("TaskID") = aList(0).GetPropertyString("TaskID")

        If PersonRelationshipID < 1 Then
            CreatePersonUser(aDataObject)
            aDataObject("RelatedPersonID") = NewPersonID
            WebSession.DataObjectFactory.SaveDataObject(aDataObject)
            aObj = me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("PersonOrganizationAffiliation")
            aObj("PersonID") = NewPersonID
            aObj("OrganizationID") = aDataObject("RelatePersonDisplayOrganizationID")
            aObj("IsPrimary") = 1
            aObj.SaveData()
        Else
            UpdatePersonUser(aDataObject)
        End If
        
        ctlEmail = CType(me.FindControl("ctlEmail"), cEmailTextBox)
        ctlPhone =  CType(me.FindControl("ctlPhone"), cTextBox)
        ctlPhoneExt =  CType(me.FindControl("ctlPhoneExt"), cTextBox)
        'create/update primary Email record
        dim aEmailList as cDataObjectList
        dim aEmailDO as cDataObject
        aEmailList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "EntityID", aDataObject.GetPropertyInt("RelatedPersonID"), "IsPrimary", "True")
        if aEmailList.Count = 0 then
			aEmailDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Email")
			aEmailDO("EntityTypeID") = 1
			aEmailDO("EntityID") = NewPersonID
			aEmailDO("EmailTypeID") = 1
			aEmailDO("ContactValue1") = aDataObject.GetPropertyString("RelatePersonDisplayEmail")
			aEmailDO("IsPrimary") = True
			WebSession.DataObjectFactory.SaveDataObject(aEmailDO)
		else
			aEmailList(0)("ContactValue1") = ctlEmail.Value
			WebSession.DataObjectFactory.SaveDataObject(aEmailList(0))
        end if
        'create/update Primary phone record
        dim aPhoneList as cDataObjectList
        dim aPhoneDO as cDataObject
        aPhoneList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Phone", "EntityID", aDataObject.GetPropertyInt("RelatedPersonID"), "IsPrimary", "True")
        if aPhoneList.Count = 0 And ctlPhone.Value <> "" then
			aPhoneDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Phone")
			aPhoneDO("EntityTypeID") = 1
			aPhoneDO("EntityID") = NewPersonID
			aPhoneDO("PhoneTypeID") = 1
			aPhoneDO("ContactValue1") = ctlPhone.Value
			aPhoneDO("PhoneExt") = ctlPhoneExt.Value
			aPhoneDO("IsPrimary") = True
			WebSession.DataObjectFactory.SaveDataObject(aPhoneDO)
		else
			if aPhoneList.Count > 0
				aPhoneList(0)("ContactValue1") = ctlPhone.Value
				aPhoneList(0)("PhoneExt") = ctlPhoneExt.Value
				WebSession.DataObjectFactory.SaveDataObject(aPhoneList(0))
			end  if
        end if
    End Sub

'---------------------------------------------------------------------------

    Public Overloads Overrides Function EventController_Save() As Boolean
        MyBase.EventController_Save()

        If Not Page.IsValid Then
            Return False
        End If

        Dim aGPDC As cDataObject
        aGPDC = Me.DataObjectCollection("PersonRelationship")(0)

        'Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
        'aGPDC("GranteeProjectID") = aUser.GranteeProjectID

        If PersonRelationshipID = 0 Then

            Dim aXmlDoc As cXMLDoc
            Dim aDataObjectNode As XmlNode
            Dim aFiltersNode As XmlNode
            Dim aArgNode As XmlNode
            Dim aObjList As cDataObjectList
            Dim aURL As String
 
            ' search for matching FirstName and LastName
            'aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Person", aDataObjectNode, aFiltersNode)
            'aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", _
            '			"FirstName", aGPDC.GetPropertyString("RelatePersonDisplayFirstName"))
            'cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
            'aArgNode.Attributes("Operator").Value = "Like"

            'aFiltersNode.AppendChild(aArgNode)

            'aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", _
            '			"LastName", aGPDC.GetPropertyString("RelatePersonDisplayLastName"))
            'cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
            'aArgNode.Attributes("Operator").Value = "Like"

            'aFiltersNode.AppendChild(aArgNode)

            'aObjList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
            'Dim aID As String = CType(Me.DataObjectCollection("WfTask")(0), cDataObject).GetPropertyString("WfTaskID")

            'If aObjList.Count > 0 Then
            '	aURL = Request.RawUrl.ToString()
            '	aURL = cWebLib.AddQuerystringParameter(aURL, "task", aID)
            '	aURL = cWebLib.AddQuerystringParameter(aURL, "PersonRelationshipID", aGPDC.GetPropertyString("PersonRelationshipID"))
            '	aURL = cWebLib.AddQuerystringParameter(aURL, "first", aGPDC.GetPropertyString("RelatePersonDisplayFirstName"))
            '	aURL = cWebLib.AddQuerystringParameter(aURL, "last", aGPDC.GetPropertyString("RelatePersonDisplayLastName"))
            '	aURL = cWebLib.AddQuerystringParameter(aURL, "middle", aGPDC.GetPropertyString("RelatePersonDisplayMiddleName"))
            '	aURL = cWebLib.AddQuerystringParameter(aURL, "email", aGPDC.GetPropertyString("RelatePersonDisplayEmail"))
            '	aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "AwardeeList")
            '	Response.Redirect(aURL)
            'End If

            '' search for matching FirstName and MiddleName
            'aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Person", aDataObjectNode, aFiltersNode)
            'aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", _
            '			"FirstName", aGPDC.GetPropertyString("RelatePersonDisplayFirstName"))
            'cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
            'aArgNode.Attributes("Operator").Value = "Like"

            'aFiltersNode.AppendChild(aArgNode)

            'aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", _
            '			"LastName", aGPDC.GetPropertyString("RelatePersonDisplayMiddleName"))
            'cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
            'aArgNode.Attributes("Operator").Value = "Like"

            'aFiltersNode.AppendChild(aArgNode)

            'aObjList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)

            'If aObjList.Count > 0 Then
            '	aURL = Request.RawUrl.ToString()
            '	aURL = cWebLib.AddQuerystringParameter(aURL, "task", aID)
            '	aURL = cWebLib.AddQuerystringParameter(aURL, "PersonRelationshipID", aGPDC.GetPropertyString("PersonRelationshipID"))
            '	aURL = cWebLib.AddQuerystringParameter(aURL, "first", aGPDC.GetPropertyString("RelatePersonDisplayFirstName"))
            '	aURL = cWebLib.AddQuerystringParameter(aURL, "last", aGPDC.GetPropertyString("RelatePersonDisplayLastName"))
            '	aURL = cWebLib.AddQuerystringParameter(aURL, "middle", aGPDC.GetPropertyString("RelatePersonDisplayMiddleName"))
            '	aURL = cWebLib.AddQuerystringParameter(aURL, "email", aGPDC.GetPropertyString("RelatePersonDisplayEmail"))
            '	aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "AwardeeList")
            '	Response.Redirect(aURL)
            'End If

            ' search for matching email
            'aObjList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "ContactValue1", aGPDC.GetPropertyString("RelatePersonDisplayEmail"))

            'If aObjList.Count > 0 Then
            '    aURL = Request.RawUrl.ToString()
            '    'aURL = cWebLib.AddQuerystringParameter(aURL, "task", aID)
            '    aURL = cWebLib.AddQuerystringParameter(aURL, "PersonRelationshipID", aGPDC.GetPropertyString("PersonRelationshipID"))
            '    aURL = cWebLib.AddQuerystringParameter(aURL, "first", aGPDC.GetPropertyString("RelatePersonDisplayFirstName"))
            '    aURL = cWebLib.AddQuerystringParameter(aURL, "last", aGPDC.GetPropertyString("RelatePersonDisplayLastName"))
            '    aURL = cWebLib.AddQuerystringParameter(aURL, "middle", aGPDC.GetPropertyString("RelatePersonDisplayMiddleName"))
            '    aURL = cWebLib.AddQuerystringParameter(aURL, "email", aGPDC.GetPropertyString("RelatePersonDisplayEmail"))
            '    aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "AwardeeList")
            '    Response.Redirect(aURL)
            'End If
            'CreateNewPerson(aGPDC)
        End If
        'EventController_NavigateToModulePageKey("AdditionalInstitutionContacts")
        Return True
    End Function

'=============================================================

End Class 'cPeople_Editor

End Namespace 'Easygrants_Web.Controls.PageSection