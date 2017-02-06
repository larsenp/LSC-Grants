Imports Core.Web

Public Class Calendar
    Inherits System.Web.UI.Page

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
'====================================================

	protected withevents Calendar1 as system.Web.UI.WebControls.Calendar
	protected spnWinRedirect as HtmlGenericControl
	protected mURL as string
	protected mDateValue as string
	
'====================================================

    Public Property DateValue() As string
        Get
            return mDateValue
        End Get
        Set(ByVal Value As string)
            mDateValue = Value
        End Set 
    End Property
    
'----------------------------------------------------

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
    End Sub
    
'----------------------------------------------------

	Sub Date_Selected(sender as Object, e As EventArgs)
		mDateValue = Calendar1.SelectedDate.ToShortDateString()
		spnWinRedirect.Visible = True
	End Sub
	
'----------------------------------------------------
	
	Sub Calendar1_DayRender(sender As Object, e As DayRenderEventArgs)
		dim aEarlier as String = request.QueryString("EarlierThan")
		dim aLater as String = request.QueryString("LaterThan")
		
		if aEarlier <> "" then
			If system.DateTime.Compare(e.Day.Date, aEarlier) > 0 then
				e.Day.IsSelectable = False
			End If
        end if
        
        if aLater <> "" then
			If system.DateTime.Compare(e.Day.Date, aLater) < 0 Then
				e.Day.IsSelectable = False
			End If
        end if
        
    End Sub

'====================================================
End Class
