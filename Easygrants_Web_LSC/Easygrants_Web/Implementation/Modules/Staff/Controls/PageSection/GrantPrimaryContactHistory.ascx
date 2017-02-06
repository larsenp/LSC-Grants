<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Applicant/Grantee Primary Contact History</b></td>
	</tr>
	<tr><td  >&nbsp;</td></tr>
	<tr>
		
		<td><span runat='server' id='spnGranteeProjectHistory'/></td>
	</tr>	
</table>

<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
		<DataObject Key='GranteeProjectHistory' DataObjectDefinitionKey='GranteeProjectHistory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='CreateDate' Direction='Descending'/>
			</Sort>	
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlGranteeProjectHistory'
						Container='spnGranteeProjectHistory'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectHistory'
						SeparatorWidth='2'
						NoRecordMessage='No primary contact history.'						
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName' Width='25%' ColumnHeader='Previous Primary Contact' NullDisplay='Not Applicable'>
							<Control ID='lnkPerson'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PersonContact'/>
										<Argument Type='DataObject' TypeKey='PrimaryPersonID' AttributeName='PersonID' BaseValue='PersonID='/>
									</Parameters>
								</Action>
							</Control>
							 <Sortable>
								   <Argument PropertyKey='LastName'>
									    <RelatedProperty PropertyKey='PrimaryPerson'/>
								   </Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='PrimaryPerson'/>
								</Argument>								
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName' Width='25%' ColumnHeader='~~Organization~~ Name'>
								<Control ID='ctlLink1' Container='spnPrimaryOrganization'
									Type='cLink'>
									<Action
										PostBack='True'
										Object='EventController'
										Method='EventController_NavigateToModulePageKey'>
										<Parameters>
										   <Argument AttributeName='PageKey' Value='OrganizationContact'/>
										   <Argument Type='DataObject' TypeKey='PrimaryOrganizationID' AttributeName='PrimaryOrganizationID' BaseValue='OrganizationID='/>
										</Parameters>
									</Action>
								</Control>
						        <Sortable>
								    <Argument PropertyKey='CommonOrganizationName'>
								         <RelatedProperty PropertyKey='PrimaryOrganization'/>
								     </Argument> 
								</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='EntityType.Description' Width='15%'  ColumnHeader='Grantee Type'>
						        <Sortable>
								    <Argument PropertyKey='Description'>
								         <RelatedProperty PropertyKey='EntityType'/>
								     </Argument> 
								</Sortable>
						    </DisplayProperty>
						<DisplayProperty PropertyKey='CreatedByUser.Person.LastNameFirstName' Width='25%' ColumnHeader='Primary Contact Changed By' NullDisplay='Not Applicable'>
						<Control ID='lnkPerson1'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PersonContact'/>
										<Argument Type='DataObject' TypeKey='CreateUser' AttributeName='UserID' BaseValue='PersonID='/>
									</Parameters>
								</Action>
							</Control>
							 <Sortable>
								   <Argument PropertyKey='LastName'>
									    <RelatedProperty PropertyKey='CreatedByUser.Person'/>
								   </Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='CreatedByUser.Person'/>
								</Argument>								
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CreateDate' Width='10%' ColumnHeader='Modified Date' Format='M/d/yyyy' NullDisplay='Not Applicable'>
						    <Sortable>
								   <Argument PropertyKey='CreateDate'/> 								        
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
</span>
