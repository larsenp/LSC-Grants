<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<table width='800' cellpadding='5' cellspacing='0' >
	<tr>
		<td class='SeparatorHdg' colspan='6'>
			Edit Staff Member
		</td>
	</tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td>
			Office Type
		</td>
		<td>
			<span runat="server" id='spnOfficeType' />
		</td>
		<td>
			Office Name
		</td>
		<td>
			<span runat='server' id='spnOffID' />&nbsp;-&nbsp;
			<span runat='server' id='spnOffName' />&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnTransfer' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			First Name&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat="server" id='spnFirstName' />
		</td>
		<td>
			Last Name&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat='server' id='spnLastName' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Job Class&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat="server" id='spnLscStaffJobCodeID' />
		</td>
		<td>
			Ethnicity&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat='server' id='spnEthnicityID' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Language&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat="server" id='spnLscLangCodeID' />
		</td>
		<td>
			Hours Per Week
		</td>
		<td>
			<span runat='server' id='spnHoursPerWeek' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Annual Salary&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat="server" id='spnAnnlSalary' />
		</td>
		<td>
			Amount of Other Compensation
		</td>
		<td>
			<span runat="server" id='spnAnnlOtherCompensation' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Gender&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat="server" id='spnGenderID' />
		</td>
		<td>
			Age 40+&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat='server' id='spnAge40Plus' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Attorney&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat="server" id='spnAttorney' />
		</td>
		<td>
			Disability&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat='server' id='spnDisabled' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Employment Start Date<font color='red'>*</font>
		</td>
		<td>
			<span runat="server" id='spnStartDte' />
		</td>
		<td>
			Termination Date
		</td>
		<td>
			<span runat='server' id='spnTermination' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Email<font color='red'>*</font>
		</td>
		<td colspan="3">
			<span runat="server" id='spnEmailAddr' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table width='800' cellpadding='5' cellspacing='0'>
	<tr>
		<td class='SeparatorHdg' colspan='3'>
			Experience
		</td>
	</tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td>
			Years Experience in Current Job<font color='red'>*</font>
		</td>
		<td>
			<span runat='server' id='spnYrsExpCurr' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Years Experience with LSC Grantee<font color='red'>*</font>
		</td>
		<td>
			<span runat='server' id='spnYrsExpWLsc' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Years Experience in Profession<font color='red'>*</font>
		</td>
		<td>
			<span runat='server' id='spnYrsExpProf' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table width='800' cellpadding='5' cellspacing='0'>
	<tr>
		<td colspan='5' class='SeparatorHdg'>
			Service Area
		</td>
	</tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td colspan='4'>
			Enter the proportion of work time that the employee spends doing work for each LSC service area.  
			The proportions should total to 100 for employees who spend all of their time doing LSC work. 
			The total should be less than 100 for employees who do not spend all their time doing LSC work.  
			Enter whole numbers in the Proportion of Time boxes.
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Service Area 1
		</td>
		<td>
			<span runat='server' id='spnServArea1' />
		</td>
		<td>
			Proportion of Time
		</td>
		<td>
			<span runat='server' id='spnPctTime1' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Service Area 2
		</td>
		<td>
			<span runat='server' id='spnServArea2' />
		</td>
		<td>
			Proportion of Time
		</td>
		<td>
			<span runat='server' id='spnPctTime2' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Service Area 3
		</td>
		<td>
			<span runat='server' id='spnServArea3' />
		</td>
		<td>
			Proportion of Time
		</td>
		<td>
			<span runat='server' id='spnPctTime3' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Service Area 4
		</td>
		<td>
			<span runat='server' id='spnServArea4' />
		</td>
		<td>
			Proportion of Time
		</td>
		<td>
			<span runat='server' id='spnPctTime4' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Service Area 5
		</td>
		<td>
			<span runat='server' id='spnServArea5' />
		</td>
		<td>
			Proportion of Time
		</td>
		<td>
			<span runat='server' id='spnPctTime5' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='5' align="center">
			<span runat='server' id='spnDelete' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
		<DataObject Key='LscOffice' DataObjectDefinitionKey='LscOffice' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LscOfficeID' PropertyKey='LscOfficeID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OffID'>
					<Control ID='spnOffID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OfficeType.Description'>
					<Control ID='spnOfficeType'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OffName'>
					<Control ID='spnOffName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscStaffDetail' DataObjectDefinitionKey='LscStaffDetail' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LscStaffDetailID' PropertyKey='LscStaffDetailID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='LscOffice' DataObjectPropertyKey='LscOfficeID' PropertyKey='LscOfficeID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnTransfer'
						Type='cButton'
						Container='spnTransfer'
						Caption='Transfer'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument Value='TransferOffice' />
								<Argument Type='DataObjectCollection' TypeKey='LscStaffDetail' DataObjectPropertyKey='LscStaffDetailID' BaseValue='LscStaffDetailID=' />
								
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='txtFirstName'
						Type='cTextBox'
						Container='spnFirstName'
						Size='20'
						MaxLength='20'
						RequiredField='True'
						ErrorMessage='First Name is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LastName'>
					<Control ID='txtLastName'
						Type='cTextBox'
						Container='spnLastName'
						Size='20'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Last Name is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscStaffJobCodeID'>
					<Control ID='ctlLscStaffJobCodeID'
						Type='cDropDown'
						Container='spnLscStaffJobCodeID'
						DataObjectDefinitionKey='LscJobClass'
						StoredValue='LscJobClassID'
						DisplayValue='Description'
						DisplayText='Select' 
						RequiredField='True'
						ErrorMessage='Job Class is required.'>
						<Filters>
							<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate' Bool=''/>
							<Argument PropertyKey='EndDate' Value='null' Bool='Or'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EthnicityID'>
					<Control ID='ctlEthnicityID'
						Type='cDropDown'
						Container='spnEthnicityID'
						DataObjectDefinitionKey='Ethnicity'
						StoredValue='EthnicityID'
						DisplayValue='EthnicityDesc'
						DisplayText='Select' 
						HideInactiveItems='True'
						RequiredField='True'
						ErrorMessage='Ethnicity is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscLangCodeID'>
					<Control ID='ctlLscLangCodeID'
						Type='cDropDown'
						Container='spnLscLangCodeID'
						DataObjectDefinitionKey='LscLangCode'
						StoredValue='LscLangCodeID'
						DisplayValue='Description'
						DisplayText='Select' 
						HideInactiveItems='True'
						RequiredField='True'
						ErrorMessage='Language is required.'>
						<Filters>
							<Argument PropertyKey='EndDate' Value='' />
							<Argument Type='CurrentDateTime' TypeKey='Date' Operator='GreaterThanEqual' PropertyKey='EndDate' Value='' Bool='Or'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
					<DisplayProperty PropertyKey='HoursPerWeek'>
					<Control ID='txtHoursPerWeek'
						Type='cTextBox'
						Container='spnHoursPerWeek'
						Size='5'
						MaxLength='5'
						RequiredField='True'
						ErrorMessage='Hours Per Week must be between 1 and 99, with no more than two decimal places.'>
						<Validation Type='RegularExpression'
							ValidationExpression='^[1-9][0-9]?(.[0-9][0-9]?)?$'
							ErrorMessage='Hours Per Week must be between 1 and 99, with no more than two decimal places.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AnnlSalary'>
					<Control ID='txtAnnlSalary'
						Type='cTextBox'
						Container='spnAnnlSalary'
						Size='20'
						MaxLength='6'
						RequiredField='True'
						ErrorMessage='Annual salary is required.'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='250000'
							ErrorMessage='Annual salary must be a whole number no greater than $250,000, entered as digits only, without commas, dollar signs, or decimal points.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AnnlOtherCompensation'>
					<Control ID='txtAnnlOtherCompensation'
						Type='cTextBox'
						Container='spnAnnlOtherCompensation'
						Size='20'
						MaxLength='6'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='250000'
							ErrorMessage='Annual other compensation must be a whole number no greater than $250,000, entered as digits only, without commas, dollar signs, or decimal points.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GenderID'>
					<Control ID='rdoGenderID'
						Type='cRadioButtonList' 
						Container='spnGenderID'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RequiredField='True'
						ErrorMessage='Gender is required.'>
						<Parameters>
							<Parameter StoredValue='2' DisplayValue='Male'/>
							<Parameter StoredValue='1' DisplayValue='Female'/>
							<Parameter StoredValue='4' DisplayValue='Other'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Age40Plus'>
					<Control ID='rdoAge40Plus'
						Type='cRadioButtonList'
						Container='spnAge40Plus'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RequiredField='True'
						ErrorMessage='Age is required.'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Attorney'>
					<Control ID='rdoAttorney'
						Type='cRadioButtonList'
						Container='spnAttorney'
						LoadParam='True'
						RepeatDirection='Horizontal' 
						RequiredField='True'
						ErrorMessage='Attorney Field is required.' >
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Disabled'>
					<Control ID='rdoDisabled'
						Type='cRadioButtonList'
						Container='spnDisabled'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RequiredField='True'
						ErrorMessage='Disability Field is required.'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDte'>
					<Control ID='ctlStartDte' 
						Type='cDateTextBox' 
						Container='spnStartDte'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Employment Start Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Employment Start Date must be in mm/dd/yyyy format.'
						RequiredField='True'
						ErrorMessage = 'Employment Start Date is required.'
						Size='20'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Termination'>
					<Control ID='ctlTermination' 
						Type='cDateTextBox' 
						Container='spnTermination'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Termination Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Termination Start Date must be in mm/dd/yyyy format.'
						Size='20'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EmailAddr'>
					<Control ID='txtEmailAddr'
						Type='cEmailTextBox'
						Container='spnEmailAddr'
						Size='40'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Email is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='YrsExpCurr'>
					<Control ID='txtYrsExpCurr'
						Type='cMoneyTextBox'
						Container='spnYrsExpCurr'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Years Experience in Current Job" must be a whole number.'
						RegExErrorMessage='The value for "Years Experience in Current Job" must be a whole number.'
						RequiredField='True'
						ErrorMessage = '"Years Experience in Current Job" is required.'
						MaxLength='2'
						Size='5' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='YrsExpWLsc'>
					<Control ID='txtYrsExpWLsc'
						Type='cMoneyTextBox'
						Container='spnYrsExpWLsc'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Years Experience with LSC Grantee" must be a whole number.'
						RegExErrorMessage='The value for "Years Experience with LSC Grantee" must be a whole number.'
						RequiredField='True'
						ErrorMessage = '"Years Experience with LSC Grantee" is required.'
						MaxLength='2'
						Size='5' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='YrsExpProf'>
					<Control ID='txtYrsExpProf'
						Type='cMoneyTextBox'
						Container='spnYrsExpProf'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Years Experience in Profession" must be a whole number.'
						RegExErrorMessage='The value for "Years Experience in Profession" must be a whole number.'
						RequiredField='True'
						ErrorMessage = '"Years Experience in Profession" is required.'
						MaxLength='2'
						Size='5' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ServArea1'>
					<Control ID='ctlServArea1'
						Type='cDropDown'
						Container='spnServArea1'
						DataObjectDefinitionKey='WfTaskAssignment'
						StoredValue='GranteeProject.WfProject.WfCompetition.CompetitionDisplayName'
						DisplayValue='GranteeProject.WfProject.WfCompetition.CompetitionDisplayName'
						DisplayText='Select' 
						RequiredField='True'
						ErrorMessage='Service Area 1 is required.'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='LscOffice' DataObjectPropertyKey='OrganizationID' PropertyKey='PrimaryOrganizationID' >
								<RelatedProperty PropertyKey='GranteeProject' />
							</Argument>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.LscGarCycleID' PropertyKey='LscGarCycleID' >
								<RelatedProperty PropertyKey='WfTACompetitionYear' />
							</Argument>
							<Argument PropertyKey='ProgramID' Value='1'>
								<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition' />
							</Argument>
						</Filters>
						<Sort>
							<Argument PropertyKey='CompetitionDisplayName' >
								<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition' />
							</Argument>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PctTime1'>
					<Control ID='txtPctTime1'
						Type='cTextBox'
						Container='spnPctTime1'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Proportion of Time in Service Area 1" must be a whole number between 0 and 100.'
						RegExErrorMessage='The value for "Proportion of Time in Service Area 1" must be a whole number between 0 and 100.'
						MaxLength='3'
						Size='5' >
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='The value for "Proportion of Time in Service Area 1" must be a whole number between 0 and 100.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ServArea2'>
					<Control ID='ctlServArea2'
						Type='cDropDown'
						Container='spnServArea2'
						DataObjectDefinitionKey='WfTaskAssignment'
						StoredValue='GranteeProject.WfProject.WfCompetition.CompetitionDisplayName'
						DisplayValue='GranteeProject.WfProject.WfCompetition.CompetitionDisplayName'
						DisplayText='Select' >
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='LscOffice' DataObjectPropertyKey='OrganizationID' PropertyKey='PrimaryOrganizationID' >
								<RelatedProperty PropertyKey='GranteeProject' />
							</Argument>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.LscGarCycleID' PropertyKey='LscGarCycleID' >
								<RelatedProperty PropertyKey='WfTACompetitionYear' />
							</Argument>
							<Argument PropertyKey='ProgramID' Value='1'>
								<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition' />
							</Argument>
						</Filters>
						<Sort>
							<Argument PropertyKey='CompetitionDisplayName' >
								<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition' />
							</Argument>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PctTime2'>
					<Control ID='txtPctTime2'
						Type='cMoneyTextBox'
						Container='spnPctTime2'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Proportion of Time in Service Area 2" must be a whole number between 0 and 100.'
						RegExErrorMessage='The value for "Proportion of Time in Service Area 2" must be a whole number between 0 and 100.'
						MaxLength='3'
						Size='5' >
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='The value for "Proportion of Time in Service Area 2" must be a whole number between 0 and 100.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ServArea3'>
					<Control ID='ctlServArea3'
						Type='cDropDown'
						Container='spnServArea3'
						DataObjectDefinitionKey='WfTaskAssignment'
						StoredValue='GranteeProject.WfProject.WfCompetition.CompetitionDisplayName'
						DisplayValue='GranteeProject.WfProject.WfCompetition.CompetitionDisplayName'
						DisplayText='Select' >
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='LscOffice' DataObjectPropertyKey='OrganizationID' PropertyKey='PrimaryOrganizationID' >
								<RelatedProperty PropertyKey='GranteeProject' />
							</Argument>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.LscGarCycleID' PropertyKey='LscGarCycleID' >
								<RelatedProperty PropertyKey='WfTACompetitionYear' />
							</Argument>
							<Argument PropertyKey='ProgramID' Value='1'>
								<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition' />
							</Argument>
						</Filters>
						<Sort>
							<Argument PropertyKey='CompetitionDisplayName' >
								<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition' />
							</Argument>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PctTime3'>
					<Control ID='txtPctTime3'
						Type='cMoneyTextBox'
						Container='spnPctTime3'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Proportion of Time in Service Area 3" must be a whole number between 0 and 100.'
						RegExErrorMessage='The value for "Proportion of Time in Service Area 3" must be a whole number between 0 and 100.'
						MaxLength='3'
						Size='5' >
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='The value for "Proportion of Time in Service Area 3" must be a whole number between 0 and 100.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ServArea4'>
					<Control ID='ctlServArea4'
						Type='cDropDown'
						Container='spnServArea4'
						DataObjectDefinitionKey='WfTaskAssignment'
						StoredValue='GranteeProject.WfProject.WfCompetition.CompetitionDisplayName'
						DisplayValue='GranteeProject.WfProject.WfCompetition.CompetitionDisplayName'
						DisplayText='Select' >
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='LscOffice' DataObjectPropertyKey='OrganizationID' PropertyKey='PrimaryOrganizationID' >
								<RelatedProperty PropertyKey='GranteeProject' />
							</Argument>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.LscGarCycleID' PropertyKey='LscGarCycleID' >
								<RelatedProperty PropertyKey='WfTACompetitionYear' />
							</Argument>
							<Argument PropertyKey='ProgramID' Value='1'>
								<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition' />
							</Argument>
						</Filters>
						<Sort>
							<Argument PropertyKey='CompetitionDisplayName' >
								<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition' />
							</Argument>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PctTime4'>
					<Control ID='txtPctTime4'
						Type='cMoneyTextBox'
						Container='spnPctTime4'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Proportion of Time in Service Area 4" must be a whole number between 0 and 100.'
						RegExErrorMessage='The value for "Proportion of Time in Service Area 4" must be a whole number between 0 and 100.'
						MaxLength='3'
						Size='5' >
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='The value for "Proportion of Time in Service Area 4" must be a whole number between 0 and 100.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ServArea5'>
					<Control ID='ctlServArea5'
						Type='cDropDown'
						Container='spnServArea5'
						DataObjectDefinitionKey='WfTaskAssignment'
						StoredValue='GranteeProject.WfProject.WfCompetition.CompetitionDisplayName'
						DisplayValue='GranteeProject.WfProject.WfCompetition.CompetitionDisplayName'
						DisplayText='Select' >
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='LscOffice' DataObjectPropertyKey='OrganizationID' PropertyKey='PrimaryOrganizationID' >
								<RelatedProperty PropertyKey='GranteeProject' />
							</Argument>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.LscGarCycleID' PropertyKey='LscGarCycleID' >
								<RelatedProperty PropertyKey='WfTACompetitionYear' />
							</Argument>
							<Argument PropertyKey='ProgramID' Value='1'>
								<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition' />
							</Argument>
						</Filters>
						<Sort>
							<Argument PropertyKey='CompetitionDisplayName' >
								<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition' />
							</Argument>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PctTime5'>
					<Control ID='txtPctTime5'
						Type='cMoneyTextBox'
						Container='spnPctTime5'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Proportion of Time in Service Area 5" must be a whole number between 0 and 100.'
						RegExErrorMessage='The value for "Proportion of Time in Service Area 5" must be a whole number between 0 and 100.'
						MaxLength='3'
						Size='5' >
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='The value for "Proportion of Time in Service Area 5" must be a whole number between 0 and 100.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnDelete'
						Type='cButton'
						Container='spnDelete'
						Caption='Delete This Staff Member'
						Confirmation='Are you sure you want to delete this staff member?'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_Delete'>	
							<Parameters>
								<Argument Value='LscStaffDetail' />
								<Argument Type='DataObjectCollection' TypeKey='LscStaffDetail' DataObjectPropertyKey='LscStaffDetailID' />
								<Argument Value='False' />
							</Parameters>
						</Action>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>	
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' />
								<Argument Type='QueryString' TypeKey='LscOfficeID' BaseValue='LscOfficeID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
