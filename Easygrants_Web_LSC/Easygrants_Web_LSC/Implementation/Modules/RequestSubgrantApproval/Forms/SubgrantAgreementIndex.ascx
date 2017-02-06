<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlSubgrantInfo' 
	Src='Implementation/Modules/RequestSubgrantApproval/PageSection/SubgrantInfo.ascx'
	runat='server'/>

<div width='100%' class="SeparatorHdg">
	Instructions
</div>
<br />
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
   <tr>
    <td><p>The <strong>Subgrant Agreement Index</strong> page captures information regarding the specific location in the subgrant agreement of various required paragraphs and/or regulatory provisions.</p>
    </td>
  </tr>
</table>
<br /><br />
<div width='100%' class="SeparatorHdg">
	Specifics of Agreement
</div>
<br />
<table width='600px' cellpadding='1'>
	<tr>
		<td>
			<b>Item</b>
		</td>
		<td colspan='2' style="text-align:center">
			<b>Location</b>
		</td>
	</tr>
	<tr>
		<td style="width:400px">&nbsp;</td>
		<td style="width:100px">
			<b>Page<font color='red'>*</font></b>
		</td>
		<td style="width:100px">
			<b>Paragraph</b>
		</td>
	</tr>
	<tr>
		<td>
			1. Terms & Conditions
		</td>
		<td>
			<span runat='server' id='spnTermsConPg' />
		</td>
		<td>
			<span runat='server' id='spnTermsConPara' />
		</td>
	</tr>
	<tr>
		<td>
			2. Amount of funds to be transferred
		</td>
		<td>
			<span runat='server' id='spnFundXferPg' />
		</td>
		<td>
			<span runat='server' id='spnFundXferPara' />
		</td>
	</tr>
	<tr>
		<td>
			3. Term of Agreement (maximum 1 year)
		</td>
		<td>
			<span runat='server' id='spnTermAgreePg' />
		</td>
		<td>
			<span runat='server' id='spnTermAgreePara' />
		</td>
	</tr>
	<tr>
		<td>
			4. Fidelity Bond Coverage
		</td>
		<td>
			<span runat='server' id='spnBondCoverPg' />
		</td>
		<td>
			<span runat='server' id='spnBondCoverPara' />
		</td>
	</tr>
	<tr>
		<td>
			5. Financial Statement & Audit requirements 
		</td>
		<td>
			<span runat='server' id='spnAuditPg' />
		</td>
		<td>
			<span runat='server' id='spnAuditPara' />
		</td>
	</tr>
	<tr>
		<td>
			6. Malpractice Insurance Coverage
		</td>
		<td>
			<span runat='server' id='spnMalpracticePg' />
		</td>
		<td>
			<span runat='server' id='spnMalpracticePara' />
		</td>
	</tr>
	<tr>
		<td>
			7. Agreement is governed by LSC statutes, regulations, instructions, guidelines and assurances
		</td>
		<td>
			<span runat='server' id='spnGovLscPg' />
		</td>
		<td>
			<span runat='server' id='spnGovLscPara' />
		</td>
	</tr>
	<tr>
		<td>
			8. LSC's oversight rights over subrecipient
		</td>
		<td>
			<span runat='server' id='spnLscOversightPg' />
		</td>
		<td>
			<span runat='server' id='spnLscOversightPara' />
		</td>
	</tr>
	<tr>
		<td>
			9. Funds transferred are subject to audit and compliance with LSC's Audit & Accounting Guides
		</td>
		<td>
			<span runat='server' id='spnAuditCompliancePg' />
		</td>
		<td>
			<span runat='server' id='spnAuditCompliancePara' />
		</td>
	</tr>
	<tr>
		<td>
			10. Orderly termination of subgrant agreement 
		</td>
		<td>
			<span runat='server' id='spnTerminationPg' />
		</td>
		<td>
			<span runat='server' id='spnTerminationPara' />
		</td>
	</tr>
	<tr>
		<td>
			11. Agreement priorities consistent with recipient priorities
		</td>
		<td>
			<span runat='server' id='spnPriorityConflictPg' />
		</td>
		<td>
			<span runat='server' id='spnPriorityConflictPara' />
		</td>
	</tr>
	<tr>
		<td>
			12. Recipient responsibilities (proper expenditure, timely submission of Audit, etc.)
		</td>
		<td>
			<span runat='server' id='spnRecipResponsPg' />
		</td>
		<td>
			<span runat='server' id='spnRecipResponsPara' />
		</td>
	</tr>
	<tr>
		<td>
			13. Subrecipient must provide LSC notice of, and materials related to, trainings provided
		</td>
		<td>
			<span runat='server' id='spnFundTrainingPg' />
		</td>
		<td>
			<span runat='server' id='spnFundTrainingPara' />
		</td>
	</tr>
	<tr>
		<td>
			14. Subrecipient must provide LSC notice of, and materials related to, client/community education provided
		</td>
		<td>
			<span runat='server' id='spnFundEducPg' />
		</td>
		<td>
			<span runat='server' id='spnFundEducPara' />
		</td>
	</tr>
	<tr>
		<td>
			15. Services to migrant/immigration cases will comply with 45 CFR Part 1626 and other applicable law.
		</td>
		<td>
			<span runat='server' id='spnMigrantServPg' />
		</td>
		<td>
			<span runat='server' id='spnMigrantServPara' />
		</td>
	</tr>
	<tr>
		<td>
			16. Treatment of unexpended fund balance
		</td>
		<td>
			<span runat='server' id='spnFundBalancePg' />
		</td>
		<td>
			<span runat='server' id='spnFundBalancePara' />
		</td>
	</tr>
	<tr>
		<td>
			17. Treatment of Attorneys' Fees
		</td>
		<td>
			<span runat='server' id='spnFeeRetainPg' />
		</td>
		<td>
			<span runat='server' id='spnFeeRetainPara' />
		</td>
	</tr>
    <tr>
		<td>
			18. Legislative & administrative advocacy activities
		</td>
		<td>
			<span runat='server' id='spnAdvocacyPg' />
		</td>
		<td>
			<span runat='server' id='spnAdvocacyPara' />
		</td>
	</tr>
