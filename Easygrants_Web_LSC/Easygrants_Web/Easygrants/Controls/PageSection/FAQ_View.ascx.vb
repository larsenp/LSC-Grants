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

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cFAQ_View
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	'Protected ctlRowNumber As cLabel
	Protected spnRowNumber As HtmlGenericControl
	Protected NotAvailable As Panel
	Protected Available As Panel
	Dim aPageName As String

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		'ctlRowNumber = CType(Me.FindControl("ctlRowNumber"), cLabel)
		NotAvailable.Visible = False
		Available.Visible = False
		aPageName = Request.QueryString("Page")
	End Sub

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		Dim aDOList As cDataObjectList
		'If aPageName = "FAQStaffView" Then
		'	aDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("FAQ", "IsStaffAvailable", "True")
		'ElseIf aPageName = "FAQPublicView" Then
		'	aDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("FAQ", "IsPublicAvailable", "True")
		'End If
		aDOList = Me.DataObjectCollection("FAQ")
		If aDOList.Count > 0 Then
			If aDOList.Count = 1 Then
				If aDOList(0).GetPropertyInt("FAQID", 0) = 0 Then
					NotAvailable.Visible = True
					Available.Visible = False
					Exit Sub
				End If
			End If
			NotAvailable.Visible = False
			Available.Visible = True
		Else
			NotAvailable.Visible = True
			Available.Visible = False
			Exit Sub
		End If
		Dim SplitControlID As String() = Me.ID.Split("_")
		If SplitControlID.Length > 0 Then
			If IsNumeric(SplitControlID(SplitControlID.Length - 1)) Then
				spnRowNumber.InnerHtml = SplitControlID(SplitControlID.Length - 1) + 1
			End If
		End If

	End Sub

	

End Class

End Namespace
