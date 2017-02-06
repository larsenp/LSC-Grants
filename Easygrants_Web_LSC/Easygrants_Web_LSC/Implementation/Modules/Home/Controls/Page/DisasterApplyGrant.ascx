<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Home.Controls.Page.cDisasterApplyGrant" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<div style='width:600px'>
	<div class="SeparatorHdg">
		Apply for LSC Disaster Relief Grant
	</div>
	<p>The Legal Services Corporation Disaster Relief Emergency Grant Program is for LSC recipients in federally declared disaster areas who are seeking financial assistance to mitigate damage sustained and who have experienced a surge in demand for legal services as the result of a disaster. LSC emergency grant funds are available to  current LSC recipients located in a federally-declared disaster area .</p>
	<p>The <a href='http://www.lsc.gov/sites/default/files/Grants/Disaster/DISASTER_RELIEF_EMERGENCY_GRANT_PROGRAM_Request_for_Applications.pdf' target='_blank'>Notice of Funds Availability</a> contains a full description of the program and the application process.</p>
	<p>To start a Disaster Relief Emergency Grant application, click <b>Start Application</b> below.</p>
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
								<Argument Value='93' />
								<Argument Value='5' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
