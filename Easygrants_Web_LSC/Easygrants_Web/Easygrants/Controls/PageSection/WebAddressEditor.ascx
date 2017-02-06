<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cWebAddressEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="WebAddressEditor.ascx.vb" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<br>
<!-- Page Content - Controls -->

<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Edit Web Address</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr id='trPerson'>
		<td>
			<b>Person:</b> <span runat='server' id='spnPerson'/>
		</td>
	</tr>
	<tr id='trOrg'>
		<td>
			<b><%=GetLabel("Organization")%>:</b> <span runat='server' id='spnOrg'/>
		</td>
	</tr>
	
</table>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	
	<tr>
		<td>
			<b>Primary</b>
		</td>
		<td>&nbsp;</td>
		<td>
			<span id='spnIsPrimary' runat='server'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b>Type</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>&nbsp;</td>
		<td>&nbsp;<span id='spnWebAddressType' runat='server'/></td>
	</tr>
	<tr>
		<td width='15%'><b>Web Site Address</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td align='right' width='1%'>http://</td>
		<td>&nbsp;<span id='spnWebAddress' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>Limited to 100 characters for the Web address.</td>
	</tr>
	
	
</table>
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WebAddress' DataObjectDefinitionKey='WebAddress' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WebAddressID' PropertyKey='WebAddressID' 	Value='' bool=''/>
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='EntityID' Value='' />
				<Argument Type='DataPresenter' TypeKey='EntityTypeID' PropertyKey='EntityTypeID' Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='EntityID' Value=''/>
				<Argument Type='DataPresenter' TypeKey='EntityTypeID' PropertyKey='EntityTypeID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='WebAddressTypeID'>
					<Control ID='ctlWebAddressType'
						Container='spnWebAddressType'
						Type='cDropDown'
						DataObjectDefinitionKey='WebAddressType'
						StoredValue='WebAddressTypeID'
						DisplayValue='TypeName'	
						RequiredField='False'
						ErrorMessage='Type is required.' DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
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
				<DisplayProperty PropertyKey='WebAddress'>
					<Control ID='ctlWebAddress'
						Type='cTextBox'
						Container='spnWebAddress'
						Size='50'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Web Site Address is required.'>
					</Control>
				</DisplayProperty>
				</DisplayProperties>
		</DataObject>

		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EntityID' PropertyKey='PersonID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastNameFirstNameMiddleName'>
					<Control ID='spnPerson'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Organization' DataObjectDefinitionKey='Organization' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EntityID' PropertyKey='OrganizationID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CommonOrganizationName'>
					<Control ID='spnOrg'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'
						EnterKey='True'>
						<Action 
							PostBack='True' 
							AutoSave='True' 
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='WebAddress' DataObjectPropertyKey='WebAddressID' PropertyKey='WebAddressID' BaseValue='WebAddressID='/>
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
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
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
	</ModuleSection>
</span>
<!-- End Embedded XML -->
