<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cEmailEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="EmailEditor.ascx.vb" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	 />
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<br>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Edit E-mail Address</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
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
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td width='15%'><b>Primary</b></td>
		<td><span id='spnIsPrimary' runat='server' /></td>
	</tr>
	
	<tr>
		<td width='15%'><b>Type&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td>&nbsp;<span id='spnEmailType' runat='server' /></td>
	</tr>
	<tr>
		<td width='15%'><b>E-mail Address&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td>&nbsp;<span id='spnEmail' runat='server' /></td>
	</tr>
</table>
<br />
<br />
<br />
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
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
		<DataObject Key='Email' DataObjectDefinitionKey='Email' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EmailID' PropertyKey='EmailID' Value='' bool='' />
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
				<DisplayProperty PropertyKey='EmailTypeID'>
					<Control ID='ctlEmailType' Container='spnEmailType' Type='cDropDown' DataObjectDefinitionKey='EmailType'
						StoredValue='EmailID' DisplayValue='TypeName' RequiredField='True' ErrorMessage='Type is required.' DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='SortOrder'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='ctlEmail' Type='cEmailTextBox' Container='spnEmail' Size='50' MaxLength='100'
						RequiredField='True' ErrorMessage='E-mail Address is required.'
						RexErrorMessage='E-mail Address is incorrectly formatted. Use the following format to enter the e-mail address: test@test.edu or test@test.edu.au.'>
						<Validation Type='Custom' Object='DataPresenter' Method='ValidateEmail' ErrorMessage='E-mail address is already in the system.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsPrimary'>
					<Control ID='ctlIsPrimary' Container='spnIsPrimary' Type='cCheckBox' StoredValue='1' DisplayValue='Primary'></Control>
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
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' Container='spnSave' Type='cButton' Image='Save' EnterKey='True'>
						<Action PostBack='True' AutoSave='True' Object='EventController'
								Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='Email' DataObjectPropertyKey='EmailID' PropertyKey='EmailID' BaseValue='EmailID='/>
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
	</ModuleSection>
</span>
<!-- End Embedded XML -->
