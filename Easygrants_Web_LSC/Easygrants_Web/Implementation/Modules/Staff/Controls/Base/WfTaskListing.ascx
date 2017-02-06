<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" EnableViewState="false" %>
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
			<span runat='server' id='spnAdd'></span>
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
		<DataObject Key='WfTasksList' DataObjectDefinitionKey='WfProjectTask' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
			</Filters>
			<Sort>
				<Argument Type='' TypeKey='' PropertyKey='SortOrder' Direction='Ascending'>
				</Argument>
			</Sort>			
			<DisplayProperties>
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
									<Argument AttributeName='PageKey' Value='TaskEditor'/>
									<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
									<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
									<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>									
									<Argument Type='' TypeKey='' Value='WfProjectTaskID=0'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlWfTasksList'
						Container='spnWfTasksList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTask'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='SortOrder' ColumnHeader='Order' Width='10%'>	
							<Sortable>
								<Argument PropertyKey='SortOrder'/>
							</Sortable>
						</DisplayProperty>					
						<DisplayProperty PropertyKey='Description' ColumnHeader='Task' Width='35%'>
							<Sortable>
								<Argument PropertyKey='Description'/>
							</Sortable>
						</DisplayProperty>						
						<DisplayProperty PropertyKey='StartDate' ColumnHeader='Start Date' Format='M/d/yyyy' Width='15%'>
							<Sortable>
								<Argument PropertyKey='StartDate'/>
							</Sortable>
						</DisplayProperty>																				
						<DisplayProperty PropertyKey='EndDate' ColumnHeader='End Date' Format='M/d/yyyy' Width='15%'>
							<Sortable>
								<Argument PropertyKey='EndDate'/>
							</Sortable>
						</DisplayProperty>																				
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='3' HeaderAlign='Right' DataAlign='Center'>
							<Control ID='btnView'
								Type='cButton'
								Image='View'>
								<Action
									PostBack='True'
									Object='ModulePageContent'
									Method='ProjectsContent_ViewOutcomesForTask'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='WfTaskID' AttributeName='WfTaskID' Value=''/>
									</Parameters>
								</Action>
							</Control>	
						</DisplayProperty>	
						<DisplayProperty PropertyKey=''>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='TaskEditor'/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='ReturnURL' BaseValue='ReturnURL='/>
										<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>	
										<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
									<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>								
										<Argument Type='DataObject' TypeKey='WfProjectTaskID' AttributeName='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='1' HeaderAlign='Left' DataAlign='Left' Width='20%'>
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
												<Argument Type='DataObject' TypeKey='WfProjectTaskID' AttributeName='WfProjectTaskID' Value=''/>
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
												<Argument Type='DataObject' TypeKey='WfProjectTaskID' AttributeName='WfProjectTaskID' Value=''/>
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
