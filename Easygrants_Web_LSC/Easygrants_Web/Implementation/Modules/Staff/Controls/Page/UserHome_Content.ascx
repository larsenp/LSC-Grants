<%@ Control Language="vb" AutoEventWireup="true" Codebehind="UserHome_Content.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cUserHome_Content" %>
<%@ Register TagPrefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='dbgWebSessionUserList' src='../../../../../Core/Controls/Base/dbgWebSessionUserList.ascx' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr>
	<td>Login ID:&nbsp;&nbsp;</td>
	<td>
		<input type='text' size='25' maxlength='75' runat='server' id='txtLoginID' />
	
	</td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td> 
		<span runat='server' id='spnLogInButton' />
	</td>
</tr>
</table>

<Core:dbgWebSessionUserList id='dbgWebSessionUserList' runat='server'/>

<!-- END USER MODIFIIABLE CONTENT AREA -->

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
					<Control ID='btnLogIn'
						Container='spnLogInButton'
						Type='cButton'
						Image='Log In'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='btnLogin_Click'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'txtLoginID' ControlPropertyKey='Value' Value='' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>