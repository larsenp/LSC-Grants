<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<!-- Control Label (for  Address information) -->

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Address</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>


		<DataObject Key='Phone' DataObjectDefinitionKey='Phone'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='EntityID' 
					PropertyKey='EntityID' 
					Value='' 
					Bool=''/>
				<Argument Type='Data' 
					TypeKey='PhoneTypeID' 
					PropertyKey='PhoneTypeID' 
					Value='1' 
					Bool='And'/>
				</Filters>
				<DisplayProperties>	
				</DisplayProperties>	
		</DataObject>		
		
		<DataObject Key='Fax' DataObjectDefinitionKey='Phone'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='EntityID' 
					PropertyKey='EntityID' 
					Value='' 
					Bool=''/>
				<Argument Type='Data' 
					TypeKey='PhoneTypeID' 
					PropertyKey='PhoneTypeID' 
					Value='4' 
					Bool='And'/>
			</Filters>
				<DisplayProperties>	
				</DisplayProperties>	
		</DataObject>
				
		<DataObject Key='AddressList' DataObjectDefinitionKey='Address'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='EntityID' 
					PropertyKey='EntityID' 
					Value='' 
					Bool=''/>
				<Argument Type='DataPresenter' 
					TypeKey='EntityTypeID' 
					PropertyKey='EntityTypeID' 
					Value='' 
					Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Address1' />	
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
									<Argument AttributeName='PageKey' Value='AddressInfoEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='AddressID=0'/>
									<Argument Type='DataPresenter' TypeKey='EntityID' AttributeName='' BaseValue='EntityID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Address'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Address1' ColumnHeader='Address 1'/>
						<DisplayProperty PropertyKey='City' ColumnHeader='City'/>
						<DisplayProperty PropertyKey='State.Description' ColumnHeader='State'/>
						<DisplayProperty PropertyKey='Country.CountryDesc' ColumnHeader='Country'/>
						<DisplayProperty PropertyKey='EffectiveStartDate' ColumnHeader='Start Date' Format='MM/dd/yyyy' />
						<DisplayProperty PropertyKey='EffectiveEndDate' ColumnHeader='End Date' Format='MM/dd/yyyy' />
						<DisplayProperty PropertyKey='IsPrimary' Format='YesNo' ColumnHeader='Primary'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='AddressInfoEditor'/>
										<Argument Type='DataObject' TypeKey='AddressID' AttributeName='AddressID' BaseValue='AddressID='/>
										<Argument Type='DataPresenter' TypeKey='EntityID' AttributeName='EntityID' BaseValue='EntityID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='false'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='AddressID' AttributeName='AddressID'/>
											<RelatedDataObjects>
												<RelatedDataObject DataObjectDefinitionKey='Phone'>
													<RelationshipProperties>
														<RelationshipProperty parentProperty='AddressID' childProperty='AddressID' />
														<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
													</RelationshipProperties>
												</RelatedDataObject>
											</RelatedDataObjects>
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
	