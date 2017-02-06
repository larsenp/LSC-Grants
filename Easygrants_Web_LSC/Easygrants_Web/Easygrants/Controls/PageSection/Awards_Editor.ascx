<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cAwards_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />
		
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Current Awards</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='90%'>
	<tr>
		<td valign='top'><font color='red'>*</font>&nbsp;Indicate total annual research funding available to the applicant, direct 
			funds exclusive of applicant's salary/fringes and intramural funding, as of 
			award activation date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$&nbsp;<span id='spnFundingTotal' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>Please indicate any of the following awards you have received or currently hold:</b></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td nowrap='true'><span id='spnCurrentAwards' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server'>	
	<tr><td colspan='2'>Other (please specify):</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='8%'><span id='spnIsOther1' runat='server'/></td>
		<td><span id='spnOtherText1' runat='server'/>
			<asp:CustomValidator 
				id='valOther1'
				runat='server'
				OnServerValidate='ValidateOther1'
				ErrorMessage='If you select the first "Other" check box, you must indicate a description in the corresponding textbox.'
				Display='None'/>
			<asp:CustomValidator 
				id='valOther1b'
				runat='server'
				OnServerValidate='ValidateOther1b'
				ErrorMessage='If you do not select the first "Other" check box, you must not indicate a description in the corresponding textbox.'
				Display='None'/>
		</td>
	</tr>	
	<tr>
		<td><span id='spnIsOther2' runat='server'/></td>
		<td><span id='spnOtherText2' runat='server'/>
			<asp:CustomValidator 
				id='valOther2'
				runat='server'
				OnServerValidate='ValidateOther2'
				ErrorMessage='If you select the second "Other" check box, you must indicate a description in the corresponding textbox.'
				Display='None'/>
			<asp:CustomValidator 
				id='valOther2b'
				runat='server'
				OnServerValidate='ValidateOther2b'
				ErrorMessage='If you do not select the second "Other" check box, you must not indicate a description in the corresponding textbox.'
				Display='None'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>




