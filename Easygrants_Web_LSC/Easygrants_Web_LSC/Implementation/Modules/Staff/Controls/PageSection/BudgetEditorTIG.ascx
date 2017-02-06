<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo' 
	Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
	runat='server' />
<br />
<table border='0' cellspacing='0' cellpadding='0' runat='server' id='tblBudget' width='100%'>
    <tr>
		
		<td width='25%' class='MinorSeparatorHdg'>&nbsp;</td>
		<td width='15%' class='MinorSeparatorHdg'>LSC Grant Request</td>
		<td width='15%' class='MinorSeparatorHdg'>Program Project Contributions</td>
		<td width='15%' class='MinorSeparatorHdg'>Other LSC- Funded Partners Funds</td>
		<td width='15%' class='MinorSeparatorHdg'>NON-LSC Funded Partners Funds</td>
		<td width='15%' class='MinorSeparatorHdg'>Total</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Personnel</b></td>
		<td><b>$</b><span runat='server' id='spnPersonnel1' /></td>
		<td><b>$</b><span runat='server' id='spnPersonnel2' /></td>
		<td><b>$</b><span runat='server' id='spnPersonnel3' /></td>
		<td><b>$</b><span runat='server' id='spnPersonnel4' /></td>
		<td><span runat='server' id='spnPersonnelTotal' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Fringe Benefits</b></td>
		<td><b>$</b><span runat='server' id='spnFringe1' /></td>
		<td><b>$</b><span runat='server' id='spnFringe2' /></td>
		<td><b>$</b><span runat='server' id='spnFringe3' /></td>
		<td><b>$</b><span runat='server' id='spnFringe4' /></td>
		<td><span runat='server' id='spnFringeTotal' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Space Cost (Rent/Lease)</b></td>
		<td><b>$</b><span runat='server' id='spnSpaceCost1' /></td>
		<td><b>$</b><span runat='server' id='spnSpaceCost2' /></td>
		<td><b>$</b><span runat='server' id='spnSpaceCost3' /></td>
		<td><b>$</b><span runat='server' id='spnSpaceCost4' /></td>
		<td><span runat='server' id='spnSpaceTotal' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Travel</b></td>
		<td><b>$</b><span runat='server' id='spnTravel1' /></td>
		<td><b>$</b><span runat='server' id='spnTravel2' /></td>
		<td><b>$</b><span runat='server' id='spnTravel3' /></td>
		<td><b>$</b><span runat='server' id='spnTravel4' /></td>
		<td><span runat='server' id='spnTravelTotal' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Equipment (Purchase)</b></td>
		<td><b>$</b><span runat='server' id='spnEquipPur1' /></td>
		<td><b>$</b><span runat='server' id='spnEquipPur2' /></td>
		<td><b>$</b><span runat='server' id='spnEquipPur3' /></td>
		<td><b>$</b><span runat='server' id='spnEquipPur4' /></td>
		<td><span runat='server' id='spnEquipPurTotal' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Equipment (Rental)</b></td>
		<td><b>$</b><span runat='server' id='spnEquipRent1' /></td>
		<td><b>$</b><span runat='server' id='spnEquipRent2' /></td>
		<td><b>$</b><span runat='server' id='spnEquipRent3' /></td>
		<td><b>$</b><span runat='server' id='spnEquipRent4' /></td>
		<td><span runat='server' id='spnEquipRentTotal' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Telecommunications Bandwidth Charges</b></td>
		<td><b>$</b><span runat='server' id='spnTelecom1' /></td>
		<td><b>$</b><span runat='server' id='spnTelecom2' /></td>
		<td><b>$</b><span runat='server' id='spnTelecom3' /></td>
		<td><b>$</b><span runat='server' id='spnTelecom4' /></td>
		<td><span runat='server' id='spnTelecomTotal' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Communications (Other)</b></td>
		<td><b>$</b><span runat='server' id='spnComm1' /></td>
		<td><b>$</b><span runat='server' id='spnComm2' /></td>
		<td><b>$</b><span runat='server' id='spnComm3' /></td>
		<td><b>$</b><span runat='server' id='spnComm4' /></td>
		<td><span runat='server' id='spnCommTotal' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Software</b></td>
		<td><b>$</b><span runat='server' id='spnSoftware1' /></td>
		<td><b>$</b><span runat='server' id='spnSoftware2' /></td>
		<td><b>$</b><span runat='server' id='spnSoftware3' /></td>
		<td><b>$</b><span runat='server' id='spnSoftware4' /></td>
		<td><span runat='server' id='spnSoftwareTotal' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Supplies</b></td>
		<td><b>$</b><span runat='server' id='spnSupplies1' /></td>
		<td><b>$</b><span runat='server' id='spnSupplies2' /></td>
		<td><b>$</b><span runat='server' id='spnSupplies3' /></td>
		<td><b>$</b><span runat='server' id='spnSupplies4' /></td>
		<td><span runat='server' id='spnSuppliesTotal' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Contracts</b></td>
		<td><b>$</b><span runat='server' id='spnContracts1' /></td>
		<td><b>$</b><span runat='server' id='spnContracts2' /></td>
		<td><b>$</b><span runat='server' id='spnContracts3' /></td>
		<td><b>$</b><span runat='server' id='spnContracts4' /></td>
		<td><span runat='server' id='spnContractsTotal' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Project Evaluation Costs</b></td>
		<td><b>$</b><span runat='server' id='spnEvalCost1' /></td>
		<td><b>$</b><span runat='server' id='spnEvalCost2' /></td>
		<td><b>$</b><span runat='server' id='spnEvalCost3' /></td>
		<td><b>$</b><span runat='server' id='spnEvalCost4' /></td>
		<td><span runat='server' id='spnEvalCostTotal' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Training</b></td>
		<td><b>$</b><span runat='server' id='spnTraining1' /></td>
		<td><b>$</b><span runat='server' id='spnTraining2' /></td>
		<td><b>$</b><span runat='server' id='spnTraining3' /></td>
		<td><b>$</b><span runat='server' id='spnTraining4' /></td>
		<td><span runat='server' id='spnTrainingTotal' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Project Audit Costs</b></td>
		<td><b>$</b><span runat='server' id='spnAuditCost1' /></td>
		<td><b>$</b><span runat='server' id='spnAuditCost2' /></td>
		<td><b>$</b><span runat='server' id='spnAuditCost3' /></td>
		<td><b>$</b><span runat='server' id='spnAuditCost4' /></td>
		<td><span runat='server' id='spnAuditCostTotal' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Other</b></td>
		<td><b>$</b><span runat='server' id='spnOther1' /></td>
		<td><b>$</b><span runat='server' id='spnOther2' /></td>
		<td><b>$</b><span runat='server' id='spnOther3' /></td>
		<td><b>$</b><span runat='server' id='spnOther4' /></td>
		<td><span runat='server' id='spnOtherTotal' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Total</b></td>
		<td><span runat='server' id='spnTotal1' /></td>
		<td><span runat='server' id='spnTotal2' /></td>
		<td><span runat='server' id='spnTotal3' /></td>
		<td><span runat='server' id='spnTotal4' /></td>
		<td><span runat='server' id='spnTotal5' /></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Percentages</b></td>
		<td><span runat='server' id='spnPercent1' /><b>%</b></td>
		<td><span runat='server' id='spnPercent2' /><b>%</b></td>
		<td><span runat='server' id='spnPercent3' /><b>%</b></td>
		<td><span runat='server' id='spnPercent4' /><b>%</b></td>
		<td><span runat='server' id='spnPercent5' /><b>%</b></td>	
	</tr>
	
