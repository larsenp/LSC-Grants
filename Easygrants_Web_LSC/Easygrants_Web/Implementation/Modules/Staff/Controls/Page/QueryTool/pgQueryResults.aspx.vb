Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.DBAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules
Imports Core.Web.User
Imports EasyGrants.Web.User
Imports EasyGrants.DataAccess.Report

Namespace Implementation.Modules.Staff.Controls.Page.QueryTool

Public Class cpgQueryResults
	Inherits Core.Web.cCorePage
'========================================================

	'Protected spnStyles As HtmlGenericControl
	Protected tabResults As HtmlTable
	Protected spnSQL As HtmlGenericControl
    Protected spnError As HtmlGenericControl
    Protected spnCount As HtmlGenericControl
    Private mUser As cEGStaffUser

'========================================================

    Public Property SavedQueryDO() As cSavedQuery
    Get
        Return mUser.SavedQueryDO
    End Get
    Set(ByVal Value As cSavedQuery)
        mUser.SavedQueryDO = Value
    End Set
    End Property

'--------------------------------------------------------

    Public Property AdHocQueryDefXMLDoc() As cXMLDoc
    Get
        Return SavedQueryDO.SavedQueryDefXMLDoc
    End Get
    Set(ByVal Value As cXMLDoc)
        SavedQueryDO.SavedQueryDefXMLDoc = Value
    End Set
    End Property

'========================================================

    Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CorePage_Load(sender, e)

		'CorePage_LoadStyles(spnStyles)
    End Sub

'========================================================
End Class
End Namespace
