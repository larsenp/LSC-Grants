<%@ Control Language="vb" AutoEventWireup="true" Inherits='Implementation.Modules.Staff.Controls.PageSection.cReviewStagePages'  %>
<%@ register tagprefix='Core' tagname='HorizNavigation'	src='../../../../../Core/Controls/Base/HorizNav.ascx' %>


<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br/>
<br/>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td>
			<Core:HorizNavigation id='ctlGoToNavigation' NavKey='GoToReviewStage' runat='server' />
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
						Caption='Assignments'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='RevProcAssign'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlOrgActivity'
						Container='spnOrgActivity'
						Type='cLink'
						Caption='Notification'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ReviewNotify'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlScore'
						Container='spnScore'
						Type='cLink'
						Caption='Scores and Critiques/Comments'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='RevProcScore'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlRank'
						Container='spnRank'
						Type='cLink'
						Caption='Rankings'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='RevProcRank'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlOutcome'
						Container='spnOutcome'
						Type='cLink'
						Caption='Outcomes'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='RevProcOutcome'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
