<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cToDoList_Applicant" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
		<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
		<span id='spnToDoListApplicant' runat='server'/>
		<span id='spnConfigXML' visible='false' runat='server'>
			<ModuleSection>
				<DataObject Key='WfTaskAssignmentCalculatedDates' DataObjectDefinitionKey='ToDoListApplication'>
					<Filters>
						<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
						<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='OpenDate'/>
						<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate' Value=''/>
					</Filters>
					<DisplayProperties>
						<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
							<Control ID='ctlToDoListApplicant'
								Container='spnToDoListApplicant'
								Type='cDataListCtl'
								DataObjectDefinitionKey='ToDoListApplication'
								SeparatorWidth='2'
								MaxPerPage='15'>
								<HeaderHtml>
									To Do - Application
								</HeaderHtml>
								<InstructionHtml>
									View your NIC and Grant application(s) by clicking on the appropriate links. To create a new NIC or 
									Grant application based on a existing one, click <b>Copy</b>.<br/><br/>
								</InstructionHtml>
								<DisplayProperty PropertyKey='WfTask' ColumnHeader='Task' Width='25%'>
									<Parameters>
										<Argument Value='3' ValueKey='WfTaskStatusID' Operator='GreaterThanEqual'
											DisplayValue='' PropertyKey='WfTask' />

										<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual'
											DisplayValue='' PropertyKey='WfTask'/>
										<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual'
											DisplayValue='Control' PropertyKey='WfTask'>
											<Control ID='ctlLink2'
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
								<DisplayProperty PropertyKey='ServiceArea' ColumnHeader='Service Area' Width='25%'/>
								<DisplayProperty  ColumnHeader='Status' Width='10%'>
									<Parameters>
										<Argument Value='3' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='WfTaskStatus' />
										<Argument Value='1' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='WfTaskStatus' />
										<Argument Value='2' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='WfTaskStatus' />
									</Parameters>
								</DisplayProperty>

								<DisplayProperty PropertyKey='DueDate' ColumnHeader='Due Date' Format='M/d/yyyy' Width='10%'>
									<Parameters>
										<Argument Value='3' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='DueDate' Format='M/d/yyyy'/>
										<Argument Value='1' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='DueDate' Format='M/d/yyyy'/>
										<!--
								<Argument Value='5' ValueKey='WfTask.WfTaskTypeID'  DisplayValue='N/A' />-->
										<Argument Value='2' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='DueDate' Format='M/d/yyyy'/>
									</Parameters>
								</DisplayProperty>
								<DisplayProperty PropertyKey='' ColumnHeader=' '  Width='10%'>
									<Parameters>
										<Argument Value='' ValueKey='WfTaskAssignment.WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID' Operator='Eqaul' DisplayValue=''  />
										<Argument Value='' ValueKey='WfTaskAssignment.WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID' Operator='NotEqual' DisplayValue='Control' >								
											<Control ID='btnView'
												Type='cLink'
												Caption='View&nbsp;PDF'>
												<Action ID='View' Target='_blank' URL='../../../Core/Controls/Base/pgReportOutputReader.aspx' >
												</Action>
											</Control>
											<%--
											<Control ID='btnView'
												Type='cButton'
												Container='spnViewApp'
												Caption='View PDF'
												Image='view_pdf'>
												<Action
													PostBack='True'
													Object='DataPresenter'
													Method='ViewAppPDF'>
													<Parameters>
														<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='EntityID='/>
														<Argument Type='DataObjectRelated' TypeKey='WfTaskAssignment.WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID' AttributeName='DefinitionID='/>
													</Parameters>
												</Action>
											</Control>	
											--%>
										</Argument>	
									</Parameters>			
								</DisplayProperty>
								<DisplayProperty PropertyKey='' ColumnHeader=' ' Width='10%'>
									<Parameters>
										<Argument Value='0' ValueKey='IsCopyAllowed' Operator='Equal'
											DisplayValue='' />
										<Argument Value='1' ValueKey='IsCopyAllowed' Operator='Equal' DisplayValue='Control'>
											<Control ID='btnCopy'
												Type='cButton'
												Image='Copy'
												Container='spnCopy'>
												<Action
														PostBack='True'
														Object='EventController'
														Method='EventController_NavigateToModulePageKey'>
													<Parameters>
														<Argument AttributeName='PageKey' Value='CopyTask'/>
														<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
													</Parameters>
												</Action>
											</Control>
										</Argument>
									</Parameters>
								</DisplayProperty>
								<DisplayProperty PropertyKey='' ColumnHeader=' ' Width='10%'>
									<Parameters>
										<Argument Value='0' ValueKey='IsCopyAllowed' Operator='Equal'
											DisplayValue='' />
										<Argument Value='2' ValueKey='IsCopyAllowed' Operator='Equal' DisplayValue='Control'>
											<Control ID='btnCopy2'
												Type='cButton'
												Image='Copy'
												Container='spnCopy'>
												<Action
														PostBack='True'
														Object='EventController'
														Method='EventController_NavigateToModulePageKey'>
													<Parameters>
														<Argument AttributeName='PageKey' Value='CopyExistingTask'/>
														<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
														<Argument Type='DataObject' TypeKey='WfTaskID' AttributeName='WfTaskID' BaseValue='WfTaskID='/>
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
	