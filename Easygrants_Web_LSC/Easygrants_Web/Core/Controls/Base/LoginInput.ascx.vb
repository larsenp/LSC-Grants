Imports System.Xml
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base

Public MustInherit Class cLoginInputCtl
	Inherits Core.Web.cCoreCtl
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
	Protected txtPWord As HtmlInputText
	Protected WithEvents btnLogin As cCSSButton

    Private mDisplayPropertyNode As XmlNode

'=============================================================

    'Public WriteOnly Property LoginClick() As EventHandler
    '    Set(ByVal Value As EventHandler)
    '        AddHandler btnLogin., Value
    '    End Set
    'End Property

'-------------------------------------------------------------

    Public Overrides Property DisplayPropertyNode() As XmlNode
    Get
        Return mDisplayPropertyNode
    End Get
    Set(ByVal Value As XmlNode)
        mDisplayPropertyNode = Value
    End Set
    End Property

'-------------------------------------------------------------

    Public ReadOnly Property LoginID() As String
        Get
            LoginID = txtLoginID.Value
        End Get
    End Property

'-------------------------------------------------------------

    Public ReadOnly Property Password() As String
        Get
            Password = txtPWord.Value
        End Get
    End Property

'=============================================================

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
        DisplayPropertyNode = aDisplayPropertyNode

        btnLogin.Set_ServerClick(AddressOf Me.EventController.EventController_ControlClicked)
    End Sub

'=============================================================

    Public Sub btnLogin_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
        'Response.Write("Event Handled:<br>")
		'Response.Write("Primary E-mail:" + txtLoginID.Value + "<br>")
        'Response.Write("Password ID:" + txtPWord.Value + "<br>")
        btnLogin.EventController = Me.EventController
        'EGSession.LoginUserFromCredentials(CType(Me.CorePage, cModulePage), LoginID, Password)
    End Sub

'=============================================================

    'Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
    '	MyBase.CoreCtl_Load(sender, e)
    'End Sub

'=============================================================
End Class

End Namespace 'Core_Web.Controls.Base
