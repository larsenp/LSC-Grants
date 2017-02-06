Imports Core_Web.Controls.Base
Imports Core.Web.SvrCtls

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cStaffSettings
    Inherits Core.Web.cCoreCtl
'============================================================= 

    Protected lblDebugEnabled as Label
    'Protected btnDisable as cSvrButton
    Protected btnSave as cSvrButton
    Protected IsEnabled as cCheckBox
    'Protected withevents spnSave as cButton    
    
'=============================================================

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
        InitComponent()
    End Sub

#End Region

'=============================================================
'@qweqweqwe
	Public WriteOnly Property SetLabel() As String
		Set(ByVal Value As String)
			if WebSession.DebugSwitchEnabled then
			lblDebugEnabled.Text = "Debug Enabled"
			Else
				lblDebugEnabled.Text = "Debug Disabled"
			End If	
		End Set
	End Property

'=============================================================

	Public Property DebugSwitch() As Boolean
		Get
			Return WebSession.DebugSwitchEnabled
		End Get		
		Set
			WebSession.DebugSwitchEnabled = Value
		End Set		
	End Property	

'=============================================================

	'Public Sub btnEnable_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
	'	DebugSwitch = True		
	'	CoreCtl_Load(aSrc, aArgs)
	'End Sub
'-------------------------------------------------------------

	Private Sub InitComponent()
		IsEnabled.Value = WebSession.DebugSwitchEnabled
		SetLabel = ""
	End Sub

'-------------------------------------------------------------
	
	Public Sub StaffSettings_Save(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		WebSession.DebugSwitchEnabled = IsEnabled.Value
		'method in cAppl to do this which checks 
		'IsEnabled.Value = WebSession.DebugSwitchEnabled
		SetLabel = ""
		CorePage.Redirect()
	End Sub	
'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		'spnSave.Set_ServerClick(AddressOf StaffSettings_Save)
		SetLabel = ""		
	End Sub

'=============================================================

End Class
End Namespace