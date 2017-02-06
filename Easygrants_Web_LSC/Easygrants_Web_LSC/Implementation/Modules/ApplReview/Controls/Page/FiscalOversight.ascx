<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<table id="Table1" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
	  <td colspan="4"><h1>Fiscal Oversight and Internal Control Inquiries</h1></td>
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
	Src='Implementation/Modules/ApplReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/GrantInformationCSRAnalysis.ascx'
	runat='server'/>
<br />
<div style='width:100%' class='SeparatorHdg'>Fiscal Oversight and Internal Control Inquiries</div>
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
    <tr><td colspan="4" ><b>1.	Describe applicant's systems and procedures for financial administration and management.  Address the following in your response: </b></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><ul><b>a.	does applicant have an accounting manual?<Font color='Red'>*</Font></b>&nbsp;&nbsp;<span id='spnAccountingManual' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><ul><b>If yes, describe any changes made to applicant's accounting in the last twenty-four months</b></ul></td></tr>
    <tr><td><ul><span id='spnAcctChanges' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><ul><b>b.	management's involvement in fiscal oversight including authorization and approval for significant financial disbursements, contracts, and payroll<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><span id='spnAcctMngtInvolvement' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><ul><b>c.	the procedures applicant uses for assuring that financial management reports are timely and accurate<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><span id='spnAcctReportsTimely' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><ul><b>d.	the number of accounting and financial staff expressed in Full Time Equivalents (FTEs):<Font color='Red'>*</Font></b>&nbsp;&nbsp; <span id='spnAccountingStaff' runat='server'/></ul></td></tr>
    <tr><td><ul><b>e.	applicant's accounting and financial staff including:<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><ul><b>1.	their duties and responsibilities</b></ul></ul></td></tr>
    <tr><td><ul><ul><b>2.	their qualifications</b></ul></ul></td></tr>
    <tr><td><ul><ul><b>3.	training or other professional development opportunities provided  in the last twenty-four months</b></ul></ul></td></tr>
    <tr><td><ul><span id='spnAccountingStaffDesc' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    
    <tr><td colspan="4" ><b>2.	Does applicant's board have an audit committee?<Font color='Red'>*</Font></b>&nbsp;&nbsp;<span id='spnBoardAudit' runat='server'/></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td colspan="4" ><ul><b>If yes, discuss the qualifications of committee members or advisors that ensure effective financial planning and fiscal oversight.</b></ul></td></tr>
    <tr><td><ul><span id='spnBoardAuditQualifications' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td colspan="4" ><ul><b>Does applicant's board have a finance committee?<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><span id='spnBoardFinance' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td colspan="4" ><ul><b>If yes, discuss the qualifications of committee members or advisors that ensure effective financial planning and fiscal oversight.</b></ul></td></tr>
    <tr><td><ul><span id='spnBoardFinanceQualifications' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>

    <tr><td colspan="4" ><b>3.	Describe how the board exercised its fiscal oversight responsibilities in the last twenty-four months.<Font color='Red'>*</Font></b></td></tr>
    <tr><td><ul><span id='spnBoardExercised' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>  
    
    <tr><td colspan="4" ><b>4.	Provide a brief summary of applicant's policies and procedures (including segregation of duties as applicable) for each topic below.</b></td></tr>
    <tr><td colspan="4" >Applicant may upload its accounting manual (or pages therefrom) as a PDF file if it addresses the topics below. Include the following information in the title of the accounting manual (or pages therefrom):  applicant name, applicant number, “Accounting Manual” and the year the accounting manual was last updated. A response to each item below is still required of applicants that choose to upload; in the response applicants should include the appropriate page and paragraph references to the accounting manual (or pages therefrom). If the accounting manual (or pages therefrom) does not address all of the inquiries below, provide a response to the inquiries that are not addressed.</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td colspan="4" ><ul><b>a.	Budgeting<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><span id='spnBudgeting' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>

    <tr><td colspan="4" ><ul><b>b.	Purchasing/Procurement<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><span id='spnPurchasingProcurement' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    
    <tr><td colspan="4" ><ul><b>c.	Cash Receipts<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><span id='spnCashReceipts' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    
    <tr><td colspan="4" ><ul><b>d.	Cash Disbursements (currency and electronic transactions)<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><span id='spnCashDisbursements' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    
    <tr><td colspan="4" ><ul><b>e.	Client Trust Funds<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><span id='spnClientTrustFunds' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    
    <tr><td colspan="4" ><ul><b>f.	Banking - Electronic / Reconciliation<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><span id='spnBankingReconciliation' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    
    <tr><td colspan="4" ><ul><b>g.	Contracting - (consultants and contractual services)<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><span id='spnContractingConsultants' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    
    <tr><td colspan="4" ><ul><b>h.	Cost Identification and Allocation<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><span id='spnCostIdentificationAllocation' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    
    <tr><td colspan="4" ><ul><b>i.	Payroll and Timekeeping<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><span id='spnPayrollTimekeeping' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    
    <tr><td colspan="4" ><ul><b>j.	Travel<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><span id='spnTravel' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    
    <tr><td colspan="4" ><ul><b>k.	Property Control<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><span id='spnPropertyControl' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    
    <tr><td colspan="4" ><ul><b>l.	Record Maintenance<Font color='Red'>*</Font></b></ul></td></tr>
    <tr><td><ul><span id='spnRecordMaintenance' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    
    <tr><td colspan="4" ><b>5. Has applicant experienced fraud, misappropriation of funds, embezzlement, or theft within the last twenty-four months?<Font color='Red'>*</Font></b>&nbsp;&nbsp;<span id='spnFraudRecently' runat='server'/></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><ul><b>If yes, discuss:</b></ul></td></tr>
    <tr><td><ul><b>a.	the incident(s) that occurred including the job title(s) of the personnel  involved</b></ul></td></tr>
    <tr><td><ul><span id='spnFraudIncident' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><ul><b>b.	what action was taken by the applicant in response to the incident(s)</b></ul></td></tr>
    <tr><td><ul><span id='spnFraudActionTaken' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><ul><b>c.	what changes were made to applicant's fiscal oversight policies and procedures and internal controls following the incident(s)</b></ul></td></tr>
    <tr><td><ul><span id='spnFraudChangesMade' runat='server'/></ul></td></tr>
    <tr><td>&nbsp;</td></tr>
