<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cSubCommitteeContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="SubCommitteeContent.ascx.vb" %>

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
		<DataObject Key='Base' DataObjectDefinitionKey='' >
			<DisplayProperties>	
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
		
		<DataObject Key='SubCommitteeList' DataObjectDefinitionKey='ReviewCommittee'>
			<Filters>
				<Argument PropertyKey='ParentReviewCommitteeID' Operator='GreaterThan' Value='0'/>	
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
						<DisplayProperty PropertyKey='ReviewCommitteeDescription' ColumnHeader='Subcommittee' Width="20%">
							<Sortable>
								<Argument PropertyKey='ReviewCommitteeDescription'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ParentReviewCommittee.ReviewCommitteeDescription' ColumnHeader='Committee' Width="20%">
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
						<DisplayProperty PropertyKey='ReviewCycleCommittee.ReviewCycle.Name' ColumnHeader='Cycle' Width="20%">
							<Sortable>
								<Argument PropertyKey='Name'>
									<RelatedProperty PropertyKey='ReviewCycleCommittee.ReviewCycle' />
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
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
