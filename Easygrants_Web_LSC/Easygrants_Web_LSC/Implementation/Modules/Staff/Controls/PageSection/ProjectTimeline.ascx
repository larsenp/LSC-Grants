<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div class='SeparatorHdg'>
	Milestone Reporting
</div>
<br />
<span runat='server' id='spnAddMilestone' />
<br /><br />
<span runat='server' id='spnMilestones' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscMilestone' DataObjectDefinitionKey='LscMilestone' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PaymentID' PropertyKey='PaymentID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='MilestoneNumber'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddMilestone'
						Type='cButton'
						Container='spnAddMilestone'
						Caption='Add'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='MilestoneEditor'/>
								<Argument Type='QueryString' TypeKey='PaymentID' BaseValue='PaymentID=' />
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
								<Argument Value='LscMilestoneID=0' />
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlMilestones'
						Type='cDataListCtl'
						Container='spnMilestones'>
						<DisplayProperty PropertyKey='MilestoneNumber' ColumnHeader='Number' >
							<Sortable>
								<Argument PropertyKey='MilestoneNumber'/>	
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Milestone' ColumnHeader='Milestone/Activity' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action ID='Edit'
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='MilestoneEditor'/>
										<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
										<Argument Type='DataObject' TypeKey='LscMilestoneID' AttributeName='LscMilestoneID' BaseValue='LscMilestoneID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