</table>
<br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	    <DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
	    </DataObject>
	   
	    <DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	    </DataObject>
	    
	   <DataObject Key='LSCFiscalOversight' DataObjectDefinitionKey='LSCFiscalOversight' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</DefaultValues>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='AccountingManual' Format='YesNo'> 
					<Control ID='spnAccountingManual'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='AcctChanges'>
					<Control ID='spnAcctChanges'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='AcctMngtInvolvement'>
					<Control ID='spnAcctMngtInvolvement'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='AcctReportsTimely'>
					<Control ID='spnAcctReportsTimely'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='AccountingStaff'>
					<Control ID='spnAccountingStaff'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='AccountingStaffDesc'>
					<Control ID='spnAccountingStaffDesc'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='BoardExercised'>
					<Control ID='spnBoardExercised'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='BoardAudit' Format='YesNo'>
					<Control ID='spnBoardAudit'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='BoardAuditQualifications'>
					<Control ID='spnBoardAuditQualifications'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='BoardFinance' Format='YesNo'>
					<Control ID='spnBoardFinance'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='BoardFinanceQualifications' >
					<Control ID='spnBoardFinanceQualifications'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Budgeting' >
					<Control ID='spnBudgeting'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='PurchasingProcurement' >
					<Control ID='spnPurchasingProcurement'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='CashReceipts' >
					<Control ID='spnCashReceipts'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='CashDisbursements' >
					<Control ID='spnCashDisbursements'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='ClientTrustFunds' >
					<Control ID='spnClientTrustFunds'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='BankingReconciliation' >
					<Control ID='spnBankingReconciliation'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='ContractingConsultants' >
					<Control ID='spnContractingConsultants'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='CostIdentificationAllocation' >
					<Control ID='spnCostIdentificationAllocation'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='PayrollTimekeeping' >
					<Control ID='spnPayrollTimekeeping'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Travel' >
					<Control ID='spnTravel'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			     <DisplayProperty PropertyKey='PropertyControl' >
					<Control ID='spnPropertyControl'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='RecordMaintenance' >
					<Control ID='spnRecordMaintenance'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='FraudRecently'  Format='YesNo'>
					<Control ID='spnFraudRecently'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='FraudIncident' >
					<Control ID='spnFraudIncident'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='FraudActionTaken' >
					<Control ID='spnFraudActionTaken'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='FraudChangesMade' >
					<Control ID='spnFraudChangesMade'
						Type='HtmlGenericControl' />
			    </DisplayProperty>

			</DisplayProperties>
		</DataObject>
	    
	
				
				
				
				
	</ModuleSection>
</span>