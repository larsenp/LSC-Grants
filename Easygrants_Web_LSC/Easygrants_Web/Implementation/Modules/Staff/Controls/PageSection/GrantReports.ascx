<%@ Control Language="vb" AutoEventWireup="true" Codebehind="GrantReports.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cGrantReports" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Reporting Schedule</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>


<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>

	<tr>
		<td>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td ><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
	
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	<DataObject Key='WfTask' DataObjectDefinitionKey='WfTask'>
			<Filters>
				<Argument Type='Data' TypeKey='WfTaskTypeID' PropertyKey='WfTaskTypeID' Value='3' />
			</Filters>
	</DataObject>
	
	<%--<DataObject Key='ReportList' DataObjectDefinitionKey='EasylistGranteeReportsView'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ReportEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='WfTaskAssignmentID=0'/>
									<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='ReportList'
						SeparatorWidth='2'
						MaxPerPage='10'>
						
						<DisplayProperty PropertyKey='WfTask' ColumnHeader='Reporting Task' Width='25%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
								</Argument> 
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Assigned To' Width='15%'>
							<Sortable>
								<Argument PropertyKey='LastNameFirstName'>
								</Argument> 
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Task Status' Width='12%'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'>
								</Argument> 
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskAssignment.DueDate' ColumnHeader='Task Due Date' Width='12%'>
							<Sortable>
								<Argument PropertyKey='DueDate'>
								    <RelatedProperty PropertyKey='WfTaskAssignment'/>
								</Argument> 
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskAssignment.SubmittedDate' ColumnHeader='Submit Date' Width='12%'>
							<Sortable>
								<Argument PropertyKey='SubmittedDate'>
								    <RelatedProperty PropertyKey='WfTaskAssignment'/>
								</Argument> 
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Options' Width='24%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ReportEditor'/>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='false'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
											<Parameters>
												
													<RelatedDataObjects>
														<RelatedDataObject DataObjectDefinitionKey='WfTaskAssignment'>
															<RelationshipProperties>
																<RelationshipProperty parentProperty='WfTaskAssignmentID' childProperty='WfTaskAssignmentID' />
															</RelationshipProperties>
														</RelatedDataObject>
													</RelatedDataObjects>
												
											</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
	</DataObject>--%>
		<DataObject Key='ReportList' DataObjectDefinitionKey='WfTaskAssignment'>
				<Filters>
					<Argument Type='DataPresenter' 
						TypeKey='GranteeProjectID' 
						PropertyKey='GranteeProjectID' 
						Value='' 
						Bool=''/>
					<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='3'>
						<RelatedProperty PropertyKey='WfTask'/>
					</Argument>
				</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ReportEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='WfTaskAssignmentID=0'/>
									<Argument Type='DataPresenter' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='ReportList'
						SeparatorWidth='2'
						MaxPerPage='10'>
						
						<DisplayProperty PropertyKey='WfTask.WfTask' ColumnHeader='Reporting Task' Width='25%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='WfTask'/>
								</Argument> 
							</Sortable>
						</DisplayProperty>
					
						<DisplayProperty PropertyKey='Person.LastNameFirstNameMiddleName' ColumnHeader='Assigned To' Width='15%'>
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
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatus' ColumnHeader='Task Status' Width='12%'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'>
									<RelatedProperty PropertyKey='WfTaskStatus'/>
								</Argument> 
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='DueDate' ColumnHeader='Task Due Date' Format='M/d/yyyy' Width='10%'>
							<Sortable>
								<Argument PropertyKey='DueDate'>
								</Argument> 
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmittedDate' ColumnHeader='Submit Date' Format='M/d/yyyy' Width='19%'>
							<Sortable>
								<Argument PropertyKey='SubmittedDate'>
								    
								</Argument> 
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='&nbsp;&nbsp;&nbsp;Options'  HeaderColspan='2' HeaderAlign='Right' DataAlign='Center' Width='3%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ReportEditor'/>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' Width='14%'>
							<Parameters>
							<Argument Value='2' ValueKey='WfTaskStatusID' DisplayValue=''/>	
							<Argument Value='2' ValueKey='WfTaskStatusID' DisplayValue='Control' Operator='NotEqual'>	
								<Control ID='btnDelete'
									Type='cButton'
									Image='Delete'
									Confirmation='Are you sure you want to delete this item?'>
										<Action
										PostBack='True'
										Object='EventController'
										Method='EventController_Delete'>
												<Parameters>
													<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID'/>
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
	</ModuleSection>
</span>