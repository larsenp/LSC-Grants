<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cToDoList_Awardees" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<br>
<table id='Table1' runat='server' width='100%' border='0'>
<tr id='trGrants' runat='server'><td><span id='spnMyGrants' runat='server'/><br></td></tr>
<tr><td><span id='spnToDoListAwardees' runat='server'/></td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='MyGrants' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlMyGrants'  Container='spnMyGrants' Type='cButton' Caption='View My Grants'>
						<Action
							PostBack='True'
							Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='MyGrants'/>
								</Parameters>
						</Action>
					</Control>
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTA' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Operator='NotEqual' Value='3' />
				<Argument Group='(' Bool='And'/>
					<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='3' Bool=''>
						<RelatedProperty PropertyKey='WfTask'/>
					</Argument>
					<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='8' Bool='Or'>
						<RelatedProperty PropertyKey='WfTask'/>
					</Argument>
				<Argument Group=')' Bool=''/>
				<Argument Group='(' Bool='And'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='OpenDate' Bool=''/>
				<Argument PropertyKey='OpenDate' Value='null' Bool='Or'/>
				<Argument Group=')' Bool=''/>		
			</Filters>
		</DataObject>
		<DataObject Key='WfTaskAssignmentCalculatedDates' DataObjectDefinitionKey='WfTaskAssignmentCalculatedDates'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' >
					<RelatedProperty PropertyKey='WfTaskAssignment'/>
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Operator='NotEqual' Value='3' >
					<RelatedProperty PropertyKey='WfTaskAssignment'/>
				</Argument>
				<Argument Group='('/>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='3' Bool=''>
					<RelatedProperty PropertyKey='WfTaskAssignment.WfTask'/>
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='8' Bool='Or'>
					<RelatedProperty PropertyKey='WfTaskAssignment.WfTask'/>
				</Argument>
				<Argument Group=')' Bool=''/>
				<Argument Type='CurrentDateTime' TypeKey='Date' Operator='LessThanEqual' PropertyKey='CalculatedOpenDate'/>					
				<Argument Type='CurrentDateTime' TypeKey='Date' Operator='GreaterThanEqual' PropertyKey='CalculatedEndDate' Value=''/>					
			</Filters>
			<Sort>
				<Argument PropertyKey='CalculatedDueDate' Direction='DESC'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoListAwardees'
						Container='spnToDoListAwardees'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<HeaderHtml></HeaderHtml>
						<InstructionHtml></InstructionHtml>
						<DisplayProperty PropertyKey='WfTaskAssignment.WfProjectTask.Description' ColumnHeader='Task' Width='35%'>
							<Sortable>
								<Argument PropertyKey='Description'>	
									<RelatedProperty PropertyKey='WfTaskAssignment.WfProjectTask'/>
								</Argument>
							</Sortable>
							<Parameters>
								<Argument Value='3' ValueKey='WfTaskAssignment.WfTaskStatusID' DisplayValue='' PropertyKey='WfTaskAssignment.WfProjectTask.Description' />								
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