<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants.Controls.PageSection.cToDoList_SubgrantApprovalStep2" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<span runat='server' id='spnToDoApproval' />
<br />
<div class='MinorSeparatorHdg'>Subgrant Modification Requests (2015 and Later)</div>
<br />
<span runat='server' id='spnToDoModificationStep2' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscToDoListRequestPSA' DataObjectDefinitionKey='LscToDoListRequestPSA' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument PropertyKey='WfTaskID' Value='116'/>
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
						NoRecordMessage='There are no current subgrant approval requests (step 2).'>
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
						<DisplayProperty PropertyKey='' ColumnHeader = ' '>
							<Parameters>
								<Argument Value='' ValueKey='WfTAIDModification' DisplayValue='Control'>
									<Control ID='btnReqMod'
										Type='cButton'
										Caption='Request Modification of Subgrant'>
										<Action PostBack='True'
											Object='DataPresenter'
											Method='CreateSubgrantModificationRequestStep2'>
											<Parameters>
												<Argument AttributeName='GranteeProjectID' Type='DataObject' TypeKey='GranteeProjectID'/>
												<Argument AttributeName='PersonID' Type='DataObject' TypeKey='PersonID'/>
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
		
		<DataObject Key='LscToDoListRequestSubgrantModificationStep2' DataObjectDefinitionKey='LscToDoListRequestSubgrantModification' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument PropertyKey='WfTaskIDApp' Value='116'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='OpenDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoModification'
						Container='spnToDoModificationStep2'
						Type='cDataListCtl'
						DataObjectDefinitionKey='LscToDoListRequestSubgrantModification'
						SeparatorWidth='2'
						MaxPerPage='15'
						NoRecordMessage='There are no current Request Subgrant Modification items.'>
						<DisplayProperty PropertyKey='SubgranteeName' ColumnHeader='Subgrantee'>
							<Parameters>
								<Argument Value='3' ValueKey='WfTaskStatusID' Operator='GreaterThanEqual' DisplayValue='' PropertyKey='SubgranteeName' />
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual' DisplayValue='' PropertyKey='SubgranteeName'/>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual' DisplayValue='Control' PropertyKey='SubgranteeName'>
									<Control ID='lnkSubgrantMod'
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
						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>