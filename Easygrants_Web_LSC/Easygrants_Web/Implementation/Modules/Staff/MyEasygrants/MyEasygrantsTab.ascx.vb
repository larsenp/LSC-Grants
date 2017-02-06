Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Public MustInherit Class MyEasygrantsTab
    Inherits Core.Web.cCoreCtl

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

'    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
'        'Put user code to initialize the page here
'    End Sub

    Protected tblMyEasygrants As HtmlTable


    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)

        Dim aTR As HtmlTableRow
        Dim aTD As HtmlTableCell
        Dim aAnchor As HtmlAnchor

        aTR = New HtmlTableRow
        aTR.Attributes.Add("class", "MyEasygrantsRow1")

        If Request.QueryString("Page") <> "MyPersonalTasks" Then
            aTD = New HtmlTableCell
            'aTD.InnerHtml = "My Personal Tasks"
            aTD.Attributes.Add("class", "MyEasygrantsTabNotSelected")
            aAnchor = New HtmlAnchor
            aAnchor.HRef = "../ModuleContent.aspx?Config=ModuleConfigTest&Page=MyPersonalTasks"
            aAnchor.InnerHtml = "Personal Tasks"
            'AddHandler aAnchor.ServerClick, AddressOf ancNavigate_Click
            aTD.Controls.Add(aAnchor)
            aTR.Cells.Add(aTD)
        Else
            aTD = New HtmlTableCell
            aTD.InnerHtml = "Personal Tasks"
            aTD.Attributes.Add("class", "MyEasygrantsTabSelected")
            aTR.Cells.Add(aTD)
        End If

        aTD = New HtmlTableCell
        aTD.InnerHtml = "&nbsp;"
        aTD.Attributes.Add("class", "MyEasygrantsTabSpace")
        aTR.Cells.Add(aTD)

        If Request.QueryString("Page") <> "MyWorkgroupTasks" Then
            aTD = New HtmlTableCell
            'aTD.InnerHtml = "My Personal Tasks"
            aTD.Attributes.Add("class", "MyEasygrantsTabNotSelected")
            aAnchor = New HtmlAnchor
            aAnchor.HRef = "../ModuleContent.aspx?Config=ModuleConfigTest&Page=MyWorkgroupTasks"
            aAnchor.InnerHtml = "Workgroup Tasks"
            'AddHandler aAnchor.ServerClick, AddressOf ancNavigate_Click
            aTD.Controls.Add(aAnchor)
            aTR.Cells.Add(aTD)
        Else
            aTD = New HtmlTableCell
            aTD.InnerHtml = "Workgroup Tasks"
            aTD.Attributes.Add("class", "MyEasygrantsTabSelected")
            aTR.Cells.Add(aTD)
        End If

        aTD = New HtmlTableCell
        aTD.InnerHtml = "&nbsp;"
        aTD.Attributes.Add("class", "MyEasygrantsTabSpace")
        aTR.Cells.Add(aTD)

        If Request.QueryString("Page") <> "MyQueries" Then
            aTD = New HtmlTableCell
            'aTD.InnerHtml = "My Personal Tasks"
            aTD.Attributes.Add("class", "MyEasygrantsTabNotSelected")
            aAnchor = New HtmlAnchor
            aAnchor.HRef = "../ModuleContent.aspx?Config=ModuleConfigTest&Page=MyQueries"
            aAnchor.InnerHtml = "My Queries"
            'AddHandler aAnchor.ServerClick, AddressOf ancNavigate_Click
            aTD.Controls.Add(aAnchor)
            aTR.Cells.Add(aTD)
        Else
            aTD = New HtmlTableCell
            aTD.InnerHtml = "My Queries"
            aTD.Attributes.Add("class", "MyEasygrantsTabSelected")
            aTR.Cells.Add(aTD)
        End If

        aTD = New HtmlTableCell
        aTD.InnerHtml = "&nbsp;"
        aTD.Attributes.Add("class", "MyEasygrantsTabSpace")
        aTR.Cells.Add(aTD)

        If Request.QueryString("Page") <> "MyContacts" Then
            aTD = New HtmlTableCell
            'aTD.InnerHtml = "My Personal Tasks"
            aTD.Attributes.Add("class", "MyEasygrantsTabNotSelected")
            aAnchor = New HtmlAnchor
            aAnchor.HRef = "../ModuleContent.aspx?Config=ModuleConfigTest&Page=MyContacts"
            aAnchor.InnerHtml = "My Contacts"
            'AddHandler aAnchor.ServerClick, AddressOf ancNavigate_Click
            aTD.Controls.Add(aAnchor)
            aTR.Cells.Add(aTD)
        Else
            aTD = New HtmlTableCell
            aTD.InnerHtml = "My Contacts"
            aTD.Attributes.Add("class", "MyEasygrantsTabSelected")
            aTR.Cells.Add(aTD)
        End If

        aTD = New HtmlTableCell
        aTD.InnerHtml = "&nbsp;"
        aTD.Attributes.Add("class", "MyEasygrantsTabSpace")
        aTR.Cells.Add(aTD)

        If Request.QueryString("Page") <> "MyEasylists" Then
            aTD = New HtmlTableCell
            'aTD.InnerHtml = "My Personal Tasks"
            aTD.Attributes.Add("class", "MyEasygrantsTabNotSelected")
            aAnchor = New HtmlAnchor
            aAnchor.HRef = "../ModuleContent.aspx?Config=ModuleConfigTest&Page=MyEasylists"
            aAnchor.InnerHtml = "My Easylists"
            'AddHandler aAnchor.ServerClick, AddressOf ancNavigate_Click
            aTD.Controls.Add(aAnchor)
            aTR.Cells.Add(aTD)
        Else
            aTD = New HtmlTableCell
            aTD.InnerHtml = "My Easylists"
            aTD.Attributes.Add("class", "MyEasygrantsTabSelected")
            aTR.Cells.Add(aTD)
        End If

        aTD = New HtmlTableCell
        aTD.InnerHtml = "&nbsp;"
        aTD.Attributes.Add("class", "MyEasygrantsTabSpace")
        aTR.Cells.Add(aTD)

        If Request.QueryString("Page") <> "MySettings" Then
            aTD = New HtmlTableCell
            'aTD.InnerHtml = "My Personal Tasks"
            aTD.Attributes.Add("class", "MyEasygrantsTabNotSelected")
            aAnchor = New HtmlAnchor
            aAnchor.HRef = "../ModuleContent.aspx?Config=ModuleConfigTest&Page=MySettings"
            aAnchor.InnerHtml = "My Settings"
            'AddHandler aAnchor.ServerClick, AddressOf ancNavigate_Click
            aTD.Controls.Add(aAnchor)
            aTR.Cells.Add(aTD)
        Else
            aTD = New HtmlTableCell
            aTD.InnerHtml = "My Settings"
            aTD.Attributes.Add("class", "MyEasygrantsTabSelected")
            aTR.Cells.Add(aTD)
        End If

        aTD = New HtmlTableCell
        aTD.InnerHtml = "&nbsp;"
        aTD.Attributes.Add("class", "MyEasygrantsTabSpaceLong")
        aTR.Cells.Add(aTD)

        tblMyEasygrants.Rows.Add(aTR)

    End Sub

End Class
