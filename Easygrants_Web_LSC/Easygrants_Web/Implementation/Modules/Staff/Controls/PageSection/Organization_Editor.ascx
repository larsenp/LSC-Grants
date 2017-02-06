<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Organization_Editor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cOrganization_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>

<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='0' cellpadding='2' runat='server'>

	<tr>
		<td width='20%'><b><%=GetLabel("Organization")%> ID</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id="spnOrgID" runat='server' /></td>
	</tr>
	<tr>
		<td><b>Legacy <%=GetLabel("Organization")%> ID</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id="spnLegalOrgID" runat='server' /></td>
	</tr>
	<tr>
		<td><b>Legal <%=GetLabel("Organization")%> Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnOrg' runat='server' /></td>
	</tr>
	<tr>
		<td><b>Common <%=GetLabel("Organization")%> Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnCommonOrg' runat='server' /></td>
	</tr>
	<tr runat='server' visible='false'>
		<td><b>Acronym</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnAcronym' runat='server' /></td>
	</tr>
		<tr>
		<td>
			<b>Type</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnOrgType' runat='server' />
		</td>
		<td>
		</td>
	</tr>
	<tr>
		<td><b>Employer Identification Number/Tax ID</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnEIN' runat='server' /></td>
	</tr>
		
	
	<tr>
		<td><b>Address Line 1</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnAddress1' runat='server' /></td>
	</tr>
	<tr>
		<td><b>Address Line 2</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnAddress2' runat='server' /></td>
	</tr>
	<tr>
		<td><b>Address Line 3</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnAddress3' runat='server' /></td>
	</tr>
	<tr>
		<td><b>City</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnCity' runat='server' /></td>
	</tr>
	<tr>
		<td><b>State/Province</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnState' runat='server' /></td>
	</tr>
	<tr visible='true' runat='server'>
		<td><b>Region</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnOtherRegion' runat='server' /></td>
	</tr>
	<tr>
		<td colspan='2'>&nbsp;</td>
		<td class='FieldLabel'>
			Use this field to specify your region/state/province if outside the US and 
			Canada.
		</td>
	</tr>
	<tr>
		<td><b>Zip/Postal Code</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnZip' runat='server' /></td>
	</tr>
	<tr>
		<td><b>Country</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnCountry' runat='server' /></td>
	</tr>
	<tr>
		<td><b>Phone Number</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnPhone' runat='server' /></td>
	</tr>
	<tr>
		<td><b>Web Site Address</b></td>
		<td width='10'>http://</td>
		<td>
			<span id='spnWeb' runat='server' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>&nbsp;</td>
		<td class='FieldLabel'>
			Limited to 100 characters for the Web address.
		</td>
	</tr>
	<tr>
		<td><b>Available for Public User Selection</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnAvailableInSelector' runat='server' /></td>
	</tr>
	<tr>
		<td><b>Eligibility Status</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnEligibilityStatus' runat='server' /></td>
	</tr>
	<tr runat='server' visible='false'>
		<td><b>Current Annual Operating Budget</b></td>
		<td width='10'>$&nbsp;</td>
		<td><span id='spnAnnualBudget' runat='server' /></td>
	</tr>
	<tr runat='server' visible='false'>
		<td colspan='2'>&nbsp;</td>
		<td class='FieldLabel'>
			Enter whole numerical values only.
		</td>
	</tr>
	<tr runat='server' visible='false'>
		<td><b>Fiscal Year Begin Date</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnFiscalBeginDate' runat='server' /></td>
	</tr>
	<tr runat='server' visible='false'>
		<td colspan='2'>&nbsp;</td>
		<td class='FieldLabel'>
			mm/dd/yyyy
		</td>
	</tr>
	<tr runat='server' visible='false'>
		<td><b>Fiscal Year End Date</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnFiscalEndDate' runat='server' /></td>
	</tr>
	<tr runat='server' visible='false'>
		<td colspan='2'>&nbsp;</td>
		<td class='FieldLabel'>
			mm/dd/yyyy
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr id='trEditButtons'>
		<td>
			<span runat='server' id='spnSave' /><span runat='server' id='spnSaveContinue' /><span runat='server' id='spnClose' />
		</td>
	</tr>
	<tr id='trAddButtons'>
		<td>
			<span runat='server' id='spnSaveClose' />
			<span runat='server' id='spnCancel' />
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Organization' DataObjectDefinitionKey='Organization' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='OrganizationID' PropertyKey='OrganizationID' Value=''
					Bool='' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='True' Create='False' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OrganizationID'>
					<Control ID='spnOrgID' Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegacyOrganizationID'>
					<Control ID='spnLegalOrgID' Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OrganizationName'>
					<Control ID='ctlOrgName' Type='cTextBox' Container='spnOrg' Size='75' MaxLength='100' RequiredField='True'
						ErrorMessage='Legal ~~Organization~~ Name is required.'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CommonOrganizationName'>
					<Control ID='ctlCommonOrgName' Type='cTextBox' Container='spnCommonOrg' Size='75' MaxLength='100'
						RequiredField='True' ErrorMessage='Common ~~Organization~~ Name is required.'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OrganizationTypeID'>
					<Control ID='ctlOrgType' Container='spnOrgType' Type='cDropDown' DataObjectDefinitionKey='OrganizationType'
						StoredValue='TypeID' DisplayValue='OrganizationName'>
						<Sort>
							<Argument PropertyKey='SortOrder' Direction='Ascending' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EIN'>
					<Control ID='ctlEIN' Type='cTextBox' Container='spnEIN' Size='25' MaxLength='10'>
						<Validation Type='RegularExpression' ValidationExpression='^((N/A|NA|[0-9]*))$' ErrorMessage='Employer Identification Number/Tax ID must contain numbers only.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AvailableInSelector'>
					<Control ID='ctlspnAvailableInSelector' 
						Container='spnAvailableInSelector'
						Type='cCheckBox'
						StoredValue='1' 
						DisplayValue='AvailableInSelector'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EligibilityStatusID'>
					<Control ID='ctlEligibilityStatus' 
						Container='spnEligibilityStatus' 
						Type='cDropDown' 
						DataObjectDefinitionKey='OrganizationEligibility'
						StoredValue='OrganizationEligibilityID' 
						DisplayValue='Description'>
						<Sort>
							<Argument PropertyKey='Description' Direction='Ascending' />
						</Sort>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Address' DataObjectDefinitionKey='Address' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Organization' DataObjectPropertyKey='OrganizationID'
					PropertyKey='EntityID' />
				<Argument PropertyKey='EntityTypeID' Value='2' />
				<Argument PropertyKey='IsPrimary' Value='True' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
				<Argument Type='DataObjectCollection' TypeKey='Organization' DataObjectPropertyKey='OrganizationID'
					PropertyKey='EntityID' />
				<Argument PropertyKey='EntityTypeID' Value='2' />
				<Argument PropertyKey='IsPrimary' Value='True' />
				<Argument PropertyKey='AddressTypeID' Value='3'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Address1'>
					<Control ID='ctlAddress1' Container='spnAddress1' Type='cTextBox' MaxLength='100' RequiredField='True'
						Size='75' ErrorMessage='Address Line 1 is required.'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address2'>
					<Control ID='ctlAddress2' Container='spnAddress2' Type='cTextBox' MaxLength='100' Size='75'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address3'>
					<Control ID='ctlAddress3' Container='spnAddress3' Type='cTextBox' MaxLength='100' Size='75'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='City'>
					<Control ID='ctlCity' Container='spnCity' Type='cTextBox' RequiredField='True' ErrorMessage='City is required.'
						MaxLength='50' Size='100'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StateID'>
					<Control ID='ctlState' Container='spnState' Type='cDropDown' DataObjectDefinitionKey='State'
						StoredValue='StateID' DisplayText='Select'
						DisplayValue='StateAbbr' RequiredField='True' ErrorMessage='State/Province is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Region'>
					<Control ID='ctlOtherRegion' Container='spnOtherRegion' Type='cTextBox' MaxLength='50' Size='50'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Zip'>
					<Control ID='ctlZip' Container='spnZip' Type='cTextBox' RequiredField='True' ErrorMessage='Zip/Postal Code is required.'
						Size='25' MaxLength='30'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CountryID'>
					<Control ID='ctlCountry' Container='spnCountry' Type='cDropDown' DataObjectDefinitionKey='Country' DisplayText='Select'
						StoredValue='CountryID' DisplayValue='CountryDesc' RequiredField='True' ErrorMessage='Country is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder'/>
						</Sort>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WebAddress' DataObjectDefinitionKey='WebAddress' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Organization' DataObjectPropertyKey='OrganizationID'
					PropertyKey='EntityID' Value='' Bool='' />
				<Argument PropertyKey='EntityTypeID' Value='2' />
				<Argument PropertyKey='IsPrimary' Value='True' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
				<Argument Type='DataObjectCollection' TypeKey='Organization' DataObjectPropertyKey='OrganizationID'
					PropertyKey='EntityID' />
				<Argument PropertyKey='EntityTypeID' Value='2' />
				<Argument PropertyKey='IsPrimary' Value='True' />
				<Argument PropertyKey='WebAddressTypeID' Value='1' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WebAddress'>
					<Control ID='ctlWeb' Type='cTextBox' Container='spnWeb' Size='75' MaxLength='100' RequiredField='False'
						ErrorMessage='~~Organization~~ Name is required.'></Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Phone' DataObjectDefinitionKey='Phone' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Organization' DataObjectPropertyKey='OrganizationID'
					PropertyKey='EntityID' Value='' Bool='' />
				<Argument PropertyKey='EntityTypeID' Value='2' />
				<Argument PropertyKey='IsPrimary' Value='True' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='True' Create='False' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
				<Argument Type='DataObjectCollection' TypeKey='Organization' DataObjectPropertyKey='OrganizationID'
					PropertyKey='EntityID' />
				<Argument PropertyKey='EntityTypeID' Value='2' />
				<Argument PropertyKey='IsPrimary' Value='True' />
				<Argument PropertyKey='PhoneTypeID' Value='1' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='ctlPhone' Type='cTextBox' Container='spnPhone' Size='50' MaxLength='50'></Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' Container='spnSave' Type='cButton' Image='Save' EnterKey='True'>
					<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='SaveRedirect'>
							<Parameters>
							     <Argument Type='DataObjectCollection' TypeKey='Organization' DataObjectPropertyKey='OrganizationID'
									BaseValue='' />	
								<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
								<Argument Value='False' />
							</Parameters>
					</Action>
					   <%-- <Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='Organization' DataObjectPropertyKey='OrganizationID' PropertyKey='OrganizationID' BaseValue='OrganizationID='/>
							</Parameters>
						</Action>--%>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' Container='spnClose' Type='cButton' Image='Close'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToURL'>
							<Parameters>
							   	<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose' Container='spnSaveClose' Type='cButton' Image='Save and Continue'>
						<Action PostBack='True' AutoSave='True' Object='DataPresenter' Method='SaveRedirect'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='Organization' DataObjectPropertyKey='OrganizationID'
									BaseValue='' />	
								<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />	
								<Argument Value='True' />					
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue' 
							 Container='spnSaveContinue' 
							 Type='cButton' 
							 Image='Save_And_Continue'> 
						<Action PostBack='True' AutoSave='True' Object='DataPresenter' Method='ContinueRedirect'>
							<Parameters>
								<Argument Value='OrganizationContact' />
								<Argument Type='DataObjectCollection' TypeKey='Organization' DataObjectPropertyKey='OrganizationID' BaseValue='OrganizationID=' /> 
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel' Container='spnCancel' Type='cButton' Image='Close'>
						<Action PostBack='True' AutoSave='False' Object='EventController' Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML --></span>
