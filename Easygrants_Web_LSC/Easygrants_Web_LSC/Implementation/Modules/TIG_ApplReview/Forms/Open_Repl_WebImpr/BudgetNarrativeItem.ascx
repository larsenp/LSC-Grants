<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>


<b><span runat='server' id='spnLineAbbr'/>.<span runat='server' id='spnFundingTypeAbbr' /> <span runat='server' id='spnLineDesc' /><br />
<span runat='server' id='spnFundingTypeDesc' /> - <span runat='server' id='spnAmount' /></b><br />
<span runat='server' id='spnComment' />
<br /><br />



<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscTigBudgetItem' Key='LscTigBudgetItem' Updatable='True'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='BudgetCategory.SortOrder'>
					<Control ID='spnLineAbbr'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscTigBudgetFundingType.Abbr'>
					<Control ID='spnFundingTypeAbbr'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='BudgetCategory.Description'>
					<Control ID='spnLineDesc'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscTigBudgetFundingType.Description'>
					<Control ID='spnFundingTypeDesc'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Amount' Format='$#,0'>
					<Control ID='spnAmount'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='lblComment'
						Container='spnComment'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>