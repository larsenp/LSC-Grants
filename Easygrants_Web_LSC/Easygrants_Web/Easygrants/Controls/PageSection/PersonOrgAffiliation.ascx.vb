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
Imports Core.Web.SvrCtls

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cPersonOrgAffiliation
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================

    Protected spnProfile As HtmlGenericControl
        'Protected spnPerson As HtmlGenericControl
    Protected spnOrganization As HtmlGenericControl
	Protected trPersonReadOnly as HtmlTableRow
	Protected trPersonEditable as HtmlTableRow
	Protected trNewPerson as HtmlTableRow
	Protected trOrgReadOnly as HtmlTableRow
	Protected trOrgEditable as HtmlTableRow
	Protected trNewOrg as HtmlTableRow
	Protected spnAncAdmin as HtmlGenericControl
	Protected ctlPer As cPopUpSelectorLauncher2
	Protected ctlOrga As cPopUpSelectorLauncher2
    Protected ctlType as cDropDown
    Protected ctlIsPrimary as cCheckBox
	Protected ctlIsPrimaryContact As cCheckBox

'=============================================================

	Public ReadOnly Property QueryID as String
		Get
			dim aFrom as String = request.QueryString("Origin")
			
			if aFrom <> "" then return aFrom
			
			Return "Person"
		End Get		
	End Property	

'-----------------------------------------------------

	Public ReadOnly Property NewObj as String
		Get
			dim aNewObj as String = request.QueryString("NewObj")
			
			Return aNewObj
		End Get		
	End Property	

'-----------------------------------------------------

	Public ReadOnly Property DataObjectCollectionKey as String
		Get
			return "PersonOrganizationAffiliation"
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

'-----------------------------------------------------

	Public ReadOnly Property modulename() As String
		Get
			If QueryID = "Person" Then
					modulename = "Edit " + GetLabel("Organization") + " Affiliation"
			ElseIf QueryID = "Organization" Then
                    modulename = "Person Affiliation Editor"
			End If
		End Get
	End Property


'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		ctlPer = CType(Me.FindControl("ctlPer"), cPopUpSelectorLauncher2)
		ctlOrga = CType(Me.FindControl("ctlOrga"), cPopUpSelectorLauncher2)
		ctlType = CType(me.FindControl("ctlType"), cDropDown) 
		ctlIsPrimary = CType(me.FindControl("ctlIsPrimary"), cCheckBox) 
            ctlIsPrimaryContact = CType(Me.FindControl("ctlIsPrimaryContact"), cCheckBox)

		If CType(Page, cModulePage).CurrentModuleName = "Profile" Then
			spnProfile.Visible = True
                'ElseIf QueryID = "Person" Then
                '	spnPerson.Visible = True
		ElseIf QueryID = "Organization" Then
			spnOrganization.Visible = True
		End If

		spnAncAdmin.Visible = False
		trNewOrg.Visible = False
		trNewPerson.Visible = False
		trPersonReadOnly.Visible = False
		trPersonEditable.Visible = False
		trOrgReadOnly.Visible = False
		trOrgEditable.Visible = False

		If QueryID = "Person" Then
			If WebSession.HasStaffUser Then
				trOrgEditable.Visible = True
				trNewOrg.Visible = True
				trPersonReadOnly.Visible = True
			Else
				spnAncAdmin.Visible = True
			End If
		End If

		If QueryID = "Organization" Then
			trPersonEditable.Visible = True
			trNewPerson.Visible = True
			trOrgReadOnly.Visible = True
		End If

		If trNewOrg.Visible = True Then
			spnAncAdmin.Visible = False
		End If

	End Sub

'-----------------------------------------------------

	Public Sub AddSessionVariables()
		Session.Add("OrgID", ctlOrga.ObjID)
		Session.Add("Org", ctlOrga.ObjName)
		Session.Add("PersonID", ctlPer.ObjID)
		Session.Add("Person", ctlPer.ObjName)
		Session.Add("Origin", me.request.QueryString("Origin"))
		Session.Add("PersonOrgAffID", request.QueryString("PersonOrganizationAffiliationID"))
		Session.Add("Type", ctlType.SelectedValue)
		Session.Add("IsPrimary", ctlIsPrimary.BaseCheckButton.Checked)
		Session.Add("IsPrimaryContact", ctlIsPrimaryContact.BaseCheckButton.Checked)
	End Sub

'-----------------------------------------------------

	Public Sub RemoveSessionVariables()
		Session.Remove("OrgID")
		Session.Remove("Org")
		Session.Remove("PersonID")
		Session.Remove("Person")
		Session.Remove("Origin")
		Session.Remove("PersonOrgAffID")
		Session.Remove("AddNewOrg")
		Session.Remove("AddNewPerson")
		Session.Remove("Add")
		Session.Remove("Type")
		Session.Remove("IsPrimary")
		Session.Remove("Desc")
		Session.Remove("IsPrimaryContact")
	End Sub

