Imports EasyGrants_Web.Modules.Staff
Imports Core.DataAccess.XMLAccess
Imports System.Xml

Namespace Easygrants_Web.Controls.PageSection
Public Class cPageContent_Editor
    Inherits Easygrants_Web.Modules.Staff.cStaffModuleContent

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

	Public Overrides Sub CorePage_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		Dim mModuleConfigDoc As New cXMLDoc
		mModuleConfigDoc.Load(Server.MapPath("../../../../" + WebAppl.Root + "/Implementation/Modules/Staff/ModuleConfig"))
		ModuleConfigDoc = mModuleConfigDoc
		PageNavKey = "ContentManager"
		
        MyBase.CorePage_Load(aSrc, aEvent)
	End Sub

	Public Overrides Function LoadPageContent() As Boolean

		Dim aPageNode As XmlNode = cXMLDoc.FindNode(ModuleNode, "descendant::Page", "Key", "PageContentEditor")
		
		If aPageNode Is Nothing Then
			return false
		End If		
			
		PageNavKey = "ContentManager"

		Dim aPgContentTDCell As Control

		aPgContentTDCell = mPageFrameCtl.FindControl("tdPageContent")
		mPageContentCtl = CorePage_LoadControl(WebAppl.Build_RootURL(cXMLDoc.AttributeToString(aPageNode, "ContentCtl")), "ctlPageContent", aPgContentTDCell)
		return true
		
	End Function	 
End Class
End Namespace
