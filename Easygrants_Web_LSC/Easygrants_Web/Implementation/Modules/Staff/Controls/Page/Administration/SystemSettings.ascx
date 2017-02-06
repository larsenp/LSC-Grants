<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="SystemSettings.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cSystemSettings" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<br>
<!-- Page Content - Top Of Page -->
<table width='100%'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>System Settings</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnSystemSettingsList' visible='true'></span>
		</td>
	</tr>		
</table>



<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='SystemsettingsList' DataObjectDefinitionKey='Systemsettings' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlSystemSettingsList'
						Container='spnSystemSettingsList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Systemsettings'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='SysSettingName' ColumnHeader='Feature' Width='75%'>
							<Sortable>
								<Argument PropertyKey='SysSettingName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='center' DataAlign='Center'>
							<Control ID='btnSystemSettingsEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='PageKey' AttributeName='PageKey' BaseValue=''/>
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