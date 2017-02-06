<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><h1>LSC Grants Login Information Not Sent</h1></td>
  </tr>
  <tr>
    <td>The system was unable to locate and send your password. Please contact Technical Support using the e-mail link or the phone number below in order to get your login information.</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
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
						Caption='Return to LSC Grants Login page'>
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
