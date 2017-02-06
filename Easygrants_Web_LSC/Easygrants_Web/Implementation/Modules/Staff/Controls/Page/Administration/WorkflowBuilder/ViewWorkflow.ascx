<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<Core:cUserCtlLoader CtlID='ctlFundingOppCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/Page/Administration/WorkflowBuilder/FundingOppCycleInfo.ascx'
	runat='server'/>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Eligibility Workflow</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnEligibilityWorkflowTaskList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Application Workflow</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnApplicationWorkflowList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Application Related Third Party Task Workflow</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnApplicationThirdPartyTaskList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Review Task Workflow</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnReviewTaskList' visible='true'></span>
		</td>
	</tr><tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Grantee Reporting Task Workflow</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnGranteeReportingProjectTaskList' visible='true'></span>
		</td>
	</tr><tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Grantee Reporting Related Third Party Task Workflow</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnGranteeReportingThirdPartyTaskList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Grant Tasks</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnGrantTaskList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='EligibilityWorkflow' DataObjectDefinitionKey='WfProjectTaskOutcome' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTask' />
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='ParentProjectTaskID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTask' />
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='Description' Value='EligibilityWorkflow'>
					<RelatedProperty PropertyKey='WorkflowType'/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlEligibilityWorkflowTaskList'
						Container='spnEligibilityWorkflowTaskList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTaskOutcome'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfProjectTask.WfTask.WfTask' ColumnHeader='Task' Width='30%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='WfProjectTask.WfTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' ColumnHeader='Task Outcome' Width='20%'>
							<Sortable>
								<Argument PropertyKey='WfTaskOutcome'>
									<RelatedProperty PropertyKey='WfTaskOutcome' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTaskOutcomeTasks.NextWfProjectTask.WfTask.WfTask' ColumnHeader='Next Task Name' Width='30%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='WfProjectTaskOutcomeTasks.NextWfProjectTask.WfTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTaskOutcomeEvents.EventKeyID' ColumnHeader='Send E-mail' Width='10%'>
							<Parameters>
								<Argument Value='' ValueKey='WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='No' />
								<Argument Value='' Operator='NotEqual' ValueKey='WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='Yes' />
							</Parameters>
							<Sortable>
								<Argument PropertyKey='EventKeyID'>
									<RelatedProperty PropertyKey='WfProjectTaskOutcomeEvents' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTask.InitialProjectTask' ColumnHeader='Initial Task' Width='10%'>
							<Parameters>
								<Argument Value='True' ValueKey='WfProjectTask.InitialProjectTask' DisplayValue='Yes' />
								<Argument Value='False' ValueKey='WfProjectTask.InitialProjectTask' DisplayValue='No' />
							</Parameters>
							<Sortable>
								<Argument PropertyKey='InitialProjectTask'>
									<RelatedProperty PropertyKey='WfProjectTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='AppWfProjectTask' DataObjectDefinitionKey='WfProjectTaskOutcome' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTask' />
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='ParentProjectTaskID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTask' />
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='Description' Value='ApplicationWorkflow'>
					<RelatedProperty PropertyKey='WorkflowType'/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlApplicationWorkflowList'
						Container='spnApplicationWorkflowList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTaskOutcome'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfProjectTask.WfTask.WfTask' ColumnHeader='Task' Width='30%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='WfProjectTask.WfTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' ColumnHeader='Task Outcome' Width='20%'>
							<Sortable>
								<Argument PropertyKey='WfTaskOutcome'>
									<RelatedProperty PropertyKey='WfTaskOutcome' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTaskOutcomeTasks.NextWfProjectTask.WfTask.WfTask' ColumnHeader='Next Task Name' Width='30%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='WfProjectTaskOutcomeTasks.NextWfProjectTask.WfTask' />
								</Argument>
							</Sortable>
							<Parameters>
								<Argument Value='' ValueKey='WfProjectTaskOutcomeTasks.NextWfProjectTaskID' DisplayValue='' />
								<Argument Value='' Operator='NotEqual' ValueKey='WfProjectTaskOutcomeTasks.NextWfProjectTaskID' DisplayValue='' PropertyKey='WfProjectTaskOutcomeTasks.NextWfProjectTask.WfTask.WfTask' />
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTaskOutcomeEvents.EventKeyID' ColumnHeader='Send E-mail' Width='10%'>
							<Parameters>
								<Argument Value='' ValueKey='WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='No' />
								<Argument Value='' Operator='NotEqual' ValueKey='WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='Yes' />
							</Parameters>
							<Sortable>
								<Argument PropertyKey='EventKeyID'>
									<RelatedProperty PropertyKey='WfProjectTaskOutcomeEvents' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTask.InitialProjectTask' ColumnHeader='Initial Task' Width='10%'>
							<Parameters>
								<Argument Value='True' ValueKey='WfProjectTask.InitialProjectTask' DisplayValue='Yes' />
								<Argument Value='False' ValueKey='WfProjectTask.InitialProjectTask' DisplayValue='No' />
							</Parameters>
							<Sortable>
								<Argument PropertyKey='InitialProjectTask'>
									<RelatedProperty PropertyKey='WfProjectTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ThirdPartyTasks' DataObjectDefinitionKey='WfProjectTask' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='Description' Value='ApplicationWorkflow'>
					<RelatedProperty PropertyKey='WorkflowType'/>
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='ParentProjectTaskID' Value='null' Operator='NotEqual'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlApplicationThirdPartyTaskList'
						Container='spnApplicationThirdPartyTaskList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTask'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfTask.WfTask' ColumnHeader='Task' Width='50%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='WfTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ParentProjectTask.WfTask.WfTask' ColumnHeader='Related Task' Width='30%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='ParentProjectTask.WfTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTaskOutcome.WfProjectTaskOutcomeEvents.EventKeyID' ColumnHeader='Send E-mail' Width='20%'>
							<Parameters>
								<Argument Value='' ValueKey='WfProjectTaskOutcome.WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='No' />
								<Argument Value='' Operator='NotEqual' ValueKey='WfProjectTaskOutcome.WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='Yes' />
							</Parameters>
							<Sortable>
								<Argument PropertyKey='EventKeyID'>
									<RelatedProperty PropertyKey='WfProjectTaskOutcome.WfProjectTaskOutcomeEvents' />
								</Argument>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReviewWfProjectTask' DataObjectDefinitionKey='WfProjectTaskOutcome' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTask' />
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='ParentProjectTaskID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTask' />
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='Description' Value='ReviewWorkflow'>
					<RelatedProperty PropertyKey='WorkflowType'/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlReviewTaskList'
						Container='spnReviewTaskList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTaskOutcome'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfProjectTask.WfTask.WfTask' ColumnHeader='Task' Width='80%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='WfProjectTask.WfTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTaskOutcomeEvents.EventKeyID' ColumnHeader='Send E-mail' Width='20%'>
							<Parameters>
								<Argument Value='' ValueKey='WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='No' />
								<Argument Value='' Operator='NotEqual' ValueKey='WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='Yes' />
							</Parameters>
							<Sortable>
								<Argument PropertyKey='EventKeyID'>
									<RelatedProperty PropertyKey='WfProjectTaskOutcomeEvents' />
								</Argument>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='GranteeReportingWfProjectTask' DataObjectDefinitionKey='WfProjectTaskOutcome' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTask' />
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='ParentProjectTaskID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTask' />
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='Description' Value='GranteeReportingWorkflow'>
					<RelatedProperty PropertyKey='WorkflowType'/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlGranteeReportingProjectTaskList'
						Container='spnGranteeReportingProjectTaskList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTaskOutcome'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfProjectTask.WfTask.WfTask' ColumnHeader='Task' Width='30%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='WfProjectTask.WfTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' ColumnHeader='Task Outcome' Width='20%'>
							<Sortable>
								<Argument PropertyKey='WfTaskOutcome'>
									<RelatedProperty PropertyKey='WfTaskOutcome' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTaskOutcomeTasks.NextWfProjectTask.WfTask.WfTask' ColumnHeader='Next Task Name' Width='30%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='WfProjectTaskOutcomeTasks.NextWfProjectTask.WfTask' />
								</Argument>
							</Sortable>
							<Parameters>
								<Argument Value='' ValueKey='WfProjectTaskOutcomeTasks.NextWfProjectTaskID' DisplayValue='' />
								<Argument Value='' Operator='NotEqual' ValueKey='WfProjectTaskOutcomeTasks.NextWfProjectTaskID' DisplayValue='' PropertyKey='WfProjectTaskOutcomeTasks.NextWfProjectTask.WfTask.WfTask' />
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTaskOutcomeEvents.EventKeyID' ColumnHeader='Send E-mail' Width='10%'>
							<Parameters>
								<Argument Value='' ValueKey='WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='No' />
								<Argument Value='' Operator='NotEqual' ValueKey='WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='Yes' />
							</Parameters>
							<Sortable>
								<Argument PropertyKey='EventKeyID'>
									<RelatedProperty PropertyKey='WfProjectTaskOutcomeEvents' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTask.InitialProjectTask' ColumnHeader='Initial Task' Width='10%'>
							<Parameters>
								<Argument Value='True' ValueKey='WfProjectTask.InitialProjectTask' DisplayValue='Yes' />
								<Argument Value='False' ValueKey='WfProjectTask.InitialProjectTask' DisplayValue='No' />
							</Parameters>
							<Sortable>
								<Argument PropertyKey='InitialProjectTask'>
									<RelatedProperty PropertyKey='WfProjectTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='GranteeReportingThirdPartyTasks' DataObjectDefinitionKey='WfProjectTask' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='Description' Value='GranteeReportingWorkflow'>
					<RelatedProperty PropertyKey='WorkflowType'/>
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='ParentProjectTaskID' Value='null' Operator='NotEqual'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlGranteeReportingThirdPartyTaskList'
						Container='spnGranteeReportingThirdPartyTaskList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTask'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfTask.WfTask' ColumnHeader='Task' Width='50%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='WfTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ParentProjectTask.WfTask.WfTask' ColumnHeader='Related Task' Width='30%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='ParentProjectTask.WfTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTaskOutcome.WfProjectTaskOutcomeEvents.EventKeyID' ColumnHeader='Send E-mail' Width='20%'>
							<Parameters>
								<Argument Value='' ValueKey='WfProjectTaskOutcome.WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='No' />
								<Argument Value='' Operator='NotEqual' ValueKey='WfProjectTaskOutcome.WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='Yes' />
							</Parameters>
							<Sortable>
								<Argument PropertyKey='EventKeyID'>
									<RelatedProperty PropertyKey='WfProjectTaskOutcome.WfProjectTaskOutcomeEvents' />
								</Argument>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='GrantTask' DataObjectDefinitionKey='WfProjectTaskOutcome' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTask' />
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='ParentProjectTaskID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTask' />
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='Description' Value='GrantTaskWorkflow'>
					<RelatedProperty PropertyKey='WorkflowType'/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlGrantTaskList'
						Container='spnGrantTaskList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTaskOutcome'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfProjectTask.WfTask.WfTask' ColumnHeader='Task' Width='30%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='WfProjectTask.WfTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' ColumnHeader='Task Outcome' Width='20%'>
							<Sortable>
								<Argument PropertyKey='WfTaskOutcome'>
									<RelatedProperty PropertyKey='WfTaskOutcome' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTaskOutcomeTasks.NextWfProjectTask.WfTask.WfTask' ColumnHeader='Next Task Name' Width='30%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='WfProjectTaskOutcomeTasks.NextWfProjectTask.WfTask' />
								</Argument>
							</Sortable>
							<Parameters>
								<Argument Value='' ValueKey='WfProjectTaskOutcomeTasks.NextWfProjectTaskID' DisplayValue='' />
								<Argument Value='' Operator='NotEqual' ValueKey='WfProjectTaskOutcomeTasks.NextWfProjectTaskID' DisplayValue='' PropertyKey='WfProjectTaskOutcomeTasks.NextWfProjectTask.WfTask.WfTask' />
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTaskOutcomeEvents.EventKeyID' ColumnHeader='Send E-mail' Width='10%'>
							<Parameters>
								<Argument Value='' ValueKey='WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='No' />
								<Argument Value='' Operator='NotEqual' ValueKey='WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='Yes' />
							</Parameters>
							<Sortable>
								<Argument PropertyKey='EventKeyID'>
									<RelatedProperty PropertyKey='WfProjectTaskOutcomeEvents' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTask.InitialProjectTask' ColumnHeader='Initial Task' Width='10%'>
							<Parameters>
								<Argument Value='True' ValueKey='WfProjectTask.InitialProjectTask' DisplayValue='Yes' />
								<Argument Value='False' ValueKey='WfProjectTask.InitialProjectTask' DisplayValue='No' />
							</Parameters>
							<Sortable>
								<Argument PropertyKey='InitialProjectTask'>
									<RelatedProperty PropertyKey='WfProjectTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>