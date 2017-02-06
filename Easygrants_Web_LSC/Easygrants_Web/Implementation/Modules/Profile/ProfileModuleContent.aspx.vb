Imports System.Xml
Imports System.Diagnostics
Imports Core.Web.Navigation
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web
Imports EasyGrants.DataAccess
Imports Core.Web.cEventController
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Profile

Public Class cProfileModuleContent
    Inherits EasyGrants.Web.Modules.cProfileModulePage
'=============================================================

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
        'AddHandler Me.Load, AddressOf Me.Page_Load
    End Sub

#End Region
'=============================================================

    Public Overrides Sub CorePage_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CorePage_Load(aSrc, aEvent)
	End Sub

'-----------------------------------------------------
	
	Public Sub RedirectToModule(ByVal aModuleName As String, ByVal aModuleConfig As String, ByVal aPageKey As String)
		dim aUser as cEGUser
		dim aHomeUser as cEGUser
		dim aModuleDoc as cXMLDoc
		dim	aModuleNode as XmlNode
		
		aHomeUser = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser)
		
	    if aModuleConfig = "ProfileModuleConfig" then
			if aHomeUser.AccessLevel > 1 then
				aModuleConfig = "StaffProfileModuleConfig"
			End If	
		End If
		
		aUser = me.EGSession.EGUser_From_ModuleConfig(aModuleName, aModuleConfig, aModuleDoc)
		
		if not aUser is nothing then
			aUser.PersonID = aHomeUser.PersonID
			
			if aModuleConfig = "ModuleConfig" then aUser.AccessLevel = 2
			
			aModuleNode = aModuleDoc.DocElement.SelectSingleNode("Module")
			
			dim	aPageName as String = cXMLDoc.AttributeToString(aModuleNode, "PageName")
			me.EGSession.RedirectUserToModule(aUser, aModuleName, aModuleConfig, aPageName, aPageKey)
		end if
		
	End Sub

Public Sub Save(ByVal aPageKey as String, ByVal aID as String, ByVal aEntityID as String, ByVal aEntityTypeID as String, ByVal aReturnURL as String)
    
	Dim ddPrefix As cDropDown = CType(CType(Page, cModulePage).PageContentCtl, cDataPresenterCtl).FindControl("ctlPrefix")
	Dim tFirst As cTextBox = CType(CType(Page, cModulePage).PageContentCtl, cDataPresenterCtl).FindControl("ctlFirst")
	Dim tMiddle As cTextBox = CType(CType(Page, cModulePage).PageContentCtl, cDataPresenterCtl).FindControl("ctlMiddle")
	Dim tLast As cTextBox = CType(CType(Page, cModulePage).PageContentCtl, cDataPresenterCtl).FindControl("ctlLast")
	Dim ddSuffix As cDropDown = CType(CType(Page, cModulePage).PageContentCtl, cDataPresenterCtl).FindControl("ctlSuffix")
    dim aPrefixID as String = ddPrefix.SelectedValue
    dim aFirst as String = tFirst.Value
    dim aMiddle as String = tMiddle.Value
    dim aLast as String = tLast.Value
    dim aSuffixID as String = ddSuffix.SelectedValue
    dim aStartIndex as Integer
    dim aPersonID as Integer
    aStartIndex = aEntityID.IndexOf("=") + 1        
    aPersonID = aEntityID.Substring(aStartIndex)

    SavePerson(aPersonID, aPrefixID, aFirst, aMiddle, aLast, aSuffixID)
    CType(Ctype(Page, cModulePage).PageContentCtl, cDataPresenterCtl).EventController_NavigateToModulePageKey(aPageKey, aID, aEntityID, aEntityTypeID, aReturnURL)  
End Sub

Public Sub SavePerson(ByVal aPersonID as Integer, ByVal aPrefixID as String, ByVal aFirst as String, ByVal aMiddle as String, ByVal aLast as String, _
    ByVal aSuffixID as String)
    dim aPersonDO as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aPersonID.ToString())
    if not aPersonDO is nothing then
        aPersonDO("PrefixID") = aPrefixID
        aPersonDO("FirstName") = aFirst
        aPersonDO("MiddleName") = aMiddle
        aPersonDO("LastName") = aLast
        aPersonDO("SuffixID") = aSuffixID
        aPersonDO.SaveData()
    End If
End Sub


'=============================================================
End Class 'cHomeModuleContent

End Namespace 'Easygrants_Web.Modules.Home