<%@ Control Language="vb" AutoEventWireup="true" Codebehind="WorkflowBuilderMain.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder.cWorkflowBuilderMain" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cNewWindowOpener id='ctlNewWindowOpener' runat='server' />

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
		<td colspan='2' class="SeparatorHdg"><b><%=TaskTypeHeader%> Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAdd'></span>
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnTaskList'></span>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server' id='tblWorkflow' visible='true'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b><%=WorkflowHeader%> Workflow</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr id='trAddWorkflow'>
		<td>
			<span runat='server' id='spnAddWorkflow'></span>
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr id='trWorkflowList'>
		<td colspan='2'>
			<span runat='server' id='spnWorkflowTaskList'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server' id='tblThirdPartyTasks' visible="true">
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Related Third Party Task Workflow</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr id='trAddThirdPartyTasks'>
		<td>
			<span runat='server' id='spnAddThirdPartyTasks'></span>
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr id='trThirdPartyTaskList'>
		<td colspan='2'>
			<span runat='server' id='spnThirdPartyTaskList'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
				<Argument Type='QueryString' TypeKey='Page' PropertyKey='Description'>
					<RelatedProperty PropertyKey='WorkflowType'/>
				</Argument>
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
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='WorkflowProjectTaskEditor'/>
									<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
									<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
									<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
									<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
									<Argument Type='Data' TypeKey='' Value='WfProjectTaskID=0'/>
									<Argument Type='QueryString' TypeKey='Page' BaseValue='WfBuilderPageKey='/>
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
						<DisplayProperty PropertyKey='Description' ColumnHeader='Task' Width='30%'>
							<Sortable>
								<Argument PropertyKey='Description'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<%--<DisplayProperty PropertyKey='WfProjectTaskOutcome.WfProjectTaskOutcomeEvents.EventKeyID' ColumnHeader='Send E-mail' Width='10%'>
							<Parameters>
								<Argument Value='' ValueKey='WfProjectTaskOutcome.WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='No' />
								<Argument Value='' Operator='NotEqual' ValueKey='WfProjectTaskOutcome.WfProjectTaskOutcomeEvents.EventKeyID' DisplayValue='Yes' />
							</Parameters>
						</DisplayProperty>--%>
						<DisplayProperty PropertyKey='StartDate' ColumnHeader='Start Date' Format='MM/dd/yyyy' Width='10%'>
							<Sortable>
								<Argument PropertyKey='StartDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='OpenDate' ColumnHeader='Open Date' Format='MM/dd/yyyy' Width='10%'>
							<Sortable>
								<Argument PropertyKey='OpenDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='DueDate' ColumnHeader='Due Date' Format='MM/dd/yyyy' Width='10%'>
							<Sortable>
								<Argument PropertyKey='DueDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CloseDate' ColumnHeader='Close Date' Format='MM/dd/yyyy' Width='10%'>
							<Sortable>
								<Argument PropertyKey='CloseDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='EndDate' ColumnHeader='End Date' Format='MM/dd/yyyy' Width='15%'>
							<Sortable>
								<Argument PropertyKey='EndDate'/>
							</Sortable>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='3' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEditProjectTask'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='WorkflowProjectTaskEditor'/>
										<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
										<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
										<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
										<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
										<Argument Type='DataObjectRelated' TypeKey='WfTask.WfTaskTypeID' AttributeName='WfTask.WfTaskTypeID' BaseValue='WfTaskTypeID='/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskID' AttributeName='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
										<Argument Type='QueryString' TypeKey='Page' BaseValue='WfBuilderPageKey='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' HeaderAlign='Left' DataAlign='Left'>
							<Control ID='btnQuiz'
								Type='cButton'
								Image='Quiz'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='WorkflowEligibilityQuizBuilder'/>
										<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
										<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
										<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
										<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskID' AttributeName='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
										<Argument Type='QueryString' TypeKey='Page' BaseValue='WfBuilderPageKey='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnDeleteProjectTask'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='WfProjectTaskID' AttributeName='WfProjectTaskID' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfProjectWorkflow' DataObjectDefinitionKey='WfProjectTaskOutcome' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTask' />
				</Argument>
				<%--<Argument Type='QueryString' TypeKey='TaskTypeID' PropertyKey='WfTaskTypeID'>
					<RelatedProperty PropertyKey='WfProjectTask.WfTask' />
				</Argument>--%>
				<Argument Type='' TypeKey='' PropertyKey='ParentProjectTaskID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTask' />
				</Argument>
				<Argument Type='QueryString' TypeKey='Page' PropertyKey='Description'>
					<RelatedProperty PropertyKey='WorkflowType'/>
				</Argument>
			</Filters>	
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddWorkFlow' 
						Type='cButton' 
						Image='Add'
						Container='spnAddWorkFlow'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='WorkflowEditor'/>
									<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
									<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
									<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
									<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
									<Argument Type='Data' TypeKey='' BaseValue='WfProjectTaskOutcomeID=0'/>
									<Argument Type='QueryString' TypeKey='Page' BaseValue='WfBuilderPageKey='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlWorkflowTaskList'
						Container='spnWorkflowTaskList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTaskOutcome'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfProjectTask.Description' ColumnHeader='Task' Width='30%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='WfProjectTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' ColumnHeader='Task Outcome' Width='15%'>
							<Sortable>
								<Argument PropertyKey='WfTaskOutcome'>
									<RelatedProperty PropertyKey='WfTaskOutcome' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTaskOutcomeTasks.NextWfProjectTask.Description' ColumnHeader='Next Task Name' Width='30%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='WfProjectTaskOutcomeTasks.NextWfProjectTask' />
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
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Center' Width='15%'>
							<Control ID='btnEditWorkFlow'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='WorkflowEditor'/>
										<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
										<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
										<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
										<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
										<Argument Type='DataObjectRelated' TypeKey='WfProjectTask.WfTask.WfTaskTypeID' AttributeName='WfTask.WfTaskTypeID' BaseValue='WfTaskTypeID='/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskOutcomeID' AttributeName='WfProjectTaskOutcomeID' BaseValue='WfProjectTaskOutcomeID='/>
										<Argument Type='QueryString' TypeKey='Page' BaseValue='WfBuilderPageKey='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
					        <Control ID='btnDeleteWorkFlow'
						        Type='cButton'
						        Image='Disconnect'
						        Confirmation='Are you sure you want to disconnect this item from the workflow?'>
							        <Action
							        PostBack='True'
							        Object='EventController'
							        Method='EventController_Delete'>
							        <Parameters>
								        <Argument Type='DataObject' TypeKey='WfProjectTaskOutcomeID' AttributeName='WfProjectTaskOutcomeID' Value=''/>
								        <RelatedDataObjects>
									        <RelatedDataObject DataObjectDefinitionKey='WfProjectTaskOutcomeTasks'>
										        <RelationshipProperties>
											        <RelationshipProperty parentProperty='WfProjectTaskOutcomeID' childProperty='WfProjectTaskOutcomeID' />
										        </RelationshipProperties>
									        </RelatedDataObject>
									        <RelatedDataObject DataObjectDefinitionKey='WfProjectTaskOutcomeEvents'>
										        <RelationshipProperties>
											        <RelationshipProperty parentProperty='WfProjectTaskOutcomeID' childProperty='WfProjectTaskOutcomeID' />
										        </RelationshipProperties>
										        <RelatedDataObjects>
													<RelatedDataObject DataObjectDefinitionKey='Event'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='EventKeyID' childProperty='EventID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='EventCorrespondence'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='EventKeyID' childProperty='EventID' />
														</RelationshipProperties>
													</RelatedDataObject>
												</RelatedDataObjects>
									        </RelatedDataObject>
									        <RelatedDataObject DataObjectDefinitionKey='WfProjectTaskOutcomeFilters'>
										        <RelationshipProperties>
											        <RelationshipProperty parentProperty='WfProjectTaskOutcomeID' childProperty='WfProjectTaskOutcomeID' />
										        </RelationshipProperties>
												<RelatedDataObjects>
													<RelatedDataObject DataObjectDefinitionKey='FilterArgument'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='FilterArgumentID' childProperty='FilterArgumentID' />
														</RelationshipProperties>
													</RelatedDataObject>
												</RelatedDataObjects>
									        </RelatedDataObject>
								        </RelatedDataObjects>
							        </Parameters>
						        </Action>
					        </Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ThirdPartyTasks' DataObjectDefinitionKey='WfProjectTask' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
				<Argument Type='QueryString' TypeKey='Page' PropertyKey='Description'>
					<RelatedProperty PropertyKey='WorkflowType'/>
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='ParentProjectTaskID' Value='null' Operator='NotEqual'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddThirdPartyTasks' 
						Type='cButton' 
						Image='Add'
						Container='spnAddThirdPartyTasks'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ThirdPartyBuilderEditor'/>
									<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
									<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
									<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
									<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
									<Argument Type='Data' TypeKey='' BaseValue='WfProjectTaskID=0'/>
									<Argument Type='QueryString' TypeKey='Page' BaseValue='WfBuilderPageKey='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlApplicationThirdPartyTaskList'
						Container='spnThirdPartyTaskList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTask'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='ParentProjectTask.Description' ColumnHeader='Task' Width='40%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='ParentProjectTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Description' ColumnHeader='Related Task' Width='45%'>
							<Sortable>
								<Argument PropertyKey='Description'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Center' Width='15%'>
							<Control ID='btnEditThirdPartyTasks'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ThirdPartyBuilderEditor'/>
										<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
										<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
										<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskID' AttributeName='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
										<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
										<Argument Type='QueryString' TypeKey='Page' BaseValue='WfBuilderPageKey='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDeleteThirdPartyTasks'
								Type='cButton'
								Image='Disconnect'
								Confirmation='Are you sure you want to remove this item from the workflow?'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DisconnectThirdParty'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='WfProjectTaskID' AttributeName='WfProjectTaskID' Value=''/>
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