<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<style>
	td {vertical-align:top}
</style>
<table id="Table1" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
	  <td colspan="4"><h1>Fiscal Grantee Funding Application</h1></td>
  </tr>
	<tr>
	  <td><table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
        <tr>
          <td colspan="4" class="SeparatorHdg">Instructions</td>
        </tr>
        <tr>
          <td colspan="4" >&nbsp;</td>
        </tr>
        <tr>
          <td><p>Applicant will use this form to describe policies, procedures, and systems that ensure appropriate financial management and compliance with LSC rules, regulations, guidelines, and directives. Applicants are encouraged to review the LSC Accounting Guide for Recipients (2010 Edition), available <a target=_blank href="http://grants.lsc.gov/rin/grantee-guidance/accounting-guide-lsc-recipients"> here</a>, before responding to the inquiries below. </p></td>
          <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
        </tr>
        <tr><td><p>Each section in the form must be answered before the form can be submitted. Click the save button below once the form is completed. </p></td></tr>
        <tr>
          <td colspan="4" >&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview_OCEStaff/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>
<br />
<table>
	<tr>
		
		<td>
			<Core:cUserCtlLoader CtlID='ctlApplicantReportLink' Src='Core/Controls/Base/ReportOutputLink.ascx'
				runat='server' />
		</td>
	</tr>
