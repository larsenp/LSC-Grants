<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cCommitteeContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='SubCommitteeContent' src='SubCommitteeContent.ascx' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br />
<br />

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
</table>
<Easygrants:SubCommitteeContent id='ctlSubCommitteeContent' runat='server' />
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' >
			<DisplayProperties>	
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
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReviewCommitteeList' DataObjectDefinitionKey='ReviewCommittee'>
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
						<DisplayProperty PropertyKey='ReviewCycleCommittee.ReviewCycle.Program.ProgramDisplayName' ColumnHeader='ProgramName' Width="20%" ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='ProgramDisplayName'>
									<RelatedProperty PropertyKey='ReviewCycleCommittee.ReviewCycle.Program' />
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
