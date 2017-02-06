<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Technology Budget (Form D-15)</h1></td>
	</tr>
	<tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
    </tr>
    <tr>
          <td colspan="4" >&nbsp;</td>
	</tr>
</table>
<table width='600' border="0" cellpadding="0" cellspacing="0">
    <tr>
          <td colspan="4" >
		  	<p>Form D-15 captures projected LSC and non-LSC expenses for the grant year for carrying out Applicant’s  Technology Plan.</p>
			<ul>
				<li><strong>All applicants must complete Form D-15.</strong></li>
				<li>Enter budgeted expense amounts in the fields below.</li>
				<li>Enter whole numbers without punctuation such as decimal points or dollar signs.</li>
				<li>To save the data and see the totals, click <strong>Save and Calculate</strong>.</li>
				<li>To continue to the next page, click <strong>Continue</strong>.</li>
			</ul>
			<p>At a minimum Form D-15 should indicate a planned budget for:</p>
			<ul>
				<li>software and hardware acquisition costs (i.e. <strong>Equipment (Purchase)</strong>, <strong>Equipment (Rental)</strong> and <strong>Software</strong>)</li>
				<li>software and hardware maintenance costs (i.e. <strong>Contracts</strong>)</li>
				<li>IT staffing costs (i.e. <strong>Program IT Staffing Costs</strong> and <strong>External IT Staffing Costs</strong>) </li>
				<li>staff training costs (i.e. <strong>Training for IT Staff</strong> and <strong>Technology Training for other Staff</strong>)</li>
			</ul>

			<p><strong>Additional Requirement</strong></p>
			<ul>
				<li>
					Applicants must provide an explanatory note for each budget line item that exceeds zero.  Upload the explanatory notes in a separate document on the Uploads site.  With each explanatory note, include the budgeted expense amount and the budget expense item.  The following is a sample explanatory note for “program IT staffing costs.”  <em>Program IT Staffing Costs, $120,000: Applicant requires a total of 1.5 FTE’s to manage and coordinate technology planning, acquisition, maintenance, and administration during the grant year.</em>
				</li>
			</ul>
            <p><strong>Follow the steps below for assistance on this form: </strong></p>
            <ul>
              <li> Submit inquiries pertaining to technical issues, using the website application, and uploading files to <a href="mailto:techsupport@lsc.gov"> techsupport@lsc.gov</a>. </li>
              <li> Submit all other inquiries regarding this form or the grants process to the LSC Competition Service Desk at <a href="mailto:competition@lsc.gov"> competition@lsc.gov</a>. </li>
              <li> Contact Reginald Haley at <a href="mailto:haleyr@lsc.gov"> haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours.</li>
            </ul>
		</td>
        <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
    </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
        <td colspan='3' class="SeparatorHdg" >Technology Budget Form</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr style="background-color:#DDDDDD">
        <td width='5%'>&nbsp;</td>
        <td width='55%'><b></b></td>
		<td width='40%'><b>Expenditures ($)</b></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>1. Program IT Staffing Costs <font color='red'>*</font></b></td>
	    <td><span runat='server' id='spnProgramStaffCosts' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>2. External IT Staffing Costs <font color='red'>*</font></b></td>
	    <td><span runat='server' id='spnExternalStaffCosts' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>3. Space Cost (Rent/Lease) <font color='red'>*</font></b></td>
	    <td><span runat='server' id='spnSpaceCost' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>4. Travel <font color='red'>*</font></b></td>
	    <td><span runat='server' id='spnTravel' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>5. Equipment (Purchase) <font color='red'>*</font></b></td>
	    <td><span runat='server' id='spnEquipmentPurchase' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>6. Equipment (Rental) <font color='red'>*</font></b></td>
	    <td><span runat='server' id='spnEquipmentRental' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>7. Telecommunications bandwidth charges <font color='red'>*</font></b></td>
	    <td><span runat='server' id='spnTelecomBandwidthCharges' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>8. Communications (Other) <font color='red'>*</font></b></td>
	    <td><span runat='server' id='spnOtherCommunications' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>9. Software <font color='red'>*</font></b></td>
	    <td><span runat='server' id='spnSoftwareBudget' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>10. Supplies <font color='red'>*</font></b></td>
	    <td><span runat='server' id='spnSuppliesBudget' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>11. Contracts <font color='red'>*</font></b></td>
	    <td><span runat='server' id='spnContracts' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>12. Training for IT Staff <font color='red'>*</font></b></td>
	    <td><span runat='server' id='spnTrainingStaff' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>13. Technology Training for other Staff <font color='red'>*</font></b></td>
	    <td><span runat='server' id='spnTrainingOtherStaff' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>14. Other <font color='red'>*</font></b></td>
	    <td><span runat='server' id='spnOtherBudget' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>15. Total</b></td>
	    <td><b><span runat='server' id='spnTotal' /></b></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>	
