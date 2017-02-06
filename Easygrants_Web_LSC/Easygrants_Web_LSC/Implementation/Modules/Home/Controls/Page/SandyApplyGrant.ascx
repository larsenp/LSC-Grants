<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Home.Controls.Page.cDisasterApplyGrant" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<div style='width:600px'>
	<div class="SeparatorHdg">
		Apply for Sandy Disaster Grant
	</div>
	<p>The Legal Services Corporation Hurricane Sandy Disaster Relief Grant Program is for current LSC recipients to provide the mobile resources, technology, and disaster pro bono volunteer coordinators necessary to provide storm-related legal services in those states significantly affected by Hurricane Sandy in the designated disaster areas set out in the Major Disaster Declarations issued for the incident period of October 26, 2012 to November 8, 2012, which is available at <a href='http://www.fema.gov/disasters' target="_blank">http://www.fema.gov/disasters</a>.</p>
	<p>The <a href='http://grants.lsc.gov/sites/default/files/Grants/Disaster/HURRICANE_SANDY_DISASTER_RELIEF_GRANTS_Request_for_Applications.pdf' target='_blank'>Notice of Funds Availability</a> contains a full description of the program and the application process.</p>
	<p>To start a Sandy Disaster Relief Grant application, click <b>Start Application</b> below.</p>
	<div style="text-align:center">
		<span runat='server' id='spnStartAppl'/>
	</div>
</div>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnStartAppl'
						Type='cButton'
						Container='spnStartAppl'
						Caption='Start&nbsp;Application'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CreateWfTAAndRedirect'>
							<Parameters>
								<Argument Value='90' />
								<Argument Value='4' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
