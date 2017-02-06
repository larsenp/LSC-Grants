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
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg'>Fiscal Grantee Funding Application</div>
<br />
<div style='width:900' class='MinorSeparatorHdg'>Part I Board of Directors/Management Involvement</div>
<br />
<table style='width:800px'>
	<tr>
		<td style='width:20px'>1.</td>
		<td>Has your governing body, the Board of Directors ("BOD"), established a Finance Committee?<%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnBODFinanceCommittee' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. If yes, does this committee have a charter or other written description of its duties?  <%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnBODFinanceCharter' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>2.</td>
		<td>Has your governing body, the BOD, established an Audit Committee?<%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnBODAuditCommittee' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. If yes, does this committee have a charter or other written description of its duties?  <%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnBODAuditCharter' runat='server'/></td>
	</tr>
	<tr>
		<td colspan='2'>
			<em>If you answered "Yes" to questions 1 or 2, skip to question 4.</em>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>3.</td>
		<td>Has your governing body, the BOD, established a combined Audit/Finance Committee?<%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnBODAuditFinance' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. If yes, does the committee have a charter or other written description of its duties?  <%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnBODAuditFinanceCharter' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>4.</td>
		<td>Does a governing body/committee review the annual budget?<%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnFinanceReviseBudget' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify which body/committee is responsible: <span runat='server' id='spnBudgetReviewBody'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify when the review takes place and what it entails: <span runat='server' id='spnBudgetReviewDetails'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>5.</td>
		<td>Does a governing body/committee review management reports (including budgeted and actual income and expenses, variances, and a statement of cash on hand)?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnFinanceReviewReport' runat='server'/></td>
	</tr>
	<tr>
		<td colspan='2'>
			<em>If you answered "No" to question 5, skip to question 6.</em>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify which body/committee is responsible: <span runat='server' id='spnFinanceReportReviewBody'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify the types of reports reviewed: <span runat='server' id='spnFinanceReportReviewDetails'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. How often are management reports reviewed? Check only one answer.</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnLscFinanceReportReviewIntervalID'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If other, specify: <span runat='server' id='spnFinanceReportReviewIntervalOther'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>b. Does a governing body/committee review accounting and control policies and make recommendations for changes and Improvements?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnFinanceReviewAccountingPolicy' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify which body/committee is responsible: <span runat='server' id='spnFinanceReviewAccountingPolicyBody'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify the process and how it is memorialized: <span runat='server' id='spnFinanceReviewAccountingPolicyProcess'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>c. How often are accounting and control policies reviewed and recommendations made for changes and improvements?  Check only one answer.<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnLscAcctgCtrlPolicyReviewIntervalID' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If other, specify: <span runat='server' id='spnAcctgCtrlPolicyReviewIntervalOther'/></td>
	</tr>
	<tr>
		<td>6.</td>
		<td>Does a governing body/committee review the audited financial statements and the management letter with management and the auditor? <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnFinanceReviewFinancialStmts' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify which body/committee is responsible: <span runat='server' id='spnFinanceReviewFinancialStmtsBody'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify when this is done and the process: <span runat='server' id='spnFinanceReviewFinancialStmtsProcess'/></td>
	</tr>
	<tr>
		<td>7.</td>
		<td>Does a governing body/committee regularly review and make recommendations about investment policies? <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnFinanceReviewInvestmentPolicy' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify: <span runat='server' id='spnFinanceReviewInvestmentPolicyBody'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>8.</td>
		<td>Has the governing body/committee received training on its responsibilities under the LSC Accounting Manual?  <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnLscAcctManualTraining' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. If yes, when was the last time a member of the governing body/committee received training?  Check only one answer. <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnLscAcctManualLastTrainingID' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>b.  As new members join the Board, is financial training part of the orientation process? <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnLscAcctManualTrainingOrientation' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>9.</td>
		<td>Who is primarily responsible for managing the process of selecting the recipient’s auditor, including recommending to the governing body the appointment of a particular auditor? Check only one answer.<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnAuditorSelectionBodyID' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If other, specify: <span runat='server' id='spnAuditorSelectionBodyOther'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>10.</td>
		<td>Who approves the compensation of the auditor? Check only one answer. <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnAuditorSetCompensationBodyID' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If other, specify: <span runat='server' id='spnAuditorSetCompensationBodyOther'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>11.</td>
		<td>To whom does the auditor report its findings? Check only one answer.<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnAuditorOversightBodyID' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If other, specify: <span runat='server' id='spnAuditorOversightBodyOther'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>12.</td>
		<td>How often is a solicitation performed for a new lead auditor? Check only one answer.<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnLscAuditorSolicitationIntervalID' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. How often is the concurring audit partner assigned to the program changed? Check only one answer. <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnLscAuditPartnerChangeIntervalID' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>13.</td>
		<td>Does a governing body/committee set the rules and processes for addressing issues or concerns raised by the Independent Public Accountants (“IPA”) regarding accounting and/or internal control practices?  <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnSetIpaRules' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify which body/committee is responsible: <span runat='server' id='spnSetIpaRulesBody'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify the process: <span runat='server' id='spnSetIpaRulesProcess'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>14.</td>
		<td>Prior to filing, does a governing body/committee review the annual IRS Form 990 for completeness, accuracy, and on-time filing? <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnReviewForm990' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify which body/committee is responsible: <span runat='server' id='spnReviewForm990Body'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify when this is done and the process: <span runat='server' id='spnReviewForm990Process'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>15.</td>
		<td>Does a governing body/committee set and/or review the compensation of the Chief Executive Officer/Executive Director? <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnReviewCeoCompensation' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify which body/committee is responsible: <span runat='server' id='spnReviewCeoCompensationBody'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify when this is done and the process: <span runat='server' id='spnReviewCeoCompensationProcess'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>16.</td>
		<td>Please indicate which of the following were used to establish the compensation for the Chief Executive Officer/Executive Director.  Check all that apply. </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnCeoCompensationJustification'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If other, specify: <span runat='server' id='spnCeoCompensationJustificationOther'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. Pursuant to your response above, when was the most recent Board review and approval of the Chief Executive Officer’s/Executive Director’s compensation?  Check only one answer.</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnLscCeoCompensationLastReviewID'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>17.</td>
		<td>Does a governing body/committee ensure that your program has written procedures in place requiring that operations be conducted in an ethical and honest manner; comply with applicable laws, regulations and policies; manage resources and risks effectively; and hold persons within your organization accountable for their actions? <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnAuditBODEnsureEthics' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify which body/committee is responsible, as well as the process: <span runat='server' id='spnAuditBODEnsureEthicsBody'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style='width:20px'>18.</td>
		<td>Do any members of the BOD  have expertise in, or does the BOD have access to a financial expert whose expertise includes an understanding of, the following matters:</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. Generally Accepted Accounting Principles ("GAAP"), including fund accounting;<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnBODGAAP' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>b. The capacity to apply GAAP in connection with preparing and auditing financial statements;<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnBODGAAPStatements' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>c. Familiarity with developing and implementing internal financial controls and procedures;<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnBODControls' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>d. Understanding the implications of different interpretations of accounting rules <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnBODRuleInterp' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>19.</td>
		<td>Are all of the following  financial reports prepared for management review:<%=kDenoteRequiredField%></td>
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
		<td>c. Statement of Cash Flows/Cash on Hand </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnPrepareFinRpts' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>20.</td>
		<td>How frequently are these financial reports prepared? Check only one answer.<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnFinancialReportFrequencyID' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>21.</td>
		<td>Does your program have established budgetary controls that allow for the program director to control expenditures by reviewing regular reports that reflect actual revenue and expenditures (by natural line item/classification) compared to the approved budget?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnBudgetCtrlMthly' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>22.</td>
		<td>Does management review budget variances that exceed a 10% threshold on a monthly basis?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnExplainBudgetVarMngt' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. Who prepares the variance analysis for Management?  Check all that apply.<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnLscVarianceAnalysisPreparerMgmt' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If other, specify: <span runat='server' id='spnVarianceAnalysisPreparerMgmtOther'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>b. Who prepares the variance analysis for the IPA?  Check all that apply.<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnLscVarianceAnalysisPreparerIpa' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If other, specify: <span runat='server' id='spnVarianceAnalysisPreparerIpaOther'/></td>
	</tr>
	<tr>
		<td>23.</td>
		<td>Are the Executive Directors' expense reports, credit card statements, and travel
