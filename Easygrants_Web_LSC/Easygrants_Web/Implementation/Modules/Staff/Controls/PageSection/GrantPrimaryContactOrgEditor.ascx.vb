Imports Core.DataAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Easygrants_Web.Controls.Base
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports Core.Web


Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
	Public MustInherit Class cGrantPrimaryContactOrgEditor
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Protected ctlPerson As cDropDown
		Protected ctlOrganization As cPopUpSelectorLauncher2
		Protected ctlRole As cDropDown
		Protected ctlDescription As cTextBox
		Protected ctlIsPrimary As cCheckBox


		Public ReadOnly Property OrganizationID() As String
			Get
				If Not Request.QueryString("OrganizationID") Is Nothing Then Return Request.QueryString("OrganizationID")

				Return ""
			End Get
		End Property

		Public ReadOnly Property PersonID() As String
			Get
				If Not Request.QueryString("PersonID") Is Nothing Then Return Request.QueryString("PersonID")

				Return ""
			End Get
		End Property

		Public ReadOnly Property GranteeProjectCollaboratingContactTypeID() As String
			Get
				If Not Request.QueryString("GranteeProjectCollaboratingContactTypeID") Is Nothing Then Return Request.QueryString("GranteeProjectCollaboratingContactTypeID")

				Return ""
			End Get
		End Property

		Public ReadOnly Property IsPrimary() As String
			Get
				If Not Request.QueryString("IsPrimary") Is Nothing Then Return Request.QueryString("IsPrimary")

				Return ""
			End Get
		End Property

		Public ReadOnly Property Description() As String
			Get
				If Not Request.QueryString("Description") Is Nothing Then Return Request.QueryString("Description")

				Return ""
			End Get
		End Property

		Public ReadOnly Property OrganizationName() As String
			Get
				If Not Request.QueryString("OrganizationName") Is Nothing Then Return Request.QueryString("OrganizationName")

				Return ""
			End Get
		End Property





		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			Dim PersonOrgAffDOL As cDataObjectList
			ctlOrganization = CType(Me.FindControl("ctlOrg"), cPopUpSelectorLauncher2)
			ctlRole = CType(Me.FindControl("ctlRole"), cDropDown)
			ctlDescription = CType(Me.FindControl("ctlDescription"), cTextBox)
			ctlIsPrimary = CType(Me.FindControl("ctlIsPrimary"), cCheckBox)
			ctlOrganization.ObjID = OrganizationID
			ctlOrganization.ObjName = OrganizationName


			Dim aItem As ListItem
			aItem = New ListItem("<Select>", "")
			ctlPerson.Items.Add(aItem)
				If OrganizationID <> "" Then
					PersonOrgAffDOL = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonOrganizationAffiliation", "OrganizationID", OrganizationID)
					For Each aDO As cDataObject In PersonOrgAffDOL
						aItem = New ListItem(aDO.GetRelatedPropertyString("Person.LastNameFirstName"), aDO.GetPropertyString("PersonID"))
						ctlPerson.Items.Add(aItem)
					Next
				End If

			ctlPerson.Set_ServerIndexChange(AddressOf btnGo_Click)
			If PersonID <> "" Then
				ctlPerson.SelectedField = PersonID
			End If
			If GranteeProjectCollaboratingContactTypeID <> "" Then
				ctlRole.SelectedField = GranteeProjectCollaboratingContactTypeID
			End If
			If Description <> "" Then
				ctlDescription.Value = Description
			End If
			If IsPrimary <> "" Then
				ctlIsPrimary.Value = IsPrimary
			End If

		End Sub


		Private Sub btnGo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
			Page_Redirect()
		End Sub

		Private Sub Page_Redirect()
			Dim aURL As String
			aURL = Request.Url.ToString().Substring(0, Request.Url.ToString().IndexOf("?"))
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Config", Request.QueryString("Config"))
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Page", Request.QueryString("Page"))
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "GranteeProjectID", Request.QueryString("GranteeProjectID"))
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "GranteeProjectPIID", Request.QueryString("GranteeProjectPIID"))
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "OrganizationID", ctlOrganization.ObjID)
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "OrganizationName", ctlOrganization.ObjName)
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "EntityTypeID", Request.QueryString("EntityTypeID"))
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "PersonID", ctlPerson.SelectedValue)
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "GranteeProjectCollaboratingContactTypeID", ctlRole.SelectedField)
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Description", ctlDescription.Value)
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "IsPrimary", ctlIsPrimary.Value)
			'aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "ReturnURL", Request.QueryString("ReturnURL"))
			Response.Redirect(aURL)
		End Sub

		Public Sub FindPersons()
			Dim PersonOrgAffDOL As cDataObjectList
			Dim aItem As ListItem
			If ctlPerson.SelectedValue = "" Then
				ctlPerson.Items.Clear()
				aItem = New ListItem("<Select>", "")
				ctlPerson.Items.Add(aItem)
				If ctlOrganization.ObjName <> "" Then
					PersonOrgAffDOL = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonOrganizationAffiliation", "OrganizationID", ctlOrganization.ObjID)
					For Each aDO As cDataObject In PersonOrgAffDOL
						aItem = New ListItem(aDO.GetRelatedPropertyString("Person.LastNameFirstName"), aDO.GetPropertyString("PersonID"))
						ctlPerson.Items.Add(aItem)
					Next
				End If
			End If
			Page_Redirect()
		End Sub


		Public Overrides Sub DataPresenter_SaveDataObjects()
			Dim aItem As ListItem
			Dim GPDOL As cDataObjectList
			Dim GDOL As cDataObjectList
			Dim PersonOrgAffDOL As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonOrganizationAffiliation", "OrganizationID", ctlOrganization.ObjID, "PersonID", ctlPerson.SelectedField)
			If PersonOrgAffDOL.Count = 0 Then
				ctlPerson.Items.Clear()
				aItem = New ListItem("<Select>", "")
				ctlPerson.Items.Add(aItem)
			End If
			Page.Validate()
			If Not Page.IsValid Then
				Exit Sub
			End If
			MyBase.DataPresenter_SaveDataObjects()
			Dim GranteeProjectPIDOL As cDataObjectList
			GranteeProjectPIDOL = Me.DataObjectCollection("GrantPrimaryContactEditorGranteeProjectPI")
			GranteeProjectPIDOL(0)("PersonID") = ctlPerson.SelectedField
			GranteeProjectPIDOL(0).SaveData()

			'Mark all Primary Contacts for the person as not Primary
			Dim aPrimList As cDataObjectList
			aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectPI", _
							"GranteeProjectID", Request.QueryString("GranteeProjectID").ToString, "IsPrimary", "1")
			If ctlIsPrimary.Value = True Then
				If Not aPrimList Is Nothing Then
					For Each aDO As cDataObject In aPrimList
						If GranteeProjectPIDOL(0).GetPropertyInt("GranteeProjectPIID", 0) <> aDO.GetPropertyInt("GranteeProjectPIID", 0) Then
							aDO("IsPrimary") = False
							WebSession.DataObjectFactory.SaveDataObject(aDO)
						End If
					Next
				End If
			Else
				If aPrimList.Count = 0 Then
					GranteeProjectPIDOL(0)("IsPrimary") = True
					WebSession.DataObjectFactory.SaveDataObject(GranteeProjectPIDOL(0))
				End If
			End If

			If ctlIsPrimary.Value = True Then
				GPDOL = Me.DataObjectCollection("GranteeProject")
				GPDOL(0).DataObjectList.UserID = CType(Page, cModulePage).ModuleUser.UserID
				GPDOL(0)("PrimaryOrganizationID") = ctlOrganization.ObjID
				GPDOL(0)("PrimaryPersonID") = ctlPerson.SelectedField
				GPDOL(0).SaveData()

				GDOL = GPDOL(0).GetRelatedPropertyDataObjectList("Grantee")
				GDOL(0)("EntityID") = ctlOrganization.ObjID
				GDOL(0)("EntityTypeID") = Request.QueryString("EntityTypeID")
				GDOL(0).SaveData()
			End If
		End Sub

		Public Sub ValidatePrimaryContact(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
			If ctlIsPrimary.Value = False Then
				Dim aPrimList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectPI", "GranteeProjectID", Request.QueryString("GranteeProjectID"), "IsPrimary", "1")
				If aPrimList.Count = 0 Then
					aArgs.IsValid = False
					Exit Sub
				End If
			End If
			aArgs.IsValid = True
		 End Sub

	End Class
End Namespace