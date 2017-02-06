<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Control Language="vb" AutoEventWireup="true" Codebehind="AddOrganization_Editor.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.PageSection.cAddOrganization_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	id="CUserCtlLoader1" />
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P></P>
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<!-- Control Label (for Education information) -->
	<tr>
		<td colspan="4" class="SeparatorHdg"><b><%=GetLabel("Organization")%></b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td><b>Name</b>&nbsp;<%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnOrg' runat='server' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><b>EIN</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnEIN' runat='server' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
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
</table>
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
			<span runat='server' id='spnSave' />
			<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
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
				<DisplayProperty PropertyKey='OrganizationTypeID'>
					<Control ID='ctlOrgType' Container='spnOrgType' Type='cDropDown' DataObjectDefinitionKey='OrganizationType'
						StoredValue='TypeID' DisplayValue='OrganizationName'>
						<Sort>
							<Argument PropertyKey='SortOrder' Direction='Ascending' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OrganizationName'>
					<Control ID='ctlOrg' Type='cTextBox' Container='spnOrg' Size='25' MaxLength='255' RequiredField='True'
						ErrorMessage='Name is required.'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EIN'>
					<Control ID='ctlEIN' Type='cTextBox' Container='spnEIN' Size='25' MaxLength='10' RequiredField='False'>
						<!--<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{9}\s?$' ErrorMessage='Please enter a valid, numeric EIN.' />--></Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' Container='spnSave' Type='cButton' Image='Save' Confirmation='Are you sure you want to add this ~~organization~~?'>
						<Action PostBack='True' AutoSave='True' Object='EventController' Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel' Container='spnCancel' Type='cButton' Image='Cancel'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Contacts' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
