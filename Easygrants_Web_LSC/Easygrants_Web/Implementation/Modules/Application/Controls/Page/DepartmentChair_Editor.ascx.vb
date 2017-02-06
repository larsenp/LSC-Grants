Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Modules.Application.Controls.Page
    Public MustInherit Class cDepartmentChair_Editor
        Inherits Core_Web.Controls.Base.cDataPresenterCtl
        
'=============================================================

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

'=============================================================

	'Invoked by EventController_ControlValidate
	Public Function ValidateDuplicateUserName(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aXmlDoc As cXMLDoc
		Dim aDataObject As cDataObject

		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("User", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserName", aArgs.Value))
		aDataObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

		If aDataObject Is Nothing Then
			ValidateDuplicateUserName = True
		Else
			ValidateDuplicateUserName = False
		End If
	End Function

'=============================================================

	Public Sub CreateNewPerson(ByVal aGPDC As cDataObject)
		If Not aGPDC Is Nothing Then
			'Create Person record
			Dim aPersonDO As cDataObject
			aPersonDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Person")
			aPersonDO("PrefixID") = aGPDC("PrefixID")
			aPersonDO("SuffixID") = aGPDC("SuffixID")
			aPersonDO("FirstName") = aGPDC("FirstName")
			aPersonDO("MiddleName") = aGPDC("MiddleName")
			aPersonDO("LastName") = aGPDC("LastName")
			aPersonDO("Degree") = aGPDC("Degree")
			WebSession.DataObjectFactory.SaveDataObject(aPersonDO)
		
			'Create User record
			Dim aUserDO As cDataObject
			aUserDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("User")
			aUserDO("PersonID") = aPersonDO("PersonID")
			aUserDO("UserName") = aGPDC("Email")
			Dim aRndNum As Random = New Random()
			aUserDO("Password") = aRndNum.Next(1000000, 1000000999).ToString()
			aUserDO("UserTypeID") = 1 'Applicant
			WebSession.DataObjectFactory.SaveDataObject(aUserDO)

			'Create Address record
			Dim aAddressDO As cDataObject
			aAddressDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Address")
			aAddressDO("EntityID") = aPersonDO("PersonID")
			aAddressDO("EntityTypeID") = 1 'person
			aAddressDO("Address1") = aGPDC("Address1")
			aAddressDO("Address2") = aGPDC("Address2")
			aAddressDO("Address3") = aGPDC("Address3")
			aAddressDO("City") = aGPDC("City")
			aAddressDO("StateID") = aGPDC("StateID")
			aAddressDO("CountryID") = aGPDC("CountryID")
			aAddressDO("Zip") = aGPDC("Zip")
			aAddressDO("Title") = aGPDC("Title")
			aAddressDO("IsPrimary") = True
			WebSession.DataObjectFactory.SaveDataObject(aAddressDO)

			'Create Email record
			Dim aEmailDO As cDataObject
			aEmailDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Email")
			aEmailDO("EntityID") = aPersonDO("PersonID")
			aEmailDO("EntityTypeID") = 1 'person
			aEmailDO("ContactValue1") = aGPDC("Email")
			aEmailDO("EmailTypeID") = 1 'business
			aEmailDO("IsPrimary") = True
			WebSession.DataObjectFactory.SaveDataObject(aEmailDO)

			'Create Phone record
			Dim aPhoneDO As cDataObject
			aPhoneDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Phone")
			aPhoneDO("EntityID") = aPersonDO("PersonID")
			aPhoneDO("EntityTypeID") = 1 'person
			aPhoneDO("ContactValue1") = aGPDC("PhoneNumber")
			aPhoneDO("PhoneTypeID") = 1 'work
			aPhoneDO("IsPrimary") = True
			WebSession.DataObjectFactory.SaveDataObject(aPhoneDO)
		
			aGPDC("PersonID")  = aPersonDO("PersonID")
			WebSession.DataObjectFactory.SaveDataObject(aGPDC)
			EventController_NavigateToModulePageKey("AdditionalInstitutionContacts")
		End If		
	End Sub

'=============================================================

    Public Overloads Overrides Function EventController_Save() As Boolean
        MyBase.EventController_Save()

		If Not Page.IsValid Then
			Return False
		End If
		
		Dim aGPDC As cDataObject
		aGPDC = Me.DataObjectCollection("GranteeProjectDepartmentChair")(0)
		
		Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		aGPDC("GranteeProjectID") = aUser.GranteeProjectID
		
		If aGPDC.GetPropertyString("PersonID", 0) = 0 Then

			Dim aXmlDoc As cXMLDoc
			Dim aDataObjectNode As XmlNode
			Dim aFiltersNode As XmlNode
			Dim aArgNode As XmlNode
			Dim aObjList As cDataObjectList
			Dim aURL As String

			' search for matching FirstName and LastName
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Person", aDataObjectNode, aFiltersNode)
			aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", _
						"FirstName", aGPDC.GetPropertyString("FirstName"))
			cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
			aArgNode.Attributes("Operator").Value = "Like"

			aFiltersNode.AppendChild(aArgNode)

			aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", _
						"LastName", aGPDC.GetPropertyString("LastName"))
			cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
			aArgNode.Attributes("Operator").Value = "Like"

			aFiltersNode.AppendChild(aArgNode)

			aObjList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)

			If aObjList.Count > 0 Then
				aURL = Request.RawUrl.ToString()
				aURL = cWebLib.AddQuerystringParameter(aURL, "GranteeProjectDepartmentChairID", aGPDC.GetPropertyString("GranteeProjectDepartmentChairID"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "first", aGPDC.GetPropertyString("FirstName"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "last", aGPDC.GetPropertyString("LastName"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "middle", aGPDC.GetPropertyString("MiddleName"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "email", aGPDC.GetPropertyString("Email"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "DepartmentChairList")
				Response.Redirect(aURL)
			End If

			' search for matching FirstName and MiddleName
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Person", aDataObjectNode, aFiltersNode)
			aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", _
						"FirstName", aGPDC.GetPropertyString("FirstName"))
			cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
			aArgNode.Attributes("Operator").Value = "Like"

			aFiltersNode.AppendChild(aArgNode)

			aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", _
						"LastName", aGPDC.GetPropertyString("MiddleName"))
			cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
			aArgNode.Attributes("Operator").Value = "Like"

			aFiltersNode.AppendChild(aArgNode)

			aObjList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)

			If aObjList.Count > 0 Then
				aURL = Request.RawUrl.ToString()
				aURL = cWebLib.AddQuerystringParameter(aURL, "GranteeProjectDepartmentChairID", aGPDC.GetPropertyString("GranteeProjectDepartmentChairID"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "first", aGPDC.GetPropertyString("FirstName"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "last", aGPDC.GetPropertyString("LastName"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "middle", aGPDC.GetPropertyString("MiddleName"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "email", aGPDC.GetPropertyString("Email"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "DepartmentChairList")
				Response.Redirect(aURL)
			End If

			' search for matching email
			aObjList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "ContactValue1", aGPDC.GetPropertyString("Email"))
			If aObjList.Count > 0 Then
				aURL = Request.RawUrl.ToString()
				aURL = cWebLib.AddQuerystringParameter(aURL, "GranteeProjectDepartmentChairID", aGPDC.GetPropertyString("GranteeProjectDepartmentChairID"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "first", aGPDC.GetPropertyString("FirstName"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "last", aGPDC.GetPropertyString("LastName"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "middle", aGPDC.GetPropertyString("MiddleName"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "email", aGPDC.GetPropertyString("Email"))
				aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "DepartmentChairList")
				Response.Redirect(aURL)
			End If
			CreateNewPerson(aGPDC)
		End If
		'EventController_NavigateToModulePageKey("AdditionalInstitutionContacts")
		return True
	End Function

'=============================================================
	
    End Class
End Namespace
