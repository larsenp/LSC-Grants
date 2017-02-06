Imports Core_Web.Controls.Base
Imports Core.DataAccess
Namespace Implementation.Modules.Staff.Controls.Page.Contacts
    Public MustInherit Class cGranteeProjectAffiliationEditor
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

        Protected spnProjTitle As HtmlGenericControl
        Protected spnContact As HtmlGenericControl
        Protected ctlGrant As cPopUpSelectorLauncher2

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)



		End Sub

        Public Overrides Sub CoreCtl_SetValues()
            MyBase.CoreCtl_SetValues()
            Dim aGranteeProject As cDataObjectList
            ctlGrant = CType(Me.FindControl("ctlGrant"), cPopUpSelectorLauncher2)
            aGranteeProject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProject", "GranteeProjectID", ctlGrant.ObjID)
            If aGranteeProject.Count > 0 Then
                spnProjTitle.InnerText = aGranteeProject(0).GetPropertyString("GrantTitle")
                spnContact.InnerText = aGranteeProject(0).GetRelatedPropertyString("PrimaryPerson.FirstNameLastName")
            Else
                spnProjTitle.InnerText = "Not Selected"
                spnContact.InnerText = "Not Selected"
            End If

        End Sub


    End Class
End Namespace
