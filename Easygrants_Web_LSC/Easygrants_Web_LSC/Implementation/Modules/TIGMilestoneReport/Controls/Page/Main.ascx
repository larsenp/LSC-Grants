<%@ Control Language="vb" AutoEventWireup="true" Codebehind="" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<div class='SeparatorHdg'>
	Grant/Payment Information
</div>
<br />
Grantee #: <span runat='server' id='spnGranteeNo' /><br />
TIG #: <span runat='server' id='spnTIG' /><br />
Grant Amount: <span runat='server' id='spnAwardAmount' /><br />
Period: <span runat='server' id='spnPaymentNumber' /><br />
Payment Amount: <span runat='server' id='spnRequestedAmount' />
<br /><br />
<div class='SeparatorHdg'>
	Milestones
</div>
<br />
<p>Please complete reports for the milestones associated with
Payment <span runat='server' id='spnPaymentNumber2' />. Your Payment Period ends on <span runat='server' id='spnRequestedDate' />. 
Your report is due within 30 days of this date.</p>
<p>Provide a Grantee Response for each milestone in the list.</p>
<p>You may optionally upload one or more files to supplement your response for each milestone.</p>
<p><b>CAUTION</b>: If you have added or changed any Grantee Responses, you must first click <b>Save</b> before uploading files, or you will 
lose the information you provided.</p>
<hr style="width:100%" />
<span runat='server' id='spnMilestones' />
<br />
<div style="width:100%; text-align:center">
	<span runat='server' id='spnSave'/>&nbsp;
	<span runat='server' id='spnSaveContinue' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Marker='Marker' Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnGranteeNo'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegacyGrantID'>
					<Control ID='spnTIG'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProjectInfo.AwardAmount' Format='$#,#'>
					<Control ID='spnAwardAmount'
						Type='HtmlGenericControl' />
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
						Caption='Save and Continue'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True' />	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Payment' DataObjectDefinitionKey='Payment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='ContingencyTaskAssignmentID' >
					<RelatedProperty PropertyKey='PaymentContingencyTask' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PaymentNumber'>
					<Control ID='spnPaymentNumber'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaymentNumber'>
					<Control ID='spnPaymentNumber2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequestedAmount' Format='$#,#'>
					<Control ID='spnRequestedAmount'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequestedDate' Format='MMMM d, yyyy'>
					<Control ID='spnRequestedDate'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscMilestone' DataObjectDefinitionKey='LscMilestone' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Payment' DataObjectPropertyKey='PaymentID' PropertyKey='PaymentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Payment' DataObjectPropertyKey='PaymentID' PropertyKey='PaymentID' />
			</DefaultValues>
			<Sort>
				<Argument PropertyKey='MilestoneNumber' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlMilestones'
						Container='spnMilestones' 
						Type='cDataPresenterList' 
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/TIGMilestoneReport/Controls/PageSection/MilestoneListItem.ascx' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>