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

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cOrganizationContacts_Editor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

'Invoked by EventController_ControlValidate
	Public Function ValidateDuplicateRole(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ValidateDuplicateRole = True
		
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aXmlDoc As cXMLDoc
		Dim aDataObject As cDataObject

        Dim aUser As cEGUser
        aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
        
	    Dim ctlRole As cDropDown
		ctlRole = CType(Me.FindControl("ctlRole"), cDropDown)
		
		Dim iType As Integer
		iType = CType(ctlRole.SelectedValue, Integer)
		
		Dim iGranteeProjectPersonAffiliationID as Integer
		iGranteeProjectPersonAffiliationID = CType(Request.QueryString("GranteeProjectPersonAffiliationID"), Integer)

		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("GranteeProjectPersonAffiliation", aDataObjectNode, aFiltersNode)
		'aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", aUser.PersonID))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "GranteeProjectID", aUser.GranteeProjectID))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "GranteeMemberRoleID", iType))
		aDataObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

		If Not aDataObject Is Nothing Then
			If iGranteeProjectPersonAffiliationID > 0 Then
				If iGranteeProjectPersonAffiliationID <> aDataObject.GetPropertyInt("GranteeProjectPersonAffiliationID") Then
					ValidateDuplicateRole = False
				End If
			Else
				ValidateDuplicateRole = False
			End If			
		End If
	End Function

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
	End Sub

'=============================================================
	'Public Overrides Sub DataPresenter_SaveDataObjects()
		'MyBase.DataPresenter_SaveDataObjects()

		'If GranteeProjectPersonAffiliationID = 0 Then
		'	Dim aPerson As cDataObject
		'	Dim aEmail As cDataObject
		'	Dim aAddress As cDataObject
		'	Dim aPhone As cDataObject
		'	Dim aFax As cDataObject

		'	aPerson = Me.DataObjectCollection("Person")(0)
		'	if not aPerson is nothing then
		'		aEmail = Me.DataObjectCollection("Email")(0)
		'		aEmail("EntityID") = aPerson("PersonID")
		'		WebSession.DataObjectFactory.SaveDataObject(aEmail)
				
		'		aAddress = Me.DataObjectCollection("Address")(0)
		'		aAddress("EntityID") = aPerson("PersonID")
		'		WebSession.DataObjectFactory.SaveDataObject(aAddress)
				
		'		aPhone = Me.DataObjectCollection("Phone")(0)
		'		aPhone("EntityID") = aPerson("PersonID")
		'		WebSession.DataObjectFactory.SaveDataObject(aPhone)

		'		aFax = Me.DataObjectCollection("Fax")(0)
		'		aFax("EntityID") = aPerson("PersonID")
		'		WebSession.DataObjectFactory.SaveDataObject(aFax)
		'	End If			
		'End If
	'End Sub

'=============================================================

End Class
End Namespace