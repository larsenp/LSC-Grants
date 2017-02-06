Imports System.Diagnostics
Imports Core.Util
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Web.User
Imports Easygrants_Web.Controls.Base

Imports agdevweb2

Namespace Easygrants_Web.Modules.Staff.Controls.Page

Public MustInherit Class cWSTest1
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

    Protected ctlParam1 As cTextBox
    Protected ctlParam2 As cTextBox
    Protected ctlResult As cTextBox

'--------------------------------------------------------

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)

        MyBase.CoreCtl_Load(aSrc, aEvent)

    End Sub

'--------------------------------------------------------

    Public Sub RunService(ByVal aParam1 As String, ByVal aParam2 As String)
        Dim aiParam1 As Int32
        Dim aiParam2 As Int32
        Dim aiResult As Int32
        Dim aRes As Object
        aiParam1 = Convert.ToInt32(aParam1)
        aiParam2 = Convert.ToInt32(aParam2)
        'ctlResult.Value = (aiParam1 + aiParam2).ToString()

        Dim aUserService As New sws()
'        Dim aCredentials As New System.Net.NetworkCredential("sa", "stream88")
'        aUserService.Credentials = aCredentials
        'aRes = aUserService.wsTest1(aiParam1, aiParam2)
        'ctlResult.Value = aRes

    'Dim URL As String
    'Dim sFormData As String
    'Dim http As Object
    'http = CreateObject("msxml2.xmlhttp")
    '' pre-XML 3.0, use "msxml.xmlhttp" as the progid...
    'URL = "http://agdevweb2/eg2ws/templates/wstest1.xml"

    'sFormData = "param1=" & aiParam1
    'sFormData = sFormData & "&param2=" & aiParam2
    ''MsgBox sFormData
    'http.Open("POST", URL, False)
    'http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
    'http.Send(sFormData)
    'MsgBox(http.responseText)

    End Sub

End Class
End Namespace