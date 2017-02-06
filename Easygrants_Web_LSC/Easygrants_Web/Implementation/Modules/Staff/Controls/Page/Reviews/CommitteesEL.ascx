<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Reviews.cCommitteesEL" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br />
<br />
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Filter</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='50%'>
	<tr>
		<td><B><%=GetLabel("ProgramName")%></B></td>
		<td>
			<span runat='server' id='spnProgram'></span>
		</td>
	</tr>
	<tr>
		<td nowrap><B>Time Period/Award Cycle</B></td>
		<td>
			<span runat='server' id='spnTimePeriod'></span>
		</td>
	</tr>
	<tr>
		<td><B>Active?</B></td>
		<td>
			<span runat='server' id='spnCommitteeStatus'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnFind'/>&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnClear'/>
			<br><br>
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Committee Management</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnNoResult'/>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Subcommittee Management</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAddSubCommittee'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataListSubCommittee' visible='true'></span>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<ResultLists>
			<ResultList Key='CommitteeList'>Committees</ResultList>
			<ResultList Key='SubCommitteeList'>SubCommittees</ResultList>
		</ResultLists>
		<DataObject Key='Filter' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProgram'
						Type='cDropDown'
						Container='spnProgram'
						DataObjectDefinitionKey='Program'
						StoredValue='ProgramID'
						DisplayValue='ProgramDisplayName'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='ProgramID'>
						<FilterList List='CommitteeList' Property='ReviewCommitteeProgram.ProgramID'/>
						<FilterList List='SubCommitteeList' Property='ParentReviewCommittee.ReviewCommitteeProgram.ProgramID'/>
						<Sort>
							<Argument PropertyKey='ProgramDisplayName'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTimePeriod'
						Type='cDropDown'
						Container='spnTimePeriod'
						DataObjectDefinitionKey='TimePeriod'
						StoredValue='TimePeriodID'
						DisplayValue='Description'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='TimePeriodID'>
						<FilterList List='CommitteeList' Property='ReviewCommitteeProgram.TimePeriodID'/>
						<FilterList List='SubCommitteeList' Property='ParentReviewCommittee.ReviewCommitteeProgram.TimePeriodID'/>
						<Sort>
							<Argument PropertyKey='Description'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCommitteeStatus'
						Type='cDropDown'
						Container='spnCommitteeStatus'
						ParamList='|All~False|No~True|Yes'
						Separator='~'
						SubSeparator='|'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='Inactive'>
						<FilterList List='CommitteeList' Property='Inactive' Operator='NotEqual'/>
						<FilterList List='SubCommitteeList' Property='ParentReviewCommittee.Inactive' Operator='NotEqual'/>
						<Sort>
							<Argument PropertyKey='Inactive'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnFind'
						Type='cButton' EnterKey='True'
						Container='spnFind' 
						Image='Find'>
						<Action
							PostBack='True'
							Object='ModulePageContent'
							Method='FilterListDataPresenter_Find'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClear'
						Type='cButton'
						Container='spnClear'
						Image='Clear'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Committees'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='CommitteesEditor'/>
								<Argument Type='Data' BaseValue='ReviewCommitteeID=0'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddSubCommittee' 
						Type='cButton' 
						Image='Add'
						Container='spnAddSubCommittee'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='SubCommitteesEditor'/>
									<Argument AttributeName='' BaseValue='ReviewCommitteeID=0'/>
									<Argument AttributeName='' BaseValue='ParentRCID=0'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='CommitteeList' DataObjectDefinitionKey='ReviewCommittee' Updatable='False' GetData='False'>
			<Filters>
				<Argument PropertyKey='ParentReviewCommitteeID' Value='null'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='ReviewCommitteeDescription'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='ReviewCommitteeDescription' ColumnHeader='Committee' Width="20%">
							<Sortable>
								<Argument PropertyKey='ReviewCommitteeDescription'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewCommitteeProgram.Program.ProgramDisplayName' ColumnHeader='Program' Width="20%">
							<Sortable>
								<Argument PropertyKey='ProgramDisplayName'>
									<RelatedProperty PropertyKey='ReviewCommitteeProgram.Program' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Inactive' Format='ActiveInactive' ColumnHeader='Status' Width="10%">
							<Sortable>
								<Argument PropertyKey='Inactive'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewCommitteeProgram.TimePeriod.Description' ColumnHeader='Cycle' Width="10%">
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='ReviewCommitteeProgram.TimePeriod' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Left'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit Committee'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='CommitteesEditor'/>
										<Argument Type='DataObject' TypeKey='ReviewCommitteeID' AttributeName='ReviewCommitteeID' BaseValue='ReviewCommitteeID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnView'
								Type='cButton'
								Image='Edit Roles'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='CommitteeMember'/>
										<Argument Type='DataObject' TypeKey='ReviewCommitteeID' AttributeName='ReviewCommitteeID' BaseValue='ReviewCommitteeID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='ReviewCommitteeID' AttributeName='ReviewCommitteeID'/>
										<RelatedDataObjects>
											<RelatedDataObject DataObjectDefinitionKey='ReviewCommitteeMember'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='ReviewCommitteeID' childProperty='ReviewCommitteeID' />
												</RelationshipProperties>
											</RelatedDataObject>
										</RelatedDataObjects>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnNotify'
								Type='cButton'
								Image='Send E-mail'>	
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ReviewerEmailSend'/>
										<Argument Type='DataObject' TypeKey='ReviewCommitteeID' AttributeName='ReviewCommitteeID' BaseValue='ReviewCommitteeID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
										<Argument Type='ModulePage' TypeKey='PageKey' BaseValue='ReturnPageKey=' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>	
						
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='SubCommitteeList' DataObjectDefinitionKey='ReviewCommittee' Updatable='False' GetData='False'>
			<Filters>
				<Argument PropertyKey='ParentReviewCommitteeID' Operator='NotEqual' Value='null'/>	
			</Filters>
			<Sort>
				<Argument PropertyKey='ReviewCommitteeDescription'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataListSubCommittee'
						Container='spnDataListSubCommittee'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='ReviewCommitteeDescription' ColumnHeader='Subcommittee' Width="25%">
							<Sortable>
								<Argument PropertyKey='ReviewCommitteeDescription'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ParentReviewCommittee.ReviewCommitteeDescription' ColumnHeader='Committee' Width="25%">
							<Sortable>
								<Argument PropertyKey='ReviewCommitteeDescription'>
									<RelatedProperty PropertyKey='ParentReviewCommittee'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Inactive' Format='ActiveInactive' ColumnHeader='Status' Width="10%">
							<Sortable>
								<Argument PropertyKey='Inactive'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Left'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit Committee'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='SubCommitteesEditor'/>
										<Argument Type='DataObject' TypeKey='ReviewCommitteeID' AttributeName='ReviewCommitteeID' BaseValue='ReviewCommitteeID='/>
										<Argument Type='DataObjectRelated' TypeKey='ParentReviewCommittee.ReviewCommitteeID' AttributeName='ParentReviewCommittee.ReviewCommitteeID' BaseValue='ParentRCID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnView'
								Type='cButton'
								Image='Edit Roles'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='CommitteeMember'/>
										<Argument Type='DataObject' TypeKey='ReviewCommitteeID' AttributeName='ReviewCommitteeID' BaseValue='ReviewCommitteeID='/>
										<Argument Type='DataObject' TypeKey='ParentReviewCommitteeID' AttributeName='ParentReviewCommitteeID' BaseValue='ParentRCID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='ReviewCommitteeID' AttributeName='ReviewCommitteeID'/>
										<RelatedDataObjects>
											<RelatedDataObject DataObjectDefinitionKey='ReviewCommitteeMember'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='ReviewCommitteeID' childProperty='ReviewCommitteeID' />
												</RelationshipProperties>
											</RelatedDataObject>
										</RelatedDataObjects>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnNotify'
								Type='cButton'
								Image='Send E-mail'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ReviewerEmailSend'/>
										<Argument Type='DataObject' TypeKey='ReviewCommitteeID' AttributeName='ReviewCommitteeID' BaseValue='ReviewCommitteeID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
										<Argument Type='ModulePage' TypeKey='PageKey' BaseValue='ReturnPageKey=' Value=''/>
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
<!-- End Embedded XML -->
