<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ProgramMgmt_Content.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cProgramMgmt_Content" EnableViewState="true" %>
<%@ Register Tagprefix='Core' tagname='cButton' src='../../../../../../Core/Controls/Base/CSSButton.ascx' %>
<%@ register Tagprefix='EasyGrants' tagname='cCompetitionListing' src='../../Base/CompetitionListing.ascx' %>
<%@ register Tagprefix='EasyGrants' tagname='cWfProgramListing' src='../../Base/WfProjectListing.ascx' %>
<%@ register Tagprefix='EasyGrants' tagname='cFundingOppCycleInfo' src='WorkflowBuilder/FundingOppCycleInfo.ascx' %>
<%@ register Tagprefix='EasyGrants' tagname='cWorkflowMain' src='WorkflowBuilder/WorkflowBuilderMain.ascx' %>
<%@ register Tagprefix='EasyGrants' tagname='cWorkflowValidation' src='WorkflowBuilder/WorkflowValidation.ascx' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<br>
<table border='0' cellspacing='0' cellpadding='0'>
	<tr>
		<td>
			<asp:PlaceHolder Visible='true' id='WorkflowBuilderTabPlaceHolder' runat='server'></asp:PlaceHolder>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
	<span id='spnHistoryLabel' runat="server">
		<b>History:</b>
	</span>
	<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='false' runat='server' />
	<!-- USER MODIFIABLE CONTENT AREA -->
	
	<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server' id='tblProgramManagement'>
		<tr>
			<td colspan='2' class="SeparatorHdg">Program Management</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		
		<tr>
			<td colspan='2'>
				<span runat='server' id='spnAdd'></span><Core:cButton id='btnProgramsClear' visible='False' runat='server' />
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan='2'>
				<span runat='server' id='spnProgramsList' visible='true'></span>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<EasyGrants:cCompetitionListing id='ctlCompetitionListing' visible='false' runat='server' />
	<EasyGrants:cWfProgramListing id='ctlWfProgramListing' visible='false' runat='server' />
	<EasyGrants:cFundingOppCycleInfo id='ctlFundingOppCycleInfo' visible='false' runat='server' />
	<EasyGrants:cWorkflowMain id='ctlWorkflowMain' visible='false' runat='server' />
	<EasyGrants:cWorkflowValidation id='ctlWorkflowValidation' visible='false' runat='server' />
</table>
	<!-- END USER MODIFIABLE CONTENT AREA -->
	<!-- Embedded XML Page Functionality - please do not edit -->
	<span id='spnConfigXML' visible='false' runat='server'>
		<ModuleSection>
			<!-- ProgramsList -->
			<DataObject Key='ProgramList' DataObjectDefinitionKey='Program' Updatable='False'>
				<Filters></Filters>
				<DisplayProperties>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnAdd' Type='cButton' Image='Add' Container='spnAdd'>
							<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ProgramEditor' />
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
									<Argument Type='Data' TypeKey='' BaseValue='ProgramID=0' Value='' />
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
						<Control ID='ctlProgramsList' Container='spnProgramsList' Type='cDataListCtl' SeparatorWidth='2' DataObjectDefinitionKey='Program'
							MaxPerPage='15'>
							<DisplayProperty PropertyKey='ProgramName' ColumnHeader='ProgramName' Width='25%' ConfigurableHeader='True' >
								<Sortable>
									<Argument PropertyKey='ProgramName'/>
								</Sortable>
							</DisplayProperty>
							<DisplayProperty PropertyKey='ProgramDisplayName' ColumnHeader='ProgramDisplayName' Width='25%' ConfigurableHeader='True' >
								<Sortable>
									<Argument PropertyKey='ProgramDisplayName'/>
								</Sortable>
							</DisplayProperty>
							<DisplayProperty PropertyKey='ProgramID' ColumnHeader='Program ID' Width='20%'>
								<Sortable>
									<Argument PropertyKey='ProgramID'/>
								</Sortable>
							</DisplayProperty>
							<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='3' HeaderAlign='Right' DataAlign='Center'>
								<Control ID='btnView' Type='cButton' Image='View'>
									<Action PostBack='True' Object='ModulePageContent' Method='ProjectsContent_ViewCompetitionsForPrograms'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='ProgramID' AttributeName='ProgramID' Value='' />
										</Parameters>
									</Action>
								</Control>
							</DisplayProperty>
							<DisplayProperty PropertyKey=''>
								<Control ID='btnEdit' Type='cButton' Image='Edit'>
									<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
										<Parameters>
											<Argument AttributeName='PageKey' Value='ProgramEditor' />
											<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='ReturnURL'
												BaseValue='ReturnURL=' />
											<Argument Type='DataObject' TypeKey='ProgramID' AttributeName='ProgramID' BaseValue='ProgramID=' />
										</Parameters>
									</Action>
								</Control>
							</DisplayProperty>
							<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='1' HeaderAlign='Left' DataAlign='Left' Width='20%'>
								<Parameters>
									<Argument Value='1' ValueKey='Competitions.WfProjects.GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue=''/>	
									<Argument Value='2' ValueKey='Competitions.WfProjects.GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue=''/>	
									
									<Argument Value='3' ValueKey='Competitions.WfProjects.GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>	
										<Control ID='btnDelete1' Type='cButton' Image='Delete' Confirmation='Are you sure you want to delete this item?'>
											<Action PostBack='True' Object='EventController' Method='EventController_Delete'>
												<Parameters>
													<Argument Type='DataObject' TypeKey='ProgramID' AttributeName='ProgramID' Value='' />
													<RelatedDataObjects>
														<RelatedDataObject DataObjectDefinitionKey='Competition'>
															<RelationshipProperties>
																<RelationshipProperty parentProperty='ProgramID' childProperty='ProgramID' />
															</RelationshipProperties>	
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
														</RelatedDataObject>
													</RelatedDataObjects>
												</Parameters>
											</Action>
										</Control>
									</Argument>
									<Argument Value='' ValueKey='Competitions.WfProjects.GranteeProjects.WfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>	
										<Control ID='btnDelete' Type='cButton' Image='Delete' Confirmation='Are you sure you want to delete this item?'>
											<Action PostBack='True' Object='EventController' Method='EventController_Delete'>
												<Parameters>
													<Argument Type='DataObject' TypeKey='ProgramID' AttributeName='ProgramID' Value='' />
													<RelatedDataObjects>
														<RelatedDataObject DataObjectDefinitionKey='Competition'>
															<RelationshipProperties>
																<RelationshipProperty parentProperty='ProgramID' childProperty='ProgramID' />
															</RelationshipProperties>	
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
						<Control ID='btnProgramsClear' Type='cButton' Image='Clear'>
							<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument Value='ProgramManagement' />
									<Argument Value='' />
									<Argument Value='' />
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>
				</DisplayProperties>
			</DataObject>
			<!-- End ProgramsList -->
		</ModuleSection>
		<!-- End Embedded XML -->
	</span>