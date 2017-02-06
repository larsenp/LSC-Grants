<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br/>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>Links</b>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='80%'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>		
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnLinksList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='GranteeProjectLink' DataObjectDefinitionKey='GranteeProjectLink'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Description' />	
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
									<Argument AttributeName='PageKey' Value='GrantLinkEditor'/>
									<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='' TypeKey='GranteeProjectLinkID' AttributeName='GranteeProjectLinkID' Value='GranteeProjectLinkID=0'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlLinksList'
						Container='spnLinksList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectLink'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Description' ColumnHeader='Description'>
							<Sortable>
								<Argument PropertyKey='Description' />
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='Link' ColumnHeader='Link'>
							<Sortable>
								<Argument PropertyKey='Link' />
							</Sortable>
							<Control ID='ctlURL' Type='cLink'>
						        <Action Target='_blank' URL='Web'></Action>
					        </Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CampaignType.Description' ColumnHeader='Campaign'>
							<Sortable>
								<Argument PropertyKey='Description' >
									<RelatedProperty PropertyKey='CampaignType' />
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' Width='100'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantLinkEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectLinkID' AttributeName='GranteeProjectLinkID' BaseValue='GranteeProjectLinkID='/>
										<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
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
										<Argument Type='DataObject' TypeKey='GranteeProjectLinkID' AttributeName='GranteeProjectLinkID'/>
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