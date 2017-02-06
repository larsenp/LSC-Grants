<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ContactPages.ascx.vb" Inherits='Easygrants_Web.Modules.Staff.Controls.PageSection.cContactPages'  %>
<%@ register tagprefix='Core' tagname='HorizNavigation'	src='../../../../../Core/Controls/Base/HorizNav.ascx' %>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='0' runat='server' ID="Table1">
	<tr>
		<td>
			<Core:HorizNavigation id='ctlGoToNavigation' NavKey='GotoPerson' runat='server' />
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlPersonContact' Container='spnPersonContact' Type='cLink' Caption='Person Details'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PersonContact' />
								<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' BaseValue='PersonID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlEasygrantsActivity' Container='spnEasygrantsActivity' Type='cLink' Caption='Activity'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PersonActivity' />
								<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' BaseValue='PersonID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAdmin' Container='spnAdmin' Type='cLink' Caption='Contact Administration'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Admin' />
								<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' BaseValue='PersonID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAttachments' Container='spnAttachments' Type='cLink' Caption='Attachments'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PersonAttachments' />
								<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' BaseValue='PersonID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReviewerInfo' Container='spnReviewerInfo' Type='cLink' Caption='Reviewer Info'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ContactReviewerInfo' />
								<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' BaseValue='PersonID='
									bool='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlNominatorInfo' Container='spnNominatorInfo' Type='cLink' Caption='Nominator Info'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='NominatorInfo' />
								<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' BaseValue='PersonID='
									bool='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlNotes' Container='spnNotes' Type='cLink' Caption='Notes'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='PersonNotes' />
								<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' BaseValue='PersonID='
									bool='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCrspndnc' Container='spnCrspndnc' Type='cLink' Caption='Correspondence'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ContactCrspndnc' />
								<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' BaseValue='PersonID='
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
