Imports System.Xml
Imports Core.Web.Navigation
Imports Core.Web.User
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Web.User
Imports EasyGrants.Workflow
Imports Core.Web.Modules

Namespace Implementation.Web
Public Class cValidationSubModulePage
	Inherits EasyGrants.Web.Modules.cSubmissionModulePage

	' *******************************************************************************************************
	' ******************* The Following are the Application Folder Validation Methods ***********************
	' *******************************************************************************************************

	'Public Function ValidateProjectDemographics(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
	'	'Gender - DemographicFemale,DemographicMale,NotApplicableGender
	'	If ((Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicFemale")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicMale")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.NotApplicableGender"))) Then
	'		Return 3
	'	End If

	'	'Race/Ethnicity - DemographicAmericaIndian,DemographicAsian,DemographicBlack,DemographicLatin,DemographicMiddleEastern,DemographicWhite,DemographicOther,NotApplicableRace
	'	If ((Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicAmericaIndian")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicAsian")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicBlack")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicLatin")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicMiddleEastern")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicWhite")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicOther")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.NotApplicableRace"))) Then
	'		Return 3
	'	End If

	'	'Income - DemographicLowIncome,DemographicWorkingPoor,DemographicMiddleIncome,DemographicUpperIncome, NotApplicableIncome
	'	If ((Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicLowIncome")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicWorkingPoor")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicMiddleIncome")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicUpperIncome")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.NotApplicableIncome"))) Then
	'		Return 3
	'	End If

	'	'Locale - DemographicRural, DemographicSuburban, DemographicUrban, NotApplicableLocale
	'	If ((Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicRural")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicSuburban")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.DemographicUrban")) _
	'		And (Not aWfTaskAssignment.GetRelatedPropertyBool("GranteeProject.GranteeProjectInfo.NotApplicableLocale"))) Then
	'		Return 3
	'	End If

	'	Return 1

	'End Function
