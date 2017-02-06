<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<div style="width:600px">
	<br />
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
		Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
		runat='server'/>
	<br />
	<div style="width:100%" class="SeparatorHdg">
		Instructions
	</div>
	<p>LSC requires additional information about proposed contracts that will use TIG funds. Use the Add Contract button below to provide details on each of these proposed contracts. In  this section, applicants only need to input data for contracts that will be  paid with TIG funds.</p>
  <p>The system will validate the total contract amounts you provide in the Contracts form with your previously-entered TIG funding request for project contracts.</p>
	<p><b><span runat='server' id='spnProjectNarrative' /></b></p>
	<div style="width:100%" class="SeparatorHdg">
		Budget
	</div>
	<br />
	<table width="600">
		<tr>
			<td>
				<b>Budget Amount for Contracts from TIG funding</b>
			</td>
			<td>
				<span runat='server' id='spnContractsTIG'/>
			</td>
		</tr>
	</table>
	<br />
	<div style="width:100%" class="SeparatorHdg">
		Contracts
	</div>
	<br />
	<table width="600">
		<tr>
			<td>
				<b>Total Contract Amount from TIG Funds Entered Using the Contract Form Below</b>
			</td>
			<td>
				<span runat='server' id='spnContractAmountTig'/>
			</td>
		</tr>
	</table>
	<br />
	<span runat='server' id='spnAdd' /><br /><br />
	<span runat='server' id='spnContracts' />
</div>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscTigContract' DataObjectDefinitionKey='LscTigContract' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Type='cButton'
						Container='spnAdd'
						Caption='Add Contract'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ContractEditor' />
								<Argument Value='LscTigContractID=0' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlContracts'
						Type='cDataListCtl'
						Container='spnContracts'
						DataObjectDefinitionKey='LscTigContract'
						NoRecordMessage='No contracts have been added.'>
						<DisplayProperty PropertyKey='ContractingEntity' ColumnHeader='Proposed Contractor' />
						<DisplayProperty PropertyKey='ContractAmountTIG' ColumnHeader='Contract Amount from TIG Funds' Format='$#,0' DataAlign='Right' HeaderAlign='Center' Width='80'/>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnEdit'
								Type='cButton'
								Caption='Edit'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='ContractEditor' />
										<Argument Type='DataObject' TypeKey='LscTigContractID' AttributeName='LscTigContractID' BaseValue='LscTigContractID=' />
									</Parameters>	
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnDelete'
								Type='cButton'
								Caption='Delete'
								Confirmation='Are you sure you want to delete this contract?'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='LscTigContractID' AttributeName='LscTigContractID' />
									</Parameters>	
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigBudget' DataObjectDefinitionKey='LscTigBudget' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='LscTigBudgetTypeID' Value='1'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='LscTigBudgetItem' DataObjectDefinitionKey='LscTigBudgetItem' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscTigBudget' DataObjectPropertyKey='LscTigBudgetID' PropertyKey='LscTigBudgetID' />
				<Argument PropertyKey='SortOrder' Value='9'>
					<RelatedProperty PropertyKey='BudgetCategory'/>
				</Argument>
				<Argument PropertyKey='SortOrder' Value='1'>
					<RelatedProperty PropertyKey='LscTigBudgetFundingType'/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Amount' Format='$#,0'>
					<Control ID='spnContractsTIG'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigContractByWfta' DataObjectDefinitionKey='LscTigContractByWfta' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ContractAmountTig' Format='$#,0'>
					<Control ID='spnContractAmountTig'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

        <DataObject Key='Base' DataObjectDefinitionKey='' >
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProjectNarrative' Container='spnProjectNarrative' Type='cLink' Caption='Back to Budget Narrative'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
						<Parameters>
							<Argument AttributeName='PageKey' Value='BudgetNarrative' />
						</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			
			
			</DisplayProperties>
		</DataObject>


	</ModuleSection>
</span>
