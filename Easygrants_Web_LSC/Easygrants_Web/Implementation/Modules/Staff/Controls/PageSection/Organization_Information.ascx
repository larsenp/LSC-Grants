<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Organization_Information.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cOrganization_Information" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<!-- Control Label (for Name information) -->
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Summary</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td nowrap='true' width='15%'><b>Legal name</b></td>
		<td width='25%'>
			<span id='spnLegalName' runat='server'/>
		</td>
		<td nowrap='true' width='15%'><b>Available for Public Selection</b></td>
		<td width='45%'>
			<span id='spnAvailableInSelector' runat='server'/>
		</td>
	</tr>
	<tr>
		<td nowrap='true' width='15%'><b>Common name</b></td>
		<td>
			<span id='spnCommonName' runat='server'/>
		</td>
	</tr>
	<tr>
		<td nowrap='true' width='15%'><b>EIN</b></td>
		<td>
			<span id='spnEIN' runat='server'/>
		</td>
	</tr>
	<tr>
		<td nowrap='true' width='15%'><b>Type</b></td>
		<td width='25%'>
			<span id="spnOrgType" runat='server'/>
		</td>
		<td nowrap='true' width='15%'><b>Eligibility Status</b></td>
		<td width='45%'>
			<span id='spnEligibilityStatus' runat='server'/>
		</td>
	</tr>
	<tr>
		<td nowrap='true' width='15%'><b><%=GetLabel("Organization")%> ID&nbsp;&nbsp;</b></td>
		<td>
			<span id='spnOrgID2' runat='server'/>
		</td>
	</tr>
	<tr>
		<td nowrap='true' width='15%'><b>Legacy ID&nbsp;&nbsp;</b></td>
		<td>
			<span id='spnLegacyOrgID2' runat='server'/>
		</td>
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='50%'>
	<tr>
		<td nowrap='true' width='125'><b>Created on</b>&nbsp;&nbsp;</td>
		<td nowrap='true' width='125'><span id="spnCreateDate" runat='server'/></td>
		<td nowrap='true' width='125'><b>Modified on</b>&nbsp;&nbsp;</td>
		<td nowrap='true' width='125'><span id='spnChangeDate' runat='server'/></td>
		<td nowrap='true' width='125'><b>Modified by</b>&nbsp;&nbsp;</td>
		<td nowrap='true' width='125'><span id='spnModifiedBy' runat='server'/></td>
	</tr>
</table>

<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td>
			<span id='spnEdit' runat='server'/>&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnDelete' runat='server'/>
		</td>
	</tr>	
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Organization' DataObjectDefinitionKey='Organization' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='EntityID' 
					PropertyKey='OrganizationID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OrganizationName'>
					<Control ID='spnLegalName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CommonOrganizationName'>
					<Control ID='spnCommonName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OrganizationType.OrganizationAbbr'>
					<Control ID='spnOrgType'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OrganizationEligibility.Description'>
					<Control ID='spnEligibilityStatus'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EIN'>
					<Control ID='spnEIN'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AvailableInSelector' Format='YesNo'>
					<Control ID='spnAvailableInSelector'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OrganizationID'>
					<Control ID='spnOrgID2'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegacyOrganizationID'>
					<Control ID='spnLegacyOrgID2'
						Type='HtmlGenericControl'/>
				</DisplayProperty>				
				<DisplayProperty PropertyKey='CreateDate' Format='M/dd/yyyy'>
					<Control ID='spnCreateDate'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifyDate' Format='M/dd/yyyy'>
					<Control ID='spnChangeDate'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifiedByUser.Person.FirstNameLastName'>
					<Control ID='spnModifiedBy'
						Type='HtmlGenericControl'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnEdit'
						Container='spnEdit'
							Type='cButton'
							Image='Edit'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='EditOrganization'/>
									<Argument Type='DataObjectCollection' TypeKey='Organization' DataObjectPropertyKey='OrganizationID' BaseValue='OrganizationID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
						</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnDelete'
						Container='spnDelete'
							Type='cButton'
							Image='Delete'
							Confirmation='Are you sure you want to delete this item?'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_Delete'>
								<Parameters>
									<Argument Value='Organization'/>
									<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='OrganizationID' Value='' bool=''/>
									<Argument Value='False'/>
									<RelatedDataObjects>
													
										<RelatedDataObject DataObjectDefinitionKey='Email'>
											<RelationshipProperties>
												<RelationshipProperty parentProperty='OrganizationID' childProperty='EntityID' />
												<RelationshipProperty aValue='2' childProperty='EntityTypeID' />
											</RelationshipProperties>
										</RelatedDataObject>
										<RelatedDataObject DataObjectDefinitionKey='Phone'>
											<RelationshipProperties>
												<RelationshipProperty parentProperty='OrganizationID' childProperty='EntityID' />
												<RelationshipProperty aValue='2' childProperty='EntityTypeID' />
											</RelationshipProperties>
										</RelatedDataObject>
										<RelatedDataObject DataObjectDefinitionKey='Address'>
											<RelationshipProperties>
												<RelationshipProperty parentProperty='OrganizationID' childProperty='EntityID' />
												<RelationshipProperty aValue='2' childProperty='EntityTypeID' />
											</RelationshipProperties>
										</RelatedDataObject>
										<RelatedDataObject DataObjectDefinitionKey='WebAddress'>
											<RelationshipProperties>
												<RelationshipProperty parentProperty='OrganizationID' childProperty='EntityID' />
												<RelationshipProperty aValue='2' childProperty='EntityTypeID' />
											</RelationshipProperties>
										</RelatedDataObject>
										<RelatedDataObject DataObjectDefinitionKey='PersonOrganizationAffiliation'>
											<RelationshipProperties>
												<RelationshipProperty parentProperty='OrganizationID' childProperty='OrganizationID' />
											</RelationshipProperties>
										</RelatedDataObject>
										<RelatedDataObject DataObjectDefinitionKey='Notes'>
											<RelationshipProperties>
												<RelationshipProperty parentProperty='OrganizationID' childProperty='EntityID' />
												<RelationshipProperty aValue='2' childProperty='EntityTypeID' />
											</RelationshipProperties>
										</RelatedDataObject>
									</RelatedDataObjects>
								</Parameters>
							</Action>
							<Action PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument Value='Contacts'/>
								</Parameters>
							</Action>
						</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
