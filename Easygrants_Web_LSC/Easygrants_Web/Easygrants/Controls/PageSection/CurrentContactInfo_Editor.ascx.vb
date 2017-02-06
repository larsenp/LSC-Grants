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
Imports System.Text
Imports Core.Web.SvrCtls
Imports Easygrants_Web.Controls.Base

Namespace Easygrants_Web.Controls.PageSection
    Public MustInherit Class cCurrentContactInfo_Editor
        Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================
		'CLASS SUMMARY -
		'wt: 11/11/2004 - This code checks to see if a GRANTEE_PROJECT_PI record exists for a given 
		'grantee_project_id and pi_type_id=1.  If it does not exist, the controls are loaded with user 
		'profile information, and blank if there's no user profile information.  Informal Name will be 
		'pre-populated with First Name, Title as Principal Investigator, and Position Years as blank.  
		'However, if a GRANTEE_PROJECT_PI record does exist, the controls are loaded with data from this 
		'existing record.  Informal Name will be pre-populated with First Name if Informal Name is blank.  
		'Saving in all scenarios will be handled by the DataObjectCollection and will save the information 
		'from the controls to GRANTEE_PROJECT_PI.
'=============================================================
		'Declare controls
        Protected mSvButton As String
  '      Protected trSaveAndCancel As HtmlTableRow
		'Protected ctlPrefix As cDropDown
		'Protected ctlFirst As cTextBox
		'Protected ctlMiddle As cTextBox
		'Protected ctlLast As cTextBox
		'Protected ctlInformalName As cTextBox
		'Protected ctlSuffix As cDropDown
		Protected ctlTitle As cTextBox
		'Protected ctlInstitution As HtmlGenericControl
		'Protected ctlDegreeYear As HtmlGenericControl
		'Protected ctlFacultyRankType As HtmlGenericControl
		'Protected ctlPositionYears As cTextBox
		'Protected ctlAddress1 As cTextBox
		'Protected ctlAddress2 As cTextBox
		'Protected ctlAddress3 As cTextBox
		'Protected ctlCity As cTextBox
		'Protected ctlState As cDropDown
		'Protected ctlZip As cTextBox
		'Protected ctlCountry As cDropDown
		'Protected ctlEmail As cEmailTextBox
		'Protected ctlPhoneNumber As cTextBox
		Protected ctlOrgSelectLauncher as cOrgSelectLauncherNotInList

'=============================================================
		Public Property SvButton() As String
			Get
				Return mSvButton
			End Get
			Set(ByVal Value As String)
				mSvButton = Value
			End Set
		End Property
'=============================================================
		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			'If SvButton = "NoShow" Then
			'	trSaveAndCancel.Visible = False
			'End If
			'Define_Controls()
		End Sub
'-------------------------------------------------------------
		'Private Sub Define_Controls()
		'	ctlPrefix = CType(Me.FindControl("ctlPrefix"), cDropDown)
		'	ctlFirst = CType(Me.FindControl("ctlFirst"), cTextBox)
		'	ctlMiddle = CType(Me.FindControl("ctlMiddle"), cTextBox)
		'	ctlLast = CType(Me.FindControl("ctlLast"), cTextBox)
		'	ctlInformalName = CType(Me.FindControl("ctlInformalName"), cTextBox)
		'	ctlSuffix = CType(Me.FindControl("ctlSuffix"), cDropDown)
		'	ctlTitle = CType(Me.FindControl("ctlTitle"), cTextBox)
		'	ctlInstitution = CType(Me.FindControl("ctlInstitution"), HtmlGenericControl)
		'	ctlDegreeYear = CType(Me.FindControl("ctlDegreeYear"), HtmlGenericControl)
		'	ctlFacultyRankType = CType(Me.FindControl("ctlFacultyRankType"), HtmlGenericControl)
		'	ctlPositionYears = CType(Me.FindControl("ctlPositionYears"), cTextBox)
		'	ctlAddress1 = CType(Me.FindControl("ctlAddress1"), cTextBox)
		'	ctlAddress2 = CType(Me.FindControl("ctlAddress2"), cTextBox)
		'	ctlAddress3 = CType(Me.FindControl("ctlAddress3"), cTextBox)
		'	ctlCity = CType(Me.FindControl("ctlCity"), cTextBox)
		'	ctlState = CType(Me.FindControl("ctlState"), cDropDown)
		'	ctlZip = CType(Me.FindControl("ctlZip"), cTextBox)
		'	ctlCountry = CType(Me.FindControl("ctlCountry"), cDropDown)
		'	ctlEmail = CType(Me.FindControl("ctlEmail"), cEmailTextBox)
		'	ctlPhoneNumber = CType(Me.FindControl("ctlPhoneNumber"), cTextBox)
		'End Sub
