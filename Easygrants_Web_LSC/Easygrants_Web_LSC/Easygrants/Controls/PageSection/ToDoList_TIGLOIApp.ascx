<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<span runat='server' id='spnToDo' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ToDoListTIGLOIApp' DataObjectDefinitionKey='ToDoListTIGLOIApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='OpenDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate' Value=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Tig'/>
				<Argument PropertyKey='TaskSortOrder'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDo'
						Container='spnToDo'
						Type='cDataListCtl'
						DataObjectDefinitionKey='ToDoListTIGLOIApp'
						SeparatorWidth='2'
						MaxPerPage='15'
						NoRecordMessage='There are no current TIG LOI/Application items.'>
						<DisplayProperty PropertyKey='Tig' ColumnHeader='TIG'>
							<Sortable>
								<Argument PropertyKey='Tig' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTask' ColumnHeader='Task'>
							<Parameters>
								<Argument Value='3' ValueKey='WfTaskStatusID' Operator='GreaterThanEqual' DisplayValue='' PropertyKey='WfTask' />
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual' DisplayValue='' PropertyKey='WfTask'/>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual' DisplayValue='Control' PropertyKey='WfTask'>
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
						<DisplayProperty  PropertyKey='WfTaskStatus' ColumnHeader='Status' Width='10%'>
						</DisplayProperty>

						<DisplayProperty PropertyKey='DueDate' ColumnHeader='Due Date' Format='M/d/yyyy' Width='10%'>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

