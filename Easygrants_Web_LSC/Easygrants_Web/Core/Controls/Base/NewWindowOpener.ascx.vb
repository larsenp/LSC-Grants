Imports System.Xml
Imports Core.DataAccess

Namespace Core_Web.Controls.Base

Public MustInherit Class cNewWindowOpener
    Inherits Core.Web.cCoreCtl
'=============================================================
    Private mNewWindowURL As String
    Private mRefreshURL As String

    Protected spnOpen As HtmlGenericControl

'-------------------------------------------------------------

    Public Property NewWindowURL() As String
    Get
        Return mNewWindowURL
    End Get
    Set(ByVal Value As String)
        mNewWindowURL = Value
    End Set
    End Property

'-------------------------------------------------------------

    Public Property RefreshURL() As String
    Get
        If mRefreshURL Is Nothing Then
            Return Request.Url.PathAndQuery
        Else
            Return mRefreshURL
        End If
    End Get
    Set(ByVal Value As String)
        mRefreshURL = Value
    End Set
    End Property

'-------------------------------------------------------------

    Public Sub Open()
        spnOpen.Visible = True
    End Sub

'=============================================================

	Public Sub Test()

	End Sub

'=============================================================
End Class
End Namespace