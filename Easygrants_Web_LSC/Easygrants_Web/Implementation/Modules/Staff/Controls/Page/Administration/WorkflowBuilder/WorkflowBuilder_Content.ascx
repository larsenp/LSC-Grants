<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" EnableViewState="True" %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Task Management</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b><%=GetLabel("ProgramName")%>:</b>&nbsp;
		<span id='spnProgram' runat='server'/></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingOpportunity")%>:</b>&nbsp;
		<span id='spnCompetition' runat='server'/></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%>:</b>&nbsp;
		<span id='spnProject' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<b>Type&nbsp;</b><%=kDenoteRequiredField%>&nbsp;<span runat='server' id='spnTaskType'></span>&nbsp;&nbsp;<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnWfTasksList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Program' DataObjectDefinitionKey='Program' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProgramID' PropertyKey='ProgramID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProgramDisplayName'>
					<Control ID='lblProgram'
						Container='spnProgram'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Competition' DataObjectDefinitionKey='Competition' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='CompetitionID' PropertyKey='CompetitionID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CompetitionDisplayName'>
					<Control ID='lblCompetition'
						Container='spnCompetition'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProjectName'>
					<Control ID='lblProject'
						Container='spnProject'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTasksList' DataObjectDefinitionKey='WfProjectTaskOutcome' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTask'/>
				</Argument>
			</Filters>	
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTaskType'
						Container='spnTaskType'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskType'
						StoredValue='WfTaskTypeID'
						DisplayValue='WfTaskType'
						DisplayNone='False'
						RequiredField='False'>
						<Sort>
							<Argument PropertyKey='WfTaskType'/>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='ModulePageContent'
								Method='NavigateToWorkFlowBuilderEditor'>
								<Parameters>
									<Argument Type='' TypeKey='' Value='Page=WorkFlowBuilderEditor'/>
									<Argument Type='Data' TypeKey='' Value='WfProjectTaskOutcomeID=0'/>
									<Argument Type='Data' TypeKey='' Value='WfProjectTaskID=0'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									<Argument Type='Control' TypeKey = 'ctlTaskType' ControlPropertyKey='SelectedValue' BaseValue='TaskTypeID='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProjectTaskOutcomeTasks' DataObjectDefinitionKey='WorkFlowBuilderList' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
			</Filters>	
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlWfTasksList'
						Container='spnWfTasksList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WorkFlowBuilderList'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='PrevWfTaskName' ColumnHeader='Task Name' Width='25%'>
							<Sortable>
								<Argument PropertyKey='PrevWfTaskName'/>
							</Sortable>
							<Parameters>
								<Argument Value='' ValueKey='PrevWfTaskName' DisplayValue='N/A' />
								<Argument Value='' Operator='NotEqual' ValueKey='PrevWfTaskName' DisplayValue='' PropertyKey='PrevWfTaskName' />
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PrevWfTaskOutcome' ColumnHeader='Task Outcome' Width='15%'>
							<Sortable>
								<Argument PropertyKey='PrevWfTaskOutcome'/>
							</Sortable>
							<Parameters>
								<Argument Value='' ValueKey='PrevWfTaskOutcome' DisplayValue='N/A' />
								<Argument Value='' Operator='NotEqual' ValueKey='PrevWfTaskOutcome' DisplayValue='' PropertyKey='PrevWfTaskOutcome' />
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='NextWfTaskName' ColumnHeader='Next Task Name' Width='25%'>
							<Sortable>
								<Argument PropertyKey='NextWfTaskName'/>
							</Sortable>
							<Parameters>
								<Argument Value='' ValueKey='NextWfTaskName' DisplayValue='N/A' />
								<Argument Value='' Operator='NotEqual' ValueKey='NextWfTaskName' DisplayValue='' PropertyKey='NextWfTaskName' />
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='NextWfTaskType' ColumnHeader='Type' Width='10%'>
							<Sortable>
								<Argument PropertyKey='NextWfTaskType'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='HasEmail' ColumnHeader='Send E-mail' Width='10%'>
							<Sortable>
								<Argument PropertyKey='HasEmail'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='StartDate' ColumnHeader='Start Date' Format='M/d/yyyy' Width='10%'>
							<Sortable>
								<Argument PropertyKey='StartDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='EndDate' ColumnHeader='End Date' Format='M/d/yyyy' Width='10%'>
							<Sortable>
								<Argument PropertyKey='EndDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='ModulePageContent'
									Method='NavigateToWorkFlowBuilderEditor'>
									<Parameters>
										<Argument Type='' TypeKey='' Value='Page=WorkFlowBuilderEditor'/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskOutcomeID' AttributeName='WfProjectTaskOutcomeID' BaseValue='WfProjectTaskOutcomeID='/>
										<Argument Type='DataObject' TypeKey='NextWfProjectTaskID' AttributeName='NextWfProjectTaskID' BaseValue='WfProjectTaskID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
										<Argument Type='DataObject' TypeKey='TaskTypeID' AttributeName='TaskTypeID' BaseValue='TaskTypeID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='1' HeaderAlign='Left' DataAlign='Left' Width='10%'>
							<Parameters>
								<Argument Value='1' ValueKey='WfProject.GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue=''/>	
								<Argument Value='2' ValueKey='WfProject.GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue=''/>	
								
								<Argument Value='3' ValueKey='WfProject.GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>	
									<Control ID='btnDelete1'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
											<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='PrevWfProjectTaskID' AttributeName='PrevWfProjectTaskID' Value=''/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='' ValueKey='WfProject.GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>	
									<Control ID='btnDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
											<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='PrevWfProjectTaskID' AttributeName='PrevWfProjectTaskID' Value=''/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>