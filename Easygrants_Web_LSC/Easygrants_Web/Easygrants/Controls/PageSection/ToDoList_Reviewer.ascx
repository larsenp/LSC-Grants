<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cToDoList_Reviewer" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<span id='spnToDoListReviewer' runat='server'/>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTA' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Value='3' Operator='NotEqual' Bool='And'/>
<%--				<Argument Type='' TypeKey='' PropertyKey='WfTaskRoleID' Value='7' Bool='And'/>--%>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID'  Value='4' Bool='And'>	
						<RelatedProperty PropertyKey='WfProjectTask.WfTask'/>
					</Argument>
				<Argument Group='(' Bool='And' />
					<Argument Type='CurrentDateTime' TypeKey='Date' Operator='GreaterThanEqual' PropertyKey='EndDate' Value='' Bool=''>	
						<RelatedProperty PropertyKey='WfProjectTask'/>
					</Argument>
					<Argument Type='' TypeKey='' PropertyKey='EndDate' Value='null' Bool='Or'>	
						<RelatedProperty PropertyKey='WfProjectTask'/>
					</Argument>
				<Argument Group=')' Bool='' />
				<Argument Type='CurrentDateTime' TypeKey='Date' Operator='LessThanEqual' PropertyKey='StartDate' Value='' Bool='And'>
					<RelatedProperty PropertyKey='WfProjectTask'/>
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey='ListOrder'>
					<RelatedProperty PropertyKey='ReviewCycleStage'/>
				</Argument>
				<Argument PropertyKey='WfTaskStatus'>
					<RelatedProperty PropertyKey='WfTaskStatus'/>
				</Argument>
			</Sort>
		</DataObject>
		<DataObject Key='List3' DataObjectDefinitionKey='WfTaskAssignment'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoListReviewer'
						Container='spnToDoListReviewer'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<HeaderHtml>
							To Do - Review
						</HeaderHtml>					
						<DisplayProperty ColumnHeader='Task' Width='20%'>
							<Parameters>
								<!-- Display as hyperlink conditions -->
								<Argument Value='CurrentDate,CurrentDate' 
									ValueKey='WfProjectTask.CloseDate,WfProjectTask.OpenDate'
									CompareKey=','
									Operator='GreaterThanEqual,LessThanEqual'
									Bool='And,And'
									DisplayValue='Control' 
									PropertyKey='WfProjectTask.Description'>
									<Control ID='ctlLinks'
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
								<Argument Value='CurrentDate' 
									ValueKey='WfProjectTask.CloseDate'
									Operator='LessThan'
									PropertyKey='WfProjectTask.Description'/>
								<Argument Value='CurrentDate' 
									ValueKey='WfProjectTask.OpenDate'
									Operator='GreaterThan'
									PropertyKey='WfProjectTask.Description'/>								
							</Parameters>
							<Sortable>
								<Argument PropertyKey='Description'>	
									<RelatedProperty PropertyKey='WfProjectTask'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewCycleStage.ReviewCycle.Name' ColumnHeader='Review Cycle' Width='15%'>
							<Sortable>
								<Argument PropertyKey='Name'>	
									<RelatedProperty PropertyKey='ReviewCycleStage.ReviewCycle'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewCommitteeName.ReviewCommitteeDescription' ColumnHeader='Review Committee' Width='20%' >
							<Sortable>
								<Argument PropertyKey='ReviewCommitteeDescription'>	
									<RelatedProperty PropertyKey='ReviewCommitteeName'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatus' ColumnHeader='Status' Format='M/d/yyyy' Width='20%'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'>	
									<RelatedProperty PropertyKey='WfTaskStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTask.DueDate' ColumnHeader='Due Date' Format='M/d/yyyy' DataColspan='2' HeaderColspan='2' Width='20%'>
							<Sortable>
								<Argument PropertyKey='DueDate'>	
									<RelatedProperty PropertyKey='WfProjectTask'/>
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
