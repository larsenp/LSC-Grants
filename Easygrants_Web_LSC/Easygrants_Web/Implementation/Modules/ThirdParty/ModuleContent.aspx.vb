Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Workflow
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web.Modules
Imports Implementation.Web

Namespace Easygrants_Web.Modules.ThirdParty

Public Class cModuleContent
	Inherits cValidationSubModulePageImpl
    
'======================================================

	Public Overrides Sub CorePage_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		 MyBase.CorePage_Load(aSrc, aEvent)
	End Sub
	
'-------------------------------------------------------------

     
	
'------------------------------------------------------

'   Public Overloads Overrides Sub Submit(ByVal aPersonDataObject As cDataObject, ByVal aModuleName As String, ByVal aModuleConfig As String, ByVal aPageKey As String)
'		Dim aModuleDoc As cXMLDoc  'not used in this function, created to be passed into EGUser_From_ModuleConfig
'		Dim aXmlDoc As cXMLDoc
'		Dim aDataObjectNode As XmlNode
'		Dim aFiltersNode As XmlNode
'		Dim aPersonRoleID As Integer
'		Dim aUser As cEGUser

'		aUser = EGSession.EGUser_From_ModuleConfig(aModuleName, aModuleConfig, aModuleDoc)

'		WfTaskAssignmentObject("WfTaskStatusID") = 2
'		WfTaskAssignmentObject("WfTaskOutcomeID") = 1
'		WebSession.DataObjectFactory.SaveDataObject(WfTaskAssignmentObject)
'		WfTaskAssignmentObject.SetWfTaskOutcome()

'		ModulePage.ModulePage_RedirectToModule(aModuleDoc)


'  End Sub

''-------------------------------------------------------------

'	Public Overloads Overrides Sub Submit(ByVal aForceGenFlag As Boolean)
'		Dim aReportGenerated As Boolean = False
'		Dim aWfTaskAssignmentID As String
'		Dim aReportDOList As cDataObjectList
'		Dim aURL As String

'		If aForceGenFlag Then
'			aReportDOList = CType(Page, cSubmissionModulePage).WfTaskAssignmentObject.GetRelatedPropertyDataObjectList("ReportOutput")

'			If aReportDOList.Count > 0 Then
'				If aReportDOList(0)("GenStatus") = -1 And Not aReportDOList(0)("ReportOutputData") Is Nothing Then
'					aReportGenerated = True
'				End If
'			End If
'		Else
'			aReportGenerated = True
'		End If

'		If aReportGenerated Then
'			Dim aPersonDataObject As cDataObject = New cDataObject()
'			Submit(aPersonDataObject, "Home", "HomeModuleConfig", "Home")
'		Else
'			aURL = CType(WebSession.CurrentPage, cModulePage).ModulePage_BuildPageKeyURL(CType(WebSession.CurrentPage, cModulePage).PageKey)
'			aURL += "&AppNotGenerated=True"
'			Response.Redirect(aURL)
'		End If
'	End Sub

'-------------------------------------------------------------

	'Public Overloads Sub Submit()
	'	Submit(True)
	'End Sub
	
'-------------------------------------------------------------

	'Public Function ValidateCurrentGrants(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
	'	Dim aNoCurrentGrantsChecked As Boolean
	'	Dim aGrantCount As Integer
	'	Dim aMessage As String
	'	Dim aResultEl As XmlElement

	'	aNoCurrentGrantsChecked = aWfTaskAssignment.GetRelatedPropertyBool("Person.MentorCurrentGrantCV")
	'	aGrantCount = aWfTaskAssignment.GetRelatedPropertyDataObjectList("Person.CurrentGrants").Count

	'	If aNoCurrentGrantsChecked Xor aGrantCount > 0 Then
	'		Return 1
	'	Else
	'		If aNoCurrentGrantsChecked Then
	'			aMessage = "You have checked the box indicating that you have no current grants to report, but you have added at least one current grant record."
	'		Else
	'			aMessage = "You must check the box indicating that you have no current grants, or provide at least one current grant record."
	'		End If
	'		aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, 3)
	'		cXMLDoc.SetValidationResultMessage(aResultEl, aMessage)
	'		Return 3
	'	End If

	'End Function

'======================================================

End Class
End Namespace

