Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Controls.Base

Public MustInherit Class cSubmissionContentKatz
    Inherits Easygrants_Web.Controls.Base.cValidationDataPresenterCtl
'=================================================

    Protected spnInvalidText As HtmlGenericControl
    Protected spnNoReportText As HtmlGenericControl
    Protected spnSubmitText As HtmlGenericControl
    Protected spnSubmitButton As HtmlGenericControl
    Protected spnAppNotGenerated As HtmlGenericControl
    Protected spnAppGenerated As HtmlGenericControl
    Protected spnValidationPage As HtmlGenericControl
	'Protected btnSubmit As cButton

	Protected mForceGen As Boolean = True

'=================================================

	Public Property ForceGen() As Boolean
		Get
			Return mForceGen
		End Get
		Set(ByVal Value As Boolean)
			mForceGen = Value
		End Set
	End Property

'=================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		Dim aWfDataObject As cWfTaskAssignment
		Dim aValidationNode As XmlNode
		Dim aValid As Boolean
		Dim aValidPDF As Boolean = False
		Dim aReportDOList As cDataObjectList
		Dim aReportDO As cDataObject

		If Request.QueryString("AppNotGenerated") = "True" Then
			spnAppNotGenerated.Visible = True
		End If

		aValidationNode = (CType(Page, cModulePage)).ValidationNode
		aWfDataObject = CType(mDataObjHash("WfTaskAssignment")(0), cWfTaskAssignment)
		'Check final PDF generation
		aReportDOList = aWfDataObject.GetRelatedPropertyDataObjectList("ReportOutput")
		If aReportDOList.Count > 0 Then
			aReportDO = aReportDOList(0)
			IF aReportDO.GetPropertyInt("GenStatus",0) = -1 And Not aReportDO.GetPropertyValue("ReportOutputData") Is Nothing Then
				aValidPDF = True
			End If
		End If
		If aValidPDF Then
			spnAppGenerated.Visible = True
			spnAppNotGenerated.Visible = False
			spnValidationPage.Visible = False
		Else
			spnAppNotGenerated.Visible = True
			spnValidationPage.Visible = True
		End If		

		aValid = Validate(aValidationNode, WebSession.DataObjectFactory)

		If Not aValid Then
			spnInvalidText.Visible = True
			'spnSubmitButton.Visible = False
			spnAppGenerated.Visible = False
			spnAppNotGenerated.Visible = False
			spnValidationPage.Visible = False
		Else
			spnSubmitText.Visible = True
		End If
		
		If aValid And aValidPDF Then
			spnSubmitButton.Visible = True
		Else
			spnSubmitButton.Visible = False
		End If		
	End Sub

'-------------------------------------------------

	Public Sub SubmissionContent_Submit()
		Dim aXmlDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aWfTaskAssgObject As cDataObject
		Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		Dim aGranteeProjectDO As cGranteeProject
		aGranteeProjectDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aUser.GranteeProjectID)
		'Dim aDC_PersonID As Integer
		'aDC_PersonID = aGranteeProjectDO.GetRelatedPropertyInt("GranteeProjectDepartmentChair.PersonID")

		'create WfTA for the Department Chair
		'aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
		'aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aUser.WfTaskID.ToString()))
		'aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", aDC_PersonID.ToString()))
		'aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskRoleID", "5"))
		'aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "GranteeProjectID", aUser.GranteeProjectID.ToString()))
		'aWfTaskAssgObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
		'if aWfTaskAssgObject Is Nothing Then
		'	WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
		'	aWfTaskAssgObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
		'End If
		'	aWfTaskAssgObject("WfTaskID") = aUser.WfTaskID
		'	aWfTaskAssgObject("GranteeProjectID") = aUser.GranteeProjectID
		'	aWfTaskAssgObject("WfTaskStatusID") = 1
		'	aWfTaskAssgObject("PersonID") = aDC_PersonID
		'	aWfTaskAssgObject("WfTaskRoleID") = 5
		'	WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject)
		'End If
		'End create WfTA for the Department Chair
		
		'create WfTA for the Grants Officer 3rd Party		
		'aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
		'aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", "10"))
		'aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskRoleID", "103"))
		'aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "GranteeProjectID", aUser.GranteeProjectID.ToString()))
		'aWfTaskAssgObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
		'if aWfTaskAssgObject Is Nothing Then
		'	WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
		'	aWfTaskAssgObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
		'	aWfTaskAssgObject("WfTaskID") = 10
		'	aWfTaskAssgObject("GranteeProjectID") = aUser.GranteeProjectID
		'	aWfTaskAssgObject("WfTaskStatusID") = 1
		'	aWfTaskAssgObject("PersonID") = aGranteeProjectDO.GetRelatedPropertyInt("GrantsOfficerPP.RelatedPersonID")
		'	aWfTaskAssgObject("WfTaskRoleID") = 103 'Grants Officer
		'else
		'	aWfTaskAssgObject("WfTaskStatusID") = 1
		'End If
		'	WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject)
		'End If
		'End create WfTA for the Grants Officer
		
	
		Dim aSubmitPage as cSubmissionModulePage
		aSubmitPage = CType(Page, cSubmissionModulePage)
		aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
		aSubmitPage.PostSubmitModuleName = "Application"
		aSubmitPage.Submit(ForceGen)
	End Sub

'=================================================
End Class
End Namespace