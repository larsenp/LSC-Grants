Imports System.Xml
Imports System.Diagnostics
Imports EasyGrants.Workflow
Imports Core.DataAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.DataAccess.XMLAccess

Namespace Implementation.Modules.ReviewStage

Public Class cModuleContent
	Inherits EasyGrants.Web.Modules.cSubmissionModulePage
'=============================================================

	Public Overrides Sub CorePage_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		 MyBase.CorePage_Load(aSrc, aEvent)
	End Sub

'=============================================================

		Public Function ValidateFinalPDF(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement, ByVal aGenStatusID As String) As Integer
			Dim aReportOutputDefinitionID As Integer
			Dim aReportOutputDO As cDataObject
			Dim aWfTaskAssignmentID As Integer

			aReportOutputDefinitionID = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "WfTaskAssignmentID", CType(CType(Page, cModulePage).ModuleUser, cEGUser).WfTaskAssignmentID)(0).GetRelatedPropertyInt("WfTask.WfTaskModule.ReportOutputDefinitionID")
			aWfTaskAssignmentID = aWfTaskAssignment.GetPropertyInt("WfTaskAssignmentID")
			aReportOutputDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReportOutput", "DefinitionID", aReportOutputDefinitionID, "EntityID", aWfTaskAssignmentID, "GenStatus", aGenStatusID)(0)

			If aReportOutputDefinitionID.Equals(Nothing) Then
				Return 3
			Else
				If aReportOutputDO Is Nothing Then
					Return 3
				Else
					Return 1
				End If
			End If
		End Function

'-------------------------------------------------------------

	Public Function ValidateResearchCategories(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		Dim aList As cDataObjectList
		Dim aResultCode As Integer
		Dim aMessage As String
		Dim aResultEl As XmlElement
		Dim aGranteeProjectDO As cDataObject
		Dim aObjList As cDataObjectList
		Dim aURL As String
		Dim aGPResearchDOList As cDataObjectList
		Dim aCount As Integer = 0

		aGPResearchDOList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("GranteeProjectAHA.GranteeProjectResearchCategories")
		'aList = aGranteeProjectDO.GetRelatedPropertyDataObjectList("GranteeProjectDepartmentChair")
		aCount = aGPResearchDOList.Count

		'Select Case aGPResearchDOList.Count
		'	Case < 1 and > 5
		'		aResultCode = 3
		'		aMessage = "You must provide a BME Department or Program Chair."
		'	Case Is > 0 and Is < 6
		'		aResultCode = 1
		'End Select

		If aCount < 1 Or aCount > 5 Then
			aResultCode = 3
			aMessage = "You must select at least one, but no more than five items for the Research  category."
		ElseIf aCount >= 1 And aCount <= 5 Then
			aResultCode = 1
			aMessage = "You have indicated at least one, but no more than five items for the Research category."
		End If

		aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, aResultCode)
		If Not aResultEl Is Nothing Then
			cXMLDoc.SetValidationResultMessage(aResultEl, aMessage)
		End If
		Return aResultCode
	End Function

