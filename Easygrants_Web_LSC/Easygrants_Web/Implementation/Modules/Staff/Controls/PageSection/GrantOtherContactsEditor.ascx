
<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cGrantOtherContactsEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
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
		<td class="SeparatorHdg" colspan='2' ><b>Edit Related Person Contacts</b></td>
	</tr>
	<tr>
	    <td colspan='2'>&nbsp;</td>
	</tr>    
<tr>
	<td width='15%'><b>Grant Contact Category</b>&nbsp;<%=kDenoteRequiredField%></td>	
	<td><span runat='server' id='spnGrantContactCategory' /></td>
</tr>
<tr>
	<td width='15%'><b>Role</b>&nbsp;<%=kDenoteRequiredField%></td>	
	<td><span runat='server' id='spnGrantContactType' /></td>
</tr>
<tr  id='trPersonEditable'>
	<td ><b>Person Name</b>&nbsp;<%=kDenoteRequiredField%></td>
	<td><Core:cUserCtlLoader CtlID='ctlPerson'
			Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx'
			runat='server'/></td>	
</tr>
<tr>
<td>&nbsp;</td>
	<td >
	&nbsp;<span id='spnNewPerson' visible='True' runat='server'/>
	</td>
</tr>	
<tr>
    <td><b>Description</b></td>
    <td><span runat='server' id='spnDescription' /></td>
</tr>
<tr>
    <td></td>
    <td class='FieldLabel'>Enter a description of up to 50 characters.</td>
</tr>
</table>
<br/>

<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=GranteeProjectAdditionalContact&QueryStringKey=GranteeProjectAdditionalContactID&SecondQueryStringKey=None&IsPrimaryKey=True'
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
	
		<DataObject Key='GranteeProjectAdditionalContact' DataObjectDefinitionKey='GranteeProjectAdditionalContact' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectAdditionalContactID' PropertyKey='GranteeProjectAdditionalContactID' Value='' Bool=''/>		
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>		
			</Filters>
			<DefaultValues>
			    <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>			    
			     <DisplayProperty PropertyKey='GrantContactCategoryID'>
					<Control ID='ctlGrantContactCategory'
						Container='spnGrantContactCategory'
						Type='cDropDown'
						DataObjectDefinitionKey='GrantContactCategory'
						StoredValue='GrantContactCategoryID'
						DisplayValue='Description' DisplayText='Select' RequiredField='True'
						ErrorMessage='Grant Contact Category is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>	
			    <DisplayProperty PropertyKey='ContactTypeID'>
					<Control ID='ctlTypeOfAffiliation'
						Container='spnGrantContactType'
						Type='cDropDown'
						DataObjectDefinitionKey='GrantContactType'
						StoredValue='GrantContactTypeID'
						DisplayValue='Description' DisplayText='Select' RequiredField='True'
						ErrorMessage='Role is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>				
				 <DisplayProperty PropertyKey='StaffPersonID' PropertyValue='OtherStaff.LastNameFirstName'>
					<Control ID='ctlPerson' Type='cPopUpSelectorLauncher' RequiredField='True' LabelText='Selected Person '
						ErrorMessage='Person Name is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextBox'
						Size='45'
						MaxLength='50'>
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
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectAdditionalContact' DataObjectPropertyKey='GranteeProjectAdditionalContactID' PropertyKey='GranteeProjectAdditionalContactID' BaseValue='GranteeProjectAdditionalContactID='/>
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


