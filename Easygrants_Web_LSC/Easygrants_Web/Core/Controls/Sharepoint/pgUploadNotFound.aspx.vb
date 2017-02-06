Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Web.User
Imports Core.Web

Namespace Core_Web.Controls.Sharepoint

Public Class cpgUploadNotFound
	Inherits Core.Web.cCorePage
	
	Protected errMsg As String
	Protected trNotFound As HtmlTableRow
	Protected trFileDeletedInDB As HtmlTableRow
	Protected trSharepointDown As HtmlTableRow
	Protected spnsharepointdown As HtmlGenericControl
'=============================================================
	Public ReadOnly Property ErrType() As String
		Get
			ErrType = Request.QueryString("ErrType")
		End Get
	End Property
	
	Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		If ErrType = "NotFound" Then
			trNotFound.Visible = True
		ElseIf ErrType = "NotFoundInDB" Then
			trFileDeletedInDB.Visible = True
		ElseIf ErrType = "SharepointDown" Then
			trSharepointDown.Visible = True
			Dim aSharePointDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")(0)
			If Not aSharePointDO Is Nothing Then
				spnsharepointdown.InnerText = aSharePointDO.GetPropertyString("SharepointUnreachableMessage", "Sharepoint Server is Down")
			End If
		End If
	End Sub

'=============================================================
End Class

End Namespace 'Core_Web.Controls.Base