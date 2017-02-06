<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br><br>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Google Analytics</b></td>
	</tr>	
</table>

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='15%'><b>Google Analytic Key Value &nbsp;</b> <%=kDenoteRequiredField%></td>
		<td><span id='spnCKeyValue' runat='server' /></td>
	</tr>	
</table>
<br>


<table id="Table2" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			&nbsp;&nbsp;
			<span runat='server' id='spnSaveAndClose'/>
			&nbsp;&nbsp;
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>



<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
	
		<DataObject Key='GoogleAnalyticsEditorSystemsettings' DataObjectDefinitionKey='Systemsettings' Updatable='True'>
			<Filters>
				<Argument Type='' TypeKey='' PropertyKey='SysSettingName' Value='GoogleAnalytics' />
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='Value'>
					<Control ID='ctlCKeyValue' 
							Type='cTextBox' 
							Container='spnCKeyValue' 
							Size='50	' 
							MaxLength='500' 
							RequiredField='True'
							ErrorMessage='Google Analytic Key Value is required.'>
					</Control>
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>		
			    <DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='GoogleAnalyticsEditorSystemsettings' DataObjectPropertyKey='PageKey' PropertyKey='PageKey' BaseValue='Page='/>
							</Parameters>							    					
						</Action>
					</Control>		
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'
						EnterKey='True'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='SystemSettings'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='SystemSettings'/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>