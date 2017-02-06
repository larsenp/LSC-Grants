Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cGranteeProjectPersonAffiliation
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================

	Protected ctlPer As cPopUpSelectorLauncher2
    Protected ctlInst As cDropDown
	Protected ctlRole As cTextBox
	Protected ctlDept As cTextBox
	Protected ctlEmail As cEmailTextBox
	Protected ctlPhone As cTextBox
	Protected ctlProjectTitle As cTextBox
	Protected ctlAwardYear As cTextBox
	Protected ctlActive As cCheckBox
	Protected ctlDescription As cTextArea
	
'=============================================================

	Public ReadOnly Property DataObjectCollectionKey as String
		Get
			return "GranteeProjectPersonAffiliation"
		End Get		
	End Property	

'-----------------------------------------------------

	Public ReadOnly Property PersonAffiliationDO as cDataObject
		Get
			Dim aDataObjectList As cDataObjectList
			
			aDataObjectList = DataObjectCollection(DataObjectCollectionKey)
			if aDataObjectList is nothing then return nothing
			if aDataObjectList.Count < 1 then return nothing
			return aDataObjectList(0)
		End Get		
	End Property	

'-----------------------------------------------------

	Public ReadOnly Property PersonID as String
		Get
			Dim aQueryStrVal as String
			
			aQueryStrVal = cWebLib.Get_QueryString(Request, "PersonID", "")
			if aQueryStrVal <> "" then return aQueryStrVal
			
			Dim aDataObject as cDataObject
			aDataObject = PersonAffiliationDO
			if not aDataObject is nothing then return aDataObject.GetPropertyString("PersonID", "0")
			
			return "0"
		End Get		
	End Property	
	
'-----------------------------------------------------

	Public ReadOnly Property OrganizationID as String
		Get
			Dim aQueryStrVal as String
			
			aQueryStrVal = cWebLib.Get_QueryString(Request, "OrganizationID", "")
			if aQueryStrVal <> "" then return aQueryStrVal
			
			Dim aDataObject as cDataObject
			aDataObject = PersonAffiliationDO
			if not aDataObject is nothing then  return aDataObject.GetPropertyString("OrganizationID", "0")
			
			return "0"
		End Get		
	End Property	
	
'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		
		Dim aItem As ListItem
		dim aObj as cDataObject
		
		if request.QueryString("Text") <> "" then
			ctlPer = CType(Me.FindControl("ctlPer"), cPopUpSelectorLauncher2)
			ctlPer.ObjName = request.QueryString("Text")
		
			Dim aList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonOrganizationAffiliation", _
				"PersonID", Request.QueryString("Value"))

			ctlPer.ObjID = Request.QueryString("Value")
			
			ctlInst = CType(Me.FindControl("ctlInst"), cDropDown)
			ctlInst.Items.Clear()
			aItem = New ListItem("<None>", "")
			ctlInst.Items.Add(aItem)

			For Each aObj In aList
				aItem = New ListItem(aObj.GetRelatedPropertyString("Organization.CommonOrganizationName"), aObj.GetPropertyString("OrganizationID"))
				If aObj.GetPropertyBool("IsPrimary") Then
					Me.ctlInst.Items.Insert(1, aItem)
				Else
					Me.ctlInst.Items.Add(aItem)
				End If
			Next
		end if
		
	End Sub

'-------------------------------------------------------------

	Public Sub Save(byval URL as String)
        
		Page.Validate()
		If Not Page.IsValid Then
			Exit Sub
		End If

        Dim aObj As cDataObject
		
		dim aPersonID as String = request.QueryString("Value")
		aObj = ctype(me.DataObjectCollection("GranteeProjectPersonAffiliation"), cDataObjectList)(0)
		
		if aPersonID <> "" then aObj("PersonID") = aPersonID
		
		aObj("GranteeProjectID") = request.QueryString("GranteeProjectID")
		ctlInst = CType(Me.FindControl("ctlInst"), cDropDown)
		aObj("OrganizationID") = ctlInst.SelectedField
		ctlRole = CType(Me.FindControl("ctlRole"), cTextBox)
		aObj("GranteeMemberRole") = ctlRole.Value
		ctlDept = CType(Me.FindControl("ctlDept"), cTextBox)
		aObj("Department") = ctlDept.Value
		ctlEmail = CType(Me.FindControl("ctlEmail"), cEmailTextBox)
		aObj("Email") = ctlEmail.Value
		ctlPhone = CType(Me.FindControl("ctlPhone"), cTextBox)
		aObj("Phone") = ctlPhone.Value
		ctlProjectTitle = CType(Me.FindControl("ctlProjectTitle"), cTextBox)
		aObj("ProjectTitle") = ctlProjectTitle.Value
		ctlAwardYear = CType(Me.FindControl("ctlAwardYear"), cTextBox)
		aObj("AwardYear") = ctlAwardYear.Value
		ctlActive = CType(Me.FindControl("ctlActive"), cCheckBox)
		aObj("Active") = ctlActive.Value
		ctlDescription = CType(Me.FindControl("ctlDescription"), cTextArea)
		aObj("Description") = ctlDescription.Value
		
		WebSession.DataObjectFactory.SaveDataObject(aObj)		
		response.Redirect(request.QueryString("ReturnURL"))
	End Sub
	
'=============================================================

End Class
End Namespace