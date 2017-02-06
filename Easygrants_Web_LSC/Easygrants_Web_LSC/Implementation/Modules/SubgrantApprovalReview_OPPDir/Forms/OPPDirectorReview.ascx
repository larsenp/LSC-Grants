<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlSubgrantInfo' 
	Src='Implementation/Modules/SubgrantApprovalReview_OPPDir/PageSection/SubgrantRequestInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg'>Instructions</div>
<p>
	<i>TECHNICAL NOTE - KNOWN ISSUE:</i> There is a known technical issue with this page. The page has a main
	section, labeled "OPP Director Review Findings", and a second section which varies depending on which
	selection has been made on the Recommendation question. In some cases, if you change data in both the "OPP 
	Director Review Findings" and the recommendation-specific section below, then click <b>Save</b> or <b>Save and 
	Continue</b>, an error will be thrown. If you need to make changes in both sections of the page, make the changes
	one section at a time, clicking <b>Save</b> in between.
</p>
<div class='SeparatorHdg'>Documents Reviewed</div>
<p>
	This document certifies that the staff  reviewer has reviewed the Subgrant Request 
	Form, the Subgrant Agreement Form, PAI Plan (if a PAI subgrant), most recent competition or renewal narrative 
	(as applicable), recent OPP and OCE reports, the Program Planning and Assessment instrument (PPA), special grant 
	conditions (if applicable), and other pertinent records in LSC files.  The subgrant funding recommendation is based on 
	the ABA Standards for Providers of Civil Legal Aid and the LSC Performance Criteria.
</p>

<div class='SeparatorHdg'>Recommendation</div>
 <p><ul>
    <li>A recommendation for full funding of the subgrant is made provided no issues or concerns have been raised in the review that would preclude full approval. </li> 
	<li>A recommendation for provisional approval of the subgrant is made if receipt of additional documents noted below is necessary prior to full approval.  </li>
	<li>A recommendation for partial approval of the subgrant is made if issues or concerns noted below have been raised that preclude full approval.</li>
	<li>A recommendation for denial of the subgrant is made if issues or concerns noted below have been raised that would preclude approval.</li>
 </ul>
 </p>
<table cellpadding="1" width="600px" >

	<tr>
		<td valign="top">
			<b>Recommendation</b>
		</td>
		<td>
			<span runat='server' id='spnWfTaskOutcomeID'/>
		</td>
	</tr>
	<tr>
		<td colspan='2' style="text-align:center">
			<span runat='server' id='spnSave1'/>
		</td>
	</tr>
</table>
<br />
<Core:cUserCtlLoader CtlID='ctlFullApproval' 
	Src='Implementation/Modules/SubgrantApprovalReview_OPPDir/PageSection/FullApproval.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlPartialApproval' 
	Src='Implementation/Modules/SubgrantApprovalReview_OPPDir/PageSection/PartialApproval.ascx'
	runat='server'/>
	
<Core:cUserCtlLoader CtlID='ctlProvisionalApproval' 
	Src='Implementation/Modules/SubgrantApprovalReview_OPPDir/PageSection/ProvisionalApproval.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlDenial'
	Src='Implementation/Modules/SubgrantApprovalReview_OPPDir/PageSection/Denial.ascx'
	runat='server'/>
<br />
<div style="text-align:center">
	<span runat='server' id='spnSave2'/>&nbsp;
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
					<Control ID='ctlPartialApproval'
						Type='cUserCtlLoader'>
						<Visible>
							<Argument PropertyKey='WfTaskOutcome' Value='Recommend Partial Approval'>
								<RelatedProperty PropertyKey='WfTaskOutcome' />
							</Argument>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProvisionalApproval'
						Type='cUserCtlLoader'>
						<Visible>
							<Argument PropertyKey='WfTaskOutcome' Value='Recommend Provisional Approval'>
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
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave1'
						Type='cButton'
						Caption='Save'
						Container='spnSave1'>
						<Action PostBack='True'
							AutoSave='True' />
						<Visible>
							<Argument PropertyKey='WfTaskOutcomeID' Value='' Operator='NotEqual'/>
							<Argument PropertyKey='WfTaskOutcome' Value='In Process' Operator='NotEqual'>
								<RelatedProperty PropertyKey='WfTaskOutcome' />
							</Argument>
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscWftaSubgrantReviewOPP' DataObjectDefinitionKey='LscWftaSubgrantReviewOPP' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave2'
						Type='cButton'
						Caption='Save'
						Container='spnSave2'>
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
