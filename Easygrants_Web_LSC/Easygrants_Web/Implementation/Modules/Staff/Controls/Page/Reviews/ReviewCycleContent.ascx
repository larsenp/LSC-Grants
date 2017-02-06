<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="ReviewCycleContent.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cReviewCycleContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="False" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br /><br />
<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Root' Key='ReviewCycle' LinkTitle='Review Cycles' runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Review Cycles</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>	
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='ReviewCycleList' DataObjectDefinitionKey='ReviewCycle'>
		<Sort>
			<Argument PropertyKey='TimePeriodID' Direction='Descending'/>
			<Argument PropertyKey='CompetitionID' />
			<Argument PropertyKey='ListOrder' />
		</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ReviewCycleEditor'/>
									<Argument Type='' TypeKey='ReviewCycleID' AttributeName='ReviewCycleID' Value='ReviewCycleID=-1'/>
									<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='20'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='Name' ColumnHeader='Cycle Name'>
							<Sortable>
								<Argument PropertyKey='Name' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Program.ProgramDisplayName' ColumnHeader='ProgramName' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='ProgramDisplayName'>
									<RelatedProperty PropertyKey='Program'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewCycleCompetitionList.Competitions' ColumnHeader='FundingOpportunity' ConfigurableHeader='True'> 
							<Sortable>
								<Argument PropertyKey='Competitions'>
									<RelatedProperty PropertyKey='ReviewCycleCompetitionList'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<%-- 
						<DisplayProperty PropertyKey='TimePeriod.Description' ColumnHeader='Time Period/Award Cycle'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='TimePeriod'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						--%>
						<DisplayProperty PropertyKey='ReviewCycleTimePeriods' ColumnHeader='Time Period/Award Cycle' List='True' ListSeparator=','>
							<DisplayProperties>
								<DisplayProperty PropertyKey='TimePeriod.Description'/>
							</DisplayProperties>
							 <Sortable>
                                <Argument PropertyKey='Description'>
                                    <RelatedProperty PropertyKey='ReviewCycleTimePeriods.TimePeriod'/>
                                </Argument>
                            </Sortable>
						</DisplayProperty>
						
												
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Left' Width='200'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ReviewCycleEditor'/>
										<Argument Type='DataObject' TypeKey='ReviewCycleID' AttributeName='ReviewCycleID' BaseValue='ReviewCycleID='/>
										<Argument Type='DataObject' TypeKey='ProgramID' AttributeName='ProgramID' BaseValue='ProgramID='/>
										<Argument Type='DataObject' TypeKey='CompetitionID' AttributeName='CompetitionID' BaseValue='CompetitionID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnCopy'
								Type='cButton'
								Image='Copy'
								Confirmation='Are you sure you want to copy this review cycle?'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='ReviewCycleCopy'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='ReviewCycleID' AttributeName='ReviewCycleID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnManage'
								Type='cButton'
								Image='Manage'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ReviewCycleManager'/>
										<Argument Type='DataObject' TypeKey='ReviewCycleID' AttributeName='ReviewCycleID' BaseValue='ReviewCycleID='/>
										<Argument Type='DataObject' TypeKey='CompetitionID' AttributeName='CompetitionID' BaseValue='CompetitionID='/>
										<Argument Type='DataObject' TypeKey='ProgramID' AttributeName='ProgramID' BaseValue='ProgramID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='ReviewCycleID' AttributeName='ReviewCycleID'/>
										<RelatedDataObjects>
											<RelatedDataObject DataObjectDefinitionKey='ReviewCycleNotification'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='ReviewCycleID' childProperty='ReviewCycleID' />
												</RelationshipProperties>
											</RelatedDataObject>
											<RelatedDataObject DataObjectDefinitionKey='ReviewCycleCommittee'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='ReviewCycleID' childProperty='ReviewCycleID' />
												</RelationshipProperties>
											</RelatedDataObject>
											<RelatedDataObject DataObjectDefinitionKey='ReviewCycleProjectTask'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='ReviewCycleID' childProperty='ReviewCycleID' />
												</RelationshipProperties>
											</RelatedDataObject>
											<RelatedDataObject DataObjectDefinitionKey='ReviewCycleProjectTaskOutcome'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='ReviewCycleID' childProperty='ReviewCycleID' />
												</RelationshipProperties>
											</RelatedDataObject>
											<RelatedDataObject DataObjectDefinitionKey='ReviewCycleConflict'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='ReviewCycleID' childProperty='ReviewCycleID' />
												</RelationshipProperties>
											</RelatedDataObject>
											<RelatedDataObject DataObjectDefinitionKey='ReviewCycleCompetition'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='ReviewCycleID' childProperty='ReviewCycleID' />
												</RelationshipProperties>
											</RelatedDataObject>
											<RelatedDataObject DataObjectDefinitionKey='ReviewCycleStage'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='ReviewCycleID' childProperty='ReviewCycleID' />
												</RelationshipProperties>
												<RelatedDataObjects>
													<RelatedDataObject DataObjectDefinitionKey='WfTaskAssignment'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='ReviewCycleStageID' childProperty='ReviewCycleStageID' />
														</RelationshipProperties>
														<RelatedDataObjects>
															<RelatedDataObject DataObjectDefinitionKey='WfTaskAssignmentReview'>
																<RelationshipProperties>
																	<RelationshipProperty parentProperty='WfTaskAssignmentID' childProperty='WfTaskAssignmentID' />
																</RelationshipProperties>
															</RelatedDataObject>
														</RelatedDataObjects>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='ReviewCycleStageCommittee'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='ReviewCycleStageID' childProperty='ReviewCycleStageID' />
														</RelationshipProperties>
													</RelatedDataObject>
												</RelatedDataObjects>
											</RelatedDataObject>
										</RelatedDataObjects>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