</table>
<br /><br />
<div style="text-align:center">
	<span runat='server' id='spnSave'/>&nbsp;
	<span runat='server' id='spnSaveContinue'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscSubgrantAgreementIndex' DataObjectDefinitionKey='LscSubgrantAgreementIndex' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TermsConPg'>
					<Control ID='txtTermsConPg'
						Type='cTextBox'
						Container='spnTermsConPg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TermsConPara'>
					<Control ID='txtTermsConPara'
						Type='cTextBox'
						Container='spnTermsConPara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundXferPg'>
					<Control ID='txtFundXferPg'
						Type='cTextBox'
						Container='spnFundXferPg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundXferPara'>
					<Control ID='txtFundXferPara'
						Type='cTextBox'
						Container='spnFundXferPara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TermAgreePg'>
					<Control ID='txtTermAgreePg'
						Type='cTextBox'
						Container='spnTermAgreePg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TermAgreePara'>
					<Control ID='txtTermAgreePara'
						Type='cTextBox'
						Container='spnTermAgreePara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BondCoverPg'>
					<Control ID='txtBondCoverPg'
						Type='cTextBox'
						Container='spnBondCoverPg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BondCoverPara'>
					<Control ID='txtBondCoverPara'
						Type='cTextBox'
						Container='spnBondCoverPara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditPg'>
					<Control ID='txtAuditPg'
						Type='cTextBox'
						Container='spnAuditPg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditPara'>
					<Control ID='txtAuditPara'
						Type='cTextBox'
						Container='spnAuditPara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MalpracticePg'>
					<Control ID='txtMalpracticePg'
						Type='cTextBox'
						Container='spnMalpracticePg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MalpracticePara'>
					<Control ID='txtMalpracticePara'
						Type='cTextBox'
						Container='spnMalpracticePara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GovLscPg'>
					<Control ID='txtGovLscPg'
						Type='cTextBox'
						Container='spnGovLscPg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GovLscPara'>
					<Control ID='txtGovLscPara'
						Type='cTextBox'
						Container='spnGovLscPara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOversightPg'>
					<Control ID='txtLscOversightPg'
						Type='cTextBox'
						Container='spnLscOversightPg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOversightPara'>
					<Control ID='txtLscOversightPara'
						Type='cTextBox'
						Container='spnLscOversightPara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditCompliancePg'>
					<Control ID='txtAuditCompliancePg'
						Type='cTextBox'
						Container='spnAuditCompliancePg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditCompliancePara'>
					<Control ID='txtAuditCompliancePara'
						Type='cTextBox'
						Container='spnAuditCompliancePara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TerminationPg'>
					<Control ID='txtTerminationPg'
						Type='cTextBox'
						Container='spnTerminationPg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TerminationPara'>
					<Control ID='txtTerminationPara'
						Type='cTextBox'
						Container='spnTerminationPara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PriorityConflictPg'>
					<Control ID='txtPriorityConflictPg'
						Type='cTextBox'
						Container='spnPriorityConflictPg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PriorityConflictPara'>
					<Control ID='txtPriorityConflictPara'
						Type='cTextBox'
						Container='spnPriorityConflictPara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecipResponsPg'>
					<Control ID='txtRecipResponsPg'
						Type='cTextBox'
						Container='spnRecipResponsPg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecipResponsPara'>
					<Control ID='txtRecipResponsPara'
						Type='cTextBox'
						Container='spnRecipResponsPara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FeeRetainPg'>
					<Control ID='txtFeeRetainPg'
						Type='cTextBox'
						Container='spnFeeRetainPg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FeeRetainPara'>
					<Control ID='txtFeeRetainPara'
						Type='cTextBox'
						Container='spnFeeRetainPara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundTrainingPg'>
					<Control ID='txtFundTrainingPg'
						Type='cTextBox'
						Container='spnFundTrainingPg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundTrainingPara'>
					<Control ID='txtFundTrainingPara'
						Type='cTextBox'
						Container='spnFundTrainingPara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundEducPg'>
					<Control ID='txtFundEducPg'
						Type='cTextBox'
						Container='spnFundEducPg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundEducPara'>
					<Control ID='txtFundEducPara'
						Type='cTextBox'
						Container='spnFundEducPara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MigrantServPg'>
					<Control ID='txtMigrantServPg'
						Type='cTextBox'
						Container='spnMigrantServPg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MigrantServPara'>
					<Control ID='txtMigrantServPara'
						Type='cTextBox'
						Container='spnMigrantServPara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AdvocacyPg'>
					<Control ID='txtAdvocacyPg'
						Type='cTextBox'
						Container='spnAdvocacyPg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AdvocacyPara'>
					<Control ID='txtAdvocacyPara'
						Type='cTextBox'
						Container='spnAdvocacyPara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundBalancePg'>
					<Control ID='txtFundBalancePg'
						Type='cTextBox'
						Container='spnFundBalancePg'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundBalancePara'>
					<Control ID='txtFundBalancePara'
						Type='cTextBox'
						Container='spnFundBalancePara'
						Size='10'
						MaxLength='20'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
