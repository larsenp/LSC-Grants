Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules
Imports EasyGrants.Web
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Modules.Staff.Controls.Page

Public MustInherit Class cUserHome_Content
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

#Region " Web Form Designer Generated Code "

	'This call is required by the Web Form Designer.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

	End Sub

	Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
		'CODEGEN: This method call is required by the Web Form Designer
		'Do not modify it using the code editor.
		InitializeComponent()
	End Sub

#End Region

	Protected txtLoginID As HtmlInputText

'=============================================================

'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

	End Sub

'=============================================================

	Public Sub btnLogin_Click(ByVal aUserName As String)
		Dim aEGSession As cEGSession = CType(CorePage, cEGPage).EGSession
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aXmlDoc As cXMLDoc
		Dim aModuleDoc As cXMLDoc
		Dim aUserDO As cDataObject
		Dim aUser As cEGUser

		aXmlDoc = aEGSession.DataObjectFactory.CreateDataObjectNode("User", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(aEGSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserName", aUserName))

		aUserDO = aEGSession.DataObjectFactory.GetDataObject(aDataObjectNode)
		If aUserDO Is Nothing Then
			CorePage.Redirect()
			Exit Sub
		End If

		aEGSession.Remove_All_NonStaff_Users()
		aUser = aEGSession.EGUser_From_UserDataobject(aUserDO, aModuleDoc)
		If Not aUser Is Nothing Then
			CType(CorePage, cEGPage).ModulePage_RedirectToModule(aModuleDoc)
		End If
	End Sub

'=============================================================
End Class

End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
