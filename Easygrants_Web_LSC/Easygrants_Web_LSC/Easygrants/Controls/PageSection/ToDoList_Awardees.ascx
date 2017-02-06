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


		<DataObject Key='ToDoListGar' DataObjectDefinitionKey='ToDoListGar'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Group='(' Bool='And'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='OpenDate' Bool=''/>
				<Argument PropertyKey='OpenDate' Value='null' Bool='Or'/>
				<Argument Group=')' Bool=''/>		
				<Argument Group='(' Bool='And'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate' Bool=''/>
				<Argument PropertyKey='EndDate' Value='null' Bool='Or'/>
				<Argument Group=')' Bool=''/>		
			</Filters>
			<Sort>
				<Argument PropertyKey='ServiceAreaTypeID'/>
				<Argument PropertyKey='ServiceArea'/>
				<Argument PropertyKey='FullFormNumber'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoListAwardees'
						Container='spnToDoListAwardees'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'
						MaxPerPage='22'>
						<HeaderHtml>
							
						</HeaderHtml>
						<InstructionHtml>
							
						</InstructionHtml>
						
						<DisplayProperty PropertyKey='Form' ColumnHeader='Task' Width='25%'>
							<Parameters>
								<Argument Value='' ValueKey='CloseDate' Operator='Equal' 
									DisplayValue='Control' PropertyKey='Form'>
									<Control ID='ctlLink' 
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
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual' 
									DisplayValue='' PropertyKey='Form'/>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual' 
									DisplayValue='Control' PropertyKey='Form'>
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
						<DisplayProperty PropertyKey='ServiceArea' ColumnHeader='Service Area' Width='10%' />
						<DisplayProperty PropertyKey='WfTAYear' ColumnHeader='Year' Width='10%' />
						<!--<DisplayProperty PropertyKey='GranteeProject.WfProject.WfCompetition.WfProgram.ProgramDisplayName' ColumnHeader='Program' Width='25%'/>-->
						<DisplayProperty PropertyKey='Status' ColumnHeader='Status' Width='10%'>
							<!--<Parameters>
								<Argument Value='3' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='WfTaskStatus.WfTaskStatus' />
								<Argument Value='1' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='WfTaskStatus.WfTaskStatus' />
								<Argument Value='2' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='WfTaskStatus.WfTaskStatus' />
							</Parameters>-->
						</DisplayProperty>
						<DisplayProperty PropertyKey='DueDate' ColumnHeader='Due Date' Format='M/d/yyyy' Width='10%'/>
						<!--<DisplayProperty PropertyKey='' ColumnHeader=' '  Width='10%'>							
							<Parameters>
								<Argument Value='' ValueKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID' Operator='Equal' DisplayValue=''  />
								<Argument Value='' ValueKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID' Operator='NotEqual' DisplayValue='Control' >								
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
												<Argument Type='DataObjectRelated' TypeKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID' AttributeName='DefinitionID='/>
											</Parameters>
										</Action>
									</Control>	
								</Argument>	
							</Parameters>			
						</DisplayProperty>-->
					</Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
		
<!--		<DataObject Key='WfTA' DataObjectDefinitionKey='WfTaskAssignment'>
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
		<DataObject Key='List4' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='3' Bool='And'>
					<RelatedProperty PropertyKey='WfTask'/>
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='AwardTermID' Value='0' Operator='GreaterThan' Bool='And' />
				<Argument Group='(' Bool='And'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='OpenDate' Bool=''/>
				<Argument PropertyKey='OpenDate' Value='null' Bool='Or'/>
				<Argument Group=')' Bool=''/>		
			</Filters>
			<Sort>
				<Argument PropertyKey='ServiceAreaTypeID'>
					<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition.LscServiceArea.ServiceAreaTypeID' />
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoListAwardees'
						Container='spnToDoListAwardees'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'
						MaxPerPage='22'>
						<HeaderHtml>
							
						</HeaderHtml>
						<InstructionHtml>
							
						</InstructionHtml>
						
						<DisplayProperty PropertyKey='WfTask.WfTask' ColumnHeader='Task' Width='25%'>
							<Parameters>
								<Argument Value='3' ValueKey='WfTaskStatusID' DisplayValue='' PropertyKey='WfProjectTask.Description' />

								<Argument Value='' ValueKey='CloseDateCalculated' Operator='Equal' 
									DisplayValue='Control' PropertyKey='WfProjectTask.Description'>
									<Control ID='ctlLink' 
										Type='cLink'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument AttributeName='PageKey1' Type='DataObjectRelated' TypeKey='WfTaskModule.ModuleName' />
												<Argument AttributeName='PageKey2' Type='DataObjectRelated' TypeKey='WfTaskModule.ModuleConfigFilename' />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument AttributeName='PageKey4' Type='DataObject' TypeKey='WfTaskAssignmentID' Value='' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='CurrentDate' ValueKey='CloseDateCalculated' Operator='LessThanEqual' 
									DisplayValue='' PropertyKey='WfProjectTask.Description'/>
								<Argument Value='CurrentDate' ValueKey='CloseDateCalculated' Operator='GreaterThanEqual' 
									DisplayValue='Control' PropertyKey='WfProjectTask.Description'>
									<Control ID='ctlLink2' 
										Type='cLink'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument AttributeName='PageKey1' Type='DataObjectRelated' TypeKey='WfTaskModule.ModuleName' />
												<Argument AttributeName='PageKey2' Type='DataObjectRelated' TypeKey='WfTaskModule.ModuleConfigFilename' />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument AttributeName='PageKey4' Type='DataObject' TypeKey='WfTaskAssignmentID' Value='' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.WfProject.WfCompetition.WfProgram.ProgramDisplayName' ColumnHeader='Program' Width='25%'/>
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatus' ColumnHeader='Status' Width='10%'>
							<Parameters>
								<Argument Value='3' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='WfTaskStatus.WfTaskStatus' />
								<Argument Value='1' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='WfTaskStatus.WfTaskStatus' />
								<Argument Value='2' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='WfTaskStatus.WfTaskStatus' />
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='DueDateCalculated' ColumnHeader='Due Date' Format='M/d/yyyy' Width='10%'/>
						<DisplayProperty PropertyKey='' ColumnHeader=' '  Width='10%'>							
							<Parameters>
								<Argument Value='' ValueKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID' Operator='Eqaul' DisplayValue=''  />
								<Argument Value='' ValueKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID' Operator='NotEqual' DisplayValue='Control' >								
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
												<Argument Type='DataObjectRelated' TypeKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID' AttributeName='DefinitionID='/>
											</Parameters>
										</Action>
									</Control>	
								</Argument>	
							</Parameters>			
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader=' ' Width='5%'>
						<Parameters>
								<Argument Value='0' ValueKey='WfTask.IsCopyAllowed' Operator='Equal' 
									DisplayValue='' />
								<Argument Value='1' ValueKey='WfTask.IsCopyAllowed' Operator='Equal' DisplayValue='Control'>
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
													<%--<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>--%>
												</Parameters>
										</Action>
									</Control>
								</Argument>
						</Parameters>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='' ColumnHeader=' ' Width='5%'>
						<Parameters>
								<Argument Value='0' ValueKey='WfTask.IsCopyAllowed' Operator='Equal' 
									DisplayValue='' />
								<Argument Value='2' ValueKey='WfTask.IsCopyAllowed' Operator='Equal' DisplayValue='Control'>
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
													<%--<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>--%>
												</Parameters>
										</Action>
									</Control>
								</Argument>
						</Parameters>
						</DisplayProperty>	
					</Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>-->
	</ModuleSection>
<!-- End Embedded XML -->
</span>

