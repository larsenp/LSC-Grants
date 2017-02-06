<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg'>
	Final Budget
</div>
<br />
<div class='MinorSeparatorHdg'>
	Instructions
</div>
<p>
	As part of a final payment for a TIG, grantees must submit a budget reconciliation showing 
	actual LSC TIG fund expenditures on a grant, as well as a budget narrative explaining any 
	variances from the approved/prospective final budget (the final TIG budget included in the 
	award package subject to any LSC-approved revisions during the grant term).
</p>
<p>
	<b>Enter the actual LSC TIG expenditures for each budget line item. You will be able to provide 
	explanations for any variances once you submit your actual expenditures.</b>
</p>
<p>
	Please note: LSC staff may request additional supporting documentation for any expenditure. 
	If there are any unexpended funds remaining for which a reprogramming has not been approved 
	as provided herein, the amount of those funds may be deducted from the grantee’s final payment. 
	If it is discovered that any impermissible expenditures of TIG funds were made, those costs will 
	be subject to the cost standards and procedures as provided in LSC regulations at 45 C.F.R. Part 1630.
</p>
<div class='MinorSeparatorHdg'>
	Final Budget
</div>

<table style="width:450px; padding:2px; vertical-align:top">
	<tr>
		<td style="width:250px">&nbsp;
			
		</td>
		<td style="width:100px; text-align:center">
			<b>Final Budget Amount</b>
		</td>
		<td style="width:100px; text-align:center">
			<b>Prospective Budget Amount (for reference)</b>
		</td>
	</tr>
</table>
<span runat='server' id='spnBudgetItems'/>
<table style="width:450px; padding:2px; vertical-align:top">
	<tr>
		<td style="width:250px">
			Conference Fee
		</td>
		<td style="width:100px; text-align:right; padding-right:20px">
			<span runat='server' id='spnConfFeeF'/>
		</td>
		<td style="width:100px; text-align:right; padding-right:20px">
			<span runat='server' id='spnConfFeeP'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="width:250px">
			<b>Totals</b>
		</td>
		<td style="width:100px; text-align:right; padding-right:20px">
			<b><span runat='server' id='spnTotalF'/></b>
		</td>
		<td style="width:100px; text-align:right; padding-right:20px">
			<b><span runat='server' id='spnTotalP'/></b>
		</td>
	</tr>
</table>
<br />
<div style="text-align:center">
	<span runat='server' id='spnSave'/>
	<span runat='server' id='spnSaveContinue' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscCreateTigFinalBudget' DataObjectDefinitionKey='LscCreateTigFinalBudget' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="ModuleUser" TypeKey="WfTaskAssignmentID" PropertyKey="wfta_id"/>
			</Filters>
		</DataObject>

		<DataObject Key='LscTigBudgetF' DataObjectDefinitionKey='LscTigBudget' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="ModuleUser" TypeKey="GranteeProjectID" PropertyKey="GranteeProjectID"/>
				<Argument PropertyKey="LscTigBudgetTypeID" Value="2"/>
			</Filters>
		</DataObject>

		<DataObject Key='BudgetCategory' DataObjectDefinitionKey='BudgetCategory' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscTigBudgetF' DataObjectPropertyKey='GranteeProject.WfProjectID' PropertyKey="ProjectID"/>
				<Argument PropertyKey='ParentID' Value='0' Operator='NotEqual'/>
				<Argument PropertyKey='Description' Value='Conference Fee' Operator='NotEqual'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlBudgetItems'
						Type='cDataPresenterList'
						Container='spnBudgetItems'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/TIG_FinalBudget/Forms/FinalBudgetItem2014.ascx'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigBudgetItemCF_F' DataObjectDefinitionKey='LscTigBudgetItem' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type="DataObjectCollection" TypeKey="LscTigBudgetF" DataObjectPropertyKey="LscTigBudgetID" PropertyKey="LscTigBudgetID"/>
				<Argument PropertyKey="Description" Value="Conference Fee">
					<RelatedProperty PropertyKey="BudgetCategory"/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Amount' Format='$#,0'>
					<Control ID='spnConfFeeF'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigBudgetByFundingTypeF' DataObjectDefinitionKey='LscTigBudgetByFundingType' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="DataObjectCollection" TypeKey="LscTigBudgetF" DataObjectPropertyKey="LscTigBudgetID" PropertyKey="LscTigBudgetID"/>
				<Argument PropertyKey="LscTigBudgetFundingTypeID" Value='1'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FundingTypeTotal' Format='$#,0'>
					<Control ID='spnTotalF'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigBudgetP' DataObjectDefinitionKey='LscTigBudget' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="ModuleUser" TypeKey="GranteeProjectID" PropertyKey="GranteeProjectID"/>
				<Argument PropertyKey="LscTigBudgetTypeID" Value="1"/>
			</Filters>
		</DataObject>

		<DataObject Key='LscTigBudgetItemCF_P' DataObjectDefinitionKey='LscTigBudgetItem' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type="DataObjectCollection" TypeKey="LscTigBudgetP" DataObjectPropertyKey="LscTigBudgetID" PropertyKey="LscTigBudgetID"/>
				<Argument PropertyKey="Description" Value="Conference Fee">
					<RelatedProperty PropertyKey="BudgetCategory"/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Amount' Format='$#,0'>
					<Control ID='spnConfFeeP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigBudgetByFundingTypeP' DataObjectDefinitionKey='LscTigBudgetByFundingType' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="DataObjectCollection" TypeKey="LscTigBudgetP" DataObjectPropertyKey="LscTigBudgetID" PropertyKey="LscTigBudgetID"/>
				<Argument PropertyKey="LscTigBudgetFundingTypeID" Value='1'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FundingTypeTotal' Format='$#,0'>
					<Control ID='spnTotalP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
