<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.TIG_Application.Forms.cBudgetNarrative" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<div style='width:700px'/>
	<br />
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
		Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
		runat='server'/>
	<br />
	<div style="width:100%" class="SeparatorHdg">
		Instructions
	</div>
	<p>In the Budget Narrative discuss each of the budget items listed in the Budget Form. Detail each item, explain why it is necessary for the project’s success, and specify the project stage(s) in which it will be expended. If the term of the project is multiple years, give the proposed expenditures for each of those years. Fully explain each budget item, including descriptions and specific costs, so that it can be effectively evaluated. If the budget includes a request for personnel costs, identify the proposed personnel and the estimated time they will spend on the project.</p>
    <p>The budget must be reasonable for the tasks proposed, and the relationship of items in the budget to the Project Narrative, especially the project objectives and activities, should be clearly defined and communicated.</p>
	
	<div runat='server' id='divContracts'>
		<div class="SeparatorHdg" >
			Contracts
		</div>
		<p>You have indicated that LSC funds will be spent on contracts. Because of this, you are required to fill out the third-party contracting form using the button below. <strong>Be sure to save your work on this page before clicking the button to proceed to the contracting form.</strong></p>
		<span runat='server' id='spnContractsBtn'/>
	</div>
	<br /><br />
	
	<div style="width:100%" class="SeparatorHdg">
		Budget Narrative
	</div>
	<br />
	<span runat='server' id='spnBudgetNarrative' />
	<br />
	<div style="width:100%" class="SeparatorHdg">
		Reporting on Expenditure of Funds
	</div>
	<p>The applicant should include a statement of the methods that it will adopt and the records that it will keep to track 
	   and identify the source and application of the grant funds. These methods should include separate reporting of the
	   grant funds by line item in the annual audit and record keeping to track all time and costs charged to this grant 
	   separate from other funds. See <a Target="_blank" href='http://www.lsc.gov/sites/default/files/LSC/pdfs/accounting_guide_for_lsc_recipients_2010_edition.pdf' >LSC’s Accounting Guide for LSC Recipients, 2010 Edition,</a> for guidance on financial 
	   accounting and reporting standards.</p>
	<p><b>Reporting on Expenditure of Funds</b><font color='red'>*</font></p>
	<span runat='server' id='spnReportingExpenses'/>
	<br />
	<br />
	<div width='100%' class='SeparatorHdg'>Statement of Additional Funds</div>
	<br />
	<b>Please use this section to describe the source of any additional funds your project will receive from other entities or funding agencies. If you do not anticipate any additional project funding, please indicate that in this section. Do not include in-kind contributions from partners.</b><font color='red'>*</font>
	<br /><br />
	<span runat='server' id='spnStmtAdditionalFunds' />  
	<br /><br />
	<div width='100%' style="text-align:center" >
		<span runat='server' id='spnSave' />
		<span runat='server' id='spnContinue' />
	</div>
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
		
		<DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='ReportingExpenses'>
					<Control ID='txtReportingExpenses'
						Type='cTextArea'
						Container='spnReportingExpenses'
						Rows='10'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='StmtAdditionalFunds'>
					<Control ID='txtStmtAdditionalFunds'
						Type='cTextArea'
						Container='spnStmtAdditionalFunds'
						Rows='10'
						Cols='80' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		

	</ModuleSection>
</span>
