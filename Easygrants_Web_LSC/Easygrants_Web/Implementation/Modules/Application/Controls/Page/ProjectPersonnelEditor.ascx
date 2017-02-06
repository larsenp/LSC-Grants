<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cProjectPersonnelEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="ProjectPersonnelEditor.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<!-- Page Content - Controls -->
<br>
Please provide contact information for your Project Personnel.  All fields marked with an asterisk (<font color='red'>*</font>) are required. 
<!-- Dashed list changed to a bulleted list by Basil Eliopoulos June 23, 2005 8:52 p.m. per QA task. --> 

<ul>
   <li>Click <b>Save</b> to save the information and return to the main Project Personnel page.</li> 
   <li>Click <b>Close</b> to close the Project Personnel Editor without saving your entry.</li>   
</ul>    

<table width='100%' border='0' cellspacing='0' cellpadding='0' runat='server'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Project Personnel Contact Information</b></td>
</tr>
<tr><td colspan='4'>&nbsp;</td></tr>
<!-- Control Label (for Name information) -->
<tr>
	<td><b>Role</b>&nbsp;<font color='red'>*</font>&nbsp;</td>
	<td colspan='3'><span id='spnRole' runat='server'/></td>
</tr>
<tr><td colspan='4'>&nbsp;</td></tr>
<tr>
	<td valign='top'><b>Name</b>&nbsp;<font color='red'>*</font>&nbsp;</td>
	<td colspan='3'>
	<table><tr><td><span id='spnPrefix' runat='server'/></td>
		<tr><td colspan='3'>Prefix</td>
		<tr><td><span id='spnFirst' runat='server'/></td>
			<td><span id='spnMiddle' runat='server'/></td>
			<td><span id='spnLast' runat='server'/></td>
		<tr><td>First</td>
			<td>Middle</td>
			<td>Last</td>
		<tr><td colspan='3'><span id='spnSuffix' runat='server'/></td>
		<tr><td colspan='3'>Suffix</td>
	</table>
	</td>
</tr>
<tr>
	<td><b>E-mail Address</b>&nbsp;<font color='red'>*</font>&nbsp;</td>
	<td colspan='3'><span id='spnEmail' runat='server'/></td>
</tr>
<tr><td colspan='4'>&nbsp;</td></tr>
<tr>
	<td><b>Phone</b>&nbsp;</td>
	<td colspan='3'><span id='spnPhone' runat='server'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ext.<span id='spnPhoneExt' runat='server'/></td>
</tr>
<tr><td colspan='4'>&nbsp;</td></tr>
<tr>
	<td><b><%=GetLabel("Organization")%></b>&nbsp;<font color='red'>*</font>&nbsp;</td>
	<td colspan='3'><span id='spnInst' runat='server'/></td>
</tr>
<tr><td colspan='4'>&nbsp;</td></tr>
</table>
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
<tr><td colspan='4'>&nbsp;</td></tr>
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
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID'
					PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
		</DataObject>
		<DataObject Key='PersonRelationship' DataObjectDefinitionKey='PersonRelationship' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonRelationshipID'
					PropertyKey='PersonRelationshipID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='RelatedPersonID' Value='-1' CreateNew='True' Update='False'/>
				<Argument Type='' TypeKey='' PropertyKey='Active' Value='True'/>
			</DefaultValues>			
			<DisplayProperties>
				<DisplayProperty PropertyKey='RelatedPersonRoleID'>
					<Control ID='ctlRole'
						Container='spnRole'
						Type='cDropDown'
						DataObjectDefinitionKey='AdditionalContactRole'
						StoredValue='AdditionalContactRoleID'
						DisplayValue='Description'
						RequiredField='True'
						ErrorMessage='Role is required.'>
						<Filters>
							<!--
							<Argument Type='DataObjectCollection' 
								TypeKey='GranteeProject'
								DataObjectPropertyKey='WfProject.CompetitionID'
								PropertyKey='CompetitionID'
								Value='' bool=''/>
							-->
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder'/>
						</Sort>
			
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='RelatePersonDisplayPrefixID'>
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
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayMiddleName'>
					<Control ID='ctlMiddle'
						Container='spnMiddle'
						Type='cTextBox'
						Size='10'
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
				<DisplayProperty PropertyKey='RelatePersonDisplayEmail'>
					<Control ID='ctlEmail'
						Container='spnEmail'
						Type='cEmailTextBox'
						Size='50'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='E-mail address is required.'>
						
						<Validation Type='Custom' Object='EventController' Method='ValidateDuplicateUserName' ErrorMessage='The e-mail address you entered already exists in the system.' />
						
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayOrganization.CommonOrganizationName'>
					<Control ID='ctlOrgSelectLauncher' 
					Type='cOrgSelectLauncherNotInList'
					Container='spnInst'
					HiddenValueKey='RelatePersonDisplayOrganizationID'
					DataObjectDefinitionKey='Organization'
					StoredValue='OrganizationID'
					DisplayValue='CommonOrganizationName'
					RequiredField='True'
					ErrorMessage='~~Organization~~ is required.'/>
				</DisplayProperty>		
				
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Phone' DataObjectDefinitionKey='Phone' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='PersonRelationship' DataObjectPropertyKey='RelatedPersonID' PropertyKey='EntityID' Value='' Bool=''/>
				<Argument Type='Data' TypeKey='IsPrimary'
					PropertyKey='IsPrimary' Value='True' Bool='and'/>					
			</Filters>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='ctlPhone'
						Type='cTextBox'
						Container='spnPhone'
						Size='25'
						MaxLength='20'
						RequiredField='False'
						ErrorMessage='Phone Number is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' /> 
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PhoneExt'>
					<Control ID='ctlPhoneExt'
						Type='cTextBox'
						Container='spnPhoneExt'
						Size='10'
						MaxLength='10'
						RequiredField='False'
						ErrorMessage='Ext. is required.'>
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
								<Argument AttributeName='PageKey' Value='ProjectPersonnel'/>
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
								<Argument AttributeName='PageKey' Value='ProjectPersonnel'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<UserCtlLoader>
			<ctlOrga>
				<DataObject Key='OrganizationID' DataObjectDefinitionKey='Organization'>
					<SearchProperties>
						<SearchProperty DisplayValue='CommonOrganizationName'/>
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='CommonOrganizationName'/>
					</DisplayProperties>
				</DataObject>
			</ctlOrga>
			
		</UserCtlLoader>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
