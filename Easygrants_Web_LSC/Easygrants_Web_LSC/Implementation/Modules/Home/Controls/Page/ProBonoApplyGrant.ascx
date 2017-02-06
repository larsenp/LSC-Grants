<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Home.Controls.Page.cProBonoApplyGrant" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<div style='width:600px'>
	<div class="SeparatorHdg">
		Apply to Pro Bono Innovation Fund
	</div>
    
    <p>
	    <b>Thank you for your interest in the Pro Bono Innovation Fund.</b> <br /><br />
        Before you begin your Letter of Intent to Apply for Funding, please note:
        <ul>
            <li>This online application will be live and available to you 24 hours a day between March 1 – March 29, 2017. March 29, 2017 at 5:00 PM ET is the application deadline.</li>
            <li>You will be able to open, review, close and return to each section of the application at any time during the period when the online application is live.</li>
            <li>To ensure you do not lose your work, please remember to save the information you have entered in the application.  It is also important to have a complete backup copy of your Letter of Intent to Apply for Funding.</li> 
        </ul>
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
						Caption='Start Letter of Intent to Apply for Funding'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CreateWfTAAndRedirect'>
							<Parameters>
								<Argument Value='123' />
								<Argument Value='6' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
