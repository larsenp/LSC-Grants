<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<style>
<!--
#report table {
	width:600px
}

#report th {
	font-size:9pt;
}

#report td {
	padding:5px 10px 5px 5px;
	border:1px solid #cccccc;

}

#report {
	border-collapse:collapse;
}

.total {
	font-weight:bold;
}

tr.total td {
	font-weight:bold;
}
-->
</style>
<table width='600' cellpadding='1'>
	<tr>
		<td align=center>
			<b>Legal Services Corporation</b>
		</td>
	</tr>
	<tr>
		<td align=center>
			<b><span runat='server' id='spnOrganizationName' /></b>
		</td>
	</tr>
	<tr>
		<td align=center>
			<b>Grant Budget</b>
		</td>
	</tr>
	<tr>
		<td align=center>
			TIG Number: <span runat='server' id='spnTIG' />
		</td>
	</tr>
	<tr>
		<td align=center>
			Grantee Number: <span runat='server' id='spnLegacyOrganizationID' />
		</td>
	</tr>
	<tr>
		<td align=center>
			Grant Amount: <span runat='server' id='spnGrantAmount' />
		</td>
	</tr>
</table>

<hr style="height:1px; color:Gray" />
<table id='report'>
	<tr>
		<th style='width:150px;'>&nbsp;</td>
		<th style="text-align:center;width:90px"><b>A</b></td>
		<th style="text-align:center;width:90px"><b>B</b></td>
		<th style="text-align:center;width:90px"><b>C</b></td>
		<th style="text-align:center;width:90px"><b>D</b></td>
		<th style="text-align:center;width:90px"><b>E</b></td>
	</tr>
	<tr>
		<th >&nbsp;</td>
		<th style="text-align:center;width:90px"><b>LSC Grant Request</b></td>
		<th style="text-align:center;width:90px"><b>Program Project Contributions</b></td>
		<th style="text-align:center;width:90px"><b>Funds from Other LSC-Funded Partners</b></td>
		<th style="text-align:center;width:90px"><b>Funds from Non-LSC-Funded Partners</b></td>
		<th style="text-align:center;width:90px"><b>Total Columns A through D</b></td>
	</tr>
	<tr>
		<td><b>1. Salaries and Wages</b></td>
		<td style="text-align:right">
			<span runat='server' id='spnSalWage1' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnSalWage2' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnSalWage3' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnSalWage4' />
		</td>
		<td style="text-align:right" class="total">
			<span runat='server' id='spnSalWageTotal' />
		</td>
	</tr>
	<tr>
		<td><b>2. Fringe Benefits</b></td>
		<td style="text-align:right">
			<span runat='server' id='spnFringe1' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnFringe2' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnFringe3' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnFringe4' />
		</td>
		<td style="text-align:right" class="total">
			<span runat='server' id='spnFringeTotal' />
		</td>
	</tr>
	<tr>
		<td><b>3. Travel</b></td>
		<td style="text-align:right">
			<span runat='server' id='spnTravel1' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnTravel2' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnTravel3' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnTravel4' />
		</td>
		<td style="text-align:right" class="total">
			<span runat='server' id='spnTravelTotal' />
		</td>
	</tr>
	<tr>
		<td><b>4. Equipment </b></td>
		<td style="text-align:right">
			<span runat='server' id='spnEquipment1' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnEquipment2' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnEquipment3' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnEquipment4' />
		</td>
		<td style="text-align:right" class="total">
			<span runat='server' id='spnEquipmentTotal' />
		</td>
	</tr>
	<tr>
		<td><b>5. Telecommunications Bandwidth Charges</b></td>
		<td style="text-align:right">
			<span runat='server' id='spnTelecom1' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnTelecom2' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnTelecom3' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnTelecom4' />
		</td>
		<td style="text-align:right" class="total">
			<span runat='server' id='spnTelecomTotal' />
		</td>
	</tr>
	<tr>
		<td><b>6. Communications and Marketing</b></td>
		<td style="text-align:right">
			<span runat='server' id='spnComm1' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnComm2' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnComm3' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnComm4' />
		</td>
		<td style="text-align:right" class="total">
			<span runat='server' id='spnCommTotal' />
		</td>
	</tr>
	<tr>
		<td><b>7. Software</b></td>
		<td style="text-align:right">
			<span runat='server' id='spnSoftware1' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnSoftware2' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnSoftware3' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnSoftware4' />
		</td>
		<td style="text-align:right" class="total">
			<span runat='server' id='spnSoftwareTotal' />
		</td>
	</tr>
	<tr>
		<td><b>8. Supplies</b></td>
		<td style="text-align:right">
			<span runat='server' id='spnSupplies1' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnSupplies2' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnSupplies3' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnSupplies4' />
		</td>
		<td style="text-align:right" class="total">
			<span runat='server' id='spnSuppliesTotal' />
		</td>
	</tr>
	<tr>
		<td><b>9. Contracts and Subgrants</b></td>
		<td style="text-align:right">
			<span runat='server' id='spnContracts1' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnContracts2' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnContracts3' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnContracts4' />
		</td>
		<td style="text-align:right" class="total">
			<span runat='server' id='spnContractsTotal' />
		</td>
	</tr>
	<tr>
		<td><b>10. Project Evaluation</b></td>
		<td style="text-align:right">
			<span runat='server' id='spnProjEval1' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnProjEval2' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnProjEval3' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnProjEval4' />
		</td>
		<td style="text-align:right" class="total">
			<span runat='server' id='spnProjEvalTotal' />
		</td>
	</tr>
	<tr>
		<td><b>11. Training</b></td>
		<td style="text-align:right">
			<span runat='server' id='spnTraining1' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnTraining2' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnTraining3' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnTraining4' />
		</td>
		<td style="text-align:right" class="total">
			<span runat='server' id='spnTrainingTotal' />
		</td>
	</tr>
	<tr>
		<td><b>12. Other</b></td>
		<td style="text-align:right">
			<span runat='server' id='spnOther1' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnOther2' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnOther3' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnOther4' />
		</td>
		<td style="text-align:right" class="total">
			<span runat='server' id='spnOtherTotal' />
		</td>
	</tr>
	<tr>
		<td><b>13. Conference Fee</b></td>
		<td style="text-align:right">
			<span runat='server' id='spnConfFee1' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnConfFee2' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnConfFee3' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnConfFee4' />
		</td>
		<td style="text-align:right" class="total">
			<span runat='server' id='spnConfFeeTotal' />
		</td>
	</tr>
	<tr class="total">
		<td><b>Percentages</b></td>
		<td style="text-align:right">
			<span runat='server' id='spnGrantRequestPct' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnProgramContributionPct' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnLscPartnersPct' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnNonLscPct' />
		</td>
		<td style="text-align:right">&nbsp;
			
		</td>
	</tr>
	<tr class="total">
		<td><b>Totals</b></td>
		<td style="text-align:right">
			<span runat='server' id='spnGrantRequest' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnProgramContribution' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnLscPartners' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnNonLsc' />
		</td>
		<td style="text-align:right">
			<span runat='server' id='spnBudgetTotal' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganization.OrganizationName'>
					<Control ID='spnOrganizationName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegacyGrantID'>
					<Control ID='spnTIG'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnLegacyOrganizationID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProjectInfo.AwardAmount' Format='$#,0'>
					<Control ID='spnGrantAmount'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigBudgetViewBC' DataObjectDefinitionKey='LscTigBudgetViewBC' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument PropertyKey='LscTigBudgetTypeID' Value='1'/>
				<Argument PropertyKey='WfTaskAssignmentID' Value='' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SalWage1' Format='#,0'>
					<Control ID='spnSalWage1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SalWage2' Format='#,0'>
					<Control ID='spnSalWage2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SalWage3' Format='#,0'>
					<Control ID='spnSalWage3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SalWage4' Format='#,0'>
					<Control ID='spnSalWage4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Fringe1' Format='#,0'>
					<Control ID='spnFringe1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Fringe2' Format='#,0'>
					<Control ID='spnFringe2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Fringe3' Format='#,0'>
					<Control ID='spnFringe3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Fringe4' Format='#,0'>
					<Control ID='spnFringe4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Travel1' Format='#,0'>
					<Control ID='spnTravel1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Travel2' Format='#,0'>
					<Control ID='spnTravel2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Travel3' Format='#,0'>
					<Control ID='spnTravel3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Travel4' Format='#,0'>
					<Control ID='spnTravel4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Equipment1' Format='#,0'>
					<Control ID='spnEquipment1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Equipment2' Format='#,0'>
					<Control ID='spnEquipment2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Equipment3' Format='#,0'>
					<Control ID='spnEquipment3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Equipment4' Format='#,0'>
					<Control ID='spnEquipment4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Telecom1' Format='#,0'>
					<Control ID='spnTelecom1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Telecom2' Format='#,0'>
					<Control ID='spnTelecom2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Telecom3' Format='#,0'>
					<Control ID='spnTelecom3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Telecom4' Format='#,0'>
					<Control ID='spnTelecom4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comm1' Format='#,0'>
					<Control ID='spnComm1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comm2' Format='#,0'>
					<Control ID='spnComm2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comm3' Format='#,0'>
					<Control ID='spnComm3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comm4' Format='#,0'>
					<Control ID='spnComm4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Software1' Format='#,0'>
					<Control ID='spnSoftware1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Software2' Format='#,0'>
					<Control ID='spnSoftware2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Software3' Format='#,0'>
					<Control ID='spnSoftware3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Software4' Format='#,0'>
					<Control ID='spnSoftware4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Supplies1' Format='#,0'>
					<Control ID='spnSupplies1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Supplies2' Format='#,0'>
					<Control ID='spnSupplies2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Supplies3' Format='#,0'>
					<Control ID='spnSupplies3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Supplies4' Format='#,0'>
					<Control ID='spnSupplies4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Contracts1' Format='#,0'>
					<Control ID='spnContracts1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Contracts2' Format='#,0'>
					<Control ID='spnContracts2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Contracts3' Format='#,0'>
					<Control ID='spnContracts3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Contracts4' Format='#,0'>
					<Control ID='spnContracts4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjEval1' Format='#,0'>
					<Control ID='spnProjEval1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjEval2' Format='#,0'>
					<Control ID='spnProjEval2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjEval3' Format='#,0'>
					<Control ID='spnProjEval3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjEval4' Format='#,0'>
					<Control ID='spnProjEval4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Training1' Format='#,0'>
					<Control ID='spnTraining1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Training2' Format='#,0'>
					<Control ID='spnTraining2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Training3' Format='#,0'>
					<Control ID='spnTraining3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Training4' Format='#,0'>
					<Control ID='spnTraining4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other1' Format='#,0'>
					<Control ID='spnOther1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other2' Format='#,0'>
					<Control ID='spnOther2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other3' Format='#,0'>
					<Control ID='spnOther3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other4' Format='#,0'>
					<Control ID='spnOther4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ConfFee1' Format='#,0'>
					<Control ID='spnConfFee1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ConfFee2' Format='#,0'>
					<Control ID='spnConfFee2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ConfFee3' Format='#,0'>
					<Control ID='spnConfFee3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ConfFee4' Format='#,0'>
					<Control ID='spnConfFee4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigBudgetTotalSubtotalPctBC' DataObjectDefinitionKey='LscTigBudgetTotalSubtotalPctBC' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscTigBudgetViewBC' DataObjectPropertyKey='LscTigBudgetID' PropertyKey='LscTigBudgetID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SalWage' Format='#,0'>
					<Control ID='spnSalWageTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Fringe' Format='#,0'>
					<Control ID='spnFringeTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Travel' Format='#,0'>
					<Control ID='spnTravelTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Equipment' Format='#,0'>
					<Control ID='spnEquipmentTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Telecom' Format='#,0'>
					<Control ID='spnTelecomTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comm' Format='#,0'>
					<Control ID='spnCommTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Software' Format='#,0'>
					<Control ID='spnSoftwareTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Supplies' Format='#,0'>
					<Control ID='spnSuppliesTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Contracts' Format='#,0'>
					<Control ID='spnContractsTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjEval' Format='#,0'>
					<Control ID='spnProjEvalTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Training' Format='#,0'>
					<Control ID='spnTrainingTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other' Format='#,0'>
					<Control ID='spnOtherTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ConfFee' Format='#,0'>
					<Control ID='spnConfFeeTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantRequestPct' Format='0%'>
					<Control ID='spnGrantRequestPct'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProgramContributionPct' Format='0%'>
					<Control ID='spnProgramContributionPct'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPartnersPct' Format='0%'>
					<Control ID='spnLscPartnersPct'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='NonLscPct' Format='0%'>
					<Control ID='spnNonLscPct'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantRequest' Format='#,0'>
					<Control ID='spnGrantRequest'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProgramContribution' Format='#,0'>
					<Control ID='spnProgramContribution'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPartners' Format='#,0'>
					<Control ID='spnLscPartners'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='NonLsc' Format='#,0'>
					<Control ID='spnNonLsc'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='BudgetTotal' Format='#,0'>
					<Control ID='spnBudgetTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
