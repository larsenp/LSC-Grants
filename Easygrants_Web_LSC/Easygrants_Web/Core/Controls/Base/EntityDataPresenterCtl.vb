Imports System.Xml
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Core_Web.Controls.Base

Public Class cEntityDataPresenterCtl
    Inherits cDataPresenterCtl
'=============================================================

    Public ReadOnly Property EntityID() As String
    Get
        If Not Request.QueryString("EntityID") Is Nothing Then Return Request.QueryString("EntityID")
	
		If Not Request.QueryString("OrganizationID") Is Nothing Then Return Request.QueryString("OrganizationID")
	
		If Not Request.QueryString("PersonID") Is Nothing Then Return Request.QueryString("PersonID")

		Return CType(Ctype(Page, cModulePage).ModuleUser, cEGUser).PersonID.ToString
    End Get
    End Property

'-----------------------------------------------------

    Public ReadOnly Property EntityTypeID() As String
    Get
        If Not Request.QueryString("EntityTypeID") Is Nothing Then Return Request.QueryString("EntityTypeID")
	
		If Not Request.QueryString("OrganizationID") Is Nothing Then Return "2"

		Return "1"
    End Get
    End Property

'=============================================================

    Public ReadOnly Property BudgetID() As String
    Get
        If Not Request.QueryString("BudgetID") Is Nothing Then Return Request.QueryString("BudgetID")
		
		dim aGranteeProjectID as String = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID.ToString
		dim aBudgetList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("Budget", "GranteeProjectID", aGranteeProjectID, "BudgetTypeID", "1")
		
		if aBudgetList.Count > 0 then Return aBudgetList(0).GetPropertyString("BudgetID")
		
		return "0"
		
    End Get
    End Property
    
'-----------------------------------------------------

    Public ReadOnly Property GranteeProjectID() As String
    Get
        If Not Request.QueryString("GranteeProjectID") Is Nothing Then Return Request.QueryString("GranteeProjectID")
	
		Return CType(Ctype(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID.ToString
    End Get
    End Property

'-----------------------------------------------------

    Public ReadOnly Property BudgetTypeID() As String
    Get
        If Not Request.QueryString("BudgetTypeID") Is Nothing Then Return Request.QueryString("BudgetTypeID")
	
		dim aBudgetTypeList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetType", "Abbr", "Application")
		
		Return aBudgetTypeList(0).GetPropertyString("BudgetTypeID")
    End Get
    End Property

'=============================================================

End Class
'=============================================================

End Namespace