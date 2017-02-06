Imports Core_Web.Controls.Base

Public MustInherit Class RevGranteeProjectInfo
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

'=============================================================

    Protected mDisplayText As String
    Protected mOutputDefinitionID As Integer

'-------------------------------------------------------------

	Public Property DisplayText() As String
		Get
			Return mDisplayText
		End Get
		Set(ByVal Value As String)
			mDisplayText = Value
		End Set
	End Property

'-------------------------------------------------------------

	Public Property OutputDefinitionID() As Integer
		Get
			Return mOutputDefinitionID
		End Get
		Set(ByVal Value As Integer)
			mOutputDefinitionID = Value
		End Set
	End Property

'-------------------------------------------------------------

    Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        MyBase.CoreCtl_Load(sender, e)
    
		Dim aReportOutputLink As cReportOutputLink
		aReportOutputLink = Me.GetControl("ctlApplicantReportLink")
		aReportOutputLink.DisplayText = mDisplayText
		aReportOutputLink.DefinitionID = mOutputDefinitionID.ToString()
    End Sub

End Class
