<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<div class='SeparatorHdg' width='100%'>
	Funding Term
</div>

<b>Funding Term</b>&nbsp;&nbsp;
<span runat='server' id='spnFundingTerm' /><br /><br />

<b>Provide a summary of the applicant's grant proposal that addresses:</b>
<ol style="list-style-type:lower-alpha">
	<li>the reviewer's overall analysis of the proposed delivery system based on the grant application,</li>
	<li>an analysis of the potential strengths and weaknesses identified, and</li>
	<li>any potential issues that may warrant further review or an on-site visit.</li>
</ol>

<span runat='server' id='spnGrantProposalSummary' />

<br />
<hr style="height:5px;width:100%;color:#888888"/>
<br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscFundingTermID'>
					<Control ID='ctlFundingTerm'
						Type='cDropDown'
						Container='spnFundingTerm'
						DataObjectDefinitionKey='LscFundingTerm'
						StoredValue='LscFundingTermID'
						DisplayValue='Description' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewApplicationHtml.GrantProposalSummary' HtmlEncode='False'>
					<Control ID='spnGrantProposalSummary'
						Type='HtmlGenericControl'
						Container='spnGrantProposalSummary'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
