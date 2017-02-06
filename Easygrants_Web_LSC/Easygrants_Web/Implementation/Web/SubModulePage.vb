Imports System.Xml
Imports Core.Web.Navigation
Imports Core.Web.User
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Web.User
Imports EasyGrants.Workflow

Namespace Implementation.Web
Public Class cSubModulePage
	Inherits cValidationSubModulePageImpl

'=============================================================

	Public Readonly Property StaffUser As cEGStaffUser
		Get 
			Return CType(WebSession.User("cEGStaffUser"), cWebUser)
		End Get
	End Property
    
'=============================================================

	Public Overrides Sub Validate_ModuleUser_MasterNavElement() 
		Dim aParNavNode As XmlNode
		If ModuleUser.MasterNavElement Is Nothing Then
			ModuleUser.MasterNavElement = New cXMLNavElement(True)

			'Load staff navigation with current module navigation inserted (Assumes staff module is named "Staff"; can look into ways to make this more configurable)
			Dim aStaffModuleDoc As cXMLDoc = New cXMLDoc(WebAppl.Build_RootFileSystemPath(WebAppl.Get_RelativeDefaultModuleRoot() + "/Staff/ModuleConfig.config"))
			aParNavNode = aStaffModuleDoc.DocElement.SelectSingleNode("descendant::Navigation")
			Dim aChildModuleEl As XmlElement = aParNavNode.SelectSingleNode("NavElement[@Key='ChildModule']")
			Dim aModuleNavList As XmlNodeList = ModuleNode.SelectNodes("descendant::Navigation/NavElement")
			aChildModuleEl.Attributes("NavTitle").Value = cXMLDoc.AttributeToString(ModuleNode, "DescriptiveName")

			'Configure child module element to redirect to module default page.
			Dim aDefaultPageKey As String = cXMLDoc.AttributeToString(ModuleNode, "DefaultPageKey")
			Dim aDefaultPageEl As XmlElement = ModuleNode.SelectSingleNode("descendant::Pages/Page[@Key='" + aDefaultPageKey + "']")
			Dim aDefaultNavKey As String = cXMLDoc.AttributeToString(aDefaultPageEl, "NavKey")
			Dim aDefaultNavEl As XmlElement = ModuleNode.SelectSingleNode("descendant::Navigation/NavElement[@Key='" + aDefaultNavKey + "']")
			'get source file from this nav element
			aChildModuleEl.Attributes("SourceFile").Value = cXMLDoc.AttributeToString(aDefaultNavEl, "SourceFile")
			
			'We need to append the navigation XML from the current module at the designated spot inside the navigation XML 
			'from the staff module. Since the navigation elements come from two different documents, the append can't be 
			'done directly. So we create a new XML node in the staff navigation element, add the contents of the current
			'module navigation XML to a new element and append that new element.
			Dim aModuleNavNode As XmlNode
			Dim aAddedNavEl As XmlElement
			For Each aModuleNavNode In aModuleNavList
				Dim aImportNavNode As XmlNode = aStaffModuleDoc.XMLDocument.ImportNode(aModuleNavNode, True)
				aChildModuleEl.AppendChild(aImportNavNode)
				'aAddedNavEl = aStaffModuleDoc.XMLDocument.CreateElement("NavElement")
				'aAddedNavEl.InnerXml = aModuleNavNode.InnerXml
				'Dim aAttr As XmlAttribute
				'Dim aNewAttr As XmlAttribute
				'For Each aAttr In aModuleNavNode.Attributes
				'	aNewAttr = aStaffModuleDoc.XMLDocument.CreateAttribute(aAttr.Name)
				'	aNewAttr.Value = aAttr.Value
				'	aAddedNavEl.Attributes.Append(aNewAttr)
				'Next
				'aChildModuleEl.AppendChild(aAddedNavEl)
			Next
			
			CType(ModuleUser.MasterNavElement, cXMLNavElement).XMLNavElement_Load(aParNavNode)
		End If
	End Sub

