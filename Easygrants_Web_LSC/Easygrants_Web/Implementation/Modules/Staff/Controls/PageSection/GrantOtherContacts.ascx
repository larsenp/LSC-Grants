<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Other Related Person Contacts</b></td>
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
		<DataObject Key='GrantOtherContactsGranteeProjectAdditionalContact' DataObjectDefinitionKey='GranteeProjectAdditionalContact'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>				
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
								<Argument AttributeName='PageKey' Value='GrantOtherContactsEditor'/>
								<Argument Type='' TypeKey='' AttributeName='' Value='GranteeProjectAdditionalContactID=0'/>								
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
						<DisplayProperty PropertyKey='GrantContactType.Description' Width='20%' ColumnHeader='Role'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='GrantContactType'/>
								</Argument>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='OtherStaff.LastNameFirstName' Width='20%' ColumnHeader='Person Name'>
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
									    <RelatedProperty PropertyKey='OtherStaff'/>
								   </Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='OtherStaff'/>
								</Argument>								
							</Sortable>
					    </DisplayProperty>
						<DisplayProperty PropertyKey='OtherStaff.PersonPrimaryAffiliation.Organization.CommonOrganizationName' Width='20%'  ColumnHeader='~~Organization~~ Name'>
							<Control ID='ctlLink1' Container='spnPrimaryOrganization'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
									   <Argument AttributeName='PageKey' Value='OrganizationContact'/>
									   <Argument Type='DataObjectRelated' TypeKey='OtherStaff.PersonPrimaryAffiliation.Organization.OrganizationID' AttributeName='RelatePersonDisplayOrganizationID' BaseValue='OrganizationID='/>
									</Parameters>
								</Action>
							</Control>
							<Sortable>
							    <Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='OtherStaff.PersonPrimaryAffiliation.Organization'/>
							    </Argument>
							</Sortable>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='GrantContactCategory.Description' Width='20%'  ColumnHeader='Contact Category'>
							<Sortable>
							    <Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='GrantContactCategory'/>
							    </Argument>
							</Sortable>
						</DisplayProperty>					    
					    <DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' Width='20%' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantOtherContactsEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectAdditionalContactID' AttributeName='GranteeProjectAdditionalContactID' BaseValue='GranteeProjectAdditionalContactID='/>								
										<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>											
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						 <DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnUploads'
								Type='cButton'
								Image='Uploads'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantOtherContactsUploads'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectAdditionalContactID' AttributeName='GranteeProjectAdditionalContactID' BaseValue='GranteeProjectAdditionalContactID='/>								
										<Argument Type='DataObject' TypeKey='GrantContactCategoryID' AttributeName='GeneralUploadCategoryID' BaseValue='GeneralUploadCategoryID='/>								
										<Argument Type='' TypeKey='' AttributeName='' Value='GeneralUploadCategoryTypeID=1'/>								
										<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>											
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
											<Argument Type='DataObject' TypeKey='GranteeProjectAdditionalContactID' AttributeName='GranteeProjectAdditionalContactID'/>
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







