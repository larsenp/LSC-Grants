<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<span id='spnToDoListReviewer' runat='server'/>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscToDoListProBonoReview' DataObjectDefinitionKey='LscToDoListProBonoReview'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Group='(' Bool='And' />
					<Argument Type='CurrentDateTime' TypeKey='Date' Operator='GreaterThanEqual' PropertyKey='EndDate' Value='' Bool=''/>	
					<Argument Type='' TypeKey='' PropertyKey='EndDate' Value='null' Bool='Or'/>	
				<Argument Group=')' Bool='' />
				<Argument Type='CurrentDateTime' TypeKey='Date' Operator='LessThanEqual' PropertyKey='StartDate' Value='' Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='WfTaskStatusID'/>
				<Argument PropertyKey='DueDate'/>
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
							To Do - Pro Bono Innovation Fund Review
						</HeaderHtml>					
						<DisplayProperty ColumnHeader='Task' Width='20%'>
							<Parameters>
								<!-- Display as hyperlink conditions -->
								<Argument Value='CurrentDate,CurrentDate,103' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink103'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='ProBonoReviewEligibility' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,106' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink106'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='ProBonoReviewProgrammaticPrimary' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,107' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink107'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='ProBonoReviewProgrammaticSecondary' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,110' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink110'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='ProBonoReviewRiskAssessment' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,111' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink111'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='ProBonoReviewOPPDir' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,112' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink112'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='ProBonoReviewVP' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,113' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink113'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='ProBonoReviewPresident' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,124' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink124'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='ProBonoReviewLOIPrimary' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,125' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink125'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument AttributeName='ModuleName' Type='DataObject' TypeKey='ModuleName' PropertyKey='ModuleName' />
												<Argument AttributeName='ModuleConfigFilename' Type='DataObject' TypeKey='ModuleConfigFilename' PropertyKey='ModuleConfigFilename'  />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument AttributeName='WfTaskAssignmentID' Type='DataObject' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,126' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink126'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument AttributeName='ModuleName' Type='DataObject' TypeKey='ModuleName' PropertyKey='ModuleName' />
												<Argument AttributeName='ModuleConfigFilename' Type='DataObject' TypeKey='ModuleConfigFilename' PropertyKey='ModuleConfigFilename'  />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument AttributeName='WfTaskAssignmentID' Type='DataObject' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,127' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink127'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument AttributeName='ModuleName' Type='DataObject' TypeKey='ModuleName' PropertyKey='ModuleName' />
												<Argument AttributeName='ModuleConfigFilename' Type='DataObject' TypeKey='ModuleConfigFilename' PropertyKey='ModuleConfigFilename'  />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument AttributeName='WfTaskAssignmentID' Type='DataObject' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate' 
									ValueKey='CloseDate'
									Operator='LessThan'
									PropertyKey='WfTask'/>
								<Argument Value='CurrentDate' 
									ValueKey='OpenDate'
									Operator='GreaterThan'
									PropertyKey='WfTask'/>
							</Parameters>
							<Sortable>
								<Argument PropertyKey='WfTask'/>	
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewCycleStage' ColumnHeader='Review Cycle' Width='15%'>
							<Sortable>
								<Argument PropertyKey='Name'>	
									<RelatedProperty PropertyKey='ReviewCycleStage'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewCommittee' ColumnHeader='Review Committee' Width='20%' >
							<Sortable>
								<Argument PropertyKey='ReviewCommittee'/>	
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status' Format='M/d/yyyy' Width='20%'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'/>	
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='DueDate' ColumnHeader='Due Date' Format='M/d/yyyy' DataColspan='2' HeaderColspan='2' Width='20%'>
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
