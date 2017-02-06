<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.PageSection.cPersonInfo_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>

<!-- Control Label (for Education information) -->
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Summary</b></td>
</tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr>
	<td>Person</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnPersonInfo1' runat='server'/>
	</td>
</tr>
<tr>
	<td>Login ID</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnLogin' runat='server'/>
	</td>
	<td>
		<span id='spnLogInButton' runat='server'/>
	</td>
	
</tr>
<tr>
	<td>Password</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnPassword' runat='server'/>
	</td>
</tr>
<tr>
	<td>E-mail</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnEmail' runat='server'/>
	</td>
</tr>
<tr>
	<td>Phone</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnPhone' runat='server'/>
	</td>
</tr>
</table>
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel'/>
	</td>
</tr>

</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='PersonInfo' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='PersonID' PropertyKey='PersonID' Value='' bool=''/>
			</Filters>
			<DefaultValues />
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastNameFirstName'>
					<Control ID='spnPersonInfo1'
						Type='HtmlGenericControl'/>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='User.UserName'>
					<Control ID='spnLogin'
						Type='HtmlGenericControl'/>
				</DisplayProperty>				
				<DisplayProperty PropertyKey='User.Password'>
					<Control ID='spnPassword'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PersonPrimaryEMail.ContactValue1'>
					<Control ID='spnEmail'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PersonPrimaryPhone.ContactValue1'>
					<Control ID='spnPhone'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnLogIn'
						Container='spnLogInButton'
						Type='cButton'
						Image='Log In'>
						<Action
							PostBack='True'
							Object='ModulePage'
							Method='LoginAsUser'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'spnLogin' ControlPropertyKey='InnerText' Value='' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
<!-- End Embedded XML -->
</span>