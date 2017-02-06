Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cPersonalData_Editor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================

 '   Protected ctlOrgName As cTextBox
	'Protected ctlIsEligible As cCheckBox
	'Protected ctlIsTranslationalPartner As cCheckBox
	'Protected ctlIsTranslationalPartnerApplicant As cCheckBox
	'Protected trEditButtons As HtmlTableRow
    Protected valEthnicity as CustomValidator
    Protected ctlEthnicity as cRadioButtonList
    Protected ctlRace as cCheckBoxList
    protected valRace as CustomValidator

	
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

	End Sub	

'=============================================================

 '   Public Overloads Overrides Function EventController_Save() As Boolean
 '       Dim aXmlDoc As cXMLDoc
 '       Dim aDataObjectNode As XmlNode
 '       Dim aFiltersNode As XmlNode
 '       Dim aArgNode As XmlNode
 '       Dim aObjList As cDataObjectList
 '       Dim aURL As String

 '       ctlOrgName = CType(Me.FindControl("ctlOrgName"), cTextBox)
        
 '       Dim aOrganizationID As String = Request.QueryString("OrganizationID")
 '       If aOrganizationID Is Nothing Then
	'		aOrganizationID = "0"
	'	End If

	'	If aOrganizationID = "0" Or aOrganizationID = "" Then
	'		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Organization", aDataObjectNode, aFiltersNode)
	'		aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "OrganizationName", ctlOrgName.Value)
	'		cXMLDoc.AddAttribute_ToNode(aArgNode, "Operator")
	'		aArgNode.Attributes("Operator").Value = "Like"
	'		aFiltersNode.AppendChild(aArgNode)

	'		aObjList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)

	'		If (aObjList.Count > 0 And aOrganizationID = "0") Or aObjList.Count > 1 Then
	'			aURL = cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "OrgName", ctlOrgName.Value)
	'			aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "OrganizationList")
	'			Response.Redirect(aURL)
	'		End If
	'	end if
		
 '       MyBase.EventController_Save()

	'	If Not Page.IsValid Then
	'		Return False
	'	End If

 '       aURL = Request.QueryString("ReturnURL")

 '       If aURL = "" Then
 '           Response.Redirect(Request.Url.ToString())
 '       Else
 '           aOrganizationID = (CType(Me.DataObjectCollection("Organization"), cDataObjectList))(0).GetPropertyString("OrganizationID")
 '           aURL = cWebLib.AddQuerystringParameter(aURL, "OrganizationID", aOrganizationID)
 '           Response.Redirect(aURL)
 '       End If

	'End Function	
	'--------------------------------------------------------------

	'Invoked by EventController_ControlValidate
	Public Sub ValidateRace(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
 
 		Dim i As Integer
		Dim aSelectedTotal as Integer = 0
		
        ctlRace = Me.FindControl("ctlRace")

		For i=0 to ctlRace.BaseControl.Items.Count - 1
			If ctlRace.BaseControl.Items(i).Selected Then
				aSelectedTotal = aSelectedTotal + 1
			End If 
		Next i
		
		if aSelectedTotal > 1 then
			aArgs.IsValid = False
		else
			aArgs.IsValid = True
		end if


	End Sub

'-----------------------------------------------------
  
    Public Sub ValidateEthnicity(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		
    ctlEthnicity = Me.FindControl("ctlEthnicity")  
    ctlRace = Me.FindControl("ctlRace")
						
    If ctlEthnicity.SelectedField <> "" then
		If ctlEthnicity.SelectedValue = 1 And ctlRace.RetrieveRows > "0" Then
            aArgs.IsValid = False
		End If
	End If
						
   End Sub

'=============================================================
End Class
End Namespace