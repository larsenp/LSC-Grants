<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.TIG_Application.Forms.cBudgetNarrative" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
	runat='server'/>
<br />
<div style="width:100%" class="SeparatorHdg">
	Instructions
</div>
<p>In the Budget Narrative discuss each of the budget items listed in the Budget Form.  Detail each item, 
explain why it is necessary for the project’s success, and specify the project stage(s) in which it will be 
expended. If the term of the project is two years, give the proposed expenditures for each of those years. 
Fully explain each budget item so that it can be effectively evaluated. The budget must be reasonable for the 
tasks proposed, and the relationship of items in the budget to the Project Narrative, especially the project 
objectives, should be clearly defined and communicated.</p>
<span runat='server' id='spnReturn' />
<br />
<br />

	<div runat='server' id='divContracts'>
		<div class="SeparatorHdg" >
			Contracts
		</div>
		<p><b><i>NOTE: New form for 2011</i></b></p>
		<p>You have indicated that LSC funds will be spent on contracts. Because of this, you are required to fill out the contracts form using the button below.</p>
		<span runat='server' id='spnContractsBtn'/>
		<br /><br />
	</div>

<div style="width:100%" class="SeparatorHdg">
	Budget Narrative
</div>
<br />
<span runat='server' id='spnBudgetNarrative' />
<br />
<div width='100%' style="text-align:center" >
	<span runat='server' id='spnSave' />
	<span runat='server' id='spnContinue' />
</div>


  <!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscTigBudgetItem' DataObjectDefinitionKey='LscTigBudgetItem' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'>
					<RelatedProperty PropertyKey='LscTigBudget' />
				</Argument>
				<Argument PropertyKey='Amount' Value='0' Operator='GreaterThan' />
				<Argument Group='(' Bool='And' />
					<Argument PropertyKey='SortOrder' Value='9' Operator='NotEqual' Bool=''>
						<RelatedProperty PropertyKey="BudgetCategory"/>
					</Argument>
					<Argument PropertyKey='LscTigBudgetFundingTypeID' Value='1' Operator='NotEqual' Bool='Or'/>
				<Argument Group=')' Bool='' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'>
					<RelatedProperty PropertyKey='BudgetCategory' />
				</Argument>
				<Argument PropertyKey='SortOrder'>
					<RelatedProperty PropertyKey='LscTigBudgetFundingType' />
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlBudgetNarrative'
						Container='spnBudgetNarrative'
						Type='cDataPresenterList'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/TIG_Application/Forms/BudgetNarrativeItem.ascx'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkReturn'
						Type='cLink'
						Container='spnReturn'
						Caption='Return to Review Assignment List'>
						<Action PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Staff' />
								<Argument Value='ModuleConfig' />
								<Argument Value='TIGAppReview_BudgetRevision' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigBudgetItemContracts' DataObjectDefinitionKey='LscTigBudgetItem' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'>
					<RelatedProperty PropertyKey='LscTigBudget' />
				</Argument>
				<Argument PropertyKey='Amount' Value='0' Operator='GreaterThan' />
				<Argument PropertyKey='SortOrder' Value='9'>
					<RelatedProperty PropertyKey="BudgetCategory"/>
				</Argument>
				<Argument PropertyKey='LscTigBudgetFundingTypeID' Value='1' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty>
					<Control ID='btnContracts'
						Type='cButton'
						Container='spnContractsBtn'
						Caption='Contracts Form'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Contracts' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>