<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants.Controls.PageSection.cToDoList_SubgrantApproval" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<span runat='server' id='spnToDoApproval' />
<br />
<div class='MinorSeparatorHdg'>Subgrant Modification Requests (2014 and earlier)</div>
<br />
<span runat='server' id='spnToDoModification' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscToDoListRequestSubgrantApproval' DataObjectDefinitionKey='LscToDoListRequestSubgrantApproval' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
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
						NoRecordMessage='There are no current Request Subgrant Approval items.'>
						<DisplayProperty PropertyKey='SubgranteeName' ColumnHeader='Subgrantee'>
							<Parameters>
								<Argument Value='3' ValueKey='WfTaskStatusID' Operator='GreaterThanEqual' DisplayValue='' PropertyKey='SubgranteeName' />
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
								<Argument Value='' ValueKey='OpenModWftaID' DisplayValue='Control'>
									<Control ID='btnReqMod'
										Type='cButton'
										Caption='Request Modification'>
										<Action PostBack='True'
											Object='DataPresenter'
											Method='CreateSubgrantModificationRequest'>
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

		<DataObject Key='LscToDoListRequestSubgrantModification' DataObjectDefinitionKey='LscToDoListRequestSubgrantModification' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument PropertyKey='WfTaskIDApp' Value='53'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='OpenDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoModification'
						Container='spnToDoModification'
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