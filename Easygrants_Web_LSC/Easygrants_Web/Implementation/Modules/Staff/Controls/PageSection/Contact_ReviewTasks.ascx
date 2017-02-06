<%@ Control Language="vb" AutoEventWireup="True" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cContact_ReviewTasks" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnReviewTasks'/>
		</td>
	</tr>
</Table>


<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID'/>
				<Argument Group='(' Bool='And'/>
					<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='2' Bool=''>
						<RelatedProperty PropertyKey='WfTask'/>
					</Argument>
					<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='4' Bool='Or'>
						<RelatedProperty PropertyKey='WfTask'/>
					</Argument>
					<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='7' Bool='Or'>
						<RelatedProperty PropertyKey='WfTask'/>
					</Argument>
				<Argument Group=')' Bool=''/>	
			</Filters>
			<Sort>
				<Argument PropertyKey='GranteeProjectID' Direction='Descending'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnReviewTasks'
						Type='cDataListCtl'
						SeparatorWidth='2'
						NoRecordMessage='This person contact has not been assigned any review tasks.'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='' ColumnHeader='Action' Width='20%'> 
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='PersonTasks'>
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey="SortOrder" >
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnGo'
								Type='cButton'
								Image='Go'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='Execute_Action'>
									<Parameters>
										<Argument Type='Object' ObjectType='CoreControl'/>
										<Argument Type='Object' ObjectType='EventSource'/>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True' Width='5%'>
							<Control ID='ctlGrantID'
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
							<Sortable>
								<Argument PropertyKey='GranteeProjectID'>
								
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.WfProject.WfProjectName' ColumnHeader='FundingCycleName' Width='20%' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='WfProjectName'>
									<RelatedProperty PropertyKey='GranteeProject.WfProject'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='WfProjectTask.Description' ColumnHeader='Review Task' Width='20%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='WfProjectTask'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewAssignmentType.Description' ColumnHeader='Assignment Type' Width='10%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='ReviewAssignmentType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatusAbbr' ColumnHeader='Status' Width='10%'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatusAbbr'>
									<RelatedProperty PropertyKey='WfTaskStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' ColumnHeader='Outcome' Width='15%'>
							<Sortable>
								<Argument PropertyKey='WfTaskOutcome'>
									<RelatedProperty PropertyKey='WfTaskOutcome'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>