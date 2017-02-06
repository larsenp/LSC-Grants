<%@ Control Language="vb" AutoEventWireup="True" Inherits="Implementation.Modules.Staff.Controls.Page.Contacts.cGranteeProjectAffiliationEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	id="CUserCtlLoader2" />
<br>
<table width='100%' runat='server' ID="Table1">
	<tr>
		<td class='SeparatorHdg'>
			Other Grant Project Affiliation Editor
		</td>
	</tr>
</table> 
<table width='100%'>
	<tr>
		<td width='20%'><b><%=GetLabel("Organization")%>:</b></td>
		<td><span runat='server' id='spnOrg'/></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("GrantId")%></b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><Core:cUserCtlLoader CtlID='ctlGrant'
				Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx'
				Properties='Origin=GranteeProjectTitle'
				runat='server' ID='Cuserctlloader1' /></td>
	</tr>
	<tr>
		<td><b>Project Title</b></td>
		<td><span runat='server' id='spnProjTitle'/></td>
	</tr>
	<tr>
		<td><b>Primary Contact</b></td>
		<td><span runat='server' id='spnContact'/></td>
	</tr>
	<tr>
		<td><b>Role</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnRole'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'><span runat='server' id='spnSave'/><span runat='server' id='spnSaveAndClose'/><span runat='server' id='spnClose'/></td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectOrganizationAffiliation' DataObjectDefinitionKey='GranteeProjectOrganizationAffiliation' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectOrganizationAffiliationID' PropertyKey='GranteeProjectOrganizationAffiliationID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='OrganizationID' PropertyKey='OrganizationID'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OrganizationRoleID'>
					<Control ID='ctlRole'
						Container='spnRole'
						Type='cDropDown'
						DataObjectDefinitionKey='OrganizationRole'
						RequiredField='True'
						ErrorMessage='Role is required.'
						StoredValue='OrganizationRoleID'
						DisplayValue='Abbr'>
						<Sort>
							<Argument PropertyKey='Abbr' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Confirmation='Are you sure you want to save the grant affiliation?'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectOrganizationAffiliation' DataObjectPropertyKey='GranteeProjectOrganizationAffiliationID' PropertyKey='GranteeProjectOrganizationAffiliationID' BaseValue='GranteeProjectOrganizationAffiliationID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Confirmation='Are you sure you want to save the grant affiliation?'
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
				<DisplayProperty PropertyKey='GranteeProjectID' PropertyValue='GranteeProjectTitle.GranteeProjectID'>
					<Control ID='ctlGrant'
							DataObjectDefinitionKey='GranteeProjectTitle'					
							Type='cPopUpSelectorLauncher'
							StoredValue='GranteeProjectID'
							PostBack='True'
							RequiredField='True'
							ErrorMessage='Easygrants ID is required.'
							DisplayValue='Grant ID'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
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
		<DataObject Key='Organization' DataObjectDefinitionKey='Organization'>
			<Filters>
				<Argument Type='QueryString' TypeKey='OrganizationID' PropertyKey='OrganizationID'/> 
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CommonOrganizationName'>
					<Control ID='spnOrg'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
			
			
		<UserCtlLoader>
			<ctlGrant>
				<DataObject Key='GranteeProjectID' DataObjectDefinitionKey='GranteeProjectTitle' DisplayName='Grant ID'>
					<SearchProperties>
						<SearchProperty DisplayValue='GranteeID' DisplayLabel='GrantId' ConfigurableLabel='True'/>
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='GranteeID'
						AlternateText='Enter all or part of the grant request Grant ID in the textbox below. Then, click Find to find the Grant ID.'/>
					</DisplayProperties>
				</DataObject>
			</ctlGrant>
		</UserCtlLoader>
	</ModuleSection>
</span>	
