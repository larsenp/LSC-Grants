<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataObjectEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<!-- commented out by K.S. 4/14/04.  Text seemed irrelevant.
<P>Use this page to review and edit this address information.  To save your changes, 
click on the Save button.  All fields marked with an asterisk (<FONT color=red>*</FONT>)are required.</P>
-->
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>

<!-- Control Label (for Education information) -->
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Security</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<table id='tbAdd' border='0' cellspacing='0' cellpadding='2' runat='server' visible='false'>
<tr>
	<td valign='center'>
		This contact does not have an Easygrants login.<span runat='server' id='spnClickAdd'>  Click <b>Add</b> to create a login account for this contact.</span>
		</br>		
		<span runat='server' id='spnAdd'></span>
	</td>
</tr>
</table>
<table id='tbLogin' runat='server' visible='true'>
<tr>
	<td><b>Question</b>
	</td>
	<td width='200'><b>&nbsp;&nbsp;Answer</b></td>
	<td id='tdOpt' runat='server' visible='true'>
		<b>Option</b>
	</td>
</tr>
<tr>
	<td><span id='spnQuestion' runat='server'/></td>
	<td>&nbsp;&nbsp;<span id='spnAnswer' runat='server'/></td>
	<td align='center'><span runat='server' id='spnEdit'/></td>
</tr>
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
				<DisplayProperty PropertyKey='PasswordQuestion.PasswordQuestion'>
					<Control ID='spnQuestion'
						Container='spnQuestion'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='PasswordAnswer'>
					<Control ID='spnAnswer'
						Container='spnAnswer'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>													
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
								<Argument AttributeName='PageKey' Value='SecurityEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='User' DataObjectPropertyKey='UserID' BaseValue='UserID='/>
								<Argument Type='DataObjectCollection' TypeKey='User' DataObjectPropertyKey='PersonID' BaseValue='PersonID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
								
	</ModuleSection>
<!-- End Embedded XML -->
</span>
