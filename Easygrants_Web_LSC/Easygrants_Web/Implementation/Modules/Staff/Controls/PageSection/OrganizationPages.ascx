<%@ Control Language="vb" AutoEventWireup="true" Codebehind="OrganizationPages.ascx.vb" Inherits='Easygrants_Web.Modules.Staff.Controls.PageSection.cOrganizationPages'  %>
<%@ register tagprefix='Core' tagname='HorizNavigation'	src='../../../../../Core/Controls/Base/HorizNav.ascx' %>
<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='0' runat='server' ID="Table1">	
	<tr>
		<td>
			<Core:HorizNavigation id='ctlGoToNavigation' NavKey='GotoOrg' runat='server' />
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Organization' DataObjectDefinitionKey='Organization' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='OrganizationID' PropertyKey='OrganizationID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlOrgContact'
						Container='spnOrgContact'
						Type='cLink'
						Caption='~~Organization~~ Details'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='OrganizationContact'/>
								<Argument Type='DataObjectCollection' TypeKey='Organization' DataObjectPropertyKey='OrganizationID' BaseValue='OrganizationID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlOrgActivity'
						Container='spnOrgActivity'
						Type='cLink'
						Caption='Activity'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='OrganizationActivity'/>
								<Argument Type='DataObjectCollection' TypeKey='Organization' DataObjectPropertyKey='OrganizationID' BaseValue='OrganizationID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAttachments'
						Container='spnAttachments'
						Type='cLink'
						Caption='Attachments'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='OrganizationAttachments'/>
								<Argument Type='DataObjectCollection' TypeKey='Organization' DataObjectPropertyKey='OrganizationID' BaseValue='OrganizationID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlNotes'
						Container='spnNotes'
						Type='cLink'
						Caption='Notes'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='OrganizationNotes'/>
									<Argument Type='QueryString' TypeKey='OrganizationID' PropertyKey='OrganizationID' BaseValue='OrganizationID=' bool=''/>
								</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
