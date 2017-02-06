<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ReviewStageRank.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cReviewStageRank" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStagePages.ascx'
	runat='server'/>
<br>

<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='Rankings' LinkTitle='Rankings' runat='server'/>
<p>
<Core:cUserCtlLoader CtlID='ReviewStageInfo'
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStageInfo.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Participant Tasks With Scores and Rankings</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
Set the scores and rank order for the participant tasks below by following these three steps. 
<br />
<br />
<b>Step 1:</b>&nbsp;Select the participant tasks for which you want to set the outcomes (you can click the <b>Check All</b> or <b>Clear All</b> links, select within a range of scores or rankings and/or selectively check or uncheck items). <br />
<b>Step 2:</b>&nbsp;With the desired items selected, click the <b>Go</b> button - first for the Calculate/Recalculate Average Scores, then for the Calculate/Recalculate Rank Order.<br /> 
<b>Step 3:</b>&nbsp;Refresh the page to see your results. 
<br />
<p> 
<a name='Go'/>
<span runat='server' id='spnCheckAll'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnClearAll'/>
<br><br>
<table border='0'>
	<tr>
		<td>
			<b>Calculate/Recalculate Average Scores</b>
		</td>
		<td>
			<span runat='server' id='spnCalculateScores' visible='true'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
		<td>
			Last Run:&nbsp;<span runat='server' id='spnDateScores'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			By:&nbsp;<span runat='server' id='spnNameScores'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>
			Status:&nbsp;<span runat='server' id='spnStatusScores'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Calculate/Recalculate Rank Order</b>
		</td>
		<td>
			<span runat='server' id='spnCalculateRank' visible='true'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
		<td>
			Last Run:&nbsp;<span runat='server' id='spnDateRank'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			By:&nbsp;<span runat='server' id='spnNameRank'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>
			Status:&nbsp;<span runat='server' id='spnStatusRank'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<span runat='server' id='spnList'/>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Apps' DataObjectDefinitionKey='GranteeProjectReviewStage' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
				<!--
				<Argument Type='QueryString' TypeKey='CmpID' PropertyKey='CompetitionID'>
					<RelatedProperty PropertyKey='GranteeProject.WfProject' />
				</Argument>
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
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCalculateScores'
						Container='spnCalculateScores'
						Type='cButton'
						Image='Go'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CalculateScoresOrRank'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='CalculateAverageScores'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCalculateRank'
						Container='spnCalculateRank'
						Type='cButton'
						Image='Go'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CalculateScoresOrRank'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='CalculateRankings'/>
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
						
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True' >	
							<Sortable>
								<Argument PropertyKey='GranteeProjectID'/>
							</Sortable>
							<Control ID='ctlLinkGrantID'
								ToolTipPropertyKey='GranteeProject.GrantTitle'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantsEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='DataCommandRequestScores' DataObjectDefinitionKey='DataCommandRequest' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='Data' TypeKey='' PropertyKey='DataCommandKey' Value='CalculateAverageScores' bool=''/>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='CreateDate' Direction='Descending'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CreateDate'>
					<Control ID='spnDateScores' Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CreatedByUser.Person.LastNameFirstName'>
					<Control ID='spnNameScores' Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataCommandRequestStatus.Description'>
					<Control ID='spnStatusScores' Type='HtmlGenericControl'/>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='DataCommandRequestRank' DataObjectDefinitionKey='DataCommandRequest' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='Data' TypeKey='' PropertyKey='DataCommandKey' Value='CalculateRankings' bool=''/>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='CreateDate' Direction='Descending'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CreateDate'>
					<Control ID='spnDateRank' Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CreatedByUser.Person.LastNameFirstName'>
					<Control ID='spnNameRank' Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataCommandRequestStatus.Description'>
					<Control ID='spnStatusRank' Type='HtmlGenericControl'/>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
