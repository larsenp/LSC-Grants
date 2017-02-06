<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Control Language="vb" CodeBehind="OrganizationContacts_Editor.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cOrganizationContacts_Editor" AutoEventWireup="true" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	id="CUserCtlLoader1" />
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b><%=GetLabel("Organization")%> Contacts Editor</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<!-- Control Label (for Organization information) -->
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" width="120"><b>Role</b></td>
		<td><span id='spnRole' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" width="120"><b>Name</b></td>
		<td><span id='spnPrefix' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Prefix</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<table border='0' cellspacing='0' cellpadding='0'>
				<tr>
					<td><span id='spnFirst' runat='server' /></td>
					<td><span id='spnMiddle' runat='server' /></td>
					<td><span id='spnLast' runat='server' /></td>
				</tr>
				<tr>
					<td>First Name&nbsp;<font color='red'>*</font></td>
					<td>Middle Initial/Name</td>
					<td>Last Name&nbsp;<font color='red'>*</font></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnSuffix' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Suffix</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" width="120"><b><%=GetLabel("Organization")%></b></td>
		<td><span id='spnTitle' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Title&nbsp;<font color='red'>*</font></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnInstitutionType' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><%=GetLabel("Organization")%> Type&nbsp;<font color='red'>*</font></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnOrgSelectLauncher' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><%=GetLabel("Organization")%>&nbsp;<font color='red'>*</font></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnInstitutionalComponent' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><%=GetLabel("Organization")%> Component (school, e.g., Medicine, or campus, e.g., SUNY at 
			Buffalo)</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnPrimaryDepartment' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Primary Department</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnSecondaryDepartment' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Secondary Department</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" width="120"><b>Address</b></td>
		<td><span id='spnAddress1' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Address 1&nbsp;<font color='red'>*</font></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" width="120"></td>
		<td><span id='spnAddress2' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Address 2</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" width="120"></td>
		<td><span id='spnAddress3' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Address 3</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" width="120"></td>
		<td>
			<table border='0' cellspacing='0' cellpadding='0'>
				<tr>
					<td><span id='spnCity' runat='server' /></td>
					<td><span id='spnState' runat='server' /></td>
					<td><span id='spnZip' runat='server' /></td>
				</tr>
				<tr>
					<td>City&nbsp;<font color='red'>*</font></td>
					<td>State/Province&nbsp;<font color='red'>*</font></td>
					<td>Zip&nbsp;<font color='red'>*</font></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnCountry' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Country&nbsp;<font color='red'>*</font></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnEmail' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>E-mail&nbsp;<font color='red'>*</font></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" width="120">&nbsp;</td>
		<td>Enter your area code and number (10 digits) - with no extra characters, i.e., 
			1234567890.</td>
	</tr>
	<tr>
		<td valign="top" width="120"><b>Phone</b></td>
		<td>
			<table border='0' cellspacing='0' cellpadding='0'>
				<tr>
					<td><span id='spnPhoneNumber' runat='server' /></td>
					<td><span id='spnPhoneExt' runat='server' /></td>
				</tr>
				<tr>
					<td>Number&nbsp;<font color='red'>*</font></td>
					<td>Ext.</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" width="120">&nbsp;</td>
		<td>Enter your area code and number (10 digits) - with no extra characters, i.e., 
			1234567890.</td>
	</tr>
	<tr>
		<td valign="top" width="120"><b>Fax</b></td>
		<td><span id='spnFaxNumber' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Number&nbsp;<font color='red'>*</font></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td align="center">
			<!-- Save Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSave' />
			<!-- Cancel Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnCancel' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectPersonAffiliation' DataObjectDefinitionKey='GranteeProjectPersonAffiliation'
			Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectPersonAffiliationID' PropertyKey='GranteeProjectPersonAffiliationID' />
			</Filters>
		</DataObject>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProjectPersonAffiliation' DataObjectPropertyKey='PersonID'
					PropertyKey='PersonID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrefixID'>
					<Control ID='ctlPrefix' Container='spnPrefix' Type='cDropDown' DataObjectDefinitionKey='Prefix'
						StoredValue='PrefixID' DisplayValue='Prefix'>
					    <Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SuffixID'>
					<Control ID='ctlSuffix' Container='spnSuffix' Type='cDropDown' DataObjectDefinitionKey='Suffix'
						StoredValue='SuffixID' DisplayValue='Suffix'>
					    <Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='ctlFirst' Container='spnFirst' Type='cTextBox' Size='25' MaxLength='50' RequiredField='True'
						ErrorMessage='First Name is required.'>
						<Validation Type='Custom' Object='EventController' Method='ValidateDuplicateRole' ErrorMessage='The Role you selected already exists for this applicant.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MiddleName'>
					<Control ID='ctlMiddle' Container='spnMiddle' Type='cTextBox' Size='15' MaxLength='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LastName'>
					<Control ID='ctlLast' Container='spnLast' Type='cTextBox' Size='25' MaxLength='50' RequiredField='True'
						ErrorMessage='Last Name is required.' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GPPA' DataObjectDefinitionKey='GranteeProjectPersonAffiliation' Updatable='True'
			CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectPersonAffiliationID' PropertyKey='GranteeProjectPersonAffiliationID' />
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='PersonID' />
				<Argument Type='QueryString' TypeKey='IsPrimary' PropertyKey='IsPrimary' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeMemberRoleID'>
					<Control ID='ctlRole' Container='spnRole' Type='cDropDown' DataObjectDefinitionKey='GranteeMemberRole'
						StoredValue='GranteeMemberRoleID' DisplayValue='Abbr' DisplayNone='False'>
						<Filters>
							<Argument Type='' TypeKey='' Operator='NotEqual' PropertyKey='GranteeMemberRoleID' Value='5' />
						</Filters>
						<Sort>
							<Argument PropertyKey='Abbr' />
						</Sort>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Email' DataObjectDefinitionKey='Email' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProjectPersonAffiliation' DataObjectPropertyKey='PersonID'
					PropertyKey='EntityID' />
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1' />
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' />
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1' />
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True' />
				<Argument Type='' TypeKey='' PropertyKey='EmailTypeID' Value='1' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='ctlEmail' Container='spnEmail' Type='cEmailTextBox' Size='50' MaxLength='75'
						RequiredField='True' ErrorMessage='E-mail Address is required.' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Address' DataObjectDefinitionKey='Address' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProjectPersonAffiliation' DataObjectPropertyKey='PersonID'
					PropertyKey='EntityID' />
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1' />
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' />
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1' />
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True' />
				<Argument Type='' TypeKey='' PropertyKey='AddressTypeID' Value='3' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle' Container='spnTitle' Type='cTextBox' Size='35' MaxLength='100' RequiredField='True'
						ErrorMessage='Title is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='InstitutionTypeID'>
					<Control ID='ctlInstitutionType' Container='spnInstitutionType' Type='cDropDown' DataObjectDefinitionKey='OrganizationType'
						StoredValue='TypeID' DisplayValue='OrganizationAbbr' RequiredField='True' ErrorMessage='~~Organization~~ Type is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<!--
				<DisplayProperty PropertyKey='Inst'>
					<Control ID='ctlInstitution'
						Container='spnInstitution'
						Type='cTextBox'
						Size='75'
						MaxLength='150'
						RequiredField='True'
						ErrorMessage='You must enter an Institution.'/>
				</DisplayProperty>
				-->
				<DisplayProperty PropertyKey='Organization.CommonOrganizationName'>
					<Control ID='ctlOrgSelect' Type='cOrgSelectLauncherEMF' Container='spnOrgSelectLauncher'
						HiddenValueKey='OrganizationID' DataObjectDefinitionKey='Organization' StoredValue='OrganizationID'
						DisplayValue='CommonOrganizationName' RequiredField='True' ErrorMessage='~~Organization~~ is required.'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='InstitutionalComponent'>
					<Control ID='ctlInstitutionalComponent' Container='spnInstitutionalComponent' Type='cTextBox'
						Size='75' MaxLength='250' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Dept'>
					<Control ID='ctlPrimaryDepartment' Container='spnPrimaryDepartment' Type='cTextBox' Size='75'
						MaxLength='100' RequiredField='False' ErrorMessage='Primary Department is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='DepartmentOther'>
					<Control ID='ctlSecondaryDepartment' Container='spnSecondaryDepartment' Type='cTextBox' Size='75'
						MaxLength='100' RequiredField='False' ErrorMessage='Secondary Department is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address1'>
					<Control ID='ctlAddress1' Container='spnAddress1' Type='cTextBox' Size='35' MaxLength='150'
						RequiredField='True' ErrorMessage='Address 1 is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address2'>
					<Control ID='ctlAddress2' Container='spnAddress2' Type='cTextBox' Size='35' MaxLength='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address3'>
					<Control ID='ctlAddress3' Container='spnAddress3' Type='cTextBox' Size='35' MaxLength='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='City'>
					<Control ID='ctlCity' Container='spnCity' Type='cTextBox' Size='10' MaxLength='50' RequiredField='True'
						ErrorMessage='City is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='StateID'>
					<Control ID='ctlState' Container='spnState' Type='cDropDown' DataObjectDefinitionKey='State'
						StoredValue='StateID' DisplayValue='StateAbbr' RequiredField='True' ErrorMessage='State/province is required.'>
						<Filters>
							<Argument PropertyKey='StateID' Operator='LessThanEqual' Value='51' />
						</Filters>
						<Sort>
							<Argument PropertyKey='StateAbbr' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Zip'>
					<Control ID='ctlZip' Container='spnZip' Type='cTextBox' Size='10' MaxLength='30' RequiredField='True'
						ErrorMessage='Zip is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CountryID'>
					<Control ID='ctlCountry' Container='spnCountry' Type='cDropDown' DataObjectDefinitionKey='Country'
						StoredValue='CountryID' DisplayValue='CountryDesc' DisplayNone='False' RequiredField='True'
						ErrorMessage='Country is required.' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Phone' DataObjectDefinitionKey='Phone' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProjectPersonAffiliation' DataObjectPropertyKey='PersonID'
					PropertyKey='EntityID' />
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1' />
				<Argument Type='' TypeKey='' PropertyKey='PhoneTypeID' Value='1' />
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' />
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1' />
				<Argument Type='' TypeKey='' PropertyKey='PhoneTypeID' Value='1' />
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='ctlPhoneNumber' Container='spnPhoneNumber' Type='cTextBox' Size='15' MaxLength='20'
						RequiredField='True' ErrorMessage='Phone Number is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PhoneExt'>
					<Control ID='ctlPhoneExt' Container='spnPhoneExt' Type='cTextBox' Size='15' MaxLength='10'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,10}\s?$' ErrorMessage='Extension is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Fax' DataObjectDefinitionKey='Phone' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProjectPersonAffiliation' DataObjectPropertyKey='PersonID'
					PropertyKey='EntityID' />
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1' />
				<Argument Type='' TypeKey='' PropertyKey='PhoneTypeID' Value='4' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' />
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1' />
				<Argument Type='' TypeKey='' PropertyKey='PhoneTypeID' Value='4' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='ctlFaxNumber' Container='spnFaxNumber' Type='cTextBox' Size='15' MaxLength='20'
						RequiredField='True' ErrorMessage='Fax Number is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Fax Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' Container='spnSave' Type='cButton' Image='Save'>
						<Action PostBack='True' AutoSave='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='OrganizationContacts' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel' Container='spnCancel' Type='cButton' Image='Close'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='OrganizationContacts' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