'-------------------------------------------------------------

	Public Overrides Overloads Sub Submit_UpdateData() 
		Dim aWfTaskAssignment As cWfTaskAssignment = CType(WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", WfTaskAssignmentID), cWfTaskAssignment)
		Dim aSubmissionHistory As cDataObject = Nothing
		Dim aSubmissionHistoryBMGF As cDataObject = Nothing
		If WebAppl.CreateSubmissionHistory Then
			aSubmissionHistory = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("SubmissionHistory")
			aSubmissionHistory("WfTaskAssignmentID") = WfTaskAssignmentID
			aSubmissionHistory("WfTaskID") = aWfTaskAssignment.GetPropertyInt("WfTaskID")
			aSubmissionHistory("PersonID") = aWfTaskAssignment.GetPropertyInt("PersonID")
			'aSubmissionHistory("StartDate") = CType(aWfTaskAssignment.GetPropertyValue("StartDate"), System.DateTime)
			aSubmissionHistory("OpenDate") = aWfTaskAssignment.GetPropertyValue("OpenDate")
			aSubmissionHistory("DueDate") = aWfTaskAssignment.GetPropertyValue("DueDate")
			aSubmissionHistory("CloseDate") = aWfTaskAssignment.GetPropertyValue("CloseDate")
			'aSubmissionHistory("EndDate") = CType(aWfTaskAssignment.GetPropertyValue("EndDate"), System.DateTime)
			aSubmissionHistory("PreWfTaskStatusID") = aWfTaskAssignment.GetPropertyValue("WfTaskStatusID")
			aSubmissionHistory.SaveData()
			aSubmissionHistoryBMGF = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("SubmissionHistoryBMGF")
			aSubmissionHistoryBMGF("SubmissionHistoryID") = aSubmissionHistory.GetPropertyInt("SubmissionHistoryID")
			aSubmissionHistoryBMGF("PreSelectedOutcomeID") = aWfTaskAssignment.GetRelatedPropertyInt("WfTaskAssignmentBMGF.SelectedOutcomeID")
			aSubmissionHistoryBMGF("IsResubmit") = aWfTaskAssignment.GetRelatedPropertyBool("WfTAResubmitDescription.IsResubmit")
			aSubmissionHistoryBMGF.SaveData()
		End If
		aWfTaskAssignment("WfTaskStatusID") = 2
		aWfTaskAssignment("SubmittedDate") = System.DateTime.Now
		WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssignment)
		aWfTaskAssignment.SetWfTaskOutcome(OutcomeConfigDoc)
		If WebAppl.CreateSubmissionHistory Then
			aSubmissionHistory("SubmittedDate") = aWfTaskAssignment.GetPropertyValue("SubmittedDate")
			aSubmissionHistory("WfTaskOutcomeID") = aWfTaskAssignment.GetPropertyValue("WfTaskOutcomeID")
			aSubmissionHistory("PostWfTaskStatusID") = aWfTaskAssignment.GetPropertyValue("WfTaskStatusID")
			aSubmissionHistory.SaveData()
			
			'Because GetRelatedPropertyValue returns Nothing rather than DBNull.Value when retrieving a null
			'value from the database, and because setting a data object property to Nothing results in an error, we
			'need to have the following "If" condition in the code, rather than just setting one property directly
			'from another.
			If aWfTaskAssignment.GetRelatedPropertyValue("WfTaskAssignmentBMGF.SelectedOutcomeID") Is Nothing Then
				aSubmissionHistoryBMGF("PostSelectedOutcomeID") = DBNull.Value
			Else
				aSubmissionHistoryBMGF("PostSelectedOutcomeID") = aWfTaskAssignment.GetRelatedPropertyValue("WfTaskAssignmentBMGF.SelectedOutcomeID")
			End If
			aSubmissionHistoryBMGF.SaveData()
		End If
	End Sub

'=============================================================

End Class
End Namespace