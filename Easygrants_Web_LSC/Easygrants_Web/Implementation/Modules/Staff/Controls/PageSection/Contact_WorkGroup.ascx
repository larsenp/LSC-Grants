<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Workgroups</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr><td><span runat='server' id='spnWorkgroupMgmtLink'/></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ContactWGMList' DataObjectDefinitionKey='WorkGroupMember'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='PersonID' 
					PropertyKey='PersonID' 
					Value='' 
					Bool=''>					
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey='WorkGroupDescription'>	
					<RelatedProperty PropertyKey='WorkGroup'/>
				</Argument>
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
									<Argument AttributeName='PageKey' Value='PersonWorkgroupEditor'/>									
									<Argument Type='QueryString' TypeKey='PersonID' BaseValue='PersonID='/>
									<Argument Type='QueryString' TypeKey='UserID' BaseValue='UserID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WorkGroupMember'
						SeparatorWidth='2'
						MaxPerPage='10'>
						
						<DisplayProperty PropertyKey='WorkGroup.WorkGroupDescription' ColumnHeader='Workgroup'/>						
						<DisplayProperty PropertyKey='' ColumnHeader='Option' HeaderColspan='2' HeaderAlign='Center'>							
							<Control ID='btnDelete'
								Type='cButton'
								Image='Remove'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='WorkGroupMemberID' AttributeName='WorkGroupMemberID'/> 
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlspnWorkgroupMgmtLink'
						Container='spnWorkgroupMgmtLink'
						Type='cLink'
						Caption='Click here to go to Workgroup Management Page'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='WorkGroups'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
	