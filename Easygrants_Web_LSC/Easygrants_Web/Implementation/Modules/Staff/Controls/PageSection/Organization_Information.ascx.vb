Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cOrganization_Information
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

'=============================================================

	Protected tblName As HtmlTable
	Protected tblAddr1 As HtmlTable
	Protected tblAddr2 As HtmlTable
	Protected tblAddr3 As HtmlTable
        Protected tblCityStateZip As HtmlTable
        Private mOrganizationID As Integer

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)
            btnEditDelete_SetVisibility()

		'need to remove matching sessions in case crumb trail is used for nav
		Session.Remove("AddNewPerson")
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

        '=============================================================


        Public Property OrganizationID() As Integer
            Get
                If mOrganizationID = Nothing Then
                    If Not Request.QueryString("OrganizationID") Is Nothing Then
                        mOrganizationID = Request.QueryString("OrganizationID")

                    ElseIf Not Request.QueryString("GranteeProjectID") Is Nothing Then
                        Dim aGP As cDataObject
                        aGP = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", Request.QueryString("GranteeProjectID"))
                        If Not aGP Is Nothing Then
                            mOrganizationID = aGP.GetPropertyInt("PrimaryOrganizationID")
                        End If
                    End If
                End If
                Return mOrganizationID
            End Get
            Set(ByVal PersonID As Integer)
                mOrganizationID = OrganizationID
            End Set
        End Property

        Protected Sub btnEditDelete_SetVisibility()
			Dim btnEdit As cCSSButton = GetControl("btnEdit")
			Dim btnDelete As cCSSButton = GetControl("btnDelete")
            'edit button visible only on contact details tab.
            If Page.Request.QueryString("Page") <> "OrganizationContact" Then
                btnEdit.Visible = False
                btnDelete.Visible = False
                Exit Sub
            End If

            If btnDelete Is Nothing Then
                Exit Sub
            End If

            ''Persons with grantee project affiliations cannot be deleted.
            Dim aGPList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProject", _
                "PrimaryOrganizationID", OrganizationID.ToString)
            If aGPList.Count > 0 Then
                btnDelete.Visible = False
                Exit Sub
            End If
            Dim aGPPAList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectOrganizationAffiliation", _
                "OrganizationID", OrganizationID.ToString)
            If aGPPAList.Count > 0 Then
                btnDelete.Visible = False
                Exit Sub
            End If
        End Sub

	End Class
End Namespace