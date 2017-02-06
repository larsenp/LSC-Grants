Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web
Namespace EasyGrants.Controls.Base

Public MustInherit Class cNewGranteeProjectInfo
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

	Protected ctlPer As cPopUpSelectorLauncher
	Protected ctlInst As cDropDown
	Protected ctlGrantTitle As cTextArea
	Protected ctlGrantStatus As cDropDown

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Page.DataBind()
	End Sub

'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()

		Dim aItem As ListItem
		Dim aObj As cDataObject

		ctlPer = CType(Me.FindControl("ctlPer"), cPopUpSelectorLauncher)
		ctlPer.ObjName = Request.QueryString("Text")
		ctlPer.ObjID = Request.QueryString("Value")
		Dim aList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonOrganizationAffiliation", _
			"PersonID", Request.QueryString("Value"))

		ctlInst = CType(Me.FindControl("ctlInst"), cDropDown)
		ctlInst.Items.Clear()
		aItem = New ListItem("<None>", "")
		ctlInst.Items.Add(aItem)

		For Each aObj In aList
			aItem = New ListItem(aObj.GetRelatedPropertyString("Organization.CommonOrganizationName"), aObj.GetPropertyString("OrganizationID"))
			If aObj.GetPropertyBool("IsPrimary") Then
				Me.ctlInst.Items.Insert(1, aItem)
			Else
				Me.ctlInst.Items.Add(aItem)
			End If
		Next
	End Sub


'=============================================================

End Class
End Namespace