</table>
<br />
<br />
<table id="Table3" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
	<td>
		<span runat='server' id='spnSave'/>
		<span runat='server' id='spnSaveAndClose'/>
		<span runat='server' id='spnCancel'/>		
	</td>
</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
     <ModuleSection>
        <DataObject Key='LscBudgetTig' DataObjectDefinitionKey='LscBudgetTig' Updatable='True' CreateNew='True'>
            <Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' 	Value='' Bool=''/>
			</Filters>
            <DisplayProperties>
                <DisplayProperty PropertyKey='Personnel1'>
					<Control ID='txtPersonnel1'
						Type='cMoneyTextBox'
						Container='spnPersonnel1'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Personnel2'>
					<Control ID='txtPersonnel2'
						Type='cMoneyTextBox'
						Container='spnPersonnel2'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Personnel3'>
					<Control ID='txtPersonnel3'
						Type='cMoneyTextBox'
						Container='spnPersonnel3'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Personnel4'>
					<Control ID='txtPersonnel4'
						Type='cMoneyTextBox'
						Container='spnPersonnel4'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='Fringe1'>
					<Control ID='txtFringe1'
						Type='cMoneyTextBox'
						Container='spnFringe1'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Fringe2'>
					<Control ID='txtFringe2'
						Type='cMoneyTextBox'
						Container='spnFringe2'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Fringe3'>
					<Control ID='txtFringe3'
						Type='cMoneyTextBox'
						Container='spnFringe3'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Fringe4'>
					<Control ID='txtFringe4'
						Type='cMoneyTextBox'
						Container='spnFringe4'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='SpaceCost1'>
					<Control ID='txtSpaceCost1'
						Type='cMoneyTextBox'
						Container='spnSpaceCost1'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SpaceCost2'>
					<Control ID='txtSpaceCost2'
						Type='cMoneyTextBox'
						Container='spnSpaceCost2'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SpaceCost3'>
					<Control ID='txtSpaceCost3'
						Type='cMoneyTextBox'
						Container='spnSpaceCost3'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SpaceCost4'>
					<Control ID='txtSpaceCost4'
						Type='cMoneyTextBox'
						Container='spnSpaceCost4'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='Travel1'>
					<Control ID='txtTravel1'
						Type='cMoneyTextBox'
						Container='spnTravel1'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Travel2'>
					<Control ID='txtTravel2'
						Type='cMoneyTextBox'
						Container='spnTravel2'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Travel3'>
					<Control ID='txtTravel3'
						Type='cMoneyTextBox'
						Container='spnTravel3'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Travel4'>
					<Control ID='txtTravel4'
						Type='cMoneyTextBox'
						Container='spnTravel4'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='EquipPurchase1'>
					<Control ID='txtEquipPur1'
						Type='cMoneyTextBox'
						Container='spnEquipPur1'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EquipPurchase2'>
					<Control ID='txtEquipPur2'
						Type='cMoneyTextBox'
						Container='spnEquipPur2'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EquipPurchase3'>
					<Control ID='txtEquipPur3'
						Type='cMoneyTextBox'
						Container='spnEquipPur3'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EquipPurchase4'>
					<Control ID='txtEquipPur4'
						Type='cMoneyTextBox'
						Container='spnEquipPur4'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='EquipRent1'>
					<Control ID='txtEquipRent1'
						Type='cMoneyTextBox'
						Container='spnEquipRent1'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EquipRent2'>
					<Control ID='txtEquipRent2'
						Type='cMoneyTextBox'
						Container='spnEquipRent2'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EquipRent3'>
					<Control ID='txtEquipRent3'
						Type='cMoneyTextBox'
						Container='spnEquipRent3'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EquipRent4'>
					<Control ID='txtEquipRent4'
						Type='cMoneyTextBox'
						Container='spnEquipRent4'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='Telecom1'>
					<Control ID='txtTelecom1'
						Type='cMoneyTextBox'
						Container='spnTelecom1'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Telecom2'>
					<Control ID='txtTelecom2'
						Type='cMoneyTextBox'
						Container='spnTelecom2'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Telecom3'>
					<Control ID='txtTelecom3'
						Type='cMoneyTextBox'
						Container='spnTelecom3'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Telecom4'>
					<Control ID='txtTelecom4'
						Type='cMoneyTextBox'
						Container='spnTelecom4'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='Comm1'>
					<Control ID='txtComm1'
						Type='cMoneyTextBox'
						Container='spnComm1'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comm2'>
					<Control ID='txtComm2'
						Type='cMoneyTextBox'
						Container='spnComm2'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comm3'>
					<Control ID='txtComm3'
						Type='cMoneyTextBox'
						Container='spnComm3'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comm4'>
					<Control ID='txtComm4'
						Type='cMoneyTextBox'
						Container='spnComm4'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='Software1'>
					<Control ID='txtSoftware1'
						Type='cMoneyTextBox'
						Container='spnSoftware1'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Software2'>
					<Control ID='txtSoftware2'
						Type='cMoneyTextBox'
						Container='spnSoftware2'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Software3'>
					<Control ID='txtSoftware3'
						Type='cMoneyTextBox'
						Container='spnSoftware3'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Software4'>
					<Control ID='txtSoftware4'
						Type='cMoneyTextBox'
						Container='spnSoftware4'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='Supplies1'>
					<Control ID='txtSupplies1'
						Type='cMoneyTextBox'
						Container='spnSupplies1'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Supplies2'>
					<Control ID='txtSupplies2'
						Type='cMoneyTextBox'
						Container='spnSupplies2'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Supplies3'>
					<Control ID='txtSupplies3'
						Type='cMoneyTextBox'
						Container='spnSupplies3'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Supplies4'>
					<Control ID='txtSupplies4'
						Type='cMoneyTextBox'
						Container='spnSupplies4'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='Contracts1'>
					<Control ID='txtContracts1'
						Type='cMoneyTextBox'
						Container='spnContracts1'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Contracts2'>
					<Control ID='txtContracts2'
						Type='cMoneyTextBox'
						Container='spnContracts2'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Contracts3'>
					<Control ID='txtContracts3'
						Type='cMoneyTextBox'
						Container='spnContracts3'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Contracts4'>
					<Control ID='txtContracts4'
						Type='cMoneyTextBox'
						Container='spnContracts4'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='EvalCost1'>
					<Control ID='txtEvalCost1'
						Type='cMoneyTextBox'
						Container='spnEvalCost1'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EvalCost2'>
					<Control ID='txtEvalCost2'
						Type='cMoneyTextBox'
						Container='spnEvalCost2'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EvalCost3'>
					<Control ID='txtEvalCost3'
						Type='cMoneyTextBox'
						Container='spnEvalCost3'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EvalCost4'>
					<Control ID='txtEvalCost4'
						Type='cMoneyTextBox'
						Container='spnEvalCost4'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='Training1'>
					<Control ID='txtTraining1'
						Type='cMoneyTextBox'
						Container='spnTraining1'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Training2'>
					<Control ID='txtTraining2'
						Type='cMoneyTextBox'
						Container='spnTraining2'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Training3'>
					<Control ID='txtTraining3'
						Type='cMoneyTextBox'
						Container='spnTraining3'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Training4'>
					<Control ID='txtTraining4'
						Type='cMoneyTextBox'
						Container='spnTraining4'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='AuditCost1'>
					<Control ID='txtAuditCost1'
						Type='cMoneyTextBox'
						Container='spnAuditCost1'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditCost2'>
					<Control ID='txtAuditCost2'
						Type='cMoneyTextBox'
						Container='spnAuditCost2'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditCost3'>
					<Control ID='txtAuditCost3'
						Type='cMoneyTextBox'
						Container='spnAuditCost3'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditCost4'>
					<Control ID='txtAuditCost4'
						Type='cMoneyTextBox'
						Container='spnAuditCost4'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='Other1'>
					<Control ID='txtOther1'
						Type='cMoneyTextBox'
						Container='spnOther1'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other2'>
					<Control ID='txtOther2'
						Type='cMoneyTextBox'
						Container='spnOther2'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other3'>
					<Control ID='txtOther3'
						Type='cMoneyTextBox'
						Container='spnOther3'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other4'>
					<Control ID='txtOther4'
						Type='cMoneyTextBox'
						Container='spnOther4'
						MaxLength='8'
						Size='8'
						MaxInputDecimalPlaces='1'
						RequiredField='True'
						DecimalErrorMessage='All entries must be Whole Numbers'
						RegExErrorMessage='All entries must be Whole Numbers'>	
					</Control>
				</DisplayProperty>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'
						EnterKey='True'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectStaffAffiliation' DataObjectPropertyKey='GranteeProjectStaffAffiliationID' PropertyKey='GranteeProjectStaffAffiliationID' BaseValue='GranteeProjectStaffAffiliationID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
               <DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	
            
            
            </DisplayProperties>
        </DataObject>
        
        <DataObject Key='vLSCBudgetTIG' DataObjectDefinitionKey='vLSCBudgetTIG' >
               <Filters>
				  <Argument Type='QueryString' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
			    </Filters>
			    <DisplayProperties>	
                        <DisplayProperty PropertyKey='Personnel' Format='$#,0'>
				             <Control ID='spnPersonnelTotal'
						            Type='HtmlGenericControl' />
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='Fringe' Format='$#,0'>
				            <Control ID='spnFringeTotal'
						            Type='HtmlGenericControl' />
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='SpaceCost' Format='$#,0'>
				             <Control ID='spnSpaceTotal'
						            Type='HtmlGenericControl' />
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='Travel' Format='$#,0'>
				             <Control ID='spnTravelTotal'
						            Type='HtmlGenericControl' />
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='EquipmentPurchase' Format='$#,0'>
				             <Control ID='spnEquipPurTotal'
						            Type='HtmlGenericControl' />
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='EquipmentRent' Format='$#,0'>
				             <Control ID='spnEquipRentTotal'
						            Type='HtmlGenericControl' />
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='Telecommunications' Format='$#,0'>
				           <Control ID='spnTelecomTotal'
						            Type='HtmlGenericControl' />
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='Communications' Format='$#,0'>
				           <Control ID='spnCommTotal'
						            Type='HtmlGenericControl' />
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='Software' Format='$#,0'>
				           <Control ID='spnSoftwareTotal'
						            Type='HtmlGenericControl' />
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='Supplies' Format='$#,0'>
				            <Control ID='spnSuppliesTotal'
						            Type='HtmlGenericControl' />
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='Contracts' Format='$#,0'>
				            <Control ID='spnContractsTotal'
						            Type='HtmlGenericControl' />
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='EvaluationCosts' Format='$#,0'>
				            <Control ID='spnEvalCostTotal'
						            Type='HtmlGenericControl' />
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='Training' Format='$#,0'>
				            <Control ID='spnTrainingTotal'
						            Type='HtmlGenericControl' />
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='AuditCosts' Format='$#,0'>
				            <Control ID='spnAuditCostTotal'
						            Type='HtmlGenericControl' />
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='Other' Format='$#,0'>
				            <Control ID='spnOtherTotal'
						            Type='HtmlGenericControl' />						       						        
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='GrantRequestTotal' Format='$#,0'>
				           <Control ID='spnTotal1'
						            Type='HtmlGenericControl'/>
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='ProgramProjectTotal' Format='$#,0'>
				            <Control ID='spnTotal2'
						            Type='HtmlGenericControl'/>
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='LscFundedTotal' Format='$#,0'>
				            <Control ID='spnTotal3'
						            Type='HtmlGenericControl'/>
			            </DisplayProperty>
				        <DisplayProperty PropertyKey='NonLscFundedTotal' Format='$#,0'>
				            <Control ID='spnTotal4'
						            Type='HtmlGenericControl'/>
					    </DisplayProperty>
				        <DisplayProperty PropertyKey='Total' Format='$#,0'>
				            <Control ID='spnTotal5'
						            Type='HtmlGenericControl'/>
					    </DisplayProperty>
                </DisplayProperties>
            </DataObject>
            <DataObject Key='vLSCBudgetTIGPercents' DataObjectDefinitionKey='vLSCBudgetTIGPercents' >
                <Filters>
				     <Argument Type='QueryString' 
					    TypeKey='GranteeProjectID' 
					    PropertyKey='GranteeProjectID' 
					    Value='' 
					    Bool=''/>
			    </Filters>
			    <DisplayProperties>	
			        <DisplayProperty PropertyKey='Percent1' Format='#,0'>
				            <Control ID='spnPercent1'
						            Type='HtmlGenericControl'/>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='Percent2' Format='#,0'>
				           <Control ID='spnPercent2'
						            Type='HtmlGenericControl'/>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='Percent3' Format='#,0'>
				            <Control ID='spnPercent3'
						            Type='HtmlGenericControl'/>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='Percent4' Format='#,0'>
				            <Control ID='spnPercent4'
						            Type='HtmlGenericControl'/>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='TotalPercent' Format='#,0'>
				            <Control ID='spnPercent5'
						            Type='HtmlGenericControl'/>
				    </DisplayProperty> 
			    
			    </DisplayProperties>
	        </DataObject>
			    
     </ModuleSection>
  </span>