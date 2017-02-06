<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>


<b><span runat='server' id='spnLineAbbr'/>.<span runat='server' id='spnFundingTypeAbbr' /> <span runat='server' id='spnLineDesc' /><font color='red'>*</font><br />
<span runat='server' id='spnFundingTypeDesc' /> - <span runat='server' id='spnAmount' /></b><br />
<i><span runat='server' id='spnInstruction'/></i><br />
<span runat='server' id='spnComment' />
<br /><br />



<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscTigBudgetItem' Key='LscTigBudgetItem' Updatable='True'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscTigBudgetLine.Abbr'>
					<Control ID='spnLineAbbr'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscTigBudgetFundingType.Abbr'>
					<Control ID='spnFundingTypeAbbr'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscTigBudgetLine.Description'>
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
					<Control ID='txtComment'
						Type='cTextArea'
						Container='spnComment'
						Rows='10'
						Cols='80' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigBudgetNarrativeInstruction' DataObjectDefinitionKey='LscTigBudgetNarrativeInstruction' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="DataObjectCollection" TypeKey="LscTigBudgetItem" DataObjectPropertyKey='LscTigBudgetLineID' PropertyKey='LscTigBudgetLineID'/>
				<Argument Type="DataObjectCollection" TypeKey="LscTigBudgetItem" DataObjectPropertyKey='LscTigBudgetFundingTypeID' PropertyKey='LscTigBudgetFundingTypeID'/>
				<Argument Type="DataObjectCollection" TypeKey="LscTigBudgetItem" DataObjectPropertyKey='LscTigBudget.WfTaskAssignment.GranteeProject.WfProject.TimePeriodID' PropertyKey='TimePeriodID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Instruction'>
					<Control ID='spnInstruction'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>