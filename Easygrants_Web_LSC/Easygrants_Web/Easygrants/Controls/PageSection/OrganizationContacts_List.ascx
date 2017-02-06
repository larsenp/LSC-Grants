<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b><%=GetLabel("Organization")%> Contacts</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
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
<!--
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Other Organization Contacts</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd2'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList2'></span>	
		</td>
	</tr>
</table>
-->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectPersonAffiliation' DataObjectDefinitionKey='GranteeProjectPersonAffiliation'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
			</Filters>
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
									<Argument AttributeName='PageKey' Value='OrganizationContactsEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='GranteeProjectPersonAffiliationID=0'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='IsPrimary=True'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectPersonAffiliation'
						SeparatorWidth='2'
						MaxPerPage='10'>
						
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Person'/>
						<DisplayProperty PropertyKey='GranteeMemberRole.Abbr' ColumnHeader='Role'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OrganizationContactsEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectPersonAffiliationID' 
											AttributeName='GranteeProjectPersonAffiliationID' BaseValue='GranteeProjectPersonAffiliationID='/>
										<Argument Type='' TypeKey='' AttributeName='' Value='IsPrimary=True'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
										PostBack='True'
										Object='EventController'
										Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='GranteeProjectPersonAffiliationID' AttributeName='GranteeProjectPersonAffiliationID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
	