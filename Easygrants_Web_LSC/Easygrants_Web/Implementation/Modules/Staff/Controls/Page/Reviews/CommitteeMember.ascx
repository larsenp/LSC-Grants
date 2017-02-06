<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cCommitteeMember" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="CommitteeMember.ascx.vb"%>
<%@ Register Tagprefix='Core' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>


<br /><br />
<Core:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='' visible='true'
	AutoVDateType='Root' Key='CommitteeMember' LinkTitle='Committee Members' runat='server' />
	
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg" colspan='2'><b>Committee Members</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td width='50%'><b>Committee:</b>&nbsp;<span id='spnCommittee' runat="server"></span><span id='spnCommittee1' runat="server"></span></td><td id='tdSubCmt'><b>Subcommittee:</b>&nbsp;<span id='spnSubCommittee' runat="server"></span></td></tr>
</table>
<table id="Table2" border='0' cellspacing='0' cellpadding='6' runat='server' width='100%'>
	<tr>
		<td><span runat='server' id='spnList'></span></td>
	</tr>
	<tr>
		<td align='center'><span runat='server' id='spnCancel'/></td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCommitteeMemberList' DataObjectDefinitionKey='ReviewCommitteeMember'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='Person'/>
				</Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='Person'/>
				</Argument>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Committees'/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnList'
						DataObjectDefinitionKey='ReviewCommitteeMember'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='' ColumnHeader='Action' Width="20%">
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='CommitteeMembers'>
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey="EasylistAction" />
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnGo'
								Type='cButton'
								Image='Go'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='Execute_Action'>
									<Parameters>
										<Argument Type='Object' ObjectType='CoreControl'/>
										<Argument Type='Object' ObjectType='EventSource'/>
										<Argument Type='DataObject' TypeKey='ReviewCommitteeMemberID' AttributeName='ReviewCommitteeMemberID' />
										<ActionParameters>
											<Argument Type='DataObject' TypeKey='ReviewCommitteeID' AttributeName='ReviewCommitteeID'/>
											<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID'/>
										</ActionParameters>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Member' Width="20%">
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewerRole.Description' ColumnHeader='Role' Width="15%">
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='ReviewerRole'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Person.PersonPrimaryAffiliation.Organization.CommonOrganizationName' ColumnHeader='~~Organization~~' Width="20%">
							<Control ID='ctlLink'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OrganizationContact'/>
										<Argument Type='DataObjectRelated' TypeKey='Person.PersonPrimaryAffiliation.OrganizationID' AttributeName='OrganizationID' BaseValue='OrganizationID='/>
									</Parameters>
								</Action>
							</Control>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='Person.PersonPrimaryAffiliation.Organization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='StartDate' Format='M/d/yyyy' ColumnHeader='Start' Width="10%">
							<Sortable>
								<Argument PropertyKey='StartDate' />
								
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='EndDate' Format='M/d/yyyy' ColumnHeader='End' Width="10%">
							<Sortable>
								<Argument PropertyKey='EndDate'>
									<RelatedProperty PropertyKey='Person.PersonReviewer'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Inactive' Format='ActiveInactive' ColumnHeader='Status' NullDisplay='Active' Width="10%">
							<Sortable>
								<Argument PropertyKey='Inactive'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='3' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='CommitteeMemberEditor'/>
										<Argument Type='DataObject' TypeKey='ReviewCommitteeMemberID' AttributeName='ReviewCommitteeMemberID' BaseValue='ReviewCommitteeMemberID='/>
										<Argument Type='DataObject' TypeKey='ReviewCommitteeID' AttributeName='ReviewCommitteeID' BaseValue='ReviewCommitteeID='/>
										<Argument Type='QueryString' TypeKey='ParentRCID' BaseValue='ParentRCID='/>
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' BaseValue='PersonID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' DataAlign='Left'>
							<Parameters>
								<Argument Value='3' ValueKey='RevStageWftaNotActive.WfTaskStatusID' DisplayValue='Control'>
									<Control ID='btnDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
											<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
												<Parameters>
													<Argument Type='DataObject' TypeKey='ReviewCommitteeMemberID' AttributeName='ReviewCommitteeMemberID'/>
												</Parameters>
											</Action>	
									</Control>
								</Argument>
								<Argument Value='' ValueKey='RevStageWftaNotActive.WfTaskStatusID' DisplayValue='Control'>
									<Control ID='btnDelete2'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
											<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
												<Parameters>
													<Argument Type='DataObject' TypeKey='ReviewCommitteeMemberID' AttributeName='ReviewCommitteeMemberID'/>
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
		
		<DataObject Key='ReviewCommittee' DataObjectDefinitionKey='ReviewCommittee'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewCommitteeDescription'>
						<Control ID='spnCommittee' Type='HtmlGenericControl' />
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ReviewCommitteeDescription'>
						<Control ID='spnSubCommittee' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReviewSubCommittee' DataObjectDefinitionKey='ReviewCommittee'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ParentRCID' PropertyKey='ReviewCommitteeID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewCommitteeDescription'>
						<Control ID='spnCommittee1' Type='HtmlGenericControl' />
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
