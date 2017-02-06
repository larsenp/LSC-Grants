<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Other Related <%=GetLabel("Organization")%> Contacts</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAdd' visible='true'></span>
		</td>
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
		<DataObject Key='GranteeProjectOrganizationAffiliation' DataObjectDefinitionKey='GranteeProjectOrganizationAffiliation'>
			<Filters>			
               <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
            </Filters>			
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
								<Argument AttributeName='PageKey' Value='GrantOrganizationContactsEditor'/>
								<Argument Type='QueryString' TypeKey='' BaseValue='GranteeProjectOrganizationAffiliationID=0'/>								
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
					    <DisplayProperty PropertyKey='OrganizationRole.Description' Width='15%' ColumnHeader='Role'>
					        <Sortable>
							    <Argument PropertyKey='Description'>
							        <RelatedProperty PropertyKey='OrganizationRole'/>
							     </Argument> 
							</Sortable>
					    </DisplayProperty>
						<DisplayProperty PropertyKey='AffiliationDescription' Width='15%' ColumnHeader='Description'>
						    <Sortable>
							   <Argument PropertyKey='AffiliationDescription'/>								        
							</Sortable>
					    </DisplayProperty>
						<DisplayProperty PropertyKey='Organization.CommonOrganizationName' Width='45%' ColumnHeader='~~Organization~~ Name'>
						   <Control ID='lnkPerson'
							Type='cLink'>
							    <Action
								    PostBack='True'
								    Object='EventController'
								    Method='EventController_NavigateToModulePageKey'>
								    <Parameters>
									    <Argument AttributeName='PageKey' Value='OrganizationContact'/>
									    <Argument Type='DataObject' TypeKey='OrganizationID' AttributeName='OrganizationID' BaseValue='OrganizationID='/>
								    </Parameters>
							    </Action>
						    </Control>	
						    <Sortable>
							   <Argument PropertyKey='CommonOrganizationName'>
								    <RelatedProperty PropertyKey='Organization'/>
							   </Argument>																
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='Center' DataAlign='Center' Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantOrganizationContactsEditor'/>
								<Argument Type='DataObject' TypeKey='GranteeProjectOrganizationAffiliationID' AttributeName='GranteeProjectOrganizationAffiliationID' BaseValue='GranteeProjectOrganizationAffiliationID='/>								
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>																	
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
											<Argument Type='DataObject' TypeKey='GranteeProjectOrganizationAffiliationID' AttributeName='GranteeProjectOrganizationAffiliationID'/>
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


