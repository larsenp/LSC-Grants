<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cPrimaryContactInfo" CodeBehind="PrimaryContactInfo.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"  EnableViewState="false" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td class="SeparatorHdg"><b>Summary</b></td>
	</tr>	
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='15%'>
			<b>Name</b>
		</td>
		<td width='35%'>
			<span id='spnPersonName' runat='server'/>
		</td>
		<td width='5%'>&nbsp;</td>
		<td width='10%'>
			<b>Address</b>
		</td>
		<td width='20%'>
			<span id='spnAddress' runat='server'/>
		</td>
		<td>
		    <font color='red'><b><span id="spnDoNotContact" runat='server' /></b></font>
		</td>
	</tr>
	<tr valign='top'>
		<td>
			<b>Primary <%=GetLabel("Organization")%></b>
		</td>
		<td>
			<span id='spnOrgLink' runat='server'/>
		</td>
		<td>&nbsp;</td>
		<td >&nbsp;</td>
		<td>
			<span id='spnCityStateZip' runat='server'/>
		</td>
		<td>
		    <font color='red'><b><span id="spnDeceased" runat='server' /></b></font>
		</td>
	</tr>
	<tr>
		<td>
			<b>Title</b>
		</td>
		<td>
			<span id='spnTitle' runat='server'/>
		</td>
		<td>&nbsp;</td>
		<td >&nbsp;</td>
		<td>
			<span id='spnCountry' runat='server'/>
		</td>
		<td>
		    &nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<b>E-mail</b>
		</td>
		<td>
			<span id='spnEmail' runat='server'/>
		</td>
		<td >&nbsp;</td>
		<td >
			<b>Web Address</b>
		</td>
		<td>
			<span id='spnURL' runat='server'/>
		</td>
		<td>
		    &nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<b>Primary Phone</b>
		</td>
		<td colspan='4'>
			<span id='spnPhone' runat='server'/>
		</td>
		<td>
		    &nbsp;
		</td>
	</tr>
</table>
<br/>