reimbursements reviewed and approved by a member of the Board of Directors? <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnEDExpenseReview' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, please specify when this review/approval takes place: <span runat='server' id='spnEDExpenseReviewSchedule'/></td>
	</tr>
</table>
<br />
<div style='width:900' class='MinorSeparatorHdg'>Part II Profile of Financial Employees</div>
<br />
<table style='width:800px'>
	<tr>
		<td style='width:20px'>1.</td>
		<td>Please indicate the title of the individual who is responsible for the program’s financial operations:<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnFRPTitleID' runat='server'/></td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
	   <td>If other, specify: <span id='spnFRPTitleOther' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>2.</td>
		<td>Please check all that apply for this individual:<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnLscFRPFiscalQualification' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>3.</td>
		<td>Please indicate this person’s level of experience in accounting: Check only one answer<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnFRPAcctgExperienceID' runat='server'/></td>
	</tr>
	<tr>
		<td>4.</td>
		<td>Please indicate if this person has received training relating to LSC’s fiscal regulations and implementing guidance within the past: Check only one answer. <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnFRPMostRecentLscTrngID' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If other, specify: <%=kDenoteRequiredField%> <span id='spnFRPMostRecentLscTrngOther' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Please briefly describe the type of training provided to the individual above.</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnFRPMostRecentLscTrngDesc' runat='server'/></td>
	</tr>
	<tr>
		<td>5.</td>
		<td>At the time of hire, did this person undergo a background check?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnFRPBackgroundCheck' runat='server'/></td>
	</tr>
	<tr>
		<td colspan='2'>
			<em>If you answered "No" to question 5, skip question 5a and choose "N/A" for questions 5b and 5c.</em>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. Which of the following areas of inquiry were included in the background check conducted?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnLscFRPBackgroundCheckAreasInquiry' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>b. Did the background check reveal any financial concerns within the previous five (5) years?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnFRPFinancialIssues' runat='server'/></td>
	</tr>
	<tr>
		<td colspan='2'>
			<em>If you answered "No" to question 5b, skip to question 6.</em>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>c. Were those concerns satisfactorily addressed?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnFRPFinancialIssuesAddressed' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Please explain the issue(s) and the resolution.<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnFRPFinancialIssuesExplanation' runat='server'/></td>
	</tr>
	<tr>
		<td>6.</td>
		<td>Does your program have a policy that requires financial employees to take five (5) consecutive days of vacation annually?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnPolicyFiveDaysVacation' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If yes, a. In their absence does (do) another employee(s) perform their duties during this vacation period?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnVacationOtherEmployeeInt' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>b.  Is remote access, other than email, terminated during their vacation period?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnVacationRemoteAccess' runat='server'/></td>
	</tr>
