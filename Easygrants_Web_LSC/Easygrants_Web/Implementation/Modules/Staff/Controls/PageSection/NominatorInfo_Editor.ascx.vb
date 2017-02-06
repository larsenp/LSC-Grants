Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports EasyGrants.DataAccess

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cNominatorInfo_Editor
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

'=============================================================

'Invoked by EventController_ControlValidate
	Public Function ValidateDuplicateCriteria(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ValidateDuplicateCriteria = True
		
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aXmlDoc As cXMLDoc
		Dim aDataObject As cDataObject

	    Dim ctlProject As cDropDown
		ctlProject = CType(Me.FindControl("ctlProject"), cDropDown)
		
		Dim iProjectID As Integer
		iProjectID = CType(ctlProject.SelectedValue, Integer)
		
		Dim iNominationCriteriaID as Integer
		iNominationCriteriaID = CType(Request.QueryString("NominationCriteriaID"), Integer)

		Dim iPersonID as Integer
		iPersonID = CType(Request.QueryString("PersonID"), Integer)

		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("NominationCriteria", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectID", iProjectID))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "NominatorPersonID", iPersonID))
		aDataObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
		If Not aDataObject Is Nothing Then
			If iNominationCriteriaID > 0 Then
				If iNominationCriteriaID <> aDataObject.GetPropertyInt("NominationCriteriaID") Then
					ValidateDuplicateCriteria = False
				End If
			Else
				ValidateDuplicateCriteria = False
			End If			
		End If

		Dim aPersonDO As cPerson
		aPersonDO = Me.DataObjectCollection("Person")(0)
		Dim aOrganizationID As Integer
		aOrganizationID = aPersonDO.GetRelatedPropertyInt("PersonPrimaryAffiliation.Organization.OrganizationID")

		aFiltersNode.RemoveAll()
		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("NominationCriteria", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectID", iProjectID))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "NominatorOrganizationID", aOrganizationID))
		aDataObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
		If Not aDataObject Is Nothing Then
			If iNominationCriteriaID > 0 Then
				If iNominationCriteriaID <> aDataObject.GetPropertyInt("NominationCriteriaID") Then
					ValidateDuplicateCriteria = False
				End If
			Else
				ValidateDuplicateCriteria = False
			End If			
		End If

	End Function

'=============================================================

'Invoked by EventController_ControlValidate
	Public Function ValidatePrimaryInstitution(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ValidatePrimaryInstitution = True
		
		Dim aInst As String
		aInst = CType(Me.FindControl("ctlInstitution"), HtmlGenericControl).InnerText
		If aInst = "" Then
			ValidatePrimaryInstitution = False
		End If		
	End Function

'=============================================================

End Class
End Namespace