Imports System.Xml
Imports System.IO
Imports System.Text
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports Core.DataAccess

Namespace Easygrants_Web.Controls.PageSection
Public Class cStaffTaskGenUploadsButtonList
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
	Private mGeneralUploadCategoryTypeID As Integer
	Private mGeneralUploadCategoryID As Integer
	Private mPrimaryKey As String



	Public Property GeneralUploadCategoryTypeID() As Integer
		Get
			Return mGeneralUploadCategoryTypeID
		End Get
		Set(ByVal Value As Integer)
			mGeneralUploadCategoryTypeID = Value
		End Set
	End Property

	Public Property GeneralUploadCategoryID() As Integer
		Get
			Return mGeneralUploadCategoryID
		End Get
		Set(ByVal Value As Integer)
			mGeneralUploadCategoryID = Value
		End Set
	End Property

	Public Property PrimaryKey() As String
		Get
			Return mPrimaryKey
		End Get
		Set(ByVal Value As String)
			mPrimaryKey = Value
		End Set
	End Property

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

	Public Sub NavigateToUploadEditor(ByVal PageKey As String, ByVal GranteeProjectID As String, ByVal UploadID As String, ByVal GeneralUploadCategoryID As String, ByVal GeneralUploadCategoryTypeID As String, ByVal WfProjectTaskUploadID As String, ByVal ReturnUrl As String)

		Dim SubmittedFileDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", "GeneralUploadCategoryID", GeneralUploadCategoryID, "GeneralUploadCategoryTypeID", GeneralUploadCategoryTypeID, "UploadID", UploadID, "GeneralUploadDataObjectPrimarykeyID", Request.QueryString(PrimaryKey))
		If SubmittedFileDOL.Count = 0 Then
			Dim aURL As String
			aURL = Request.Url.ToString().Substring(0, Request.Url.ToString().IndexOf("?"))
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Config", Request.QueryString("Config"))
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Page", PageKey)
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "GranteeProjectID", GranteeProjectID)
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "UploadID", UploadID)
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, PrimaryKey, Request.QueryString(PrimaryKey))
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "GeneralUploadCategoryID", GeneralUploadCategoryID)
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "GeneralUploadCategoryTypeID", GeneralUploadCategoryTypeID)
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "EntityDataObjectKey", "GranteeProject")
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "ReturnURL", Server.UrlEncode(ReturnUrl))
			Response.Redirect(aURL)
		Else
			Dim aURL As String
			aURL = Request.Url.ToString().Substring(0, Request.Url.ToString().IndexOf("?"))
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Config", Request.QueryString("Config"))
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Page", PageKey)
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "GranteeProjectID", GranteeProjectID)
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "UploadID", UploadID)
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, PrimaryKey, Request.QueryString(PrimaryKey))
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "GeneralUploadCategoryID", GeneralUploadCategoryID)
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "GeneralUploadCategoryTypeID", GeneralUploadCategoryTypeID)
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "SubmittedFileID", SubmittedFileDOL(0).GetPropertyString("SubmittedFileID", ""))
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "EntityDataObjectKey", "GranteeProject")
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "ReturnURL", Server.UrlEncode(ReturnUrl))
			Response.Redirect(aURL)
		End If
	End Sub
End Class

End Namespace