</table>
<div class='SeparatorHdg'>Fiscal Grantee Funding Application</div>
<br />
<table style='width:800px;'>
	<tr>
		<td style='width:900' class='MinorSeparatorHdg' colspan='4'>Part I Board of Directors/Management Involvement</td>
	</tr>
	<tr>
		<td style='width:20px'>&nbsp;</td>
		<td>
			<b>Inquiry</b>
		</td>
		<td>
			<b>Response</b>
		</td>
		<td style='width:20px'>
			<b>Score</b>
		</td>
	</tr>
	<tr>
		<td>1.</td>
		<td>Has your governing body, the Board of Directors (&quot;BOD&quot;), established a Finance Committee?</td>
		<td><span id='spnBODFinanceCommittee' runat='server'/></td>
		<td><span id='spnBODFinanceCommitteeScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. If yes, does this committee have a charter or other written description of its duties?</td>
		<td><span id='spnBODFinanceCharter' runat='server'/></td>
		<td><span id='spnBODFinanceCharterScore' runat='server'/></td>
	</tr>
	<tr>
		<td>2.</td>
		<td>Has your governing body, the BOD, established an Audit Committee? </td>
		<td><span id='spnBODAuditCommittee' runat='server'/></td>
		<td><span id='spnBODAuditCommitteeScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. If yes, does this committee have a charter or other written description of its duties?</td>
		<td><span id='spnBODAuditCharter' runat='server'/></td>
		<td><span id='spnBODAuditCharterScore' runat='server'/></td>
	</tr>
	<tr>
		<td>3.</td>
		<td>Has your governing body, the BOD, established a combined Audit/Finance Committee?</td>
		<td><span id='spnBODAuditFinance' runat='server'/></td>
		<td><span id='spnBODAuditFinanceScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>i. Does this committee have a charter or other written description of its duties?   </td>
		<td><span id='spnBODAuditCharterx' runat='server'/></td>
		<td><span id='spnBODAuditCharterScorex' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, provide a copy of the Committee’s charter or other written description</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>2.</td>
		<td>Does the Finance Committee or, in the absence of a Finance Committee, the BOD, perform the following duties:</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. Review and approve the budget and make recommendations to the full BOD? </td>
		<td><span id='spnFinanceReviseBudget' runat='server'/></td>
		<td><span id='spnFinanceReviseBudgetScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>b. Review monthly management reports (including budgeted and actual income and expenses, variances, and a statement of cash on hand) with the chief financial officer, controller, and/or CPA?</td>
		<td><span id='spnFinanceReviewReport' runat='server'/></td>
		<td><span id='spnFinanceReviewReportScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>c. Review accounting and control policies and make recommendations for changes and Improvements?</td>
		<td><span id='spnFinanceReviewAccountingPolicy' runat='server'/></td>
		<td><span id='spnFinanceReviewAccountingPolicyScore' runat='server'/></td>
	</tr>
	<tr>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>d. If the Audit Committee does not do so, does the Finance Committee review the audited financial statements, management letter, and senior staff’s response with staff and auditor?</td>
		<td><span id='spnFinanceReviewFinancialStmts' runat='server'/></td>
		<td><span id='spnFinanceReviewFinancialStmtsScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>e. Regularly review and make recommendations about investment policies?</td>
		<td><span id='spnFinanceReviewInvestmentPolicy' runat='server'/></td>
		<td><span id='spnFinanceReviewInvestmentPolicyScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>f. Coordinate board training on financial matters?</td>
		<td><span id='spnFinanceBoardFinancialTraining' runat='server'/></td>
		<td><span id='spnFinanceBoardFinancialTrainingScore' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style='width:20px'>3.</td>
		<td>Does the Audit Committee or, in the absence of an Audit Committee, the BOD, perform the following duties?</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. Hire the auditor?</td>
		<td><span id='spnAuditBODHireAuditor' runat='server'/></td>
		<td><span id='spnAuditBODHireAuditorScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>b. Set the compensation of the auditor?</td>
		<td><span id='spnAuditBODAuditorComp' runat='server'/></td>
		<td><span id='spnAuditBODAuditorCompScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>c. Oversee the auditor’s activities?</td>
		<td><span id='spnAuditBODOverseeAuditor' runat='server'/></td>
		<td><span id='spnAuditBODOverseeAuditorScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>d. If the Finance Committee does not do so, does the Audit Committee review the audited financial statements, management letter, and senior staff’s response with staff and auditor?</td>
		<td><span id='spnAuditReviewFinancialStmts' runat='server'/></td>
		<td><span id='spnAuditReviewFinancialStmtsScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>e. Set the rules and processes for complaints concerning accounting practices and internal control practices;</td>
		<td><span id='spnAuditBODComplaintRule' runat='server'/></td>
		<td><span id='spnAuditBODComplaintRuleScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>f. Reviews the annual IRS Form 990 for completeness, accuracy, and on-time filing;</td>
		<td><span id='spnAuditBODReview990' runat='server'/></td>
		<td><span id='spnAuditBODReview990Score' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>g. Ensure that your program has written procedures in place requiring that operations be conducted in an ethical and honest manner; comply with applicable laws, regulations and policies; manage resources and risks effectively; and hold persons within your organization accountable for their actions? </td>
		<td><span id='spnAuditBODEnsureEthics' runat='server'/></td>
		<td><span id='spnAuditBODEnsureEthicsScore' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style='width:20px'>4.</td>
		<td>Do any of the BOD members have expertise in, or does the BOD have access to a financial expert whose expertise includes an understanding of, the following matters:</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. Generally Accepted Accounting Principles (GAAP);</td>
		<td><span id='spnBODGAAP' runat='server'/></td>
		<td><span id='spnBODGAAPScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>b. The capacity to apply GAAP in connection with preparing and auditing financial statements;</td>
		<td><span id='spnBODGAAPStatements' runat='server'/></td>
		<td><span id='spnBODGAAPStatementsScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>c. Familiarity with developing and implementing internal financial controls and procedures;</td>
		<td><span id='spnBODControls' runat='server'/></td>
		<td><span id='spnBODControlsScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>d. The capacity to understand the implications of different interpretations of accounting rules </td>
		<td><span id='spnBODRuleInterp' runat='server'/></td>
		<td><span id='spnBODRuleInterpScore' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style='width:20px'>5.</td>
		<td>If your organization has a Finance Committee, does program staff prepare a cash flow statement or a statement of cash on hand to be submitted monthly to the Finance Committee and at least quarterly to all board members?  </td>
		<td><span id='spnCashFlowMonthly' runat='server'/></td>
		<td><span id='spnCashFlowMonthlyScore' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>6.</td>
		<td>Does your program prepare and provide the following financial reports for Management and Board review?</td>
		<td><span id='spnPrepareFinRpts' runat='server'/></td>
		<td><span id='spnPrepareFinRptsScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. Statement of Financial Position </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>b. Statement of Activities </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>c. Statement of Cash Flows </td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>7.</td>
		<td>How frequent are these financial reports prepared?</td>
		<td><span id='spnFinancialReportFrequencyID' runat='server'/></td>
		<td><span id='spnFinancialReportFrequencyScore' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>8.</td>
		<td>Does your program have established budgetary controls that allow for the program director to control expenditures by reviewing regular reports that reflect actual revenue and expenditures compared to the approved budget?</td>
		<td><span id='spnBudgetCtrlMthly' runat='server'/></td>
		<td><span id='spnBudgetCtrlMthlyScore' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>9.</td>
		<td>Does your program report and explain budget variances that exceed a 10% threshold?</td>
		<td><span id='spnExplainBudgetVar' runat='server'/></td>
		<td><span id='spnExplainBudgetVarScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. To Management?</td>
		<td><span id='spnExplainBudgetVarMngt' runat='server'/></td>
		<td><span id='spnExplainBudgetVarMngtScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>b. To the BOD? </td>
		<td><span id='spnExplainBudgetVarBOD' runat='server'/></td>
		<td><span id='spnExplainBudgetVarBODScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>c. To the IPA, at year end? </td>
		<td><span id='spnExplainBudgetVarIPA' runat='server'/></td>
		<td><span id='spnExplainBudgetVarIPAScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style="text-align:right" ><b>Part I Subtotal</b> </td>
		<td>&nbsp;</td>
		<td><b><span id='spnSubtotalPartI' runat='server'/></b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class='MinorSeparatorHdg'>
			Part II Competence of Financial Employees
		</td>
	</tr>
	<tr>
		<td style='width:20px'>&nbsp;</td>
		<td>
			<b>Inquiry</b>
		</td>
		<td>
			<b>Response</b>
		</td>
		<td style='width:20px'>
			<b>Score</b>
		</td>
	</tr>
	<tr>
		<td>1.</td>
		<td>Please check off the title of the individual who is responsible for the program’s financial operations:</td>
		<td><span id='spnFRPTitleID' runat='server'/><br /><span id='spnFRPTitleOther' runat='server'/></td>
		<td><span id='spnFRPTitleIDScore' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>2.</td>
		<td>Please check all that apply for this individual:</td>
		<td><span id='spnLscFRPFiscalQualification' runat='server'/><br /><span id='spnFRPQualificationOther' runat='server'/></td>
		<td><span id='spnFRPFiscalQualificationsScore' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>3.</td>
		<td>Please indicate this person’s level of experience in the accounting field:</td>
		<td><span id='spnFRPAcctgExperienceID' runat='server'/></td>
		<td><span id='spnFRPAcctgExperienceIDScore' runat='server'/></td>
	</tr>
	<tr>
		<td>4.</td>
		<td>Please indicate when this person last received training regarding LSC’s fiscal regulations:</td>
		<td><span id='spnFRPMostRecentLscTrngID' runat='server'/></td>
		<td><span id='spnFRPMostRecentLscTrngScore' runat='server'/></td>
	</tr>
	<tr>
		<td>5.</td>
		<td>a. At the time of hire, did this person undergo a background check?</td>
		<td><span id='spnFRPBackgroundCheck' runat='server'/></td>
		<td><span id='spnFRPBackgroundCheckScore' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td>b. If so, were there any unexplained issues concerning financial-related issues within the five years preceding the background check?</td>
		<td><span id='spnFRPFinancialIssues' runat='server'/></td>
		<td><span id='spnFRPFinancialIssuesScore' runat='server'/></td>
	</tr>
	<tr>
		<td>6.</td>
		<td>Does your program have a policy that requires financial employees to take five consecutive days of vacation in a year?</td>
		<td><span id='spnPolicyFiveDaysVacation' runat='server'/></td>
		<td><span id='spnPolicyFiveDaysVacationScore' runat='server'/></td>
	</tr>
	<tr>
		<td>7.</td>
		<td>When a financial employee is absent, does another employee(s) perform his or her duties during the absence?</td>
		<td><span id='spnVacationOtherEmployee' runat='server'/></td>
		<td><span id='spnVacationOtherEmployeeScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style="text-align:right" ><b>Part II Subtotal</b> </td>
		<td>&nbsp;</td>
		<td><b><span id='spnSubtotalPartII' runat='server'/></b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='MinorSeparatorHdg' colspan='4'>
			Part III Accounting Manual
		</td>
	</tr>
	<tr>
		<td style='width:20px'>&nbsp;</td>
		<td>
			<b>Inquiry</b>
		</td>
		<td>
			<b>Response</b>
		</td>
		<td style='width:20px'>
			<b>Score</b>
		</td>
	</tr>
	<tr>
		<td style='width:20px'>1.</td>
		<td>If you submitted an accounting manual with this application, have any changes been made to that manual since August 23, 2010?</td>
		<td><span id='spnAccountingManualRevised' runat='server'/></td>
	    <td><span id='spnAccountingManualRevisedScore' runat='server'/></td>
	</tr>
	<tr>
		<td>2.</td>
		<td>Please check those areas of internal controls for which written policies have been instituted and indicate the date on which those policies were last updated: </td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnLscFiscalIntCtlsInstituted' runat='server'/></td>
	</tr>
	<tr>
		<td>3.</td>
		<td>Does your program have a policy for obtaining prior approval from LSC for the acquisition or lease of assets?  </td>
		<td><span id='spnPriorApprovalPolicy' runat='server'/></td>
	    <td><span id='spnPriorApprovalPolicyScore' runat='server'/></td>
	</tr>
	<tr>
		<td>4.</td>
		<td>a. Does your program make any non-LSC subgrants?</td>
		<td><span id='spnHasSubgrants' runat='server'/></td>
	    <td><span id='spnHasSubgrantsScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>b. If yes, are the subgranted funds being used for the purpose specifically designated by the funding source?</td>
		<td><span id='spnSubgrantUsageFundingSource' runat='server'/></td>
	    <td><span id='spnSubgrantUsageFundingSourceScore' runat='server'/></td>
	</tr>
	<tr>
		<td>5.</td>
		<td>If your program makes subgrants with LSC funds, does your program conduct site visits to monitor the subgrantee operations?</td>
		<td><span id='spnSubgranteeSiteVisits' runat='server'/></td>
	    <td><span id='spnSubgranteeSiteVisitsScore' runat='server'/></td>
	</tr>
	<tr>
		<td>6.</td>
		<td>Does your program have a documented PAI allocation methodology?</td>
		<td><span id='spnPAIAllocationMeth' runat='server'/></td>
	    <td><span id='spnPAIAllocationMethScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style="text-align:right" ><b>Part III Subtotal</b> </td>
		<td>&nbsp;</td>
		<td><b><span id='spnSubtotalPartIII' runat='server'/></b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='MinorSeparatorHdg' colspan='4'>
			Part IV Corrective Actions
		</td>
	</tr>
	<tr>
		<td style='width:20px'>&nbsp;</td>
		<td>
			<b>Inquiry</b>
		</td>
		<td>
			<b>Response</b>
		</td>
		<td style='width:20px'>
			<b>Score</b>
		</td>
	</tr>
	<tr>
		<td style='width:20px'>1.</td>
		<td>a. Within the last three years, has any other funding source conducted any fiscal-related oversight, either through an onsite visit or desk review process?</td>
		<td><span id='spnFunderRecentSiteVisit' runat='server'/></td>
	    <td><span id='spnFunderRecentSiteVisitScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>b. If yes, were there any fiscal-related corrective actions identified from that oversight?</td>
		<td><span id='spnCorrectiveActionsIdentified' runat='server'/></td>
	    <td><span id='spnCorrectiveActionsIdentifiedScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please state the funding source, as well as the finding, and describe the corrective action(s) taken. If no, or NA, please indicate same below.</td>
		<td><span id='spnCorrectiveActions' runat='server'/></td>
	    <td><span id='spnCorrectiveActionsScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style="text-align:right" ><b>Part IV Subtotal</b> </td>
		<td>&nbsp;</td>
		<td><b><span id='spnSubtotalPartIV' runat='server'/></b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='MinorSeparatorHdg' colspan='4'>
			Part V Special Grant Conditions
		</td>
	</tr>
	<tr>
		<td style='width:20px'>&nbsp;</td>
		<td>
			<b>Inquiry</b>
		</td>
		<td>
			<b>Response</b>
		</td>
		<td style='width:20px'>
			<b>Score</b>
		</td>
	</tr>
	<tr>
		<td style='width:20px'>1.</td>
		<td>As the result of any oversight within the last three years, has any other funding source imposed Special Fiscal Grant Conditions on your organization?</td>
		<td><span id='spnOtherFunderSGC' runat='server'/></td>
	    <td><span id='spnOtherFunderSGCScore' runat='server'/></td>
	</tr>
	<tr>
		<td>2.</td>
		<td>Are there any pending Special Fiscal Grant Conditions that have not been resolved?  </td>
		<td><span id='spnUnresolvedSGC' runat='server'/></td>
	    <td><span id='spnUnresolvedSGCScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please provide a copy.</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style="text-align:right" ><b>Part V Subtotal</b> </td>
		<td>&nbsp;</td>
		<td><b><span id='spnSubtotalPartV' runat='server'/></b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='MinorSeparatorHdg' colspan='4'>
			Part VI Investigatory Inquiries
		</td>
	</tr>
	<tr>
		<td style='width:20px'>&nbsp;</td>
		<td>
			<b>Inquiry</b>
		</td>
		<td>
			<b>Response</b>
		</td>
		<td style='width:20px'>
			<b>Score</b>
		</td>
	</tr>
	<tr>
		<td style='width:20px'>1.</td>
		<td>a. Has your program experienced fraud, misappropriation of funds, embezzlement, or theft within the last thirty-six months?</td>
		<td><span id='spnRecentFraud' runat='server'/></td>
	    <td><span id='spnRecentFraudScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>i. If yes, has your program reported these incidents to the LSC OIG? </td>
		<td><span id='spnFraudReportedOIG' runat='server'/></td>
	    <td><span id='spnFraudReportedOIGScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>b. Has your program recovered any of the lost funds from your insurance company?</td>
		<td><span id='spnFraudRecoveredFunds' runat='server'/></td>
	    <td><span id='spnFraudRecoveredFundsScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>i. If yes, has your program allocated back to your LSC fund account a share of those funds proportionately (in whole or part)?</td>
		<td><span id='spnFraudRecoveredReallocated' runat='server'/></td>
	    <td><span id='spnFraudRecoveredReallocatedScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style="text-align:right" ><b>Part VI Subtotal</b> </td>
		<td>&nbsp;</td>
		<td><b><span id='spnSubtotalPartVI' runat='server'/></b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='MinorSeparatorHdg' colspan='4'>
			Part VII Accounting System
		</td>
	</tr>
	<tr>
		<td style='width:20px'>&nbsp;</td>
		<td>
			<b>Inquiry</b>
		</td>
		<td>
			<b>Response</b>
		</td>
		<td style='width:20px'>
			<b>Score</b>
		</td>
	</tr>
	<tr>
		<td style='width:20px'>1.</td>
		<td>What accounting software system does your program employ in carrying out its accounting duties? (Great Plains, Lotus Spreadsheet, Axcent, etc.) Please write in the accounting software system.</td>
		<td><span id='spnAccountingSW' runat='server'/></td>
	    <td><span id='spnAccountingSWScore' runat='server'/></td>
	</tr>
	<tr>
		<td>2.</td>
		<td>Does this software have the capability to track different costs among various funding sources? </td>
		<td><span id='spnSWTrackFundSource' runat='server'/></td>
	    <td><span id='spnSWTrackFundSourceScore' runat='server'/></td>
	</tr>
	<tr>
		<td>3.</td>
		<td>a. Does the software have a general ledger module?</td>
		<td><span id='spnSWGeneralLedger' runat='server'/></td>
	    <td><span id='spnSWGeneralLedgerScore' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td>b. Does the software have the following modules (check all that apply)?</td>
		<td><span id='spnLscFiscalSWModulesInstalled' runat='server'/></td>
	    <td><span id='spnLscFiscalSWModulesInstalledScore' runat='server'/></td>
	</tr>
	<tr>
		<td>4.</td>
		<td>How many users are authorized on the software? </td>
		<td><span id='spnSWNumUsersID' runat='server'/></td>
	    <td><span id='spnSWNumUsersIDScore' runat='server'/></td>
	</tr>
	<tr>
		<td>5.</td>
		<td>Does each user have his/her own password?</td>
		<td><span id='spnSWOwnPassword' runat='server'/></td>
	    <td><span id='spnSWOwnPasswordScore' runat='server'/></td>
	</tr>
	<tr>
		<td>6.</td>
		<td>Does your program have a policy prohibiting the sharing of passwords?</td>
		<td><span id='spnSWProhibitSharingPwds' runat='server'/></td>
	    <td><span id='spnSWProhibitSharingPwdsScore' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style="text-align:right" ><b>Part VII Subtotal</b> </td>
		<td>&nbsp;</td>
		<td><b><span id='spnSubtotalPartVII' runat='server'/></b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='MinorSeparatorHdg' colspan='4'>
			Questionnaire Score
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style="text-align:right" ><b>TOTAL QUESTIONNAIRE SCORE</b> </td>
		<td>&nbsp;</td>
		<td><b><span id='spnResponseSubtotal' runat='server'/></b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='MinorSeparatorHdg' colspan='4'>
			Review
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td ><b>Reviewer's Comments</b> </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnScoreComment' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td ><b>Reviewer's score (max 30)</b> </td>
		<td>&nbsp;</td>
		<td><span id='spnScore' runat='server'/></td>
	</tr>
	<tr>
		<td class='MinorSeparatorHdg' colspan='4'>
			Total Score
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style="text-align:right" ><b>TOTAL REVIEW SCORE</b> </td>
		<td>&nbsp;</td>
		<td><b><span id='spnTotalScore' runat='server'/></b></td>
	</tr>
