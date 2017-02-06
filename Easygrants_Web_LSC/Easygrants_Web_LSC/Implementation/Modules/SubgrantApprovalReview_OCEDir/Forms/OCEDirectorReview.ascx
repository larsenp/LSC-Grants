<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlSubgrantInfo' 
	Src='Implementation/Modules/SubgrantApprovalReview_OCEDir/PageSection/SubgrantRequestInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg'>Instructions</div>
<p>After reviewing OCE and OPP recommendations, select the appropriate decision below and utilize the comment box to note any unique issues or concerns which need to be included in the decision letter. If a conflict exists between OCE and OPP’s recommendations as to whether or not the subgrant should be approved, the Vice President for Grants Management should be consulted prior to initiating any final decision.</p>

<div class='SeparatorHdg'>Documents Reviewed</div>
<p>This document certifies that the OCE director has considered the following (at minimum): OCE Reg. Compliance and OPP Director Review pdfs, relevant OCE Draft or Final Reports and follow-up activities, and OIG comments (written or verbal). </p>

<div class='SeparatorHdg'>OCE Director Decision</div>
 <p><ul>
    <li>Full funding of the subgrant is granted provided no issues or concerns have been raised in either the OCE or OPP review that would preclude full approval. </li> 
	<li>Provisional approval of the subgrant is granted if receipt of additional documents noted in either the OPP or OCE review is necessary prior to full approval.  </li>
	<li>Partial approval of the subgrant is granted if issues or concerns noted in either the OCE or OPP review have been raised that preclude full approval.</li>
	<li>A Decision to deny the subgrant is made if issues or concerns have been noted in either the OCE or OPP review that would preclude approval.</li>
 </ul>
 </p>
 
<table cellpadding="1" width="600px" >
	<tr>
		<td valign="top">
			<b>Decision</b>
		</td>
		<td>
			<span runat='server' id='spnWfTaskOutcomeID'/>
		</td>
	</tr>
</table>
<b>Comments</b><br />
<span runat='server' id='spnOverallComments'/>
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
							<Argument Group='(' Bool='And' />
					          <Argument Type='CurrentDateTime' TypeKey='Date' Operator='GreaterThanEqual' PropertyKey='EndDate' Value='' Bool=''/>	
					          <Argument Type='' TypeKey='' PropertyKey='EndDate' Value='null' Bool='Or'/>	
				            <Argument Group=')' Bool='' />
						</Filters>
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
