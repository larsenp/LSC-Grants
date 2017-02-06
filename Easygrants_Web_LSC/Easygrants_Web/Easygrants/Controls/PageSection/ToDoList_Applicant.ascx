<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cToDoList_Applicant" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<span id='spnToDoListApplicant' runat='server'/>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignmentCalculatedDates' DataObjectDefinitionKey='WfTaskAssignmentCalculatedDates'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' >
					<RelatedProperty PropertyKey='WfTaskAssignment'/>
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Operator='NotEqual' Value='3' >
					<RelatedProperty PropertyKey='WfTaskAssignment'/>
				</Argument>
				<Argument Group='('/>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='1' Bool='' >
					<RelatedProperty PropertyKey='WfTaskAssignment.WfTask'/>
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='5' Bool='Or' >
					<RelatedProperty PropertyKey='WfTaskAssignment.WfTask'/>
				</Argument>
				<Argument Group=')' Bool=''/>
				<Argument Type='CurrentDateTime' TypeKey='Date' Operator='LessThanEqual' PropertyKey='CalculatedOpenDate'/>					
				<Argument Type='CurrentDateTime' TypeKey='Date' Operator='GreaterThanEqual' PropertyKey='CalculatedEndDate' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoListApplicant'
						Container='spnToDoListApplicant'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'
						MaxPerPage='15'>
						<HeaderHtml>
							To Do - Application
						</HeaderHtml>
						<DisplayProperty PropertyKey='WfTaskAssignment.WfProjectTask.Description' ColumnHeader='Task' Width='35%'>
							<Sortable>
								<Argument PropertyKey='Description'>	
									<RelatedProperty PropertyKey='WfTaskAssignment.WfProjectTask'/>
								</Argument>
							</Sortable>
							<Parameters>
								<Argument Value='CurrentDate' ValueKey='CalculatedCloseDate' Operator='LessThanEqual' 
									DisplayValue='' PropertyKey='WfTaskAssignment.WfProjectTask.Description'/>
								<Argument Value='CurrentDate' ValueKey='CalculatedCloseDate' Operator='GreaterThanEqual' 
									DisplayValue='Control' PropertyKey='WfTaskAssignment.WfProjectTask.Description'>
									<Control ID='ctlLink2' 
										Type='cLink'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument AttributeName='PageKey1' Type='DataObjectRelated' TypeKey='WfTaskAssignment.WfTaskModule.ModuleName' />
												<Argument AttributeName='PageKey2' Type='DataObjectRelated' TypeKey='WfTaskAssignment.WfTaskModule.ModuleConfigFilename' />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument AttributeName='PageKey4' Type='DataObject' TypeKey='WfTaskAssignmentID' Value='' />
											</Parameters>
										</Action>
									</Control>
								</Argument>	
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskAssignment.GranteeProject.WfProject.WfCompetition.WfProgram.ProgramDisplayName' ColumnHeader='ProgramName' Width='35%' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='ProgramDisplayName'>	
									<RelatedProperty PropertyKey='WfTaskAssignment.GranteeProject.WfProject.WfCompetition.WfProgram'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskAssignment.WfTaskStatus.WfTaskStatus' ColumnHeader='Status' Width='10%'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'>
									<RelatedProperty PropertyKey='WfTaskAssignment.WfTaskStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CalculatedDueDate' ColumnHeader='Due Date' Format='M/d/yyyy' Width='10%'>
							<Sortable>
								<Argument PropertyKey='CalculatedDueDate'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader=' '  Width='10%'>
							<Parameters>
								<Argument Value='' ValueKey='WfTaskAssignment.WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID' Operator='Eqaul' DisplayValue=''  />
								<Argument Value='' ValueKey='WfTaskAssignment.WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID' Operator='NotEqual' DisplayValue='Control' >								
									<Control ID='btnView'
										Type='cLink'
										Caption='View PDF'>
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
								<Argument Value='False' ValueKey='WfTaskAssignment.WfTask.IsCopyAllowed' Operator='Equal' 
									DisplayValue='' />
								<Argument Value='True' ValueKey='WfTaskAssignment.WfTask.IsCopyAllowed' Operator='Equal' DisplayValue='Control'>
									<Control ID='btnCopy' 
										Type='cButton' 
										Image='Copy'
										Container='spnCopy'>
										<Action
											PostBack='True'
											AutoSave='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey' Value='CopyTask'/>
												<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' Value='WfTaskAssignmentID='/>									
												<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
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
