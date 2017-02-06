<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Personal Tasks</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='List' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='PersonID' Value='' Bool=''/>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Value='1' Bool='And'/>
				<Argument Group = '(' Bool='And' />
				<Argument PropertyKey='WfTaskTypeID' Value='1' Bool=''>
					<RelatedProperty PropertyKey='WfTask' />
				</Argument>
				<Argument PropertyKey='WfTaskTypeID' Value='7' Bool='Or'>
					<RelatedProperty PropertyKey='WfTask' />
				</Argument>
				<Argument Group=')' Bool='' />
				<Argument PropertyKey='WfTaskID' Value='62' Operator='NotEqual' />
			</Filters>
			<Sort>
				<Argument PropertyKey='GranteeProjectID' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						NoRecordMessage='No personal tasks.'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='CreateDate' ColumnHeader='Task Creation Date' Format='MM/dd/yyyy' Width='15%'>	
							<Sortable>
								<Argument PropertyKey='CreateDate'/>
							</Sortable>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='WfTask.WfTask' ColumnHeader='Task' Width='15%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='WfTask'/>
								</Argument>
							</Sortable>
							<Control ID='ctlLink2' 
								Type='cLink'>
								<Action
									PostBack='True'
									Object='WebSession'
									Method='RedirectToModule'>
									<Parameters>
										<Argument AttributeName='PageKey1' Type='DataObjectRelated' TypeKey='WfTaskModule.ModuleName' />
										<Argument AttributeName='PageKey2' Type='DataObjectRelated' TypeKey='WfTaskModule.ModuleConfigFilename' />
										<Argument AttributeName='PageKey3' Value='' />
										<Argument AttributeName='PageKey4' Type='DataObject' TypeKey='WfTaskAssignmentID' Value='' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='GranteeProject.LegacyGrantID' ColumnHeader='TIG' Width='15%'>	
							<Sortable>
								<Argument PropertyKey='LegacyGrantID'>
									<RelatedProperty PropertyKey='GranteeProject'/>
								</Argument>
							</Sortable>
							<Control ID='ctlLinkGrantID'
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
						<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.OrganizationName' ColumnHeader='Organization' Width='15%'>
							<Sortable>
								<Argument PropertyKey='OrganizationName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryOrganization'/>
								</Argument>
							</Sortable>
							<Control ID='ctlLinkOrganization'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OrganizationContact'/>
										<Argument Type='DataObjectRelated' TypeKey='GranteeProject.PrimaryOrganizationID' AttributeName='PrimaryOrganizationID' BaseValue='PrimaryOrganizationID='/>
									</Parameters>
								</Action>
							</Control>
							
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.GrantStatus.Abbr' ColumnHeader='Grant Status' Width='15%'>
							<Sortable>
								<Argument PropertyKey='Abbr'>
									<RelatedProperty PropertyKey='GranteeProject.GrantStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.WfProject.WfCompetition.CompetitionName' ColumnHeader='Service Area' Width='15%'>
							<Sortable>
								<Argument PropertyKey='CompetitionName'>
									<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Reassign' Width='10%'>
							<Control ID='ctlReassign'
								Type='cLink'
								Caption='Reassign'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='Reassign'/>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<!--
						<DisplayProperty PropertyKey='WfTaskAssignmentID' ColumnHeader='WfTA' DebugOnly='False'/>
						<DisplayProperty PropertyKey='OpenDate' ColumnHeader='Open Date'/>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Person'/>
						-->
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
