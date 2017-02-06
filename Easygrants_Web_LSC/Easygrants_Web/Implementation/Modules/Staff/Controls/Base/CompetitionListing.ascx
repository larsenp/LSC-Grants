<%@ Control Language="vb" AutoEventWireup="true"  Codebehind="CompetitionListing.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Base.cCompetitionListing" EnableViewState="false" %>
<%@ Register Tagprefix='Core' tagname='cButton' src='../../../../../Core/Controls/Base/CSSButton.ascx' %>
<!-- USER MODIFIIABLE CONTENT AREA -->
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Funding Opportunity Management</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b><%=GetLabel("ProgramName")%>:</b>&nbsp;
		<span id='spnProgram' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span><Core:cButton id='btnClear' visible='True' runat='server'/>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnCompetitionsList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
</table>

<!-- END USER MODIFIIABLE CONTENT AREA -->

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
		<DataObject Key='CompetitionsList' DataObjectDefinitionKey='Competition' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProgramID' PropertyKey='ProgramID' Value=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='CompetitionDisplayName' />	
			</Sort>	
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
									<Argument AttributeName='PageKey' Value='CompetitionEditor'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
									<Argument Type='Data' TypeKey='' BaseValue='CompetitionID=0' Value=''/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCompetitionsList'
						Container='spnCompetitionsList'
						Type='cDataListCtl'
						SeparatorWidth='2' 
						DataObjectDefinitionKey='Competition'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='CompetitionDisplayName' ColumnHeader='FundingOpportunity' Width='50%' ConfigurableHeader='True' >
							<Sortable>
								<Argument PropertyKey='CompetitionDisplayName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CompetitionID' ColumnHeader='Funding Opportunity ID' Width='20%'>
							<Sortable>
								<Argument PropertyKey='CompetitionID'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='3' HeaderAlign='Right' DataAlign='Center'>
							<Control ID='btnView'
								Type='cButton'
								Image='View'>
								<Action
									PostBack='True'
									Object='ModulePageContent'
									Method='ProjectsContent_ViewProjectForProgram'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='CompetitionID' AttributeName='CompetitionID' Value=''/>
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
										<Argument AttributeName='PageKey' Value='CompetitionEditor'/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='ReturnURL' BaseValue='ReturnURL='/>
										<Argument Type='DataObject' TypeKey='CompetitionID' AttributeName='CompetitionID' BaseValue='CompetitionID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='1' HeaderAlign='Left' DataAlign='Left' Width='20%'>
							<Parameters>
								<Argument Value='1' ValueKey='WfProjects.GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue=''/>	
								<Argument Value='2' ValueKey='WfProjects.GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue=''/>	
								
								<Argument Value='3' ValueKey='WfProjects.GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>	
									<Control ID='btnDelete1'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
											<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='CompetitionID' AttributeName='CompetitionID' Value=''/>
												<RelatedDataObjects>
													<RelatedDataObject DataObjectDefinitionKey='WfProject'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='CompetitionID' childProperty='CompetitionID' />
														</RelationshipProperties>
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
													</RelatedDataObject>
												</RelatedDataObjects>
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='' ValueKey='WfProjects.GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>	
									<Control ID='btnDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
											<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='CompetitionID' AttributeName='CompetitionID' Value=''/>
												<RelatedDataObjects>
													<RelatedDataObject DataObjectDefinitionKey='WfProject'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='CompetitionID' childProperty='CompetitionID' />
														</RelationshipProperties>
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

				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClear' 
						Type='cButton' 
						Image='Clear'>
						<Action 
							PostBack='True' 
							Object='EventController' 
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ProgramManagement'/>
								<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Value=''/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
