<%@ Register Tagprefix='Core' Namespace='Core.Web.Modules' Assembly='Core' %>
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Login.Controls.Page.cLogin_Content" Codebehind="Login_Content.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>

<!-- USER MODIFIABLE CONTENT AREA --> 

<table id="Table1" runat='server' width='100%'>

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


<!-- Page Content - Top Of Page -->
<h1>Welcome to the LSC Grants Login</h1>
<span id='spnInfoText' runat='server'></span><span id='spnNotificationText' runat='server' />  
  
<table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr>
		<td colspan="4" class="SeparatorHdg">Welcome to the LSC Grants Login</td>
	</tr>
	<tr>
		<td colspan="4" >&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" >
			<p>Log in below to access the LSC Grants Online Application System. </p>
			<p>The Online Application System is for users who want to:  
				<ul>
					<li>prepare a competitive grant or grant renewal application for the provision of civil legal services (LSC Grants)</li>
					<li>prepare a Technology Initiative Grants (TIG) application </li>
					<li>submit Grant Activity Reports (GAR)</li>
					<li>apply for disaster relief funding</li>
				</ul>
			</p>
			<p>To learn more about LSC funding opportunities or grantee reporting requirements, visit <a href="http://www.grants.lsc.gov">www.grants.lsc.gov</a>
			(LSC Grants) or <a href="http://www.tig.lsc.gov">www.tig.lsc.gov</a> (TIG). </p>
			<p>To apply for an LSC LRAP loan, go to <a href="http://grants.lsc.gov/apply-for-funding/other-types-funding/lrap">LRAP Home</a>. </p>
			<p>Click here for <a href='#recommendedsettings'>Recommended Web Browser Settings</a>. </p>
			<p>For technical  assistance, contact <a href='mailto:techsupport@lsc.gov'>techsupport@lsc.gov</a>.</p>
		</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td width="160" valign="top" >
			<table class="sidebar" width="160" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="sidebarheader">Quick Links </td>
				</tr>
				<tr>
					<td class="sidebartext">
						<ul>
							<li><a href='http://www.grants.lsc.gov'>LSC Grants</a></li>
							<li><a href='http://grants.lsc.gov/rin'>LSC Grants Recipient Information</a></li>
							<li><a href='http://tig.lsc.gov'>Technology Innovation Grants (TIG)</a></li>
							<li><a href="http://grants.lsc.gov/apply-for-funding/other-types-funding/lrap">LSC Loan Repayment Assistance Program (LRAP)</a></li>
							<li><a href='http://lri.lsc.gov'>LSC Resource Information (LRI)</a></li>
							<li><a href='http://grants.lsc.gov/apply-for-funding/disaster-relief-grants'>LSC disaster relief grant information</a></li>
						</ul>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td valign="top" >&nbsp;</td>
	</tr>
</table>
<span id='spnLogin' runat='server'>
	<table id="Table3" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
		<tr>
			<td colspan="2" class="SeparatorHdg"><a name="login"></a>LSC Grants Login </td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td width="23%" ><strong>Primary Email Address</strong> </td>
			<td width="77%">
				<input type='text' size='30' maxlength='100' runat='server' id='txtLoginID'>
			</td>
		</tr>
		<tr>
			<td><strong>Password</strong></td>
			<td>
				<input type='password' size='30' maxlength='15' runat='server' id='txtPWord'>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<span runat='server' id='spnLogInButton' />
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><b>New users, <span id='spnRegister' runat='server' /></b></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><span runat='server' id='spnForgot' /> </td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td ><p>To apply for an LSC LRAP loan, go to <a href= "http://grants.lsc.gov/apply-for-funding/other-types-funding/lrap">LRAP Home</a> </p></td>
		</tr>
				 <tr><td>&nbsp;</td></tr>
				 <tr><td colspan="2"><p>To avoid errors when logging in, please enter the same login information that you used for submission of the Grant Activity Reports (GAR). If you do not remember your password, click on the <strong>Forgot your password</strong> link (located under the <strong>Log In</strong> button above) to retrieve it. Please do not contact tech support to retrieve your password. The system will lock your account after 4 unsuccessful login attempts. Contact <a href="mailto:techsupport@lsc.gov">LSC Technical Support</a> to request that your account be unlocked. </p></td></tr>			
					  
					 </td>
					
	</table>
</span>
<br>

<span runat='server'>
		<table width="600" border='0' cellpadding='0' cellspacing='0' id="Table5" runat='server'>
			<tr>
			  <td class="SeparatorHdg"><a name="recommendedsettings"></a>Recommended Web Browser Settings</td>
		  </tr>
			<tr>
			  <td>&nbsp;</td>
		  </tr>
			<tr>
			  <td><ul>
	            <li><strong>Browser:</strong> This site has been optimized for Internet Explorer 6.0 and higher on a Microsoft Windows platform.  <span runat='server' id='spnSystemRequirements3' /></li>
                  <li><b>Pop-ups: </b>This site uses pop-up windows to display some files. Please make 
				  sure that your Web browser allows pop-ups. <span runat='server' id='spnSystemRequirements1' /></li>
			      <li><b>Cookies: </b>This site uses cookies to maintain the session information. Please 
				  make sure that your browser and computer can accept cookies from this site.  <span runat='server' id='spnSystemRequirements2' /></li>
				  
			      <li><strong>PDFs:</strong> This site uses PDFs extensively. <a href='http://www.adobe.com/products/acrobat/readstep2.html'>Download the free Adobe Reader</a>.</li>
			  </ul></td>
		  </tr>
			<tr>
				<td></td>
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
						<Control ID='ctlForgot' Container='spnForgot' Type='cLink' Caption='Forgot your password? Click here'>
							<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument Value='ForgotLogin' />
								</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				
				
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlSystemRequirements1' Container='spnSystemRequirements1' Type='cLink' Caption='Click here for more information.'>
							<Action PostBack='False'  URL='../../../Implementation/PDF/SystemRequirements.html' />
						</Control>
					</DisplayProperty>
					
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlSystemRequirements2' Container='spnSystemRequirements2' Type='cLink' Caption='Click here for more information.'>
							<Action PostBack='False'  URL='../../../Implementation/PDF/SystemRequirements.html' />
						</Control>
					</DisplayProperty>
					
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlSystemRequirements3' Container='spnSystemRequirements3' Type='cLink' Caption='Click here for more information.'>
							<Action PostBack='False'  URL='../../../Implementation/PDF/SystemRequirements.html' />
						</Control>
					</DisplayProperty>
					
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlRegister' Container='spnRegister' Type='cLink' Caption='click here to register.'>
							<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument Value='Registration' />
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>
					

			<%--<DisplayProperty PropertyKey=''>
              <Control ID='ctlRFPAppendices2010' Container='spnRFPAppendices2010' Type='cLink' Caption='FY 2010 Request For Proposals - Appendices'>
                <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
                  <Parameters>
                    <Argument Value='RFPAppendices2010' />
                  </Parameters>
                </Action>
              </Control>
            </DisplayProperty>--%>
            <!--<DisplayProperty PropertyKey=''>
              <Control ID='ctlRFPAppendices2011' Container='spnRFPAppendices2011' Type='cLink' Caption='FY 2011 Request For Proposals - Appendices'>
                <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
                  <Parameters>
                    <Argument Value='RFPAppendices2011' />
                  </Parameters>
                </Action>
              </Control>
            </DisplayProperty> -->
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
