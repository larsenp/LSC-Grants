<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br />
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
	<br />
	<div class="SeparatorHdg" style="width:600px">
		PQV Recommendations and Modifications to the Delivery System
	</div>

	<br />
	<span runat='server' id='spnPostPQVPA1' /><br />
	<span runat='server' id='spnPostPQVPA2' /><br />
	<span runat='server' id='spnPostPQVPA3' /><br />
	<span runat='server' id='spnPostPQVPA4' /><br />


	<br />
	<div width='100%' style="text-align:center" >
		<span runat='server' id='spnContinue' />
	</div>
</div>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Caption='Continue'
						Save='False'
						GoToNextPage='True'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkPostPQVPA1'
						Type='cLink'
						Container='spnPostPQVPA1'
						Caption = 'Performance Area 1'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVPA1' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkPostPQVPA2'
						Type='cLink'
						Container='spnPostPQVPA2'
						Caption = 'Performance Area 2'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVPA2' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkPostPQVPA3'
						Type='cLink'
						Container='spnPostPQVPA3'
						Caption = 'Performance Area 3'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVPA3' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkPostPQVPA4'
						Type='cLink'
						Container='spnPostPQVPA4'
						Caption = 'Performance Area 4'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVPA4' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	     
	</ModuleSection>
	
</span>