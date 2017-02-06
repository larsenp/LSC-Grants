'**************************************************
' Author : Saikrishna V. Dasari
' Date   : 02/01/05
' Summary: DateSelector user control Class
'***************************************************

'Downloaded from http://www.codeproject.com/aspnet/ASPNET_DateSelector.asp 7/20/2006. Adapted for Easygrants.
'Technical information available at the above URL.

Public MustInherit Class DateSelector
    Inherits System.Web.UI.UserControl
    Protected WithEvents txt_Date As System.Web.UI.WebControls.TextBox

    Protected WithEvents imgCalendar As System.Web.UI.WebControls.Image
    Protected WithEvents lbl_Date As System.Web.UI.WebControls.Label


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
        Dim scriptStr As String = _
        "javascript:return popUpCalendar(this," & getClientID() & ", 'mm/dd/yyyy', '__doPostBack(\'" & getClientID() & "\')')"
        imgCalendar.Attributes.Add("onclick", scriptStr)


    End Sub

    ' Get the id of the control rendered on client side
    ' Very essential for Javascript Calendar scripts to locate the textbox
    Public Function getClientID() As String
        Return txt_Date.ClientID()
    End Function

    ' This propery sets/gets the calendar date
    Public Property CalendarDate() As String
        Get
            Return txt_Date.Text
        End Get
        Set(ByVal Value As String)
            txt_Date.Text = Value
        End Set
    End Property

    ' This Property sets or gets the the label for 
    ' Dateselector user control
    Public Property Text() As String
        Get
            Return lbl_Date.Text
        End Get
        Set(ByVal Value As String)
            lbl_Date.Text = Value
        End Set
    End Property


End Class
