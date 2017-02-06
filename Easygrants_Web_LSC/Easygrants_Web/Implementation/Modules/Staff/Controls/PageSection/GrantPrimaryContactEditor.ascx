
<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cGrantPrimaryContactEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->


<br/>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
runat='server' />
<br />
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    
    <tr>
		<td class="SeparatorHdg" colspan='2' ><b>Add or Edit Grant Primary Contacts</b></td>
	</tr>
	<tr>
	    <td colspan='2'>&nbsp;</td>
	</tr>    
<tr>
	<td width='15%'><b>Grantee Type</b></td>	
	<td><span runat='server' id='spnGranteeType' /></td>
</tr>
<tr>
	<td width='15%'><b>Role&nbsp;<%=kDenoteRequiredField%></b></td>	
	<td><span runat='server' id='spnRole' /></td>
</tr>
<tr>
	<td ><b>Person Name</b>&nbsp;<%=kDenoteRequiredField%></td>
	<td><Core:cUserCtlLoader CtlID='ctlPerson'
			Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx' 
			runat='server'/>
		<asp:CustomValidator
				runat='server'
				id='CtlValidateDuplicateprimary'
				Display='None'
				OnServerValidate='ValidateDuplicateprimary'
				ErrorMessage='This Person has already been added as a Primary Contact for this Grant with the Role of "Person".'/>		
	</td>	
</tr>
<tr>
<td>&nbsp;</td>
	<td >
	&nbsp;<span id='spnNewPerson' visible='True' runat='server'/>
	</td>
</tr>	
<tr>
	<td width='15%'><b><%=GetLabel("Organization")%> Name&nbsp;<%=kDenoteRequiredField%></b></td>	
	<td><span runat='server' id='spnFindOrganization' /></td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td><span runat='server' id='spnNewOrg'/></td>
</tr>
<tr>
	<td width='15%'></td>	
	<td><Core:cUserCtlLoader CtlID='ctlOrganization' Type='cDropDown' runat='server'  Properties='ValidationText=!~~Organization~~ is required.'/></td>
</tr>
<tr>
    <td><b>Description</b></td>
    <td><span runat='server' id='spnDescription' /></td>
</tr>
<tr>
    <td></td>
    <td class='FieldLabel'>Enter a description of up to 50 characters.</td>
</tr>
<tr>
    <td><b>Primary</b></td>
    <td><span runat='server' id='spnIsPrimary' />
		<asp:CustomValidator
				runat='server'
				id='valField'
				Display='None'
				OnServerValidate='ValidatePrimaryContact'
				ErrorMessage="One contact must be specified as Primary for each grant."/>	
    </td>
</tr>
<tr>
    <td><b>Transfer tasks?</b></td>
    <td><span runat='server' id='spnTransferTasks' /></td>
</tr>
</table>
<br/>
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
<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=GranteeProjectPI&QueryStringKey=GranteeProjectPIID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->

<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GrantPrimaryContactEditorEntityType' DataObjectDefinitionKey='EntityType'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EntityTypeID' PropertyKey='EntityTypeID' Value='' Bool=''/>								
			</Filters>			
			<DisplayProperties>			    
			    <DisplayProperty PropertyKey='Description' >
				    <Control ID='spnGranteeType'
				       Type='HtmlGenericControl'>
				    </Control>
				</DisplayProperty>
			</DisplayProperties>	
		</DataObject>	
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>				
			</Filters>
		</DataObject>	
		<DataObject Key='GrantPrimaryContactEditorGranteeProjectPI' DataObjectDefinitionKey='GranteeProjectPI' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectPIID' PropertyKey='GranteeProjectPIID' Value='' Bool=''/>	
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />			
				<Argument Type='' TypeKey='' PropertyKey='PITypeID' Value='1'/>
			</Filters>
			<DefaultValues>
			    <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			    <Argument Type='QueryString' TypeKey='EntityTypeID' PropertyKey='EntityTypeID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
				<Argument Type='' TypeKey='' PropertyKey='PITypeID' Value='1'/>
			</DefaultValues>
			<DisplayProperties>				  
			    <DisplayProperty PropertyKey='GranteeProjectCollaboratingContactTypeID'>
					<Control ID='ctlRole'
						Container='spnRole'
						Type='cDropDown'
						DataObjectDefinitionKey='GranteeProjectCollaboratingContactType'
						StoredValue='GranteeProjectCollaboratingContactTypeID'
						DisplayValue='Description' DisplayText='Select' RequiredField='True'
						ErrorMessage='Role is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>				
				 <DisplayProperty PropertyKey='PersonID' PropertyValue='Person.LastNameFirstName'>
					<Control ID='ctlPerson' Type='cPopUpSelectorLauncher' RequiredField='True' LabelText='Selected Person '
						ErrorMessage='Person Name is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnFindOrganization' 
						Type='cButton' 
						Image='Find Organizations'						
						Container='spnFindOrganization'>							
						<Action								
								PostBack='True'
								Object='DataPresenter'
								Method='FindOrganizations'>
							</Action>
					</Control>
				</DisplayProperty>				 
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextBox'
						Size='45'
						MaxLength='50'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='IsPrimary'>
					    <Control ID='ctlIsPrimary'
						    Container='spnIsPrimary'
						    Type='cCheckBox'>
					    </Control>
				 </DisplayProperty>	
				 <DisplayProperty PropertyKey=''>
					    <Control ID='ctlTransferTasks'
						    Container='spnTransferTasks'
						    Type='cCheckBox'>
					    </Control>
				 </DisplayProperty>	
			   </DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>		
			    <DisplayProperty PropertyKey=''>
					<Control ID='ctlNewPerson'
						Container='spnNewPerson'
						Type='cLink'
						Caption='Add New Person'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='PersonEditor'/>
								<Argument Type='' TypeKey='' AttributeName='' Value='PersonID=0'/>
								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
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
								<Argument Type='DataObjectCollection' TypeKey='GrantPrimaryContactEditorGranteeProjectPI' DataObjectPropertyKey='GranteeProjectPIID' PropertyKey='GranteeProjectPIID' BaseValue='GranteeProjectPIID='/>
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='GrantContacts'/>
								<Argument Type='DataObjectCollection' TypeKey='GrantPrimaryContactEditorGranteeProjectPI' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>		
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='GrantContacts'/>
								<Argument Type='QueryString' TypeKey='GranteeProjectID' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>		
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>			
			<UserCtlLoader>
			<ctlPerson>
				<DataObject Key='PersonID' DataObjectDefinitionKey='Person' DisplayName='Person last'>
					<SearchProperties>
						<SearchProperty DisplayValue='LastName' DisplayLabel='Last Name'/>
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='LastNameFirstNamePrimInst'/>
					</DisplayProperties>
				</DataObject>
			</ctlPerson>
		</UserCtlLoader>
	</ModuleSection>
<!-- End Embedded XML -->
</span>


