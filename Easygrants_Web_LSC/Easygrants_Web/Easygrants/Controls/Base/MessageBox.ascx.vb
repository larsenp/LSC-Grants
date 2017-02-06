Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Drawing.Drawing2D
Imports Core_Web.Controls


Namespace Easygrants_Web.Controls.Base

Public Class cMessageBox
    'Inherits Core.Web.cCoreCtl
	Inherits WebControl

Public Class js

    Public Function js()

    End Function

End Class



    Private strLeft As String

    Private strTop As String

    Private intButton As Integer

    Private strMessage As String

    Private strTitle As String

    Private strImage As String

    Private strCss As String

    Private strCssTitle As String

    Private strCssMessage As String

    Private strButtonYes As String

    'Private strButtonNo As String

    Private strButtonCancel As String

    Private strButtonWidth As Integer

    Private strMessageBoxIDYes As String

    Private strMessageBoxIDNo As String

    Private strMessageBoxIDCancel As String

    Private intMessageBoxWidth As Integer

    Private intMessageBoxHeight As Integer

    Private intMessageBoxImageWidth As Integer

    Private intMessageBoxImageHeight As Integer

    Dim homedirectory As String

    '   Message box left position

    Public Property MessageBoxLeft() As String

        Get

            Return strLeft

        End Get

        Set(ByVal Value As String)

            strLeft = Value

        End Set

    End Property

    '   Message box top position

    Public Property MessageBoxTop() As String

        Get

            Return strTop

        End Get

        Set(ByVal Value As String)

            strTop = Value

        End Set

    End Property

    '   Number of buttons you want to display in the message box

    
    
    
    Public Property MessageBoxButton() As Integer

        Get

            Return intButton

        End Get

        Set(ByVal Value As Integer)

            intButton = Value

        End Set

    End Property

    '   Customize message you want to display in the message box

    Public Property MessageBoxMessage() As String

        Get

            Return strMessage

        End Get

        Set(ByVal Value As String)

            strMessage = Value

        End Set

    End Property

    '   Title you want to display in the message box

    Public Property MessageBoxTitle() As String

        Get

            Return strTitle

        End Get

        Set(ByVal Value As String)

            strTitle = Value

        End Set

    End Property

    '   Image you want to display in the message box (like information / warning)

    'Public Property MessageBoxImage() As String

    '    Get

    '        Return strImage

    '    End Get

    '    Set(ByVal Value As String)

    '        strImage = Value

    '    End Set

    'End Property

    '   Message box ID for Yes button

    Public Property MessageBoxIDYes() As String

        Get

            Return strMessageBoxIDYes

        End Get

        Set(ByVal Value As String)

            strMessageBoxIDYes = Value

        End Set

    End Property

    '   Message box ID for No button

    Public Property MessageBoxIDNo() As String

        Get

            Return strMessageBoxIDNo

        End Get

        Set(ByVal Value As String)

            strMessageBoxIDNo = Value

        End Set

    End Property

    '   Message box ID for Cancel button

    Public Property MessageBoxIDCancel() As String

        Get

            Return strMessageBoxIDCancel

        End Get

        Set(ByVal Value As String)

            strMessageBoxIDCancel = Value

        End Set

    End Property

    '   Style you want to incorporate for message box

    Public Property MessageBoxCss() As String

        Get

            Return strCss

        End Get

        Set(ByVal Value As String)

            strCss = Value

        End Set

    End Property

    Public Property MessageBoxCssTitle() As String

        Get

            Return strCssTitle

        End Get

        Set(ByVal Value As String)

            strCssTitle = Value

        End Set

    End Property

    Public Property MessageBoxCssMessage() As String

        Get

            Return strCssMessage

        End Get

        Set(ByVal Value As String)

            strCssMessage = Value

        End Set

    End Property

    '   Message box Text for Yes button

    Public Property MessageBoxButtonYesText() As String

        Get

            Return strButtonYes

        End Get

        Set(ByVal Value As String)

            strButtonYes = Value

        End Set

    End Property

    '   Message box Text for No button

    'Public Property MessageBoxButtonNoText() As String

    '    Get

    '        Return strButtonNo

    '    End Get

    '    Set(ByVal Value As String)

    '        strButtonNo = Value

    '    End Set

    'End Property

    '   Message box Text for Cancel button

    Public Property MessageBoxButtonCancelText() As String

        Get

            Return strButtonCancel

        End Get

        Set(ByVal Value As String)

            strButtonCancel = Value

        End Set

    End Property

    '   Message box buttons width

    Public Property MessageBoxButtonWidth() As Integer

        Get

            Return strButtonWidth

        End Get

        Set(ByVal Value As Integer)

            strButtonWidth = Value

        End Set

    End Property

    '   Message box width

    Public Property MessageBoxWidth() As Integer

        Get

            Return intMessageBoxWidth

        End Get

        Set(ByVal Value As Integer)

            intMessageBoxWidth = Value

        End Set

    End Property

    '   Message box height

    Public Property MessageBoxHeight() As Integer

        Get

            Return intMessageBoxHeight

        End Get

        Set(ByVal Value As Integer)

            intMessageBoxHeight = Value

        End Set

    End Property

    '   Message box image width

    'Public Property MessageBoxImageWidth() As Integer

    '    Get

    '        Return intMessageBoxImageWidth

    '    End Get

    '    Set(ByVal Value As Integer)

    '        intMessageBoxImageWidth = Value

    '    End Set

    'End Property

    '   Message box image height

    'Public Property MessageBoxImageHeight() As Integer

    '    Get

    '        Return intMessageBoxImageHeight

    '    End Get

    '    Set(ByVal Value As Integer)

    '        intMessageBoxImageHeight = Value

    '    End Set

    'End Property

    Protected Friend layer As HtmlGenericControl

    Protected Friend ilayer As HtmlGenericControl

    Protected Friend img As HtmlGenericControl

    Protected Friend div As HtmlGenericControl

    Protected Friend ButtonOK As Button

    Protected Friend ButtonYes As Button

    Protected Friend ButtonNo As Button

    Protected Friend ButtonCancel As Button

    Protected Alertimage As System.Web.UI.WebControls.Image

    Public Sub New()

        MyBase.New("div")

    End Sub

    Protected Overrides Sub OnInit(ByVal e As EventArgs)

        MyBase.OnInit(e)

        '   Default properties settings for message box control

        If strLeft Is Nothing Then

            strLeft = "250"

        End If

        If strTop Is Nothing Then

            strTop = "250"

        End If

        If strTitle Is Nothing Then

            strTitle = "MessageBox"

        End If

        If intButton < 0 Then

            intButton = 1

        End If

        If strMessageBoxIDYes Is Nothing Then

            strMessageBoxIDYes = "MessageBoxIDYes"

        End If

        If strMessageBoxIDNo Is Nothing Then

            strMessageBoxIDNo = "MessageBoxIDNo"

        End If

        If strMessageBoxIDCancel Is Nothing Then

            strMessageBoxIDCancel = "MessageBoxIDCancel"

        End If

        If strCss Is Nothing Then

            strCss = ""

        End If

        If strCssMessage Is Nothing Then

            strCssMessage = ""

        End If

        If strCssTitle Is Nothing Then

            strCssTitle = ""

        End If

        If strMessage Is Nothing Then

            strMessage = "No message to display here."

        End If

        If intButton = 1 Or intButton > 3 Or intButton < 1 Then

            If strButtonYes Is Nothing Then

                strButtonYes = "OK"

            End If

        ElseIf intButton > 1 And intButton < 4 Then

            If strButtonYes Is Nothing Then

                strButtonYes = "Approve"

            End If

            'If strButtonNo Is Nothing Then

            '    strButtonNo = "Cancel"

            'End If

            If strButtonCancel Is Nothing Then

                strButtonCancel = "Ignore"

            End If

        End If

        If strButtonWidth < 5 Then

            strButtonWidth = 70

        End If

        If intMessageBoxWidth < 10 Then

            intMessageBoxWidth = 250

        End If

        If intMessageBoxHeight < 1 Then

            intMessageBoxHeight = 8

        End If

        'If intMessageBoxImageWidth < 5 Then

        '    intMessageBoxImageWidth = 36

        'End If

        'If intMessageBoxImageHeight < 5 Then

        '    intMessageBoxImageHeight = 36

        'End If

        If homedirectory Is Nothing Then

            homedirectory = Me.Page.Request.PhysicalApplicationPath

        End If

    End Sub

    Protected Overrides Sub createChildControls()

        '   Creating message box

        Dim myRow As TableRow

        Dim myCell As TableCell

        Dim myTable As Table = New Table()

        myTable.BorderWidth = New Unit(0)

        myTable.CellSpacing = 0

        myTable.Width = New Unit(intMessageBoxWidth)

        myTable.Height = New Unit(intMessageBoxHeight)

        Controls.Add(myTable)

        myRow = New TableRow()

        myRow.BorderWidth = New Unit(0)

        myTable.Rows.Add(myRow)

        myCell = New TableCell()

        Dim NewLabel As Label = New Label()

        NewLabel.Text = strTitle

        NewLabel.CssClass = strCssTitle

        myCell.Controls.Add(NewLabel)

        myCell.ID = "dragbar"

        myCell.ColumnSpan = 5

        myCell.CssClass = strCssTitle

        If strCssTitle = "" Then

            myCell.ForeColor = System.Drawing.Color.Gray

            myCell.BackColor = System.Drawing.Color.DarkOliveGreen

            myCell.Font.Name = "Arial"

            myCell.Font.Bold = True

            myCell.Font.Size = New FontUnit(9)

            myCell.Style.Add("CURSOR", "hand")

        End If

        myRow.Cells.Add(myCell)

        myRow = New TableRow()

        myRow.BorderWidth = New Unit(0)

        myTable.Rows.Add(myRow)

        myCell = New TableCell()

        myCell.ColumnSpan = 5

        myCell.CssClass = strCssMessage

        If strCssMessage = "" Then

            myCell.BackColor = System.Drawing.Color.PaleGoldenrod

        End If

        myRow.Cells.Add(myCell)

        Dim myRow1 As TableRow

        Dim myCell1 As TableCell

        Dim myTable1 As Table = New Table()

        myTable1.BorderWidth = New Unit(0)

        myTable1.CellSpacing = 0

        myCell.Controls.Add(myTable1)

        myRow1 = New TableRow()

        myRow1.BorderWidth = New Unit(0)

        myTable1.Rows.Add(myRow1)

        myCell1 = New TableCell()

        myCell1.CssClass = strCssMessage

        myCell1.BorderWidth = New Unit(0)

        myCell1.Width = New Unit(36)

        'Dim Alertimage As System.Web.UI.WebControls.Image = New System.Web.UI.WebControls.Image()

        'Alertimage.Height = New Unit(intMessageBoxImageHeight)

        'Alertimage.Width = New Unit(intMessageBoxImageWidth)

        'Alertimage.BorderWidth = New Unit(0)

        'Alertimage.ImageUrl = strImage

        'myCell1.Controls.Add(Alertimage)

        'myRow1.Cells.Add(myCell1)

        myCell1 = New TableCell()

        myCell1.CssClass = strCssMessage

        myCell1.BorderWidth = New Unit(0)

        myCell1.CssClass = strCssMessage

        If strCssMessage = "" Then

            myCell1.HorizontalAlign = HorizontalAlign.Center

            myCell1.ForeColor = System.Drawing.Color.Black

            myCell1.BackColor = System.Drawing.Color.PaleGoldenrod

            myCell1.BorderColor = System.Drawing.Color.DarkOliveGreen

            myCell1.Font.Name = "Arial"

            myCell1.Font.Bold = True

            myCell1.Font.Size = New FontUnit(8)

        End If

        Dim NewLabel1 As Label = New Label()

        NewLabel1.Text = strMessage

        myCell1.Controls.Add(NewLabel1)

        myRow1.Cells.Add(myCell1)

        myRow = New TableRow()

        myRow.BorderWidth = New Unit(0)

        myTable.Rows.Add(myRow)

        If intButton = 1 Or intButton > 3 Or intButton < 1 Then

            myCell = New TableCell()

            myCell.ColumnSpan = 5

            myCell.BorderWidth = New Unit(0)

            myCell.CssClass = strCssMessage

            myCell.HorizontalAlign = HorizontalAlign.Center

            If strCssMessage = "" Then

                myCell.ForeColor = System.Drawing.Color.Black

                myCell.BackColor = System.Drawing.Color.PaleGoldenrod

                myCell.Font.Name = "Verdana"

                myCell.Font.Bold = True

                myCell.Font.Size = New FontUnit(8)

            End If

            ButtonOK = New Button()

            ButtonOK.ID = strMessageBoxIDYes

            ButtonOK.Text = strButtonYes

            ButtonOK.Width = New Unit(strButtonWidth)

            ButtonOK.Style.Add("CURSOR", "hand")

            myCell.Controls.Add(ButtonOK)

            myRow.Cells.Add(myCell)

        End If

        If intButton > 1 And intButton < 4 Then

            myCell = New TableCell()

            myCell.CssClass = strCssMessage

            myCell.BorderWidth = New Unit(0)

            myCell.HorizontalAlign = HorizontalAlign.Right

            If strCssMessage = "" Then

                myCell.ForeColor = System.Drawing.Color.Black

                myCell.BackColor = System.Drawing.Color.PaleGoldenrod

                myCell.Font.Name = "Verdana"

                myCell.Font.Bold = True

                myCell.Font.Size = New FontUnit(8)

            End If

            ButtonYes = New Button()

            ButtonYes.ID = strMessageBoxIDYes

            ButtonYes.Text = strButtonYes

            ButtonYes.Width = New Unit(strButtonWidth)

            ButtonYes.Style.Add("CURSOR", "hand")

            myCell.Controls.Add(ButtonYes)

            myRow.Cells.Add(myCell)

            myCell = New TableCell()

            myCell.Width = New Unit(20)

            myCell.BorderWidth = New Unit(0)

            myCell.CssClass = strCssMessage

            If strCssMessage = "" Then

                myCell.BackColor = System.Drawing.Color.PaleGoldenrod

            End If

            myRow.Cells.Add(myCell)

            myCell = New TableCell()

            myCell.CssClass = strCssMessage

            myCell.BorderWidth = New Unit(0)

            If strCssMessage = "" Then

                myCell.ForeColor = System.Drawing.Color.Black

                myCell.BackColor = System.Drawing.Color.PaleGoldenrod

                myCell.Font.Name = "Verdana"

                myCell.Font.Bold = True

                myCell.Font.Size = New FontUnit(8)

            End If

            If intButton = 2 Then

                myCell.HorizontalAlign = HorizontalAlign.Left

            ElseIf intButton = 3 Then

                myCell.HorizontalAlign = HorizontalAlign.Center

            End If

            'ButtonNo = New Button()

            'ButtonNo.ID = strMessageBoxIDNo

            'ButtonNo.Text = strButtonNo

            'ButtonNo.Width = New Unit(strButtonWidth)

            'ButtonNo.Attributes("WIDTH") = strButtonWidth.ToString()

            'ButtonNo.Attributes("HEIGHT") = strButtonWidth.ToString()

            'ButtonNo.Style.Add("CURSOR", "hand")

            'myCell.Controls.Add(ButtonNo)

            'myRow.Cells.Add(myCell)

            If intButton = 3 Then

                myCell = New TableCell()

                myCell.Width = New Unit(10)

                myCell.BorderWidth = New Unit(0)

                myCell.CssClass = strCssMessage

                If strCssMessage = "" Then

                    myCell.BackColor = System.Drawing.Color.PaleGoldenrod

                End If

                myRow.Cells.Add(myCell)

                myCell = New TableCell()

                myCell.CssClass = strCssMessage

                myCell.BorderWidth = New Unit(0)

                myCell.HorizontalAlign = HorizontalAlign.Left

                If strCssMessage = "" Then

                    myCell.ForeColor = System.Drawing.Color.Black

                    myCell.BackColor = System.Drawing.Color.PaleGoldenrod

                    myCell.Font.Name = "Verdana"

                    myCell.Font.Bold = True

                    myCell.Font.Size = New FontUnit(8)

                End If

                ButtonCancel = New Button()

                ButtonCancel.ID = strMessageBoxIDCancel

                ButtonCancel.Text = strButtonCancel

                ButtonCancel.Width = New Unit(strButtonWidth)

                ButtonCancel.Style.Add("CURSOR", "hand")

                myCell.Controls.Add(ButtonCancel)

                myRow.Cells.Add(myCell)

            End If

        End If

    End Sub

    Protected Overrides Sub AddAttributesToRender(ByVal writer As HtmlTextWriter)

        ' Rendering message box control to the browser

        MyBase.AddAttributesToRender(writer)

        writer.AddAttribute(HtmlTextWriterAttribute.Id, "showimage")

        writer.AddAttribute(HtmlTextWriterAttribute.Style, "Z-INDEX: 9999; LEFT:" + strLeft + "px; WIDTH:" + strLeft + "px; POSITION: absolute; TOP: " + strTop + "px; filter:progid:DXImageTransform.Microsoft.Shadow(color='dimgray', direction='135', strength='3')")

    End Sub


End Class

End Namespace