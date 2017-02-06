<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Application.Controls.PageSection.cGrantPrimaryContactList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Applicant/Grantee Contacts</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAdd'/> &nbsp;&nbsp;&nbsp;<b>Grantee Type</b>&nbsp;<%=kDenoteRequiredField%>&nbsp;&nbsp;&nbsp;<span runat='server' id='spnGranteeType'></span>			          
		</td>		
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>				
			</Filters>
		</DataObject>
		<DataObject Key='GrantPrimaryContactListGranteeProjectPI' DataObjectDefinitionKey='GranteeProjectPI'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument Type='' TypeKey='' PropertyKey='PITypeID' Value='1'/>
			</Filters>			
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGranteeType'
						Container='spnGranteeType'
						Type='cDropDown'
						DataObjectDefinitionKey='EntityType'
						StoredValue='EntityTypeID'
						DisplayNone='False'
						DisplayValue='Description'>						
						<Sort>
							<Argument PropertyKey='Description'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAdd'
						Container='spnAdd'
						Type='cButton'
						Image='Add'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='btnAdd_Redirect'>
							<Parameters>								
								<Argument Type='' TypeKey='' AttributeName='' Value='GranteeProjectPIID=0'/>
								<Argument Type='' TypeKey='' AttributeName='' Value='PersonID='/>
								<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>	
								<Argument Type='Control' TypeKey='ctlGranteeType' ControlPropertyKey='SelectedValue' Value=''  BaseValue='EntityTypeID='/>
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
						    <DisplayProperty PropertyKey='GranteeProjectCollaboratingContactType.Description' Width='10%'  ColumnHeader='Role'>
						        <Sortable>
								    <Argument PropertyKey='Description'>
								         <RelatedProperty PropertyKey='GranteeProjectCollaboratingContactType'/>
								     </Argument> 
								</Sortable>
						    </DisplayProperty>							
							<DisplayProperty PropertyKey='Person.LastNameFirstName'  Width='25%' ColumnHeader='Person Name'>
							   <Control ID='lnkPerson'
								Type='cLink'>
								    <Action
									    PostBack='True'
									    Object='EventController'
									    Method='EventController_NavigateToModulePageKey'>
									    <Parameters>
										    <Argument AttributeName='PageKey' Value='PersonContact'/>
										    <Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' BaseValue='PersonID='/>
										    
									    </Parameters>
								    </Action>
							    </Control>	
							    <Sortable>
								   <Argument PropertyKey='LastName'>
									    <RelatedProperty PropertyKey='Person'/>
								   </Argument>
									<Argument PropertyKey='FirstName'>
										<RelatedProperty PropertyKey='Person'/>
									</Argument>								
								</Sortable>
						    </DisplayProperty>
							<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName' Width='20%' ColumnHeader='~~Organization~~ Name'>
								<Control ID='ctlLink1' Container='spnPrimaryOrganization'
									Type='cLink'>
									<Action
										PostBack='True'
										Object='EventController'
										Method='EventController_NavigateToModulePageKey'>
										<Parameters>
										   <Argument AttributeName='PageKey' Value='OrganizationContact'/>
										   <Argument Type='DataObjectRelated' TypeKey='GranteeProject.PrimaryOrganizationID' AttributeName='OrganizationID' BaseValue='OrganizationID='/>
										</Parameters>
									</Action>
								</Control>
						        <Sortable>
								    <Argument PropertyKey='CommonOrganizationName'>
								         <RelatedProperty PropertyKey='GranteeProject.PrimaryOrganization'/>
								     </Argument> 
								</Sortable>
						    </DisplayProperty>
						     <DisplayProperty PropertyKey='EntityType.Description' Width='10%'  ColumnHeader='Grantee Type'>
						        <Sortable>
								    <Argument PropertyKey='Description'>
								         <RelatedProperty PropertyKey='EntityType'/>
								     </Argument> 
								</Sortable>
						    </DisplayProperty>		
						    <DisplayProperty PropertyKey='IsPrimary' Width='20%'  ColumnHeader='Primary' />
						    <DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' Width='1%' HeaderAlign='Center' DataAlign='Center'>
								<Control ID='btnEdit'
									Type='cButton'
									Image='Edit'>
									<Action
										PostBack='True'
										Object='DataPresenter'
										Method='btnEdit_Redirect'>
										<Parameters>											
											<Argument Type='DataObject' TypeKey='GranteeProjectPIID' AttributeName='GranteeProjectPIID' BaseValue='GranteeProjectPIID='/>
											<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' BaseValue='PersonID='/>									
											<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>	
											<Argument Type='DataObject' TypeKey='EntityTypeID' AttributeName='EntityTypeID' BaseValue='EntityTypeID='/>													
											<Argument Type='DataObject' TypeKey='OrganizationID' AttributeName='OrganizationID' BaseValue='OrganizationID='/>											
											<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
										</Parameters>
									</Action>
								</Control>
							</DisplayProperty>
							<DisplayProperty PropertyKey='' HeaderAlign='Left' DataAlign='Left' Width='34%'>
								<Parameters>																
									<Argument Value='False' ValueKey='IsPrimary' DisplayValue='Control' >
										<Control ID='btnDelete'
											Type='cButton'
											Image='Delete'
											Confirmation='Are you sure you want to delete this item?'>
												<Action
												PostBack='True'
												Object='EventController'
												Method='EventController_Delete'>
													<Parameters>
														<Argument Type='DataObject' TypeKey='GranteeProjectPIID' AttributeName='GranteeProjectPIID'/>
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
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->


