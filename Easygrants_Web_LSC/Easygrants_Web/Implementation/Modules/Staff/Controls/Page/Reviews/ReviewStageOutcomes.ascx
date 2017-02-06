<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ReviewStageOutcomes.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cReviewStageOutcomes" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStagePages.ascx'
	runat='server'/>
<br>

<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='Outcomes' LinkTitle='Outcomes' runat='server'/>
<br>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ReviewStageInfo'
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStageInfo.ascx'
	runat='server'/>
<br>
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Step 1: Select Participants</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table>
	<tr>
		<td valign='top'>
			Select Items with Average Scores Between&nbsp;<a name='Select1'/>
		<td>
		<span runat='server' id='spnCutLow'/>&nbsp;
		and&nbsp;
		<span runat='server' id='spnCutHigh'/>&nbsp;
		<span runat='server' id='spnApplyCut'/>
		<br>
	</tr>
	<tr>
		<td valign='top'>
			Select Items with a Rank Order Between&nbsp;<a name='Select2'/>
		<td>
		<span runat='server' id='spnCutoffLow'/>&nbsp;
		and&nbsp;
		<span runat='server' id='spnCutoffHigh'/>&nbsp;
		<span runat='server' id='spnApplyCutoff'/>
		<br>
	</tr>
</table>

<a name='Check'/>
<span runat='server' id='spnCheckAll'/>&nbsp;&nbsp;&nbsp;&nbsp;<a name='Clear'/><span runat='server' id='spnClearAll'/>
<p>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Step 2: Set and Finalize Stage Outcomes; Update Recommended Amounts</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Set Proposed Stage Outcome</b>&nbsp;&nbsp;<a name='Set1'/>
			<span runat='server' id='spnApplOutcomes'/>&nbsp;&nbsp;
			<span runat='server' id='spnSetProposedApplOutcomes'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Finalize Stage Outcomes</b>&nbsp;&nbsp;<a name='Finalize1'/>
			<span runat='server' id='spnSetApplOutcomes'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br>
