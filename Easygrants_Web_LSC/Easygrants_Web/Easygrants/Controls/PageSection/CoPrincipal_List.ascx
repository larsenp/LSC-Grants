<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server'>	
	<tr align='center'>
		<td><span runat='server' id='spnSave_and_Continue'/></td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectPI' DataObjectDefinitionKey='GranteeProjectPI'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
				<Argument Type='Data' 
					TypeKey='' 
					PropertyKey='PITypeID' 
					Value='2' 
					Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'/>
				<Argument PropertyKey='FirstName' />
			    <Argument PropertyKey='MiddleName' />
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
									<Argument AttributeName='PageKey' Value='GranteeProjectCoPIEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='GranteeProjectPIID=0'/>
									<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectPI'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<!--
						<DisplayProperty PropertyKey='IsPrimary' ColumnHeader='Primary'/>-->				
						<DisplayProperty PropertyKey='GranteeProjectAffilType.Abbr' ColumnHeader='Role' Width='20%'>
						    <Sortable>
						        <Argument PropertyKey='Abbr'>
						            <RelatedProperty PropertyKey='GranteeProjectAffilType' />
						        </Argument>
						    </Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='FirstNameLastName' ColumnHeader='Name' Width='20%'>
						    <Sortable>
						        <Argument PropertyKey='LastName' />
						        <Argument PropertyKey='FirstName' />
						        <Argument PropertyKey='MiddleName' />
						    </Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Organization.CommonOrganizationName' ColumnHeader='~~Organization~~' Width='30%' ConfigurableHeader='True'>
						    <Sortable>
						        <Argument PropertyKey='CommonOrganizationName'>
						            <RelatedProperty PropertyKey='Organization' />
						        </Argument>
						    </Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GranteeProjectCoPIEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectPIID' AttributeName='GranteeProjectPIID' BaseValue='GranteeProjectPIID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
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
											<Argument Type='DataObject' TypeKey='GranteeProjectPIID' AttributeName='GranteeProjectPIID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
				
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Continue' GoToNextPage='True'>						
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
<!-- End Embedded XML -->
</span>
	