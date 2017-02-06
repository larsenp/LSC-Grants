<%@ register tagprefix='Core' tagname='HorizNavigation'	src='../../../../../Core/Controls/Base/HorizNav.ascx' %>
<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="GrantPages.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cGrantPages" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlGoToNavigation' Src='Core/Controls/Base/HorizNav.ascx'
				Properties='NavKey=GotoGrants' runat='server' />
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''
					bool='' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlPersonContact' Container='spnPersonContact' Type='cLink' Caption='Grant Info'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='GrantsEditor' />
								<Argument Type='QueryString' TypeKey='GranteeProjectID' DataObjectPropertyKey='GranteeProjectID'
									BaseValue='GranteeProjectID=' />
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlEasygrantsActivity' Container='spnEasygrantsActivity' Type='cLink' Caption='Grant Contacts'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='GrantContacts' />
								<Argument Type='QueryString' TypeKey='GranteeProjectID' DataObjectPropertyKey='GranteeProjectID'
									BaseValue='GranteeProjectID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGPAct' Container='spnGPAct' Type='cLink' Caption='Grant Activity'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ProjectSummary' />
								<Argument Type='QueryString' TypeKey='GranteeProjectID' DataObjectPropertyKey='GranteeProjectID'
									BaseValue='GranteeProjectID=' />
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAdmin' Container='spnAdmin' Type='cLink' Caption='Financial'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Finance' />
								<Argument Type='QueryString' TypeKey='GranteeProjectID' DataObjectPropertyKey='GranteeProjectID'
									BaseValue='GranteeProjectID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAttachments' Container='spnAttachments' Type='cLink' Caption='Attachments'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='GrantAttachments' />
								<Argument Type='QueryString' TypeKey='GranteeProjectID' DataObjectPropertyKey='GranteeProjectID'
									BaseValue='GranteeProjectID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlNotes' Container='spnNotes' Type='cLink' Caption='Notes'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='GrantNotes' />
								<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='
									bool='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
