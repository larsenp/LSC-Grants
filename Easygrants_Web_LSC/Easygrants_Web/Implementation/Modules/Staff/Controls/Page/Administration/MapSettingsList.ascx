<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<br/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Map Settings Manager</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAdd' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>
<br/>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='MapSettings' DataObjectDefinitionKey='MapSettings'>
			<Sort>
				<Argument PropertyKey='EasygrantsSiteName'/>	
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Container='spnAdd'
						Type='cButton'
						Image='Add'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='MapSettingsEditor'/>
								<Argument Type='' TypeKey='' AttributeName='' BaseValue='MapSettingsID=0'/>
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
					    <DisplayProperty PropertyKey='EasygrantsSiteName'  ColumnHeader='Easygrants Site Name' Width='20%'>
					        <Sortable>
							    <Argument PropertyKey='EasygrantsSiteName'/>
							</Sortable>
					    </DisplayProperty>
						<DisplayProperty PropertyKey='EasygrantsSiteUrl'  ColumnHeader='Easygrants Site Url' Width='20%'>
					        <Sortable>
							    <Argument PropertyKey='EasygrantsSiteUrl'/>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='MapKey' WordBreak='True' ColumnHeader='Map Key' Width='25%'>
					        <Sortable>
							    <Argument PropertyKey='MapKey'/>
							</Sortable>
					    </DisplayProperty>
						<DisplayProperty PropertyKey='MapWidth'  ColumnHeader='Width' Width='8%'>
					        <Sortable>
							    <Argument PropertyKey='MapWidth'/>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='MapHeight'  ColumnHeader='Height' Width='8%'>
					        <Sortable>
							    <Argument PropertyKey='MapHeight'/>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='MapZoom'  ColumnHeader='Zoom' Width='8%'>
					        <Sortable>
							    <Argument PropertyKey='MapZoom'/>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='MarkerColor'  ColumnHeader='Marker Color' Width='10%'>
					        <Sortable>
							    <Argument PropertyKey='MarkerColor'/>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center' Width='5%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='MapSettingsEditor'/>
										<Argument Type='DataObject' TypeKey='MapSettingsID' AttributeName='MapSettingsID' BaseValue='MapSettingsID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
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