'-----------------------------------------------------


	Public Overrides Sub CoreCtl_SetValues()
		Dim aDataObject As cDataObject
		MyBase.CoreCtl_SetValues()
		'if a new organization/person was not added
		if CType(me.Session("Add"), String) <> "True" then
			If QueryID = "Person" Or NewObj = "Person" Then
				aDataObject = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", PersonID)
				ctlPer.ObjID = PersonID
				ctlPer.ObjName = aDataObject.GetPropertyString("LastNameFirstName")
			End If
			If QueryID = "Organization" Or NewObj = "Organization" Then
				aDataObject = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Organization", OrganizationID)
				ctlOrga.ObjID = OrganizationID
				ctlOrga.ObjName = aDataObject.GetPropertyString("CommonOrganizationName")
			End If
		else
			'if a new Organization was added, we set pop up selector launcher controls with new values, otherwise set controls with session
			if CType(me.Session("AddNewOrg"), String) = "True" then
				aDataObject = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Organization", OrganizationID)
				ctlOrga.ObjID = OrganizationID
				ctlOrga.ObjName = aDataObject.GetPropertyString("CommonOrganizationName")
			else
				ctlOrga.ObjID = Session("OrgID")
				ctlOrga.ObjName = Session("Org")
			end if
			'if a new Person was added, we set pop up selector launcher controls with new values, otherwise set controls with session
			if CType(me.Session("AddNewPerson"), String) = "True" then
				aDataObject = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", PersonID)
				ctlPer.ObjID = PersonID
				ctlPer.ObjName = aDataObject.GetPropertyString("LastNameFirstName")
			else
				ctlPer.ObjID = PersonID
				ctlPer.ObjName = Session("Person")
			end if
			'set rest of controls with sessions
			ctlType.SelectedField = Session("Type")
			ctlIsPrimary.BaseCheckButton.Checked = Session("IsPrimary")
			ctlIsPrimaryContact.BaseCheckButton.Checked = Session("IsPrimaryContact")
		end if		
	End Sub

'=============================================================

	Public Sub AddPerson(ByVal aPageKey as String, ByVal aPersonID as String, ByVal aSrc as String, ByVal aReturnURL as String)
		AddSessionVariables()
		'needed  to set controls correctly when adding a new person
		Session.Add("Add", "True")
		if CType(me.Session("AddNewPerson"), String) <> "" then
			Session.Remove("AddNewPerson")
		end if
		EventController_NavigateToModulePageKey(aPageKey, aPersonID, aSrc, aReturnURL)
	End Sub

'=============================================================

	Public Sub AddOrganization(ByVal aPageKey as String, ByVal aOrganizationID as String, ByVal aSrc as String, ByVal aReturnURL as String)
		AddSessionVariables()
		'needed  to set controls correctly when adding a new organization
		Session.Add("Add", "True")
		if CType(me.Session("AddNewOrg"), String) <> "" then
			Session.Remove("AddNewOrg")
		end if
		EventController_NavigateToModulePageKey(aPageKey, aOrganizationID, aSrc, aReturnURL)
	End Sub

'=============================================================


	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()
        
        Dim aPrimList As cDataObjectList
		Dim aAddrList As cDataObjectList
		Dim aPOA As cDataObject
	    Dim ctlIsPrimary As cCheckBox
	    Dim ctlIsPrimaryContact As cCheckBox
		Dim aDO As cDataObject
		
        ctlIsPrimary = CType(Me.FindControl("ctlIsPrimary"), cCheckBox)
        ctlIsPrimaryContact = CType(Me.FindControl("ctlIsPrimaryContact"), cCheckBox)
        aAddrList = me.DataObjectCollection("PersonOrganizationAffiliation")
        aPOA = aAddrList(0)
        
		'Mark all affiliations for the person as not Primary
        if ctlIsPrimary.Value = True then
			aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonOrganizationAffiliation", _
						"PersonID", aPOA.GetPropertyInt("PersonID", 0), "IsPrimary", "True")
			if not aPrimList is nothing then
				For Each aDO In aPrimList
					if aAddrList(0).GetPropertyInt("PersonOrganizationAffiliationID", 0) <> aDO.GetPropertyInt("PersonOrganizationAffiliationID", 0) then 
						aDO("IsPrimary") = False
						WebSession.DataObjectFactory.SaveDataObject(aDO)
					end if
				Next
			end If
		End If
		
		'Mark all contacts for the Organization as not Primary
        if ctlIsPrimaryContact.Value = True then
			aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonOrganizationAffiliation", _
						"OrganizationID", aPOA.GetPropertyInt("OrganizationID", 0), "IsPrimaryOrganizationContact", "True")
			if not aPrimList is nothing then
				For Each aDO In aPrimList
					if aAddrList(0).GetPropertyInt("PersonOrganizationAffiliationID", 0) <> aDO.GetPropertyInt("PersonOrganizationAffiliationID", 0) then 
						aDO("IsPrimaryOrganizationContact") = False
						WebSession.DataObjectFactory.SaveDataObject(aDO)
					end if
				Next
			end If
		End If
		
		'remove session variables
		RemoveSessionVariables()
	End Sub
	
'=============================================================

	Public Sub Cancel(ByVal aReturnURL as String)
		
		'remove sessions
		if CType(me.Session("PersonID"), String) <> "" Or CType(me.Session("OrgID"), String) <> "" then
			RemoveSessionVariables()
		end if
		
		EventController_NavigateToURL(aReturnURL)
		
	End Sub

        Public Sub SaveRedirect(ByVal aPersonOrgAffID As String, ByVal aReturnURL As String)

            RemoveSessionVariables()
            		
            If Request.QueryString("Origin") = "Person" Then
                EventController_NavigateToModulePageKey("POAEditorPerson", "PersonOrganizationAffiliationID=" + aPersonOrgAffID, "PersonID=" + PersonID, "Origin=" + Request.QueryString("Origin").ToString(), _
 "ReturnURL=" + aReturnURL)
            ElseIf Request.QueryString("Origin") = "Organization" Then
                EventController_NavigateToModulePageKey("POAEditorOrg", "PersonOrganizationAffiliationID=" + aPersonOrgAffID, "OrganizationID=" + OrganizationID, "Origin=" + Request.QueryString("Origin").ToString(), _
 "ReturnURL=" + aReturnURL)
            End If
        End Sub
        '=============================================================

        Private Sub InitializeComponent()

        End Sub
End Class
End Namespace