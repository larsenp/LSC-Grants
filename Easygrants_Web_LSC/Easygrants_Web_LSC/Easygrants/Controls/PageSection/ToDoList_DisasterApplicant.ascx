<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<span runat='server' id='spnToDoSandyApp'/><br />
<span runat='server' id='spnToDoDisasterAcc'/>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscToDoListDisasterGrantApp' DataObjectDefinitionKey='LscToDoListDisasterGrant' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='CloseDate' Value=''/>
				<Argument PropertyKey='WfTaskID' Value='93'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoSandyApp'
						Container='spnToDoSandyApp'
						Type='cDataListCtl'
						DataObjectDefinitionKey='LscToDoListDisasterGrant'
						SeparatorWidth='2'
						MaxPerPage='15'
						NoRecordMessage='There are no current LSC Emergency Disaster Grant applications.'>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='Application - Grant Request ID'>
							<Parameters>
								<Argument Value='3' ValueKey='WfTaskStatusID' Operator='GreaterThanEqual' DisplayValue='' PropertyKey='GranteeProjectID' />
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual' DisplayValue='' PropertyKey='GranteeProjectID'/>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual' DisplayValue='Control' PropertyKey='GranteeProjectID'>
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

		<DataObject Key='LscToDoListDisasterGrantAcc' DataObjectDefinitionKey='LscToDoListDisasterGrant' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='OpenDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate' Value=''/>
				<Argument PropertyKey='WfTaskID' Value='97'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoDisasterAcc'
						Container='spnToDoDisasterAcc'
						Type='cDataListCtl'
						DataObjectDefinitionKey='LscToDoListDisasterGrant'
						SeparatorWidth='2'
						MaxPerPage='15'>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='Acceptance of Grant Award - Grant Request ID'>
							<Parameters>
								<Argument Value='3' ValueKey='WfTaskStatusID' Operator='GreaterThanEqual' DisplayValue='' PropertyKey='GranteeProjectID' />
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual' DisplayValue='' PropertyKey='GranteeProjectID'/>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual' DisplayValue='Control' PropertyKey='GranteeProjectID'>
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