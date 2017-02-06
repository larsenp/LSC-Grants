<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Login.Controls.Page.cLoginTest_Content" Codebehind="LoginTest_Content.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.Modules' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<table runat='server' width='100%'>
	<tr>
		<td width='100%'><font color='red'><b><span id="spnErrorMsg" runat='server'/></b></font></td>
	</tr>
</table>
<br>
<!-- Page Content - Top Of Page -->
<p>Welcome to the Easygrants System Login page.</p>
<span id='spnInfoText' runat='server' visible='false'>
	<p>
		<b>lease read the information about the availability of Easygrants current competitions, 
		shown below, before you attempt to log in.</b>
	</p>
</span>

<span id='spnNotificationText' runat='server'/>

<span id='spnLogin' runat='server'>
	<p>Enter your login ID and password below and click on Log In. If you have forgotten your password, click on the <b>Click here if you have forgotten your password</b> link below.
	<p>If you are a first time visitor to this system, <span id='spnRegister' runat='server'/></p>
	<br><br>

	<table border='0' cellspacing='0' cellpadding='2' runat='server'>
		<tr>
			<td><b>Login ID</b>&nbsp;&nbsp;</td> 
			<td>
				<input type='text' size='30' maxlength='100' runat='server' id='txtLoginID' />
			</td>
		</tr>
		<tr>
			<td><b>Password</b>&nbsp;&nbsp;</td> 
			<td>
				<input type='password' size='32' maxlength='100' runat='server' id='txtPWord' />
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<span runat='server' id='spnLogInButton'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='2'>
				<span runat='server' id='spnForgot'/>
			</td>
		</tr>
		<tr>
			<td colspan='2'>
				<span runat='server' id='spnSystemRequirements'/>
			</td>
		</tr>
		<tr>
			<td colspan='2'>
				<a href='http://www.adobe.com/products/acrobat/readstep2.html' target='_blank'>Click here to download the Free Adobe Reader</a>
			</td>
		</tr>
	</table>
</span>

<p>Please note:  Some files in the Easygrants System launch and display in a secondary browser window.  
If your browser or a third-party software program that you have installed blocks pop-up windows, please 
follow that product's instructions for allowing pop-up windows from this domain.  Please contact us using 
the contact links at the bottom of each page if you have further questions.</p>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<Filters>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='UserName'>
						<Control ID='txtLoginID'
						Type='HtmlInputText' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlErrorMsg'
						Container='spnErrorMsg'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnLogIn'
						Container='spnLogInButton'
						Type='cButton'
						Image='Log In' EnterKey='True'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='LoginUser'/>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlForgot'
						Container='spnForgot'
						Type='cLink'
						Caption='Click here if you have forgotten your password.'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ForgotLogin'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlSystemRequirements'
						Container='spnSystemRequirements'
						Type='cLink'
						Caption='Click here to view system requirements.'>
						<Action PostBack='False'
							Target='_blank'
							URL='../../../Implementation/PDF/SystemRequirements.pdf'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlRegister'
						Container='spnRegister'
						Type='cLink'
						Caption='Click Here to Register.'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Registration'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Notification' DataObjectDefinitionKey='MaintenanceNotifications'>
			<Filters>
				<Argument PropertyKey='MaintenanceNotificationsID' Value='1' />
				<Argument Group='(' Bool='And' />
				<Argument PropertyKey='AllowLogin' Value='False' Bool=''/>
				<Argument PropertyKey='DisplayNotification' Value='True' Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='NotificationText' HtmlEncode='False'>
					<Control ID='spnNotificationText' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
