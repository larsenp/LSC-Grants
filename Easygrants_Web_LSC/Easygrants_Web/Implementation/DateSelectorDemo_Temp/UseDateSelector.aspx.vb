'*************************************************************
' Author : Saikrishna V. Dasari
' Date   : 02/01/05
' Summary: Class that uses DateCalendar user control functions
'*************************************************************

Public Class UseDateSelector
    Inherits System.Web.UI.Page
    Protected WithEvents bt_Submit As System.Web.UI.WebControls.Button
    Protected WithEvents useDateCal As DateSelector

    Protected WithEvents DtCal As DateSelector
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

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
    End Sub

    Private Sub bt_Submit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles bt_Submit.Click

        'Get the selected data
        Dim str As String = useDateCal.CalendarDate()
        Response.Write("Selected Value  :" & str & "<BR>")
        Dim str1 As String = DtCal.CalendarDate()
        Response.Write("Another Selected Value :" & str1 & "<BR>")
        'Set a date in the codebehind using calendardate property
        'DtCal.CalendarDate = "03/04/05"
        'Response.Write("Selected Value for is :" & DtCal.CalendarDate)

    End Sub
End Class