<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	
		<DataObject Key='GranteeProjectPI' DataObjectDefinitionKey='GranteeProjectPI' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FundingAwardsTotal'>
					<Control ID='ctlFundingTotal'
						Container='spnFundingTotal'
						Type='cMoneyTextBox'
						MaxLength='14'
						Format='#,0.00'
						Size='20'
						RequiredField='True'
						MaxInputDecimalPlaces='2'
						RegExErrorMessage='Total Annual Research Funding amount must contain only digits, commas, and hyphens.'
						DecimalErrorMessage='Total Annual Research Funding amount must be a number with up to 2 decimals.'
						CommaErrorMessage='Commas are improperly formatted in Total Annual Research Funding amount.'
						ErrorMessage='Total Annual Research Funding amount is required.'/>
				</DisplayProperty>							
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<!-- <DisplayProperty PropertyKey='IsOther'>
					<Control ID='ctlIsOther'
						Container='spnIsOther'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='Primary'>
					</Control>	
				</DisplayProperty> -->
				<DisplayProperty PropertyKey='PersonCurrentAwards'>
					<Control ID='ctlCurrentAwards'
						Container='spnCurrentAwards'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='CurrentAward'
						DisplayValue='CurrentAwardDesc'
						StoredValue='CurrentAwardID'
						RepeatColumns='2'
						CellSpacing='8'
						CellPadding='0'>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='GranteeProjectPI' PropertyKey='PersonID' DataObjectPropertyKey='PersonID' Value='' />
						</DefaultValues>
						<Filters>
								<Argument PropertyKey='SortOrder' Value='0' Operator='NotEqual' />
						</Filters>
					</Control>
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>	

		<DataObject Key='PersonCurrentAward' DataObjectDefinitionKey='PersonCurrentAward'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='Data' TypeKey='CurrentAwardID' PropertyKey='CurrentAwardID' Value='27' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsOther1'>
					<Control ID='ctlIsOther1'
						Container='spnIsOther1'
						Type='cCheckBox'
						StoredValue='1'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherSpecify1'>
					<Control ID='ctlOtherText1'
						Container='spnOtherText1'
						Type='cTextBox'
						Size='75'
						MaxLength='100'>
					</Control>
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>				

		<DataObject Key='PersonCurrentAward2' DataObjectDefinitionKey='PersonCurrentAward'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='Data' TypeKey='CurrentAwardID' PropertyKey='CurrentAwardID' Value='28' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsOther2'>
					<Control ID='ctlIsOther2'
						Container='spnIsOther2'
						Type='cCheckBox'
						StoredValue='1'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='OtherSpecify2'>
					<Control ID='ctlOtherText2'
						Container='spnOtherText2'
						Type='cTextBox'
						Size='75'
						MaxLength='100'>
					</Control>
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>				
		<!-- 
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
				<DisplayProperty PropertyKey='Organization.OrganizationName'>
					<Control ID='ctlOrgSelectLauncher' 
					Type='cOrgSelectLauncherNotInList'
					Container='spnOrgSelectLauncher'
					HiddenValueKey='OrganizationID'
					DataObjectDefinitionKey='Organization'
					StoredValue='OrganizationID'
					DisplayValue='OrganizationName'
					RequiredField='True'
					ErrorMessage='You must select an Institution.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='20'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='You must enter a Current Title.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AwardTitle'>
					<Control ID='ctlAwardTitle'
						Container='spnAwardTitle'
						Type='cTextBox'
						Size='20'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='You must enter an Award Title.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CurrentAcademicPositionID'>
					<Control ID='ctlCurrentAcademicPosition'
						Container='spnCurrentAcademicPosition'
						Type='cDropDown'
						DataObjectDefinitionKey='AcademicPosition'
						StoredValue='AcademicPositionID'
						DisplayValue='AcademicPositionDesc'
						RequiredField='True'
						ErrorMessage='You must select a Current Academic Position.'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AwardAcademicPositionID'>
					<Control ID='ctlAwardAcademicPosition'
						Container='spnAwardAcademicPosition'
						Type='cDropDown'
						DataObjectDefinitionKey='AcademicPosition'
						StoredValue='AcademicPositionID'
						DisplayValue='AcademicPositionDesc'
						RequiredField='False'
						ErrorMessage='You must select an Award Academic Position.'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CareerStageID'>
					<Control ID='ctlCareerStage'
						Container='spnCareerStage'
						Type='cDropDown'
						DataObjectDefinitionKey='CareerStage'
						StoredValue='CareerStageID'
						DisplayValue='Description'
						RequiredField='True'
						ErrorMessage='You must select a Career Stage.'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='FacultyAppointmentStartDate'>
					<Control ID='ctlFirstAppointment'
						Container='spnFirstAppointment'
						Type='cDateTextBox'
						Size='25'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						RequiredField='True'
						ErrorMessage='You must enter the date of your First full-time faculty/staff appointment.'>
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='Y1DoctoralDegreeID'>
					<Control ID='ctlY1DoctoralDegree'
						Container='spnY1DoctoralDegree'
						Type='cDropDown'
						DataObjectDefinitionKey='DoctoralDegree'
						StoredValue='DoctoralDegreeID'
						DisplayValue='DoctoralDegreeDesc'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Y1DoctoralDegreeDateEarned'>
					<Control ID='ctlY1DoctoralDegreeDateEarned'
						Container='spnY1DoctoralDegreeDateEarned'
						Type='cDateTextBox'
						Size='25'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'>
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='Y1SpecialtyDegreeID'>
					<Control ID='ctlY1SpecialtyDegree'
						Container='spnY1SpecialtyDegree'
						Type='cDropDown'
						DataObjectDefinitionKey='SpecialtyDegree'
						StoredValue='SpecialtyDegreeID'
						DisplayValue='SpecialtyDegreeDesc'>
					</Control>	
				</DisplayProperty>					
				<DisplayProperty PropertyKey='Y2DoctoralDegreeID'>
					<Control ID='ctlY2DoctoralDegree'
						Container='spnY2DoctoralDegree'
						Type='cDropDown'
						DataObjectDefinitionKey='DoctoralDegree'
						StoredValue='DoctoralDegreeID'
						DisplayValue='DoctoralDegreeDesc'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='Y2DoctoralDegreeDateEarned'>
					<Control ID='ctlY2DoctoralDegreeDateEarned'
						Container='spnY2DoctoralDegreeDateEarned'
						Type='cDateTextBox'
						Size='25'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'>
					</Control>
				</DisplayProperty>			
				<DisplayProperty PropertyKey='Y2SpecialtyDegreeID'>
					<Control ID='ctlY2SpecialtyDegree'
						Container='spnY2SpecialtyDegree'
						Type='cDropDown'
						DataObjectDefinitionKey='SpecialtyDegree'
						StoredValue='SpecialtyDegreeID'
						DisplayValue='SpecialtyDegreeDesc'>
					</Control>	
				</DisplayProperty>					
				<DisplayProperty PropertyKey='CourseCompletionDate'>
					<Control ID='ctlCourseCompletionDate'
						Container='spnCourseCompletionDate'
						Type='cDateTextBox'
						Size='20'
						MaxLength='100'
						Calendar='True'>
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='DegreeAdmissionDate'>
					<Control ID='ctlDegreeAdmissionDate'
						Container='spnDegreeAdmissionDate'
						Type='cDateTextBox'
						Size='20'
						MaxLength='100'
						Calendar='True'>
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='CountryID'>
					<Control ID='ctlCountryCitizenship'
						Container='spnCountryCitizenship'
						Type='cDropDown'
						DataObjectDefinitionKey='Country'
						StoredValue='CountryID'
						DisplayValue='CountryDesc'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='You must select a Country of Citizenship.'>
						<Filters>
						</Filters>
						<Sort>
							<Argument PropertyKey='SequenceNumber'/>
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ImmigrationID'>
					<Control ID='ctlImmigrationStatusVisa'
						Container='spnImmigrationStatusVisa'
						Type='cDropDown'
						DataObjectDefinitionKey='Immigration'
						StoredValue='ImmigrationID'
						DisplayValue='ImmigrationDesc'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='You must select an Immigration Status/Visa.'>
						<Filters>
						</Filters>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ResearchYears'>
					<Control ID='ctlResearchYears'
						Container='spnResearchYears'
						Type='cTextBox'
						Size='2'
						MaxLength='4'
						RequiredField='True'
						ErrorMessage='You must enter Number of Years - Research.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ResearchMonths'>
					<Control ID='ctlResearchMonths'
						Container='spnResearchMonths'
						Type='cTextBox'
						Size='2'
						MaxLength='4'
						RequiredField='True'
						ErrorMessage='You must enter Number of Months - Research.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ClinicalYears'>
					<Control ID='ctlClinicalYears'
						Container='spnClinicalYears'
						Type='cTextBox'
						Size='2'
						MaxLength='4'
						RequiredField='True'
						ErrorMessage='You must enter Number of Years - Clinical.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ClinicalMonths'>
					<Control ID='ctlClinicalMonths'
						Container='spnClinicalMonths'
						Type='cTextBox'
						Size='2'
						MaxLength='4'
						RequiredField='True'
						ErrorMessage='You must enter Number of Months - Clinical.'>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		-->
	</ModuleSection>
</span>
<!-- End Embedded XML -->
