<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<br />

<table width='100%' cellpadding='2' cellspacing='0' runat='server'>
<tr><td colspan='2' class='SeparatorHdg'><b>Participating <%=GetLabel("Organization")%></b></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td width='10%'><b>Organization&nbsp;</b><%=kDenoteRequiredField%></td><td><Core:cUserCtlLoader CtlID='ctlOrg'
				Src='Core/Controls/Base/PopUpSelectorLauncher.ascx'
				Properties='RefreshParentPage=True&TextQueryString=Text&ValueQueryString=Value'
				runat='server'/></td></tr>

<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr ><td colspan='2' align='center'><span id='spnSave' runat='server'></span>&nbsp;<span id='spnCancel' runat='server'></span></td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
			</Filters>
			<DisplayProperties>
			<DisplayProperty PropertyKey='PrimaryOrganizationID' PropertyValue='PrimaryOrganization.CommonOrganizationName' ReadOnly='QueryID'>
					<Control ID='ctlOrg'
					Type='cPopUpSelectorLauncher'
					DataObjectDefinitionKey='Organization'
					StoredValue='OrganizationID'
					RequiredField='True'
					ErrorMessage='~~Organization~~ is required.'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='SaveCancel' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='BudgetEditor'/>
								<Argument Type='Data' TypeKey='' BaseValue='BudgetID=0' Value=''/>
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
								<Argument Type='QueryString' TypeKey='ReturnURL' BaseValue='ReturnURL='/>
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
	<UserCtlLoader>
			<ctlOrg>
				<DataObject Key='OrganizationID' DataObjectDefinitionKey='Organization'>
					<SearchProperties>
						<SearchProperty DisplayValue='CommonOrganizationName'/>
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='CommonOrganizationName'/>
					</DisplayProperties>
				</DataObject>
			</ctlOrg>
		</UserCtlLoader>
	</ModuleSection>
<!-- End Embedded XML -->
</span>