<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table width='600px'  >
	<tr>
		<td colspan="2">
			<B><span runat='server' id='spnSortOrder'/>. <span runat='server' id='spnBudgetCategory'/></B><br />
		</td>
	</tr>
	<tr>
		<td style='width:200px'>
			<strong>Projected Budget Amount</strong> 
		</td>
		<td style='text-align:left'>
			<span runat='server' id='spnAmountP'/>
		</td>
	</tr>
	<tr>
		<td >
			<strong>Final Budget Amount</strong> 
		</td>
		<td >
			<span runat='server' id='spnAmountF'/>
		</td>
	</tr>
	<tr>
		<td style="vertical-align:top">
			<strong>Explanation of Variance</strong> 
		</td>
		<td rowspan='2' style="vertical-align:top">
			<span runat='server' id='spnComment'/>
		</td>
	</tr>
	<tr>
		<td style="vertical-align:top">
			<span runat='server' id='spnEdit'/>
		</td>
	</tr>
</table>
<br />
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscTigBudgetItemVariance' Key='LscTigBudgetItemVariance' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='AmountP' Format='$#,0'>
					<Control ID='spnAmountP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AmountF' Format='$#,0'>
					<Control ID='spnAmountF'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='spnSortOrder'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BudgetCategory.Description'>
					<Control ID='spnBudgetCategory'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscTigBudgetItemF.Comment'>
					<Control ID='spnComment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnEdit'
						Type='cButton'
						Container='spnEdit'
						Caption='Add/Edit Explanation'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='VarianceExplanationEditor'/>
								<Argument Type="DataObjectCollection" TypeKey="LscTigBudgetItemVariance" DataObjectPropertyKey="LscTigBudgetItemIDF" BaseValue='LscTigBudgetItemID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
