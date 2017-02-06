<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cCoPrincipal_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<br><br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td> <span id='spnPageContent' runat='server' /></td></tr>
</table>
<br>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Add or Edit Personnel Information</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width="100%">
<!-- Control Label (for Organization information) -->
	<tr>
		<td	width='15%'><b>Name&nbsp;</b><%=kDenoteRequiredField%></td>
		<td colspan="3"><span id='spnPrefix' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="3"><b>Prefix&nbsp;</b></td>
	</tr>
	<tr>
		<td></td>
		<td><span id='spnFirst' runat='server'/></td>
		<td><span id='spnMiddle' runat='server'/></td>
		<td><span id='spnLast' runat='server'/><b><span id='spnIsPrimary' runat='server' visible='false'/>&nbsp;</b></td> 	
	</tr>
	<tr>
		<td></td>	
		<td>First&nbsp;<%=kDenoteRequiredField%></td>
		<td>Middle</td>
		<td>Last&nbsp;<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td></td>
		<td  colspan="3"><span id='spnSuffix' runat='server'/></td>
	</tr>
	<tr>		
		<td></td>
		<td  colspan="3">Suffix</td>	
	</tr>
	<tr>
		<td></td>
		<td  colspan="3"><span id='spnTitle' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td  colspan="3">Title</td>	
	</tr>
	<tr>
		<td><b><%=GetLabel("Organization")%>&nbsp;</b><%=kDenoteRequiredField%></td>
		<td  colspan="3"><span id='spnOrganizationName' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Project Role&nbsp;</b><%=kDenoteRequiredField%></td>
		<td colspan="3" ><span id='spnProjectRole' runat='server'/></td>
	</tr>
	<tr>
		<td	width='15%'><b>Address&nbsp;</b><%=kDenoteRequiredField%></td>
		<td colspan="3"><span id='spnAddress1' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="3">Address Line 1&nbsp;<%=kDenoteRequiredField%></td>	
	</tr>
	<tr>
		<td	width='15%'></td>
		<td colspan="3"><span id='spnAddress2' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="3">Address Line 2</td>	
	</tr>
	<tr>
		<td	width='15%'></td>
		<td colspan="3"><span id='spnAddress3' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="3">Address Line 3</td>	
	</tr>
	<tr>
		<td></td>
		<td>&nbsp;<span id='spnCity' runat='server' />&nbsp;</td>
		<td>&nbsp;<span id='spnState' runat='server' />&nbsp;</td>
		<td>&nbsp;<span id='spnZip' runat='server' />&nbsp;</td>
	</tr>
	<tr>
		<td></td>
		<td>City&nbsp;<%=kDenoteRequiredField%></td>	
		<td>State&nbsp;<%=kDenoteRequiredField%></td>	
		<td>Zip/Postal Code&nbsp;<%=kDenoteRequiredField%></td>	
	</tr>
	<tr>
		<td	width='15%'></td>
		<td colspan="3" >&nbsp;<span id='spnRegion' runat='server' /></td>
	</tr>
	<tr>
		<td></td>
		<td  colspan="3">Region</td>	
	</tr>
	<tr>
		<td	width='15%'></td>
		<td colspan="3" >&nbsp;<span id='spnCountry' runat='server' /></td>
	</tr>
	<tr>
		<td></td>
		<td  colspan="3">Country&nbsp;<%=kDenoteRequiredField%></td>	
	</tr>
	<tr>
		<td	width='15%'><b>Phone (Business)&nbsp;</b><%=kDenoteRequiredField%></td>
		<td ><span id='spnPhone' runat='server'/></td>
		<td   colspan="2"><span id='spnExt' runat='server'/></td>
	</tr>
	<tr>
		<td	width='15%'></td>
		<td >Enter number only</td>
		<td   colspan="2">Extension</td>
	</tr>
	<tr>
		<td	width='15%'><b>Fax </b></td>
		<td colspan="3" ><span id='spnFax' runat='server'/></td>
	</tr>
	<tr>
		<td	width='15%'></td>
		<td  colspan="3">Enter number only</td>
	</tr>
    <tr>
		<td ><b>E-mail (Business)&nbsp;</b><%=kDenoteRequiredField%></td>
		<td  colspan="3"><span id='spnEmail' runat='server' /></td>
	</tr>
	<tr><td  colspan="4">&nbsp;</td></tr>
	<tr>
		<td colspan="4" align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveContinue' /> 
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProjectPI' DataObjectDefinitionKey='GranteeProjectPI' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='QueryString' TypeKey='GranteeProjectPIID' PropertyKey='GranteeProjectPIID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='PITypeID' Value='2'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrefixID'>
					<Control ID='ctlPrefix'
						Container='spnPrefix'
						Type='cDropDown'
						DataObjectDefinitionKey='Prefix'
						StoredValue='PrefixID'						
						DisplayText='None'
						DisplayValue='Prefix'>
						<Sort>
							<Argument PropertyKey='Prefix' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='ctlFirst'
						Container='spnFirst'
						Type='cTextBox'
						Size='25'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='First Name is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='MiddleName'>
					<Control ID='ctlMiddle'
						Container='spnMiddle'
						Type='cTextBox'
						Size='10'
						MaxLength='100'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='LastName'>
					<Control ID='ctlLast'
						Container='spnLast'
						Type='cTextBox'
						Size='25'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Last Name is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsPrimary'>
					<Control ID='ctlIsPrimary'
						Container='spnIsPrimary'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='Primary'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='SuffixID'>
					<Control ID='ctlSuffix'
						Container='spnSuffix'
						Type='cDropDown'
						DataObjectDefinitionKey='Suffix'
						StoredValue='SuffixID'
						DisplayText='None'
						DisplayValue='Suffix'>
						<Sort>
							<Argument PropertyKey='Suffix' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='25'
						MaxLength='50'>
					</Control>	
				</DisplayProperty>	
			    <DisplayProperty PropertyKey='OrganizationID'>
				    <Control ID='ctlOrgSelectLauncher' 
				    Type='cOrgSelectLauncherNotInList'
				    Container='spnOrganizationName'
				    HiddenValueKey='OrganizationID'
				    DataObjectDefinitionKey='Organization'
				    StoredValue='OrganizationID'
				    DisplayValue='CommonOrganizationName'
				    RequiredField='True'
				    ErrorMessage='~~Organization~~ is required.'/>
			    </DisplayProperty>			
				<DisplayProperty PropertyKey='GranteeAffiliationTypeID'>
					<Control ID='ctlProjectRole'
						Container='spnProjectRole'
						Type='cDropDown'
						DataObjectDefinitionKey='AdditionalContactRole'
						StoredValue='AdditionalContactRoleID'
						DisplayText='Select'
						DisplayValue='Description'
						RequiredField='True'
						ErrorMessage='Project Role is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Address1'>
					<Control ID='ctlAddress1'
						Type='cTextBox'
						Container='spnAddress1'
						Size='60'
						MaxLength='300'
						RequiredField='True'
						ErrorMessage='Address Line 1 is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address2'>
					<Control ID='ctlAddress2'
						Type='cTextBox'
						Container='spnAddress2'
						Size='60'
						MaxLength='100'
						RequiredField='False'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address3'>
					<Control ID='ctlAddress3'
						Type='cTextBox'
						Container='spnAddress3'
						Size='60'
						MaxLength='100'
						RequiredField='False'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='City'>
					<Control ID='ctlCity'
						Type='cTextBox'
						Container='spnCity'
						Size='20'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='City is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StateID'>
					<Control ID='ctlState'
						Container='spnState'
						Type='cDropDown'
						DataObjectDefinitionKey='State'
						StoredValue='StateID'
						DisplayValue='StateAbbr'
						RequiredField='True'
						DisplayText='Select'
						ErrorMessage='State/Province is required.'>
						<Sort>
							<Argument PropertyKey='StateAbbr' Direction='Ascending'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Zip'>
					<Control ID='ctlZip'
						Type='cTextBox'
						Container='spnZip'
						Size='12'
						MaxLength='30'
						RequiredField='True'
						ErrorMessage='Zip/Postal Code is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Region'>
					<Control ID='ctlRegion'
						Type='cTextBox'
						Container='spnRegion'
						Size='25'
						MaxLength='50'
						RequiredField='False'
						ErrorMessage='Region is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CountryID'>
					<Control ID='ctlCountry'
						Container='spnCountry'
						Type='cDropDown'
						DataObjectDefinitionKey='Country'
						StoredValue='CountryID'
						DisplayValue='CountryDesc'	
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Country is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder'/>
						</Sort>
						<SelectedValue>
							<Argument PropertyKey='CountryID' Value='280' />
						</SelectedValue>
					</Control>
				</DisplayProperty>																					
				<DisplayProperty PropertyKey='PhoneNumber'>
					<Control ID='ctlPhone'
						Type='cTextBox'
						Container='spnPhone'
						Size='25'
						MaxLength='20'
						RequiredField='True'
						ErrorMessage='Phone is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PhoneExt'>
					<Control ID='ctlPhoneExt'
						Type='cTextBox'
						Container='spnExt'
						Size='10'
						MaxLength='10'
						RequiredField='False'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,10}\s?$' ErrorMessage='Extension is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FaxNumber'>
					<Control ID='ctlFax'
						Type='cTextBox'
						Container='spnFax'
						Size='10'
						MaxLength='10'
						RequiredField='False'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,10}\s?$' ErrorMessage='Extension is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>																			
				<!--<DisplayProperty PropertyKey='OrganizationName'>
					<Control ID='ctlOrganizationName'
						Container='spnOrganizationName'
						Type='cTextBox'
						Size='50'
						MaxLength='75'
						RequiredField='False'
						ErrorMessage='Enter an Organization Name.'>
					</Control>
				</DisplayProperty>	-->
				<DisplayProperty PropertyKey='Email'>
					<Control ID='ctlEmail'
						Container='spnEmail'
						Type='cEmailTextBox'
						Size='40'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='E-mail is required.'>
					</Control>
				</DisplayProperty>													
				
				
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton' Caption='Save'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'	
                            Object='EventController'
                            Method='DataPresenter_Reload_After_Save'>							    								
							<Parameters>								
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectPI' DataObjectPropertyKey='GranteeProjectPIID' PropertyKey='GranteeProjectPIID' BaseValue='GranteeProjectPIID='/>									
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>			
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Container='spnSaveContinue'
						Type='cButton' Caption='Save and Close'
						Image='Save_and_Continue'>
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
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument AttributeName='PageKey' Value='PrincipalInvestigator'/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
<!-- End Embedded XML -->
</span>
