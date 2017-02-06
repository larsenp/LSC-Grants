<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cAddressEditorImpl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="AddressEditor.ascx.vb" EnableViewState="false" %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	id="CUserCtlLoader1" />
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<br>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td class="SeparatorHdg">
			Edit Address
		</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr id='trPerson'>
		<td>
			<b>Person:</b> <span runat='server' id='spnPerson' />
		</td>
	</tr>
	<tr id='trOrg'>
		<td>
			<b><%=GetLabel("Organization")%>:</b> <span runat='server' id='spnOrg' />
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td>
			<b>Primary</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnIsPrimary' runat='server' />
		</td>
	</tr>
	<tr>
		<td><b>Type&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			&nbsp;<span id='spnAddressType' runat='server' />
		</td>
	</tr>
	
	<tr>
		<td><b>Address Line 1&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>&nbsp;<span id='spnAddress1' runat='server' /></td>
	</tr>
	<tr>
		<td><b>Address Line 2</b></td>
		<td width='10'>&nbsp;</td>
		<td>&nbsp;<span id='spnAddress2' runat='server' /></td>
	</tr>
	<tr>
		<td><b>Address Line 3</b></td>
		<td width='10'>&nbsp;</td>
		<td>&nbsp;<span id='spnAddress3' runat='server' /></td>
	</tr>
	<tr>
		<td><b>City&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>&nbsp;<span id='spnCity' runat='server' />&nbsp;</td>
	</tr>
	<tr>
		<td><b>State/Province&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>&nbsp;<span id='spnState' runat='server' />&nbsp;</td>
	</tr>
	<tr runat='server' >
		<td><b>Region</b></td>
		<td width='10'>&nbsp;</td>
		<td>&nbsp;<span id='spnOtherRegion' runat='server' />&nbsp;</td>
	</tr>
	<tr  >
		<td colspan='2'>&nbsp;</td>
		<td>&nbsp;Use this space to specify your region/state/province if outside the US and Canada.</td>
	</tr>
	<tr>
		<td><b>Zip/Postal Code&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>&nbsp;<span id='spnZip' runat='server' />&nbsp;</td>
	</tr>
	<tr>
		<td><b>Country&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>&nbsp;<span id='spnCountry' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnSave' /><span runat='server' id='spnSaveAndClose' /><span runat='server' id='spnCancel' />
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Address' DataObjectDefinitionKey='Address' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='AddressID' PropertyKey='AddressID' Value='' bool='' />
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='EntityID' Value='' />
				<Argument Type='DataPresenter' TypeKey='EntityTypeID' PropertyKey='EntityTypeID' Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='EntityID' Value='' />
				<Argument Type='DataPresenter' TypeKey='EntityTypeID' PropertyKey='EntityTypeID' Value='' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsPrimary'>
					<Control ID='ctlIsPrimary' Container='spnIsPrimary' Type='cCheckBox' StoredValue='1' DisplayValue='Primary'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AddressTypeID'>
					<Control ID='ctlAddressType' Container='spnAddressType' Type='cDropDown' DataObjectDefinitionKey='AddressType'
						StoredValue='AddressTypeID' DisplayValue='AddressAbbr' RequiredField='True' ErrorMessage='Type is required.' DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='AddressAbbr' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address1'>
					<Control ID='ctlAddress1' Type='cTextBox' Container='spnAddress1' Size='50' MaxLength='150'
						RequiredField='True' ErrorMessage='Address Line 1 is required.'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address2'>
					<Control ID='ctlAddress2' Type='cTextBox' Container='spnAddress2' Size='50' MaxLength='150'
						RequiredField='False'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address3'>
					<Control ID='ctlAddress3' Type='cTextBox' Container='spnAddress3' Size='50' MaxLength='150'
						RequiredField='False'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='City'>
					<Control ID='ctlCity' Type='cTextBox' Container='spnCity' Size='20' MaxLength='50' RequiredField='True'
						ErrorMessage='City is required.'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StateID'>
					<Control ID='ctlState' Container='spnState' Type='cDropDown' DataObjectDefinitionKey='State'
						StoredValue='StateID' DisplayValue='StateAbbr' RequiredField='True' ErrorMessage='State/Province is required.' DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='StateAbbr' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Region'>
					<Control ID='ctlOtherRegion'
						Container='spnOtherRegion'
						Type='cTextBox'
						Size='20'
						MaxLength='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Zip'>
					<Control ID='ctlZip' Type='cTextBox' Container='spnZip' Size='12' MaxLength='30' RequiredField='True'
						ErrorMessage='Postal Code is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CountryID'>
					<Control ID='ctlCountry' Container='spnCountry' Type='cDropDown' DataObjectDefinitionKey='Country'
						StoredValue='CountryID' DisplayValue='CountryDesc' DisplayNone='True' RequiredField='True' DisplayText='Select'
						ErrorMessage='Country is required.'
						DefaultValue='280'>
						<Sort>
							<Argument PropertyKey='SortOrder'/>
						</Sort>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' Container='spnSave' Type='cButton' Image='Save' EnterKey='True'>
						<Action PostBack='True' AutoSave='True' Object='EventController' 
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='Address' DataObjectPropertyKey='AddressID' PropertyKey='AddressID' BaseValue='AddressID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose' Container='spnSaveAndClose' Type='cButton' Image='Save and Close'>
						<Action PostBack='True' AutoSave='True' Object='EventController' 
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel' Container='spnCancel' Type='cButton' Image='Close'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='PersonID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastNameFirstNameMiddleName'>
					<Control ID='spnPerson' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Organization' DataObjectDefinitionKey='Organization' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='OrganizationID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CommonOrganizationName'>
					<Control ID='spnOrg' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>