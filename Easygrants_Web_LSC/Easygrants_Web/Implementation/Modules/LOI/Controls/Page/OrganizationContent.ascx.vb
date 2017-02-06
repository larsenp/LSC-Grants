Imports Core.DataAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Modules.LOI.Controls.Page
Public MustInherit Class cOrganizationContent
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'============================================================= 

        Public Overrides Sub DataPresenter_SaveDataObjects()
            MyBase.DataPresenter_SaveDataObjects()

            Dim aUser As cEGUser
            aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)

            Dim aDO As cDataObject
            aDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aUser.GranteeProjectID.ToString())
            Dim aAddressDo As cDataObjectList = Me.DataObjectCollection("Address")
            If aAddressDo.Count > 0 Then
                aDO("PrimaryAddressID") = aAddressDo(0).GetPropertyString("AddressID")
                WebSession.DataObjectFactory.SaveDataObject(aDO)
            End If
        End Sub
    	
'=============================================================

End Class
End Namespace