</table>
<br />
<div style='width:900' class='MinorSeparatorHdg'>Part III Accounting Manual</div>
<br />
<table style='width:800px'>
	<tr>
		<td style='width:20px'>1.</td>
		<td>Has your program updated its accounting manual to be consistent with the Accounting Guide for LSC Recipients (2010 Ed.)? <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnAccountingManualRevised' runat='server'/></td>
	</tr>
	<tr>
		<td>2.</td>
		<td>Which of the following written policies and/or procedures have been incorporated in your accounting manual or other guidance? Check all that apply.<%=kDenoteRequiredField%> For any policy checked below which is not included in the Accounting Manual/Fiscal Policies and Procedures upload in response to the required documents, please upload the policy with an appropriate name/title.</td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnLscFiscalIntCtlsInstituted' runat='server'/></td>
	</tr>
	<tr>
		<td>3.</td>
		<td>Does your program have a policy for obtaining prior approval from LSC for the acquisition or lease of assets over $10,000 in accordance with 45 CFR § 1630.5 and LSC’s Property Acquisition and Management Manual, Section 3?  <%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnPriorApprovalPolicy' runat='server'/></td>
	</tr>
	<tr>
		<td>4.</td>
		<td>Does your program make subgrants using LSC funds?<%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnHasLscSubgrants' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>a. If yes, does your program: <%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td style="padding-left:50px">1.	Conduct on-site visits of the subrecipient(s), on at least an annual basis <span runat='server' id='spnSubgranteeSiteVisits' /></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td style="padding-left:50px">2.	Review monthly financial reports submitted by the subrecipient <span runat='server' id='spnSubgranteeFinRptReview'/></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td style="padding-left:50px">3.	Review the subrecipient’s audited financial statements <span runat='server' id='spnSubgranteeFinStmtReview'/></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td style="padding-left:50px">4.	Review the subrecipient’s cost-allocation policy as it relates to both the subrecipient attorneys’ salaries and salaries of other personnel <span runat='server' id='spnSubgranteeCostAllocReview'/></td>
	</tr>
	<tr>
		<td>5.</td>
		<td>Does your program have a documented cost-allocation policy that is defined by natural line item/classification for both direct and indirect expenses?<%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnCostAllocationPolicy' runat='server'/></td>
	</tr>
	<tr>
		<td>6.</td>
		<td>Does your program have a documented PAI method/policy including direct and indirect cost allocation?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnPAIAllocationMeth' runat='server'/></td>
	</tr>
	<tr>
		<td>7.</td>
		<td>When was the most recent physical inventory of property and fixed assets completed (month and year)?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnMostRecentInventory' runat='server'/></td>
	</tr>
</table>
<br />
<div style='width:900' class='MinorSeparatorHdg'>Part IV Fiscal Oversight by Other Funders</div>
<br />
<table style='width:800px'>
	<tr>
		<td style='width:20px'>1.</td>
		<td>When was the last time a non-LSC funding source(s) conducted a review of your financial position/records? [Check only one answer.] <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnLscFunderMostRecentSiteVisitID' runat='server'/></td>
	</tr>
	<tr>
		<td >&nbsp;</td>
		<td>If more than 5 years, specify: <span id='spnFunderMostRecentSiteVisitSpecify' runat='server'/></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td></td>
	</tr>
	<tr>
		<td>2.</td>
		<td>At that time, were any fiscal-related issues or concerns identified?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnCorrectiveActionsIdentified' runat='server'/></td>
	</tr>
	<tr>
		<td colspan='2'>
			<em>If you answered "No" to question 2, select "N/A" for question 3, then skip to Part V.</em>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>3.</td>
		<td>Have the fiscal-related issues or concerns been resolved?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnCorrectiveActionsResolved' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>4.</td>
		<td>Please state the funding source and describe the issues or concerns and how they were corrected:<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnCorrectiveActions' runat='server'/></td>
	</tr>
</table>
<br />

<div style='width:900' class='MinorSeparatorHdg'>Part V Financial Management</div>
<br />
<table style='width:800px'>
	<tr>
		<td style='width:20px'>1.</td>
		<td>If your program reported a LSC net asset deficit balance on its most recent audited financial statements, has the deficit been liquidated?  [Check only one answer.] <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnLscDeficitStatusID' runat='server'/></td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
		<td>a. If answer to question 1 is "Yes" or "In Progress", will/were LSC funds used to liquidate the deficit balance? <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
		<td><span id='spnDeficitLiquidatedLscFunds' runat='server'/></td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
		<td>
			b. If answer to question 1 is "No," please explain how and when the deficit will be liquidated:
		</td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
		<td>
			<span runat='server' id='spnDeficitLiquidatedHow'/>
		</td>
	</tr>
	<tr>
		<td >2.</td>
		<td>Did your program report a (positive) LSC net asset fund balance (excluding one-time and special purpose grants) on your most recent audited financial statements?  <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnNetAssetFundBalance' runat='server'/></td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
		<td>a. Indicate the range of your LSC net asset fund balance.  Check only one answer.<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
		<td><span id='spnLscNetAssetFundBalanceRangeID' runat='server'/></td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
		<td>b.  Was your program granted an LSC net asset fund balance waiver?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
		<td><span id='spnNetAssetFundBalanceWaiver' runat='server'/></td>
	</tr>
	<tr>
		<td colspan='2'>
			<em>If you answered "No" to question 2b, select "N/A" for question 2c.</em>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
		<td>c. Indicate the ratio of your LSC net asset fund balance to LSC Support which prompted the waiver. Check only one answer. <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
		<td><span id='spnLscNetAssetFundBalanceRangeWaiverID' runat='server'/></td>
	</tr>
	<tr>
		<td >3.</td>
		<td>Within the last fiscal period covered by your most recent audited financial statements, what percentage of your program’s total annual revenue and support was spent on the direct delivery of program services?  Check only one answer.  <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnLSCFundingSvcDeliveryPctID' runat='server'/></td>
	</tr>
</table>
<br />

