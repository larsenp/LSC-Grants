Imports Core.DataAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Easygrants_Web.Controls.Base
Namespace Easygrants_Web.Implementation.Modules.Application.Controls.Page
    Public MustInherit Class cProjectOtherContactInfo
        Inherits Core_Web.Controls.Base.cDataPresenterCtl
        ' Protected ctlOrgSelectLauncher As cOrgSelectLauncherNotInList
        'Public Overrides Sub DataPresenter_SaveDataObjects()
        '    ctlOrgSelectLauncher = CType(Me.FindControl("ctlOrgSelectLauncher"), cOrgSelectLauncherNotInList)
        '    If ctlOrgSelectLauncher.OrganizationID = "" Then
        '        ctlOrgSelectLauncher.OrganizationID = "-1"
        '    End If
        '    MyBase.DataPresenter_SaveDataObjects()
        '    Dim aOrganizationName As String
        '    Dim aOrganizationID As String
        '    Dim aGPDO As cDataObject
        '    Dim aPerOrgAffList As cDataObjectList
        '    Dim aUser As cEGUser
        '    aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)

        '    aGPDO = CType(Me.DataObjectCollection("GranteeProject"), cDataObjectList)(0)

        '    Dim aAddressDo As cDataObjectList = Me.DataObjectCollection("PrimaryAddress")
        '    If aAddressDo.Count > 0 Then
        '        aGPDO("PrimaryAddressID") = aAddressDo(0).GetPropertyString("AddressID")
        '        WebSession.DataObjectFactory.SaveDataObject(aGPDO)
        '    End If

        '    If ctlOrgSelectLauncher.OrganizationID = "" Then
        '        aOrganizationID = "-1"
        '    Else
        '        aOrganizationID = ctlOrgSelectLauncher.OrganizationID
        '    End If
        '    aOrganizationName = ctlOrgSelectLauncher.OrganizationName


        '    aPerOrgAffList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonOrganizationAffiliation", "PersonID", aUser.PersonID.ToString(), _
        '     "IsPrimary", "True")

        '    If aOrganizationID = "-1" And aPerOrgAffList.Count > 0 Then
        '        WebSession.DataObjectFactory.DeleteData(aPerOrgAffList)
        '        Exit Sub
        '    End If

        '    If aPerOrgAffList.Count = 0 Then
        '        aPerOrgAffList = WebSession.DataObjectFactory.CreateNewDataObjectListFromKey("PersonOrganizationAffiliation")
        '        aPerOrgAffList(0)("TypeID") = 1
        '        aPerOrgAffList(0)("IsPrimary") = 1
        '        aPerOrgAffList(0)("CreateUser") = aUser.UserID
        '        aPerOrgAffList(0)("CreateDate") = Now
        '    End If
        '    aPerOrgAffList(0)("ModifyUser") = aUser.UserID
        '    aPerOrgAffList(0)("ModifyDate") = Now
        '    aPerOrgAffList(0)("PersonID") = aUser.PersonID
        '    aPerOrgAffList(0)("OrganizationID") = aOrganizationID
        '    WebSession.DataObjectFactory.SaveDataObject(aPerOrgAffList(0))
        'End Sub
        '=============================================================
    End Class
End Namespace
