<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cCurrentContactInfo_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>



<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />
<br>


<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Applicant Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width='25%'><b>Name&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnPrefix' runat='server'/></td>
	</tr>
	<tr>		
		<td></td>
		<td>Prefix</td>	
	</tr>
	<tr>
		<td></td>
		<td>
			<table border='0' cellspacing='0' cellpadding='0'>
				<tr>
					<td><span id='spnFirst' runat='server'/></td>
					<td><span id='spnMiddle' runat='server'/></td>	
					<td><span id='spnLast' runat='server'/></td> 	
				</tr>
				<tr>
					<td>First&nbsp;<%=kDenoteRequiredField%></td>	
					<td>Middle</td>
					<td>Last&nbsp;<%=kDenoteRequiredField%></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td></td>
		<td><span id='spnSuffix' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td>Suffix</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>Degree</b></td>
		<td><span id='spnDegree' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td	valign="top"><b>E-mail Address&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnEmail' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td	valign="top"><b><%=GetLabel("Organization")%>&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnOrgSelectLauncher' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
	<tr visible='FALSE' runat='server'>
		<td	valign="top"><b>Effective Date&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnEffectiveDate' runat='server'/></td>
	</tr>
	<tr visible='FALSE' runat='server'>
		<td	valign="top">&nbsp;</td>
		<td>MM/DD/YYYY</td>
	</tr>
	
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td	valign="top"><b>Department</b></td>
		<td><span id='spnPrimaryOrgDept' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td><td style="font-size: xx-small">(Enter a maximum of 100 characters)</td></tr> 
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td	valign="top"><b>Division</b></td>
		<td><span id='spnPrimaryOrgDivision' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td><td style="font-size: xx-small">(Enter a maximum of 255 characters)</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Country of Citizenship&nbsp;</b><%=kDenoteRequiredField%>&nbsp;</td>
		<td><span id='spnCountryCitizenship' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td><b>Immigration (Status/Visa)&nbsp;</b><%=kDenoteRequiredField%>&nbsp;</td>
		<td><span id='spnImmigrationStatusVisa' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrefixID'>
					<Control ID='ctlPrefix'
						Container='spnPrefix'
						Type='cDropDown'
						DataObjectDefinitionKey='Prefix'
						StoredValue='PrefixID'
						DisplayValue='Prefix'>
						<Sort>
	                            <Argument PropertyKey='SortOrder'/>
                        </Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='ctlFirst'
						Container='spnFirst'
						Type='cTextBox'
						Size='25'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='First Name is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='MiddleName'>
					<Control ID='ctlMiddle'
						Container='spnMiddle'
						Type='cTextBox'
						Size='15'
						MaxLength='50'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='LastName'>
					<Control ID='ctlLast'
						Container='spnLast'
						Type='cTextBox'
						Size='25'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Last Name is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='SuffixID'>
					<Control ID='ctlSuffix'
						Container='spnSuffix'
						Type='cDropDown'
						DataObjectDefinitionKey='Suffix'
						StoredValue='SuffixID'
						DisplayValue='Suffix'>
						<Sort>
	                            <Argument PropertyKey='SortOrder'/>
                        </Sort>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>


		<DataObject Key='GranteeProjectPI' DataObjectDefinitionKey='GranteeProjectPI' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='PITypeID' Value='1'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Degree'>
					<Control ID='ctlDegree'
						Container='spnDegree'
						Type='cTextBox'
						Size='5'
						MaxLength='50'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='OrganizationDepartment'>
					<Control ID='ctlPrimaryOrgDept'
						Container='spnPrimaryOrgDept'
						Type='cTextBox'
						Size='50'
						MaxLength='100'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='InstitutionalComponent'>
					<Control ID='ctlPrimaryOrgDivision'
						Container='spnPrimaryOrgDivision'
						Type='cTextBox'
						Size='50'
						MaxLength='255'>
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
						ErrorMessage='Country of Citizenship is required.'>
						<Filters>
						    <Argument Type='' TypeKey='' PropertyKey='CountryID' Operator='NotEqual' Value='1'></Argument>    
                        	<Argument PropertyKey='SequenceNumber' Operator='NotEqual' Value='249'/>                                       
						</Filters>
						<Sort>
	                            <Argument PropertyKey='SortOrder'/>
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
						ErrorMessage='Immigration Status/Visa is required.'>
						<Filters>
						</Filters>
						<Sort>
	                        <Argument PropertyKey='ImmigrationDesc'/>
                        </Sort>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Email' DataObjectDefinitionKey='Email' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='Data' TypeKey='EntityTypeID' PropertyKey='EntityTypeID' Value='1'/>
				<Argument Type='Data' TypeKey='IsPrimary' PropertyKey='IsPrimary' Value='True'/>
			</Filters>
			<DefaultValues>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='ctlEmail'
						Container='spnEmail'
						Type='cEmailTextBox'
						Size='30'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='E-mail Address is required.'>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DefaultValues>
				<!-- <Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/> -->
			</DefaultValues>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName'>
					<Control ID='ctlOrgSelectLauncher' 
					Type='cOrgSelectLauncherNotInList'
					Container='spnOrgSelectLauncher'
					HiddenValueKey='PrimaryOrganizationID'
					DataObjectDefinitionKey='Organization'
					StoredValue='OrganizationID'
					DisplayValue='CommonOrganizationName'
					RequiredField='True'
					ErrorMessage='~~Organization~~ is required.'/>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='EffectiveDate'>
					<Control ID='ctlEffectiveDate'
						Container='spnEffectiveDate'
						Type='cDateTextBox'
						Size='25'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						RequiredField='True'
						ErrorMessage='Effective Date is required.'>
					</Control>
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->
