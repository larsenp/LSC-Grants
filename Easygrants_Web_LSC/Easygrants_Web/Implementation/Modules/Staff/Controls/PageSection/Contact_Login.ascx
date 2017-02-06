<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Contact_Login.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cContact_Login" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<!-- commented out by K.S. 4/14/04.  Text seemed irrelevant.
<P>Use this page to review and edit this address information.  To save your changes, 
click on the Save button.  All fields marked with an asterisk (<FONT color=red>*</FONT>)are required.</P>
-->
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='0' cellpadding='2' runat='server'>

<!-- Control Label (for Education information) -->
<tr>
	<td class="SeparatorHdg"><b>Login Information</b></td>
</tr>	
</table>
<table id='tbAdd' border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr><td>&nbsp;</td></tr>
<tr>
	<td valign='center'>
		This contact does not have an Easygrants login.<span runat='server' id='spnClickAdd'>  Click <b>Add</b> to create a login account for this contact.</span>
		</br>		
		<span runat='server' id='spnAdd'></span>
	</td>
</tr>
</table>
<table id='tbLogin' runat='server' visible='true'>
<tr><td>&nbsp;</td></tr>
<tr>
	<td >
		Click <b>Edit</b> to modify the existing login information for this contact. Click  <b>Send Password </b>
		to send the password to the contact's primary e-mail address. Click <b>Delete</b> to remove this 
		contact's Easygrants login account
	</td>
</tr>
<tr><td>&nbsp;</td></tr>

<tr>
	
	<td align='center'><span id='spnSendPassword' runat='server'/> &nbsp;&nbsp; <span runat='server' id='spnEdit'/>&nbsp;&nbsp;<span runat='server' id='spnDelete'/></td>
</tr>
<tr><td>&nbsp;</td></tr>

</table>
<p>
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='User' DataObjectDefinitionKey='User'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='PersonID'
					PropertyKey='PersonID'
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='LoginEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='UserID=0'/>
									<Argument Type='QueryString' TypeKey='PersonID' BaseValue='PersonID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
							
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnEdit'
						Container='spnEdit'
						Type='cButton'
						Image='Edit'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='LoginEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='User' DataObjectPropertyKey='UserID' BaseValue='UserID='/>
								<Argument Type='DataObjectCollection' TypeKey='User' DataObjectPropertyKey='PersonID' BaseValue='PersonID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnDelete'
						Container='spnDelete'
						Type='cButton'
						Image='Delete'
						Confirmation='Are you sure you want to delete this user login information?'>
							<Action
							PostBack='True'
							Object='DataPresenter'
							Method='Delete'>
								
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSendPassword'
						Container='spnSendPassword'
						Type='cButton'
						Image='Send Password'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SendPassword'>
						</Action>
					</Control>	
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
								
	</ModuleSection>
<!-- End Embedded XML -->
</span>
