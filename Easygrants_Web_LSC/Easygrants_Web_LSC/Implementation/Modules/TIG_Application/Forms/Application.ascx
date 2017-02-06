<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.TIG_Application.Forms.cApplication" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<div style="width:600px">
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
		Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
		runat='server'/>
	<br />
	<div style="width:100%" class="SeparatorHdg">
		Instructions
	</div>
	<p>Complete all the required fields below, and if appropriate, provide a secondary contact person for this application.</p>
	<div class='SeparatorHdg'>
		Application
	</div>
	<br />
	 <table cellpadding='1' width='600px'>
		<tr>
			<td>
				<b>Category</b><font color='red'>*</font>&nbsp;
				<span runat='server' id='spnTigGrantTypeID' />
			</td>
			<td>
				<b>Grant Term</b><font color='red'>*</font>&nbsp;
				<span runat='server' id='spnGrantTermMonths' />
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				<b>Total Grant Request</b><font color='red'>*</font>&nbsp;
				<span runat='server' id='spnGrantRequest' /><br />
				<span class='FieldLabel'>round to nearest dollar</span>
			</td>
			<td>
				<b>Total Project Budget</b><font color='red'>*</font>&nbsp;
				<span runat='server' id='spnProjectBudget' /><br />
				<span class='FieldLabel'>round to nearest dollar</span>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='2'>
				<b>Areas of Interest</b><br />
                <span class='FieldLabel'>Please indicate if this application addresses one or more of this year’s TIG Areas of Interest </span>
				<span runat='server' id='spnLscTIGAppAreasOfInterest' />
              
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td valign="top">
				<b>Are you also requesting funding for this project through LSC’s Pro Bono Innovation Fund program? <font color='red'>*</font></b>
			</td>
			<td>
				<span runat='server' id='spnPBIFAppSameProject' />
			</td>
		</tr>
        <tr>
			<td valign="top">
				<b>Are you applying for a Pro Bono Innovation Fund that complements this grant? <font color='red'>*</font></b>
			</td>
			<td>
				<span runat='server' id='spnApplyForPBIFComplements' />
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='2'>
				<b>Brief Description of Proposed Project<font color='red'>*</font> (please limit your description to 1000 characters, or approximately 125 words)</b><br />
				<span runat='server' id='spnBriefDescription' />
			</td>
		</tr>
	 </table>
	<br />
	<div class='SeparatorHdg'>
		Secondary Grant Contact
	</div>
	<p>The primary contact for every TIG grant is the executive director of the applicant program. Applicant programs may designate a secondary contact as well.</p>
	<p>You may select the secondary contact from the list of contacts below</p>
	<span runat='server' id='spnSecondaryContactPersonID' />
	<br /><br />
	<b>- OR -</b>
	<br />
	<p>If your secondary contact person is not in the drop-down list, please provide the person's contact information below:</p>
	<table width='600px' cellpadding='1' border='0'>
		<tr>
			<td>
				<b>Name</b>
			</td>
			<td>
				<span class='FieldLabel'>First</span>&nbsp;
				<span runat='server' id='spnSecondaryContactFirstName' />&nbsp;&nbsp;
				<span class='FieldLabel'>Middle</span>&nbsp;
				<span runat='server' id='spnSecondaryContactMiddleName' />&nbsp;&nbsp;
				<span class='FieldLabel'>Last</span>&nbsp;
				<span runat='server' id='spnSecondaryContactLastName' />&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				<b>Address</b>
			</td>
			<td>
				<span runat="server" id='spnSecondaryContactAddress1' />
			</td>
		</tr>
		<tr>
			<td>&nbsp;
				
			</td>
			<td>
				<span runat="server" id='spnSecondaryContactAddress2' />
			</td>
		</tr>
		<tr>
			<td>&nbsp;
				
			</td>
			<td>
				<span class='FieldLabel'>City</span>&nbsp;
				<span runat="server" id='spnSecondaryContactCity' />&nbsp;&nbsp;
				<span class='FieldLabel'>State</span>&nbsp;
				<span runat="server" id='spnSecondaryContactStateProvinceID' />&nbsp;&nbsp;
				<span class='FieldLabel'>Zip</span>&nbsp;
				<span runat="server" id='spnSecondaryContactZip' />&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				<b>Telephone</b>
			</td>
			<td>
				<span runat='server' id='spnSecondaryContactPhone' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Fax</b>
			</td>
			<td>
				<span runat='server' id='spnSecondaryContactFax' />
			</td>
		</tr>
		<tr>
			<td>
				<b>E-mail</b>
			</td>
			<td>
				<span runat='server' id='spnSecondaryContactEmail' />
			</td>
		</tr>
		
	</table>
	<br />
	<div style="text-align:center">
		<span runat='server' id='spnSave' />
		<span runat='server' id='spnContinue' />
	</div>
