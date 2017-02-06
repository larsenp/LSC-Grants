<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Third Party Contacts</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='PersonRelationshipList' DataObjectDefinitionKey='PersonRelationship'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='WfTaskRole'>	
					<RelatedProperty PropertyKey='RelatedPersonRole'/>
				</Argument>
			</Sort>	
			
			<DisplayProperties>
				
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>
									   			
                    
						    <DisplayProperty PropertyKey='RelatedPersonRole.WfTaskRole' Width='20%'  ColumnHeader='Role'>
						        <Sortable>
								    <Argument PropertyKey='WfTaskRole'>
								         <RelatedProperty PropertyKey='RelatedPersonRole'/>
								     </Argument> 
								</Sortable>
						    </DisplayProperty>							
							<DisplayProperty PropertyKey='RelatedPerson.LastNameFirstName'  Width='20%' ColumnHeader='Person Name'>
							   <Control ID='lnkPerson'
								Type='cLink'>
								    <Action
									    PostBack='True'
									    Object='EventController'
									    Method='EventController_NavigateToModulePageKey'>
									    <Parameters>
										    <Argument AttributeName='PageKey' Value='PersonContact'/>
										    <Argument Type='DataObject' TypeKey='RelatedPersonID' AttributeName='RelatedPersonID' BaseValue='PersonID='/>
										    
									    </Parameters>
								    </Action>
							    </Control>	
							    <Sortable>
								   <Argument PropertyKey='LastName'>
									    <RelatedProperty PropertyKey='RelatedPerson'/>
								   </Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='RelatedPerson'/>
								</Argument>								
								</Sortable>
						    </DisplayProperty>
							<DisplayProperty PropertyKey='RelatedPerson.PersonPrimaryAffiliation.Organization.CommonOrganizationName' Width='60%' ColumnHeader='~~Organization~~ Name'>
							<Control ID='ctlLink1' Container='spnPrimaryOrganization'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
									   <Argument AttributeName='PageKey' Value='OrganizationContact'/>
									   <Argument Type='DataObjectRelated' TypeKey='RelatedPerson.PersonPrimaryAffiliation.Organization.OrganizationID' AttributeName='RelatePersonDisplayOrganizationID' BaseValue='OrganizationID='/>
									</Parameters>
								</Action>
							</Control>
						        <Sortable>
								    <Argument PropertyKey='CommonOrganizationName'>
								         <RelatedProperty PropertyKey='RelatePersonDisplayOrganization'/>
								     </Argument> 
								</Sortable>
						    </DisplayProperty>	
						   </Control>
						  </DisplayProperty> 
			    
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->