<span runat='server' id='spnList'/>
<br><br>
<table id="Table3" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg">
			<b>Step 3: Set and Finalize Grant Status and Overall Grant Project Outcomes - (Final Review Stage Only)</b>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
			If you are at the final review stage in the review process, you must also set and
			finalize the Overall Grant Project Outcome.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
			<b>Step 1:</b> First select the participants for which you want to set the
			Overall Grant Project Outcome. (Note: You can click the <b>Check All</b> or <b>Clear All</b>
			link, select within a range of rankings and/or selectively check or uncheck participants).
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<b>Step 2:</b> With the desired participants selected, select the appropriate
			Grant Status below, and click on the <b>Set</b> button.
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<b>Step 3:</b> With the desired participants selected, select the appropriate
			Outcome below, and click on the <b>Set</b> button.
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<b>Step 4:</b> When you want to finalize the Outcome setting, check the desired
			items (they can have different outcomes), and click on the <b>Finalize</b> button
			below.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
			<b>IMPORTANT:</b> Do not set the Grant Status or Grant Project Outcome if you are not at the
			final review stage. Once you finalize the Grant Status and Grant Project Outcome, the status and outcome you
			select will be displayed above in the Grant Status and Grant Project Outcome columns respectively. You can reset
			a Grant Status or Grant Project Outcome after it is finalized by resetting the status and outcome, then
			finalizing again.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td  width='20%'>
			<b>Set Proposed Grant Status</b>
		</td>
		<td>
			<span runat='server' id='spnGPStatusOverall'/>&nbsp;&nbsp;
			<span runat='server' id='spnSetProposedGPStatusesOverall'/>
		</td>
	</tr>
	<tr>
		<td width='20%'>
			<b>Set Proposed Overall Grant Project Outcome</b><a name='Set2'/>
		</td>
		<td>
			<span runat='server' id='spnGPOutcomeOverall'/>&nbsp;&nbsp;
			<span runat='server' id='spnSetProposedGPOutcomesOverall'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<b>Finalize Overall Grant Project Outcomes for Checked Items</b>&nbsp;&nbsp;<a name='Finalize2'/>
			<span runat='server' id='spnFinalizeGPOverall'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewStage' DataObjectDefinitionKey='ReviewCycleStage'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnApplyCut'
						Container='spnApplyCut'
						Type='cButton'
						Image='Select'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='ApplyCutoff'>
							<Parameters>
								<Argument Value='AverageRating'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnApplyCutoff'
						Container='spnApplyCutoff'
						Type='cButton'
						Image='Select'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='ApplyCutoff'>
							<Parameters>
								<Argument Value='PercentRank'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ScoreCutoffLow'>
					<Control ID='txtCutLow'
						Container='spnCutLow'
						Type='cTextBox'
						Size='3'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ScoreCutoffHigh'>
					<Control ID='txtCutHigh'
						Container='spnCutHigh'
						Type='cTextBox'
						Size='3'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CutoffLow'>
					<Control ID='txtCutoffLow'
						Container='spnCutoffLow'
						Type='cTextBox'
						Size='3'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CutoffHigh'>
					<Control ID='txtCutoffHigh'
						Container='spnCutoffHigh'
						Type='cTextBox'
						Size='3'/>
				</DisplayProperty>
				<!--
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplOutcomes'
						Container='spnApplOutcomes'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'
						RequiredField='True'
						ErrorMessage='You must select an Application outcome.'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='ReviewStage' PropertyKey='WfTaskID' DataObjectPropertyKey='WfTaskID' Value='' />
						</Filters>
						<Sort>
						</Sort>
					</Control>
				</DisplayProperty>
				-->
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplOutcomes'
						Container='spnApplOutcomes'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'
						DisplayNone='False'
						DisplayText='Select an Outcome '
						RequiredField='True'
						ErrorMessage='Review Stage Outcome is required.'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='ReviewStage' PropertyKey='WfTaskID' DataObjectPropertyKey='WfTaskID' Value='' />
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTaskOutcome' />
						</Sort>
					</Control>
				</DisplayProperty>

			</DisplayProperties>
		</DataObject>
		<DataObject Key='Apps' DataObjectDefinitionKey='GranteeProjectReviewStage' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
				<!--
				<Argument Type='Data' TypeKey='' PropertyKey='WfProjectOutcomeID' Value='null'>
					<RelatedProperty PropertyKey='GranteeProject' />
				</Argument>
				-->
			</Filters>
			<Sort>
				<Argument PropertyKey='AverageRating'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkCheckAll'
						Container='spnCheckAll'
						Type='cLink'
						Caption='Check All'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='CheckClearAll'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='check'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkClearAll'
						Container='spnClearAll'
						Type='cLink'
						Caption='Clear All'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='CheckClearAll'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='clear'/>
							</Parameters>						
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnList'
						Type='cDataListCtl'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='FlagForAction' ColumnHeader=' '>
							<Control ID='chkFlag' Type='cCheckBox'/>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PercentRank' ColumnHeader='Rank Order'>
							<Sortable>
								<Argument PropertyKey='PercentRank'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AverageRating' ColumnHeader='Average Score' >
							<Sortable>
								<Argument PropertyKey='AverageRating'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True' >
							<Sortable>
								<Argument PropertyKey='GranteeProjectID'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName' ColumnHeader='Participant'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='Participant ~~Organization~~'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryOrganization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ProposedOutcome.WfTaskOutcome' ColumnHeader='Proposed Review Stage Outcome'>
							<Sortable>
								<Argument PropertyKey='WfTaskOutcome'>
									<RelatedProperty PropertyKey='ProposedOutcome'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ApplOutcomeFinalize' Format='YesNo' ColumnHeader='Review Stage Outcome Finalized? (Y/N)'>
							<Sortable>
								<Argument PropertyKey='ApplOutcomeFinalize'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ProposedGranteeProjectStatus.Abbr' ColumnHeader='Proposed Grant Status'>
							<Sortable>
								<Argument PropertyKey='Abbr'>
									<RelatedProperty PropertyKey='ProposedGranteeProjectStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ProposedGranteeProjectOutcome.Description' ColumnHeader='Proposed Grant Project Outcome'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='ProposedGranteeProjectOutcome'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.WfProjectOutcome.Description' ColumnHeader='Overall Grant Project Outcome'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='GranteeProject.WfProjectOutcome'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<!--
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplOutcomes'
						Container='spnApplOutcomes'
						Type='cDropDown'
						DataObjectDefinitionKey='vStageOutcomes'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='Description'
						DisplayNone='False'
						DisplayText='Select an Outcome '
						RequiredField='True'
						ErrorMessage='You must select a Review Stage Outcome.'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='ReviewStage' DataObjectPropertyKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
							<Argument PropertyKey='WfTaskRoleID' Value='1' />
						</Filters>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
					</Control>
				</DisplayProperty>
				-->
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSetProposedApplOutcomes'
						Container='spnSetProposedApplOutcomes'
						Type='cButton'
						Image='Set'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='SetProposedApplOutcomes'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSetApplOutcomes'
						Container='spnSetApplOutcomes'
						Type='cButton'
						Image='Finalize'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='SetApplOutcomes'/>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGPOutcomes'
						Container='spnGPOutcomeOverall'
						Type='cDropDown'
						DataObjectDefinitionKey='GrantOutcome'
						StoredValue='GrantOutcomeID'
						DisplayValue='Description'
						DisplayNone='False'
						DisplayText='Select an Outcome '
						RequiredField='True'
						ErrorMessage='Grant Project Outcome is required.'>
						<Filters>
						</Filters>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSetProposedGPOutcomesOverall'
						Container='spnSetProposedGPOutcomesOverall'
						Type='cButton'
						Image='Set'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='SetProposedGPOutcomes'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGPStatuses'
						Container='spnGPStatusOverall'
						Type='cDropDown'
						DataObjectDefinitionKey='GrantStatus'
						StoredValue='GrantStatusID'
						DisplayValue='Abbr'
						DisplayNone='False'
						DisplayText='Select a Status '>
						<Filters>
						</Filters>
						<Sort>
							<Argument PropertyKey='Abbr' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSetProposedGPStatusesOverall'
						Container='spnSetProposedGPStatusesOverall'
						Type='cButton'
						Image='Set'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='SetProposedGPStatuses'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkFinalizeGPOverall'
						Container='spnFinalizeGPOverall'
						Type='cButton'
						Confirmation='Are you sure you want to finalize the Status and Outcomes for the selected participants?'
						Image='Finalize'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='FinalizeOutcomeGP'>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
