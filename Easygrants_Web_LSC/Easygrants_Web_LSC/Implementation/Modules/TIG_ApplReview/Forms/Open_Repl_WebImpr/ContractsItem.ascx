<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>


<%--<p><b>Proposed Contractor: </b><span runat='server' id='spnProposedContract'/></p>
<p><b>Contractor Type: </b><span runat='server' id='spnContractorType'/></p>--%>
<p><b>1. Contract Amount from TIG Funds: </b><span runat='server' id='spnAmount'/></p>
<p><b>2. Describe the contractor's project role, including specific tasks and responsibilities. Additionally, justify the use of third parties to accomplish these tasks and responsibilities.</b></p>
<p><span runat='server' id='spnTigFundedTasks'/></p>
<p><b>3. Contractor Selection</b></p>
<p><b>a. Are you proposing a specific third-party contractor? </b><span runat='server' id='spnSpecificContractor'/></p>
<p><b>If yes, please indicate the proposed contractor.</b></p>
<p><span runat='server' id='spnContractingEntity'/></p>
<p><b>b. If you are proposing a specific third-party contractor, provide an explanation of how and why the proposed contractor
        was identified, including the competition process. If you are not proposing a specific third-party contractor, provide
        your plan for selecting the contractor, including the competition process.</b></p>
<p><span runat='server' id='spnContractorSelectionProcess'/></p>
<p><b>4. Please identify your proposed methods of overseeing performance by the third parties. This includes information on 
        what skills your program possesses to fully monitor contract performance.</b></p>
<p><span runat='server' id='spnOversightMethods'/></p>
<p><b>5. Any legal content development activities? </b><span runat='server' id='spnLegalContentActivities'/></p>
<p><b>If yes, please describe these activities and the content to be developed. </b></p>
<p><span runat='server' id='spnLegalContentActivityComment'/></p>
<p><b>6. Any project decision-making activities? </b><span runat='server' id='spnLegalDecisionActivities'/></p>
<p><b>If yes, please describe these activities. </b></p>
<p><span runat='server' id='spnLegalDecisionActivityComment'/></p>
<p><b>7. Based on LSC’s rules and regulations (see 45 CFR Part 1627), will this be a subgrant?</b><span runat='server' id='spnIsSubgrant'/></p>
<br />


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscTigContract' Key='LscTigContract' Updatable='False'>
			<DisplayProperties>
				<%--<DisplayProperty PropertyKey='ContractingEntity'>
					<Control ID='spnProposedContract'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='TigContractEntityType.Abbr'>
					<Control ID='spnContractorType'
						Type='HtmlGenericControl' />
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='ContractAmountTig' Format='#,0'>
					<Control ID='spnAmount'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='TigFundedTasks'>
					<Control ID='spnTigFundedTasks'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SpecificContractor' Format='YesNo'>
					<Control ID='spnSpecificContractor'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractingEntity'>
					<Control ID='spnContractingEntity'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractorSelectionProcess'>
					<Control ID='spnContractorSelectionProcess'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OversightMethods'>
					<Control ID='spnOversightMethods'
						Type='HtmlGenericControl' />
				</DisplayProperty>			
				<DisplayProperty PropertyKey='LegalContentActivities' Format='YesNo'>
					<Control ID='spnLegalContentActivities'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegalContentActivityComment'>
					<Control ID='spnLegalContentActivityComment'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegalDecisionActivities' Format='YesNo'>
					<Control ID='spnLegalDecisionActivities'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegalDecisionActivityComment'>
					<Control ID='spnLegalDecisionActivityComment'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsSubgrant' Format='YesNo'>
					<Control ID='spnIsSubgrant'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>