<div style='width:900' class='MinorSeparatorHdg'>Part VI Investigatory Inquiries</div>
<br />
<table style='width:800px'>
	<tr>
		<td style='width:20px'>1.</td>
		<td colspan='2'>Has your program experienced any of the following within the last three (3) years? Check all that apply<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
	   <td>Fraud</td>
	   <td><span id='spnExpFraud' runat='server'/></td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
	   <td>Misappropriation of Funds</td>
	   <td><span id='spnExpMisapprop' runat='server'/></td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
	   <td>Embezzlement</td>
	   <td><span id='spnExpEmbezzlement' runat='server'/></td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
	   <td>Theft (time, cash, equipment, etc.)</td>
	   <td><span id='spnExpTheft' runat='server'/></td>
	</tr>
	<tr>
		<td colspan='2'><em>If you answered “No” to all of the above questions, skip to Question 4.</em></td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
	</tr>
	<tr>
		<td>2.</td>
		<td colspan='2'>If you answered “Yes” to any of the above, did your program report  incidents in which the loss was $200 or more to the LSC OIG within two (2) business days of identifying the incident? <%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
		<td colspan='2'><span id='spnFraudReportedOIG' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan='2'>a. Did your program report the incident to Federal, State, or Local authorities upon discovery of the incident? <%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
		<td colspan='2'><span id='spnFraudReportedAuthorities' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan='2'>b. If yes, please describe the nature of the incident and what actions were taken by the program. <%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
	   <td>&nbsp;</td>
		<td colspan='2'><span id='spnFraudDesc' runat='server'/></td>
	</tr>
	<tr>
		<td>3.</td>
		<td colspan='2'>Has your program recovered any of the lost grant funds from your insurance company?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td colspan='2'><span id='spnFraudRecoveredFunds' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan='2'>a. If yes (see above), has your program allocated back to your LSC fund account a proportionate share of those funds (in whole or part)?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td colspan='2'><span id='spnFraudRecoveredReallocated' runat='server'/></td>
	</tr>
	<tr>
		<td>4.</td>
		<td colspan='2'>Based on LSC’s previous fiscal year grant award, what range does the fidelity bond insurance limit fall within? (Check only one answer.) <%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td colspan='2'><span id='spnLscFraudInsurancePolicyLimitID' runat='server'/></td>
	</tr>
