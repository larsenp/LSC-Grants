<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cPeople_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<!-- Page Content - Controls -->
<table width='100%' border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>References Editor</b></td>
</tr>
<tr><td>&nbsp;</td></tr>
<!-- Control Label (for Name information) -->
<tr>
	<td align='right'><b>Prefix</b>&nbsp;</td>
	<td><span id='spnPrefix' runat='server'/></td>
</tr>
<tr>
	<td align='right'><b>Type</b>&nbsp;<font color='red'>*</font></td>
	<td><span id='spnType' runat='server'/></td>
</tr>
<tr>
	<td align='right'><b>First Name</b>&nbsp;<font color='red'>*</font></td>
	<td><span id='spnFirst' runat='server'/></td>
</tr>
<tr>
	<td align='right'><b>Middle Name/Initial</b>&nbsp;</td>
	<td><span id='spnMiddle' runat='server'/></td>
</tr>
<tr>
	<td align='right'><b>Last Name</b>&nbsp;<font color='red'>*</font></td>
	<td><span id='spnLast' runat='server'/></td>
</tr>
<tr>
	<td align='right'><b>Suffix</b>&nbsp;</td>
	<td><span id='spnSuffix' runat='server'/></td>
</tr>
<tr>
	<td align='right'><b>Degrees</b>&nbsp;<font color='red'>*</font></td>
	<td><span id='spnDegree' runat='server'/></td>
</tr>
<tr>
	<td align='right'><b>Title</b>&nbsp;<font color='red'>*</font></td>
	<td><span id='spnTitle' runat='server'/></td>
</tr>
<tr>
	<td align='right'><b><%=GetLabel("Organization")%></b>&nbsp;<font color='red'>*</font></td>
	<td><span id='spnOrgSelectLauncher' runat='server'/></td>
</tr>

<tr>
	<td align='right'><b>Primary Department</b>&nbsp;<font color='red'>*</font></td>
	<td><span id='spnPrimaryDepartment' runat='server'/></td>
</tr>

<tr>
	<td align='right'><b>E-mail</b>&nbsp;<font color='red'>*</font></td>
	<td><span id='spnEmail' runat='server'/></td>
</tr>
<tr>
	<td	align='right'>&nbsp;</td>
	<td>Enter your area code and number - with no extra characters, i.e., 1234567890.</td>
</tr>
<tr>
	<td align='right'><b>Primary Phone</b>&nbsp;<font color='red'>*</font></td>
	<td>
		<span id='spnPhoneNumber' runat='server'/>&nbsp;&nbsp;&nbsp;
		<b>Ext.</b>&nbsp;<span id='spnPhoneExt' runat='server'/>
	</td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
</table>
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel'/>			
	</td>
</tr>

</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='PersonRelationship' DataObjectDefinitionKey='PersonRelationship' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonRelationshipID'
					PropertyKey='PersonRelationshipID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='RelatedPersonRoleID' Value='4' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='RelatedPersonID' Value='-1' CreateNew='True' Update='False'/>
				<Argument Type='' TypeKey='' PropertyKey='RelatedPersonRoleID' Value='4'/>
			</DefaultValues>			
			<DisplayProperties>
				<DisplayProperty PropertyKey='RelatedPersonReferenceTypeID'>
					<Control ID='ctlType'
						Container='spnType'
						Type='cDropDown'
						DataObjectDefinitionKey='ReferenceTypeEMF'
						StoredValue='ReferenceTypeEMFID'
						DisplayValue='Abbr'
						RequiredField='True'
						ErrorMessage='Type is required.'>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='RelatePersonDisplayPrefix'>
					<Control ID='ctlPrefix'
						Container='spnPrefix'
						Type='cDropDown'
						DataObjectDefinitionKey='Prefix'
						StoredValue='PrefixID'
						DisplayValue='Prefix'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='RelatePersonDisplayFirstName'>
					<Control ID='ctlFirst'
						Container='spnFirst'
						Type='cTextBox'
						Size='30'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='First Name is required.'>
						<Validation Type='Custom' Object='EventController' Method='ValidateDuplicateRefType' ErrorMessage='The Reference Type you selected already exists for this applicant.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayMiddleName'>
					<Control ID='ctlMiddle'
						Container='spnMiddle'
						Type='cTextBox'
						Size='30'
						MaxLength='50'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='RelatePersonDisplayLastName'>
					<Control ID='ctlLast'
						Container='spnLast'
						Type='cTextBox'
						Size='30'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Last Name is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplaySuffixID'>
					<Control ID='ctlSuffix'
						Container='spnSuffix'
						Type='cDropDown'
						DataObjectDefinitionKey='Suffix'
						StoredValue='SuffixID'
						DisplayValue='Suffix'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='RelatePersonDisplayDegree'>
					<Control ID='ctlDegree'
						Container='spnDegree'
						Type='cTextBox'
						Size='30'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Degree is required.'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='RelatePersonDisplayTitle'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='30'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Title is required.'/>
				</DisplayProperty>
				<!--
				<DisplayProperty PropertyKey='RelatePersonDisplayInstitutionName'>
					<Control ID='ctlInstitution'
						Container='spnInstitution'
						Type='cTextBox'
						Size='100'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='You must enter an Institution.'/>
				</DisplayProperty>
				-->
				<DisplayProperty PropertyKey='RelatePersonDisplayOrganization.CommonOrganizationName'>
					<Control ID='ctlOrgSelect'
						Type='cOrgSelectLauncherEMF'
						Container='spnOrgSelectLauncher'
						HiddenValueKey='RelatePersonDisplayOrganizationID'
						DataObjectDefinitionKey='Organization'
						StoredValue='OrganizationID'
						DisplayValue='CommonOrganizationName'
						RequiredField='True'
						ErrorMessage='~~Organization~~ is required.'>
					</Control>
				</DisplayProperty>
				
				<!--
				<DisplayProperty PropertyKey='RelatePersonDisplayInstitutionalComponent'>
					<Control ID='ctlInstitutionalComponent'
						Container='spnInstitutionalComponent'
						Type='cTextBox'
						Size='100'
						MaxLength='200'/>
				</DisplayProperty>
				-->
				<DisplayProperty PropertyKey='RelatePersonDisplayDepartment'>
					<Control ID='ctlPrimaryDepartment'
						Container='spnPrimaryDepartment'
						Type='cTextBox'
						Size='100'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Primary Department is required.'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='RelatePersonDisplayEmail'>
					<Control ID='ctlEmail'
						Container='spnEmail'
						Type='cEmailTextBox'
						Size='100'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='E-mail address is required.'>
						<Validation Type='Custom' Object='EventController' Method='ValidateDuplicateUserName' ErrorMessage='The e-mail address you entered already exists in the system.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayPhone'>
					<Control ID='ctlPhone'
						Container='spnPhoneNumber'
						Type='cTextBox'
						Size='10'
						MaxLength='20'
						RequiredField='True'
						ErrorMessage='Phone Number is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayPhoneExt'>
					<Control ID='ctlPhoneExt'
						Container='spnPhoneExt'
						Type='cTextBox'
						Size='5'
						MaxLength='10'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,10}\s?$' ErrorMessage='Extension is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='References'/>
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='References'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
