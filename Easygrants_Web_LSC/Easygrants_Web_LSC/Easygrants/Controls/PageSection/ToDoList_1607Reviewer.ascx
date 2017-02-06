<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<span id='spnLscToDoList1607Reviewer' runat='server'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscToDoList1607ReportReview' DataObjectDefinitionKey='LscToDoList1607ReportReview'>
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
				<Argument PropertyKey='AppState'/>
				<Argument PropertyKey='RecipientID'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlLscToDoList1607Reviewer'
						Container='spnLscToDoList1607Reviewer'
						Type='cDataListCtl'
						DataObjectDefinitionKey='LscToDoList1607Reviewer'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<HeaderHtml>
							To Do - 1607 Report Reviews
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
						
						<DisplayProperty PropertyKey='WfTask' ColumnHeader='Task'>
							<Parameters>
								<!-- Display as hyperlink conditions -->
								<Argument Value='CurrentDate,CurrentDate' 
									ValueKey='CloseDate,OpenDate'
									CompareKey=','
									Operator='GreaterThanEqual,LessThanEqual'
									Bool='And,And'
									DisplayValue='Control' 
									PropertyKey='WfTask'>
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
									PropertyKey='WfTask'/>
								<Argument Value='CurrentDate' 
									ValueKey='OpenDate'
									Operator='GreaterThan'
									PropertyKey='WfTask'/>								
							</Parameters>
                            <Sortable>
								<Argument PropertyKey='WfTask' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='OrganizationName' ColumnHeader='Applicant'>
						    <Sortable>
								<Argument PropertyKey='OrganizationName' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RecipientID' ColumnHeader='Applicant ID'>
						    <Sortable>
								<Argument PropertyKey='RecipientID' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AppState' ColumnHeader='State'>
						    <Sortable>
								<Argument PropertyKey='AppState' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='DueDate' ColumnHeader='Due Date' Format='M/d/yyyy' DataColspan='2' HeaderColspan='2'>
						    <Sortable>
								<Argument PropertyKey='DueDate' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status' >
						    <Sortable>
								<Argument PropertyKey='WfTaskStatus' />
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
