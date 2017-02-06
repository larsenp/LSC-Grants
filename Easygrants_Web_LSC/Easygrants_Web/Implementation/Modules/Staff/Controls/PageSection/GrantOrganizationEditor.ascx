<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->

<br />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
runat='server' />
<br />
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    
    <tr>
		<td class="SeparatorHdg" colspan='2'><b>Edit Related <%=GetLabel("Organization")%>s</b></td>
	</tr>
	<tr>
	    <td colspan='2'>&nbsp;</td>
	</tr>    
<tr>
	<td width='15%'><b>Contact Role</b>&nbsp;<%=kDenoteRequiredField%></td>	
	<td><span id='spnContactRole' runat='server'/></td>
</tr>
<tr  id='trPersonEditable'>
	<td ><b><%=GetLabel("Organization")%></b>&nbsp;<%=kDenoteRequiredField%>&nbsp;</td>
	<td><Core:cUserCtlLoader CtlID='ctlOrg'
				Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx'
				runat='server' ID="Cuserctlloader3"/></td>	
</tr>
<tr>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnNewOrg'/></td>
	</tr>
<tr>
    <td><b>Description</b></td>
    <td><span id='spnDescription' runat='server'/></td>
</tr>
<tr>
    <td></td>
    <td class='FieldLabel'>Enter a description of up to 50 characters.</td>
</tr>
</table>
<br/>
<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=GranteeProjectOrganizationAffiliation&QueryStringKey=GranteeProjectOrganizationAffiliationID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />

<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
				<br/><br/>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>
		<span runat='server' id='spnSaveAndClose'/>
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel'/>		
	</td>
</tr>

</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<DataObject Key='GranteeProjectOrganizationAffiliation' DataObjectDefinitionKey='GranteeProjectOrganizationAffiliation' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectOrganizationAffiliationID' PropertyKey='GranteeProjectOrganizationAffiliationID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
			   <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
			<DisplayProperty PropertyKey='OrganizationRoleID'>
					<Control ID='ctlTypeOfAffiliation'
						Container='spnContactRole'
						Type='cDropDown'
						DataObjectDefinitionKey='OrganizationRole'
						StoredValue='OrganizationRoleID'
						DisplayValue='Description' DisplayText='Select' RequiredField='True'
						ErrorMessage='Contact Role is required.'>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
					</Control>	
				</DisplayProperty>
			   <DisplayProperty PropertyKey='OrganizationID' PropertyValue='Organization.CommonOrganizationName'>
					<Control ID='ctlOrg' LabelText='Selected ~~Organization~~ '
					Type='cPopUpSelectorLauncher'
					RequiredField='True'
					ErrorMessage='~~Organization~~ is required.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AffiliationDescription'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextBox'
						Size='45'
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlNewOrg'
						Container='spnNewOrg'
						Type='cLink'
						Caption='Add New ~~Organization~~'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='OrganizationEditor'/>
								<Argument Type='' TypeKey='' AttributeName='' Value='OrganizationID=0'/>
								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>			
			   </DisplayProperties>
		</DataObject>
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
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectOrganizationAffiliation' DataObjectPropertyKey='GranteeProjectOrganizationAffiliationID' PropertyKey='GranteeProjectOrganizationAffiliationID' BaseValue='GranteeProjectOrganizationAffiliationID='/>
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


