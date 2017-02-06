<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Affiliated Staff</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAdd' visible='true'></span>
		</td>
	</tr>
	
	<tr>
		<td>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>
<br/>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectStaffAffiliationList' DataObjectDefinitionKey='GranteeProjectStaffAffiliation'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='IsPrimary' Direction='Descending' />	
			</Sort>
			
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAdd'
						Container='spnAdd'
						Type='cButton'
						Image='Add'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='GrantAffiliatedStaffEditor'/>
								<Argument Type='QueryString' TypeKey='' BaseValue='GranteeProjectStaffAffiliationID=0'/>								
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>																	
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>
									   			
                    
						    <DisplayProperty PropertyKey='IsPrimary' Format='YesNo' Width='10%' ColumnHeader='Primary'>
						        <Sortable>
								    <Argument PropertyKey='IsPrimary'/>
								</Sortable>
						    </DisplayProperty>
							<DisplayProperty PropertyKey='GranteeProjectAffilType.Description' Width='20%' ColumnHeader='Type'>
							    <Sortable>
								   <Argument PropertyKey='Description'>
								        <RelatedProperty PropertyKey='GranteeProjectAffilType'/>
								     </Argument> 
								</Sortable>
						    </DisplayProperty>
							<DisplayProperty PropertyKey='StaffPersonContact.LastNameFirstNameMiddleName' Width='25%' ColumnHeader='Staff Name'>
							   <Control ID='lnkPerson'
								Type='cLink'>
								    <Action
									    PostBack='True'
									    Object='EventController'
									    Method='EventController_NavigateToModulePageKey'>
									    <Parameters>
										    <Argument AttributeName='PageKey' Value='PersonContact'/>
										    <Argument Type='DataObject' TypeKey='StaffPersonID' AttributeName='StaffPersonID' BaseValue='PersonID='/>
										    
									    </Parameters>
								    </Action>
							    </Control>	
							    <Sortable>
								   <Argument PropertyKey='LastName'>
									    <RelatedProperty PropertyKey='StaffPersonContact'/>
								   </Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='StaffPersonContact'/>
								</Argument>								
								</Sortable>
						    </DisplayProperty>
							<DisplayProperty PropertyKey='StaffPersonContact.PersonPrimaryAffiliation.Title' Width='20%' ColumnHeader='Job Title'>
							    <Sortable>
								    <Argument PropertyKey='Title'>
								        <RelatedProperty PropertyKey='StaffPersonContact.PersonPrimaryAffiliation'/>
								     </Argument>   
								</Sortable>
						    </DisplayProperty>
						    <DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center' Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantAffiliatedStaffEditor'/>
								<Argument Type='DataObject' TypeKey='GranteeProjectStaffAffiliationID' AttributeName='GranteeProjectStaffAffiliationID' BaseValue='GranteeProjectStaffAffiliationID='/>								
								<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>																	
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
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
											<Argument Type='DataObject' TypeKey='GranteeProjectStaffAffiliationID' AttributeName='GranteeProjectStaffAffiliationID'/>
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


