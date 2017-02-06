<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Assigned Review Committees</b></td>
	</tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	
	<!-- <tr><td>
	<span runat='server' id='spnReviewCommLink'/></td></tr> -->
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='RCMList' DataObjectDefinitionKey='ReviewCommitteeMember'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='PersonID' 
					PropertyKey='PersonID' 
					Value='' 
					Bool=''>
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey='ReviewCommitteeDescription'>	
					<RelatedProperty PropertyKey='ReviewCommittee'/>
				</Argument>
			</Sort>	
			
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ReviewCommitteesEditor'/>
									<Argument Type='QueryString' TypeKey='PersonID' BaseValue='PersonID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='ReviewCommitteeMember'
						SeparatorWidth='2'
						MaxPerPage='10'
						NoRecordMessage='This person contact has not been affiliated with any review committees.'>
						
						<DisplayProperty PropertyKey='ReviewCommittee.ReviewCommitteeDescription' ColumnHeader='Review Committees' Width='20%'>
							<Sortable>
								<Argument PropertyKey='ReviewCommitteeDescription'>
									<RelatedProperty PropertyKey='ReviewCommittee'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewerRole.Description' ColumnHeader='Role' Width='5%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='ReviewerRole'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='Center' DataAlign='Center' Width='75%'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Remove'
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
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<!--<DisplayProperty PropertyKey=''>
					<Control ID='ctlReviewCommLink'
						Container='spnReviewCommLink'
						Type='cLink'
						Caption='Click here to go to Review Committees Page'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Committees'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	 -->	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
	