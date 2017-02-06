<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cProject_Information" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>



<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Project Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table2">
<!-- Control Label (for Project information) -->
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width='200'><b>Brief Description</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span id='spnDescription' runat='server'/>
			<br>
			<font size='1'>Limit: 1000 characters</font>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td	valign="top" ><b>Project Start Date</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span id='spnDurationStart' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>(MM/DD/YYYY)</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" ><b>Project End Date</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span id='spnDurationEnd' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>(MM/DD/YYYY)</td>	
	</tr>	
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td	valign="top" ><b>Grant Request Amount</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span id='spnDollarRequest' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td><font size='1'>(Enter whole numbers only. Do not enter commas, decimals, or dollar signs.)</font></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td	valign="top" ><b>Additional Key Staff</b></td>
		<td>
			<span id='spnAdditionalStaff' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>		
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table3"  visible="false">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Discipline of Principal Investigator's Most Advanced Degree</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>	
	<tr><td colspan='4'>Select the applicable discipline and click <b>Add</b> to move the phrase from the Available column to the Selected column.&nbsp;<%=kDenoteRequiredField%></td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table4" visible="false">
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="200"></td>
		<td>
			<span id='spnFieldOfStudy' runat='server'/>
			<asp:CustomValidator
				runat='server'
				id='valField'
				Display='None'
				OnServerValidate='ValidateFieldOfStudy'
				ErrorMessage="Discipline of Principal Investigator's Most Advanced Degree is required."/>	
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr><td>&nbsp;</td></tr>		
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table5" visible="false">
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Project Demographics</b></td>
	</tr>   
<!-- Control Label (for Project information) -->
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width="200"><b>Age Range of Study Participants</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span id='spnAgeBegin' runat='server'/>&nbsp;&nbsp;&nbsp;
			<asp:CustomValidator
				runat='server'
				id='valAgeBegin'
				Display='None'
				OnServerValidate='ValidateAgeBegin'
				ErrorMessage='Begin Age is required.'/>
			<span id='spnAgeEnd' runat='server'/>
			<asp:CustomValidator
				runat='server'
				id='valAgeEnd'
				Display='None'
				OnServerValidate='ValidateAgeEnd'
				ErrorMessage='End Age is required.'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Begin Age 
			&nbsp;&nbsp;&nbsp;
			End Age
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<span id='spnNotApplicableAge' runat='server'/>Not Applicable
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><i>Check all that apply.</i></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table6" visible="false">
	<tr>
		<td	width='200'><b>Gender</b>&nbsp;<%=kDenoteRequiredField%></td>
	    <td><span id='spnGender' runat='server'/>
			<asp:CustomValidator
				runat='server'
				id='valGender'
				Display='None'
				OnServerValidate='ValidateGender'
				ErrorMessage='At least one selection for Gender is required.'/>
	    </td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
		<td width='15%' ><b>Race/Ethnicity</b>&nbsp;<%=kDenoteRequiredField%></td>
	    <td><span id='spnRace' runat='server'/>
			<asp:CustomValidator
				runat='server'
				id='valRace'
				Display='None'
				OnServerValidate='ValidateRace'
				ErrorMessage='At least one selection for Race/Ethnicity is required.'/>	
	    </td>
    </tr>
	<tr><td>&nbsp;</td></tr>
	<tr >
	    <td width='15%' ><b>Income</b>&nbsp;<%=kDenoteRequiredField%></td>
	    <td><span id='spnIncome' runat='server'/>
			<asp:CustomValidator
				runat='server'
				id='valIncome'
				Display='None'
				OnServerValidate='ValidateIncome'
				ErrorMessage='At least one selection for Income is required.'/>	
	    </td>
    </tr>
	<tr><td>&nbsp;</td></tr>
	<tr >
	    <td width='15%' ><b>Locale</b>&nbsp;<%=kDenoteRequiredField%></td>
	    <td><span id='spnLocale' runat='server'/>
			<asp:CustomValidator
				runat='server'
				id='valLocale'
				Display='None'
				OnServerValidate='ValidateLocale'
				ErrorMessage='At least one selection for Locale is required.'/>	
	    </td>
    </tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>			
</table>
<table id='tbOld' runat='server' visible='false'>	
	<tr>
		<td><b>Sexual Orientation</b></td>
		<td>
			<span id='spnDemographicBisexual' runat='server'/>Both-sex orientations, 
			behaviors, or identities (bisexual)
			<asp:CustomValidator
				runat='server'
				id='valSexOrient'
				Display='None'
				OnServerValidate='ValidateSexOrient'
				ErrorMessage='At least one selection for Sexual Orientation is required.'/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<span id='spnDemographicHeterosexual' runat='server'/>Heterosexual
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<span id='spnDemographicQuestioning' runat='server'/>Questioning
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<span id='spnDemographicGay' runat='server'/>Same-sex orientations, 
			behaviors, or identities (gay, lesbian)
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<span id='spnDemographicTransgender' runat='server'/>Transgender
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>Disability</b></td>
		<td>
			<span id='spnDisability' runat='server'/>Yes
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
</table>


