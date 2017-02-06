<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cToDoList_Reference" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<span id='spnToDoListReference' runat='server'/>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignmentCalculatedDates' DataObjectDefinitionKey='WfTaskAssignmentCalculatedDates'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' >
					<RelatedProperty PropertyKey='WfTaskAssignment'/>
				</Argument>				
				<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Operator='NotEqual' Value='3' >
					<RelatedProperty PropertyKey='WfTaskAssignment'/>
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='6'>
					<RelatedProperty PropertyKey='WfTaskAssignment.WfTask'/>
				</Argument>
			</Filters>
			<DisplayProperties>			
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoListReference'
						Container='spnToDoListReference'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<HeaderHtml>
							To Do - Third Party
						</HeaderHtml>
						<InstructionHtml>
							<table cellpadding='0' cellspacing='0'>
								<tr><td>&nbsp;</td></tr>
								<tr>
									<td>
										Listed below are To Do items for third party submissions in support of applicant 
										research applications.  Click on the applicant's name to navgiate to the page or 
										pages where you will submit your information.  When you have completed the submission 
										(i.e., when you have submitted), the status of your To Do item will be displayed as "Complete.
									</td>
								</tr>
								<tr><td>&nbsp;</td></tr>
							</table>
						</InstructionHtml>
						<DisplayProperty PropertyKey='WfTaskAssignment.GranteeProject.PrimaryPerson.LastNameFirstName' ColumnHeader='Task'>
							<Parameters>
								<Argument Value='CurrentDate' ValueKey='CalculatedCloseDate' Operator='LessThanEqual' 
									DisplayValue='' PropertyKey='WfTaskAssignment.WfProjectTask.Description'/>
								<Argument Value='CurrentDate' ValueKey='CalculatedCloseDate' Operator='GreaterThanEqual' 
									DisplayValue='Control' PropertyKey='WfTaskAssignment.WfProjectTask.Description'>
									<Control 
										ID='ctlReferenceLink'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument AttributeName='PageKey1' Type='DataObjectRelated' TypeKey='WfTaskAssignment.WfTaskModule.ModuleName' />
												<Argument AttributeName='PageKey2' Type='DataObjectRelated' TypeKey='WfTaskAssignment.WfTaskModule.ModuleConfigFilename' />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument AttributeName='PageKey4' Type='DataObject' TypeKey='WfTaskAssignmentID' Value='' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskAssignment.GranteeProject.PrimaryPerson.LastNameFirstName' ColumnHeader='Applicant Name'/>
						<DisplayProperty PropertyKey='WfTaskAssignment.GranteeProject.WfProject.WfProjectName' ColumnHeader='Funding Cycle'/>
						<DisplayProperty PropertyKey='WfTaskAssignment.WfTaskStatus.WfTaskStatus' ColumnHeader='Status'/>
						<!-- <DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' ColumnHeader='Outcome'>
							<Parameters>
								<Argument Value='6' ValueKey='WfTask.WfTaskTypeID'  DisplayValue='' PropertyKey='WfTaskOutcome.WfTaskOutcome' />
								<Argument Value='7' ValueKey='WfTaskOutcomeID'  DisplayValue='' PropertyKey='WfTaskOutcome.WfTaskOutcome' />
								<Argument Value='8' ValueKey='WfTaskOutcomeID'  DisplayValue='' PropertyKey='WfTaskOutcome.WfTaskOutcome' />
								<Argument Value='9' ValueKey='WfTaskOutcomeID'  DisplayValue='' PropertyKey='WfTaskOutcome.WfTaskOutcome' />
								<Argument Value='47' ValueKey='WfTaskOutcomeID'  DisplayValue='' PropertyKey='WfTaskOutcome.WfTaskOutcome' />
								<Argument Value='48' ValueKey='WfTaskOutcomeID'  DisplayValue='' PropertyKey='WfTaskOutcome.WfTaskOutcome' />
							</Parameters>
						</DisplayProperty> -->
						<DisplayProperty PropertyKey='CalculatedDueDate' ColumnHeader='Due Date' Format='M/d/yyyy' DataColspan='2' HeaderColspan='2'>
							<!--
							<Parameters>
								<Argument Value='True' ValueKey='WfTask.ShowDueDateAltText' DisplayValue='' PropertyKey='WfTask.DueDateAltText'/>
								<Argument Value='False' ValueKey='WfTask.ShowDueDateAltText' DisplayValue='' PropertyKey='DueDateCalculated' Format='M/d/yyyy'/>
								<Argument Value='' ValueKey='WfTask.ShowDueDateAltText' DisplayValue='' PropertyKey='DueDateCalculated' Format='M/d/yyyy'/>
							</Parameters>-->
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
