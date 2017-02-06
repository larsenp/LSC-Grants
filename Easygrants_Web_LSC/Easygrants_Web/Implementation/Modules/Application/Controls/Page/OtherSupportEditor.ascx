<%@ Control Language="vb" AutoEventWireup="true" Codebehind="OtherSupportEditor.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cOtherSupportEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>

<br>
<!-- Page Content - Top Of Page -->
Please complete all required information detailing your Other Support.   All fields marked with an
asterisk (<font color=red>*</font>) are required.
	
<!-- Dashed list changed to a bulleted list by Basil Eliopoulos June 23, 2005 8:46 p.m. per QA task. --> 	
<ul>
   <li>Click <b>Save</b> to save the information and return to the main Other Support page.</li>
   <li>Click <b>Close</b> to close the Other Support Editor without saving.</li>
</ul>
<p>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Other Support Editor</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td width='200' nowrap='true'><b>Project Number or Award Name</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'><span id='spnProjectNumber' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Source/Agency</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'><span id='spnSource' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Principal Investigator</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'><span id='spnInvestigator' runat='server'/></td>
	</tr>
	<tr>
		<td width='200'>&nbsp;</td>	
		<td colspan='3'>(Last name, First Name Middle Initial)</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Applicant's Role in Project</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'><span id='spnApplicantRole' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Status</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'><span id='spnStatus' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Title of Project</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'><span id='spnProjectTitle' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Dates of Awards</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td width='300'><span id='spnStartDate' runat='server'/></td>
		<td width='25'>to</td>
		<td width='300'><span id='spnEndDate' runat='server'/></td>
	</tr>
	<tr>
		<td width='200'>&nbsp;</td>
		<td width='300'>Start Date</td>
		<td width='25'>&nbsp;</td>
		<td width='300'>End Date</td>
	</tr>					
	<tr>
		<td width='200'>&nbsp;</td>
		<td width='300'>MM/DD/YYYY</td>
		<td width='25'>&nbsp;</td>
		<td width='300'>MM/DD/YYYY</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Average Annual Amount</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'>$&nbsp;<span id='spnAnnualAmount' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Annual Direct Costs</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'>$&nbsp;<span id='spnDirectCost' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Total Amount of Award</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'>$&nbsp;<span id='spnTotal' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Amount Available to Applicant</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'>$&nbsp;<span id='spnAmountAvailable' runat='server'/></td>
	</tr>
	<tr>
		<td width='200'>&nbsp;</td>
		<td colspan='3'>(Do not include applicant's salary/fringes)</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" align='center'>
			<span runat='server' id='spnSave'/> 
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectOtherSupport' DataObjectDefinitionKey='GranteeProjectOtherSupport' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectOtherSupportID' 
					PropertyKey='GranteeProjectOtherSupportID' 
					Value='' Bool=''/>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>																	
				<DisplayProperty PropertyKey='ProjectNumber'>
					<Control ID='ctlProjectNumber'
						Container='spnProjectNumber'
						Type='cTextBox'
						Size='25'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Project Number or Award Name is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Source'>
					<Control ID='ctlSource'
						Container='spnSource'
						Type='cTextBox'
						Size='50'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Source/Agency is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Investigator'>
					<Control ID='ctlInvestigator'
						Container='spnInvestigator'
						Type='cTextBox'
						Size='50'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Principal Investigator is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ApplicantRole'>
					<Control ID='ctlApplicantRole'
						Container='spnApplicantRole'
						Type='cTextBox'
						Size='25'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Applicant&apos;s Role in Project is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='StatusID'>
					<Control ID='ctlStatus'
						Container='spnStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='OtherSupportStatus'
						StoredValue='OtherSupportStatusID'
						DisplayValue='Description'	
						RequiredField='True'
						ErrorMessage='Status is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjectTitle'>
					<Control ID='ctlProjectTitle'
						Container='spnProjectTitle'
						Type='cTextBox'
						Size='100'
						MaxLength='150'
						RequiredField='True'
						ErrorMessage='Title of Project is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='ctlStartDate'
						Container='spnStartDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Start Date entered is invalid or not formatted properly.'
						Size='30'
						MaxLength='50' 
						RequiredField='True'
						ErrorMessage='Start Date is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEndDate'
						Container='spnEndDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='The End Date entered is invalid or not formatted properly.'
						Size='30'
						MaxLength='50' 
						RequiredField='True'
						ErrorMessage='End Date is required.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AnnualAmount'>
					<Control ID='ctlAnnualAmount'
						Container='spnAnnualAmount'
						Type='cMoneyTextBox'
						Size='12'
						MaxLength='12'
						MaxInputDecimalPlaces='2'
						RegExErrorMessage='Total amount must contain only digits, commas, and hyphens.'
						DecimalErrorMessage='Total amount must be a number with up to 2 decimals.'
						CommaErrorMessage='Commas are improperly formatted.'
						RequiredField='True'
						ErrorMessage='Average Annual Amount is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DirectCost'>
					<Control ID='ctlDirectCost'
						Container='spnDirectCost'
						Type='cMoneyTextBox'
						Size='12'
						MaxLength='12'
						MaxInputDecimalPlaces='2'
						RegExErrorMessage='Total amount must contain only digits, commas, and hyphens.'
						DecimalErrorMessage='Total amount must be a number with up to 2 decimals.'
						CommaErrorMessage='Commas are improperly formatted.'
						RequiredField='True'
						ErrorMessage='Annual Direct Costs is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Total'>
					<Control ID='ctlTotal'
						Container='spnTotal'
						Type='cMoneyTextBox'
						Size='12'
						MaxLength='12'
						MaxInputDecimalPlaces='2'
						RegExErrorMessage='Total amount must contain only digits, commas, and hyphens.'
						DecimalErrorMessage='Total amount must be a number with up to 2 decimals.'
						CommaErrorMessage='Commas are improperly formatted.'
						RequiredField='True'
						ErrorMessage='Total Amount of Award is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AmountAvailable'>
					<Control ID='ctlAmountAvailable'
						Container='spnAmountAvailable'
						Type='cMoneyTextBox'
						Size='12'
						MaxLength='12'
						MaxInputDecimalPlaces='2'
						RegExErrorMessage='Total amount must contain only digits, commas, and hyphens.'
						DecimalErrorMessage='Total amount must be a number with up to 2 decimals.'
						CommaErrorMessage='Commas are improperly formatted.'
						RequiredField='True'
						ErrorMessage='Amount Available to Applicant is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
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
	</ModuleSection>
</span>
<!-- End Embedded XML -->
