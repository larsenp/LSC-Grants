Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.Web.Modules

Namespace Implementation.Modules.Staff.Controls.PageSection
Public MustInherit Class cAddOrganization_Editor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

'=============================================================

	Protected ctlOrgType As cDropDown
	Protected ctlOrgName As cTextBox
	Protected ctlEIN As cTextBox

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

'=============================================================

	Public Overloads Overrides Function EventController_Save() As Boolean
		Dim aXmlDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aArgNode As XmlNode
		Dim aObjList As cDataObjectList
		Dim aEINMatchingList As cDataObjectList
		Dim aURL As String

		ctlOrgType = CType(Me.FindControl("ctlOrgType"), cDropDown)
		ctlOrgName = CType(Me.FindControl("ctlOrg"), cTextBox)
		ctlEIN = CType(Me.FindControl("ctlEIN"), cTextBox)

		Dim aOrganizationID As String = Request.QueryString("OrganizationID")
		If aOrganizationID Is Nothing Then
			aOrganizationID = "0"
		End If

		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Organization", aDataObjectNode, aFiltersNode)
		aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "OrganizationName", ctlOrgName.Value)
		cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
		aArgNode.Attributes("Operator").Value = "Like"
		aFiltersNode.AppendChild(aArgNode)

		aObjList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		aEINMatchingList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Organization", "EIN", ctlEIN.Value)
		If (aObjList.Count > 0 And aOrganizationID = "0") Or aObjList.Count > 1 Or aEINMatchingList.Count > 0 Then
			aURL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "OrgName", ctlOrgName.Value)
			aURL = cWebLib.AddQuerystringParameter(aURL, "OrgType", ctlOrgType.SelectedValue)
			aURL = cWebLib.AddQuerystringParameter(aURL, "EIN", ctlEIN.Value)
			aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "OrganizationList")
			Response.Redirect(aURL)
		End If

		MyBase.EventController_Save()

		If Not Page.IsValid Then
			Return False
		End If

		aURL = Request.QueryString("ReturnURL")

		If aURL = "" Then
			Response.Redirect(Request.Url.ToString())
		Else
			aOrganizationID = (CType(Me.DataObjectCollection("Organization"), cDataObjectList))(0).GetPropertyString("OrganizationID")
			aURL = cWebLib.AddQuerystringParameter(aURL, "OrganizationID", aOrganizationID)
			Response.Redirect(aURL)
		End If

	End Function

'=============================================================

End Class
End Namespace