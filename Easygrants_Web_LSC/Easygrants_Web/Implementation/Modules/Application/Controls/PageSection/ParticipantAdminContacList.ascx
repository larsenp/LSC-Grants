<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Administrative Contacts</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAdd' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
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
		<PageContent/>
		<DataObject Key='ParticipantOtherKeyPersonnelGranteeProjectAdditionalContact' DataObjectDefinitionKey='GranteeProjectAdditionalContact'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='GrantContactCategoryID' Value='2'/>
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
								<Argument AttributeName='PageKey' Value='ParticipantAdministrativeContactsEditor'/>
								<Argument Type='' TypeKey='' AttributeName='' Value='GranteeProjectAdditionalContactID=0'/>
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
						<DisplayProperty PropertyKey='Organization.CommonOrganizationName' Width='15%'  ColumnHeader='~~Organization~~'>
							<Sortable>
							    <Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='Organization'/>
							    </Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GrantContactType.Description' Width='10%' ColumnHeader='Role'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='GrantContactType'/>
								</Argument>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='LastNameFirstName' Width='15%' ColumnHeader='Name'>
							<Sortable>
							   <Argument PropertyKey='LastNameFirstName'/>								
							</Sortable>
					    </DisplayProperty>					    
					    <DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' Width='60%' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ParticipantAdministrativeContactsEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectAdditionalContactID' AttributeName='GranteeProjectAdditionalContactID' BaseValue='GranteeProjectAdditionalContactID='/>								
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







