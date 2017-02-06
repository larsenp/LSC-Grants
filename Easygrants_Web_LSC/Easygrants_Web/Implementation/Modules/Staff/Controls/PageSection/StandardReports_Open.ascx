<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cStandardReports_Open" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>	
<tr>
	<td>
		<!-- Go button for Reports -->
		<span id='spnReportOutput' runat='server'/>
		<!--New Window Opener control-->	
		<span id='spnWindowOpener' runat='server'/>
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel'/>
	</td>
</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<Filters>
			</Filters>
			<DisplayProperties>				
				<DisplayProperty>
					<Control ID='ctlReportOutput'
						Container='spnReportOutput'
						Image='Go'
						Type='cButton'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='OpenReport'/>
					</Control>
				</DisplayProperty>				
				<DisplayProperty>
					<Control ID='ctlWindowOpener'
						Container='spnWindowOpener'
						Type='cNewWindowOpener'/>
				</DisplayProperty>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Cancel'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='StandardReports'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
