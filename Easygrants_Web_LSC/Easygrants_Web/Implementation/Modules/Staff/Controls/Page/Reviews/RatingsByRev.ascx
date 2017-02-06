<%@ Control Language="vb" AutoEventWireup="true" Codebehind="RatingsByRev.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cRatingsByRev" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->
<table runat='server' width='100%' cellpadding='2' cellspacing='0' border='0'>
	<tr><td class='SeparatorHdg'>Submit or Unsubmit for Reviewer</td></tr>
	<tr><td>&nbsp;<a name='CheckClearAll'/></td></tr>
	<tr>
		<td>
			<span runat='server' id='spnCheckAll'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnClearAll'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<P>
				Use the functions below to submit or unsubmit conflicts/preferences, scores, and comments for a reviewer. 
				To submit or unsubmit selected scores, first select the items by clicking the checkbox to the left of the 
				participant's name. Then click the appropriate <b>Go</b> button to submit or unsubmit the checked items. 
				Use the <b>Check All</b> or <b>Clear All</b> links to select or unselect all of the items.
			</P>
		</td>
	</tr>
	<tr><td>&nbsp;<a name='Go'/></td></tr>
	<tr>
		<td><b>Submit Checked Reviews</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnSubmit'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Unsubmit Checked Reviews</b>&nbsp;&nbsp;<span runat='server' id='spnUnsubmit'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table runat='server' width='100%' cellpadding='2' cellspacing='0' border='0'>
	<tr>
		<td class='SeparatorHdg'>View and Modify Conflicts/Preferences, Scores, and Comments</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' visible='false' width='100%'>
	<tr>
		<td width='70'><b>Reviewer</b></td>
		<td><span runat='server' id='spnReviewer' visible='true'/></td>	
		<td width='30'></td>	
		<td width='90'><b><%=GetLabel("Organization")%></b></td>
		<td><span runat='server' id='spnOrganization' visible='true'/></td>			
	</tr>	
	<tr><td colspan='2'>&nbsp;</td></tr>
</table>
<table runat='server' width='100%'>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAllRCEditor'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAllScoreEditor'/>
		</td>
		<td align='right'>
			<b>Assignments:</b> <span runat='server' id='spnCount'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'><span runat='server' id='spnList'/></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="2" align='center'>
			<span runat='server' id='spnClose'/>		
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
				<Argument Type='QueryString' TypeKey='ID' PropertyKey='PersonID'/>
				<!--
				<Argument Type='Data' TypeKey='' PropertyKey='WfProjectOutcomeID' Value='null'>
					<RelatedProperty PropertyKey='GranteeProject' />
				</Argument>
				-->
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
				</Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
				</Argument>
				<Argument PropertyKey='MiddleName'>
					<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnList'
						DataObjectDefinitionKey='WfTaskAssignment'
						Type='cDataListCtl'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='' ColumnHeader='Select' HeaderAlign='Center' DataAlign='Center' Width='5%'>
							<Control ID='chkFlag'
								Type='cCheckBox'/>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName' ColumnHeader='Participant' Width='15%'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
								<Argument PropertyKey='MiddleName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='Participant ~~Organization~~' Width='19%'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryOrganization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True' Width='7%'>	
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
						<DisplayProperty PropertyKey='ReviewAssignmentType.Description' ColumnHeader='Assignment Type' Width='15%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='ReviewAssignmentType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatusAbbr' ColumnHeader='Status' Width='7%'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatusAbbr'>
									<RelatedProperty PropertyKey='WfTaskStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RequestConflict.Description' ColumnHeader='Conflict/Preference' HeaderAlign='Center' DataAlign='Center' Width='10%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='RequestConflict'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewRating' ColumnHeader='Score' HeaderAlign='Center' DataAlign='Center'  Width='7%'>
							<Sortable>
								<Argument PropertyKey='ReviewRating'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Center' Width='15%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ScoreEditor'/>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
										<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
										<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReviewCommitteeMember' DataObjectDefinitionKey='ReviewCommitteeMember' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID'/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='Person.LastNameFirstNameMiddleName'>
					<Control ID='spnReviewer' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Person.PersonPrimaryAffiliations.Organization.CommonOrganizationName'>
					<Control ID='spnOrganization' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
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
								<Argument Value='check'/>
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
								<Argument Value='clear'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
					<Control ID='lnkAllRCEditor'
						Container='spnAllRCEditor'
						Type='cButton'
						Caption='Edit All External Conflicts and Preferences'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='AllRequestConflictEditor'/>
								<Argument Type='QueryString' TypeKey='ID' PropertyKey='PersonID' BaseValue='PersonID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
					<Control ID='lnkAllScoreEditor'
						Container='spnAllScoreEditor'
						Type='cButton'
						Caption='Edit All Scores'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='AllScoreEditor'/>
								<Argument Type='QueryString' TypeKey='ID' PropertyKey='PersonID' BaseValue='PersonID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Type='cButton'
						Container='spnSubmit'
						Image='Go'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='UpdateStatus'>
							<Parameters>
								<Argument Value='2'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnUnsubmit'
						Type='cButton'
						Container='spnUnsubmit'
						Image='Go'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='UpdateStatus'>
							<Parameters>
								<Argument Value='1'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->



