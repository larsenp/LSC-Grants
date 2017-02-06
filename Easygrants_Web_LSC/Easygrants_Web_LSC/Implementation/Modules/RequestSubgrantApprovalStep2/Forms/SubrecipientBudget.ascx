<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<style>
	table.notes td { vertical-align:top;
		padding:1px 1px 5px 1px;}
	table.pagecontent td { vertical-align:top;
		padding:1px 1px 5px 1px;}
</style>
<br />
<Core:cUserCtlLoader CtlID='ctlSubgrantInfo' 
	Src='Implementation/Modules/RequestSubgrantApproval/PageSection/SubgrantInfo.ascx'
	runat='server'/>

<div width='100%' class="SeparatorHdg">
	Instructions
</div>
<br />
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
   <tr>
    <td><p>The <strong>Subrecipient Budget</strong> page captures information  on projected personnel and non-personnel expenses. </p>
</td>
  </tr>
</table>
<br /><br />
<div width='100%' class="SeparatorHdg">
	Budget
</div>
<br />
<table border='0' cellspacing='0' cellpadding='2' width='300px'>
	<tr>
		<td style="width:150px">
			<b>EXPENSE CATEGORY</b>
		</td>
		<td>
			<b>BUDGET</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>PERSONNEL</b>
		</td>
	</tr>
	<tr>
		<td>
			Lawyers
		</td>
		<td>
			<span runat='server' id='spnLawyers'/>
		</td>
	</tr>
	<tr>
		<td>
			Paralegals
		</td>
		<td>
			<span runat='server' id='spnParalegals'/>
		</td>
	</tr>
	<tr>
		<td>
			Other Staff
		</td>
		<td>
			<span runat='server' id='spnOtherStaff'/>
		</td>
	</tr>
	<tr>
		<td>
			Employee Benefits
		</td>
		<td>
			<span runat='server' id='spnEmployeeBenefits'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>TOTAL PERSONNEL</b>
		</td>
		<td>
			<b><span runat='server' id='spnPersonnel'/></b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>NON-PERSONNEL</b>
		</td>
	</tr>
	<tr>
		<td>
			Space - Rent/Lease
		</td>
		<td>
			<span runat='server' id='spnSpaceRent'/>
		</td>
	</tr>
	<tr>
		<td>
			Space - Mortgage Payments
		</td>
		<td>
			<span runat='server' id='spnSpaceMortgage'/>
		</td>
	</tr>
	<tr>
		<td>
			Space - Other Expenses
		</td>
		<td>
			<span runat='server' id='spnSpaceOther'/>
		</td>
	</tr>
	<tr>
		<td>
			Equipment Rental
		</td>
		<td>
			<span runat='server' id='spnEquipRental'/>
		</td>
	</tr>
	<tr>
		<td>
			Office Supplies and Expenses
		</td>
		<td>
			<span runat='server' id='spnOffSupplies'/>
		</td>
	</tr>
	<tr>
		<td>
			Telephone
		</td>
		<td>
			<span runat='server' id='spnTelephone'/>
		</td>
	</tr>
	<tr>
		<td>
			Travel - Board Members
		</td>
		<td>
			<span runat='server' id='spnTravelBoard'/>
		</td>
	</tr>
	<tr>
		<td>
			Travel - Staff and Other
		</td>
		<td>
			<span runat='server' id='spnTravelStaff'/>
		</td>
	</tr>
	<tr>
		<td>
			Training - Board Members
		</td>
		<td>
			<span runat='server' id='spnTrainingBoard'/>
		</td>
	</tr>
	<tr>
		<td>
			Training - Staff and Other
		</td>
		<td>
			<span runat='server' id='spnTrainingStaff'/>
		</td>
	</tr>
	<tr>
		<td>
			Library
		</td>
		<td>
			<span runat='server' id='spnLibrary'/>
		</td>
	</tr>
	<tr>
		<td>
			Insurance
		</td>
		<td>
			<span runat='server' id='spnInsurance'/>
		</td>
	</tr>
	<tr>
		<td>
			Dues and Fees
		</td>
		<td>
			<span runat='server' id='spnDues'/>
		</td>
	</tr>
	<tr>
		<td>
			Audit
		</td>
		<td>
			<span runat='server' id='spnAudit'/>
		</td>
	</tr>
	<tr>
		<td>
			Litigation
		</td>
		<td>
			<span runat='server' id='spnLitigation'/>
		</td>
	</tr>
	<tr>
		<td>
			Property Acquisition<sup>1</sup>
		</td>
		<td>
			<span runat='server' id='spnPropertyAcq'/>
		</td>
	</tr>
	<tr>
		<td>
			Purchase Payments<sup>1</sup>
		</td>
		<td>
			<span runat='server' id='spnPurchasePmt'/>
		</td>
	</tr>
	<tr>
		<td>
			Contract Services to Client
		</td>
		<td>
			<span runat='server' id='spnContractClient'/>
		</td>
	</tr>
	<tr>
		<td>
			Contract Services to Applicant
		</td>
		<td>
			<span runat='server' id='spnContractApplicant'/>
		</td>
	</tr>
	<tr>
		<td>
			Other
		</td>
		<td>
			<span runat='server' id='spnOther'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>TOTAL NON-PERSONNEL</b>
		</td>
		<td>
			<b><span runat='server' id='spnNonPersonnel'/></b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td>
			<b>TOTAL SUBGRANT FUNDS</b>
		</td>
		<td>
			<b><span runat='server' id='spnTotal'/></b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td>
			<b>Subgrant Amount (from Subrecipient Profile form)</b>
		</td>
		<td>
			<b><span runat='server' id='spnSubgrantAmount'/></b>
		</td>
	</tr>
