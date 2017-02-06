<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table style="width:450px; padding:2px; vertical-align:top">
	<tr>
		<td style="width:250px">
			<span runat='server' id='spnBudgetCategory'/>
		</td>
		<td style="width:100px; text-align:center">
			<span runat='server' id='spnAmountF'/>
		</td>
		<td style="width:100px; text-align:right; padding-right:20px">
			<span runat='server' id='spnAmountP'/>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='BudgetCategory' Key='BudgetCategory' Updatable='False'/>

		<DataObject Key='LscTigBudgetItemF' DataObjectDefinitionKey='LscTigBudgetItem' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="GranteeProjectID" PropertyKey="GranteeProjectID">
					<RelatedProperty PropertyKey="LscTigBudget"/>
				</Argument>
				<Argument PropertyKey="LscTigBudgetTypeID" Value="2">
					<RelatedProperty PropertyKey="LscTigBudget"/>
				</Argument>
				<Argument Type='DataObjectCollection' TypeKey='BudgetCategory' DataObjectPropertyKey="BudgetCategoryID" PropertyKey="BudgetCategoryID">
					<RelatedProperty PropertyKey="BudgetCategory"/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='BudgetCategory.Description'>
					<Control ID='spnBudgetCategory'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Amount'>
					<Control ID='txtAmountF'
						Type='cMoneyTextBox'
						Container='spnAmountF'
						AllowInputCommas='True'
						Format='#,0'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='All budget values must be whole numbers.'
						RegExErrorMessage='All budget values must be whole numbers.'
						MaxLength='10'
						Size='6' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigBudgetItemP' DataObjectDefinitionKey='LscTigBudgetItem' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="GranteeProjectID" PropertyKey="GranteeProjectID">
					<RelatedProperty PropertyKey="LscTigBudget"/>
				</Argument>
				<Argument PropertyKey="LscTigBudgetTypeID" Value="1">
					<RelatedProperty PropertyKey="LscTigBudget"/>
				</Argument>
				<Argument Type='DataObjectCollection' TypeKey='BudgetCategory' DataObjectPropertyKey="BudgetCategoryID" PropertyKey="BudgetCategoryID">
					<RelatedProperty PropertyKey="BudgetCategory"/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Amount' Format='$#,0'>
					<Control ID='spnAmountP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
