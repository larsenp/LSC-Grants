<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<p>Part II of the proposal evaluation form directs your review to the applicant's responses to Part 2 
of the RFP and the supplemental documentation submitted by the applicant. Please complete this form 
and provide additional information, as necessary. </p>

<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg' width='100%'>
	Evaluation Comments
</div>
<br />
<span runat='server' id='spnComments' />
<br /><br />
<div class='SeparatorHdg' width='100%'>
	Funding Term
</div>
<br />
<b>Funding Term</b>&nbsp;&nbsp;
<span runat='server' id='spnFundingTerm' /><br /><br />

<!--<b>Provide a summary of the applicant's grant proposal that addresses:</b>
<ol style="list-style-type:lower-alpha">
	<li>the reviewer's overall analysis of the proposed delivery system based on the grant application,</li>
	<li>an analysis of the potential strengths and weaknesses identified, and</li>
	<li>any potential issues that may warrant further review or an on-site visit.</li>
</ol> -->

<!--<span runat='server' id='spnGrantProposalSummary' /> -->

<br /><br />

<table width='100%'>
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSaveAndContinue'/>
		</td>
	</tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscFundingTermID'>
					<Control ID='ctlFundingTerm'
						Type='cDropDown'
						Container='spnFundingTerm'
						DataObjectDefinitionKey='LscFundingTerm'
						StoredValue='LscFundingTermID'
						DisplayValue='Description' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantProposalSummary'>
					<Control ID='txtGrantProposalSummary'
						Type='cTextArea'
						Container='spnGrantProposalSummary'
						Rows='20'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnSaveAndContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscReviewAssignmentComments' DataObjectDefinitionKey='LscReviewAssignmentComments' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CommentsHtml' HtmlEncode='False'>
					<Control ID='spnComments'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