<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr valign='top'>
		<td width='15%'><b>Created on</b></td>
		<td width='15%'><span id="spnCreateDate" runat='server'/></td>
		<td width='10%'><b>Modified on</b></td>
		<td width='15%'><span id="spnChangeDate" runat='server'/></td>
		<td width='10%'><b>Modified by</b></td>
		<td><span id="spnModifiedBy" runat='server'/></td>
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' id='tblEditDeleteBtn'>
	<tr>
		<td>
			<span id='spnEdit' runat='server'/>&nbsp;&nbsp;
			<span id="spnDelete" runat='server'/>
		</td>		
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='PersonID' PropertyKey='PersonID' Value='' bool=''/>
			</Filters>
			<DefaultValues />
			<DisplayProperties>
				<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='lnkOrg'
						Type='cLink'
						Container='spnOrgLink'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='OrganizationContact'/>
								<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonPrimaryAffiliation.OrganizationID' BaseValue='OrganizationID='/>
							</Parameters>
						</Action>
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
									<Argument AttributeName='PageKey' Value='EditPerson'/>
									<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' BaseValue='PersonID='/>
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
									<Argument Value='Person'/>
									<Argument Type='DataPresenter' TypeKey='PersonID' PropertyKey='PersonID' Value='' bool=''/>
									<Argument Value='False'/>
									<RelatedDataObjects>
										<RelatedDataObject DataObjectDefinitionKey='User'>
											<RelationshipProperties>
												<RelationshipProperty parentProperty='PersonID' childProperty='PersonID' />
											</RelationshipProperties>
											<!--
											<RelatedDataObjects>
												<RelatedDataObject DataObjectDefinitionKey='LoginHistory'>
													<RelationshipProperties>
														<RelationshipProperty parentProperty='UserID' childProperty='UserID'/>
													</RelationshipProperties>
												</RelatedDataObject>
											</RelatedDataObjects>	-->										
										</RelatedDataObject>
										
										<RelatedDataObject DataObjectDefinitionKey='Email'>
											<RelationshipProperties>
												<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
												<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
											</RelationshipProperties>
										</RelatedDataObject>
										<RelatedDataObject DataObjectDefinitionKey='Phone'>
											<RelationshipProperties>
												<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
												<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
											</RelationshipProperties>
										</RelatedDataObject>
										<RelatedDataObject DataObjectDefinitionKey='Address'>
											<RelationshipProperties>
												<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
												<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
											</RelationshipProperties>
										</RelatedDataObject>
										<RelatedDataObject DataObjectDefinitionKey='WebAddress'>
											<RelationshipProperties>
												<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
												<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
											</RelationshipProperties>
										</RelatedDataObject>
										<RelatedDataObject DataObjectDefinitionKey='PersonOrganizationAffiliation'>
											<RelationshipProperties>
												<RelationshipProperty parentProperty='PersonID' childProperty='PersonID' />
											</RelationshipProperties>
										</RelatedDataObject>
										<RelatedDataObject DataObjectDefinitionKey='ContactCategoryMember'>
											<RelationshipProperties>
												<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
												<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
											</RelationshipProperties>
										</RelatedDataObject>
										<RelatedDataObject DataObjectDefinitionKey='Notes'>
											<RelationshipProperties>
												<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
												<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
											</RelationshipProperties>
										</RelatedDataObject>
										<RelatedDataObject DataObjectDefinitionKey='WfTaskAssignment'>
											<RelationshipProperties>
												<RelationshipProperty parentProperty='PersonID' childProperty='PersonID' />
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
				<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Title'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				<!-- 
				<DisplayProperty PropertyKey=''>
						<Control ID='ctlDoNotContact' Container='spnDoNotContact' Type='cLabel'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
						<Control ID='ctlDeceased' Container='spnDeceased' Type='cLabel'></Control>
				</DisplayProperty>
				-->
				<DisplayProperty PropertyKey='CreateDate' Format='M/d/yyyy'>
					<Control ID='spnCreateDate'
						Type='HtmlGenericControl'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifyDate' Format='M/d/yyyy'>
					<Control ID='spnChangeDate'
						Type='HtmlGenericControl'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifiedByUser.Person.FirstNameLastName'>
					<Control ID='spnModifiedBy'
						Type='HtmlGenericControl'>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>								
		<DataObject Key='Prefix' DataObjectDefinitionKey='Prefix' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PrefixID' PropertyKey='PrefixID' Value=''/>
			</Filters>
		</DataObject>
		<DataObject Key='Suffix' DataObjectDefinitionKey='Suffix' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='SuffixID' PropertyKey='SuffixID' Value=''/>
			</Filters>
		</DataObject>
		<DataObject Key='Phone' DataObjectDefinitionKey='Phone' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument PropertyKey='IsPrimary' Value='True'/>
			</Filters>
		</DataObject>
		<DataObject Key='vFormattedPhone' DataObjectDefinitionKey='vFormattedPhone' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Phone' DataObjectPropertyKey='PhoneID' PropertyKey='PhoneID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PhoneNumber'>
					<Control ID='ctlPhone'
						Container='spnPhone'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Email' DataObjectDefinitionKey='Email' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument PropertyKey='IsPrimary' Value='True'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='ctlEmail'
						Container='spnEmail'
						Type='cLink'>
						<Action
							URL='Email'>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Address' DataObjectDefinitionKey='Address' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument PropertyKey='IsPrimary' Value='True'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Address1'>
					<Control ID='ctlAddress'
						Container='spnAddress'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='CityStateZip'>
					<Control ID='ctlCityStateZip'
						Container='spnCityStateZip'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Country' DataObjectDefinitionKey='Country' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Address' DataObjectPropertyKey='CountryID' PropertyKey='CountryID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CountryDesc'>
					<Control ID='ctlCountry'
						Container='spnCountry'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WebAddress' DataObjectDefinitionKey='WebAddress' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument PropertyKey='IsPrimary' Value='True'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WebAddress'>
					<Control ID='ctlURL'
						Container='spnURL'
						Type='cLink'>
						<Action
							Target='_blank'
							URL='Web'>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
