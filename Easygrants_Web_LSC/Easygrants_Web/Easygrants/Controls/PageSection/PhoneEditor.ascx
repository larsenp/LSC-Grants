<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cPhoneEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="PhoneEditor.ascx.vb" EnableViewState="false" %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	ID="Cuserctlloader1" />
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Edit Telephone/Fax Number</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr id='trPersonReadOnly'>
		<td colspan='2'>
			<b>Person:</b> <span runat='server' id='spnPersonReadOnly' />
		</td>
	</tr>
	<tr id='trOrgReadOnly'>
		<td colspan='2'>
			<b><%=GetLabel("Organization")%>:</b> <span runat='server' id='spnOrgReadOnly' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='25%'><b>Primary</b></td>
		<td width='75%'><span id='spnIsPrimary' runat='server' /></td>
	</tr>
	<tr>
		<td width='25%'><b>Type</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='75%'>&nbsp;<span id='spnPhoneType' runat='server' /></td>
	</tr>
	<tr>
		<td width='25%'><b>Phone Number</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='75%'>&nbsp;<span id='spnPhone' runat='server' /></td>
	</tr>
	<tr>
		<td width='25%'>&nbsp;</td>
		<td width='75%'>&nbsp;Format: 1234567890</td>
	</tr>
	<tr id='trPhoneExt'>
		<td width='25%'><b>Extension</b></td>
		<td width='75%'>&nbsp;<span id='spnPhoneExt' runat='server' /></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server' ID="Table2">
	<tr>
		<td>&nbsp;</td>
	</tr>
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
		<DataObject Key='Phone' DataObjectDefinitionKey='Phone' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PhoneID' PropertyKey='PhoneID' Value='' bool='' />
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
				<DisplayProperty PropertyKey='PhoneTypeID'>
					<Control ID='ctlPhoneType' Container='spnPhoneType' Type='cDropDown' DataObjectDefinitionKey='PhoneType'
						StoredValue='PhoneID' DisplayValue='TypeName' RequiredField='True' ErrorMessage='Type is required.' DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='TypeName' Direction='Ascending' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='ctlPhone' Type='cTextBox' Container='spnPhone' Size='25' MaxLength='20' 
						RequiredField='True' ErrorMessage='Phone Number is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsPrimary'>
					<Control ID='ctlIsPrimary' Container='spnIsPrimary' Type='cCheckBox' StoredValue='1' DisplayValue='Primary'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PhoneExt'>
					<Control ID='ctlPhoneExt' Type='cTextBox' Container='spnPhoneExt' Size='10' MaxLength='10'
						RequiredField='False'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,10}\s?$' ErrorMessage='Extension is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='PersonID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastNameFirstNameMiddleName'>
					<Control ID='spnPersonReadOnly' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Organization' DataObjectDefinitionKey='Organization' Updatable='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='OrganizationID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CommonOrganizationName'>
					<Control ID='spnOrgReadOnly' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' Container='spnSave' Type='cButton' Image='Save' EnterKey='True'>
						<Action PostBack='True' AutoSave='True' Object='EventController' Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='Phone' DataObjectPropertyKey='PhoneID' PropertyKey='PhoneID' BaseValue='PhoneID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose' Container='spnSaveAndClose' Type='cButton' Image='Save and Close'>
						<Action PostBack='True' AutoSave='True' Object='EventController' Method='EventController_NavigateToURL'>
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
	</ModuleSection>
</span>
<!-- End Embedded XML -->
