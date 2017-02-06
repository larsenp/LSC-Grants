<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<span id='spnToDoListReviewer' runat='server'/>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTA' DataObjectDefinitionKey='ToDoListReview'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Group='(' Bool='And' />
					<Argument Type='CurrentDateTime' TypeKey='Date' Operator='GreaterThanEqual' PropertyKey='EndDate' Value='' Bool=''/>	
					<Argument Type='' TypeKey='' PropertyKey='EndDate' Value='null' Bool='Or'/>	
				<Argument Group=')' Bool='' />
				<Argument Type='CurrentDateTime' TypeKey='Date' Operator='LessThanEqual' PropertyKey='StartDate' Value='' Bool='And'/>
			</Filters>
			<Sort>
			    <Argument PropertyKey='WfTaskID'/>
				<Argument PropertyKey='AppSt'/>
				<Argument PropertyKey='LegacyOrganizationID' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoListReviewer'
						Container='spnToDoListReviewer'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<HeaderHtml>
							To Do - Reviewer
						</HeaderHtml>
						<InstructionHtml>
							<table>
								<tr>
									<td>
										Listed below are To Do items for  reviewer submissions.  Click on the task name 
										to navigate to the page or pages where you will submit your information.  When 
										you have completed the submission (i.e., when you have submitted), the status 
										of your To Do item will be displayed as "Complete."
									</td>
								</tr>
								<tr><td>&nbsp;</td></tr>
							</table>

						</InstructionHtml>
						
						<DisplayProperty PropertyKey='Task' ColumnHeader='Task'>
							<Parameters>
								<!-- Display as hyperlink conditions -->
								<Argument Value='CurrentDate,CurrentDate' 
									ValueKey='CloseDate,OpenDate'
									CompareKey=','
									Operator='GreaterThanEqual,LessThanEqual'
									Bool='And,And'
									DisplayValue='Control' 
									PropertyKey='Task'>
									<Control ID='ctlLinks'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument AttributeName='PageKey1' Type='DataObjectRelated' TypeKey='ModuleName' />
												<Argument AttributeName='PageKey2' Type='DataObjectRelated' TypeKey='ModuleConfigFilename' />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument AttributeName='PageKey4' Type='DataObject' TypeKey='WfTaskAssignmentID' Value='' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<!-- Display as text conditions -->
								<Argument Value='CurrentDate' 
									ValueKey='CloseDate'
									Operator='LessThan'
									PropertyKey='Task'/>
								<Argument Value='CurrentDate' 
									ValueKey='OpenDate'
									Operator='GreaterThan'
									PropertyKey='Task'/>								
							</Parameters>
                            <Sortable>
								<Argument PropertyKey='Task' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='FundingCycle' ColumnHeader='Funding Cycle'/>
						<DisplayProperty PropertyKey='OrganizationName' ColumnHeader='Applicant'>
						    <Sortable>
								<Argument PropertyKey='OrganizationName' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LegacyOrganizationID' ColumnHeader='Applicant ID'>
						    <Sortable>
								<Argument PropertyKey='LegacyOrganizationID' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AppSt' ColumnHeader='State'>
						    <Sortable>
								<Argument PropertyKey='AppSt' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='DueDate' ColumnHeader='Due Date' Format='M/d/yyyy' DataColspan='2' HeaderColspan='2'>
						    <Sortable>
								<Argument PropertyKey='DueDate' />
							</Sortable>
							<!--
							<Parameters>
								<Argument Value='True' ValueKey='WfTask.ShowDueDateAltText' DisplayValue='' PropertyKey='WfTask.DueDateAltText'/>
								<Argument Value='False' ValueKey='WfTask.ShowDueDateAltText' DisplayValue='' PropertyKey='DueDateCalculated' Format='M/d/yyyy'/>
								<Argument Value='' ValueKey='WfTask.ShowDueDateAltText' DisplayValue='' PropertyKey='DueDateCalculated' Format='M/d/yyyy'/>
							</Parameters>-->
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status' >
						    <Sortable>
								<Argument PropertyKey='WfTaskStatus' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader=' ' Width='10%'>
						<Parameters>
								<Argument Value='0' ValueKey='IsCopyAllowed' Operator='Equal' 
									DisplayValue='' />
								<Argument Value='1' ValueKey='IsCopyAllowed' Operator='Equal' DisplayValue='Control'>
									<Control ID='btnCopy' 
										Type='cButton' 
										Image='Copy'
										Container='spnCopy'>
										<Action
												PostBack='True'
												Object='EventController'
												Method='EventController_NavigateToModulePageKey'>
												<Parameters>
													<Argument AttributeName='PageKey' Value='CopyTask'/>
													<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>									
													<%--<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>--%>
												</Parameters>
										</Action>
									</Control>
								</Argument>
						</Parameters>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='' ColumnHeader=' ' Width='10%'>
						<Parameters>
								<Argument Value='0' ValueKey='IsCopyAllowed' Operator='Equal' 
									DisplayValue='' />
								<Argument Value='2' ValueKey='IsCopyAllowed' Operator='Equal' DisplayValue='Control'>
									<Control ID='btnCopy2' 
										Type='cButton' 
										Image='Copy'
										Container='spnCopy'>
										<Action
												PostBack='True'
												Object='EventController'
												Method='EventController_NavigateToModulePageKey'>
												<Parameters>
													<Argument AttributeName='PageKey' Value='CopyExistingTask'/>
													<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>	
													<Argument Type='DataObject' TypeKey='WfTaskID' AttributeName='WfTaskID' BaseValue='WfTaskID='/>
													<%--<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>--%>
												</Parameters>
										</Action>
									</Control>
								</Argument>
						</Parameters>
						</DisplayProperty>
						<!-- <DisplayProperty PropertyKey='WfTaskAssignmentID' ColumnHeader='WFTAID' /> -->
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