'-------------------------------------------------------------
		'Public Overrides Sub CoreCtl_SetValues()
		'	MyBase.CoreCtl_SetValues()

		'	Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		'	Dim aPersonID As String = aUser.PersonID.ToString()
		'	Dim aObjListUser As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Person", _
		'		"PersonID", aPersonID)
		'	Dim aObjListPI As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectPI", _
		'				"GranteeProjectID", CType(CType(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID, "PITypeID", "1")

		'	'Check GRANTEE_PROJECT_PI for given grantee_project_id and pi_type_id=1 (primary).
		'	If aObjListPI.Count < 1 Then  'No PI record
		'		If aObjListUser.Count > 0 Then 'User record exists, populate controls with user profile information.
		'			'ctlPrefix.SelectedField = aObjListUser(0).GetPropertyString("PrefixID")
		'			'ctlFirst.Value = aObjListUser(0).GetPropertyString("FirstName")
		'			'ctlMiddle.Value = aObjListUser(0).GetPropertyString("MiddleName")
		'			'ctlLast.Value = aObjListUser(0).GetPropertyString("LastName")
		'			'ctlInformalName.Value = ctlFirst.Value
		'			'ctlSuffix.SelectedField = aObjListUser(0).GetPropertyString("SuffixID")
		'			'ctlTitle.Value = "Principal Investigator"
		'			ctlInstitution.InnerText = aObjListUser(0).GetRelatedPropertyString("PersonPrimaryAffiliation.Organization.OrganizationName")
		'		'	ctlDegreeYear.InnerText = aObjListUser(0).GetRelatedPropertyString("PersonEligibility.DegreeYear")
		'		'	ctlFacultyRankType.InnerText = aObjListUser(0).GetRelatedPropertyString("PersonEligibility.RankType.Abbr")
		'		'	ctlPositionYears.Value = ""
		'		'	ctlAddress1.Value = aObjListUser(0).GetRelatedPropertyString("PrimaryAddress.Address1")
		'		'	ctlAddress2.Value = aObjListUser(0).GetRelatedPropertyString("PrimaryAddress.Address2")
		'		'	ctlCity.Value = aObjListUser(0).GetRelatedPropertyString("PrimaryAddress.City")
		'		'	ctlState.SelectedField = aObjListUser(0).GetRelatedPropertyString("PrimaryAddress.StateID")
		'		'	ctlZip.Value = aObjListUser(0).GetRelatedPropertyString("PrimaryAddress.Zip")
		'		'	ctlCountry.SelectedField = aObjListUser(0).GetRelatedPropertyString("PrimaryAddress.CountryID")
		'		'	ctlEmail.Value = aObjListUser(0).GetRelatedPropertyString("PersonPrimaryEMail.ContactValue1")
		'		'	ctlPhoneNumber.Value = aObjListUser(0).GetRelatedPropertyString("PersonPrimaryPhone.ContactValue1")
		'		'Else
		'		'	ctlPrefix.SelectedField = "-1"
		'		'	ctlFirst.Value = ""
		'		'	ctlMiddle.Value = ""
		'		'	ctlLast.Value = ""
		'		'	ctlInformalName.Value = ""
		'		'	ctlSuffix.SelectedField = "-1"
		'		'	ctlTitle.Value = ""
		'		'	ctlInstitution.InnerText = ""
		'		'	ctlDegreeYear.InnerText = ""
		'		'	ctlFacultyRankType.InnerText = ""
		'		'	ctlPositionYears.Value = ""
		'		'	ctlAddress1.Value = ""
		'		'	ctlAddress2.Value = ""
		'		'	ctlCity.Value = ""
		'		'	ctlState.SelectedField = "-1"
		'		'	ctlZip.Value = ""
		'		'	ctlCountry.SelectedField = "-1"
		'		'	ctlEmail.Value = ""
		'		'	ctlPhoneNumber.Value = ""
		'		End If
		'	Else
		'		If ctlInformalName.Value = "" Then
		'			ctlInformalName.Value = ctlFirst.Value
		'		End If
		'	End If

		'End Sub
'-------------------------------------------------------------
		Public Overrides Sub DataPresenter_SaveDataObjects()
			MyBase.DataPresenter_SaveDataObjects()
			
			'dim aPersonDO as cDataObject
			Dim aUser As cEGUser
			dim aOrganizationID as Integer
			dim aGPDO as cDataObject
			dim aPerOrgAffList as cDataObjectList
			
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			'aPersonDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aUser.PersonID.ToString())
			'ctlTitle = CType(me.FindControl("ctlTitle"), cTextBox)
			'aPersonDO("Title") = ctlTitle.Value
			'WebSession.DataObjectFactory.SaveDataObject(aPersonDO)
			
			aGPDO = CType(me.DataObjectCollection("GranteeProject"), cDataObjectList)(0)
			ctlOrgSelectLauncher = CType(me.FindControl("ctlOrgSelectLauncher"), cOrgSelectLauncherNotInList)
			aOrganizationID = ctlOrgSelectLauncher.OrganizationID
			aPerOrgAffList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonOrganizationAffiliation", "PersonID", aUser.PersonID.ToString(), _
				"IsPrimary", "True")
			if aPerOrgAffList.Count = 0 then
				aPerOrgAffList = WebSession.DataObjectFactory.CreateNewDataObjectListFromKey("PersonOrganizationAffiliation")
				aPerOrgAffList(0)("TypeID") = 1
				aPerOrgAffList(0)("IsPrimary") = 1
			end if
				aPerOrgAffList(0)("PersonID") = aUser.PersonID
				aPerOrgAffList(0)("OrganizationID") = aOrganizationID	
				WebSession.DataObjectFactory.SaveDataObject(aPerOrgAffList(0))
		End Sub
'=============================================================

	End Class
End Namespace
