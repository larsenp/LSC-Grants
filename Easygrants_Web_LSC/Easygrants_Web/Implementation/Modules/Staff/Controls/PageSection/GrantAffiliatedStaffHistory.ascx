<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Affiliated Staff History</b></td>
	</tr>
	<tr><td  >&nbsp;</td></tr>
	<tr>
		
		<td><span runat='server' id='spnGranteeProjectStaffAffiliationHistory'/></td>
	</tr>	
</table>

<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
		<DataObject Key='GranteeProjectStaffAffiliationHistory' DataObjectDefinitionKey='GranteeProjectStaffAffiliationHistory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='CreateDate' Direction='Descending'/>
			</Sort>	
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlGranteeProjectStaffAffiliationHistory'
						Container='spnGranteeProjectStaffAffiliationHistory'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectStaffAffiliationHistory'
						SeparatorWidth='2'
						NoRecordMessage='No Staff Affiliation history.'						
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='StaffPersonContact.FirstNameLastName' Width='30%' ColumnHeader='Previous Staff Contact' NullDisplay='Not Applicable'>
							<Control ID='lnkPerson'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PersonContact'/>
										<Argument Type='DataObject' TypeKey='StaffPersonID' AttributeName='PersonID' BaseValue='PersonID='/>
									</Parameters>
								</Action>
							</Control>
							<Sortable>
								   <Argument PropertyKey='FirstName'>
								        <RelatedProperty PropertyKey='StaffPersonContact'/>
								     </Argument> 
								     <Argument PropertyKey='LastName'>
								        <RelatedProperty PropertyKey='StaffPersonContact'/>
								     </Argument> 
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProjectAffilType.Description' Width='20%' ColumnHeader='Type'>
							    <Sortable>
								   <Argument PropertyKey='Description'>
								        <RelatedProperty PropertyKey='GranteeProjectAffilType'/>
								     </Argument> 
								</Sortable>
						    </DisplayProperty>
						<DisplayProperty PropertyKey='CreatedByUser.Person.FirstNameLastName' Width='25%' ColumnHeader='Staff Contact Changed By' NullDisplay='Not Applicable'>
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
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CreateDate' Width='25%' ColumnHeader='Staff Contact Changed Date' Format='M/d/yyyy' NullDisplay='Not Applicable'>
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
