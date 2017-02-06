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

Namespace Easygrants_Web.Modules.Home

Public Class cHomeModuleContent
    Inherits EasyGrants.Web.Modules.cHomeModulePage
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
	
'=============================================================
End Class 'cHomeModuleContent

End Namespace 'Easygrants_Web.Modules.Home