</table>
<br />
<br />
<br />
<br />
<table width='100%'>
	<tr>
		<td align=center>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnContinue' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'> 
	<ModuleSection> 
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
	    </DataObject>
	    
	    <DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	    </DataObject>
	
	
	    <DataObject Key='LSCTECHNOLOGYBUDGET' DataObjectDefinitionKey='LSCTECHNOLOGYBUDGET' Updatable='True' CreateNew='True'>
	       <Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</DefaultValues>
	        <DisplayProperties>
	                <DisplayProperty PropertyKey='ProgramStaffCosts'>
					    <Control ID='txtProgramStaffCosts'
						    Type='cMoneyTextBox'
						    Container='spnProgramStaffCosts'
						    AllowInputCommas='True'
						    MaxInputDecimalPlaces='0'
						    DecimalErrorMessage='The field "Program IT Staffing Costs" must be a whole number.'
						    RegExErrorMessage='The field "Program IT Staffing Costs" must be a whole number.'
						    Size='10'
						    MaxLength='10' >
						</Control>
					</DisplayProperty>
				    <DisplayProperty PropertyKey='ExternalStaffCosts'>
					    <Control ID='txtExternalStaffCosts'
						    Type='cMoneyTextBox'
						    Container='spnExternalStaffCosts'
						    AllowInputCommas='True'
						    MaxInputDecimalPlaces='0'
						    DecimalErrorMessage='The field "External IT Staffing Costs" must be a whole number.'
						    RegExErrorMessage='The field "External IT Staffing Costs" must be a whole number.'
						    Size='10'
						    MaxLength='10'/>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='SpaceCost'>
					    <Control ID='txtSpaceCost'
						    Type='cMoneyTextBox'
						    Container='spnSpaceCost'
						    AllowInputCommas='True'
						    MaxInputDecimalPlaces='0'
						    DecimalErrorMessage='The field "Space Cost (Rent/Lease)" must be a whole number.'
						    RegExErrorMessage='The field "Space Cost (Rent/Lease)" must be a whole number.'
						    Size='10'
						    MaxLength='10' />
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='Travel'>
					    <Control ID='txtTravel'
						    Type='cMoneyTextBox'
						    Container='spnTravel'
						    AllowInputCommas='True'
						    MaxInputDecimalPlaces='0'
						    DecimalErrorMessage='The field "Travel" must be a whole number.'
						    RegExErrorMessage='The field "Travel" must be a whole number.'
						    Size='10'
						    MaxLength='10' />
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='EquipmentPurchase'>
					    <Control ID='txtEquipmentPurchase'
						    Type='cMoneyTextBox'
						    Container='spnEquipmentPurchase'
						    AllowInputCommas='True'
						    MaxInputDecimalPlaces='0'
						    DecimalErrorMessage='The field "Equipment (Purchase)" must be a whole number.'
						    RegExErrorMessage='The field "Equipment (Purchase)" must be a whole number.'
						    Size='10'
						    MaxLength='10' />
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='EquipmentRental'>
					    <Control ID='txtEquipmentRental'
						    Type='cMoneyTextBox'
						    Container='spnEquipmentRental'
						    AllowInputCommas='True'
						    MaxInputDecimalPlaces='0'
						    DecimalErrorMessage='The field "Equipment (Rental)" must be a whole number.'
						    RegExErrorMessage='The field "Equipment (Rental)" must be a whole number.'
						    Size='10'
						    MaxLength='10' />
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='TelecomBandwidthCharges'>
					    <Control ID='txtTelecomBandwidthCharges'
						    Type='cMoneyTextBox'
						    Container='spnTelecomBandwidthCharges'
						    AllowInputCommas='True'
						    MaxInputDecimalPlaces='0'
						    DecimalErrorMessage='The field "Telecommunications bandwidth charges" must be a whole number.'
						    RegExErrorMessage='The field "Telecommunications bandwidth charges" must be a whole number.'
						    Size='10'
						    MaxLength='10' />
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='OtherCommunications'>
					    <Control ID='txtOtherCommunications'
						    Type='cMoneyTextBox'
						    Container='spnOtherCommunications'
						    AllowInputCommas='True'
						    MaxInputDecimalPlaces='0'
						    DecimalErrorMessage='The field "Communications (Other)" must be a whole number.'
						    RegExErrorMessage='The field "Communications (Other)" must be a whole number.'
						    Size='10'
						    MaxLength='10'/>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='SoftwareBudget'>
					    <Control ID='txtSoftwareBudget'
						    Type='cMoneyTextBox'
						    Container='spnSoftwareBudget'
						    AllowInputCommas='True'
						    MaxInputDecimalPlaces='0'
						    DecimalErrorMessage='The field "Software " must be a whole number.'
						    RegExErrorMessage='The field "Software " must be a whole number.'
						    Size='10'
						    MaxLength='10' />
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='SuppliesBudget'>
					    <Control ID='txtSuppliesBudget'
						    Type='cMoneyTextBox'
						    Container='spnSuppliesBudget'
						    AllowInputCommas='True'
						    MaxInputDecimalPlaces='0'
						    DecimalErrorMessage='The field "Supplies " must be a whole number.'
						    RegExErrorMessage='The field "Supplies " must be a whole number.'
						    Size='10'
						    MaxLength='10' />
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='Contracts'>
					    <Control ID='txtContracts'
						    Type='cMoneyTextBox'
						    Container='spnContracts'
						    AllowInputCommas='True'
						    MaxInputDecimalPlaces='0'
						    DecimalErrorMessage='The field "Contracts " must be a whole number.'
						    RegExErrorMessage='The field "Contracts " must be a whole number.'
						    Size='10'
						    MaxLength='10' />
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='TrainingStaff'>
					    <Control ID='txtTrainingStaff'
						    Type='cMoneyTextBox'
						    Container='spnTrainingStaff'
						    AllowInputCommas='True'
						    MaxInputDecimalPlaces='0'
						    DecimalErrorMessage='The field "Training for IT Staff" must be a whole number.'
						    RegExErrorMessage='The field "Training for IT Staff" must be a whole number.'
						    Size='10'
						    MaxLength='10' />
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='TrainingOtherStaff'>
					    <Control ID='txtTrainingOtherStaff'
						    Type='cMoneyTextBox'
						    Container='spnTrainingOtherStaff'
						    AllowInputCommas='True'
						    MaxInputDecimalPlaces='0'
						    DecimalErrorMessage='The field "Technology Training for other Staff" must be a whole number.'
						    RegExErrorMessage='The field "Technology Training for other Staff" must be a whole number.'
						    Size='10'
						    MaxLength='10' />
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='OtherBudget'>
					    <Control ID='txtOtherBudget'
						    Type='cMoneyTextBox'
						    Container='spnOtherBudget'
						    AllowInputCommas='True'
						    MaxInputDecimalPlaces='0'
						    DecimalErrorMessage='The field "Other " must be a whole number.'
						    RegExErrorMessage='The field "Other " must be a whole number.'
						    Size='10'
						    MaxLength='10' />
				    </DisplayProperty>
	        </DisplayProperties>
	     </DataObject>
	     
	     <DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save and Calculate'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Caption='Continue'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTechnologyBudgetTotal' DataObjectDefinitionKey='LscTechnologyBudgetTotal' Updatable='True' CreateNew='True'>
			 <Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
	        <DisplayProperties>
	                <DisplayProperty PropertyKey='BudgetTotal'>
					        <Control ID='spnTotal'
						            Type='HtmlGenericControl'/>
				    </DisplayProperty>
	        </DisplayProperties>
	    </DataObject>
		
	</ModuleSection>
</span>
