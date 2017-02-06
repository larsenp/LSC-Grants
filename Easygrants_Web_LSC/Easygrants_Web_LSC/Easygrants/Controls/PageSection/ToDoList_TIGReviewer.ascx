<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<span id='spnToDoListReviewer' runat='server'/>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscToDoListTigReview' DataObjectDefinitionKey='LscToDoListTigReview'>
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
							To Do - TIG Review
						</HeaderHtml>					
						<DisplayProperty ColumnHeader='Task' Width='20%'>
							<Parameters>
								<!-- Display as hyperlink conditions -->
								<Argument Value='CurrentDate,CurrentDate,39' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink39'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='TIGLOIReview_O_R_WI_OPP' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,43' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink43'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='TIGAppReview_O_R_WI' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,45' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink45'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='TIGAppReview_O_R_WI_OPPDir' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,46' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink46'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='TIGAppReview_O_R_WI_VP' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,48' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink48'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='TIGAppReview_Website_OPPDir' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,49' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink49'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='TIGAppReview_Website_VP' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,50' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink50'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='TIGAppReview_Website_President' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,51' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink51'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='TIGAppReview_O_R_WI_Pres' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,58' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink58'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='TIGAppReview_BudgetRevision' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,122' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink122'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='TIGAppReview_BudgetRevision2013nEarlier' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,59' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink59'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='TIGAppReview_PaymentScheduleRevision' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,62' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink62'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='TIGAppReview_GrantAwardPackage' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,70' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink70'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='TIGLOIReview_O_R_WI_OPPDir' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,71' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink71'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='TIGLOIReview_O_R_WI_President' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,92' 
									ValueKey='CloseDate,OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
									<Control ID='ctlLink92'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='TIGLOIReview_O_R_WI_VicePresident' />
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