</table>


<br />
<table id="Table2" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr align='center'>
		<td>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	    <DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
	    </DataObject>
	   
	    <DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	    </DataObject>
	    
	   <DataObject Key='LscCompApplFiscal' DataObjectDefinitionKey='LscCompApplFiscal' Updatable='True' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='BODFinanceCommittee' Format='YesNoNull'>
					<Control ID='spnBODFinanceCommittee'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODFinanceCharterYesNoNA.Description'> 
					<Control ID='spnBODFinanceCharter'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODAuditCommittee' Format='YesNoNull'>
					<Control ID='spnBODAuditCommittee'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODAuditCharterYesNoNA.Description'> 
					<Control ID='spnBODAuditCharter'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviseBudget' Format='YesNoNull'>
					<Control ID='spnFinanceReviseBudget'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviewReport' Format='YesNoNull'>
					<Control ID='spnFinanceReviewReport'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviewAccountingPolicy' Format='YesNoNull'>
					<Control ID='spnFinanceReviewAccountingPolicy'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviewFinancialStmtsYesNo.Description'> 
					<Control ID='spnFinanceReviewFinancialStmts'
						Type='HtmlGenericControl'/>
				</DisplayProperty> 
				<DisplayProperty PropertyKey='FinanceReviewInvestmentPolicy' Format='YesNoNull'>
					<Control ID='spnFinanceReviewInvestmentPolicy'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceBoardFinancialTraining' Format='YesNoNull'>
					<Control ID='spnFinanceBoardFinancialTraining'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditBODHireAuditor' Format='YesNoNull'>
					<Control ID='spnAuditBODHireAuditor'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditBODAuditorComp' Format='YesNoNull'>
					<Control ID='spnAuditBODAuditorComp'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditBODOverseeAuditor' Format='YesNoNull'>
					<Control ID='spnAuditBODOverseeAuditor'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditReviewFinancialStmtsYesNoNA.Description'> 
					<Control ID='spnAuditReviewFinancialStmts'
						Type='HtmlGenericControl'/>
				</DisplayProperty> 
				<DisplayProperty PropertyKey='AuditBODComplaintRule' Format='YesNoNull'>
					<Control ID='spnAuditBODComplaintRule'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditBODReview990' Format='YesNoNull'>
					<Control ID='spnAuditBODReview990'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditBODEnsureEthics' Format='YesNoNull'>
					<Control ID='spnAuditBODEnsureEthics'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODGAAP' Format='YesNoNull'>
					<Control ID='spnBODGAAP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODGAAPStatements' Format='YesNoNull'>
					<Control ID='spnBODGAAPStatements'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODControls' Format='YesNoNull'>
					<Control ID='spnBODControls'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODRuleInterp' Format='YesNoNull'>
					<Control ID='spnBODRuleInterp'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CashFlowMonthly' Format='YesNoNull'>
					<Control ID='spnCashFlowMonthly'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrepareFinRpts' Format='YesNoNull'>
					<Control ID='spnPrepareFinRpts'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscFinancialReportfreqLKP.Description'> 
					<Control ID='spnFinancialReportFrequencyID'
						Type='HtmlGenericControl'/>
				</DisplayProperty> 
				<DisplayProperty PropertyKey='BudgetCtrlMthly' Format='YesNoNull'>
					<Control ID='spnBudgetCtrlMthly'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExplainBudgetVar' Format='YesNoNull'>
					<Control ID='spnExplainBudgetVar'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExplainBudgetVarMngt' Format='YesNoNull'>
					<Control ID='spnExplainBudgetVarMngt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExplainBudgetVarBOD' Format='YesNoNull'>
					<Control ID='spnExplainBudgetVarBOD'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExplainBudgetVarIPA' Format='YesNoNull'>
					<Control ID='spnExplainBudgetVarIPA'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscFiscalRoleLKP.Description'> 
					<Control ID='spnFRPTitleID'
						Type='HtmlGenericControl'/>
				</DisplayProperty> 
				<DisplayProperty PropertyKey='FRPTitleOther'>
					<Control ID='spnFRPTitleOther'
						Type='HtmlGenericControl'/>
				 </DisplayProperty>

				<DisplayProperty PropertyKey='FRPQualificationOther'>
					<Control ID='spnFRPQualificationOther'
						Type='HtmlGenericControl'/>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='LscACCTGExpLKP.Description'> 
					<Control ID='spnFRPAcctgExperienceID'
						Type='HtmlGenericControl'/>
				</DisplayProperty> 
				<DisplayProperty PropertyKey='LscFinancialTrngIntLKP.Description'> 
					<Control ID='spnFRPMostRecentLscTrngID'
						Type='HtmlGenericControl'/>
				</DisplayProperty> 
				<DisplayProperty PropertyKey='FRPBackgroundCheck' Format='YesNoNull'>
					<Control ID='spnFRPBackgroundCheck'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FRPFinancialIssuesYesNoNA.Description'> 
					<Control ID='spnFRPFinancialIssues'
						Type='HtmlGenericControl'/>
				</DisplayProperty> 
				<DisplayProperty PropertyKey='PolicyFiveDaysVacation' Format='YesNoNull'>
					<Control ID='spnPolicyFiveDaysVacation'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VacationOtherEmployee' Format='YesNoNull'>
					<Control ID='spnVacationOtherEmployee'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AccountingManualRevisedYesNoNA.Description'> 
					<Control ID='spnAccountingManualRevised'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PriorApprovalPolicy' Format='YesNoNull'>
					<Control ID='spnPriorApprovalPolicy'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='HasSubgrants' Format='YesNoNull'>
					<Control ID='spnHasSubgrants'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgrantUsageFundingSourceYesNoNA.Description'> 
					<Control ID='spnSubgrantUsageFundingSource'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeSiteVisitsYesNoNA.Description'> 
					<Control ID='spnSubgranteeSiteVisits'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PAIAllocationMeth' Format='YesNoNull'>
					<Control ID='spnPAIAllocationMeth'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FunderRecentSiteVisit' Format='YesNoNull'>
					<Control ID='spnFunderRecentSiteVisit'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrectiveActionsIdentifiedYesNoNA.Description'> 
					<Control ID='spnCorrectiveActionsIdentified'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrectiveActions'>
					<Control ID='spnCorrectiveActions' 
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherFunderSGCYesNoNA.Description'> 
					<Control ID='spnOtherFunderSGC'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='UnresolvedSGCYesNoNA.Description'> 
					<Control ID='spnUnresolvedSGC'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecentFraud' Format='YesNoNull'>
					<Control ID='spnRecentFraud'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FraudReportedOIGYesNoNA.Description'> 
					<Control ID='spnFraudReportedOIG'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FraudRecoveredFundsYesNoNA.Description'> 
					<Control ID='spnFraudRecoveredFunds'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FraudRecoveredReallocatedYesNoNA.Description'> 
					<Control ID='spnFraudRecoveredReallocated'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AccountingSW'>
					<Control ID='spnAccountingSW'
						Type='HtmlGenericControl'/>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='SWTrackFundSource' Format='YesNoNull'>
					<Control ID='spnSWTrackFundSource'
						Type='HtmlGenericControl'/>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='SWGeneralLedger' Format='YesNoNull'>
					<Control ID='spnSWGeneralLedger'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscFiscalSWNumUsersLKP.Description'> 
					<Control ID='spnSWNumUsersID'
						Type='HtmlGenericControl'/>
				</DisplayProperty> 
				<DisplayProperty PropertyKey='SWOwnPassword' Format='YesNoNull'>
					<Control ID='spnSWOwnPassword'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWProhibitSharingPwds' Format='YesNoNull'>
					<Control ID='spnSWProhibitSharingPwds'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscFiscalIntCtlsInstituted' DataObjectDefinitionKey='LscFiscalIntCtlsInstituted' Updatable='True' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscCompApplFiscal' DataObjectPropertyKey='LscCompApplFiscalID' PropertyKey='LscCompApplFiscalID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='lstLscFiscalIntCtlsInstituted'
						Type='cDataListCtl'
						Container='spnLscFiscalIntCtlsInstituted'>
						<DisplayProperty PropertyKey='LscFiscalInternalCtlAreaLKP.Description' ColumnHeader='Control' Width='200px'/>
						<DisplayProperty PropertyKey='IsInstituted' Format='YesNoNull' ColumnHeader='Instituted?' Width='20px'/>
						<DisplayProperty PropertyKey='DateLastUpdated' Format='M/d/yyyy' ColumnHeader='Last updated' Width='50px'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscFRPFiscalQualification' DataObjectDefinitionKey='LscFRPFiscalQualification' Updatable='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscCompApplFiscal' DataObjectPropertyKey='LscCompApplFiscalID' PropertyKey='LscCompApplFiscalID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='lstLscFRPFiscalQualification'
						Type='cDataListCtl'
						Container='spnLscFRPFiscalQualification'
						ShowColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='LscFiscalQualificationLKP.Description'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscFiscalSWModulesInstalled' DataObjectDefinitionKey='LscFiscalSWModulesInstalled' Updatable='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscCompApplFiscal' DataObjectPropertyKey='LscCompApplFiscalID' PropertyKey='LscCompApplFiscalID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='lstLscFiscalSWModulesInstalled'
						Container='spnLscFiscalSWModulesInstalled'
						Type='cDataListCtl'
						ShowColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='LscFiscalSWModuleLKP.Description'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscCompAppFiscalScore' DataObjectDefinitionKey='LscCompAppFiscalScore'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscCompApplFiscal' DataObjectPropertyKey='LscCompApplFiscalID' PropertyKey='LscCompApplFiscalID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='BODFinanceCommittee'>
					<Control ID='spnBODFinanceCommitteeScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODFinanceCharter'>
					<Control ID='spnBODFinanceCharterScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODAuditCommittee'>
					<Control ID='spnBODAuditCommitteeScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODAuditCharter'>
					<Control ID='spnBODAuditCharterScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviseBudget'>
					<Control ID='spnFinanceReviseBudgetScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviewReport'>
					<Control ID='spnFinanceReviewReportScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviewAccountingPolicy'>
					<Control ID='spnFinanceReviewAccountingPolicyScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviewFinancialStmts'>
					<Control ID='spnFinanceReviewFinancialStmtsScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviewInvestmentPolicy'>
					<Control ID='spnFinanceReviewInvestmentPolicyScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceBoardFinancialTraining'>
					<Control ID='spnFinanceBoardFinancialTrainingScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditBODHireAuditor'>
					<Control ID='spnAuditBODHireAuditorScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditBODAuditorComp'>
					<Control ID='spnAuditBODAuditorCompScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditBODOverseeAuditor'>
					<Control ID='spnAuditBODOverseeAuditorScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditReviewFinancialStmts'>
					<Control ID='spnAuditReviewFinancialStmtsScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditBODComplaintRule'>
					<Control ID='spnAuditBODComplaintRuleScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditBODReview990'>
					<Control ID='spnAuditBODReview990Score'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditBODEnsureEthics'>
					<Control ID='spnAuditBODEnsureEthicsScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODGAAP'>
					<Control ID='spnBODGAAPScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODGAAPStatements'>
					<Control ID='spnBODGAAPStatementsScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODControls'>
					<Control ID='spnBODControlsScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODRuleInterp'>
					<Control ID='spnBODRuleInterpScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CashFlowMonthly'>
					<Control ID='spnCashFlowMonthlyScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrepareFinRpts'>
					<Control ID='spnPrepareFinRptsScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinancialReportFrequency'>
					<Control ID='spnFinancialReportFrequencyScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BudgetCtrlMthly'>
					<Control ID='spnBudgetCtrlMthlyScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExplainBudgetVarMngt'>
					<Control ID='spnExplainBudgetVarMngtScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExplainBudgetVarBOD'>
					<Control ID='spnExplainBudgetVarBODScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExplainBudgetVarIPA'>
					<Control ID='spnExplainBudgetVarIPAScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FRPFiscalQualifications'>
					<Control ID='spnFRPFiscalQualificationsScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FRPAcctgExperience'>
					<Control ID='spnFRPAcctgExperienceIDScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FRPMostRecentLscTrng'>
					<Control ID='spnFRPMostRecentLscTrngScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FRPBackgroundCheck'>
					<Control ID='spnFRPBackgroundCheckScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PolicyFiveDaysVacation'>
					<Control ID='spnPolicyFiveDaysVacationScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VacationOtherEmployee'>
					<Control ID='spnVacationOtherEmployeeScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AccountingManualRevised'>
					<Control ID='spnAccountingManualRevisedScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PriorApprovalPolicy'>
					<Control ID='spnPriorApprovalPolicyScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgrantUsageFundingSource'>
					<Control ID='spnSubgrantUsageFundingSourceScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeSiteVisits'>
					<Control ID='spnSubgranteeSiteVisitsScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PAIAllocationMeth'>
					<Control ID='spnPAIAllocationMethScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FunderRecentSiteVisit'>
					<Control ID='spnFunderRecentSiteVisitScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrectiveActionsIdentified'>
					<Control ID='spnCorrectiveActionsIdentifiedScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherFunderSGC'>
					<Control ID='spnOtherFunderSGCScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecentFraud'>
					<Control ID='spnRecentFraudScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWTrackFundSource'>
					<Control ID='spnSWTrackFundSourceScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWGeneralLedger'>
					<Control ID='spnSWGeneralLedgerScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='swownpassword'>
					<Control ID='spnswownpasswordScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWProhibitSharingPwds'>
					<Control ID='spnSWProhibitSharingPwdsScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscCompAppFiscalScoreByPart' DataObjectDefinitionKey='LscCompAppFiscalScoreByPart'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscCompApplFiscal' DataObjectPropertyKey='LscCompApplFiscalID' PropertyKey='LscCompApplFiscalID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SubtotalPartI'>
					<Control ID='spnSubtotalPartI'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubtotalPartII'>
					<Control ID='spnSubtotalPartII'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubtotalPartIII'>
					<Control ID='spnSubtotalPartIII'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubtotalPartIV'>
					<Control ID='spnSubtotalPartIV'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubtotalPartV'>
					<Control ID='spnSubtotalPartV'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubtotalPartVI'>
					<Control ID='spnSubtotalPartVI'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubtotalPartVII'>
					<Control ID='spnSubtotalPartVII'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewCompApplOCEStaff' DataObjectDefinitionKey='LscReviewCompApplOCEStaff' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ScoreComment'>
					<Control ID='txtScoreComment'
						Container='spnScoreComment'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Score'>
					<Control ID='txtScore'
						Container='spnScore'
						Type='cTextBox'
						Size='5'
						MaxLength='8'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='1'
							MaximumValue='30'
							ErrorMessage='The score must be a whole number between 1 and 30.'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscCompAppFiscalScoreTotal' DataObjectDefinitionKey='LscCompAppFiscalScoreTotal'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ResponseSubtotal'>
					<Control ID='spnResponseSubtotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TotalScore'>
					<Control ID='spnTotalScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	    <DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							EnterKey='True'>							
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Continue'
						Save='False'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument PropertyKey='WfTaskID' Value='102'/>
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Application PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
				
	</ModuleSection>
</span>