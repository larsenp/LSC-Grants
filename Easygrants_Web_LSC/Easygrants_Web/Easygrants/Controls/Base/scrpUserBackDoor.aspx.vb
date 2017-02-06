Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core.DataAccess
Imports Easygrants.Web.User

Namespace Easygrants_Web.Controls.Base

Public Class cscrpUserBackDoor
Inherits EasyGrants.Web.cEGPage
'=============================================================

	Protected ReadOnly Property UserID() As Integer
		Get
			UserID = Request.QueryString("UserID")
		End Get
	End Property
	
	Protected ReadOnly Property ReturnURL() As Integer
		Get
			ReturnURL = Request.QueryString("ReturnURL")
		End Get
	End Property

'-------------------------------------------------------------

	Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		'don't call base load, not interested in a script control
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aXmlDoc As cXMLDoc
		Dim aModuleDoc As cXMLDoc
		Dim aUserDO As cDataObject
		Dim aUser As cEGUser

		aXmlDoc = EGSession.DataObjectFactory.CreateDataObjectNode("User", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(EGSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserID", UserID))

		aUserDO = EGSession.DataObjectFactory.GetDataObject(aDataObjectNode)
		'Debug.WriteLine("Here we are: " & UserID.ToString())
		'Debug.WriteLine("User: " & (aUserDO("UserName").ToString()))

		aUser = EGSession.EGUser_From_UserDataobject(aUserDO, aModuleDoc)
		If Not aUser Is Nothing Then
			'If Not ReturnURL = "" Then
			'	Response.Redirect("ReturnURL")
			'Else
				ModulePage_RedirectToModule(aModuleDoc)
			'End If
		End If
	End Sub

'=============================================================
End Class

End Namespace 'Easygrants_Web.Controls.Base