</table>
<br />
<div class="SeparatorHdg" width='100%'>Notes</div>
<br />
<table border='0' cellspacing='0' cellpadding='2' width='600px' class="notes">
	<tr>
		<td style="width:100px">
			<b>Note 1</b>
		</td>
		<td style="width:100px">
			<span runat='server' id='spnNote1'/>
		</td>
		<td>
			Is any one purchase as defined in 45 CFR &#167; 1630.5(b)(1) or (2) for $10,000 or more? If yes, please note that the subrecipient is required to obtain LSC's prior approval in advance of such a purchase. <em>See</em> 45 CFR &#167;&#167; 1630.2(h) and 1630.5. <em>See also</em> LSC Property Acquisition and Management Manual, 66 Fed. Reg. 47688 (Sept. 13, 2001), &#167; 3.
		</td>
	</tr>
</table>
<br />
<div class="SeparatorHdg" width='100%'>Additional Questions</div>
<table class="pagecontent" style="width:800px;">
	<tr>
		<td style="width:300px">
			<b>Has this subrecipient's most recent LSC fund balance been included in the Recipient's most recent fund balance?<font color='red'>*</font></b>
		</td>
		<td style="width:500px">
			<span runat='server' id='spnLscFundBalanceID'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>If not applicable, why?</b>
		</td>
		<td>
			<span runat='server' id='spnLscFundBalanceNotApplicable'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>If the answer is no, indicate the amount of LSC fund balance omitted</b>
		</td>
		<td>
			<span runat='server' id='spnLscFundBalanceOmitted'/>
		</td>
	</tr>
	<tr style="padding-bottom:1px">
		<td>
			<b>Transferred funds will be audited by<font color='red'>*</font></b>
		</td>
		<td colspan="3">
			<span runat='server' id='spnTransferFundsAudit'/><br />
		</td>
	</tr>
