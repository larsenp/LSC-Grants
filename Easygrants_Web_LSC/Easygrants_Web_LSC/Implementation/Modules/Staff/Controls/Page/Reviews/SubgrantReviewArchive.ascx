<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<br />
<div class='SeparatorHdg'>
	Archived Subgrant Approval Request Review Assignments
</div>
<span id='spnToDoListReviewer' runat='server'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscToDoListReviewSubgrantApprovalRequest' DataObjectDefinitionKey='LscToDoListReviewSubgrantApprovalRequest' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument PropertyKey='WfTaskStatusID' Value="2"/>
			</Filters>
			<Sort>
				<Argument PropertyKey='SubgrantStartDate'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoListReviewer'
						Container='spnToDoListReviewer'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<DisplayProperty ColumnHeader='Task' Width='20%'>
							<Parameters>
								<!-- Display as hyperlink conditions -->
								<Argument Value='CurrentDate,CurrentDate,1' 
									ValueKey='CloseDate,OpenDate,WfTaskStatusID'
									CompareKey=',,,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									DisplayValue='Control' 
									PropertyKey='Task'>
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
								<Argument Value='CurrentDate,CurrentDate,2' 
									ValueKey='CloseDate,OpenDate,WfTaskStatusID'
									CompareKey=',,,'
									Operator='GreaterThanEqual,LessThanEqual,Equal'
									Bool='And,And,And'
									PropertyKey='Task'>
								</Argument>
							</Parameters>
							<Sortable>
								<Argument PropertyKey='Task' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='OrganizationName' ColumnHeader='Grantee'>
							<Sortable>
								<Argument PropertyKey='OrganizationName' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubgranteeName' ColumnHeader='Subgrantee'>
							<Sortable>
								<Argument PropertyKey='SubgranteeName' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubgrantStartDate' ColumnHeader='Subgrant Start' Format='M/d/yyyy'>
							<Sortable>
								<Argument PropertyKey='SubgrantStartDate' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubgrantEndDate' ColumnHeader='Subgrant End' Format='M/d/yyyy'>
							<Sortable>
								<Argument PropertyKey='SubgrantEndDate' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmittedDate' ColumnHeader='Review Submitted' Format='M/d/yyyy'>
							<Sortable>
								<Argument PropertyKey='SubmittedDate' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='TaskStatus' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='TaskStatus' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnView'
								Type='cButton'
								Caption='View PDF'>
								<Action PostBack='True'
									Object='DataPresenter' 
									Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
									<Parameters>
										<Argument Value='/Easygrants_Web_LSC/Core/Controls/Base/pgReportOutputReader.aspx' />
										<Argument AttributeName='WfTaskAssignmentID' Type='DataObject' TypeKey='WfTaskAssignmentID' BaseValue='EntityID=' Value='' />
										<Argument Type='DataObjectRelated'
											TypeKey='WfTaskAssignment.WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
											AttributeName='ReportOutputDefinitionID'
											BaseValue='DefinitionID='/>
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
