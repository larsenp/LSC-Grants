<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cPersonalData_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Personal Data</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width='20%'><b>Social Security Number</b></td>
		<td><span id='spnSSN' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Enter only the last 4 digits (numbers only)</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Date of Birth</b></td>
		<td><span id='spnDateOfBirth' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>MM/DD/YYYY</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Gender</b></td>
		<td><span id='spnGender' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Ethnicity</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td colspan='2'>Do you consider yourself to be Hispanic or Latino?</td></tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'><span id='spnEthnicity' runat='server'/>
		
			<asp:CustomValidator 
				id='valEthnicity'
				runat='server'
				OnServerValidate='ValidateEthnicity'
				ErrorMessage='If you select "Hispanic or Latino" as an Ethnicity, you cannot select from Race.'
				Display='None'/>	
		
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Race</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			For the purposes of reporting mixed racial origins, please select 
			one or more of the racial categories that most closely reflects your recognition in the 
			community.
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'><span id='spnRace' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>				
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' visible='false'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Tenure</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' visible='false'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>The following information is requested for program evaluation purposes.  Data 
							will be reported in aggregate statistical form only.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width='20%'><b>Do you have tenure?</b></td>
		<td><span id='spnTenure' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width='20%'><b>Tenure year (if applicable):</b></td>
		<td><span id='spnTenureYear' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>YYYY</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Buttons -->
<table cellpadding='0' cellspacing='0' border='0' width='80%'	
	<tr>
		<td colspan="2" align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveAndContinue'/> 
			<span runat='server' id='spnClose'/> 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>


		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SSN'>
					<Control ID='ctlSSN'
						Container='spnSSN'
						Type='cTextBox'
						Size='20'
						MaxLength='4'
						TooLongMessage='Enter only the last 4 digits of your Social Security Number.'
						RequiredField='False'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{4,4}\s?$' ErrorMessage='Enter last 4 digits for your Social Security Number.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DateOfBirth'>
					<Control ID='ctlDateOfBirth'
						Container='spnDateOfBirth'
						Type='cDateTextBox'
						Size='25'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='The date entered in the Date of Birth field is invalid or not formatted properly.'
						RequiredField='False'
						ErrorMessage='Date of your First full-time faculty/staff appointment is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GenderID'>
					<Control ID='ctlGender'
						Container='spnGender'
						Type='cDropDown'
						DataObjectDefinitionKey='Gender'
						StoredValue='GenderID'
						DisplayValue='Gender'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='EthnicityID'>
					<Control ID='ctlEthnicity'
						Container='spnEthnicity'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						RequiredField='False'
						DataObjectDefinitionKey='Ethnicity'
						StoredValue='EthnicityID'
						DisplayValue='EthnicityDesc'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PersonRaces'>
					<Control ID='ctlRace'
						Container='spnRace'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='Race'
						DisplayValue='RaceDesc'
						StoredValue='RaceID'
						RepeatColumns='0'
						CellSpacing='12'>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='Person' PropertyKey='PersonID' DataObjectPropertyKey='PersonID' Value='' CreateNew='True' Update='True'/>
						</DefaultValues>
						<Filters>
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TenureID'>
					<Control ID='ctlTenure'
						Container='spnTenure'
						Type='cDropDown'
						DataObjectDefinitionKey='Tenure'
						StoredValue='TenureID'
						DisplayValue='TenureDesc'>
						<Sort>
							<Argument PropertyKey='TenureDesc' />
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='TenureYear'>
					<Control ID='ctlTenureYear'
						Container='spnTenureYear'
						Type='cTextBox'
						Size='10'
						MaxLength='4'
						AllowNumbersOnly='True'
						RequiredField='False'
						AllowNumbersOnly='True'>
						<Validation Type='RegularExpression' ValidationExpression='^[+]?\d*$' ErrorMessage='Tenure year is required. Numbers only.' />
					</Control>
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>


		<DataObject Key='GranteeProjectPI' DataObjectDefinitionKey='GranteeProjectPI' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='PITypeID' Value='1'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='PITypeID' Value='1'/>
			</DefaultValues>
			<DisplayProperties>

			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