</div>
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='LscGranteeProjectTig' DataObjectDefinitionKey='LscGranteeProjectTig' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TigGrantTypeID'>
					<Control ID='ctlTigGrantTypeID'
						Type='cDropDown'
						Container='spnTigGrantTypeID'
						DataObjectDefinitionKey='LscTigGrantType'
						StoredValue='TigGrantTypeID'
						DisplayValue='Description'
						DisplayText='Select' >
						<Filters>
							<Argument PropertyKey='LscTigGrantClassificationID' Value='2' />
							<Argument Group = '(' Bool='And'/>
							<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='EndDate' Operator='GreaterThanEqual' Bool=''/>
							<Argument PropertyKey='EndDate' Value='' Bool='Or' />
							<Argument Group=')' Bool='' />
						</Filters>
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
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
		</DataObject>
		
		<DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GrantTermMonths'>
					<Control ID='ctlGrantTermMonths'
						Type='cDropDown'
						Container='spnGrantTermMonths'
						ParamList='12|12 Months~18|18 Months~24|24 Months~30|30 Months~36|36 Months'
						Separator='~'
						SubSeparator='|'
						DisplayText='Select'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantRequest'>
					<Control ID='txtGrantRequest'
						Type='cMoneyTextBox'
						Container='spnGrantRequest'
						AllowInputCommas='True'
						Format='#,0'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='Total Grant Request must be a whole number.'
						RegExErrorMessage='Total Grant Request must be a whole number.'
						MaxLength='10'
						Size='6' 
						MinimumValue='1'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjectBudget'>
					<Control ID='txtProjectBudget'
						Type='cMoneyTextBox'
						Container='spnProjectBudget'
						AllowInputCommas='True'
						Format='#,0'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='Total Project Budget must be a whole number.'
						RegExErrorMessage='Total Project Budget must be a whole number.'
						MaxLength='10'
						Size='6' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='BriefDescription'>
					<Control ID='txtBriefDescription'
						Type='cTextArea'
						Container='spnBriefDescription'
						Rows='5'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PBIFAppSameProject'>
					<Control ID='ctlPBIFAppSameProject'
						Type='cRadioButtonList'
						Container='spnPBIFAppSameProject'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
                <DisplayProperty PropertyKey='ApplyForPBIFComplements'>
					<Control ID='ctlApplyForPBIFComplements'
						Type='cRadioButtonList'
						Container='spnApplyForPBIFComplements'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecondaryContactPersonID'>
					<Control ID='ctlSecondaryContactPersonID'
						Type='cDropDown'
						Container='spnSecondaryContactPersonID'
						DataObjectDefinitionKey='PersonOrganizationAffiliation'
						DisplayText='Select'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
							<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryPersonID' PropertyKey='PersonID' Operator='NotEqual' />
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecondaryContactFirstName'>
					<Control ID='txtSecondaryContactFirstName'
						Type='cTextBox'
						Container='spnSecondaryContactFirstName'
						Size='10'
						MaxLength='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecondaryContactMiddleName'>
					<Control ID='txtSecondaryContactMiddleName'
						Type='cTextBox'
						Container='spnSecondaryContactMiddleName'
						Size='3'
						MaxLength='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecondaryContactLastName'>
					<Control ID='txtSecondaryContactLastName'
						Type='cTextBox'
						Container='spnSecondaryContactLastName'
						Size='10'
						MaxLength='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecondaryContactAddress1'>
					<Control ID='txtSecondaryContactAddress1'
						Type='cTextBox'
						Container='spnSecondaryContactAddress1'
						Size='40'
						MaxLength='150' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecondaryContactAddress2'>
					<Control ID='txtSecondaryContactAddress2'
						Type='cTextBox'
						Container='spnSecondaryContactAddress2'
						Size='40'
						MaxLength='150' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecondaryContactCity'>
					<Control ID='txtSecondaryContactCity'
						Type='cTextBox'
						Container='spnSecondaryContactCity'
						Size='20'
						MaxLength='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecondaryContactStateProvinceID'>
					<Control ID='ctlSecondaryContactStateProvinceID'
						Type='cDropDown'
						Container='spnSecondaryContactStateProvinceID'
						DataObjectDefinitionKey='State'
						DisplayText='Select'
						DisplayValue='StateAbbr'
						StoredValue='StateID'>
						<Filters>
							<Argument PropertyKey='CountryID' Value='280' />
						</Filters>
						<Sort>
							<Argument PropertyKey='StateAbbr' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecondaryContactZip'>
					<Control ID='txtSecondaryContactZip' 
						Type='cTextBox' 
						Container='spnSecondaryContactZip' 
						Size='12' 
						MaxLength='30' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecondaryContactPhone'>
					<Control ID='txtSecondaryContactPhone' 
						Type='cTextBox' 
						Container='spnSecondaryContactPhone' 
						Size='12' 
						MaxLength='30' >
						<Validation Type='RegularExpression' 
							ValidationExpression='^\s?[0-9]{0,20}\s?$' 
							ErrorMessage='Telephone is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses...' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecondaryContactFax'>
					<Control ID='txtSecondaryContactFax' 
						Type='cTextBox' 
						Container='spnSecondaryContactFax' 
						Size='12' 
						MaxLength='30' >
						<Validation Type='RegularExpression' 
							ValidationExpression='^\s?[0-9]{0,20}\s?$' 
							ErrorMessage='Fax is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecondaryContactEmail'>
					<Control ID='txtSecondaryContactEmail' 
						Type='cEmailTextBox' 
						Container='spnSecondaryContactEmail' 
						Size='40' 
						MaxLength='100' 
						RexErrorMessage='E-mail Address is incorrectly formatted. Use the following format to enter the e-mail address: test@test.edu or test@test.edu.au.'/>
				</DisplayProperty>
			    <DisplayProperty PropertyKey='LscTIGAppAreasOfInterest'>
					<Control ID='ctlLscTIGAppAreasOfInterest'
						Container='spnLscTIGAppAreasOfInterest'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='LscAreasOfInterestLKP'
						DisplayValue='Description'
						StoredValue='LscAreasOfInterestLKPID'
						RepeatColumns='0'
						CellSpacing='3'
						RepeatDirection='Vertical'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProject.TimePeriodID' PropertyKey='TimePeriodID'/>
						</Filters>
						<Sort>
							<Argument PropertyKey="SortOrder"/>
						</Sort>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='LscTigApp' DataObjectPropertyKey='LscTigAppID' PropertyKey='LscTigAppID' />
						</DefaultValues>
					</Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
    </ModuleSection>
  </span>