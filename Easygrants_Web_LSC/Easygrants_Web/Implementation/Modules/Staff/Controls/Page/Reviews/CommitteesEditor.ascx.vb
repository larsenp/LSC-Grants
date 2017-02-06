Imports Core_Web.Controls.Base
Imports Core.Web
Imports Core.Web.Modules
Imports Core.DataAccess

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public Class cCommitteesEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected txtLastName As HtmlInputText
	Protected ctlReviewCommitteeMember As cDoubleListBox2
	Protected ctlName As cTextBox
	Protected ctlInactive As cDropDown
	
 '   Public Sub ValidateMembers(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
	'	ctlReviewCommitteeMember = CType(FindControl("ctlReviewCommitteeMember"), cDoubleListBox2)
	'	aArgs.IsValid = (ctlReviewCommitteeMember.SelectedValueList.Length > 0)
	'End Sub


	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		If Request.QueryString("find") <> "%" Then
			txtLastName.Value = Request.QueryString("find")
		End If
	End Sub

'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()

		If Request.QueryString("name") <> "" Then
			ctlName = CType(Me.FindControl("ctlName"), cTextBox)
			ctlName.Value = Request.QueryString("Name")
		End If
		If Request.QueryString("isactive") <> "" Then
			ctlInactive = CType(Me.FindControl("ctlInactive"), cDropDown)
			ctlInactive.SelectedField = Request.QueryString("isactive")
		End If
	End Sub


	' This function as been modified because when Find is clicked , the selected values needs to be saved from the search result.
	Public Sub Find()
		Dim aEncodeString As String
		Dim aURL As String
		Dim aReviewCommitteeDO As cDataObject
		
		aURL = Request.RawUrl.ToString()
		aReviewCommitteeDO = CType(DataObjectCollection("ReviewCommittee"), cDataObjectList)(0)
		aEncodeString = aReviewCommitteeDO("ReviewCommitteeID")
		aURL = cWebLib.AddQuerystringParameter(aURL, "ReviewCommitteeID", aEncodeString)

		If txtLastName.Value <> "" Then
			
			aEncodeString = Server.UrlEncode(txtLastName.Value)
			aURL = cWebLib.AddQuerystringParameter(aURL, "find", aEncodeString)
			'ctlName = CType(Me.FindControl("ctlName"), cTextBox)
			'aEncodeString = Server.UrlEncode(ctlName.Value)
			'aURL = cWebLib.AddQuerystringParameter(aURL, "name", aEncodeString)
			'ctlInactive = CType(Me.FindControl("ctlInactive"), cDropDown)
			'aEncodeString = Server.UrlEncode(ctlInactive.SelectedValue)
			'aURL = cWebLib.AddQuerystringParameter(aURL, "isactive", aEncodeString)
		End If
		
		Response.Redirect(aURL)
	End Sub
        
End Class
End Namespace
