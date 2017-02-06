<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlSubgrantInfo' 
	Src='Implementation/Modules/SubgrantApprovalReview_RC/PageSection/SubgrantRequestInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg'>Instructions</div>
<p>
	<i>TECHNICAL NOTE - KNOWN ISSUE:</i> There is a known technical issue with this page. The page has a main
	section, labeled "Regulatory Compliance Review Findings", and a second section which varies depending on which
	selection has been made on the Recommendation question. In some cases, if you change data in both the "Regulatory Compliance Review Findings" and the recommendation-specific section below, then click <b>Save</b> or <b>Save and 
	Continue</b>, an error will be thrown. If you need to make changes in both sections of the page, make the changes
	one section at a time, clicking <b>Save</b> in between.
</p>

<div class='SeparatorHdg'>Regulatory Compliance Review Findings</div>
<table cellpadding="1" width="600px" >
	<tr>
		<td valign="top">
			<b>Request Type</b>
		</td>
		<td>
			<span runat='server' id='spnIsNew'/>
		</td>
	</tr>
	<tr>
		<td width='200px' valign="top">
			<b>Does proposed agreement meet LSC's regulatory requirements?</b>
		</td>
		<td>
			<span runat='server' id='spnMeetsRegReqs'/>
		</td>
	</tr>
	<tr>
		<td valign="top">
			<b>Recommendation</b>
		</td>
		<td>
			<span runat='server' id='spnWfTaskOutcomeID'/>
		</td>
	</tr>
</table>
<b>Overall Comments</b><br />
<span runat='server' id='spnOverallComments'/>
<br />
<Core:cUserCtlLoader CtlID='ctlFullApproval' 
	Src='Implementation/Modules/SubgrantApprovalReview_RC/PageSection/FullApproval.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlPartialProvisionalApproval' 
	Src='Implementation/Modules/SubgrantApprovalReview_RC/PageSection/PartialProvisionalApproval.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlDenial'
	Src='Implementation/Modules/SubgrantApprovalReview_RC/PageSection/Denial.ascx'
	runat='server'/>
<br />
<div style="text-align:center">
	<span runat='server' id='spnSave'/>&nbsp;
	<span runat='server' id='spnSaveContinue'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='ctlWfTaskOutcomeID'
						Type='cRadioButtonList'
						Container='spnWfTaskOutcomeID'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'
						RepeatDirection='Vertical'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID'/>
							<Argument PropertyKey='WfTaskOutcome' Value='In Process' Operator='NotEqual'/>
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlFullApproval'
						Type='cUserCtlLoader'>
						<Visible>
							<Argument PropertyKey='WfTaskOutcome' Value='Recommend for Full Approval'>
								<RelatedProperty PropertyKey='WfTaskOutcome' />
							</Argument>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlPartialProvisionalApproval'
						Type='cUserCtlLoader'>
						<Visible>
							<Argument PropertyKey='WfTaskOutcome' Value='Recommend Part./Prov. Approv.'>
								<RelatedProperty PropertyKey='WfTaskOutcome' />
							</Argument>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlDenial'
						Type='cUserCtlLoader'>
						<Visible>
							<Argument PropertyKey='WfTaskOutcome' Value='Recommend Denial'>
								<RelatedProperty PropertyKey='WfTaskOutcome' />
							</Argument>
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscWftaSubgrantReviewDD' DataObjectDefinitionKey='LscWftaSubgrantReviewDD' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsNew'>
					<Control ID='ctlIsNew'
						Type='cRadioButtonList'
						Container='spnIsNew'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='New'/>
							<Parameter StoredValue='False' DisplayValue='Renewal'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MeetsRegReqs'>
					<Control ID='ctlMeetsRegReqs'
						Type='cRadioButtonList'
						Container='spnMeetsRegReqs'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OverallComments'>
					<Control ID='txtOverallComments'
						Type='cTextArea'
						Container='spnOverallComments'
						Rows='5'
						Cols='80'/>
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
