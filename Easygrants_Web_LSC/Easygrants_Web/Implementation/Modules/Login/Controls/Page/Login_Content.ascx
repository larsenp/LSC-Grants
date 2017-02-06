<%@ Register Tagprefix='Core' Namespace='Core.Web.Modules' Assembly='Core' %>
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Login.Controls.Page.cLogin_Content" Codebehind="Login_Content.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cNewWindowOpener id='ctlNewWindowOpener' runat='server' />
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<table runat='server' width='100%'>
	<tr>
		<td width='100%'><font color='red'><b><span id="spnLoginTextMsg" runat='server' /></b></font></td>
	</tr>
	<tr>
		<td width='100%'><font color='red'><b><span id="spnPasswordTextMsg" runat='server' /></b></font></td>
	</tr>
	<tr>
		<td width='100%'><font color='red'><b><span id="spnErrorMsg" runat='server' /></b></font></td>
	</tr>
</table>
<br>

<!-- Page Content - Top Of Page -->
<p><b> Welcome to the Easygrants&reg; System.</b></p>
<span id='spnInfoText' runat='server'></span><span id='spnNotificationText' runat='server' />
<span id='spnLogin' runat='server'>
		<br>
		<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
			<tr>
			    <td width='35%'>
			        <table border='0' cellspacing='0' cellpadding='2' runat='server'>
			            <tr>
				            <td width='30%'>Login ID</td>
				            <td>
					            <input type='text' size='30' maxlength='100' runat='server' id='txtLoginID'>
				            </td>
			            </tr>
			            <tr>
				            <td>Password</td>
				            <td>
					            <input type='password' size='32' maxlength='15' runat='server' id='txtPWord'>
				            </td>
			            </tr>
			            <tr>
			                <td>&nbsp;</td>
				            <td>
					            <span runat='server' id='spnForgot' />
				            </td>
			            </tr>
            			<tr>
            			    <td>&nbsp;</td>
            			</tr>
			            <tr>
				            <td>&nbsp;</td>
				            <td>
					            <span runat='server' id='spnLogInButton' />
				            </td>
			            </tr>
            			
		            </table>
			    </td>
			    <td width='65%'>
			        <table border='0' cellspacing='0' cellpadding='25' runat='server'>
			            <tr>
				            <td style='border-left: 1px solid #000000;' height='125' valign='Top'>
			                    <b>New User?</b>&nbsp; <span id='spnRegister' runat='server' />
			                    <br><br>
			                    <span id='spnFAQ' runat='server' /> 
			                </td>
			            </tr>
			        </table>  
			    </td>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<table border='0' cellspacing='0' cellpadding='2' runat='server'>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan='2'><b>About Pop-ups</b></td>
			</tr>
			<tr>
				<td colspan='2'>Easygrants uses pop-up windows to display some files. Please make 
					sure that your Web browser allows pop-ups for Easygrants.</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan='2'><b>About Cookies</b></td>
			</tr>
			<tr>
				<td colspan='2'>Easygrants uses cookies to maintain the session information. Please 
					make sure that your browser and computer can accept cookies <br> from this site. For 
					more information, click <span runat='server' id='spnSystemRequirements1' />
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan='2'><b>PDF</b></td>
			</tr>
			<tr>
				<td colspan='2'>Easygrants uses PDFs extensively. <a href='http://www.adobe.com/products/acrobat/readstep2.html' target='_blank'>Download 
						the free Adobe Reader</a>
				</td>
			</tr>
		</table>
	</span>
	<!-- END USER MODIFIABLE CONTENT AREA -->
	<!-- Embedded XML Page Functionality - please do not edit -->
	<span id='spnConfigXML' visible='false' runat='server'>
		<ModuleSection>
			<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
				<Filters></Filters>
				<DisplayProperties>
					<DisplayProperty PropertyKey='UserName'>
						<Control ID='txtLoginID' Type='HtmlInputText' />
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlErrorMsg' Container='spnErrorMsg' Type='cLabel'></Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlLoginTextMsg' Container='spnLoginTextMsg' Type='cLabel'></Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlPasswordTextMsg' Container='spnPasswordTextMsg' Type='cLabel'></Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnLogIn' Container='spnLogInButton' Type='cButton' Image='Log In' EnterKey='True'>
							<Action PostBack='True' Object='EventController' Method='LoginUser' />
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlForgot' Container='spnForgot' Type='cLink' Caption='Forgot your password?'>
							<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument Value='ForgotLogin' />
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlSystemRequirements1' Container='spnSystemRequirements1' Type='cLink' Caption='View system requirements.'>
							<Action PostBack='False' Target='_blank' URL='../../../Implementation/PDF/SystemRequirements.html' />
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlRegister' Container='spnRegister' Type='cLink' Caption='Register here.'>
							<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument Value='Registration' />
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlFAQ' Container='spnFAQ' Type='cLink' Caption='Frequently Asked Questions'>
							<Action ID='View' Target='_blank' URL='../../../Implementation//Modules/Login/LoginModuleContent.aspx?Config=LoginModuleConfig' >
							</Action>
						</Control>
						<%--
						<Control ID='ctlFAQ' Container='spnFAQ' Type='cLink' Caption='Frequently Asked Questions'>
							<Action
								PostBack='True' Object='DataPresenter' Method='ViewFAQ'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='FAQPublicView'/>
								</Parameters>
							</Action>
						</Control>
						--%>
					</DisplayProperty>
				</DisplayProperties>
			</DataObject>
			<DataObject Key='Notification' DataObjectDefinitionKey='MaintenanceNotifications'>
				<Filters>
					<Argument PropertyKey='MaintenanceNotificationsID' Value='1' />
					<Argument Group='(' Bool='And' />
					<Argument PropertyKey='AllowLogin' Value='False' Bool='' />
					<Argument PropertyKey='DisplayNotification' Value='True' Bool='Or' />
					<Argument Group=')' Bool='' />
				</Filters>
				<DisplayProperties>
					<DisplayProperty PropertyKey='NotificationText' HtmlEncode='False'>
						<Control ID='spnNotificationText' Type='HtmlGenericControl' />
					</DisplayProperty>
				</DisplayProperties>
			</DataObject>
		</ModuleSection>
	</span>
<!-- End Embedded XML -->
