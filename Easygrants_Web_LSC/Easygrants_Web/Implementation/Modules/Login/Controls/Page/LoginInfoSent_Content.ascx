<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<table width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Password Assistance</b></td>
	</tr>
</table>	
<!-- Page Content - Top Of Page -->
<p>Your password has been sent to the e-mail address contained in your user profile. Please note that if you 
have changed your e-mail address since you first registered, the e-mail address to which your information was sent may not be the same as the e-mail address you used as the Login ID.</p>

<span id='spnLogin' runat='server'/>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlLogin'
						Container='spnLogin'
						Type='cLink'
						Caption='Return to Log In Page'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Login'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
