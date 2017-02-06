<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<span id='spnToDoListReference' runat='server'/>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='List2' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Operator='NotEqual' Value='3' />
				<Argument Type='' TypeKey='' PropertyKey='WfTaskRoleID'  Value='5' />
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
							To Do - Department Chair
						</HeaderHtml>
						<InstructionHtml>
							
						</InstructionHtml>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName' ColumnHeader='Applicant'>
							<Parameters>
								<!--
								<Argument Value='2' ValueKey='WfTaskStatusID' PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName' />															
								-->
								<Argument Value='2' ValueKey='WfTaskStatusID' PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName' DisplayValue='Control'>
									<Control 
										ID='ctlReferenceLink2'
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
								</Argument>
								<Argument Value='1' ValueKey='WfTaskStatusID' PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName' DisplayValue='Control'>
									<Control 
										ID='ctlReferenceLink'
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
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.PersonPrimaryAffiliation.Organization.CommonOrganizationName' ColumnHeader='~~Organization~~'/>
						<DisplayProperty PropertyKey='WfProjectTask.Description' ColumnHeader='Task'/>
						<DisplayProperty PropertyKey='DueDateCalculated' ColumnHeader='Due Date' Format='MMMM d, yyyy'/>
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatus' ColumnHeader='Status'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
