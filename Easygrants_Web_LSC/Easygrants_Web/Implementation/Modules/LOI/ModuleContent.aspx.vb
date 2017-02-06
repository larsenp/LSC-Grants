Imports System.Xml
Imports System.Diagnostics
Imports Core.Web.Navigation
Imports Easygrants.Workflow
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports Easygrants_Web.Controls.Base
Imports EasyGrants.Web.User
Imports Implementation.Web

Namespace Implementation.Modules.LOI

Public Class cModuleContent
	Inherits cValidationSubModulePageImpl
'=============================================================

        Public Overrides Sub CorePage_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CorePage_Load(aSrc, aEvent)

            If Not ModuleUser.MasterNavElement Is Nothing Then
                Dim aReturnHomeNavElement As cNavElement
                aReturnHomeNavElement = ModuleUser.MasterNavElement.Find_ChildElement("ReturnHome")

                If Not aReturnHomeNavElement Is Nothing Then
                    aReturnHomeNavElement.Visible = True
                    aReturnHomeNavElement.Enabled = True
                    'aReturnHomeNavElement.SourceFile = WebAppl.Remove_RootFromURL(aModuleState.LastURL)
                End If
            End If
		End Sub

'=============================================================

		

Public Sub Save(ByVal aPageKey as String, ByVal aID as String, ByVal aEntityID as String, ByVal aEntityTypeID as String, ByVal aReturnURL as String)

    dim ddPrefix as cDropDown = CType(Ctype(Page, cModulePage).PageContentCtl, cDataPresenterCtl).FindControl("ctlPrefix") 
    dim tFirst as cTextBox = CType(Ctype(Page, cModulePage).PageContentCtl, cDataPresenterCtl).FindControl("ctlFirst")
    dim tMiddle as cTextBox = CType(Ctype(Page, cModulePage).PageContentCtl, cDataPresenterCtl).FindControl("ctlMiddle")
    dim tLast as cTextBox = CType(Ctype(Page, cModulePage).PageContentCtl, cDataPresenterCtl).FindControl("ctlLast")
    dim ddSuffix as cDropDown = CType(Ctype(Page, cModulePage).PageContentCtl, cDataPresenterCtl).FindControl("ctlSuffix")
    dim tTitle as cTextBox = CType(Ctype(Page, cModulePage).PageContentCtl, cDataPresenterCtl).FindControl("ctlTitle")
    dim orgSelector as cOrgSelectLauncherNotInList = CType(Ctype(Page, cModulePage).PageContentCtl, cDataPresenterCtl).FindControl("ctlOrgSelectLauncher")
    
    dim aPrefixID as String = ddPrefix.SelectedValue
    dim aFirst as String = tFirst.Value
    dim aMiddle as String = tMiddle.Value
    dim aLast as String = tLast.Value
    dim aSuffixID as String = ddSuffix.SelectedValue
    dim aTitle as String = tTitle.Value
    dim aOrgID as String = orgSelector.OrganizationID
    dim aUser as cEGUser = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser)
    dim aStartIndex as Integer
    dim aPersonID as Integer

    aStartIndex = aEntityID.IndexOf("=") + 1        
    aPersonID = aEntityID.Substring(aStartIndex)

    SavePerson(aPersonID, aPrefixID, aFirst, aMiddle, aLast, aSuffixID, aTitle)
    SaveGP(aUser.GranteeProjectID.ToString(), aOrgID)
    CType(Ctype(Page, cModulePage).PageContentCtl, cDataPresenterCtl).EventController_NavigateToModulePageKey(aPageKey, aID, aEntityID, aEntityTypeID, aReturnURL)  
End Sub

Public Sub SavePerson(ByVal aPersonID as Integer, ByVal aPrefixID as String, ByVal aFirst as String, ByVal aMiddle as String, ByVal aLast as String, _
    ByVal aSuffixID as String, ByVal aTitle as String)
    dim aPersonDO as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aPersonID.ToString())
    if not aPersonDO is nothing then
        aPersonDO("PrefixID") = aPrefixID
        aPersonDO("FirstName") = aFirst
        aPersonDO("MiddleName") = aMiddle
        aPersonDO("LastName") = aLast
        aPersonDO("SuffixID") = aSuffixID
        aPersonDO("Title") = aTitle
        aPersonDO.SaveData()
    End If
End Sub

Public Sub SaveGP(ByVal aGranteeProjectID as String, ByVal aPrimaryOrgID as String)
    dim aGPDO as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aGranteeProjectID)
    if not aGPDO is nothing then
        aGPDO("PrimaryOrganizationID") = aPrimaryOrgID
        aGPDO.SaveData()
    End If
End Sub

'=============================================================
End Class 'cModuleContent

End Namespace 'Easygrants_Web.Modules.LOI