'=============================================================
	Public Function ValidateKeyword(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		Dim aKeywordList As cDataObjectList
		Dim aResultCode As Integer
		Dim aMessage As String
		Dim aResultEl As XmlElement
		Dim aGranteeProjectDO As cDataObject

		aGranteeProjectDO = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject")

		'aKeywordList = aGranteeProjectDO.GetRelatedPropertyDataObjectList("GranteeProjectKeywordWHCF")

		'Select Case aKeywordList.Count
		'	Case 0
		'		aResultCode = 3
		'		aMessage = "You must provide at least one general area research keyword."
		'	Case Is > 0
		'		aResultCode = 1
		'End Select

		'aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, aResultCode)
		'If Not aResultEl Is Nothing Then
		'	cXMLDoc.SetValidationResultMessage(aResultEl, aMessage)
		'End If
		Return aResultCode
	End Function
'-------------------------------------------------------------
	Public Function ValidateAnimal(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		Dim aKeywordList As cDataObjectList
		Dim aResultCode As Integer
		Dim aMessage As String
		Dim aResultEl As XmlElement
		Dim aGranteeProjectDO As cDataObject
		Dim aIsOtherSupport As Integer
		Dim aIsAnimalSubject As Integer
		Dim aGranteeProjectWHCF As cDataObject

		aGranteeProjectDO = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject")
		aGranteeProjectWHCF = aGranteeProjectDO.GetRelatedPropertyDataObject("GranteeProjectWHCF")

		If Not aGranteeProjectWHCF Is Nothing Then
			aIsAnimalSubject = aGranteeProjectWHCF.GetPropertyInt("IsAnimalSubject", 0)
			If aIsAnimalSubject = 0 Then
				aResultCode = 3
				aMessage = "You must provide information on the use of animal subjects."
			Else
				aResultCode = 1
			End If
		Else
			aResultCode = 3
			aMessage = "You must provide information on the use of animal subjects."
		End If

		aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, aResultCode)
		If Not aResultEl Is Nothing Then
			cXMLDoc.SetValidationResultMessage(aResultEl, aMessage)
		End If
		Return aResultCode
	End Function

'-------------------------------------------------------------

	'Public Function ValidateFunding(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
	'	Dim aList As cDataObjectList
	'	Dim aResultCode As Integer
	'	Dim aMessage As String
	'	Dim aResultEl As XmlElement
 '       Dim aGranteeProjectDO as cDataObject

 '       aGranteeProjectDO = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject")
	'	aList = aGranteeProjectDO.GetRelatedPropertyDataObjectList("GranteeProjectOtherSupports")

	'	Select Case aList.Count
	'		Case 0
	'			aResultCode = 3
	'			aMessage = "You must provide at least one additional funding source for your project."
	'		Case Is > 0
	'			aResultCode = 1
	'	End Select

	'	aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, aResultCode)
	'	If Not aResultEl Is Nothing Then
	'		cXMLDoc.SetValidationResultMessage(aResultEl, aMessage)
	'	End If
	'	Return aResultCode
	'End Function

'-------------------------------------------------------------

	'Public Function ValidateBudget(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
	'	Dim aNoPublicationsChecked As Boolean
	'	Dim aFilesList As cDataObjectList
	'	Dim aFileObj As cDataObject
	'	Dim aStatus As Integer = System.Int32.MinValue
	'	Dim aResultCode As Integer
	'	Dim aMessage As String
	'	Dim aResultEl As XmlElement


 '       aFilesList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile","EntityID",aWfTaskAssignment.GetRelatedPropertyString("WfTaskAssignmentID"))
	'	For Each aFileObj In aFilesList
	'		If aFileObj.GetPropertyInt("FileTypeID") = 14 Then
	'			aStatus = aFileObj.GetPropertyInt("ConversionStatus", 0)
	'			Exit For
	'		End If
	'	Next

	'	Select Case aStatus
	'		Case System.Int32.MinValue
	'			aResultCode = 3
	'			aMessage = "You must upload your Budget Worksheet file."
	'		Case 0
	'			aResultCode = 3
	'			aMessage = "Your Budget Worksheet upload has not been converted. File is in the queue to be converted."
	'		Case Is > 0
	'			aResultCode = 3
	'			aMessage = "Your Budget Worksheet upload has not been converted. Please re-upload your file."
	'		Case -2
	'			aResultCode = 3
	'			aMessage = "Your Budget Worksheet upload file did not pass validation. Please see the Budget page for details, then edit and re-upload your file."
	'		Case -1
	'			aResultCode = 1
	'	End Select

	'	aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, aResultCode)
	'	If Not aResultEl Is Nothing Then
	'		cXMLDoc.SetValidationResultMessage(aResultEl, aMessage)
	'	End If
	'	Return aResultCode
	'End Function 

'-------------------------------------------------------------
	Public Function ValidateAddCoPIContact(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		Dim aList As cDataObjectList
		Dim aResultCode As Integer
		Dim aMessage As String
		Dim aResultEl As XmlElement
		Dim aGranteeProjectDO As cDataObject
		Dim aFiltersNode As XmlNode
		Dim aArgNode As XmlNode
		Dim aObjList As cDataObjectList
		Dim aURL As String
		Dim aXmlDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode

		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("GranteeProjectPI", aDataObjectNode, aFiltersNode)
		aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PITypeID", "3")
		aFiltersNode.AppendChild(aArgNode)

		aGranteeProjectDO = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject")
		'aList = aGranteeProjectDO.GetRelatedPropertyDataObjectList("GranteeProjectPI",aFiltersNode)
		aList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectPI", "GranteeProjectID", aGranteeProjectDO("GranteeProjectID"), "PITypeID", "3")

		Select Case aList.Count
			Case 0
				aResultCode = 2
				aMessage = "You did not provide additional co-investigators."
			Case Is > 0
				aResultCode = 1
		End Select

		aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, aResultCode)
		If Not aResultEl Is Nothing Then
			cXMLDoc.SetValidationResultMessage(aResultEl, aMessage)
		End If
		Return aResultCode
	End Function
'-------------------------------------------------------------
	Public Function ValidateAddInstitutionContact(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		Dim aList As cDataObjectList
		Dim aResultCode As Integer
		Dim aMessage As String
		Dim aResultEl As XmlElement
		Dim aGranteeProjectDO As cDataObject
		Dim aObjList As cDataObjectList
		Dim aURL As String

		aGranteeProjectDO = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject")
		'aList = aGranteeProjectDO.GetRelatedPropertyDataObjectList("GranteeProjectAdditionalContacts")

		'Select Case aList.Count
		'	Case 0
		'		aResultCode = 2
		'		aMessage = "You did not provide additional institutional contacts."
		'	Case Is > 0
		'		aResultCode = 1
		'End Select

		'aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, aResultCode)
		'If Not aResultEl Is Nothing Then
		'	cXMLDoc.SetValidationResultMessage(aResultEl, aMessage)
		'End If
		Return aResultCode
	End Function
'-------------------------------------------------------------
	Public Function ValidateDepartmentChair(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		Dim aList As cDataObjectList
		Dim aResultCode As Integer
		Dim aMessage As String
		Dim aResultEl As XmlElement
		Dim aGranteeProjectDO As cDataObject
		Dim aObjList As cDataObjectList
		Dim aURL As String

		aGranteeProjectDO = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject")
		aList = aGranteeProjectDO.GetRelatedPropertyDataObjectList("GranteeProjectDepartmentChair")

		Select Case aList.Count
			Case 0
				aResultCode = 3
				aMessage = "You must provide a BME Department or Program Chair."
			Case Is > 0
				aResultCode = 1
		End Select

		aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, aResultCode)
		If Not aResultEl Is Nothing Then
			cXMLDoc.SetValidationResultMessage(aResultEl, aMessage)
		End If
		Return aResultCode
	End Function
'-------------------------------------------------------------
	Public Function ValidateAccredited(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		Dim aKeywordList As cDataObjectList
		Dim aResultCode As Integer
		Dim aMessage As String
		Dim aResultEl As XmlElement
		Dim aGranteeProjectInfoDO As cDataObject
		Dim aIsOtherSupport As Integer
		Dim aIsAnimalSubject As Integer
		Dim aGranteeProjectWHCF As cDataObject

		Dim aIsAccredited As String
		Dim aEffectiveDate As String
		Dim aIsAnimalSubjects As String
		aGranteeProjectInfoDO = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.GranteeProjectInfo")
		'aGranteeProjectWHCF = aGranteeProjectDO.GetRelatedPropertyDataObject("GranteeProjectWHCF")

		If Not aGranteeProjectInfoDO Is Nothing Then
			aIsAnimalSubjects = aGranteeProjectInfoDO.GetPropertyString("IsAnimalSubjects")
			aIsAccredited = aGranteeProjectInfoDO.GetPropertyString("IsAccredited")
			aEffectiveDate = aGranteeProjectInfoDO.GetPropertyString("AccreditedEffectiveDate")

			If aIsAccredited = "" And aIsAnimalSubjects = "True" Then
				aMessage = "You must indicate if your " + GetLabel("Organization") + " is accredited by AAALAC."
				aResultCode = 3
			Else
				'if aIsAnimalSubjects <> ""
				'	aResultCode = 1
				'	aMessage = "You have indicated if your research involves Animal Subjects."
				'else
					If aGranteeProjectInfoDO.GetPropertyString("IsAccredited") <> "" Then
						If aIsAccredited = "True" Then
							If aEffectiveDate <> "" Then
								aMessage = "You have indicated if your " + GetLabel("Organization") + " is accredited and the Effective Date."
								aResultCode = 1
							Else
								aMessage = "Since you have indicated your " + GetLabel("Organization") + " is accredited, please indicate the Effective Date."
								aResultCode = 3
							End If
						ElseIf aIsAnimalSubjects = "True" And aIsAccredited = "" Then
							aMessage = "Since you indicated that your research involves Animal Subjects, you need to indicate if your " + GetLabel("Organization") + " is accredited."
							aResultCode = 3
						ElseIf aIsAccredited <> "" Then
							aMessage = "You have indicated if your " + GetLabel("Organization") + " is accredited by AAALAC."
							aResultCode = 1
						End If
					ElseIf aIsAnimalSubjects = "True" And aIsAccredited = "" Then
						aMessage = "You have indicated if your research involves Animal Subjects, so you must indicate if your " + GetLabel("Organization") + " is accredited."
						aResultCode = 3
					End If
				'end if	
			End If
		 End If




		aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, aResultCode)
		If Not aResultEl Is Nothing Then
			cXMLDoc.SetValidationResultMessage(aResultEl, aMessage)
		End If
		Return aResultCode
	End Function
'-------------------------------------------------------------
	Public Function ValidateCurrentAssurance(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		Dim aKeywordList As cDataObjectList
		Dim aResultCode As Integer
		Dim aMessage As String
		Dim aResultEl As XmlElement
		Dim aGranteeProjectInfoDO As cDataObject
		Dim aIsOtherSupport As Integer
		Dim aIsAnimalSubject As Integer
		Dim aGranteeProjectWHCF As cDataObject

		Dim aHasCurrentAssurance As String
		Dim aIDNumber As String
		Dim aIsAnimalSubjects As String
		aGranteeProjectInfoDO = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.GranteeProjectInfo")
		'aGranteeProjectWHCF = aGranteeProjectDO.GetRelatedPropertyDataObject("GranteeProjectWHCF")

		If Not aGranteeProjectInfoDO Is Nothing Then
			aIsAnimalSubjects = aGranteeProjectInfoDO.GetPropertyString("IsAnimalSubjects")
			aHasCurrentAssurance = aGranteeProjectInfoDO.GetPropertyString("HasCurrentAssurance")
			aIDNumber = aGranteeProjectInfoDO.GetPropertyString("IDNumber")
			If aHasCurrentAssurance = "" And aIsAnimalSubjects = "True" Then
				aMessage = "You must indicate if your " + GetLabel("Organization") + " has a current PHS Animal Welfare Assurance."
				aResultCode = 3
			Else
				'if aIsAnimalSubjects = "False"
				'	aResultCode = 1
				'	aMessage = "You have indicated if your research involves Animal Subjects."
				'else
					If aGranteeProjectInfoDO.GetPropertyString("HasCurrentAssurance") <> "" Then
						If aHasCurrentAssurance = "True" Then
							If aIDNumber <> "" Then
								aMessage = "You have indicated if your " + GetLabel("Organization") + " has a current PHS Animal Welfare Assurance and ID Number."
								aResultCode = 1
							Else
								aMessage = "Since you have indicated your " + GetLabel("Organization") + " has a current PHS Animal Welfare Assurance, please indicate the ID Number."
								aResultCode = 3
							End If
						ElseIf aIsAnimalSubjects = "True" And aHasCurrentAssurance = "" Then
							aMessage = "Since you indicated that your research involves Animal Subjects, you need to indicate if your " + GetLabel("Organization") + " has a current PHS Animal Welfare Assurance."
							aResultCode = 3
						ElseIf aHasCurrentAssurance <> "" Then
							aMessage = "You have indicated if your institution has a current PHS Animal Welfare Assurance."
							aResultCode = 1
						End If
					ElseIf aIsAnimalSubjects = "True" And aHasCurrentAssurance = "" Then
						aMessage = "You have indicated if your research involves Animal Subjects, so you must indicate if your " + GetLabel("Organization") + " has a current PHS Animal Welfare Assurance."
						aResultCode = 3
					End If
				'end if	
			End If
		 End If




		aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, aResultCode)
		If Not aResultEl Is Nothing Then
			cXMLDoc.SetValidationResultMessage(aResultEl, aMessage)
		End If
		Return aResultCode
	End Function
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
'=============================================================
	Public Function ValidatePercent(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aBudget As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget")
			Dim aBudgetItem As cDataObject

			Select Case cXMLDoc.AttributeToInt(aValidationItemNode, "Year")
				Case 2
					aBudgetItem = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod2.BudgetItem107")
				Case 3
					aBudgetItem = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod3.BudgetItem107")
				Case 4
					aBudgetItem = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod4.BudgetItem107")
				Case 5
					aBudgetItem = aWfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject.Budget.BudgetPeriod5.BudgetItem107")

			End Select

			If Not aBudget Is Nothing And Not aBudgetItem Is Nothing Then
				If aBudget.GetPropertyDouble("Total") * 0.1 < aBudgetItem.GetPropertyDouble("Amount") Then
					Return 3
				Else
					Return 1
				End If
			End If
		End Function
'=============================================================
	Public Function ValidateInvestigator(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonRelationship", _
				"GranteeProjectID", aWfTaskAssignment.GetPropertyString("GranteeProjectID"), "RelatedPersonRoleID", "105")

			If aList.Count > 0 Then
				Dim aWFTAList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
					"PersonID", aList(0).GetPropertyString("RelatedPersonID"), "GranteeProjectID", _
					aList(0).GetPropertyString("GranteeProjectID"), "WfTaskID", "13")

				If aWFTAList.Count > 0 Then
					If aWFTAList(0).GetPropertyInt("WfTaskStatusID") = 2 Then
						Return 1
					Else
						Return 3
					End If
				Else
					Return 3
				End If
			Else
				Return 1
			End If
		End Function
'=============================================================
	Public Function ValidateOtherSupport(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProject", _
				"GranteeProjectID", aWfTaskAssignment.GetPropertyString("GranteeProjectID"), "NoOtherSupport", "True")
			Dim aSupportList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectOtherSupport", _
				"GranteeProjectID", aWfTaskAssignment.GetPropertyString("GranteeProjectID"))

			If aList.Count = 0 And aSupportList.Count = 0 Then
				Return 3
			ElseIf aList.Count > 0 And aSupportList.Count > 0 Then
				Dim aMessage As String = "You have checked the box to indicate you do not have any Other Support to report and you have also added Other Support records.  You may either check the box or add records, but not both."
				Dim aResultEl As XmlElement = cXMLDoc.GetResultElement(aValidationItemNode, 3)

				If Not aResultEl Is Nothing Then
					cXMLDoc.SetValidationResultMessage(aResultEl, aMessage)
				End If

				Return 3
			ElseIf aSupportList.Count > 0 Then
				aList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", _
					"EntityID", aSupportList(0).GetPropertyString("GranteeProjectOtherSupportID"), "FileTypeID", "31")

				If aList.Count = 0 Then Return 3
			End If

			Return 1
		End Function

	Public Function ValidatePeerReviewers(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim mNoOfMaxPeerReviewers As String = 0
			Dim mNoOfMinPeerReviewers As String = 0
			Dim aPersonRelationshipDOL As cDataObjectList
			mNoOfMaxPeerReviewers = cXMLDoc.AttributeToString(aValidationItemNode, "NoOfMaxPeerReviewers")
			mNoOfMinPeerReviewers = cXMLDoc.AttributeToString(aValidationItemNode, "NoOfMinPeerReviewers")

			aPersonRelationshipDOL = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonRelationship", "PersonID", aWfTaskAssignment.GetPropertyString("PersonID"), "TaskID", aWfTaskAssignment.GetPropertyString("WfTaskID"), "GranteeProjectID", aWfTaskAssignment.GetPropertyString("GranteeProjectID"))
			If aPersonRelationshipDOL.Count <= mNoOfMaxPeerReviewers And aPersonRelationshipDOL.Count >= mNoOfMinPeerReviewers Then
				Return 1
			Else
				Return 3
			End If
		End Function

	Public Function ValidateOutcomesandIndicators(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aGranteeProjectLogicFrameworkDOL As cDataObjectList

			aGranteeProjectLogicFrameworkDOL = WebSession.DataObjectFactory.GetDataObjectListWithFilter("vGranteeProjectLogicFramework", "GranteeProjectID", aWfTaskAssignment.GetPropertyString("GranteeProjectID"))
			If aGranteeProjectLogicFrameworkDOL.Count > 0 Then
			For Each aGranteeProjectLogicFrameworkDO As cDataObject In aGranteeProjectLogicFrameworkDOL
				If aGranteeProjectLogicFrameworkDO.GetPropertyString("OutcomeIndicatorcount") < 1 Or _
				   aGranteeProjectLogicFrameworkDO.GetPropertyString("ThreatIndicatorCount") < 1 Or _
				   aGranteeProjectLogicFrameworkDO.GetRelatedPropertyString("GranteeProjectLogicFramework.LongTermConservationOutcome") = "" Or _
					aGranteeProjectLogicFrameworkDO.GetRelatedPropertyString("GranteeProjectLogicFramework.ThreatsAndOpportunities") = "" Or _
					 aGranteeProjectLogicFrameworkDO.GetRelatedPropertyString("GranteeProjectLogicFramework.ProjectActivities") = "" _
					 Then
					Return 3
				End If
			Next
			Else
				Return 3
			End If
			Return 1
		End Function

		Public Function ValidateBudgetTotal(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aBudgetTypeID As String
			aBudgetTypeID = cXMLDoc.AttributeToString(aValidationItemNode, "BudgetTypeID", "1")
			Dim aBudgetLimit As Double = aWfTaskAssignment.GetRelatedPropertyDouble("GranteeProject.WfProject.TotalBudgetLimit")
			Dim aBudgetDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Budget", "BudgetTypeID", aBudgetTypeID, "GranteeProjectID", aWfTaskAssignment.GetPropertyString("GranteeProjectID"))
			Dim aBudgetDO As cDataObject
			Dim aGPBudgetTotal As Double
			Dim aResultCode As Integer
			Dim aAttribute As XmlAttribute
			Dim aResultEl As XmlNode
			For Each aBudgetDO In aBudgetDOL
				aGPBudgetTotal = aGPBudgetTotal + aBudgetDO.GetPropertyDouble("Total", 0.0)
			Next
			If aGPBudgetTotal > aBudgetLimit Then
				aResultCode = 3
			Else
				aResultCode = 1
			End If

			aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, aResultCode)
			If Not aResultEl Is Nothing Then
				aAttribute = aResultEl.Attributes("Message")
				If (Not aAttribute Is Nothing) Then
					aAttribute.Value = (aAttribute.Value.Replace("@BudgetLimit", Format(aBudgetLimit, "$##,##0.00")))
				End If
			End If

			Return aResultCode
		End Function

		Public Function ValidateIndirectCostRate(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aBudgetTypeID As String
			aBudgetTypeID = cXMLDoc.AttributeToString(aValidationItemNode, "BudgetTypeID", "1")
			Dim aFiltersNode As XmlNode = Nothing
			Dim aXmlDoc As cXMLDoc = Nothing
			Dim aDataObjectNode As XmlNode = Nothing
			Dim aBudgetLimit As Double = aWfTaskAssignment.GetRelatedPropertyDouble("GranteeProject.WfProject.TotalBudgetLimit")
			Dim aIndirectCostLimit As Double = aWfTaskAssignment.GetRelatedPropertyDouble("GranteeProject.WfProject.IndirectCostLimit")
			Dim aTotalIndirectCostLimit As Double = (aBudgetLimit * aIndirectCostLimit) / 100
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("GranteeProjectBudgetItemAmount", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "BudgetTypeID", aBudgetTypeID))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "IsIndirectCost", "True"))
			Dim aGranteeProjectBudgetItemAmountDOL As cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("GranteeProject.GranteeProjectBudgetItemAmount", aFiltersNode)
			Dim aGranteeProjectBudgetItemAmountDO As cDataObject
			Dim aIndirectCostTotal As Double
			For Each aGranteeProjectBudgetItemAmountDO In aGranteeProjectBudgetItemAmountDOL
				aIndirectCostTotal = aIndirectCostTotal + aGranteeProjectBudgetItemAmountDO.GetPropertyDouble("Amount")
			Next
			If aIndirectCostTotal > aTotalIndirectCostLimit Then
				Return 3
			Else
				Return 1
			End If
		End Function


	' *******************************************************************************************************
	' ******************* The Following are the LOI Folder Validation Methods ***********************
	' *******************************************************************************************************

	Public Function ValidateProjectDemographics(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			'Gender - DemographicFemale,DemographicMale,NotApplicableGender
			If (aWfTaskAssignment.GetRelatedPropertyDataObjectList("GranteeProject.GranteeProjGenders").Count = 0) Then
				Return 3
			End If

			'Race/Ethnicity - DemographicAmericaIndian,DemographicAsian,DemographicBlack,DemographicLatin,DemographicMiddleEastern,DemographicWhite,DemographicOther,NotApplicableRace
			If (aWfTaskAssignment.GetRelatedPropertyDataObjectList("GranteeProject.GranteeProjRace").Count = 0) Then
				Return 3
			End If

			'Income - DemographicLowIncome,DemographicWorkingPoor,DemographicMiddleIncome,DemographicUpperIncome, NotApplicableIncome
			If (aWfTaskAssignment.GetRelatedPropertyDataObjectList("GranteeProject.GranteeProjIncome").Count = 0) Then
				Return 3
			End If

			'Locale - DemographicRural, DemographicSuburban, DemographicUrban, NotApplicableLocale
			If (aWfTaskAssignment.GetRelatedPropertyDataObjectList("GranteeProject.GranteeProjLocale").Count = 0) Then
				Return 3
			End If

			Return 1

		End Function

	' *******************************************************************************************************
	' ******************* The Following are the Thirparty Folder Validation Methods ***********************
	' *******************************************************************************************************

	Public Function ValidateUpload(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement, ByVal aFileTypeID As String) As Integer
			Dim aFilesList As cDataObjectList
			Dim aFileObj As cDataObject
			Dim aStatus As Integer = System.Int32.MinValue
			Dim aResultCode As Integer
			Dim aMessage As String
			Dim aResultEl As XmlElement
			Dim aFileTypeText As String

			aFileTypeText = WebSession.DataObjectFactory.GetDataObjectListWithFilter("FileType", "FileTypeID", aFileTypeID)(0).GetPropertyString("Description")
			'If aFileTypeID <> "26" Then
			'    aFileTypeText = aFileTypeText & " justification"
			'End If
			aFilesList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", "EntityID", aWfTaskAssignment.GetPropertyString("WfTaskAssignmentID"))
			If aFilesList.Count > 0 Then
				For Each aFileObj In aFilesList
					If aFileObj.GetPropertyInt("FileTypeID") = aFileTypeID Then
						aStatus = aFileObj.GetPropertyInt("ConversionStatus", 0)
						Exit For
					End If
				Next
			Else
				aStatus = 3
			End If
			Select Case aStatus
				Case System.Int32.MinValue
					aResultCode = 3
					aMessage = "You have not uploaded the " & aFileTypeText & " file."
				Case Is >= 0
					aResultCode = 3
					aMessage = "The " & aFileTypeText & " file is in the queue waiting to be processed by the system."
				'Case Is > 0
				'    aResultCode = 3
				'    aMessage = "Your " & aFileTypeText & " upload has not been converted. Please re-upload your file."
				Case -2, -3	 'File not converted - -2: not valid, -3: exception caught
					aResultCode = 3
					aMessage = "There was an error while the system processed the " & aFileTypeText & " file.  Please go the Document Uploads page and click the View button below the specific upload to view any error messages."
				Case -1
					aResultCode = 1
					aMessage = "You have provided the " & aFileTypeText & " file."
			End Select

			aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, aResultCode)
			If Not aResultEl Is Nothing Then
				cXMLDoc.SetValidationResultMessage(aResultEl, aMessage)
			End If
			Return aResultCode
		End Function

End Class
End Namespace