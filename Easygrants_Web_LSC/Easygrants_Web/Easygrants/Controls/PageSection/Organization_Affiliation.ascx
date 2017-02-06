<%@ Control Language="vb" AutoEventWireup="True" Inherits="Easygrants_Web.Controls.PageSection.cOrganization_Affiliation" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Affiliated <%=GetLabel("Organization")%>s</b></td>
	</tr>	
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' ID="Table2" width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>
</table>


<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='EntityAffiliationMainAndAffil' DataObjectDefinitionKey='EntityAffiliationMainAndAffil'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='EntityID' 
					PropertyKey='MainEntityID' 
					Value='' 
					Bool=''/>
				<Argument Type='DataPresenter' 
					TypeKey='EntityTypeID' 
					PropertyKey='EntityTypeID' 
					Value='' 
					Bool='And'/>
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
									<Argument AttributeName='PageKey' Value='OrgOrgAffiliationEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='AffilEntityID=0'/>
									<Argument Type='DataPresenter' TypeKey='EntityID' AttributeName='' BaseValue='EntityID='/>
									<Argument Type='' TypeKey='' AttributeName='' Value='EntityTypeID=2'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='EntityAffiliationMainAndAffil'
						SeparatorWidth='2'
						MaxPerPage='10'>
						
						<DisplayProperty PropertyKey='MainEntityAffiliationType.Description' ColumnHeader='Parent ~~Organization~~ Type' Width='25%' />
						<DisplayProperty PropertyKey='AffilOrganization.CommonOrganizationName' ColumnHeader='Affiliated ~~Organization~~' Width='25%' >
							<Control ID='ctlLinkOrganizationName'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OrganizationContact'/>
										<Argument Type='DataObjectRelated' TypeKey='AffilOrganization.OrganizationID' AttributeName='OrganizationID' BaseValue='OrganizationID='/>
									</Parameters>
								</Action>
							</Control>
							
						</DisplayProperty>
						<DisplayProperty PropertyKey='AffilEntityAffiliationType.Description' ColumnHeader='Affiliated ~~Organization~~ Type' Width='22%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center'  DataAlign='Center' >
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OrgOrgAffiliationEditor'/>
										<Argument Type='DataObject' TypeKey='MainEntityAffiliationID' AttributeName='MainEntityAffiliationID' BaseValue='AffilEntityID='/>
										<Argument Type='DataPresenter' TypeKey='EntityID' AttributeName='MainEntityID' BaseValue='EntityID='/>
										<Argument Type='' TypeKey='' AttributeName='' Value='EntityTypeID=2'/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''  NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DeleteEntityAffil'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='MainEntityAffiliationID' AttributeName='MainEntityAffiliationID'/>
										<Argument Type='DataObject' TypeKey='AffilEntityAffiliationID' AttributeName='AffilEntityAffiliationID'/>
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