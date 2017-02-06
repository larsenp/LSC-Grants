<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<span runat='server' id='spnToDoPBIFLOI'/><br />
<span runat='server' id='spnToDoPBIFApp'/><br />
<span runat='server' id='spnToDoPBIFAcc'/><br />
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscToDoListProBonoGrantLOI' DataObjectDefinitionKey='LscToDoListProBonoGrant' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='OpenDate' Value=''/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='CloseDate' Value=''/>
				<Argument PropertyKey='WfTaskID' Value='123'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoPBIFLOI'
						Container='spnToDoPBIFLOI'
						Type='cDataListCtl'
						SeparatorWidth='2'
						MaxPerPage='15'>
						<HeaderHtml>
							Pro Bono Innovation Fund Letter of Intent to Apply
						</HeaderHtml>
						<DisplayProperty PropertyKey='WfTask' ColumnHeader='Task'/>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='Grant Request ID'>
							<Parameters>
								<Argument Value='3' ValueKey='WfTaskStatusID' Operator='GreaterThanEqual' DisplayValue='' PropertyKey='GranteeProject.LegacyGrantID' />
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual' DisplayValue='' PropertyKey='GranteeProject.LegacyGrantID'/>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual' DisplayValue='Control' PropertyKey='GranteeProject.LegacyGrantID'>
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
						<DisplayProperty PropertyKey='DueDate' ColumnHeader='Due Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscToDoListProBonoGrantApp' DataObjectDefinitionKey='LscToDoListProBonoGrant' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='OpenDate' Value=''/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate' Value=''/>
				<Argument PropertyKey='WfTaskID' Value='100'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoPBIFApp'
						Container='spnToDoPBIFApp'
						Type='cDataListCtl'
						SeparatorWidth='2'
						MaxPerPage='15'>
						<HeaderHtml>
							Pro Bono Innovation Fund Application
						</HeaderHtml>
						<InstructionHtml>
							As a result of your successful Notice of Intent to Apply for Funding, you are formally invited by LSC to submit a full application for FY 2016 Pro Bono Innovation Fund funding. Please click the button below to submit your Application. 
						</InstructionHtml>
						<DisplayProperty PropertyKey='WfTask' ColumnHeader='Task'/>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='Grant Request ID'>
							<Parameters>
								<Argument Value='3' ValueKey='WfTaskStatusID' Operator='GreaterThanEqual' DisplayValue='' PropertyKey='GranteeProject.LegacyGrantID' />
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual' DisplayValue='' PropertyKey='GranteeProject.LegacyGrantID'/>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual' DisplayValue='Control' PropertyKey='GranteeProject.LegacyGrantID'>
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
						<DisplayProperty PropertyKey='DueDate' ColumnHeader='Due Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status'/>
						<DisplayProperty PropertyKey='' ColumnHeader=' '  Width='10%'>
							<Parameters>
								<Argument Value='' 
									ValueKey='WfTaskAssignment.WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID' 
									Operator='Equal' 
									DisplayValue=''  />
								<Argument Value='' 
									ValueKey='WfTaskAssignment.WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID' 
									Operator='NotEqual' 
									DisplayValue='Control'>
									<Control ID='btnView'
										Type='cButton'
										Caption='View&nbsp;PDF'>
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

		<DataObject Key='LscToDoListProBonoGrantAcc' DataObjectDefinitionKey='LscToDoListProBonoGrant' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='OpenDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate' Value=''/>
				<Argument PropertyKey='WfTaskID' Value='115'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoPBIFAcc'
						Container='spnToDoPBIFAcc'
						Type='cDataListCtl'
						DataObjectDefinitionKey='LscToDoListProBonoGrant'
						SeparatorWidth='2'
						MaxPerPage='15'>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='Acceptance of Grant Award - Grant Request ID'>
							<Parameters>
								<Argument Value='3' ValueKey='WfTaskStatusID' Operator='GreaterThanEqual' DisplayValue='' PropertyKey='GranteeProject.LegacyGrantID' />
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual' DisplayValue='' PropertyKey='GranteeProject.LegacyGrantID'/>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual' DisplayValue='Control' PropertyKey='GranteeProject.LegacyGrantID'>
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
						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>