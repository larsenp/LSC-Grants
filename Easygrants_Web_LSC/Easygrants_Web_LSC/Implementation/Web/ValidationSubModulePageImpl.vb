Imports System.Text
Imports System.Xml
Imports Core.Web.Navigation
Imports Core.Web.User
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Web.User
Imports EasyGrants.Workflow
Imports Core.Web.Modules
Imports Implementation.Web

Namespace Implementation.Web
Public Class cValidationSubModulePageImpl
	Inherits cValidationSubModulePage

	'Application Module
	Public Function ValidateSubGrants(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aResultCode As Integer
			Dim aResultEl As XmlElement
			Dim aLSCGranteeProjectInfoList As cDataObjectList
			Dim aAllocatedBySubgrants As Boolean
			Dim aNumberOfSubgrants As Integer

			Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			aLSCGranteeProjectInfoList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscGranteeProjectInfo", "GranteeProjectID", aUser.GranteeProjectID)

			If aLSCGranteeProjectInfoList.Count > 0 Then

				aAllocatedBySubgrants = aLSCGranteeProjectInfoList(0).GetPropertyBool("AllocatedBySubgrants", False)
				aNumberOfSubgrants = aLSCGranteeProjectInfoList(0).GetPropertyInt("NumberOfSubgrants", 0)

				If aAllocatedBySubgrants = False Then
					aResultCode = 1
				ElseIf aNumberOfSubgrants = 0 Then
					aResultCode = 3
				Else
					aResultCode = 1
				End If

			End If

			Return aResultCode
		End Function

		Public Function ValidateSubGrants_LOI(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aResultCode As Integer
			Dim aLSCGranteeProjectInfoList As cDataObjectList
			Dim aAllocatedBySubgrants As Boolean
			Dim aNumberOfSubgrants As Integer

			Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			aLSCGranteeProjectInfoList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscGranteeProjectInfo", "GranteeProjectID", aUser.GranteeProjectID)

			If aLSCGranteeProjectInfoList.Count > 0 Then
				If aLSCGranteeProjectInfoList(0).GetPropertyValue("AllocatedBySubgrants") Is System.DBNull.Value Then
					aResultCode = 1	'If there is no answer to the subgrants question, a different validation item with a more appropriate message will be triggered.
				Else
					aAllocatedBySubgrants = aLSCGranteeProjectInfoList(0).GetPropertyBool("AllocatedBySubgrants", False)
					aNumberOfSubgrants = aLSCGranteeProjectInfoList(0).GetPropertyInt("NumberOfSubgrants", 0)

					If aAllocatedBySubgrants = False Then
						aResultCode = 1
					ElseIf aNumberOfSubgrants = 0 Then
						aResultCode = 3
					Else
						aResultCode = 1
					End If
				End If
			Else
				aResultCode = 31 'If there is no answer to the subgrants question, a different validation item with a more appropriate message will be triggered.
			End If

			Return aResultCode
		End Function

		Public Function ValidateBoardMembers(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aResultCode As Integer
			Dim aNewApplicantNoBoard As Boolean = False

			Dim aBoardInfoSourceID As Integer = aWfTaskAssignment.GetRelatedPropertyInt("WfTask.LscWfTask.LscBoardInfoSourceID")
			Dim aStructList As cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("LscBoardStructure")
			If aStructList.Count > 0 Then
				aNewApplicantNoBoard = aStructList(0).GetPropertyBool("NewApplicantNoBoard", False)
			End If

			Dim aBoardMembersList As cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("LscWftaBoardMemberAffiliations")
			If aNewApplicantNoBoard Xor aBoardMembersList.Count > 0 Then
				aResultCode = 1
			Else
				aResultCode = 3
				Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
				If aNewApplicantNoBoard And aBoardMembersList.Count > 0 Then
					aResultEl.Attributes("Message").Value = aResultEl.Attributes("CheckBoxAndBoardMemberMessage").Value
				Else
					aResultEl.Attributes("Message").Value = aResultEl.Attributes("NoInfoMessage").Value
				End If
			End If
			Return aResultCode
		End Function

		Public Function ValidateBoardChair(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aResultCode As Integer = 1
			Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
			Dim aMessage As String = ""

			'Dim aCwosy As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("vLSCCompWftaOrgServareaYear")
			'Dim aOrgID As Integer = aCwosy.GetPropertyInt("OrganizationID")
			'Dim aTimePeriodID As Integer = aCwosy.GetPropertyInt("TimePeriodID")
			'Dim aSourceID As Integer = aWfTaskAssignment.GetRelatedPropertyInt("WfTask.LscWfTask.LscBoardInfoSourceID")
			'Dim aLscBoardStructureList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscBoardStructure", _
			'			"OrganizationID", aOrgID.ToString(), _
			'			"TimePeriodID", aTimePeriodID.ToString(), _
			'			"LscBoardInfoSourceID", aSourceID)
			Dim aLscBoardStructureList As cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("LscBoardStructure")
			Dim aLscBoardStructure As cDataObject
			If aLscBoardStructureList.Count = 0 Then
				aResultEl.Attributes("Message").Value = cXMLDoc.AttributeToString(aResultEl, "NoBoardChairMessage")
				Return 3
			Else
				aLscBoardStructure = aLscBoardStructureList(0)
			End If
			Dim aNewApplicantNoBoard As Boolean = aLscBoardStructure.GetPropertyBool("NewApplicantNoBoard", False)
			If Not aNewApplicantNoBoard Then
				If aLscBoardStructure.GetPropertyValue("BoardChairContactID") Is System.DBNull.Value Then
					aResultCode = 3
					aMessage = cXMLDoc.AttributeToString(aResultEl, "NoBoardChairMessage")
				End If
				If aLscBoardStructure.GetRelatedPropertyString("BoardChairContact.Email") = "" Then
					aResultCode = 3
					If aMessage <> "" Then
						aMessage += "<br>"
					End If
					aMessage += cXMLDoc.AttributeToString(aResultEl, "NoEmailMessage")
				End If
				If aLscBoardStructure.GetRelatedPropertyString("BoardChairContact.Phone") = "" Then
					aResultCode = 3
					If aMessage <> "" Then
						aMessage += "<br>"
					End If
					aMessage += cXMLDoc.AttributeToString(aResultEl, "NoPhoneMessage")
				End If
			End If
			aResultEl.Attributes("Message").Value = aMessage
			Return aResultCode
		End Function


		Public Function ValidateBooleanAddlInfo(ByVal aWfTaskAssignment As cWfTaskAssignment, _
				ByVal aDOProperty As String, ByVal aBoolProperty As String, ByVal aInfoProperty As String) As Integer

			'Validates a pair of linked items, one of which is a boolean, the other of which is a field which must be populated
			'if the boolean value is True and empty if the boolean value is False.
			'The two items are assumed to be properties of the same data object.
			Dim aDO As cDataObject
			If aDOProperty = "" Then
				aDO = aWfTaskAssignment
			Else
				aDO = aWfTaskAssignment.GetRelatedPropertyDataObject(aDOProperty)
				If aDO Is Nothing Then Return 3
			End If

			If aDO(aBoolProperty) Is System.DBNull.Value Then Return 3
			Dim aBool As Boolean = aDO.GetPropertyBool(aBoolProperty)
			Dim aInfo As String = aDO.GetPropertyString(aInfoProperty, "")
			If aBool Xor aInfo <> "" Then Return 3

		End Function

		Public Function ValidateRemoteAccess(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aLSQDO As cDataObject
			Dim aRASW As Boolean
			Dim aRASWList As cDataObjectList

			aLSQDO = aWfTaskAssignment.GetRelatedPropertyDataObject("LscSoftwareQuestion")
			If aLSQDO Is Nothing Then
				Return 3
			End If
			If aLSQDO("RemoteAccessPortion") Is System.DBNull.Value Then
				Return 3
			End If
			aRASW = aLSQDO.GetPropertyBool("RemoteAccessPortion")
			aRASWList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("RemoteAccessSoftware")
			If aRASW Xor aRASWList.Count > 0 Then
				Return 3
			End If
			Return 1
		End Function

		Public Function ValidateWebConfSW(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aLSQDO As cDataObject
			Dim aWCSW As Boolean
			Dim aWCSWList As cDataObjectList
			Dim aWCSWDO As cDataObject
			Dim aMessageAttr As XmlAttribute = aValidationItemNode.SelectSingleNode("Results/Result/@Message")
			Dim aNoProductMessageAttr As XmlAttribute = aValidationItemNode.SelectSingleNode("Results/Result/@NoProductMessage")
			Dim aOtherMessageAttr As XmlAttribute = aValidationItemNode.SelectSingleNode("Results/Result/@OtherMessage")
			Dim aNoWebConfMessageAttr As XmlAttribute = aValidationItemNode.SelectSingleNode("Results/Result/@NoWebConfMessage")

			aLSQDO = aWfTaskAssignment.GetRelatedPropertyDataObject("LscSoftwareQuestion")
			If aLSQDO Is Nothing Then
				Return 1
			End If
			aWCSW = aLSQDO.GetPropertyBool("WebConfSW", False)
			aWCSWList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("WebConferenceSoftware")
			If aWCSW And aWCSWList.Count = 0 Then
				aMessageAttr.Value = aNoProductMessageAttr.Value
				Return 3
			End If

			If aWCSW = False And aWCSWList.Count > 0 Then
				aMessageAttr.Value = aNoWebConfMessageAttr.Value
				Return 3
			End If

			For Each aWCSWDO In aWCSWList
				If aWCSWDO.GetRelatedPropertyString("LscSoftwareProduct.Description") = "Other" Then
					If aLSQDO.GetPropertyString("WebConfSWDesc", "") = "" Then
						aMessageAttr.Value = aOtherMessageAttr.Value
						Return 3
					Else
						Return 1
					End If
				End If
			Next
			Return 1
		End Function

		Public Function ValidateHotDocs(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateBooleanAddlInfo(aWfTaskAssignment, "LscSoftwareQuestion", "HotDocsUse", "HotDocsUseDescription")
		End Function

		Public Function ValidateFinancialContributions(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateBooleanAddlInfo(aWfTaskAssignment, "LscSoftwareQuestion", "SWWSFinancialContribution", "SWWSFinancialContributionAmount")
		End Function

		Public Function ValidateSWWSContent(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateBooleanAddlInfo(aWfTaskAssignment, "LscSoftwareQuestion", "SWWSContentContribution", "SWWSContentDescription")
		End Function

		Public Function ValidateSWWSOutreach(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateBooleanAddlInfo(aWfTaskAssignment, "LscSoftwareQuestion", "SWWSOutreach", "SWWSOutreachDescription")
		End Function

		Public Function ValidateProgramWebSite(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aLSQDO As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscSoftwareQuestion")

			If aLSQDO Is Nothing Then Return 3

			If aLSQDO("ProgramWebSite") Is System.DBNull.Value Then Return 3

			Dim aProgramWebSite As Boolean = aLSQDO.GetPropertyBool("ProgramWebSite")

			If aProgramWebSite Then
				If aLSQDO.GetPropertyString("PWSURL", "") = "" Or aLSQDO("PWSLSCFunded") Is System.DBNull.Value Then
					Return 3
				Else
					Return 1
				End If
			Else
				If aLSQDO.GetPropertyString("PWSURL", "") = "" And aLSQDO("PWSLSCFunded") Is System.DBNull.Value Then
					Return 1
				ElseIf aLSQDO.GetPropertyString("PWSURL", "") = "" And aLSQDO.GetPropertyBool("PWSLSCFunded", True) = False Then
					Return 1
				Else
					Return 3
				End If
			End If
		End Function

		Public Function ValidateLegalMeetings(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateBooleanAddlInfo(aWfTaskAssignment, "LscSoftwareQuestion", "ProgramLegalMeetingsHost", "ProgramLegalMeetingsUsage")
		End Function

		Public Function ValidateOA2FurtherReview(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aDO As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscOA2")
			If aDO Is Nothing Then Return 3
			If aDO.GetPropertyString("Part2Comment", "") = "" Xor aDO.GetPropertyBool("NoFurtherReview", False) Then Return 3
			Return 1
		End Function

		Public Function ValidateOA2Rationale(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aDO As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscOA2")
			If aDO Is Nothing Then Return 3
			If aDO.GetPropertyString("Part3Comment", "") = "" Xor aDO.GetPropertyBool("FundAll", False) Then Return 3
			Return 1
		End Function

		Public Function ValidateGTCGrantConditions_ApplReview(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aCheck As Boolean
			Dim aDO As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscOA2")
			If aDO Is Nothing Then
				aCheck = False
			Else
				aCheck = aDO.GetPropertyBool("NoGrantConditions", False)
			End If
			Dim aReviewedWfTAList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
					"GranteeProjectID", aWfTaskAssignment.GetPropertyString("GranteeProjectID"), _
					"WfTaskID", "2")
			If aReviewedWfTAList.Count = 0 Then Return 3
			If aCheck Xor aReviewedWfTAList(0).GetRelatedPropertyDataObjectList("LscGrantConditions").Count = 0 Then Return 3
			Return 1
		End Function


		Public Function ValidateGTCGrantConditions(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aCheck As Boolean
			Dim aDO As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscRenewalRec")
			If aDO Is Nothing Then
				aCheck = False
			Else
				aCheck = aDO.GetPropertyBool("NoGrantConditions", False)
			End If
			Dim aYear As String = aWfTaskAssignment.GetRelatedPropertyString("GranteeProject.WfProject.TimePeriod.SortOrder")
			Dim aReviewedWfTAList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
					"GranteeProjectID", aWfTaskAssignment.GetPropertyString("GranteeProjectID"), _
					"WfTaskID", "4")
			If aReviewedWfTAList.Count = 0 Then Return 3

			Dim aAwardTerm As Integer = 0
			Dim aWfTA As cDataObject
			Dim aReviewedWfTA As cDataObject
			For Each aWfTA In aReviewedWfTAList
				If aWfTA.GetPropertyInt("AwardTermID") > aAwardTerm Then
					aReviewedWfTA = aWfTA
					aAwardTerm = aWfTA.GetPropertyInt("AwardTermID")
				End If
			Next
			If aCheck Xor aReviewedWfTA.GetRelatedPropertyDataObjectList("LscGrantConditions").Count = 0 Then Return 3
			Return 1
		End Function

		Public Function ValidateTitle3_4(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aResultCode As Integer = 1
			Dim aResultEl As XmlElement
			Dim aLSCCsrQuestionList As cDataObjectList
			Dim aLSCGranteeProjectInfoList As cDataObjectList

			Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			aLSCCsrQuestionList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscCsrQuestion", "WfTaskAssignmentID", aUser.WfTaskAssignmentID)

			If aLSCCsrQuestionList.Count > 0 Then
				Dim aTitle3_4 As Boolean = aLSCCsrQuestionList(0).GetPropertyBool("FullyFund", False)
                'Dim aCount As Integer = aLSCCsrQuestionList(0).GetPropertyInt("Pct", 0)
                'If aTitle3_4 Xor aCount > 0 Then aResultCode = 3

                If aTitle3_4 = True And aLSCCsrQuestionList(0).GetPropertyValue("Pct") Is System.DBNull.Value Then
                    aResultCode = 3
                ElseIf aTitle3_4 = False And aLSCCsrQuestionList(0).GetPropertyValue("Pct") IsNot System.DBNull.Value Then
                    aResultCode = 3
                End If
            End If

            Return aResultCode
		End Function

		Public Function ValidateActualPAICaseCount(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aTimePeriodID As Integer = aWfTaskAssignment.GetRelatedPropertyInt("WfTACompetitionYear.TimePeriodID")
			'Get task assignment for G-3d
			Dim aGranteeProjectID As Integer = aWfTaskAssignment.GetPropertyInt("GranteeProjectID")
			Dim aG3dWfTAList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "GranteeProjectID", aGranteeProjectID.ToString, _
							"WfTaskID", "11", _
							"WfTACompetitionYear.TimePeriodID", aTimePeriodID.ToString)
			If aG3dWfTAList.Count = 0 Then
				Return 3
			End If
			Dim aG3dWfTA As cWfTaskAssignment = aG3dWfTAList(0)
			If aG3dWfTA.GetPropertyInt("WfTaskStatusID") <> 2 Then
				Return 3
			End If
			Dim aCSRCount As Integer = aG3dWfTA.GetRelatedPropertyInt("LscCsrByWfTA.Total")
			Dim aComponentsCount As Integer = aWfTaskAssignment.GetRelatedPropertyInt("LscPaiCase.LscPaiCaseTotal.CCTotal")
			If aCSRCount = aComponentsCount Then
				Return 1
			Else
				Dim aMessageAttr As XmlAttribute = aValidationItemNode.SelectSingleNode("Results/Result/@Message")
				aMessageAttr.Value = "The total number of cases reported for this form (" + aComponentsCount.ToString + _
							") must match the total number of cases reported for Form G-3(d) (" + aCSRCount.ToString + ")."
				Return 3
			End If

		End Function

		Public Function ValidateOtherServicesTotals(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement, ByVal aProperty1 As String, ByVal aProperty2 As String) As Integer
			Dim aOthServList As cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("LscOtherServices")
			If aOthServList.Count = 0 Then
				Return 1
			End If
			Dim aOthServTotalsDO As cDataObject = aOthServList(0).GetRelatedPropertyDataObject("LscOtherServicesTotals")
			If aOthServTotalsDO.GetPropertyInt(aProperty1) = aOthServTotalsDO.GetPropertyInt(aProperty2) Then
				Return 1
			Else
				Return 3
			End If

		End Function

		Public Function ValidateCLETotals(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateOtherServicesTotals(aWfTaskAssignment, aValidationItemNode, "IATotal", "IBTotal")
		End Function

		Public Function ValidateProSeTotals(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateOtherServicesTotals(aWfTaskAssignment, aValidationItemNode, "IIATotal", "IIBTotal")
		End Function

		Public Function ValidateROSTotals(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateOtherServicesTotals(aWfTaskAssignment, aValidationItemNode, "IIIATotal", "IIIBTotal")
		End Function

		Public Function ValidateMiscTotals(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateOtherServicesTotals(aWfTaskAssignment, aValidationItemNode, "VIATotal", "VIBTotal")
		End Function

		Public Function ValidateCSRTotalCases(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement, ByVal aMaxCases As String) As Integer
			'This function does a simple numeric comparison which XML validation should be capable of handling. However, I was unable to make it 
			'happen, so I created the method instead. Peter Larsen 1/2/2009
			Dim aTotal As Integer = aWfTaskAssignment.GetRelatedPropertyInt("LscCsrByWfTA.Total", -1)
			Dim aMaxCasesInt As Integer = Int32.Parse(aMaxCases)
			If aTotal > aMaxCases Then
				Return 3
			Else
				Return 1
			End If
		End Function

		Public Function ValidateG3_G4CaseCount(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aG3CaseCount As Integer = 0
			Dim aG3dCaseCount As Integer = 0
			Dim aG3TotalCaseCount As Integer
			Dim aGranteeProjectID As Integer = aWfTaskAssignment.GetPropertyInt("GranteeProjectID")
			Dim aTimePeriodID As Integer = aWfTaskAssignment.GetRelatedPropertyInt("WfTACompetitionYear.TimePeriodID")

			'Get case total for G-3 (staff)
			Dim aG3WfTAList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "GranteeProjectID", aGranteeProjectID.ToString, _
						"WfTaskID", "10", _
						"WfTACompetitionYear.TimePeriodID", aTimePeriodID.ToString)
			If aG3WfTAList.Count = 0 Then
				aG3CaseCount = 0
			Else
				aG3CaseCount = aG3WfTAList(0).GetRelatedPropertyInt("LscCsrByWfTA.Total")
			End If

			'Get case total for G-3(d) (PAI)
			Dim aG3dWfTAList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "GranteeProjectID", aGranteeProjectID.ToString, _
						"WfTaskID", "11", _
						"WfTACompetitionYear.TimePeriodID", aTimePeriodID.ToString)
			If aG3dWfTAList.Count = 0 Then
				aG3dCaseCount = 0
			Else
				aG3dCaseCount = aG3dWfTAList(0).GetRelatedPropertyInt("LscCsrByWfTA.Total")
			End If
			aG3TotalCaseCount = aG3CaseCount + aG3dCaseCount

			Dim aG4CaseCount As Integer = aWfTaskAssignment.GetRelatedPropertyInt("LscClientRaceGen.LscClientRace.GrandTotal")

			If ApproxEqual(aG3TotalCaseCount, aG4CaseCount) Then Return 1

			Return 3
		End Function

		Protected Function ApproxEqual(ByVal aValue1 As Integer, ByVal aValue2 As Integer) As Boolean
			'This method implements required laid out by John Meyer for certain case count comparisons. To be considered 
			'approximately equal, two numbers must differ by no more than 10 or by no more than 5 percent.

            If Math.Abs(aValue1 - aValue2) <= 20 Then
                Return True
            End If

			'If either value is zero, we will either get an error or a ratio of zero, so we must return false.
			If aValue1 = 0 Or aValue2 = 0 Then Return False

            If aValue1 / aValue2 >= 0.99 And aValue1 / aValue2 <= 1.01 Then
                Return True
            End If

			Return False
		End Function

		Public Function ValidateG4CaseCounts(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aLscClientRaceGenDO As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscClientRaceGen")
			Dim aGenderTotal As Integer
			Dim aAgeEthTotal As Integer
			If aLscClientRaceGenDO Is Nothing Then
				aGenderTotal = 0
				aAgeEthTotal = 0
			Else
				aGenderTotal = aLscClientRaceGenDO.GetPropertyInt("Men", 0) + aLscClientRaceGenDO.GetPropertyInt("Women", 0) + aLscClientRaceGenDO.GetPropertyInt("Other", 0) + aLscClientRaceGenDO.GetPropertyInt("Groups", 0)
				aAgeEthTotal = aLscClientRaceGenDO.GetRelatedPropertyInt("LscClientRace.GrandTotal")
			End If
			If ApproxEqual(aGenderTotal, aAgeEthTotal) Then Return 1
			Return 3
		End Function

		Public Function ValidateMilestoneReport(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aMilestones As cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("PaymentContingencyTask.Payment.LscMilestones")
			Dim aMilestone As cDataObject
			Dim aResult As StringBuilder = New StringBuilder()
			For Each aMilestone In aMilestones
				If aMilestone.GetPropertyString("Report") = "" Then
					aResult.Append("You must provide a report for milestone " + aMilestone.GetPropertyString("MilestoneNumber") + "<br/>")
				End If
			Next
			If aResult.ToString = "" Then
				Return 1
			Else
				Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
				aResultEl.Attributes("Message").Value = aResult.ToString()
				Return 3
			End If
        End Function

        

        Public Function ValidateRFPLegalWorkMngt(ByVal aWfTaskAssignment As cWfTaskAssignment, ByVal aDOProperty As String, ByVal aIntProperty As String, ByVal aStringProperty As String) As Integer

            Dim aDO As cDataObject

            If aDOProperty = "" Then
                aDO = aWfTaskAssignment
            Else
                aDO = aWfTaskAssignment.GetRelatedPropertyDataObject(aDOProperty)
                If aDO Is Nothing Then Return 3
            End If

            If aDO(aIntProperty) Is System.DBNull.Value Then Return 3
            Dim aMethod As Integer = aDO.GetPropertyInt(aIntProperty)
            Dim aMethodDetail As String = aDO.GetPropertyString(aStringProperty, "")

            If aMethod = 5 And aMethodDetail = "" Then
                Return 3
            Else
                Return 1
            End If

        End Function

        Public Function ValidateRFPWorkMngtMethod1(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Return ValidateRFPLegalWorkMngt(aWfTaskAssignment, "LSCRFPWORKMGT", "Method1", "Method1TP")
        End Function

        Public Function ValidateRFPWorkMngtMethod2(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Return ValidateRFPLegalWorkMngt(aWfTaskAssignment, "LSCRFPWORKMGT", "Method2", "Method2TP")
        End Function

        Public Function ValidateRFPWorkMngtMethod3(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Return ValidateRFPLegalWorkMngt(aWfTaskAssignment, "LSCRFPWORKMGT", "Method3", "Method3TP")
        End Function

        Public Function ValidateRFPWorkMngtMethod4(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Return ValidateRFPLegalWorkMngt(aWfTaskAssignment, "LSCRFPWORKMGT", "Method4", "Method4TP")
        End Function

        Public Function ValidateRFPWorkMngtMethod5(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Return ValidateRFPLegalWorkMngt(aWfTaskAssignment, "LSCRFPWORKMGT", "Method5", "Method5TP")
        End Function

        Public Function ValidateRFPWorkMngtMethod6(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Return ValidateRFPLegalWorkMngt(aWfTaskAssignment, "LSCRFPWORKMGT", "Method6", "Method6TP")
        End Function

        Public Function ValidateRFPWorkMngtMethod7(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Return ValidateRFPLegalWorkMngt(aWfTaskAssignment, "LSCRFPWORKMGT", "Method7", "Method7TP")
        End Function

        Public Function ValidateRFPWorkMngtMethod8(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Return ValidateRFPLegalWorkMngt(aWfTaskAssignment, "LSCRFPWORKMGT", "Method8", "Method8TP")
        End Function

        Public Function ValidateRFPWorkMngtMethod9(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Return ValidateRFPLegalWorkMngt(aWfTaskAssignment, "LSCRFPWORKMGT", "Method9", "Method9TP")
		End Function

		Public Function ValidateTIGAppSecondaryContact(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			If TIGAppSecondaryContactTypedIn(aWfTaskAssignment) And aWfTaskAssignment.GetRelatedPropertyInt("LscTigApp.SecondaryContactPersonID", 0) <> 0 Then
				Return 3
			Else
				Return 1
			End If
		End Function

		Protected Function TIGAppSecondaryContactTypedIn(ByVal aWfTaskAssignment As cWfTaskAssignment) As Boolean
			Dim aTigAppDO As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscTigApp")
			If aTigAppDO Is Nothing Then Return False
			If aTigAppDO.GetPropertyString("SecondaryContactFirstName", "") <> "" Then Return True
			If aTigAppDO.GetPropertyString("SecondaryContactMiddleName", "") <> "" Then Return True
			If aTigAppDO.GetPropertyString("SecondaryContactLastName", "") <> "" Then Return True
			If aTigAppDO.GetPropertyString("SecondaryContactAddress1", "") <> "" Then Return True
			If aTigAppDO.GetPropertyString("SecondaryContactAddress2", "") <> "" Then Return True
			If aTigAppDO.GetPropertyString("SecondaryContactCity", "") <> "" Then Return True
			If aTigAppDO.GetPropertyString("SecondaryContactStateProvinceID", "") <> "" Then Return True
			If aTigAppDO.GetPropertyString("SecondaryContactZip", "") <> "" Then Return True
			If aTigAppDO.GetPropertyString("SecondaryContactPhone", "") <> "" Then Return True
			If aTigAppDO.GetPropertyString("SecondaryContactFax", "") <> "" Then Return True
			If aTigAppDO.GetPropertyString("SecondaryContactEmail", "") <> "" Then Return True
			Return False
		End Function

		Public Function ValidateTIGAppSecondaryFirstName(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return TIGAppSecondaryContactFieldCompleted(aWfTaskAssignment, "SecondaryContactFirstName")
		End Function

		Public Function ValidateTIGAppSecondaryLastName(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return TIGAppSecondaryContactFieldCompleted(aWfTaskAssignment, "SecondaryContactLastName")
		End Function

		Public Function ValidateTIGAppSecondaryEmail(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return TIGAppSecondaryContactFieldCompleted(aWfTaskAssignment, "SecondaryContactEmail")
		End Function

		Protected Function TIGAppSecondaryContactFieldCompleted(ByVal aWfTaskAssignment As cWfTaskAssignment, ByVal aPropertyKey As String) As Integer
			Dim aTigAppDO As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscTigApp")
			If aTigAppDO Is Nothing Then Return 1
			If TIGAppSecondaryContactTypedIn(aWfTaskAssignment) And aTigAppDO.GetPropertyString(aPropertyKey) = "" Then
				Return 3
			End If
			Return 1
		End Function

		Public Function ValidateTIGProposedPaymentSchedule(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aRequestedAmount As Integer = aWfTaskAssignment.GetRelatedPropertyInt("LscTigApp.GrantRequest", 0)
			If aRequestedAmount = 0 Then Return 3
			Dim aPaymentTotal As Integer = aWfTaskAssignment.GetRelatedPropertyInt("LscTigProposedPaymentScheduleTotal.PaymentTotal", 0)
			If aPaymentTotal = 0 Then Return 3
			If aRequestedAmount <> aPaymentTotal Then Return 3
			Return 1
		End Function

		Public Function ValidateTIGBudgetTotals(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aBudgetID As Integer = aWfTaskAssignment.GetRelatedPropertyInt("LscTigBudget.LscTigBudgetID", 0)
			If aBudgetID = 0 Then Return 0

			Dim aReturnValue As Integer = 0
			Dim aMessage As String = ""
			Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")

			'Check project budget from application against total of all budget items
			Dim aProjectBudget As Integer = aWfTaskAssignment.GetRelatedPropertyInt("LscTigApp.ProjectBudget", 0)
			Dim aBudgetTotal As Integer = aWfTaskAssignment.GetRelatedPropertyInt("LscTigBudget.LscTigBudgetTotal.BudgetTotal", -1)
			If aProjectBudget <> aBudgetTotal Then
				aReturnValue = 3
				aMessage = cXMLDoc.AttributeToString(aResultEl, "BudgetTotalMessage")
			End If
			Dim aRequestedAmount As Integer = aWfTaskAssignment.GetRelatedPropertyInt("LscTigApp.GrantRequest", 0)
			Dim aBudgetFundingRequestList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscTigBudgetByFundingType", "LscTigBudgetID", aBudgetID.ToString(), "LscTigBudgetFundingTypeID", "1")
			If aBudgetFundingRequestList.Count > 0 Then
				If aBudgetFundingRequestList(0).GetPropertyInt("FundingTypeTotal") <> aRequestedAmount Then
					aReturnValue = 3
					If aMessage <> "" Then aMessage += "<br/>"
					aMessage += cXMLDoc.AttributeToString(aResultEl, "RequestAmountMessage")
				End If
			End If
			If aMessage <> "" Then
				aResultEl.Attributes("Message").Value = aMessage
			End If
			Return aReturnValue
		End Function

        Public Function ValidateRenewalNarrativeReviewComment(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Return ValidateBooleanAddlInfo(aWfTaskAssignment, "LscRenewalEval", "FormL", "CommentL")
		End Function

		Public Function ValidateSubgrantUploadNotes(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			'Check for "Yes" values in notes 1, 2, or 3
			Dim aBudget As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscSubrecipientBudget")
			If aBudget Is Nothing Then Return 1
			Dim aNotes As Boolean = aBudget.GetPropertyBool("Note1") Or aBudget.GetPropertyBool("Note2") Or aBudget.GetPropertyBool("Note3")
			If aNotes Then
				Dim aXMLDoc As cXMLDoc
				Dim aDONode As XmlNode
				Dim aFiltersNode As XmlNode
				Dim aArgNode As XmlNode
				Dim aRelatedNode As XmlNode
				Dim aFilesList As cDataObjectList
				'Check for upload of additional supporting documentation (UploadID = 21)
				aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SubmittedFile", aDONode, aFiltersNode)
				aRelatedNode = WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "TaskUploadType")
				aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "UploadId", "21")
				aArgNode.AppendChild(aRelatedNode)
				aFiltersNode.AppendChild(aArgNode)
				aFilesList = WebSession.DataObjectFactory.GetDataObjectList(aDONode)
				If aFilesList.Count = 0 Then Return 3
			Else
				Return 1
			End If
		End Function

		Public Function ValidateSubgrantRecentFundBalance(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aLscWfTASubgrant As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscWfTASubgrant")
			If aLscWfTASubgrant.GetPropertyInt("LscFundBalanceID", 0) = 4 Xor aLscWfTASubgrant.GetPropertyString("LscFundBalanceNotApplicable") = "" Then
				Return 1
			End If

			Dim aMessage As String
			Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
			If aLscWfTASubgrant.GetPropertyInt("LscFundBalanceID") = 4 Then
				aMessage = cXMLDoc.AttributeToString(aResultEl, "NoAnswerMessage")
			Else
				aMessage = cXMLDoc.AttributeToString(aResultEl, "NotNAMessage")
			End If
			aResultEl.Attributes("Message").Value = aMessage
			Return 3
		End Function

		Public Function ValidateSubgrantTypesOfServices(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aLscWfTASubgrant As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscWfTASubgrant")
			Dim aLscSubgrantServByTypeList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscSubgrantServByType", _
						"WfTaskAssignmentID", aWfTaskAssignment.GetPropertyString("WfTaskAssignmentID"), _
						"LscSubgrantServTypeID", "16")
			If aLscSubgrantServByTypeList.Count > 0 Xor aLscWfTASubgrant.GetPropertyString("OtherServices") = "" Then
				Return 1
			End If

			Dim aMessage As String
			Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
			If aLscSubgrantServByTypeList.Count > 0 Then
				aMessage = cXMLDoc.AttributeToString(aResultEl, "NoOtherServicesAnswerMessage")
			Else
				aMessage = cXMLDoc.AttributeToString(aResultEl, "RemoveOtherServicesAnswerMessage")
			End If
			aResultEl.Attributes("Message").Value = aMessage
			Return 3
		End Function

		Public Function ValidateSubgrantTargetedGroups(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aLscWfTASubgrant As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscWfTASubgrant")
			Dim aLscSubgrantTargetedGroupList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscSubgrantTargetedGroup", _
						"WfTaskAssignmentID", aWfTaskAssignment.GetPropertyString("WfTaskAssignmentID"), _
						"LscSubgrantTargetGroupID", "14")
			If aLscSubgrantTargetedGroupList.Count > 0 Xor aLscWfTASubgrant.GetPropertyString("OtherTargetedGroup") = "" Then
				Return 1
			End If

			Dim aMessage As String
			Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
			If aLscSubgrantTargetedGroupList.Count > 0 Then
				aMessage = cXMLDoc.AttributeToString(aResultEl, "NoOtherGroupsAnswerMessage")
			Else
				aMessage = cXMLDoc.AttributeToString(aResultEl, "RemoveOtherGroupsAnswerMessage")
			End If
			aResultEl.Attributes("Message").Value = aMessage
			Return 3
		End Function

		Public Function ValidateOtherDataSources(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateBooleanAddlInfo(aWfTaskAssignment, "LscAssessmentDataSources", "OtherSelection", "OtherText")
		End Function


		Public Function ValidateOtherDataCollectionMethods(ByVal aWfTaskAssignment As cWfTaskAssignment, ByVal aDOProperty As String, ByVal aIntProperty1 As String, ByVal aIntProperty2 As String, ByVal aIntProperty3 As String, ByVal aIntProperty4 As String, ByVal aIntProperty5 As String, ByVal aIntProperty6 As String, ByVal aIntProperty7 As String, ByVal aIntProperty8 As String, ByVal aIntProperty9 As String, ByVal aStringProperty As String) As Integer

			Dim aDO As cDataObject

			If aDOProperty = "" Then
				aDO = aWfTaskAssignment
			Else
				aDO = aWfTaskAssignment.GetRelatedPropertyDataObject(aDOProperty)
				If aDO Is Nothing Then Return 3
			End If

			'If aDO(aIntProperty1) Or aDO(aIntProperty2) Or aDO(aIntProperty3) Or aDO(aIntProperty4) Or aDO(aIntProperty5) Or aDO(aIntProperty6) Or aDO(aIntProperty7) Or (aIntProperty8) Or aDO(aIntProperty9) Is System.DBNull.Value Then Return 3
			If aDO(aIntProperty1) Is System.DBNull.Value Then Return 3
			If aDO(aIntProperty2) Is System.DBNull.Value Then Return 3
			If aDO(aIntProperty3) Is System.DBNull.Value Then Return 3
			If aDO(aIntProperty4) Is System.DBNull.Value Then Return 3
			If aDO(aIntProperty5) Is System.DBNull.Value Then Return 3
			If aDO(aIntProperty6) Is System.DBNull.Value Then Return 3
			If aDO(aIntProperty7) Is System.DBNull.Value Then Return 3
			If aDO(aIntProperty8) Is System.DBNull.Value Then Return 3
			If aDO(aIntProperty9) Is System.DBNull.Value Then Return 3

			Dim aMethod1 As Integer = aDO.GetPropertyInt(aIntProperty1)
			Dim aMethod2 As Integer = aDO.GetPropertyInt(aIntProperty2)
			Dim aMethod3 As Integer = aDO.GetPropertyInt(aIntProperty3)
			Dim aMethod4 As Integer = aDO.GetPropertyInt(aIntProperty4)
			Dim aMethod5 As Integer = aDO.GetPropertyInt(aIntProperty5)
			Dim aMethod6 As Integer = aDO.GetPropertyInt(aIntProperty6)
			Dim aMethod7 As Integer = aDO.GetPropertyInt(aIntProperty7)
			Dim aMethod8 As Integer = aDO.GetPropertyInt(aIntProperty8)
			Dim aMethod9 As Integer = aDO.GetPropertyInt(aIntProperty9)
			Dim aMethodDetail As String = aDO.GetPropertyString(aStringProperty, "")


			If (aMethod1 = 1 Or aMethod2 = 1 Or aMethod3 = 1 Or aMethod4 = 1 Or aMethod5 = 1 Or aMethod6 = 1 Or aMethod7 = 1 Or aMethod8 = 1 Or aMethod9 = 1) And aMethodDetail = "" Then
				Return 3
			Else
				Return 1
			End If


		End Function

		Public Function ValidateOtherDataCollectionMethod1(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateOtherDataCollectionMethods(aWfTaskAssignment, "LscDataCollectionMethods", "LowIncomePersonOther", "CommunityOrgOther", "SocialServiceOrgOther", "CourtsOther", "OtherProvidersOther", "PrivateBarOther", "ProgramStaffOther", "ProgramBoardOther", "OtherAssessmentMethods", "OtherDataCollectionMethodDesc")
		End Function

	
		Public Function ValidateOtherAssessmentMethods(ByVal aWfTaskAssignment As cWfTaskAssignment, ByVal aDOProperty As String, ByVal aIntProperty1 As String, ByVal aIntProperty2 As String, ByVal aIntProperty3 As String, ByVal aIntProperty4 As String, ByVal aIntProperty5 As String, ByVal aStringProperty As String, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aDO As cDataObject

			If aDOProperty = "" Then
				aDO = aWfTaskAssignment
			Else
				aDO = aWfTaskAssignment.GetRelatedPropertyDataObject(aDOProperty)
				If aDO Is Nothing Then Return 3
			End If

			If aDO(aIntProperty1) Is System.DBNull.Value Then Return 3
			If aDO(aIntProperty2) Is System.DBNull.Value Then Return 3
			If aDO(aIntProperty3) Is System.DBNull.Value Then Return 3
			If aDO(aIntProperty4) Is System.DBNull.Value Then Return 3
			If aDO(aIntProperty5) Is System.DBNull.Value Then Return 3

			Dim aMethod1 As Integer = aDO.GetPropertyInt(aIntProperty1)
			Dim aMethod2 As Integer = aDO.GetPropertyInt(aIntProperty2)
			Dim aMethod3 As Integer = aDO.GetPropertyInt(aIntProperty3)
			Dim aMethod4 As Integer = aDO.GetPropertyInt(aIntProperty4)
			Dim aMethod5 As Integer = aDO.GetPropertyInt(aIntProperty5)
			Dim aMethodDetail As String = aDO.GetPropertyString(aStringProperty, "")
			Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")

			If (aMethod1 = 1 Or aMethod2 = 1 Or aMethod3 = 1 Or aMethod4 = 1 Or aMethod5 = 1) And aMethodDetail = "" Then
				aResultEl.SetAttribute("Message", cXMLDoc.AttributeToString(aResultEl, "OtherMissingMessage"))
				Return 3
			'ElseIf (aMethod1 = 2 Or aMethod2 = 2 Or aMethod3 = 2 Or aMethod4 = 2 Or aMethod5 = 2) And aMethodDetail <> "" Then
			'	aResultEl.SetAttribute("Message", cXMLDoc.AttributeToString(aResultEl, "OtherProvidedMessage"))
			'	Return 3
			Else
				Return 1
			End If

		End Function


		Public Function ValidateOtherAssessmentMethod1(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateOtherAssessmentMethods(aWfTaskAssignment, "LscDataCollectionMethods", "OtherAssessmentInterview", "OtherAssessmentSurveys", "OtherAssessmentFocus", "OtherAssessmentMeetings", "OtherAssessmentMethods", "OtherAssessmentDesc", aValidationItemNode)
		End Function

		Public Function ValidateBoardMemberInfo(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement, ByVal aSourceID As String) As Integer
			Dim aOrgID As String = aWfTaskAssignment.GetRelatedPropertyString("vLSCCompWftaOrgServareaYear.OrganizationID")
			Dim aTPID As String = aWfTaskAssignment.GetRelatedPropertyString("vLSCCompWftaOrgServareaYear.TimePeriodID")
			Dim aInvalidList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscValidateBoardMemberDetails", _
					"OrganizationID", aOrgID, "TimePeriodID", aTPID, "LscBoardInfoSourceID", aSourceID)
			If aInvalidList.Count = 0 Then
				Return 1
			Else
				Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
				Dim aMessage As StringBuilder = New StringBuilder(cXMLDoc.AttributeToString(aResultEl, "BaseMessage"))
				Dim aFirst As Boolean = True
				For Each aInvalidDO As cDataObject In aInvalidList
					If Not aFirst Then
						aMessage.Append(", ")
					End If
					aMessage.Append(aInvalidDO.GetPropertyString("FirstNameLastName"))
					aFirst = False
				Next
				aResultEl.Attributes("Message").Value = aMessage.ToString()
				Return 3
			End If
		End Function

		Public Function ValidateBoardMemberInfo_1607(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateBoardMemberInfo(aWfTaskAssignment, aValidationItemNode, "3")
		End Function

		Public Function ValidateBoardMemberInfo_Appl(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateBoardMemberInfo(aWfTaskAssignment, aValidationItemNode, "1")
		End Function

		Public Function ValidateEitherofTwo(ByVal aWfTaskAssignment As cWfTaskAssignment, _
		  ByVal aDOProperty As String, ByVal aTextProperty As String, ByVal aBooleanProperty As String) As Integer


			'The two items are assumed to be properties of the same data object.
			Dim aDO As cDataObject
			If aDOProperty = "" Then
				aDO = aWfTaskAssignment
			Else
				aDO = aWfTaskAssignment.GetRelatedPropertyDataObject(aDOProperty)
				If aDO Is Nothing Then Return 3
			End If

			'If aDO(aTextProperty) And aDO(aBooleanProperty) Is System.DBNull.Value Then Return 3

			Dim aText As String = aDO.GetPropertyString(aTextProperty, "")
			Dim aBool As Boolean = aDO.GetPropertyBool(aBooleanProperty)
			If aBool Xor aText = "" Then Return 3

		End Function

		Public Function ValidateConflicts(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateEitherofTwo(aWfTaskAssignment, "vLSCCompWftaOrgServareaYear.LscConflictsComplaints", "Conflicts", "NoConflicts")
		End Function

		Public Function ValidateComplaints(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateEitherofTwo(aWfTaskAssignment, "vLSCCompWftaOrgServareaYear.LscConflictsComplaints", "Complaints", "NoComplaints")
		End Function

		Public Function ValidatePEMReports(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Return ValidateEitherofTwo(aWfTaskAssignment, "vLSCCompWftaOrgServareaYear.LscConflictsComplaints", "PEMReports", "NoPEMReports")
		End Function

		Public Function ValidateTIGProposedPaymentScheduleMilestones(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aPPSList As cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("LscTigProposedPaymentSchedule")
			Dim aPPS As cDataObject
			For Each aPPS In aPPSList
				If aPPS.GetPropertyInt("PaymentNumber") <> 1 Then
					Dim aMilestoneList = aPPS.GetRelatedPropertyDataObjectList("LscMilestones")
					If aMilestoneList.count = 0 Then Return 3
				End If
			Next
			Return 1
		End Function

		Public Function ValidateTIGBudgetContracts(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			'If no TIG Contracts line item, return 1
			Dim aBudget As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscTigBudget")
			If aBudget Is Nothing Then Return 1

			Dim aBudgetItemList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscTigBudgetItem", _
						"LscTigBudgetID", aBudget.GetPropertyString("LscTigBudgetID"), _
						"BudgetCategory.SortOrder", "9", _
						"LscTigBudgetFundingTypeID", "1")
			If aBudgetItemList.Count = 0 Then Return 1
			Dim aBudgetTIG As Integer = 0
			Dim aBudgetItem As cDataObject = aBudgetItemList(0)
			aBudgetTIG = aBudgetItem.GetPropertyInt("Amount", 0)
			'If budget line amount is zero or hasn't been entered, there is nothing to validate.
			If aBudgetTIG = 0 Then Return 1

			Dim aContractsList As cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("LscTigContracts")
			Dim aContractTIG As Integer = 0
			For Each aContract As cDataObject In aContractsList
				aContractTIG += aContract.GetPropertyInt("ContractAmountTig", 0)
			Next

			Dim aMessage As String = ""
			Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
			If aBudgetTIG <> aContractTIG Then
				Return 3
			End If
			Return 1
		End Function

		Public Function ValidateTIGBudgetGrantRequest(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aLscTigApp As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscTigApp")
			If aLscTigApp Is Nothing Then Return 1
			Dim aRequest As Integer = aLscTigApp.GetPropertyInt("GrantRequest", -1)
			Dim aBudget As Integer = aLscTigApp.GetPropertyInt("ProjectBudget", -2)
			If aRequest > aBudget Then Return 3
		End Function

		Public Function ValidateTIGAppContractActivities(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			'Get list of contract data objects
			Dim aContractsList As cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("LscTigContracts")
			'If none, return 1
			If aContractsList.Count = 0 Then Return 1

			Dim aResult As Integer = 1
			Dim aContentInvalid As Boolean = False
			Dim aDecisionInvalid As Boolean = False
			Dim aSCSpecifyInvalid As Boolean = False
			For Each aContract As cDataObject In aContractsList
				'If content flag is true xor content comment is populated then set content invalid flag = true and set result = 3
				If aContract.GetPropertyBool("LegalContentActivities", False) Xor aContract.GetPropertyString("LegalContentActivityComment") <> "" Then
					aContentInvalid = True
					aResult = 3
				End If
				'If activity flag is true xor activity comment is populated then set activity invalid flag = true and set result = 3
				If aContract.GetPropertyBool("LegalDecisionActivities", False) Xor aContract.GetPropertyString("LegalDecisionActivityComment") <> "" Then
					aDecisionInvalid = True
					aResult = 3
				End If
				If aContract.GetPropertyBool("SpecificContractor", False) Xor aContract.GetPropertyString("ContractingEntity") <> "" Then
					aSCSpecifyInvalid = True
					aResult = 3
				End If
				If aContentInvalid And aDecisionInvalid And aSCSpecifyInvalid Then Exit For
			Next
			If aResult = 3 Then
				'Set message based on which invalid flag(s) is(are) true
				Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
				Dim aMessage As StringBuilder = New StringBuilder("")
				If aContentInvalid Then
					aMessage.Append(cXMLDoc.AttributeToString(aResultEl, "ContentInvalidMessage"))
				End If
				If aDecisionInvalid Then
					If aMessage.ToString() <> "" Then aMessage.Append("<br>")
					aMessage.Append(cXMLDoc.AttributeToString(aResultEl, "DecisionInvalidMessage"))
				End If
				If aSCSpecifyInvalid Then
					If aMessage.ToString() <> "" Then aMessage.Append("<br>")
					aMessage.Append(cXMLDoc.AttributeToString(aResultEl, "SCSpecifyInvalidMessage"))
				End If
				aResultEl.Attributes("Message").Value = aMessage.ToString()
			End If
			Return aResult
		End Function

		Public Function ValidatePQVReportResponses(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aList As cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("LscWftaPQVRecommendationServArea")
			Dim aMessage As String = ""
			Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
			Dim aStatusMessageStart As String = cXMLDoc.AttributeToString(aResultEl, "StatusMessageStart")
			Dim aStatusMessageEnd As String = cXMLDoc.AttributeToString(aResultEl, "StatusMessageEnd")
			Dim aRecommendationMessageStart As String = cXMLDoc.AttributeToString(aResultEl, "RecommendationMessageStart")
			Dim aRecommendationMessageEnd As String = cXMLDoc.AttributeToString(aResultEl, "RecommendationMessageEnd")
			For Each aRec As cDataObject In aList
				If aRec.GetRelatedPropertyValue("LscPQVRecommendationServArea.LscPQVRecommendationStatusID") Is Nothing Then
					If aMessage <> "" Then aMessage += "<br>"
					aMessage += aStatusMessageStart + aRec.GetRelatedPropertyString("LscPQVRecommendation.RecommendationReference") + aStatusMessageEnd
				End If
				If aRec.GetPropertyString("ApplicantComment") = "" Then
					If aMessage <> "" Then aMessage += "<br>"
					aMessage += aRecommendationMessageStart + aRec.GetRelatedPropertyString("LscPQVRecommendation.RecommendationReference") + aRecommendationMessageEnd
				End If
			Next
			If aMessage = "" Then
				Return 1
			Else
				aResultEl.Attributes("Message").Value = aMessage
				Return 3
			End If
		End Function

		Public Function ValidatePPQVReviewersResponsesToRec(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
			Dim aList As cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("LscWftaPQVRecommendationServArea")
			Dim aMessage As String = ""
			Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
			Dim aMessageStart As String = cXMLDoc.AttributeToString(aResultEl, "MessageStart")
			Dim aMessageEnd As String = cXMLDoc.AttributeToString(aResultEl, "MessageEnd")
			For Each aRec As cDataObject In aList
				If aRec.GetPropertyString("ReviewerComment") = "" Then
					If aMessage <> "" Then aMessage += "<br>"
					aMessage += aMessageStart + aRec.GetRelatedPropertyString("LscPQVRecommendation.RecommendationReference") + aMessageEnd
				End If
			Next
			If aMessage = "" Then
				Return 1
			Else
				aResultEl.Attributes("Message").Value = aMessage
				Return 3
			End If
		End Function
		Public Function ValidatePrioritiesGoalsStrategies(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer

			Dim aLscProgramPrioritiesList As cDataObjectList = aWfTaskAssignment.GetRelatedPropertyDataObjectList("LscProgramPriorities")
			Dim aPP As cDataObject
			Dim aMessage As String
			Dim aReturnCode As Integer = 1
			Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
			Dim aNoGoalsMessageStart As String = cXMLDoc.AttributeToString(aResultEl, "NoGoalsMessageStart")
			Dim aNoGoalsMessageEnd As String = cXMLDoc.AttributeToString(aResultEl, "NoGoalsMessageEnd")
			Dim aNoStrategiesMessageStart As String = cXMLDoc.AttributeToString(aResultEl, "NoStrategiesMessageStart")
			Dim aNoStrategiesMessageEnd As String = cXMLDoc.AttributeToString(aResultEl, "NoStrategiesMessageEnd")


			For Each aPP In aLscProgramPrioritiesList
				Dim aLscGoalList = aPP.GetRelatedPropertyDataObjectList("LscGoal")
				If aLscGoalList.count = 0 Then
					aReturnCode = 3
					'aMessage = cXMLDoc.AttributeToString(aResultEl, "NoGoalsMessage")
					If aMessage <> "" Then aMessage += "<br>"
					aMessage += aNoGoalsMessageStart + aPP.GetRelatedPropertyString("PriorityDesc") + aNoGoalsMessageEnd
				Else
					For Each aGoal As cDataObject In aLscGoalList
						Dim aLscStrategiesList = aGoal.GetRelatedPropertyDataObjectList("LscStrategies")
						If aLscStrategiesList.count = 0 Then
							aReturnCode = 3
							'aMessage = cXMLDoc.AttributeToString(aResultEl, "NoStrategiesMessage")
							If aMessage <> "" Then aMessage += "<br>"
							aMessage += aNoStrategiesMessageStart + aGoal.GetRelatedPropertyString("GoalDesc") + aNoStrategiesMessageEnd
						End If
					Next
				End If
			Next

			aResultEl.Attributes("Message").Value = aMessage
			Return aReturnCode

		End Function
		'Public Function ValidateFraudIncident(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		'	Return ValidateBooleanAddlInfo(aWfTaskAssignment, "vLSCCompWftaOrgServareaYear.LSCFiscalOversight", "FraudRecently", "FraudIncident")
		'End Function

		'Public Function ValidateFraudActionTaken(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		'	Return ValidateBooleanAddlInfo(aWfTaskAssignment, "vLSCCompWftaOrgServareaYear.LSCFiscalOversight", "FraudRecently", "FraudActionTaken")
		'End Function

		'Public Function ValidateFraudChangesMade(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		'	Return ValidateBooleanAddlInfo(aWfTaskAssignment, "vLSCCompWftaOrgServareaYear.LSCFiscalOversight", "FraudRecently", "FraudChangesMade")
		'End Function

		'Public Function ValidateAcctChanges(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		'	Return ValidateBooleanAddlInfo(aWfTaskAssignment, "vLSCCompWftaOrgServareaYear.LSCFiscalOversight", "AccountingManual", "AcctChanges")
		'End Function

		'Public Function ValidateAuditCommittee(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		'	Return ValidateBooleanAddlInfo(aWfTaskAssignment, "vLSCCompWftaOrgServareaYear.LSCFiscalOversight", "BoardAudit", "BoardAuditQualifications")
		'End Function

		'Public Function ValidateFinanceCommittee(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		'	Return ValidateBooleanAddlInfo(aWfTaskAssignment, "vLSCCompWftaOrgServareaYear.LSCFiscalOversight", "BoardFinance", "BoardFinanceQualifications")
		'End Function



		Public Function ValidateCSRNumberPatternsComment(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer

			Dim aRecipientID As Integer = aWfTaskAssignment.GetRelatedPropertyInt("GranteeProject.PrimaryOrganization.LegacyOrganizationID")
			Dim aYear As Integer = aWfTaskAssignment.GetRelatedPropertyInt("WfTACompetitionYear.WfTAYear")
			Dim aList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscCsrAnalysisByRecipient", _
			 "recipient_id", aRecipientID.ToString, "year", aYear)

			If aList.Count = 0 Then Return 1

			Dim aLscReviewApplication As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscReviewApplication")
			If aLscReviewApplication Is Nothing Then Return 1

			Dim aQuestion1 As Boolean = aList(0).GetPropertyBool("ExtCSRBelow70", False)
			Dim aQuestion2 As Boolean = aList(0).GetPropertyBool("ContestedCSRBelow70", False)
			Dim aQuestion3 As Boolean = aList(0).GetPropertyBool("PrecipitousDrop", False)
			Dim aQuestion4 As Boolean = aLscReviewApplication.GetPropertyBool("OtherCsrNumberPatternsOther", False)
			Dim aComment As String = aLscReviewApplication.GetPropertyString("OtherCsrNumberPatternsComment")

			If (aQuestion1 = True Or aQuestion2 = True Or aQuestion3 = True Or aQuestion4 = True) And aComment = "" Then
				Return 3
			End If

		End Function

		Public Function ValidateStaffHours(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		'This method was developed in order to provide detailed feedback for submission-level validation of the "Hours per week" data 
		'element in the E-1 (staffing) forms. As it turns out, the rest of the E-1 validation uses only standard XML validation 
		'configuration and does not provide this level of detailed feedback. Because of this, I decided not to implement this custom
		'validation. However, I left the method in place in case it's needed in the future.
		'Peter Larsen 12/4/2013
		
			Dim aOrganizationID As Integer = aWfTaskAssignment.GetRelatedPropertyInt("GranteeProject.PrimaryOrganization.OrganizationID")
			Dim aTimePeriodID As Integer = aWfTaskAssignment.GetRelatedPropertyInt("WfTACompetitionYear.TimePeriodID")
			Dim aTaskID As Integer = aWfTaskAssignment.GetPropertyInt("WfTaskID")
			Dim aOffType As String
			Select Case aTaskID
				Case 25 'Main
					aOffType = "1"
				Case 26 'Branch
					aOffType = "2"
				Case 27 'Subrecipient
					aOffType = "3"
			End Select
			Dim aList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscStaffDetail", _
				"LscOffice.OrganizationID", aOrganizationID.ToString, "LscOffice.TimePeriodID", aTimePeriodID, _
				"LscOffice.OffTypeID", aOffType, "HoursPerWeek", "")

			If aList.Count = 0 Then Return 1
			
			Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
			Dim aMessage As String = cXMLDoc.AttributeToString(aResultEl, "MessageStart")
			For Each aStaff As cDataObject In aList
				aMessage += "<br>" + aStaff.GetPropertyString("FirstName") + " " + aStaff.GetPropertyString("LastName") 
				If aTaskID <> 25 Then
					aMessage += "(Office " + aStaff.GetRelatedPropertyString("LscOffice.OffID") + ")" + aStaff.GetPropertyString("LastName") 
				End If
			Next
			
			aResultEl.Attributes("Message").Value = aMessage
			Return 3
        End Function

        Public Function ValidatePBIFBudgetContracts(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Dim aBudget As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscPBIFBudget")
            If aBudget Is Nothing Then Return 1

            Dim aBudgetItemList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscPBIFBudgetItem", _
               "LscPBIFBudgetID", aBudget.GetPropertyString("LscPBIFBudgetID"), _
               "BudgetCategory.SortOrder", "14", _
               "LscPBIFBudgetFundingTypeID", "1")
            If aBudgetItemList.Count = 0 Then Return 1
            Dim aBudgetPBIF As Decimal = 0
            Dim aBudgetItem As cDataObject = aBudgetItemList(0)
            aBudgetPBIF = aBudgetItem.GetPropertyInt("Amount", 0)
            'If budget line amount is zero or hasn't been entered, there is nothing to validate.
            If aBudgetPBIF = 0 Then Return 1

            Dim SubmittedFile As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", _
               "EntityID", aWfTaskAssignment.GetPropertyString("WfTaskAssignmentID"), _
               "TaskUploadType.UploadId", "64", _
               "EntityDataObjectKey", "WfTaskAssignment")



            Dim aMessage As String = ""
            Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
            If SubmittedFile.Count = 0 Then
                Return 3
            End If
            Return 1
        End Function

        Public Function ValidatePBIFBudgetSubGrants(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Dim aBudget As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscPBIFBudget")
            If aBudget Is Nothing Then Return 1

            Dim aBudgetItemList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscPBIFBudgetItem", _
               "LscPBIFBudgetID", aBudget.GetPropertyString("LscPBIFBudgetID"), _
               "BudgetCategory.SortOrder", "15", _
               "LscPBIFBudgetFundingTypeID", "1")
            If aBudgetItemList.Count = 0 Then Return 1
            Dim aBudgetPBIF As Decimal = 0
            Dim aBudgetItem As cDataObject = aBudgetItemList(0)
            aBudgetPBIF = aBudgetItem.GetPropertyInt("Amount", 0)
            'If budget line amount is zero or hasn't been entered, there is nothing to validate.
            If aBudgetPBIF = 0 Then Return 1

            Dim SubmittedFile As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", _
               "EntityID", aWfTaskAssignment.GetPropertyString("WfTaskAssignmentID"), _
               "TaskUploadType.UploadId", "65", _
               "EntityDataObjectKey", "WfTaskAssignment")



            Dim aMessage As String = ""
            Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
            If SubmittedFile.Count = 0 Then
                Return 3
            End If
            Return 1
        End Function

        Public Function ValidatePBIFBudgetTotal(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Dim aBudgetTotal As Decimal = aWfTaskAssignment.GetRelatedPropertyDecimal("LscPBIFBudget.LscPBIFBudgetTotal.BudgetTotal")
            Dim TotalBudget As Decimal = aWfTaskAssignment.GetRelatedPropertyDecimal("LscPbifApp.TotalBudget", 0)

            Dim aMessage As String = ""
            Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
            If aBudgetTotal <> TotalBudget Then
                Return 3
            End If
            Return 1
        End Function

        Public Function ValidatePBIFBudgetColumnATotal(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Dim FundingTypeTotal As Decimal = aWfTaskAssignment.GetRelatedPropertyDecimal("LscPBIFBudget.LscPBIFBudgetByFundingTypeColumnA.FundingTypeTotal")
            Dim AmountRequested As Decimal = aWfTaskAssignment.GetRelatedPropertyDecimal("LscPbifApp.AmountRequested", 0)

            Dim aMessage As String = ""
            Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
            If AmountRequested <> FundingTypeTotal Then
                Return 3
            End If
            Return 1
        End Function

        Public Function ValidatePBIFBudgetTotalGreaterThanZero(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Dim aBudgetTotal As Decimal = aWfTaskAssignment.GetRelatedPropertyDecimal("LscPBIFBudget.LscPBIFBudgetTotal.BudgetTotal")

            Dim aMessage As String = ""
            Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
            If aBudgetTotal <= 0 Then
                Return 3
            End If
            Return 1
        End Function


        Public Function ValidateFY15TIGAndPBIFRelated(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
            Dim aIsParrallelTig As Boolean = aWfTaskAssignment.GetRelatedPropertyBool("LscPbifApp.ParrallelTig", False)
            Dim aParrallelTigDesc As String = aWfTaskAssignment.GetRelatedPropertyString("LscPbifApp.TigProgramDescription")


            Dim aMessage As String = ""
            Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")
            If (aIsParrallelTig = True And aParrallelTigDesc = "") Then
                Return 3
            End If
            Return 1
        End Function

	End Class
End Namespace
