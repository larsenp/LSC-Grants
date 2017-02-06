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
Imports Core.Web.SvrCtls


Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cContact_ReviewerInfo
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'=============================================================

	Protected tabNotReviewer As HtmlTable
	Protected tabReviewer as HtmlTable
    Protected tabReviewerList as HtmlTable
	Protected trNotReviewer As HtmlTableRow
    Protected spnNotReviewer As HtmlGenericControl
    Protected lblNotReviewer as Label
    Protected spnAdd as HtmlGenericControl
    Protected spnEdit as HtmlGenericControl
    Protected spnStatus as HtmlGenericControl
	Protected spnStartDate As HtmlGenericControl
    Protected spnEndDate as HtmlGenericControl


'=============================================================

	Protected ReadOnly Property Person() As cDataObject
		Get
			If Request.QueryString("PersonID") Is Nothing Then Return Nothing

			Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", _
				Request.QueryString("PersonID"))
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property PersonID() As String
		Get
 			If Not Request.QueryString("PersonID") Is Nothing Then Return Request.QueryString("PersonID")
			If Person Is Nothing Then Return ""
			Return Person.GetPropertyString("PersonID")
		End Get
	End Property
    	
'=============================================================
	
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		If Not PersonID = "" Then
			Dim aDataObject As cDataObject
			Dim IsReviewer as Integer

			aDataObject = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", PersonID)
			IsReviewer = aDataObject.GetRelatedPropertyInt("IsReviewer")
						
			If IsReviewer = 0 then
				tabNotReviewer.Visible = True
				tabReviewer.Visible = False
				tabReviewerList.Visible = False
				spnAdd.Visible = True
			Else
				tabReviewer.Visible = True
				tabReviewerList.Visible = True
				tabNotReviewer.Visible = False
				spnEdit.Visible = True
			End If
			
			'If a user does not fill out a certain control, label is supplied with "None"
			Dim aPersonReviewerDO as cDataObject
			
			aPersonReviewerDO = (CType(Me.DataObjectCollection("PersonReviewer"), cDataObjectList))(0)
			
			If aPersonReviewerDO.GetRelatedPropertyString("ReviewerStatus.Description") = "" then
				spnStatus.InnerHtml = "None"
			End If

			If aPersonReviewerDO.GetPropertyString("StartDate") = "" then
				spnStartDate.InnerHtml = "None"
			End If
		
			If aPersonReviewerDO.GetPropertyString("EndDate") = "" then
				spnEndDate.InnerHtml = "None"
			End If
			If aPersonReviewerDO.GetPropertyString("AreaExpertise") = "" then

			End If			
			
		End If
	End Sub
End Class
End Namespace
