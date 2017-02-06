Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.DataAccess
Imports EasyGrants.Web

Namespace Core_Web.Controls.Base

Public Class cpgReportOutputReader_Error
	Inherits Core.Web.cCorePage
'=============================================================

	Protected tabInQueue As HtmlTable
	'Protected spnStyles As HtmlGenericControl

'-------------------------------------------------------------

	Public ReadOnly Property Status() As String
		Get
			Status = Request.QueryString("Status")
		End Get
	End Property

'-------------------------------------------------------------

    Public ReadOnly Property ReportOutputID() As String
        Get
            If Request.QueryString("ReportOutputID") = "" Then
                Return "0"
            Else
                Return Request.QueryString("ReportOutputID")
            End If
        End Get
    End Property

'-------------------------------------------------------------

    Public ReadOnly Property EntityID() As String
        Get
            EntityID = Request.QueryString("EntityID")
        End Get
    End Property

'-------------------------------------------------------------

    Public ReadOnly Property DefinitionID() As String
        Get
            DefinitionID = Request.QueryString("DefinitionID")
        End Get
    End Property

'=============================================================

    Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CorePage_Load(sender, e)

		'CorePage_LoadStyles(spnStyles)

		Select Case Status
			Case "InQueue"
				tabInQueue.Visible = True
		End Select
	End Sub

'=============================================================
End Class

End Namespace 'Easygrants_Web.Controls.Base