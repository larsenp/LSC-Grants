<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Grant Project</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Task activities for the following grant project are listed below. 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<span runat='server' id='spnGranteeProject'/>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Application Tasks</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Listed below are the application tasks under this Grant Project.  Application tasks include, LOI's, full 
			applications, and 3rd party submissions. To work with an application task, select the appropriate option 
			from the Action list and click the <b>Go</b> button.  Typical actions include editing the task and viewing the PDF reports. 
			To add a new application task go to the Activity page for the appropriate person contact and follow the instructions 
			there.		
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<span runat='server' id='spnApps'/>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Review Tasks</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Listed below are the review tasks and reviewers assigned to review application submissions within this grant project.  
			From this list, you can select the "Task - Edit," "Grant Info," or "Contact Info" options from the Action list and 
			click the <b>Go</b> button to perform these functions.  Review tasks are assigned to reviewers either automatically by 
			the system, or via the Review Module.		
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<span runat='server' id='spnReviews'/>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Progress Report Tasks</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Listed below are the progress report tasks assigned to persons affiliated with this contact.  Progress report tasks 
			are assigned only to grantees.    From this list, you can select the "Task - Edit" option or "View PDF" option from 
			the Action list and click the <b>Go</b> button to perform either function.  To add a new progress report task for this contact, 
			you must go to the Grant Info page for the grant project listed above and follow the instructions on that page.		
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<span runat='server' id='spnProgress'/>
<br>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectActivityList' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='GranteeID' />	
			</Sort>	
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnGranteeProject'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProject'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='' ColumnHeader='Action'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='OrganizationGranteeProject'>
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey="EasylistAction" />
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
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID'/>
									    <Argument Value='ctlList'/>
										<Argument Value='ctlActions'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeID' ColumnHeader='GrantId' ConfigurableHeader='True'/>
						
						<DisplayProperty PropertyKey='PrimaryPerson.FirstNameMiddleNameLastName' ColumnHeader='Primary Person'  >
							<Control ID='ctlLink'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PersonContact'/>
										<Argument Type='DataObject' TypeKey='PrimaryPersonID' AttributeName='PersonID' BaseValue='PersonID='/>
									</Parameters>
								</Action>
							</Control>
							<Sortable>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='PrimaryPerson'/>
								</Argument>
								<Argument PropertyKey='MiddleName'>
									<RelatedProperty PropertyKey='PrimaryPerson'/>
								</Argument>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='PrimaryPerson'/>
								</Argument>
							</Sortable>
						</DisplayProperty> 
						<DisplayProperty PropertyKey='WfProject.WfProjectName' ColumnHeader='Project Title'/>
						<DisplayProperty PropertyKey='GrantStatus.Description' ColumnHeader='Status'/>
						<DisplayProperty PropertyKey='WfProjectOutcome.Description' ColumnHeader='Outcome'/>
							
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Apps' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument PropertyKey='WfTaskTypeID' Value='1'>
					<RelatedProperty PropertyKey='WfTask'/>
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey='CreateDate' />	
			</Sort>	
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlApps'
						Type='cDataListCtl'
						Container='spnApps'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='' ColumnHeader='Action'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='WfTaskAssignment'>
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey="EasylistAction" />
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
										<Argument Value='ctlApps'/>
										<Argument Value='ctlActions'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Person.FirstNameMiddleNameLastName' ColumnHeader='Assigned Person'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
								<Argument PropertyKey='MiddleName'>
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTask.Description' ColumnHeader='Application Task'/>
						<DisplayProperty PropertyKey='CreateDate' ColumnHeader='Submitted Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatus' ColumnHeader='Status'/>
						<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' ColumnHeader='Outcome'>
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
		
		<DataObject Key='Reviews' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument Group='(' Bool='And'/>
				<Argument PropertyKey='WfTaskTypeID' Value='2' Bool=''>
					<RelatedProperty PropertyKey='WfTask'/>
				</Argument>
				<Argument PropertyKey='WfTaskTypeID' Value='4' Bool='Or'>
					<RelatedProperty PropertyKey='WfTask'/>
				</Argument>
				<Argument Group=')' Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Description'>	
					<RelatedProperty PropertyKey='WfProjectTask'/>
				</Argument>
			</Sort>	
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlReviews'
						Type='cDataListCtl'
						Container='spnReviews'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='' ColumnHeader='Action'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='WfTaskAssignment'>
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey="EasylistAction" />
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
										<Argument Value='ctlReviews'/>
										<Argument Value='ctlActions'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Person.FirstNameMiddleNameLastName' ColumnHeader='Assigned Person'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
								<Argument PropertyKey='MiddleName'>
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.FirstNameMiddleNameLastName' ColumnHeader='Primary Person'>
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
						<DisplayProperty PropertyKey='WfProjectTask.Description' ColumnHeader='Review Task'/>
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatus' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'>
									<RelatedProperty PropertyKey='WfTaskStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' ColumnHeader='Outcome'>
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
		
		<DataObject Key='Progress' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument PropertyKey='WfTaskTypeID' Value='3'>
					<RelatedProperty PropertyKey='WfTask'/>
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey='Description'>	
					<RelatedProperty PropertyKey='WfProjectTask'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlProgress'
						Type='cDataListCtl'
						Container='spnProgress'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='' ColumnHeader='Action'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='WfTaskAssignment'>
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey="EasylistAction" />
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
									    <Argument Value='ctlProgress'/>
										<Argument Value='ctlActions'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Person.FirstNameMiddleNameLastName' ColumnHeader='Assigned Person'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
								<Argument PropertyKey='MiddleName'>
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTask.Description' ColumnHeader='Progress Report Task'/>
						<DisplayProperty PropertyKey='OpenDateCalculated' ColumnHeader='Open Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='CloseDateCalculated' ColumnHeader='Close Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatus' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'>
									<RelatedProperty PropertyKey='WfTaskStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' ColumnHeader='Outcome'>
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
<!-- End Embedded XML -->
