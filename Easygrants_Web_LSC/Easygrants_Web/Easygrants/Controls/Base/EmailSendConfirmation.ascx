<%@ Control Language="vb" AutoEventWireup="true" Codebehind="EmailSendConfirmation.ascx.vb" Inherits="Easygrants_Web.Controls.Base.cEmailSendConfirmation" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>E-mail Sent Successfully!</P>
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='0' cellpadding='2' runat='server' id='tabEmailListSource' >
<tr>
	<td colspan="2" class="SeparatorHdg"><b>E-mail Recipient List</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
<tr>
	<td width='25%'>
		<b>Name - E-mail (First 5):</b>
	</td>	
	<td width='75%'>
		<span id='spnDisplayName' runat='server'/>
	</td>	
</tr>
<tr>
	<td width='25%'>
		<b>Total Recipient Count:</b>
	</td>	
	<td width='75%'>
		<span id='spnCount' runat='server'/>
	</td>	
</tr>
<tr>
	<td colspan='2' >
		<span id='spnReturn' runat='server'/>
	</td>	
</tr>
<tr><td>&nbsp;</td></tr>
</table>

<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkReturn'
						Container='spnReturn'
						Type='cLink'
						Caption=''>
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
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>