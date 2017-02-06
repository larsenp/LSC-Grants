<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<span id='spnToDoListReviewer' runat='server'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	   <DataObject Key='LscToDoListCompRenewAdvanceReview' DataObjectDefinitionKey='LscToDoListCompRenewAdvanceReview' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoListReviewer'
						Container='spnToDoListReviewer'
						Type='cDataListCtl'
						DataObjectDefinitionKey='LscToDoListCompRenewAdvanceReview'
						SeparatorWidth='2'
						MaxPerPage='15'>
						<HeaderHtml>
							To Do - Director and Executive Review
						</HeaderHtml>
						<DisplayProperty PropertyKey='WfTask' ColumnHeader='Task'>
						     <Parameters>
						          <Argument Value='52' ValueKey='WfTaskID' Operator='Equal' DisplayValue='Control' PropertyKey='WfTask' >
						             <Control ID='ctlLink1'
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
								   <Argument Value='56' ValueKey='WfTaskID' Operator='Equal' DisplayValue='Control' PropertyKey='WfTask' >
						             <Control ID='ctlLink2'
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
								   <Argument Value='57' ValueKey='WfTaskID' Operator='Equal' DisplayValue='Control' PropertyKey='WfTask' >
						             <Control ID='ctlLink3'
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
								   <Argument Value='74' ValueKey='WfTaskID' Operator='Equal' DisplayValue='Control' PropertyKey='WfTask' >
						             <Control ID='ctlLink4'
										Type='cLink'>
										<Action
							                PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='AppReview_OCEDir' />
											</Parameters>
										</Action>
								     </Control>
								   </Argument>
								   <Argument Value='75' ValueKey='WfTaskID' Operator='Equal' DisplayValue='Control' PropertyKey='WfTask' >
						             <Control ID='ctlLink5'
										Type='cLink'>
										<Action
							                PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='RenewalAppReview_OCEDir' />
											</Parameters>
										</Action>
								     </Control>
								   </Argument>
								   <Argument Value='47' ValueKey='WfTaskID' Operator='Equal' DisplayValue='Control' PropertyKey='WfTask' >
						             <Control ID='ctlLink6'
										Type='cLink'>
										<Action
							                PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='AppReview_OPPDir' />
											</Parameters>
										</Action>
								     </Control>
								   </Argument>
								   <Argument Value='87' ValueKey='WfTaskID' Operator='Equal' DisplayValue='Control' PropertyKey='WfTask' >
						             <Control ID='ctlLink7'
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
								    <Argument Value='88' ValueKey='WfTaskID' Operator='Equal' DisplayValue='Control' PropertyKey='WfTask' >
						             <Control ID='ctlLink8'
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
								   
								</Parameters>
					     </DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
			
    <%--<DataObject Key='WfTA' DataObjectDefinitionKey='WfTaskAssignment'>
	        <Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Value='3' Operator='NotEqual' Bool='And'/>
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
				<Argument PropertyKey='ProgramID' Value='1'>
					<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition' />
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
					<Control ID='ctlToDoListRenewalAppReviewer'
						Container='spnToDoListRenewalAppReviewer'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<HeaderHtml>
							To Do - Renewal Application Review 
						</HeaderHtml>	
						<DisplayProperty ColumnHeader='Task' Width='20%'>
							<Parameters>
								<!-- Display as hyperlink conditions -->
								
								<Argument Value='CurrentDate,CurrentDate,52' 
									ValueKey='WfProjectTask.CloseDate,WfProjectTask.OpenDate,WfTaskID'
									CompareKey=',,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='WfProjectTask.Description'>
									<Control ID='ctlLink52'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey1' Value='RenewalAppReview_OPPDir' />
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
		</DataObject>--%>
	</ModuleSection>
</span>	
