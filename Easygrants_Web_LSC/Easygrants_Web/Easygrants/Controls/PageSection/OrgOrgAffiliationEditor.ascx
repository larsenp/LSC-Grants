<%@ Control Language="vb" AutoEventWireup="True" Inherits="Easygrants_Web.Controls.PageSection.cOrgOrgAffiliationEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' ID="Cuserctlloader1"/>
<br>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b><%=GetLabel("Organization")%> Affiliation Editor</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table width='100%' cellpadding='2' border='0'>
	<tr>
		<td colspan='3'><b><%=GetLabel("Organization")%>:</b>&nbsp;<span runat='server' id='spnOrgName'/></td>
		
	</tr>
	<tr>
		<td  width='17%'><b>Parent <%=GetLabel("Organization")%> Type&nbsp;</b><%=kDenoteRequiredField%></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnParentOrgType'/></td>
	</tr>
	<tr>
		<td  width='17%'><b>Affiliated <%=GetLabel("Organization")%> Name&nbsp;</b><%=kDenoteRequiredField%></td>
		<td>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlOrg' Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx' runat='server'
				id="CUserCtlLoader2" />
		</td>
	</tr>
	<tr>
		<td  width='17%'>&nbsp;</td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnNewOrg'/></td>
	</tr>
	<tr>
		<td  width='17%'><b>Affiliated Organization Type&nbsp;</b><%=kDenoteRequiredField%></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnAffiliatedOrgType'/></td>
	</tr>
	<tr><td  width='17%'>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
	<tr><td  width='17%'>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
	<tr><td colspan='3' align='center'><span runat='server' id='spnSave'/><span runat='server' id='spnSaveAndClose'/><span runat='server' id='spnClose'/></td></tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Organization' DataObjectDefinitionKey='Organization' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EntityID' PropertyKey='OrganizationID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CommonOrganizationName' >
					<Control ID='spnOrgName' 
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>					
		<DataObject Key='EntityAffiliation' DataObjectDefinitionKey='EntityAffiliation' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='AffilEntityID' PropertyKey='EntityAffiliationID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='EntityID' PropertyKey='EntityID' />
				<Argument PropertyKey='EntityTypeID' Value='2'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='EntityAffiliationTypeID'>
					<Control ID='ctlParentOrgType'
						Container='spnParentOrgType'
						Type='cDropDown'
						RequiredField='True'
						DataObjectDefinitionKey='EntityAffiliationType'
						ErrorMessage='Parent ~~Organization~~ Type is required.'
						StoredValue='EntityAffiliationTypeID'						
						DisplayValue='Abbr'
						DisplayText='Select'>
						<Filters>
							<Argument Type='QueryString' TypeKey='EntityTypeID' PropertyKey='EntityTypeID'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='Abbr' />
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='AffiliatedEntityID' PropertyValue='AffiliatedOrganization.CommonOrganizationName' ReadOnly='QueryID'>
					<Control ID='ctlOrg' Type='cPopUpSelectorLauncher2' LabelText='Selected ~~Organization~~' RequiredField='True' ErrorMessage='Affiliated Organization Name is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlNewOrg'
						Container='spnNewOrg'
						Type='cLink'
						Caption='Add New ~~Organization~~'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='OrganizationEditor'/>
								<Argument Type='' TypeKey='' AttributeName='' Value='OrganizationID=0'/>
								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
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
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='EntityAffiliation' DataObjectPropertyKey='EntityAffiliationID' PropertyKey='EntityAffiliationID' BaseValue='AffilEntityID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
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
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Image='Close'>
						<Action PostBack='True'
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
		<!--JAN -->
		<DataObject Key='EntityAffiliationAffil' DataObjectDefinitionKey='EntityAffiliation' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='EntityAffiliation' DataObjectPropertyKey='EntityID' PropertyKey='AffiliatedEntityID' />
				<Argument Type='DataObjectCollection' TypeKey='EntityAffiliation' DataObjectPropertyKey='AffiliatedEntityID' PropertyKey='EntityID' />
				<Argument PropertyKey='EntityTypeID' Value='2'/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='EntityID' PropertyKey='AffiliatedEntityID' />
				<Argument PropertyKey='EntityTypeID' Value='2'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='EntityAffiliationTypeID'>
					<Control ID='ctlAffiliatedOrgType'
						Container='spnAffiliatedOrgType'
						Type='cDropDown'
						RequiredField='True'
						DataObjectDefinitionKey='EntityAffiliationType'
						ErrorMessage='Affiliated ~~Organization~~ Type is required.'
						StoredValue='EntityAffiliationTypeID'
						DisplayValue='Abbr'
						DisplayText='Select'>
						
						<Filters>
							<Argument Type='QueryString' TypeKey='EntityTypeID' PropertyKey='EntityTypeID'/>
						</Filters>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
		
		<UserCtlLoader>
			<ctlOrg>
				<DataObject Key='OrganizationID' DataObjectDefinitionKey='Organization' DisplayName='~~Organization~~ Name'>
					<SearchProperties>
						<SearchProperty DisplayValue='CommonOrganizationName' DisplayLabel='~~Organization~~ Name'/>
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='CommonOrganizationName'/>
					</DisplayProperties>
				</DataObject>
			</ctlOrg>
		</UserCtlLoader>
	</ModuleSection>
</span>
	
