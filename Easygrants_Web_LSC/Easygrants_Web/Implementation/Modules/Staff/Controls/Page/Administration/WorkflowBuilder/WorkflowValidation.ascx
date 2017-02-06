<%@ Control Language="vb" AutoEventWireup="true" Codebehind="WorkflowValidation.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder.cWorkflowValidation" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cNewWindowOpener id='ctlNewWindowOpener' runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlFundingOppCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/Page/Administration/WorkflowBuilder/FundingOppCycleInfo.ascx'
	runat='server'/>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnViewWorkflow'></span>
		</td>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Tasks</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnTaskList'></span>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlViewWorkflow' 
						Type='cButton' 
						Image='View Workflow'
						Container='spnViewWorkflow'>
							<Action
								PostBack='True'
								Object='DataPresenter'
								Method='ViewWorkflow'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ViewWorkflow'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlTaskList'
						Container='spnTaskList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTask'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfTask.WfTask' ColumnHeader='Task' Width='55%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='WfTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='StartDate' ColumnHeader='Start Date' Format='MM/dd/yyyy' Width='5%'>
							<Sortable>
								<Argument PropertyKey='StartDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='OpenDate' ColumnHeader='Open Date' Format='MM/dd/yyyy' Width='5%'>
							<Sortable>
								<Argument PropertyKey='OpenDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='DueDate' ColumnHeader='Due Date' Format='MM/dd/yyyy' Width='5%'>
							<Sortable>
								<Argument PropertyKey='DueDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CloseDate' ColumnHeader='Close Date' Format='MM/dd/yyyy' Width='5%'>
							<Sortable>
								<Argument PropertyKey='CloseDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='EndDate' ColumnHeader='End Date' Format='MM/dd/yyyy' Width='5%'>
							<Sortable>
								<Argument PropertyKey='EndDate'/>
							</Sortable>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Right' DataAlign='Center'>
							<Control ID='btnModifyDates'
								Type='cButton'
								Image='Modify Dates'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='WorkflowProjectTaskDatesEditor'/>
										<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
										<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
										<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskID' AttributeName='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnValidation'
								Type='cButton'
								Image='Validation'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='WorkflowValidationEditor'/>
										<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
										<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
										<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskID' AttributeName='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
										<Argument Type='DataObject' TypeKey='WfTaskID' AttributeName='WfTaskID' BaseValue='WfTaskID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>