</table>
<br />
<div style='width:900' class='MinorSeparatorHdg'>Part VII Accounting System</div>
<br />
<table style='width:800px'>
	<tr>
		<td style='width:20px'>1.</td>
		<td>What accounting software system does your program employ in carrying out its accounting duties? (Great Plains, MIP, Peachtree, etc.)</td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td>Please write in the accounting software system <%=kDenoteRequiredField%><span id='spnAccountingSW' runat='server'/></td>
	</tr>
	<tr>
		<td>2.</td>
		<td>Does this software have the capability to track different costs among various funding sources?<%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnSWTrackFundSource' runat='server'/></td>
	</tr>
	<tr>
		<td>3.</td>
		<td>Which of the following accounting software application modules does your program utilize? Check all that apply.<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnLscFiscalSWModulesInstalled' runat='server'/></td>
	</tr>
	<tr>
		<td>4.</td>
		<td>How many users are authorized on the software?<%=kDenoteRequiredField%> </td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnSWNumUsersID' runat='server'/></td>
	</tr>
	<tr>
		<td>5.</td>
		<td>Does each user have his/her own password security based on their fiscal functions?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnSWOwnPassword' runat='server'/></td>
	</tr>
	<tr>
		<td>6.</td>
		<td>Does the computer network have robust and updated security processes, firewalls, anti-virus protection, spyware protection, and intrusion detection software?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnNetworkSecurity' runat='server'/></td>
	</tr>
	<tr>
		<td>7.</td>
		<td>How often is the accounting system data backed-up?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnLscFinDataBackupIntervalID' runat='server'/></td>
	</tr>
	<tr>
		<td>8.</td>
		<td>Are all financial records, supporting documents, statistical records, and all other records pertinent to LSC’s grant award retained for at least three (3) years after the grant award?<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
		<td><span id='spnFinRecordRetention' runat='server'/></td>
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
	    
		<DataObject Key='LscInsLscCompApplFiscal' DataObjectDefinitionKey='LscInsLscCompApplFiscal'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='OrganizationID' PropertyKey='organization_id' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='time_period_id' />
			</Filters>
		</DataObject>
		
	   <DataObject Key='LscCompApplFiscal' DataObjectDefinitionKey='LscCompApplFiscal' Updatable='True' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='BODFinanceCommittee'>
					<Control ID='ctlBODFinanceCommittee'
						Container='spnBODFinanceCommittee'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='BODFinanceCharter'>
					<Control ID='ctlBODFinanceCharter'
						Container='spnBODFinanceCharter'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='BODFinanceCharter'> 
					<Control ID='ctlBODFinanceCharter'
						Container='spnBODFinanceCharter'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODAuditCommittee'>
					<Control ID='ctlBODAuditCommittee'
						Container='spnBODAuditCommittee'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='BODAuditCharter'>
					<Control ID='ctlBODAuditCharter'
						Container='spnBODAuditCharter'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='BODAuditCharter'> 
					<Control ID='ctlBODAuditCharter'
						Container='spnBODAuditCharter'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODAuditFinance'> 
					<Control ID='ctlBODAuditFinance'
						Container='spnBODAuditFinance'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODAuditFinanceCharter'> 
					<Control ID='ctlBODAuditFinanceCharter'
						Container='spnBODAuditFinanceCharter'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviseBudget'>
					<Control ID='ctlFinanceReviseBudget'
						Container='spnFinanceReviseBudget'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BudgetReviewBody'>
					<Control ID='txtBudgetReviewBody'
						Container='spnBudgetReviewBody'
						Type='cTextBox'
						Size='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BudgetReviewDetails'>
					<Control ID='txtBudgetReviewDetails'
						Container='spnBudgetReviewDetails'
						Type='cTextBox'
						Size='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviewReport'>
					<Control ID='ctlFinanceReviewReport'
						Container='spnFinanceReviewReport'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReportReviewBody'>
					<Control ID='txtFinanceReportReviewBody'
						Container='spnFinanceReportReviewBody'
						Type='cTextBox'
						Size='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReportReviewDetails'>
					<Control ID='txtFinanceReportReviewDetails'
						Container='spnFinanceReportReviewDetails'
						Type='cTextBox'
						Size='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscFinanceReportReviewIntervalID'> 
					<Control ID='ctlLscFinanceReportReviewIntervalID'
						Container='spnLscFinanceReportReviewIntervalID'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscFinanceReportReviewInterval'
						StoredValue='LscFinanceReportReviewIntervalID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReportReviewIntervalOther'>
					<Control ID='txtFinanceReportReviewIntervalOther'
						Container='spnFinanceReportReviewIntervalOther'
						Type='cTextBox'
						Size='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviewAccountingPolicy'>
					<Control ID='ctlFinanceReviewAccountingPolicy'
						Container='spnFinanceReviewAccountingPolicy'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviewAccountingPolicyBody'>
					<Control ID='txtFinanceReviewAccountingPolicyBody'
						Container='spnFinanceReviewAccountingPolicyBody'
						Type='cTextBox'
						Size='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviewAccountingPolicyProcess'>
					<Control ID='txtFinanceReviewAccountingPolicyProcess'
						Container='spnFinanceReviewAccountingPolicyProcess'
						Type='cTextBox'
						Size='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscAcctgCtrlPolicyReviewIntervalID'> 
					<Control ID='ctlLscAcctgCtrlPolicyReviewIntervalID'
						Container='spnLscAcctgCtrlPolicyReviewIntervalID'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscAcctgCtrlPolicyReviewInterval'
						StoredValue='LscAcctgCtrlPolicyReviewIntervalID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='AcctgCtrlPolicyReviewIntervalOther'>
					<Control ID='txtAcctgCtrlPolicyReviewIntervalOther'
						Container='spnAcctgCtrlPolicyReviewIntervalOther'
						Type='cTextBox'
						Size='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviewFinancialStmts'> 
					<Control ID='ctlFinanceReviewFinancialStmts'
						Container='spnFinanceReviewFinancialStmts'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='FinanceReviewFinancialStmtsBody'>
					<Control ID='txtFinanceReviewFinancialStmtsBody'
						Container='spnFinanceReviewFinancialStmtsBody'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviewFinancialStmtsProcess'>
					<Control ID='txtFinanceReviewFinancialStmtsProcess'
						Container='spnFinanceReviewFinancialStmtsProcess'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviewInvestmentPolicy'>
					<Control ID='ctlFinanceReviewInvestmentPolicy'
						Container='spnFinanceReviewInvestmentPolicy'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReviewInvestmentPolicyBody'>
					<Control ID='txtFinanceReviewInvestmentPolicyBody'
						Container='spnFinanceReviewInvestmentPolicyBody'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscAcctManualTraining'>
					<Control ID='ctlLscAcctManualTraining'
						Container='spnLscAcctManualTraining'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscAcctManualLastTrainingID'> 
					<Control ID='ctlLscAcctManualLastTrainingID'
						Container='spnLscAcctManualLastTrainingID'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscAcctManualLastTraining'
						StoredValue='LscAcctManualLastTrainingID'
						DisplayValue='Description'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='LscAcctManualTrainingOrientation'>
					<Control ID='ctlLscAcctManualTrainingOrientation'
						Container='spnLscAcctManualTrainingOrientation'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditorSelectionBodyID'> 
					<Control ID='ctlAuditorSelectionBodyID'
						Container='spnAuditorSelectionBodyID'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscFinancialGovBody'
						StoredValue='LscFinancialGovBodyID'
						DisplayValue='Description'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='AuditorSelectionBodyOther'>
					<Control ID='txtAuditorSelectionBodyOther'
						Container='spnAuditorSelectionBodyOther'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditorSetCompensationBodyID'> 
					<Control ID='ctlAuditorSetCompensationBodyID'
						Container='spnAuditorSetCompensationBodyID'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscFinancialGovBody'
						StoredValue='LscFinancialGovBodyID'
						DisplayValue='Description'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='AuditorSetCompensationBodyOther'>
					<Control ID='txtAuditorSetCompensationBodyOther'
						Container='spnAuditorSetCompensationBodyOther'
						Type='cTextBox'
						Size='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditorOversightBodyID'> 
					<Control ID='ctlAuditorOversightBodyID'
						Container='spnAuditorOversightBodyID'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscFinancialGovBody'
						StoredValue='LscFinancialGovBodyID'
						DisplayValue='Description'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='AuditorOversightBodyOther'>
					<Control ID='txtAuditorOversightBodyOther'
						Container='spnAuditorOversightBodyOther'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscAuditorSolicitationIntervalID'> 
					<Control ID='ctlLscAuditorSolicitationIntervalID'
						Container='spnLscAuditorSolicitationIntervalID'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscAuditorSolicitationInterval'
						StoredValue='LscAuditorSolicitationIntervalID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='LscAuditPartnerChangeIntervalID'> 
					<Control ID='ctlLscAuditPartnerChangeIntervalID'
						Container='spnLscAuditPartnerChangeIntervalID'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscAuditPartnerChangeInterval'
						StoredValue='LscAuditPartnerChangeIntervalID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='SetIpaRules'>
					<Control ID='ctlSetIpaRules'
						Container='spnSetIpaRules'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SetIpaRulesBody'>
					<Control ID='txtSetIpaRulesBody'
						Container='spnSetIpaRulesBody'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SetIpaRulesProcess'>
					<Control ID='txtSetIpaRulesProcess'
						Container='spnSetIpaRulesProcess'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewForm990'>
					<Control ID='ctlReviewForm990'
						Container='spnReviewForm990'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewForm990Body'>
					<Control ID='txtReviewForm990Body'
						Container='spnReviewForm990Body'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewForm990Process'>
					<Control ID='txtReviewForm990Process'
						Container='spnReviewForm990Process'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewCeoCompensation'>
					<Control ID='ctlReviewCeoCompensation'
						Container='spnReviewCeoCompensation'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewCeoCompensationBody'>
					<Control ID='txtReviewCeoCompensationBody'
						Container='spnReviewCeoCompensationBody'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewCeoCompensationProcess'>
					<Control ID='txtReviewCeoCompensationProcess'
						Container='spnReviewCeoCompensationProcess'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				 <DisplayProperty PropertyKey='LscCeoCompensationJustification'>
					<Control ID='ctlCeoCompensationJustification'
						Container='spnCeoCompensationJustification'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='LscCeoCompensationJustificationLKP'
						DisplayValue='Description'
						StoredValue='LscCeoCompensationJustificationLKPID'
						RepeatColumns='0'
						CellSpacing='3'
						RepeatDirection='Vertical'>
						<Sort>
							<Argument PropertyKey="SortOrder"/>
						</Sort>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='LscCompApplFiscal' DataObjectPropertyKey='LscCompApplFiscalID' PropertyKey='LscCompApplFiscalID' />
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CeoCompensationJustificationOther'>
					<Control ID='txtCeoCompensationJustificationOther'
						Container='spnCeoCompensationJustificationOther'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscCeoCompensationLastReviewID'> 
					<Control ID='ctlLscCeoCompensationLastReviewID'
						Container='spnLscCeoCompensationLastReviewID'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscCeoCompensationLastReview'
						StoredValue='LscCeoCompensationLastReviewID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='AuditBODEnsureEthics'>
					<Control ID='ctlAuditBODEnsureEthics'
						Container='spnAuditBODEnsureEthics'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditBODEnsureEthicsBody'>
					<Control ID='txtAuditBODEnsureEthicsBody'
						Container='spnAuditBODEnsureEthicsBody'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODGAAP'>
					<Control ID='ctlBODGAAP'
						Container='spnBODGAAP'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODGAAPStatements'>
					<Control ID='ctlBODGAAPStatements'
						Container='spnBODGAAPStatements'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODControls'>
					<Control ID='ctlBODControls'
						Container='spnBODControls'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BODRuleInterp'>
					<Control ID='ctlBODRuleInterp'
						Container='spnBODRuleInterp'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrepareFinRpts'>
					<Control ID='ctlPrepareFinRptsy'
						Container='spnPrepareFinRpts'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinancialReportFrequencyID'> 
					<Control ID='ctlFinancialReportFrequencyID'
						Container='spnFinancialReportFrequencyID'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscFinancialReportfreqLKP'
						StoredValue='LscFinancialReportfreqLKPID'
						DisplayValue='Description'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='BudgetCtrlMthly'>
					<Control ID='ctlBudgetCtrlMthly'
						Container='spnBudgetCtrlMthly'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExplainBudgetVarMngt'>
					<Control ID='ctlExplainBudgetVarMngt'
						Container='spnExplainBudgetVarMngt'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				 <DisplayProperty PropertyKey='LscVarianceAnalysisPreparerMgmt'>
					<Control ID='ctlLscVarianceAnalysisPreparerMgmt'
						Container='spnLscVarianceAnalysisPreparerMgmt'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='LscVarianceAnalysisPreparerMgmtLKP'
						DisplayValue='Description'
						StoredValue='LscVarianceAnalysisPreparerMgmtLKPID'
						RepeatColumns='0'
						CellSpacing='3'
						RepeatDirection='Vertical'>
						<Sort>
							<Argument PropertyKey="SortOrder"/>
						</Sort>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='LscCompApplFiscal' DataObjectPropertyKey='LscCompApplFiscalID' PropertyKey='LscCompApplFiscalID' />
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VarianceAnalysisPreparerMgmtOther'>
					<Control ID='txtVarianceAnalysisPreparerMgmtOther'
						Container='spnVarianceAnalysisPreparerMgmtOther'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				 <DisplayProperty PropertyKey='LscVarianceAnalysisPreparerIpa'>
					<Control ID='ctlLscVarianceAnalysisPreparerIpa'
						Container='spnLscVarianceAnalysisPreparerIpa'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='LscVarianceAnalysisPreparerIpaLKP'
						DisplayValue='Description'
						StoredValue='LscVarianceAnalysisPreparerIpaLKPID'
						RepeatColumns='0'
						CellSpacing='3'
						RepeatDirection='Vertical'>
						<Sort>
							<Argument PropertyKey="SortOrder"/>
						</Sort>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='LscCompApplFiscal' DataObjectPropertyKey='LscCompApplFiscalID' PropertyKey='LscCompApplFiscalID' />
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VarianceAnalysisPreparerIpaOther'>
					<Control ID='txtVarianceAnalysisPreparerIpaOther'
						Container='spnVarianceAnalysisPreparerIpaOther'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='EDExpenseReview'>
					<Control ID='ctlEDExpenseReview'
						Container='spnEDExpenseReview'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EDExpenseReviewSchedule'>
					<Control ID='txtEDExpenseReviewSchedule'
						Container='spnEDExpenseReviewSchedule'
						Type='cTextBox'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='FRPTitleID'> 
					<Control ID='ctlFRPTitleID'
						Container='spnFRPTitleID'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscFiscalRoleLKP'
						StoredValue='LscFiscalRoleLKPID'
						DisplayValue='Description'> 
						<Filters>
							<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate' Bool=''/>
							<Argument PropertyKey='EndDate' Value='' Bool='Or'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='FRPTitleOther'>
					<Control ID='ctlFRPTitleOther'
						Container='spnFRPTitleOther'
						Type='cTextBox'
						Size='50'/>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='LscFRPFiscalQualification'>
					<Control ID='ctlLscFRPFiscalQualification'
						Container='spnLscFRPFiscalQualification'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='LscFiscalQualificationLKP'
						DisplayValue='Description'
						StoredValue='LscFiscalQualificationLKPID'
						RepeatColumns='0'
						CellSpacing='3'
						RepeatDirection='Vertical'>
						<Filters>
							<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate' Bool=''/>
							<Argument PropertyKey='EndDate' Value='' Bool='Or'/>
						</Filters>
						<Sort>
							<Argument PropertyKey="SortOrder"/>
						</Sort>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='LscCompApplFiscal' DataObjectPropertyKey='LscCompApplFiscalID' PropertyKey='LscCompApplFiscalID' />
						</DefaultValues>
					</Control>
				</DisplayProperty>
				 <DisplayProperty PropertyKey='FRPAcctgExperienceID'> 
					<Control ID='ctlFRPAcctgExperienceID'
						Container='spnFRPAcctgExperienceID'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscACCTGExpLKP'
						StoredValue='LscACCTGExpLKPID'
						DisplayValue='Description'> 
						<Filters>
							<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate' Bool=''/>
							<Argument PropertyKey='EndDate' Value='' Bool='Or'/>
						</Filters>
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='FRPMostRecentLscTrngID'> 
					<Control ID='ctlFRPMostRecentLscTrngID'
						Container='spnFRPMostRecentLscTrngID'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscFinancialTrngIntLKP'
						StoredValue='LscFinancialTrngIntLKPID'
						DisplayValue='Description'> 
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='FRPMostRecentLscTrngOther'>
					<Control ID='ctlFRPMostRecentLscTrngOther'
						Container='spnFRPMostRecentLscTrngOther'
						Type='cTextBox'
						Size='50'/>
				 </DisplayProperty>
				<DisplayProperty PropertyKey='FRPMostRecentLscTrngDesc'>
					<Control ID='ctlFRPMostRecentLscTrngDesc'
						Container='spnFRPMostRecentLscTrngDesc'
						Type='cTextArea'
						Rows='4' 
						Cols='70'/>
				 </DisplayProperty>
				<DisplayProperty PropertyKey='FRPBackgroundCheck'>
					<Control ID='ctlFRPBackgroundCheck'
						Container='spnFRPBackgroundCheck'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				 <DisplayProperty PropertyKey='LscFRPBackgroundCheckAreasInquiry'>
					<Control ID='ctlLscFRPBackgroundCheckAreasInquiry'
						Container='spnLscFRPBackgroundCheckAreasInquiry'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='LscFRPBackgroundCheckAreasInquiryLKP'
						DisplayValue='Description'
						StoredValue='LscFRPBackgroundCheckAreasInquiryLKPID'
						RepeatColumns='0'
						CellSpacing='3'
						RepeatDirection='Vertical'>
						<Sort>
							<Argument PropertyKey="SortOrder"/>
						</Sort>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='LscCompApplFiscal' DataObjectPropertyKey='LscCompApplFiscalID' PropertyKey='LscCompApplFiscalID' />
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FRPFinancialIssues'> 
					<Control ID='ctlFRPFinancialIssues'
						Container='spnFRPFinancialIssues'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='FRPFinancialIssuesAddressed'> 
					<Control ID='ctlFRPFinancialIssuesAddressed'
						Container='spnFRPFinancialIssuesAddressed'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='FRPFinancialIssuesExplanation'>
					<Control ID='ctlFRPFinancialIssuesExplanation'
						Container='spnFRPFinancialIssuesExplanation'
						Type='cTextArea'
						Rows='4'
						Cols='70'/>
				 </DisplayProperty>
				<DisplayProperty PropertyKey='PolicyFiveDaysVacation'>
					<Control ID='ctlPolicyFiveDaysVacation'
						Container='spnPolicyFiveDaysVacation'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VacationOtherEmployeeInt'>
					<Control ID='ctlVacationOtherEmployeeInt'
						Container='spnVacationOtherEmployeeInt'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VacationRemoteAccess'>
					<Control ID='ctlVacationRemoteAccess'
						Container='spnVacationRemoteAccess'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AccountingManualRevised'> 
					<Control ID='ctlAccountingManualRevised'
						Container='spnAccountingManualRevised'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='PriorApprovalPolicy'>
					<Control ID='ctlPriorApprovalPolicy'
						Container='spnPriorApprovalPolicy'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='HasLscSubgrants'>
					<Control ID='ctlHasLscSubgrants'
						Container='spnHasLscSubgrants'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeSiteVisits'> 
					<Control ID='ctlSubgranteeSiteVisits'
						Container='spnSubgranteeSiteVisits'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeFinRptReview'> 
					<Control ID='ctlSubgranteeFinRptReview'
						Container='spnSubgranteeFinRptReview'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeFinStmtReview'> 
					<Control ID='ctlSubgranteeFinStmtReview'
						Container='spnSubgranteeFinStmtReview'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeCostAllocReview'> 
					<Control ID='ctlSubgranteeCostAllocReview'
						Container='spnSubgranteeCostAllocReview'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='CostAllocationPolicy'>
					<Control ID='ctlCostAllocationPolicy'
						Container='spnCostAllocationPolicy'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PAIAllocationMeth'>
					<Control ID='ctlPAIAllocationMeth'
						Container='spnPAIAllocationMeth'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MostRecentInventory'>
					<Control ID='ctlMostRecentInventory'
						Container='spnMostRecentInventory'
						Type='cTextBox'
						Size='50'/>
				 </DisplayProperty>
				<DisplayProperty PropertyKey='LscFunderMostRecentSiteVisitID'> 
					<Control ID='ctlLscFunderMostRecentSiteVisitID'
						Container='spnLscFunderMostRecentSiteVisitID'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscFunderMostRecentSiteVisit'
						StoredValue='LscFunderMostRecentSiteVisitID'
						DisplayValue='Description'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='FunderMostRecentSiteVisitSpecify'>
					<Control ID='ctlFunderMostRecentSiteVisitSpecify'
						Container='spnFunderMostRecentSiteVisitSpecify'
						Type='cTextBox'
						Size='50'/>
				 </DisplayProperty>
				<DisplayProperty PropertyKey='CorrectiveActionsIdentified'> 
					<Control ID='ctlCorrectiveActionsIdentified'
						Container='spnCorrectiveActionsIdentified'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrectiveActions'>
					<Control ID='txtCorrectiveActions' 
						Type='cTextArea' 
						Container='spnCorrectiveActions' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrectiveActionsResolved'> 
					<Control ID='ctlCorrectiveActionsResolved'
						Container='spnCorrectiveActionsResolved'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscDeficitStatusID'> 
					<Control ID='ctlLscDeficitStatusID'
						Container='spnLscDeficitStatusID'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscDeficitStatus'
						StoredValue='LscDeficitStatusID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='DeficitLiquidatedLscFunds'>
					<Control ID='ctlDeficitLiquidatedLscFunds'
						Container='spnDeficitLiquidatedLscFunds'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DeficitLiquidatedHow'>
					<Control ID='txtDeficitLiquidatedHow' 
						Type='cTextArea' 
						Container='spnDeficitLiquidatedHow' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='NetAssetFundBalance'>
					<Control ID='ctlNetAssetFundBalance'
						Container='spnNetAssetFundBalance'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscNetAssetFundBalanceRangeID'>
					<Control ID='ctlLscNetAssetFundBalanceRangeID'
						Container='spnLscNetAssetFundBalanceRangeID'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscNetAssetFundBalanceRange'
						StoredValue='LscNetAssetFundBalanceRangeID'
						DisplayValue='Abbr'> 
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NetAssetFundBalanceWaiver'>
					<Control ID='ctlNetAssetFundBalanceWaiver'
						Container='spnNetAssetFundBalanceWaiver'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
						<Filters>
							<Argument PropertyKey='LscYesNoNAID' Value='3' Operator='NotEqual' />
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscNetAssetFundBalanceRangeWaiverID'>
					<Control ID='ctlLscNetAssetFundBalanceRangeWaiverID'
						Container='spnLscNetAssetFundBalanceRangeWaiverID'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscNetAssetFundBalanceRangeWaiver'
						StoredValue='LscNetAssetFundBalanceRangeWaiverID'
						DisplayValue='Abbr'> 
						<Sort>
							<Argument PropertyKey='SortOrder'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LSCFundingSvcDeliveryPctID'>
					<Control ID='ctlLSCFundingSvcDeliveryPctID'
						Container='spnLSCFundingSvcDeliveryPctID'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LSCFundingSvcDeliveryPct'
						StoredValue='LSCFundingSvcDeliveryPctID'
						DisplayValue='Abbr'> 
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExpFraud'>
					<Control ID='ctlExpFraud'
						Container='spnExpFraud'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExpMisapprop'>
					<Control ID='ctlExpMisapprop'
						Container='spnExpMisapprop'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExpEmbezzlement'>
					<Control ID='ctlExpEmbezzlement'
						Container='spnExpEmbezzlement'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExpTheft'>
					<Control ID='ctlExpTheft'
						Container='spnExpTheft'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FraudReportedOIG'> 
					<Control ID='ctlFraudReportedOIG'
						Container='spnFraudReportedOIG'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='FraudReportedAuthorities'> 
					<Control ID='ctlFraudReportedAuthorities'
						Container='spnFraudReportedAuthorities'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='FraudDesc'>
					<Control ID='txtFraudDesc' 
						Container='spnFraudDesc' 
						Type='cTextArea' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FraudRecoveredFunds'> 
					<Control ID='ctlFraudRecoveredFunds'
						Container='spnFraudRecoveredFunds'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='FraudRecoveredReallocated'> 
					<Control ID='ctlFraudRecoveredReallocated'
						Container='spnFraudRecoveredReallocated'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscFraudInsurancePolicyLimitID'> 
					<Control ID='ctlLscFraudInsurancePolicyLimitID'
						Container='spnLscFraudInsurancePolicyLimitID'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscFraudInsurancePolicyLimit'
						StoredValue='LscFraudInsurancePolicyLimitID'
						DisplayValue='Abbr'> 
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey='AccountingSW'>
					<Control ID='ctlAccountingSW'
						Container='spnAccountingSW'
						Type='cTextBox'
						Size='50'
						MaxLength='200'/>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='SWTrackFundSource'>
					<Control ID='ctlSWTrackFundSource'
						Container='spnSWTrackFundSource'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				 </DisplayProperty>
				<DisplayProperty PropertyKey='LscFiscalSWModulesInstalled'>
					<Control ID='ctlLscFiscalSWModulesInstalled'
						Container='spnLscFiscalSWModulesInstalled'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='LscFiscalSWModuleLKP'
						DisplayValue='Description'
						StoredValue='LscFiscalSWModuleLKPID'
						RepeatColumns='0'
						CellSpacing='3'
						RepeatDirection='Vertical'>
						<Sort>
							<Argument PropertyKey="SortOrder"/>
						</Sort>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='LscCompApplFiscal' DataObjectPropertyKey='LscCompApplFiscalID' PropertyKey='LscCompApplFiscalID' />
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWNumUsersID'> 
					<Control ID='ctlSWNumUsersID'
						Container='spnSWNumUsersID'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscFiscalSWNumUsersLKP'
						StoredValue='LscFiscalSWNumUsersLKPID'
						DisplayValue='Description'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='SWOwnPassword'>
					<Control ID='ctlSWOwnPassword'
						Container='spnSWOwnPassword'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NetworkSecurity'>
					<Control ID='ctlNetworkSecurity'
						Container='spnNetworkSecurity'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscFinDataBackupIntervalID'> 
					<Control ID='ctlLscFinDataBackupIntervalID'
						Container='spnLscFinDataBackupIntervalID'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						DataObjectDefinitionKey='LscFinDataBackupInterval'
						StoredValue='LscFinDataBackupIntervalID'
						DisplayValue='Description'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='FinRecordRetention'>
					<Control ID='ctlFinRecordRetention'
						Container='spnFinRecordRetention'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscFiscalIntCtlsInstituted' DataObjectDefinitionKey='LscFiscalIntCtlsInstituted' Updatable='True' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscCompApplFiscal' DataObjectPropertyKey='LscCompApplFiscalID' PropertyKey='LscCompApplFiscalID' />
			</Filters>
			<Sort>
				<Argument PropertyKey="SortOrder">
					<RelatedProperty PropertyKey="LscFiscalInternalCtlAreaLKP"/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='lstLscFiscalIntCtlsInstituted'
						Type='cDataPresenterList'
						Container='spnLscFiscalIntCtlsInstituted'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/Application/Controls/PageSection/FiscalInternalControls_Item.ascx'/>
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
				
				
				
				
	</ModuleSection>
</span>