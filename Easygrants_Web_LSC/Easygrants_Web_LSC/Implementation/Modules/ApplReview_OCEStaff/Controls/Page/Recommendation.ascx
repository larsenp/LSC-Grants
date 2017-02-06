<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<div style="width:800px">
	<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
		Src='Core/Controls/Base/ValidationSummary.ascx'
		runat='server'/>
	<br />
	<style>
		td {vertical-align:top}
	</style>
	<table id="Table1" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
		<tr>
		  <td colspan="4"><h1>Fiscal Grantee Funding Application Review</h1></td>
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
	<table style='width:800px'>
		<tr>
			<td colspan='4' class='SeparatorHdg'>
				Supplemental Scoring
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='4'>
				Part I, questions 5 (a), 5 (c), and 16 allows the applicant to select a response of “Other” to precisely indicate its practice. Review the specified response and provide a score from -0- to 1 for answers not captured in the options provided.
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan='3'>
				I.5.a. How often are management reports reviewed?
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				Applicant response: <strong><span runat='server' id='spnLscFinanceReportReviewInterval'/></strong>
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				If other, specify: <strong><span runat='server' id='spnFinanceReportReviewIntervalOther'/></strong>
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				If applicant responded "Other", provide a score between 0 and 1 <span runat='server' id='spnLscFinanceReportReviewIntervalOtherScore'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan='3'>
				I.5.c. How often are accounting and control policies reviewed and recommendations made for changes and improvements?
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				Applicant response: <strong><span runat='server' id='spnLscAcctgCtrlPolicyReviewInterval'/></strong>
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				If other, specify: <strong><span runat='server' id='spnAcctgCtrlPolicyReviewIntervalOther'/></strong>
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				If applicant responded "Other", provide a score between 0 and 1 <span runat='server' id='spnLscAcctgCtrlPolicyReviewIntervalOtherScore'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan='3'>
				I.16. Please indicate which of the following were used to establish the compensation for the Chief Executive Officer/Executive Director.
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				Applicant response: 
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2' style="padding-left: 20px; font-weight:bold"><b><span runat='server' id='spnCeoCompensationJustification'/></b></td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				If other, specify: <strong><span runat='server' id='spnCeoCompensationJustificationOther'/></strong>
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				If applicant responded "Other", provide a score between 0 and 1 <span runat='server' id='spnLscCeoCompensationJustificationOtherScore'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='4' class='SeparatorHdg'>
				Fiscal Application Questions for FCS Review
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='2'>
				1.
			</td>
			<td colspan='2'>
				Please review and provide your assessment  of the following documentation submitted by the applicant 
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				(1)
			</td>
			<td>
				Certificate of Good Standing
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td>
				Does document meet requirement? 
			</td>
			<td>
				<span runat='server' id='spnCertGoodStandingMeetReq'/>
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnCertGoodStanding'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				(2)
			</td>
			<td colspan='2'>
				Accounting  Manual and/or Other Fiscal Policies/Procedures
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnAcctManual'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				(3)
			</td>
			<td colspan='2'>
				Current Fidelity Bond Coverage
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td>
				Does document meet requirement?
			</td>
			<td>
				<span runat='server' id='spnFidelityBondMeetReq'/>
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnFidelityBond'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				(4)
			</td>
			<td colspan='2'>
				Fiscal-related Special Grant Conditions from Other Funding Sources Currently in Effect (if applicable)
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnSgcOtherSources'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				(5)
			</td>
			<td colspan='2'>
				Audit/Finance/Executive Committee Charters
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnCommitteeCharters'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				(6)
			</td>
			<td colspan='2'>
				Cost-Allocation Method/Policy
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnCostAlloc'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				(7)
			</td>
			<td colspan='2'>
				Private  Attorney Involvement Method/Policy
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnPaiMethod'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				(8)
			</td>
			<td colspan='2'>
				Segregation  of Financial Duties Worksheet
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnSegFinDuties'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				(9)
			</td>
			<td colspan='2'>
				Derivative Income Policy
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnDerivativeIncomePolicy'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>

		<tr>
			<td>2.</td>
			<td colspan='3'>
				Evaluate the applicant on each of the following
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				a.
			</td>
			<td colspan='2'>
				Recent  Audited Financial Statement opinion and weaknesses (if noted):
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnAudFinStmt'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				b.
			</td>
			<td colspan='2'>
				Financial Stability
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnFinStability'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				c.
			</td>
			<td colspan='2'>
				Quality  of management systems to effectively implement statutory, regulatory or other requirements imposed on non-Federal entities:  <em>(For applicants who were subject to an OCE Review in the last 5 years, review the most recent Compliance Review and/or Follow-up Review  reports for Board or fiscal-related findings that may affect the applicant’s ability to comply with LSC Act and Regulations)</em>
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnQualityMgmtSystems'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				d.
			</td>
			<td colspan='2'>
				History of Performance
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;
				
			</td>
			<td colspan='2'>
				i.	Timeliness  of submitting financial statements, requests for waivers (fund balance, PAI) 
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnTimelyFinStmts'/>
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;
				
			</td>
			<td colspan='2'>
				ii.	Applicant  monitors for fiscal compliance of subrecipients (if applicable) <em>(Review Part III, Question 4 and validate based on internal records; review subgrant agreement for reporting requirements and validate the Audited Financial Statement for compliance)</em>
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnSubrecipientCompliance'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				e.
			</td>
			<td colspan='2'>
				Property  agreement (if applicable) <em>(Review for property agreement with LSC and note date of agreement, purchase price, and LSC’s anticipated interest in said property at time of purchase)</em>:
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnPropertyAgreement'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				f.
			</td>
			<td colspan='2'>
				Fund  balance history, since the applicant’s last competitive application, and proper reporting of carry forward fund balance in the following Audited Financial Statement(s) (if applicable):
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnFundBalanceHistory'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				g.
			</td>
			<td colspan='2'>
				PAI  waiver history, since the applicant’s last competitive application, and accuracy of PAI reporting in the applicable  Audited Financial Statement(s) (if applicable):
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnPaiWaiverHistory'/>
			</td>
		</tr>


		<tr>
			<td colspan='2'>
				3.
			</td>
			<td colspan='2'>
				Was this applicant subject to fiscal SGCs from LSC during the current funding year?
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnSubjectFiscalSGC'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				a.
			</td>
			<td colspan='2'>
				If yes, have these fiscal SGCs been successfully completed?
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnFiscalSGCCompleted'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				b.
			</td>
			<td colspan='2'>
				If no, what additional actions need to be completed?
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnAddlActionToComplete'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='2'>
				4.
			</td>
			<td colspan='2'>
				Should fiscal SGCs be imposed?
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnImposeFiscalSGC'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='2'>
				5.
			</td>
			<td colspan='2'>
				Specific SGCs and Reporting Dates.
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnRecommendedFiscalSGC'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan='2'>
				6.
			</td>
			<td colspan='2'>
				Additional comments
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td colspan='2'>
				<span runat='server' id='spnOverallComment'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan='4' style='text-align:center'>
				<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
				<span runat='server' id='spnSave_and_Continue'/>
			</td>
		</tr>
	</table>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

	   <DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>

	   <DataObject Key='LscCompApplFiscal' DataObjectDefinitionKey='LscCompApplFiscal' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='OrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscFinanceReportReviewInterval.Abbr'>
					<Control ID='spnLscFinanceReportReviewInterval'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinanceReportReviewIntervalOther'>
					<Control ID='spnFinanceReportReviewIntervalOther'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='LscAcctgCtrlPolicyReviewInterval.Abbr'>
					<Control ID='spnLscAcctgCtrlPolicyReviewInterval'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AcctgCtrlPolicyReviewIntervalOther'>
					<Control ID='spnAcctgCtrlPolicyReviewIntervalOther'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CeoCompensationJustificationOther'>
					<Control ID='spnCeoCompensationJustificationOther'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscCeoCompensationJustification' DataObjectDefinitionKey='LscCeoCompensationJustification' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscCompApplFiscal' DataObjectPropertyKey='LscCompApplFiscalID' PropertyKey='LscCompApplFiscalID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCeoCompensationJustification'
						Type='cDataListCtl'
						ShowColumnHeaderRow='False'
						Container='spnCeoCompensationJustification'>
						<DisplayProperty PropertyKey='LscCeoCompensationJustificationLKP.Description'/>
					</Control>
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
				<DisplayProperty PropertyKey='LscFinanceReportReviewIntervalOtherScore'>
					<Control ID='txtLscFinanceReportReviewIntervalOtherScore'
						Container='spnLscFinanceReportReviewIntervalOtherScore'
						Type='cMoneyTextBox'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Scores must be between 0 and 1 and must have no more than one decimal place.'
						RegExErrorMessage='Scores must be between 0 and 1 and must have no more than one decimal place.'
						Size='3'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscAcctgCtrlPolicyReviewIntervalOtherScore'>
					<Control ID='txtLscAcctgCtrlPolicyReviewIntervalOtherScore'
						Container='spnLscAcctgCtrlPolicyReviewIntervalOtherScore'
						Type='cMoneyTextBox'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Scores must be between 0 and 1 and must have no more than one decimal place.'
						RegExErrorMessage='Scores must be between 0 and 1 and must have no more than one decimal place.'
						Size='3'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='LscCeoCompensationJustificationOtherScore'>
					<Control ID='txtLscCeoCompensationJustificationOtherScore'
						Container='spnLscCeoCompensationJustificationOtherScore'
						Type='cMoneyTextBox'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Scores must be between 0 and 1 and must have no more than one decimal place.'
						RegExErrorMessage='Scores must be between 0 and 1 and must have no more than one decimal place.'
						Size='3'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CertGoodStandingMeetReq'>
					<Control ID='rdoCertGoodStandingMeetReq'
						Container='spnCertGoodStandingMeetReq'
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
				<DisplayProperty PropertyKey='CertGoodStanding'>
					<Control ID='txtCertGoodStanding'
						Container='spnCertGoodStanding'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AcctManual'>
					<Control ID='txtAcctManual'
						Container='spnAcctManual'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FidelityBondMeetReq'>
					<Control ID='rdoFidelityBondMeetReq'
						Container='spnFidelityBondMeetReq'
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
				<DisplayProperty PropertyKey='FidelityBond'>
					<Control ID='txtFidelityBond'
						Container='spnFidelityBond'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SgcOtherSources'>
					<Control ID='txtSgcOtherSources'
						Container='spnSgcOtherSources'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CommitteeCharters'>
					<Control ID='txtCommitteeCharters'
						Container='spnCommitteeCharters'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CostAlloc'>
					<Control ID='txtCostAlloc'
						Container='spnCostAlloc'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaiMethod'>
					<Control ID='txtPaiMethod'
						Container='spnPaiMethod'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SegFinDuties'>
					<Control ID='txtSegFinDuties'
						Container='spnSegFinDuties'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DerivativeIncomePolicy'>
					<Control ID='txtDerivativeIncomePolicy'
						Container='spnDerivativeIncomePolicy'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AudFinStmt'>
					<Control ID='txtAudFinStmt'
						Container='spnAudFinStmt'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinStability'>
					<Control ID='txtFinStability'
						Container='spnFinStability'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QualityMgmtSystems'>
					<Control ID='txtQualityMgmtSystems'
						Container='spnQualityMgmtSystems'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TimelyFinStmts'>
					<Control ID='txtTimelyFinStmts'
						Container='spnTimelyFinStmts'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubrecipientCompliance'>
					<Control ID='txtSubrecipientCompliance'
						Container='spnSubrecipientCompliance'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PropertyAgreement'>
					<Control ID='txtPropertyAgreement'
						Container='spnPropertyAgreement'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundBalanceHistory'>
					<Control ID='txtFundBalanceHistory'
						Container='spnFundBalanceHistory'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaiWaiverHistory'>
					<Control ID='txtPaiWaiverHistory'
						Container='spnPaiWaiverHistory'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>


				<DisplayProperty PropertyKey='OverallComment'>
					<Control ID='txtOverallComment'
						Container='spnOverallComment'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubjectFiscalSGC'>
					<Control ID='rdoSubjectFiscalSGC'
						Container='spnSubjectFiscalSGC'
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
				<DisplayProperty PropertyKey='FiscalSGCCompleted'>
					<Control ID='rdoFiscalSGCCompleted'
						Container='spnFiscalSGCCompleted'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes (Go to #4)'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
							<Parameter StoredValue='' DisplayValue='No Fiscal SGCs'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AddlActionToComplete'>
					<Control ID='txtAddlActionToComplete'
						Container='spnAddlActionToComplete'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ImposeFiscalSGC'>
					<Control ID='rdoImposeFiscalSGC'
						Container='spnImposeFiscalSGC'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No (Done)'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecommendedFiscalSGC'>
					<Control ID='txtRecommendedFiscalSGC'
						Container='spnRecommendedFiscalSGC'
						Type='cTextArea'
						Rows='6'
						Cols='60'/>
				</DisplayProperty>
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
						Caption='Save and Continue'
						Save='False'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
