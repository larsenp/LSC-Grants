<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Easygrants_Web.Controls.PageSection.cMaintenanceAlerts" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='..\..\..\Core\Controls\Base\NewWindowOpener.ascx' %>
<Core:cNewWindowOpener runat='server' id='ctlShow'/>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr visible='false'>
		<td colspan="4">
			The Maintenance Alerts page enables you to post an alert/warning message on the Login Page.
		</td>
	</tr>
	<tr visible='false'><td>&nbsp;</td></tr>
	<tr visible='false'>
		<td colspan="4">
			Enter the alert message you would like to display in the alert message text area.  All fields marked with an asterisk (*) are required.<br>
			-  Click <b>Preview</b> to preview the message.<br>
			-  To enable the message, select the "Yes" radio button, enter in the date and time you wish the message to display and click on <b>Save</b>.<br>
			-  To prevent users from logging into the system while the message is displayed select the "No" radio button, enter in the date and time you wish the message to display and click on <b>Save</b>.
		</td>
	</tr>
	<tr visible='false'><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>System under Maintenance</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='30%' valign='top'><b>Alert Message </b><font color='red'>*</font></td>
		<td  colspan="3" valign='top'>
			<span id='spnNotificationText' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td align="left" colspan="3">		
			<span runat='server' id="spnPreview"/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Display Message</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Display Message?&nbsp;</b><font color='red'>*</font></td>	
		<td colspan="3">
			<span id='spnDisplayNotification' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Message Display Start Time</b></td>
		<td colspan="3">
			<span id='spnDisplayMessageStartTime' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Message Display End Time</b></td>
		<td colspan="3">
			<span id="spnDisplayMessageEndTime" runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Disable Login</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Allow login while message displays?&nbsp;</b><font color='red'>*</font></td>	
		<td colspan="3">
			<span id='spnAllowLogin' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Login Disabled Start Time</b></td>
		<td colspan="3">
			<span id="spnDisableLoginStartTime" runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align="center" colspan="4">		
			<span runat='server' id='spnSave'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='MaintenanceNotifications' DataObjectDefinitionKey='MaintenanceNotifications' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument PropertyKey='MaintenanceNotificationsID' Value='1' />
			</Filters>
			<DefaultValues>
				<Argument PropertyKey='MaintenanceNotificationsID' Value='1' />
			</DefaultValues>
			<DisplayProperties>				
				<DisplayProperty PropertyKey='DisplayNotification'>
					<Control ID='ctlDisplayNotification'
						Container='spnDisplayNotification'
						Type='cRadioButtonList'
						LoadParam='True'
						DefaultValue='False'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AllowLogin'>
					<Control ID='ctlAllowLogin'
						Container='spnAllowLogin'
						Type='cRadioButtonList'
						LoadParam='True'
						DefaultValue='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NotificationText'>
					<Control ID='ctlNotificationText'
						Container='spnNotificationText'
						Type='cTextArea'
						Rows='10'
						Cols='65'
						MaxLength='3000'
						TooLongMessage='You can enter up to 3000 characters or approximately 300 words for the Notification Text.'
						RequiredField='True'
						ErrorMessage='Notification Text is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DisplayMessageStartTime'>
					<Control ID='ctlDisplayMessageStartTime'
						Container='spnDisplayMessageStartTime'
						Type='cDateTextBox'
						ShowDateTime='True'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Width='10'
						MaxLength='10'
						DateFormatErrorMessage='Display Message Start Time should be in mm/dd/yyyy format.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DisplayMessageEndTime'>
					<Control ID='ctlDisplayMessageEndTime'
						Container='spnDisplayMessageEndTime'
						Type='cDateTextBox'
						ShowDateTime='True'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Width='10'
						MaxLength='10'
						DateFormatErrorMessage='Display Message End Time should be in mm/dd/yyyy format.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DisableLoginStartTime'>
					<Control ID='ctlDisableLoginStartTime'
						Container='spnDisableLoginStartTime'
						Type='cDateTextBox'
						ShowDateTime='True'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Width='10'
						MaxLength='10'
						DateFormatErrorMessage='Login Disabled Start Time should be in mm/dd/yyyy format.'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnPreview'
						Container='spnPreview'
						Type='cButton'
						Image='Preview'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='OnPreview'>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
</span>
<!-- End Embedded XML -->
