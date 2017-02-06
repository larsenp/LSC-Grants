<%@ Control Language="vb" AutoEventWireup="true" Codebehind="PDFErrorPage.ascx.vb"  Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Applications.cPDFErrorPage" %>

<!-- USER MODIFIABLE CONTENT AREA -->
<table width='100%' runat='server' visible='true'>
	<tr>
		<td>
			The PDF you requested does not exist for this task.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			To continue using the system, click on the <b>Resume</b> button.  You will be
			redirected to the previous page.  If your session has timed out, you will be
			redirected to the Login page.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			To Logout, click on the <b>Logout</b> button.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Note that if you log out or your session times out before saving data that you
			have entered, these data may be lost.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnResume'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnLogout'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnResume'
						Container='spnResume'
						Type='cButton'
						Image='Resume'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>
				</DisplayProperty>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnLogout'
						Container='spnLogout'
						Type='cButton'
						Image='Logout'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController' 
							Method='Logout'>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
