<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b><%=GetLabel("Organization")%></b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<!-- Control Label (for Organization information) -->
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td	valign="top" width="120"><b><%=GetLabel("Organization")%> Affiliation</b></td>
		<td>
			<span id='spnOrganizationAffiliation' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td	valign="top" width="120"><b>Primary Address</b></td>
		<td>
			<span id='spnPrimaryAddress' runat='server'/>
		</td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<!-- Save Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSave'/> 
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganizationID'>
					<Control ID='ctlOrganizationAffiliation'
						Container='spnOrganizationAffiliation'
						Type='cDropDown'
						DataObjectDefinitionKey='Organization'
						StoredValue='OrganizationID'
						DisplayValue='CommonOrganizationName'>
						<Filters>
							<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''>
								<RelatedProperty PropertyKey='PersonOrganizationAffiliations' />
							</Argument>
						</Filters>
						<Sort>
							<Argument PropertyKey='CommonOrganizationName' />
						</Sort>						
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey='PrimaryAddressID'>
					<Control ID='ctlPrimaryAddress'
						Container='spnPrimaryAddress'
						Type='cDropDown'
						DataObjectDefinitionKey='Address'
						StoredValue='AddressID'
						DisplayValue='Address1'>
						<Filters>
							<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='EntityID' Value=''/>
							<Argument PropertyKey='EntityTypeID' Value='1'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='Address1' />
						</Sort>			
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