<table id='tbSearchParameters' width='100%' runat='server' visible='true'>
	<tr>
		<td></td>
		<td>
			<!-- Save Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSave' visible='true'/> 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<!--<DisplayProperty PropertyKey='GranteeProjGenders'>
					<Control ID='ctlGender'
						Container='spnGender'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='Gender'
						DisplayValue='Abbr'
						StoredValue='GenderID'
						RepeatColumns='0'
						CellSpacing='7'>
						<DefaultValues>
							<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Gender' Bool='' />
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProjRace'>
					<Control ID='ctlRace'
						Container='spnRace'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='Race'
						DisplayValue='RaceAbbr'
						StoredValue='RaceID'
						RepeatColumns='0'
						CellSpacing='7'>
						<DefaultValues>
							<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Race' Bool='' />
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProjIncome'>
					<Control ID='ctlIncome'
						Container='spnIncome'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='IncomeType'
						DisplayValue='IncomeAbbr'
						StoredValue='IncomeTypeID'
						RepeatColumns='0'
						CellSpacing='7'>
						<DefaultValues>
							<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Income' Bool='' />
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProjLocale'>
					<Control ID='ctlLocale'
						Container='spnLocale'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='LocaleType'
						DisplayValue='LocaleAbbr'
						StoredValue='LocaleTypeID'
						RepeatColumns='0'
						CellSpacing='7'>
						<DefaultValues>
							<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Locale' Bool='' />
						</DefaultValues>
					</Control>
				</DisplayProperty>-->
			
			</DisplayProperties>
		</DataObject>

		<DataObject Key='GranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='AdditionalStaff'>
					<Control ID='ctlAdditionalStaff'
						Container='spnAdditionalStaff'
						Type='cTextArea'
						MaxLength='300'
						Rows='4'
						Cols='50'
						RequiredField='False'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,300}$' ErrorMessage='Limit your Additional Staff to 300 characters or less.' />
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='DurationStart'>
					<Control ID='ctlDurationStart'
						Container='spnDurationStart'
						Type='cDateTextBox'
						DateFormat='MM/dd/yyyy'
						Calendar='True'
						Size='25'
						MaxLength='25'
						RequiredField='True'
						ErrorMessage='Project Start Date is required.'
						NotSupportedDateErrorMessage='Valid Project Start Date is required.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DurationEnd'>
					<Control ID='ctlDurationEnd'
						Container='spnDurationEnd'
						Type='cDateTextBox'
						DateFormat='MM/dd/yyyy'
						Calendar='True'
						Size='25'
						MaxLength='25'
						RequiredField='True'
						ErrorMessage='Project End Date is required.'
						NotSupportedDateErrorMessage='Valid Project End Date is required.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DollarRequest'>
					<Control ID='ctlDollarRequest'
						Container='spnDollarRequest'
						Type='cTextBox'
						Size='10'
						MaxLength='12'
						RequiredField='True'
						ErrorMessage='Grant Request Amount is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^[+]?\d*$' ErrorMessage='Valid Grant Request Amount is required. Do not use decimals or commas.' />
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextArea'
						Rows='15'
						Cols='50'
						MaxLength='1000'
						TooLongMessage='Limit your Brief Description to 1000 characters.'
						RequiredField='True'
						ErrorMessage='Brief Description is required.'/>
				</DisplayProperty>
			<!--	<DisplayProperty PropertyKey='AgeBegin'>
					<Control ID='ctlAgeBegin'
						Container='spnAgeBegin'
						Type='cTextBox'
						Size='3'
						MaxLength='3'>
						<Validation Type='RegularExpression' ValidationExpression='^\d{0,}$' ErrorMessage='Begin Age for Age Range of Study Participants must be a number.' />
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AgeEnd'>
					<Control ID='ctlAgeEnd'
						Container='spnAgeEnd'
						Type='cTextBox'
						Size='3'
						MaxLength='3'>
						<Validation Type='RegularExpression' ValidationExpression='^\d{0,}$' ErrorMessage='End Age for Age Range of Study Participants must be a number.' />
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='NotApplicableAge'>
					<Control ID='ctlNotApplicableAge'
						Container='spnNotApplicableAge'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='NotApplicableAge'>
					</Control>	
				</DisplayProperty>	-->			
				<!--<DisplayProperty PropertyKey='PersonFields'>
					<Control ID='ctlFieldOfStudy'
						Container='spnFieldOfStudy'
						Type='cDoubleListBox'
						DataObjectDefinitionKey='Field'
						DisplayValue='Field'
						StoredSourceValue='FieldID'
						StoredValue='FieldID'
						StoredDisplayValue='Field.Field' 
						Height='19'
						RequiredField='False'
						ErrorMessage='Please provide a Field.'
						DisplayNone='False'>
						<DefaultValues>
							<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
						</DefaultValues>
						<Sort>
							<Argument PropertyKey='Field' Direction='Ascending'/>
						</Sort>
					</Control>
				</DisplayProperty>-->
				<DisplayProperty PropertyKey='DemographicBisexual'>
					<Control ID='ctlDemographicBisexual'
						Container='spnDemographicBisexual'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='DemographicBisexual'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DemographicHeterosexual'>
					<Control ID='ctlDemographicHeterosexual'
						Container='spnDemographicHeterosexual'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='DemographicHeterosexual'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DemographicQuestioning'>
					<Control ID='ctlDemographicQuestioning'
						Container='spnDemographicQuestioning'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='DemographicQuestioning'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DemographicGay'>
					<Control ID='ctlDemographicGay'
						Container='spnDemographicGay'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='DemographicGay'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DemographicTransgender'>
					<Control ID='ctlDemographicTransgender'
						Container='spnDemographicTransgender'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='DemographicTransgender'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Disability'>
					<Control ID='ctlDisability'
						Container='spnDisability'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='Disability'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
