Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web

Namespace Easygrants_Web.Controls.PageSection
Public Class cContactCategoryEditor_List
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'============================================================= 

	Protected txtLastName As HtmlInputText
	Protected ctlTitle As cTextBox
	Protected ctlDescription As cTextBox

'============================================================= 

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		If Request.QueryString("find") <> "%" Then
			txtLastName.Value = Request.QueryString("find")
		End If
	End Sub

'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		
		if Request.QueryString("title") <> "" then
			ctlTitle = CType(Me.FindControl("ctlTitle"), cTextBox)
			ctlTitle.Value = Request.QueryString("title")
		end if
		if Request.QueryString("dscrpt") <> "" then
			ctlDescription = CType(Me.FindControl("ctlDescription"), cTextBox)
			ctlDescription.Value = Request.QueryString("dscrpt")
		end if
	End Sub

'-------------------------------------------------------------

    Public Sub Cancel()
		if request.QueryString("New") = "1" then
			dim aObjList as cDataObjectList = ctype(me.DataObjectCollection("ContactCategory"), cDataObjectList)
			me.WebSession.DataObjectFactory.DeleteData(aObjList(0))
		end if
		
		me.EventController_NavigateToModulePageKey("Categories")
    End Sub    
   
'-------------------------------------------------------------

	Public Sub Find()
		Dim aEncodeString As String
		Dim aURL As String

		If txtLastName.Value <> "" Then
			aEncodeString = Server.UrlEncode(txtLastName.Value)
			aURL = Request.RawUrl.ToString()
			aURL = cWebLib.AddQuerystringParameter(aURL, "find", aEncodeString)
			ctlTitle = CType(Me.FindControl("ctlTitle"), cTextBox)
			aEncodeString = Server.UrlEncode(ctlTitle.Value)
			aURL = cWebLib.AddQuerystringParameter(aURL, "title", aEncodeString)
			ctlDescription = CType(Me.FindControl("ctlDescription"), cTextBox)
			aEncodeString = Server.UrlEncode(ctlDescription.Value)
			aURL = cWebLib.AddQuerystringParameter(aURL, "dscrpt", aEncodeString)
			
			Response.Redirect(aURL)
		End If
	End Sub

'=============================================================
End Class 'cBudgetPeriod_Editor
End Namespace
