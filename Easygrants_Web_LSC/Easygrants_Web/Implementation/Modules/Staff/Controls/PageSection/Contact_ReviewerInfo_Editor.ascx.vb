Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cContact_ReviewerInfo_Editor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'============================================================= 

'    Protected ctlIsReviewer As cCheckBox
	Protected ctlStartDate as cDateTextBox
    
''=============================================================

	Protected ReadOnly Property PersonReviewer() As cDataObject
		Get
			If Request.QueryString("PersonID") Is Nothing Then Return Nothing

			Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("PersonReviewer", _
				Request.QueryString("PersonID"))
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property PersonID() As String
		Get
 			If Not Request.QueryString("PersonID") Is Nothing Then Return Request.QueryString("PersonID")
			If PersonReviewer Is Nothing Then Return ""
			Return PersonReviewer.GetPropertyString("PersonID")
		End Get
	End Property

''=============================================================
	
	'Public Overrides Sub DataPresenter_SaveDataObjects()
	'	Dim aPrimList As cDataObjectList
	'	Dim aPersonReviewerList As cDataObjectList

	'	ctlIsReviewer = CType(Me.FindControl("ctlIsReviewer"), cCheckBox)
	'	aPersonReviewerList = Me.DataObjectCollection("PersonReviewer")

	'	If ctlIsReviewer.Value = True Then
	'		aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonReviewer", _
	'					"EntityID", EntityID, "IsReviewer", "1")

	'		If Not aPrimList Is Nothing Then
	'			If aPrimList.Count > 0 Then
	'				If aPersonReviewerList(0).GetPropertyInt("PersonReviewerID", 0) <> aPrimList(0).GetPropertyInt("PersonReviewerID", 0) Then
	'					aPrimList(0)("IsReviewer") = 0
	'					WebSession.DataObjectFactory.SaveDataObject(aPrimList(0))
	'				End If
	'			End If
	'		End If
	'	End If

	'	ctlStartDate = CType(Me.FindControl("ctlStartDate"), cDateTextBox)

	'	Dim aDataObject As cDataObject
	'	Dim mStartDate As String

	'	aDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("PersonReviewer")
	'	mStartDate = aDataObject.GetPropertyValue("StartDate")


	'	If mStartDate = "" Then
	'		ctlStartDate.datestring = "none"
	'	End If

	'	MyBase.DataPresenter_SaveDataObjects()

	'End Sub
	
'=============================================================
End Class 'cContact_ReviewerInfo_Editor
End Namespace