</table>
<br />
<div style="text-align:center">
	<span runat='server' id='spnSave'/>&nbsp;
	<span runat='server' id='spnSaveContinue'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscSubrecipientBudget' DataObjectDefinitionKey='LscSubrecipientBudget' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type="ModuleUser" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DefaultValues>
				<Argument Type="ModuleUser" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Lawyers'>
					<Control ID='txtLawyers'
						Type='cMoneyTextBox'
						Container='spnLawyers'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Lawyers" must be a whole number.'
						RegExErrorMessage='The field "Lawyers" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Lawyers".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Paralegals'>
					<Control ID='txtParalegals'
						Type='cMoneyTextBox'
						Container='spnParalegals'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Paralegals" must be a whole number.'
						RegExErrorMessage='The field "Paralegals" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Paralegals".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherStaff'>
					<Control ID='txtOtherStaff'
						Type='cMoneyTextBox'
						Container='spnOtherStaff'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Other Staff" must be a whole number.'
						RegExErrorMessage='The field "Other Staff" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Other Staff".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='EmployeeBenefits'>
					<Control ID='txtEmployeeBenefits'
						Type='cMoneyTextBox'
						Container='spnEmployeeBenefits'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Employee Benefits" must be a whole number.'
						RegExErrorMessage='The field "Employee Benefits" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Employee Benefits".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SpaceRent'>
					<Control ID='txtSpaceRent'
						Type='cMoneyTextBox'
						Container='spnSpaceRent'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Space - Rent/Lease" must be a whole number.'
						RegExErrorMessage='The field "Space - Rent/Lease" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Space - Rent/Lease".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SpaceMortgage'>
					<Control ID='txtSpaceMortgage'
						Type='cMoneyTextBox'
						Container='spnSpaceMortgage'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Space - Mortgage Payments" must be a whole number.'
						RegExErrorMessage='The field "Space - Mortgage Payments" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Space - Mortgage Payments".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SpaceOther'>
					<Control ID='txtSpaceOther'
						Type='cMoneyTextBox'
						Container='spnSpaceOther'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Space - Other Expenses" must be a whole number.'
						RegExErrorMessage='The field "Space - Other Expenses" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Space - Other Expenses".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='EquipRental'>
					<Control ID='txtEquipRental'
						Type='cMoneyTextBox'
						Container='spnEquipRental'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Equipment Rental" must be a whole number.'
						RegExErrorMessage='The field "Equipment Rental" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Equipment Rental".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OffSupplies'>
					<Control ID='txtOffSupplies'
						Type='cMoneyTextBox'
						Container='spnOffSupplies'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Office Supplies and Expenses" must be a whole number.'
						RegExErrorMessage='The field "Office Supplies and Expenses" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Office Supplies and Expenses".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Telephone'>
					<Control ID='txtTelephone'
						Type='cMoneyTextBox'
						Container='spnTelephone'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Telephone" must be a whole number.'
						RegExErrorMessage='The field "Telephone" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Telephone".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='TravelBoard'>
					<Control ID='txtTravelBoard'
						Type='cMoneyTextBox'
						Container='spnTravelBoard'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Travel - Board Members" must be a whole number.'
						RegExErrorMessage='The field "Travel - Board Members" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Travel - Board Members".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='TravelStaff'>
					<Control ID='txtTravelStaff'
						Type='cMoneyTextBox'
						Container='spnTravelStaff'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Travel - Staff and Other" must be a whole number.'
						RegExErrorMessage='The field "Travel - Staff and Other" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Travel - Staff and Other".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='TrainingBoard'>
					<Control ID='txtTrainingBoard'
						Type='cMoneyTextBox'
						Container='spnTrainingBoard'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Training - Board Members" must be a whole number.'
						RegExErrorMessage='The field "Training - Board Members" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Training - Board Members".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='TrainingStaff'>
					<Control ID='txtTrainingStaff'
						Type='cMoneyTextBox'
						Container='spnTrainingStaff'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Training - Staff and Other" must be a whole number.'
						RegExErrorMessage='The field "Training - Staff and Other" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Training - Staff and Other".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Library'>
					<Control ID='txtLibrary'
						Type='cMoneyTextBox'
						Container='spnLibrary'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Library" must be a whole number.'
						RegExErrorMessage='The field "Library" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Library".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Insurance'>
					<Control ID='txtInsurance'
						Type='cMoneyTextBox'
						Container='spnInsurance'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Insurance" must be a whole number.'
						RegExErrorMessage='The field "Insurance" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Insurance".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Dues'>
					<Control ID='txtDues'
						Type='cMoneyTextBox'
						Container='spnDues'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Dues and Fees" must be a whole number.'
						RegExErrorMessage='The field "Dues and Fees" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Dues and Fees".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Audit'>
					<Control ID='txtAudit'
						Type='cMoneyTextBox'
						Container='spnAudit'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Audit" must be a whole number.'
						RegExErrorMessage='The field "Audit" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Audit".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Litigation'>
					<Control ID='txtLitigation'
						Type='cMoneyTextBox'
						Container='spnLitigation'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Litigation" must be a whole number.'
						RegExErrorMessage='The field "Litigation" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Litigation".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PropertyAcq'>
					<Control ID='txtPropertyAcq'
						Type='cMoneyTextBox'
						Container='spnPropertyAcq'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Property Acquisition" must be a whole number.'
						RegExErrorMessage='The field "Property Acquisition" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Property Acquisition".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PurchasePmt'>
					<Control ID='txtPurchasePmt'
						Type='cMoneyTextBox'
						Container='spnPurchasePmt'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Purchase Payments" must be a whole number.'
						RegExErrorMessage='The field "Purchase Payments" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Purchase Payments".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractClient'>
					<Control ID='txtContractClient'
						Type='cMoneyTextBox'
						Container='spnContractClient'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Contract Services to Client" must be a whole number.'
						RegExErrorMessage='The field "Contract Services to Client" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Contract Services to Client".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractApplicant'>
					<Control ID='txtContractApplicant'
						Type='cMoneyTextBox'
						Container='spnContractApplicant'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Contract Services to Applicant" must be a whole number.'
						RegExErrorMessage='The field "Contract Services to Applicant" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Contract Services to Applicant".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other'>
					<Control ID='txtOther'
						Type='cMoneyTextBox'
						Container='spnOther'
						Format='#,0'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The field "Other" must be a whole number.'
						RegExErrorMessage='The field "Other" must be a whole number.'
						CommaErrorMessage='Commas are improperly formatted in the field "Other".'
						Size='10'
						MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Note1'>
					<Control ID='ctlNote1'
						Type='cRadioButtonList'
						Container='spnNote1'
						LoadParam='True'
						DefaultValue='False'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
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
					<Control ID='btnSaveContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscSubrecipientBudgetTotal' DataObjectDefinitionKey='LscSubrecipientBudgetTotal' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscSubrecipientBudget' DataObjectPropertyKey='LscSubrecipientBudgetID' PropertyKey='LscSubrecipientBudgetID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Personnel' Format='$#,0'>
					<Control ID='spnPersonnel'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NonPersonnel' Format='$#,0'>
					<Control ID='spnNonPersonnel'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Total' Format='$#,0'>
					<Control ID='spnTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscWfTASubgrant' DataObjectDefinitionKey='LscWfTASubgrant' Updatable='True' CreateNew='False' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SubgrantAmount' Format='$#,0'>
					<Control ID='spnSubgrantAmount' 
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscFundBalanceID'>
					<Control ID='ctlLscFundBalanceID'
						Type='cRadioButtonList'
						Container='spnLscFundBalanceID'
						DataObjectDefinitionKey='LscFundBalance'
						StoredValue='LscFundBalanceID'
						DisplayValue='Description' >
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscFundBalanceNotApplicable'>
					<Control ID='txtLscFundBalanceNotApplicable' 
						Type='cTextArea' 
						Container='spnLscFundBalanceNotApplicable' 
						Rows='3'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscFundBalanceOmitted'>
					<Control ID='txtLscFundBalanceOmitted' 
						Type='cMoneyTextBox' 
						Container='spnLscFundBalanceOmitted' 
					    AllowInputCommas='True'
					    MaxInputDecimalPlaces='0'
					    DecimalErrorMessage='The Amount of LSC Fund Balance omitted must be a whole number.'
						 RegExErrorMessage='The Amount of LSC Fund Balance omitted must be a whole number.'
						 CommaErrorMessage='Commas are incorrectly formatted in Amount of LSC Fund Balance omitted'
					    Size='10'
					    MaxLength='10' 
					    Format='#,0'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TransferFundsAudit'>
					<Control ID='ctlTransferFundsAudit'
						Type='cRadioButtonList'
						Container='spnTransferFundsAudit'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Recipient'/>
							<Parameter StoredValue='False' DisplayValue='Subrecipient'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
