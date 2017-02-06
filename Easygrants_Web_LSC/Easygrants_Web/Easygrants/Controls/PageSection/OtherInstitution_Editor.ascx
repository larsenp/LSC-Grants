<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Easygrants:ValSumm id='ctlValSumm' runat='server'/>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Other <%=GetLabel("Organization")%>s Editor</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server'>
<!-- Control Label (for Organization information) -->
	<tr>
		<td	width="25%" align="right"><b><%=GetLabel("Organization")%>&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnOrgSelectLauncher' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width="25%" align="right"><b><%=GetLabel("Organization")%> Component &nbsp;</b></td>
		<td><span id='spnInstitutionalComponent' runat='server'/></td>
	</tr>
	<tr>		
		<td></td>
		<td>School, e.g., Medicine, or campus, e.g., SUNY at Buffalo</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width="25%" align="right"><b><%=GetLabel("Organization")%> Type &nbsp;</b></td>
		<td><span id='spnInstitutionType' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width="25%" align="right"><b>Address 1&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnAddress1' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width="25%" align="right"><b>Address 2 &nbsp;</b></td>
		<td><span id='spnAddress2' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width="25%" align="right"><b>Address 3 &nbsp;</b></td>
		<td><span id='spnAddress3' runat='server'/></td>
	</tr>
	<tr>
		<td	width="25%" align="right"></td>
		<td>
			Use this field to indicate Province/Region and Country, if location is 
			not in the US.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width="25%" align="right"><b>City&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnCity' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width="25%" align="right"><b>State &nbsp;</b></td>
		<td><span id='spnState' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width="25%" align="right"><b>Zip/Postal Code &nbsp;</b></td>
		<td><span id='spnZip' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width="25%" align="right"><b>Country&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnCountry' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td></td>
		<td align="center">
			<span runat='server' id='spnSave'/> 
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectOtherInstitution' DataObjectDefinitionKey='GranteeProjectOtherInstitution' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectOtherInstitutionID'
					PropertyKey='GranteeProjectOtherInstitutionID' Value='' bool=''/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
				<!--
				<DisplayProperty PropertyKey='Name'>
					<Control ID='ctlInstitution'
						Container='spnInstitution'
						Type='cTextBox'
						Size='75'
						MaxLength='255'
						RequiredField='True'
						ErrorMessage='You must enter an Institution.'>
					</Control>
				</DisplayProperty>
				-->
				<DisplayProperty PropertyKey='Organization.CommonOrganizationName'>
					<Control ID='ctlOrgSelect'
						Type='cOrgSelectLauncherEMF'
						Container='spnOrgSelectLauncher'
						HiddenValueKey='OrganizationID'
						DataObjectDefinitionKey='Organization'
						StoredValue='OrganizationID'
						DisplayValue='CommonOrganizationName'
						RequiredField='True'
						ErrorMessage='~~Organization~~ is required.'>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='InstitutionalComponent'>
					<Control ID='ctlInstitutionalComponent'
						Container='spnInstitutionalComponent'
						Type='cTextBox'
						Size='75'
						MaxLength='255'
						RequiredField='False'
						ErrorMessage='Institution Component is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TypeID'>
					<Control ID='ctlInstitutionType'
						Container='spnInstitutionType'
						Type='cDropDown'
						DataObjectDefinitionKey='OrganizationType'
						StoredValue='TypeID'
						DisplayValue='OrganizationAbbr'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address1'>
					<Control ID='ctlAddress1'
						Type='cTextBox'
						Container='spnAddress1'
						Size='75'
						MaxLength='150'
						RequiredField='True'
						ErrorMessage='Address 1 is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address2'>
					<Control ID='ctlAddress2'
						Type='cTextBox'
						Container='spnAddress2'
						Size='75'
						MaxLength='100'
						RequiredField='False'
						ErrorMessage='Address 2 is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address3'>
					<Control ID='ctlAddress3'
						Type='cTextBox'
						Container='spnAddress3'
						Size='75'
						MaxLength='100'
						RequiredField='False'
						ErrorMessage='Address 3 is required.'>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='City'>
					<Control ID='ctlCity'
						Container='spnCity'
						Type='cTextBox'
						Size='30'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='City is required.'>
					</Control>
				</DisplayProperty>
				<!--
				<DisplayProperty PropertyKey='StateProvinceRegion'>
					<Control ID='ctlStateProvinceRegion'
						Container='spnStateProvinceRegion'
						Type='cTextBox'
						Size='75'
						MaxLength='100'
						RequiredField='False'
						ErrorMessage='You must enter a State/Province/Region.'>
					</Control>
				</DisplayProperty>
				-->
				<DisplayProperty PropertyKey='StateID'>
					<Control ID='ctlState'
						Container='spnState'
						Type='cDropDown'
						DataObjectDefinitionKey='State'
						StoredValue='StateID'
						DisplayValue='StateAbbr'>
						<Filters>
							<Argument PropertyKey='StateID' Operator='LessThanEqual' Value='51'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='StateAbbr'/>
						</Sort>
					</Control>	
				</DisplayProperty>	

				<DisplayProperty PropertyKey='Zip'>
					<Control ID='ctlZip'
						Type='cTextBox'
						Container='spnZip'
						Size='30'
						MaxLength='30'
						RequiredField='False'
						ErrorMessage='Zip/Postal Code is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CountryID'>
					<Control ID='ctlCountry'
						Container='spnCountry'
						Type='cDropDown'
						DataObjectDefinitionKey='Country'
						StoredValue='CountryID'
						DisplayValue='CountryDesc'
						DisplayNone='False'
						RequiredField='True'
						ErrorMessage='Country is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder'/>
						</Sort>
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='OtherInstitutions'/>
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
								<Argument AttributeName='PageKey' Value='OtherInstitutions'/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
