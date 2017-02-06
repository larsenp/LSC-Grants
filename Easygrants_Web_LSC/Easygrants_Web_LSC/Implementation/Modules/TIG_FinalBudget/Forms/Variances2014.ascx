<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<div class="SeparatorHdg">
	Instructions
</div>
<p>
	Please use the Add/Edit Explanation button to explain any variances between the 
	approved budget and your actual expenditures on the grant. You must submit an 
	explanation for each line item where the amounts are not equal.
</p>
<br />
<div class="SeparatorHdg">
	Explanation of Budget Variances
</div>
<br />
<span runat='server' id='spnVariances'/>
<div style="text-align:center">
	<span runat='server' id='spnContinue' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscTigBudgetItemVariance' DataObjectDefinitionKey='LscTigBudgetItemVariance' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="ModuleUser" TypeKey="GranteeProjectID" PropertyKey="GranteeProjectID"/>
				<Argument PropertyKey='Variance' Value="0" Operator='NotEqual'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlVariances'
						Type='cDataPresenterList'
						Container='spnVariances'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/TIG_FinalBudget/Forms/VarianceItem2014.ascx'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						GoToNextPage='True'
						Caption='Continue'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