'-------------------------------------------------------------

	Public Function ValidateTotal(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Dim aList As cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("GranteeProject.Budget.BudgetPeriods")
			Dim aObj As cDataObject 
			dim aTotal as Double = 0
			
			for each aObj in aList
				dim aItem as cDataObject = aObj.GetRelatedPropertyDataObject("BudgetItem201")
				
				if not aItem is nothing then
					aTotal = aTotal + aItem.GetPropertyDouble("Amount")
				end if
			Next		
				
			if aTotal > 593000 then
				return 3
			else
				return 1
			End If			
		End Function	
        
'-------------------------------------------------------------

	Public Function ValidateSupport(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            dim aTotal as Double = 0
			dim aObj as cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod1.BudgetItem208")
			
			if not aObj is nothing then
				aTotal = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod1.BudgetItem208").GetPropertyDouble("Amount") _
					+ aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod1.BudgetItem209").GetPropertyDouble("Amount")
				
				If aTotal > 30000 Then return 3
				
				aTotal = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod2.BudgetItem208").GetPropertyDouble("Amount") _
					+ aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod2.BudgetItem209").GetPropertyDouble("Amount")
				
				If aTotal > 30000 Then return 3
				
				aTotal = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod3.BudgetItem208").GetPropertyDouble("Amount") _
					+ aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod3.BudgetItem209").GetPropertyDouble("Amount")
				
				If aTotal > 30000 Then return 3
				
				aTotal = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod4.BudgetItem208").GetPropertyDouble("Amount") _
					+ aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod4.BudgetItem209").GetPropertyDouble("Amount")
				
				If aTotal > 30000 Then return 3
				
				aTotal = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod5.BudgetItem208").GetPropertyDouble("Amount") _
					+ aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod5.BudgetItem209").GetPropertyDouble("Amount")
				
				If aTotal > 30000 Then
					Return 3
				Else
					return 1
				End If
			end if
			
			return 1
		End Function	
        
'-------------------------------------------------------------

	Public Function ValidateSalaryFringe(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            dim aTotal as Double = 0
			dim aObj as cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod1.BudgetItem204")
			
			if not aObj is nothing then
				aTotal = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod1.BudgetItem204").GetPropertyDouble("Amount") _
					+ aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod1.BudgetItem205").GetPropertyDouble("Amount")
				
				If aTotal > 90000 Then return 3
				
				aTotal = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod2.BudgetItem204").GetPropertyDouble("Amount") _
					+ aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod2.BudgetItem205").GetPropertyDouble("Amount")
				
				If aTotal > 90000 Then return 3
				
				aTotal = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod3.BudgetItem204").GetPropertyDouble("Amount") _
					+ aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod3.BudgetItem205").GetPropertyDouble("Amount")
				
				If aTotal > 90000 Then return 3
				
				aTotal = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod4.BudgetItem204").GetPropertyDouble("Amount") _
					+ aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod4.BudgetItem205").GetPropertyDouble("Amount")
				
				If aTotal > 90000 Then return 3
				
				aTotal = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod5.BudgetItem204").GetPropertyDouble("Amount") _
					+ aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod5.BudgetItem205").GetPropertyDouble("Amount")
				
				If aTotal > 90000 Then
					Return 3
				Else
					return 1
				End If
			end if
			
			return 1
		End Function	
        
'-------------------------------------------------------------

		Public Function ValidateYearTotal(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            dim aObj as cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod1.BudgetItem201")
			
			if not aObj is nothing then
				Select Case cXMLDoc.AttributeToInt(aValidationItemNode, "Year")
					case 1
						if aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod1.BudgetItem201").GetPropertyDouble("Amount") _
							> aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod1.BudgetItem101").GetPropertyDouble("Amount") then
							return 3
						End If						
					case 2
						if aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod2.BudgetItem201").GetPropertyDouble("Amount") _
							> aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod2.BudgetItem101").GetPropertyDouble("Amount") then
							return 3
						End If						
					case 3
						if aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod3.BudgetItem201").GetPropertyDouble("Amount") _
							> aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod3.BudgetItem101").GetPropertyDouble("Amount") then
							return 3
						End If						
					case 4
						if aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod4.BudgetItem201").GetPropertyDouble("Amount") _
							> aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod4.BudgetItem101").GetPropertyDouble("Amount") then
							return 3
						End If						
					case 5
						if aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod5.BudgetItem201").GetPropertyDouble("Amount") _
							> aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod5.BudgetItem101").GetPropertyDouble("Amount") then
							return 3
						End If						
				End Select	
			end if		
		End Function
        
'-------------------------------------------------------------

	Public Function ValidateAnimalUse(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            dim aObj as cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProjectInfo")
			
			if aObj.GetPropertyString("NoAnimalSubject") <> "True" then
				dim aList as cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("GranteeProjectAnimalSubject")
				
				If aList.Count = 0 Then
					Return 3
				Else
					return 1
				End If
			end if
			
			return 1
		End Function	
        
'-------------------------------------------------------------

	Public Function ValidateIACUCUpload(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Dim aResultCode As Integer
			Dim aMessage As String
			Dim aResultEl As XmlElement
            
            dim aObj as cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProjectInfo")
			
			if aObj.GetPropertyString("NoAnimalSubject") <> "True" and aObj.GetPropertyString("NoIACUCDocument") <> "True" then
				dim aList as cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("SubmittedFile")
				
				If aList.Count = 0 Then
					'Return 3
					aResultCode = 3
					aMessage = "The IRB Upload is required since you have specificied the Animal Subjects used in your project. Either this document has not been uploaded or the file has not been processed."
				Else
					'return 1
					aResultCode = 1
					aMessage = "You have indicated that your research involves Animal Subjects and you have uploaded your IACUC Documentation."
				End If
				aList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("SubmittedFile")
			else
				dim aList as cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("SubmittedFile")
				if aList.Count = 1 then
					if aObj.GetPropertyString("NoAnimalSubject") <> "True" and aObj.GetPropertyString("NoIACUCDocument") = "True" then	
							aResultCode = 3
							aMessage = "You have indicated you do not have your IACUC document at this time and you have also uploaded a document.  You must either upload a document or check the box."					
					end if
				else
					aResultCode = 1
					aMessage = "You have indicated that your research involves Animal Subjects and that you will send the IACUC Documentation. Note: Receipt of this document is required before any payments for this grant are made."					
				end if
			end if
				
			aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, aResultCode)
			If Not aResultEl Is Nothing Then
				cXMLDoc.SetValidationResultMessage(aResultEl, aMessage)
			End If
		Return aResultCode
			
			
			'return 1
		End Function	
' Added on 03/10/2008 by Vikram
			Public Function ValidateScores(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aUser As cEGUser
			Dim aWFTADo As cDataObject
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			aWFTADo = aUser.WfTaskAssignmentObject
			Dim aBioMedPanelReviewList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ExternalReviewApplicationsList", "ReviewCycleStageID", aWFTADo.GetPropertyInt("ReviewCycleStageID"), "ReviewerID", aUser.PersonID, "RevWfTaskID", aUser.WfTaskID, "ReviewRating", "")

			If aBioMedPanelReviewList.Count = 0 Then
					Return 1
				Else
					Return 3
				End If
			Return 1
		End Function
' Added on 03/10/2008 by Vikram
		Public Function ValidateCritiques(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aUser As cEGUser
			Dim aWFTADo As cDataObject
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			aWFTADo = aUser.WfTaskAssignmentObject
			Dim aBioMedPanelReviewListDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ExternalReviewApplicationsList", "ReviewCycleStageID", aWFTADo.GetPropertyInt("ReviewCycleStageID"), "ReviewerID", aUser.PersonID, "RevWfTaskID", aUser.WfTaskID)

			For Each aBioMedPanelReviewListDo As cDataObject In aBioMedPanelReviewListDOL
				If aBioMedPanelReviewListDo.GetPropertyString("Comments", "") = "" Then
					Return 3
				End If
			Next
			Return 1
		End Function
		
		Public Function ValidateConflictType(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			'This methods checks that a conflict type is selected for each conflict in the Conflicts and Preferences stage
			Dim aUser As cEGUser
			Dim aWFTADo As cDataObject
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			aWFTADo = aUser.WfTaskAssignmentObject
			Dim aXmlDoc As cXMLDoc = Nothing
			Dim aFiltersNode as XmlNode = Nothing
			Dim aDataObjectNode As XmlNode = Nothing
			Dim aArgNode As XmlNode = Nothing
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCycleStageID", aWFTADo.GetPropertyInt("ReviewCycleStageID")))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", aUser.PersonID))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aUser.WfTaskID))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewPreferenceTypeID", "4"))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewConflictTypeID", ""))
			Dim aConflictsWftaDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
			If aConflictsWftaDOL.Count > 0 Then
				Return 3
			End If
			Return 1
		End Function
		
		Public Function ValidateReviewerPreferences(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			'This methods checks that a conflict/preference is selected for each assigned applicant.
			Dim aUser As cEGUser
			Dim aWFTADo As cDataObject
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			aWFTADo = aUser.WfTaskAssignmentObject
			Dim aXmlDoc As cXMLDoc = Nothing
			Dim aFiltersNode as XmlNode = Nothing
			Dim aDataObjectNode As XmlNode = Nothing
			Dim aArgNode As XmlNode = Nothing
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCycleStageID", aWFTADo.GetPropertyInt("ReviewCycleStageID")))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", aUser.PersonID))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aUser.WfTaskID))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewPreferenceTypeID", ""))
			Dim aConflictsWftaDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
			If aConflictsWftaDOL.Count > 0 Then
				Return 3
			End If
			Return 1
		End Function
		
		Public Function ValidateScoresAndUploadComments(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aUser As cEGUser
			Dim aWFTADo As cDataObject
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			aWFTADo = aUser.WfTaskAssignmentObject
			Dim aReviewWfTADOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "ReviewCycleStageID", aWFTADo.GetPropertyString("ReviewCycleStageID"), "PersonID", aUser.PersonID.ToString, "WfTaskID", aUser.WfTaskID.ToString)

			For Each aReviewWfTADO As cDataObject In aReviewWfTADOL
				If aReviewWfTADO.GetPropertyString("ReviewRating", "") = "" Then
					Return 3
				Else
					Dim aWfTaskAssignmentReviewDO As cDataObject = aReviewWfTADO.GetRelatedPropertyDataObject("WfTaskAssignmentReview")
					If aWfTaskAssignmentReviewDO Is Nothing OrElse aWfTaskAssignmentReviewDO.GetPropertyString("CommentsUploadedFileID", "0") = "0" Then
						Return 3
					ElseIf aWfTaskAssignmentReviewDO.GetRelatedPropertyDataObject("SubmittedFile") Is Nothing Then
						Return 3
					End If
				End If
			Next
			Return 1
		End Function

		Public Function ValidateScoresAndComments(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aUser As cEGUser
			Dim aWFTADo As cDataObject
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			aWFTADo = aUser.WfTaskAssignmentObject
			Dim aReviewWfTADOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "ReviewCycleStageID", aWFTADo.GetPropertyString("ReviewCycleStageID"), "PersonID", aUser.PersonID.ToString, "WfTaskID", aUser.WfTaskID.ToString)

			For Each aReviewWfTADO As cDataObject In aReviewWfTADOL
				If aReviewWfTADO.GetPropertyString("ReviewRating", "") = "" Then
					Return 3
				Else
					Dim aFiltersNode As XmlNode = Nothing
					Dim aDataObjectNode As XmlNode = Nothing
					Dim aXmlDoc As cXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentReview", aDataObjectNode, aFiltersNode)
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskAssignmentID", aReviewWfTADO.GetPropertyString("WfTaskAssignmentID")))
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCommentsID", ""))
					Dim aWfTaskAssignmentReviewDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
					'Dim aWfTaskAssignmentReviewDOL As cDataObjectL = aReviewWfTADO.GetRelatedPropertyDataObjectList("WfTaskAssignmentReview", )
					If aWfTaskAssignmentReviewDOL.Count < 1 OrElse aWfTaskAssignmentReviewDOL(0).GetPropertyString("Comments", "") = "" Then
						Return 3
					End If
				End If
			Next
			Return 1
		End Function
'=============================================================
End Class 'cReviewStageModuleContent

End Namespace 'Easygrants_Web.Modules.ReviewStage