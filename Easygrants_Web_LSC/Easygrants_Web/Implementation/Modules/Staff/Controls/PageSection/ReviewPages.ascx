<%@ Control Language="vb" AutoEventWireup="true" Inherits='Implementation.Modules.Staff.Controls.PageSection.cReviewPages'  %>
<%@ register tagprefix='Core' tagname='HorizNavigation'	src='../../../../../Core/Controls/Base/HorizNav.ascx' %>


<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td>
			<Core:HorizNavigation id='ctlGoToNavigation' NavKey='GotoReviewCycle' runat='server' />
		</td>
	</tr>
	
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCycle' DataObjectDefinitionKey='ReviewCycle' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID'
					PropertyKey='ReviewCycleID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlOrgContact'
						Container='spnOrgContact'
						Type='cLink'
						Caption='Review Cycles'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ReviewCycle'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlPool'
						Container='spnPool'
						Type='cLink'
						Caption='Applicant/Committee Pool'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ReviewCycleManager'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlOrgActivity'
						Container='spnOrgActivity'
						Type='cLink'
						Caption='Requests and Conflicts'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PreReview'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReviewStage'
						Container='spnReviewStage'
						Type='cLink'
						Caption='Review Stages'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ReviewCycleStage'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
