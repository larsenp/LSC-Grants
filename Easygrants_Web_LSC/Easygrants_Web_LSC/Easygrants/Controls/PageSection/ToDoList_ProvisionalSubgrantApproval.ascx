<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<span runat='server' id='spnToDoApproval' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscToDoListRequestPSA' DataObjectDefinitionKey='LscToDoListRequestPSA' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument PropertyKey='WfTaskID' Value='101'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='OpenDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoApproval'
						Container='spnToDoApproval'
						Type='cDataListCtl'
						DataObjectDefinitionKey='LscToDoListRequestSubgrantApproval'
						SeparatorWidth='2'
						MaxPerPage='15'
						NoRecordMessage='There are no current subgrant approval requests (step 1).'>
						<DisplayProperty PropertyKey='SubgranteeName' ColumnHeader='Subgrantee'>
							<Parameters>
								<Argument Value='2' ValueKey='WfTaskStatusID' Operator='GreaterThanEqual' DisplayValue='' PropertyKey='SubgranteeName' />
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual' DisplayValue='' PropertyKey='SubgranteeName'/>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual' DisplayValue='Control' PropertyKey='SubgranteeName'>
									<Control ID='lnkSubgrantApproval'
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
								
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubgrantStartDate' ColumnHeader='Subgrant Start Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='DueDate' ColumnHeader='Due Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status'/>
						<DisplayProperty PropertyKey='' ColumnHeader = ' '>
							<Parameters>
								<Argument Value='2,' ValueKey='WfTaskStatusID,WfTAIDStep2' Operator='Equal,Equal' DisplayValue='Control'>
									<Control ID='btnReqMod'
										Type='cButton'
										Caption='Initiate Step 2'>
										<Action PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey' Value='InitiateSubgrantStep2'/>
												<Argument AttributeName='WfTaskAssignmentID' Type='DataObject' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
												<Argument AttributeName='GranteeProjectID' Type='DataObject' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader=' '  Width='10%'>
									<Parameters>
										<Argument Value='' ValueKey='WfTaskAssignment.WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID' DisplayValue=''  />
										<Argument Value='' ValueKey='WfTaskAssignment.WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID' Operator='NotEqual' DisplayValue='Control' >								
											<Control ID='btnView'
												Type='cButton'
												Caption='View PDF'>
												<Action PostBack='True'
													Object='DataPresenter'
													Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
													<Parameters>
														<Argument Value='/Easygrants_Web_LSC/Core/Controls/Base/pgReportOutputReader.aspx' />
														<Argument Type='DataObject'
															TypeKey='WfTaskAssignmentID'
															AttributeName='WfTaskAssignmentID'
															BaseValue='EntityID='/>
														<Argument Type='DataObjectRelated'
															TypeKey='WfTaskAssignment.WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
															AttributeName='ReportOutputDefinitionID'
															BaseValue='DefinitionID='/>
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