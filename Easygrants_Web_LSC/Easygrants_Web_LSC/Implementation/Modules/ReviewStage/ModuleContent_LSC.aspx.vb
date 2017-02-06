Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Workflow

Namespace Implementation.Modules.ReviewStage

Public Class cModuleContent_LSC
	Inherits cModuleContent

	Public Function ValidateTIGOPPScoresAndComments(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		Dim aUser As cEGUser
		Dim aWFTADo As cDataObject
		Dim aResult As String = ""
		Dim aSubResult As String
		Dim aResultEl As XmlElement
		Dim aMessage As String = ""

		aResultEl = cXMLDoc.GetResultElement(aValidationItemNode, 3)
		If Not aResultEl Is Nothing Then
			aMessage = cXMLDoc.AttributeToString(aResultEl, "BaseMessage", "")
		End If
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		aWFTADo = aUser.WfTaskAssignmentObject
		Dim aReviewWfTADOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "ReviewCycleStageID", aWFTADo.GetPropertyString("ReviewCycleStageID"), "PersonID", aUser.PersonID.ToString, "WfTaskID", aUser.WfTaskID.ToString)
		For Each aReviewWfTADO As cDataObject In aReviewWfTADOL
			aSubResult = ValidateTIGOPPReviewWfTA(aReviewWfTADO, aMessage)
			If aSubResult <> "" Then
				If aResult <> "" Then aResult += "<br>"
				aResult += aSubResult
			End If
		Next
		If aResult <> "" Then
			If Not aResultEl Is Nothing Then
				cXMLDoc.SetValidationResultMessage(aResultEl, aResult)
			End If
			Return 3
		End If
	End Function

	Public Function ValidateTIGOPPReviewWfTA(ByVal aReviewWfTADO As cDataObject, ByVal aMessage As String) As String
		Dim aResult As String = ""
		Dim aValid As Boolean = True
		Dim aTIG As String = aReviewWfTADO.GetRelatedPropertyString("GranteeProject.LegacyGrantID")
		Dim aLscTigLoiReviewOpp As cDataObject = aReviewWfTADO.GetRelatedPropertyDataObject("LscTigLoiReviewOpp")
		If aLscTigLoiReviewOpp Is Nothing Then
			aValid = False
		Else
			Select Case aReviewWfTADO.GetPropertyInt("WfTaskID")
				Case 39	'Open/Replication/Website Improvement
					If aLscTigLoiReviewOpp.GetPropertyString("ProjectDescriptionComment") = "" _
							Or aLscTigLoiReviewOpp.GetPropertyString("BenefitsComment") = "" _
							Or aLscTigLoiReviewOpp.GetPropertyString("CostsComment") = "" _
							Or aLscTigLoiReviewOpp.GetPropertyString("PartnersComment") = "" _
							Or aLscTigLoiReviewOpp.GetPropertyString("InnovationComment") = "" Then

						aValid = False
					End If
				Case 40	'Continuation/Renewal
					If aLscTigLoiReviewOpp("TigReportingCurrent") Is System.DBNull.Value Or aLscTigLoiReviewOpp("StatewideGrantRecipient") Is System.DBNull.Value _
							Or aLscTigLoiReviewOpp.GetPropertyString("NextMilestoneExpected") Is System.DBNull.Value Then

						aValid = False
					End If
			End Select
		End If
		If Not aValid Then
			aResult = "TIG " + aTIG + ": " + aMessage
		End If
		Return aResult
	End Function

	Public Function ValidateTIGAppReviewPurpose(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		If aWfTaskAssignment.GetPropertyInt("ReviewAssignmentTypeID", 0) = 1 Then 'Primary Assignment
			If aWfTaskAssignment.GetRelatedPropertyString("GranteeProject.LscGranteeProjectTig.Purpose") = "" Then
				Return 3
			Else
				Return 1
			End If
		Else
			Return 1
		End If
	End Function

	Public Function ValidateTIGProposedPaymentSchedulePostReview(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		Dim aPresWfTAList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
				"GranteeProjectID", aWfTaskAssignment.GetPropertyString("GranteeProjectID"), "WfTaskID", "51")
		If aPresWfTAList.Count = 0 Then Return 3
		Dim aAwardedAmount As Integer = aPresWfTAList(0).GetRelatedPropertyInt("GranteeProject.GranteeProjectInfo.AwardAmount", 0)
		If aAwardedAmount = 0 Then Return 3
		Dim aPaymentTotal As Integer = aWfTaskAssignment.GetRelatedPropertyInt("LscTigProposedPaymentScheduleTotal.PaymentTotal", 0)
		If aPaymentTotal = 0 Then Return 3
		If aAwardedAmount <> aPaymentTotal Then Return 3
		Return 1
	End Function

	Public Function ValidateTIGProposedPaymentScheduleMilestonesPostReview(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
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

	Public Function ValidateTIGBudgetRevisionTotals(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		Dim aBudgetID As Integer = aWfTaskAssignment.GetRelatedPropertyInt("LscTigBudget.LscTigBudgetID", 0)
		If aBudgetID = 0 Then Return 3

		Dim aReturnValue As Integer = 1
		Dim aMessage As String = ""
		Dim aResultEl As XmlElement = aValidationItemNode.SelectSingleNode("Results/Result")

		'Check award amount from President's review against total of LSC Funding budget items
		Dim aGPIList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectInfo", "GranteeProjectID", aWfTaskAssignment.GetPropertyString("GranteeProjectID"))
		If aGPIList.Count = 0 Then Return 3
		Dim aGPI As cDataObject = aGPIList(0)
		Dim aAwardedAmount As Integer = aGPI.GetPropertyInt("AwardAmount", 0)
		Dim aBudgetFundingRequestList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscTigBudgetByFundingType", "LscTigBudgetID", aBudgetID.ToString(), "LscTigBudgetFundingTypeID", "1")
		If aBudgetFundingRequestList.Count > 0 Then
			If aBudgetFundingRequestList(0).GetPropertyInt("FundingTypeTotal") <> aAwardedAmount Then
				aReturnValue = 3
			End If
		End If
		Return aReturnValue
	End Function

	Protected Function GetPropertyDate(ByVal aWfTaskAssignment As cWfTaskAssignment, ByVal aRelatedPropertyKey As String) As Date
		Dim aDateObj As Object = aWfTaskAssignment.GetRelatedPropertyValue(aRelatedPropertyKey)
		If aDateObj Is Nothing OrElse aDateObj Is System.DBNull.Value Then
			Return Date.MinValue
		End If
		Dim aDate As Date
		Try
			aDate = CDate(aDateObj)
		Catch ex As Exception
			Return Date.MinValue
		End Try
		Return aDate
	End Function

	Public Function ValidateRevisedStartDateInFuture(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		'If no date has been provided, validation succeeds for this item. Absence of a date is handled by a different validation item.
		Dim aDate As Date = GetPropertyDate(aWfTaskAssignment, "LscWftaSubgrantReviewDD.RevisedStartDate")
		If aDate = Date.MinValue Then
			Return 1
		End If
		If aDate > System.DateTime.Now() Then
			Return 1
		Else
			Return 3
		End If
	End Function

	Public Function ValidateReportDueDateInFuture(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		'If no date has been provided, validation succeeds for this item. Absence of a date is handled by a different validation item.
		Dim aDate As Date = GetPropertyDate(aWfTaskAssignment, "LscWftaSubgrantReviewDD.ReportDueDate")
		If aDate = Date.MinValue Then
			Return 1
		End If
		If aDate > System.DateTime.Now() Then
			Return 1
		Else
			Return 3
		End If
	End Function

	Public Function ValidateProvisionalDueDateInFuture(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		'If no date has been provided, validation succeeds for this item. Absence of a date is handled by a different validation item.
		Dim aDate As Date = GetPropertyDate(aWfTaskAssignment, "LscWftaSubgrantReviewDD.ProvisionalDueDate")
		If aDate = Date.MinValue Then
			Return 1
		End If
		If aDate > System.DateTime.Now() Then
			Return 1
		Else
			Return 3
		End If
	End Function

	Public Function ValidateRevisedStartDateEndDate(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		'If outcome is not "Partial/Provisional Approval" or Partial Approval is not selected, then start date and end date don't matter.
		If aWfTaskAssignment.GetPropertyInt("WfTaskOutcomeID", 0) <> 139 OrElse aWfTaskAssignment.GetRelatedPropertyBool("LscWftaSubgrantReviewDD.RecommendPartialApproval") = False Then
			Return 1
		End If
		'If dates have not been provided for both fields, validation succeeds for this item. Absence of a date is handled by a different validation item.
		Dim aStartDate As Date = GetPropertyDate(aWfTaskAssignment, "LscWftaSubgrantReviewDD.RevisedStartDate")
		Dim aEndDate As Date = GetPropertyDate(aWfTaskAssignment, "LscWftaSubgrantReviewDD.RevisedEndDate")
		If aStartDate = Date.MinValue Or aEndDate = Date.MinValue Then
			Return 1
		End If
		If aEndDate > aStartDate Then
			Return 1
		Else
			Return 3
		End If
	End Function

	Public Function ValidateTIGAppReviewContractsComment(ByVal aWfTaskAssignment As cWfTaskAssignment, ByRef aValidationItemNode As XmlElement) As Integer
		'If this is not a primary review assignment, there is no validation requirement.
		If aWfTaskAssignment.GetPropertyInt("ReviewAssignmentTypeID", 0) <> 1 Then Return 1

		'Get amount of budget line 11.a
		Dim aBudgetID As Integer = aWfTaskAssignment.GetRelatedPropertyInt("GranteeProject.LscTigBudget.LscTigBudgetID", 0)
		If aBudgetID = 0 Then Return 1
		Dim aBudgetItemList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscTigBudgetItem", "LscTigBudgetID", aBudgetID.ToString(), _
			"LscTigBudgetLineID", "11", "LscTigBudgetFundingTypeID", "1")
		If aBudgetItemList.Count = 0 Then Return 1

		'If amount is zero, return 1
		If aBudgetItemList(0).GetPropertyInt("Amount", 0) = 0 Then Return 1

		'Get contracts comment
		Dim aReviewDO As cDataObject = aWfTaskAssignment.GetRelatedPropertyDataObject("LscTigReviewOpenRepWebImpr")
		If aReviewDO Is Nothing Then Return 3

		'If comment is blank, return 3; else, return 1
		If aReviewDO.GetPropertyString("ContractsComment") = "" Then Return 3
		Return 1
	End Function

End Class

End Namespace