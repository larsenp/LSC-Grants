<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Home.Controls.Page.cProBonoApplyGrant" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<div style='width:600px'>
	<div class="SeparatorHdg">
		Apply to Midwest Legal Disaster Coordination Program
	</div>
	<p><b>Thank you for applying to the Midwest Legal Disaster Coordination Program.</b> <br />
<br />
        Before you begin your application, please note:
        <ul>
         <li><i>Instructions go here</i></li>
        </ul>
       </P>
</p>
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
								<Argument Value='114' />
								<Argument Value='7' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
