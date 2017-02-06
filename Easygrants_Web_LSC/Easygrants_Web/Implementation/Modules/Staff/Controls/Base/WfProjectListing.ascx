<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" EnableViewState="false" %>
<!-- USER MODIFIIABLE CONTENT AREA -->
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Funding Cycle Management</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b><%=GetLabel("ProgramName")%>:</b>&nbsp;
		<span id='spnProgram' runat='server'/></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingOpportunity")%>:</b>&nbsp;
		<span id='spnCompetition' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnWfProjectsList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Program' DataObjectDefinitionKey='Program' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProgramID' PropertyKey='ProgramID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProgramDisplayName'>
					<Control ID='lblProgram'
						Container='spnProgram'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Competition' DataObjectDefinitionKey='Competition' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='CompetitionID' PropertyKey='CompetitionID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CompetitionDisplayName'>
					<Control ID='lblCompetition'
						Container='spnCompetition'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProjectsList' DataObjectDefinitionKey='WfProject' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='CompetitionID' PropertyKey='CompetitionID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='ModulePageContent'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ProjectEditor'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>									
									<Argument Type='Data' TypeKey='' BaseValue='WfProjectID=0' Value=''/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlWfProjectsList'
						Container='spnWfProjectsList'
						Type='cDataListCtl'
						SeparatorWidth='2' 
						DataObjectDefinitionKey='WfProject'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfProjectName' ColumnHeader='FundingCycleName' Width='25%' ConfigurableHeader='True'>
							<Control ID='lnkWFBuilder' 
								Type='cLink'>
								<Action 
									PostBack='True'
									Object='ModulePageContent'
									Method='ProjectsContent_ViewTasksForProject'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='WfProjectID' AttributeName='WfProjectID' Value=''/>
									</Parameters>
								</Action>
							</Control>
							<Sortable>
								<Argument PropertyKey='WfProjectName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectID' ColumnHeader='Funding Cycle ID' Width='25%'>
							<Sortable>
								<Argument PropertyKey='WfProjectID'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='TimePeriod.Description' ColumnHeader='Cycle' Width='25%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='TimePeriod' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='4' HeaderAlign='Right' DataAlign='Center' >
							<Control ID='btnView'
								Type='cButton'
								Image='View'>
								<Action
									PostBack='True'
									Object='ModulePageContent'
									Method='ProjectsContent_ViewTasksForProject'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='WfProjectID' AttributeName='WfProjectID' Value=''/>
									</Parameters>
								</Action>
							</Control>	
						</DisplayProperty>	
						<DisplayProperty PropertyKey=''>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ProjectEdit'/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='ReturnURL' BaseValue='ReturnURL='/>
										<Argument Type='DataObject' TypeKey='WfProjectID' AttributeName='WfProjectID' BaseValue='WfProjectID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnCopy'
								Type='cButton'
								Image='Copy'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ProjectCopy'/>
										<Argument Type='Data' TypeKey='' AttributeName='WfProjectID' BaseValue='WfProjectID=0'/>
										<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>									
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='ReturnURL' BaseValue='ReturnURL='/>
										<Argument Type='DataObject' TypeKey='WfProjectID' AttributeName='ProjectID' BaseValue='ProjectID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='1' HeaderAlign='Left' DataAlign='Left' Width='20%'>
							<Parameters>
								<Argument Value='1' ValueKey='GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue=''/>	
								<Argument Value='2' ValueKey='GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue=''/>	
								
								<Argument Value='3' ValueKey='GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>	
									<Control ID='btnDelete1'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
											<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='WfProjectID' AttributeName='WfProjectID' Value=''/>
												<RelatedDataObjects>
													<RelatedDataObject DataObjectDefinitionKey='WfProjectTask'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='WfProjectID' childProperty='WfProjectID' />
														</RelationshipProperties>
														<RelatedDataObjects>
															<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskPDF'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='WfProjectTaskID' childProperty='WfProjectTaskID' />
																</RelationshipProperties>
															</RelatedDataObject>
															<RelatedDataObject DataObjectDefinitionKey='ReviewStage'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='WfProjectTaskID' childProperty='WfProjectTaskID' />
																</RelationshipProperties>
															</RelatedDataObject>
															<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskUpload'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='WfProjectTaskID' childProperty='WfProjectTaskID' />
																</RelationshipProperties>
																<RelatedDataObjects>
																	<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskUploadOrganizationEligibility'>
																		<RelationshipProperties>
																			<RelationshipProperty parentProperty='WfProjectTaskUploadID' childProperty='WfProjectTaskUploadID' />
																		</RelationshipProperties>
																	</RelatedDataObject>
																</RelatedDataObjects>
															</RelatedDataObject>
															<RelatedDataObject DataObjectDefinitionKey='WFProjectTaskEligibilityAnswer'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='WfProjectTaskID' childProperty='WfProjectTaskID' />
																</RelationshipProperties>
															</RelatedDataObject>
															<RelatedDataObject DataObjectDefinitionKey='Reminder'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='WfProjectTaskID' childProperty='ProjectTaskID' />
																</RelationshipProperties>
															</RelatedDataObject>
															<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskNavElement'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='WfProjectTaskID' childProperty='WfProjectTaskID' />
																</RelationshipProperties>
															</RelatedDataObject>
															<RelatedDataObject DataObjectDefinitionKey='WorkflowEvents'>
																<RelationshipProperties>
																	<RelationshipProperty childProperty='WorkflowID' parentProperty='WfProjectTaskID' />
																	<RelationshipProperty aValue='1' childProperty='WorkflowEventTypeID' />
																</RelationshipProperties>
															</RelatedDataObject>
															<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskOutcome'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='WfProjectTaskID' childProperty='WfProjectTaskID' />
																</RelationshipProperties>
																<RelatedDataObjects>
																	<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskOutcomeTasks'>
																		<RelationshipProperties>
																			<RelationshipProperty parentProperty='WfProjectTaskOutcomeID' childProperty='WfProjectTaskOutcomeID' />
																		</RelationshipProperties>
																	</RelatedDataObject>
																	<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskOutcomeEvents'>
																		<RelationshipProperties>
																			<RelationshipProperty parentProperty='WfProjectTaskOutcomeID' childProperty='WfProjectTaskOutcomeID' />
																		</RelationshipProperties>
																		<RelatedDataObjects>
																			<RelatedDataObject DataObjectDefinitionKey='Event'>
																				<RelationshipProperties>
																					<RelationshipProperty parentProperty='EventKeyID' childProperty='EventID' />
																				</RelationshipProperties>
																			</RelatedDataObject>
																			<RelatedDataObject DataObjectDefinitionKey='EventCorrespondence'>
																				<RelationshipProperties>
																					<RelationshipProperty parentProperty='EventKeyID' childProperty='EventID' />
																				</RelationshipProperties>
																			</RelatedDataObject>
																		</RelatedDataObjects>
																	</RelatedDataObject>
																	<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskOutcomeFilters'>
																		<RelationshipProperties>
																			<RelationshipProperty parentProperty='WfProjectTaskOutcomeID' childProperty='WfProjectTaskOutcomeID' />
																		</RelationshipProperties>
																		<RelatedDataObjects>
																			<RelatedDataObject DataObjectDefinitionKey='FilterArgument'>
																				<RelationshipProperties>
																					<RelationshipProperty parentProperty='FilterArgumentID' childProperty='FilterArgumentID' />
																				</RelationshipProperties>
																			</RelatedDataObject>
																		</RelatedDataObjects>
																	</RelatedDataObject>
																	<RelatedDataObject DataObjectDefinitionKey='WorkflowEvents'>
																		<RelationshipProperties>
																			<RelationshipProperty childProperty='WorkflowID' parentProperty='WfProjectTaskOutcomeID' />
																			<RelationshipProperty aValue='2' childProperty='WorkflowEventTypeID' />
																		</RelationshipProperties>
																	</RelatedDataObject>
																</RelatedDataObjects>
															</RelatedDataObject>
														</RelatedDataObjects>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='PageContent'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='WfProjectID' childProperty='ProjectID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='ProjectPayment'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='WfProjectID' childProperty='ProjectID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='ProjectReport'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='WfProjectID' childProperty='ProjectID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='BudgetCategory'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='WfProjectID' childProperty='ProjectID' />
														</RelationshipProperties>
														<RelatedDataObjects>
															<RelatedDataObject DataObjectDefinitionKey='BudgetItem'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='BudgetCategoryID' childProperty='BudgetCategoryID' />
																</RelationshipProperties>
															</RelatedDataObject>
														</RelatedDataObjects>
													</RelatedDataObject>
												</RelatedDataObjects>
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='' ValueKey='GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>	
									<Control ID='btnDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
											<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='WfProjectID' AttributeName='WfProjectID' Value=''/>
												<RelatedDataObjects>
													<RelatedDataObject DataObjectDefinitionKey='WfProjectTask'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='WfProjectID' childProperty='WfProjectID' />
														</RelationshipProperties>
														<RelatedDataObjects>
															<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskPDF'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='WfProjectTaskID' childProperty='WfProjectTaskID' />
																</RelationshipProperties>
															</RelatedDataObject>
															<RelatedDataObject DataObjectDefinitionKey='ReviewStage'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='WfProjectTaskID' childProperty='WfProjectTaskID' />
																</RelationshipProperties>
															</RelatedDataObject>
															<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskUpload'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='WfProjectTaskID' childProperty='WfProjectTaskID' />
																</RelationshipProperties>
																<RelatedDataObjects>
																	<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskUploadOrganizationEligibility'>
																		<RelationshipProperties>
																			<RelationshipProperty parentProperty='WfProjectTaskUploadID' childProperty='WfProjectTaskUploadID' />
																		</RelationshipProperties>
																	</RelatedDataObject>
																</RelatedDataObjects>
															</RelatedDataObject>
															<RelatedDataObject DataObjectDefinitionKey='WFProjectTaskEligibilityAnswer'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='WfProjectTaskID' childProperty='WfProjectTaskID' />
																</RelationshipProperties>
															</RelatedDataObject>
															<RelatedDataObject DataObjectDefinitionKey='Reminder'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='WfProjectTaskID' childProperty='ProjectTaskID' />
																</RelationshipProperties>
															</RelatedDataObject>
															<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskNavElement'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='WfProjectTaskID' childProperty='WfProjectTaskID' />
																</RelationshipProperties>
															</RelatedDataObject>
															<RelatedDataObject DataObjectDefinitionKey='WorkflowEvents'>
																<RelationshipProperties>
																	<RelationshipProperty childProperty='WorkflowID' parentProperty='WfProjectTaskID' />
																	<RelationshipProperty aValue='1' childProperty='WorkflowEventTypeID' />
																</RelationshipProperties>
															</RelatedDataObject>
															<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskOutcome'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='WfProjectTaskID' childProperty='WfProjectTaskID' />
																</RelationshipProperties>
																<RelatedDataObjects>
																	<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskOutcomeTasks'>
																		<RelationshipProperties>
																			<RelationshipProperty parentProperty='WfProjectTaskOutcomeID' childProperty='WfProjectTaskOutcomeID' />
																		</RelationshipProperties>
																	</RelatedDataObject>
																	<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskOutcomeEvents'>
																		<RelationshipProperties>
																			<RelationshipProperty parentProperty='WfProjectTaskOutcomeID' childProperty='WfProjectTaskOutcomeID' />
																		</RelationshipProperties>
																		<RelatedDataObjects>
																			<RelatedDataObject DataObjectDefinitionKey='Event'>
																				<RelationshipProperties>
																					<RelationshipProperty parentProperty='EventKeyID' childProperty='EventID' />
																				</RelationshipProperties>
																			</RelatedDataObject>
																			<RelatedDataObject DataObjectDefinitionKey='EventCorrespondence'>
																				<RelationshipProperties>
																					<RelationshipProperty parentProperty='EventKeyID' childProperty='EventID' />
																				</RelationshipProperties>
																			</RelatedDataObject>
																		</RelatedDataObjects>
																	</RelatedDataObject>
																	<RelatedDataObject DataObjectDefinitionKey='WfProjectTaskOutcomeFilters'>
																		<RelationshipProperties>
																			<RelationshipProperty parentProperty='WfProjectTaskOutcomeID' childProperty='WfProjectTaskOutcomeID' />
																		</RelationshipProperties>
																		<RelatedDataObjects>
																			<RelatedDataObject DataObjectDefinitionKey='FilterArgument'>
																				<RelationshipProperties>
																					<RelationshipProperty parentProperty='FilterArgumentID' childProperty='FilterArgumentID' />
																				</RelationshipProperties>
																			</RelatedDataObject>
																		</RelatedDataObjects>
																	</RelatedDataObject>
																	<RelatedDataObject DataObjectDefinitionKey='WorkflowEvents'>
																		<RelationshipProperties>
																			<RelationshipProperty childProperty='WorkflowID' parentProperty='WfProjectTaskOutcomeID' />
																			<RelationshipProperty aValue='2' childProperty='WorkflowEventTypeID' />
																		</RelationshipProperties>
																	</RelatedDataObject>
																</RelatedDataObjects>
															</RelatedDataObject>
														</RelatedDataObjects>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='PageContent'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='WfProjectID' childProperty='ProjectID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='ProjectPayment'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='WfProjectID' childProperty='ProjectID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='ProjectReport'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='WfProjectID' childProperty='ProjectID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='BudgetCategory'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='WfProjectID' childProperty='ProjectID' />
														</RelationshipProperties>
														<RelatedDataObjects>
															<RelatedDataObject DataObjectDefinitionKey='BudgetItem'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='BudgetCategoryID' childProperty='BudgetCategoryID' />
																</RelationshipProperties>
															</RelatedDataObject>
														</RelatedDataObjects>
													</RelatedDataObject>
												</RelatedDataObjects>
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
	<!-- End Embedded XML -->
</span>
