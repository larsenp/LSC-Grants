
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Login.Controls.Page

Public Class cRegistration
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================
	
	Protected ctlFirst As cTextBox
    Protected ctlUserName as cEmailTextBox
	Protected ctlPreferFirst As cTextBox
	Protected ctlPrimaryPhone As cTextBox
	Protected spnEventID As HtmlGenericControl

	
'=============================================================

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		
		'ctlFirst = CType(Me.FindControl("ctlFirst"), cTextBox)
  '      ctlPreferFirst = CType(Me.FindControl("ctlPreferFirst"), cTextBox)
        
  '      if ctlPreferFirst.Value = "" then
		'	ctlPreferFirst.Value = ctlFirst.Value
		'end if
		
	End Sub

'-------------------------------------------------------------

	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()
		
		Try
			ctlPrimaryPhone = Me.FindControl("ctlPrimaryPhone")
			If ctlPrimaryPhone.Value.Trim = "" Then
				Dim aPrimaryPhone As cDataObject = CType(Me.DataObjectCollection("PrimaryPhone"), cDataObjectList)(0)
				Dim PhoneID As String = aPrimaryPhone("PhoneID")
				WebSession.DataObjectFactory.DeleteData("Phone", PhoneID.ToString())
			End If

			Dim aUser As cDataObject = CType(Me.DataObjectCollection("User"), cDataObjectList)(0)

			If spnEventID.InnerText = "" Then
				aUser.RaiseEvent(15, aUser.GetPropertyInt("UserID", 0))
			Else
				aUser.RaiseEvent(spnEventID.InnerText, aUser.GetPropertyInt("UserID", 0))
			End If




		Catch
		End Try
	end sub
		
'-------------------------------------------------------------

'Invoked by EventController_ControlValidate
	Public Function ValidateDuplicateUserName(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aXmlDoc As cXMLDoc
		Dim aDataObject As cDataObject
        Dim aEmailDOList as cDataObjectList
		Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)


		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("User", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserName", aArgs.Value))
		aDataObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

        ctlUserName = Me.FindControl("ctlUserName")
		aEmailDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "ContactValue1", ctlUserName.Value, "EntityTypeID", "1")

		If aDataObject Is Nothing And aEmailDOList.Count = 0 Then
			ValidateDuplicateUserName = True
		Else
			ValidateDuplicateUserName = False
		End If
	End Function

'=============================================================

End Class 'cRegistration

End Namespace 'Easygrants_Web.Modules.Login.Controls.Page
