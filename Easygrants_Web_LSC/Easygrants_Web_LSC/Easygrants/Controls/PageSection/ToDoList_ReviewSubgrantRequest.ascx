<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<div class="SeparatorHdg">
	To Do - Review Subgrant Approval Requests
</div>
<span id='spnToDoListReviewer' runat='server'/>
<span id='spnSubgrantReviewArchive' runat='server'/>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscToDoListReviewSubgrantApprovalRequest' DataObjectDefinitionKey='LscToDoListReviewSubgrantApprovalRequest' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Group='(' Bool='And' />
					<Argument Type='CurrentDateTime' TypeKey='Date' Operator='GreaterThanEqual' PropertyKey='EndDate' Value='' Bool=''/>	
					<Argument Type='' TypeKey='' PropertyKey='EndDate' Value='null' Bool='Or'/>	
				<Argument Group=')' Bool='' />
				<Argument Type='CurrentDateTime' TypeKey='Date' Operator='LessThanEqual' PropertyKey='StartDate' Value='' Bool='And'/>
				<Argument PropertyKey="WfTaskStatusID" Value="1"/>
			</Filters>
			<Sort>
				<Argument PropertyKey='SubgrantStartDate'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoListReviewer'
						Container='spnToDoListReviewer'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<DisplayProperty ColumnHeader='Task' Width='20%'>
							<Parameters>
								<!-- Display as hyperlink conditions -->
								<Argument Value='CurrentDate,CurrentDate,1' 
									ValueKey='CloseDate,OpenDate,WfTaskStatusID'
									CompareKey=',,,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='Task'>
									<Control ID='ctlLink'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument AttributeName='PageKey1' Type='DataObject' TypeKey='ModuleName' />
												<Argument AttributeName='PageKey2' Type='DataObject' TypeKey='ModuleConfigFilename' />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument AttributeName='PageKey4' Type='DataObject' TypeKey='WfTaskAssignmentID' Value='' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate,CurrentDate,2' 
									ValueKey='CloseDate,OpenDate,WfTaskStatusID'
									CompareKey=',,,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									PropertyKey='Task'>
								</Argument>
							</Parameters>
							<Sortable>
								<Argument PropertyKey='Task' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='OrganizationName' ColumnHeader='Grantee'>
							<Sortable>
								<Argument PropertyKey='OrganizationName' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubgranteeName' ColumnHeader='Subgrantee'>
							<Sortable>
								<Argument PropertyKey='SubgranteeName' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubgrantStartDate' ColumnHeader='Subgrant Start' Format='M/d/yyyy'>
							<Sortable>
								<Argument PropertyKey='SubgrantStartDate' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubgrantEndDate' ColumnHeader='Subgrant End' Format='M/d/yyyy'>
							<Sortable>
								<Argument PropertyKey='SubgrantEndDate' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='DueDate' ColumnHeader='Due Date' Format='M/d/yyyy'>
							<Sortable>
								<Argument PropertyKey='DueDate' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='TaskStatus' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='TaskStatus' />
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkSubgrantReviewArchive'
						Type='cLink'
						Container='spnSubgrantReviewArchive'
						Caption='View archived subgrant approval review assignments'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='SubgrantReviewArchive'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
