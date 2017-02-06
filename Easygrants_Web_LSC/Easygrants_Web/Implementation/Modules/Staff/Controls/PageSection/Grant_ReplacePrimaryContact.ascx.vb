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
Public Class cGrant_ReplacePrimaryContact
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	'============================================================= 


Protected ctlPerson As cPopUpSelectorLauncher2

'=============================================================




	Public ReadOnly Property PersonID() As Integer
		Get
			If Not Request.QueryString("PersonID") Is Nothing Then
				Return Request.QueryString("PersonID")
			Else
				Return 0
			End If
		End Get
	End Property

'=============================================================

 Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		Dim aDataObject As cDataObject
		ctlPerson = CType(Me.FindControl("ctlPerson"), cPopUpSelectorLauncher2)
		If PersonID > 0 Then
				aDataObject = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", PersonID)
				ctlPerson.ObjID = PersonID
				ctlPerson.ObjName = aDataObject.GetPropertyString("LastNameFirstName")
		End If


	End Sub
End Class

End Namespace