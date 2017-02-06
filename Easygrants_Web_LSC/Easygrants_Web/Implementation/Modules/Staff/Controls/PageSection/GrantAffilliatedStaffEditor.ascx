<%@ Control Language="vb" AutoEventWireup="true" Codebehind="GrantAffilliatedStaffEditor.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cGrantAffilliatedStaffEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br/>
<!-- Page Content - Top Of Page -->

<!-- Page Content - Controls -->
Provide information on the staff member related to the grant. Click <b>Select</b> to locate the staff member's name using the Person Selector tool. All fields marked with a red asterisk (<%=kDenoteRequiredField%>) are required. 
<br/>

<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
runat='server' />
<br />
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    
    <tr>
		<td class="SeparatorHdg" colspan='2' ><b>Edit Affiliated Staff</b></td>
	</tr>
	<tr>
	    <td colspan='2'>&nbsp;</td>
	</tr>    
<tr>
	<td width='15%'><b>Primary</b></td>	
	<td><span runat='server' id='spnPrimary' /></td>
</tr>
<tr  id='trPersonEditable'>
	<td ><b>Staff Person&nbsp;</b><%=kDenoteRequiredField%>&nbsp;</td>
	<td><Core:cUserCtlLoader CtlID='ctlPer' Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx' Properties='Origin=Person'
				runat='server' id="CUserCtlLoader3" /></td>	
</tr>
<tr>
    <td><b>Type Of Affiliation&nbsp;</b><%=kDenoteRequiredField%></td>
    <td><span runat='server' id='spnTypeOfAffiliation' /></td>
</tr>
</table>
	<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
	Src='EasyGrants/Controls/PageSection/History.ascx'
	Properties='DataObjectDefinitionKey=GranteeProjectStaffAffiliation&QueryStringKey=GranteeProjectStaffAffiliationID&SecondQueryStringKey=None&IsPrimaryKey=True'
	runat='server' />

<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table id="Table2" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr><td>&nbsp;</td></tr>		
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
		<DataObject Key='GranteeProjectStaffAffiliation' DataObjectDefinitionKey='GranteeProjectStaffAffiliation' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectStaffAffiliationID' 
					PropertyKey='GranteeProjectStaffAffiliationID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
			    <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='IsPrimary'>
					    <Control ID='ctlIsPrimary'
						    Container='spnPrimary'
						    Type='cCheckBox'>
					    </Control>
				    </DisplayProperty>
			    <DisplayProperty PropertyKey='StaffPersonID' PropertyValue='StaffPersonContact.LastNameFirstNameMiddleName' ReadOnly='QueryID'>
					    <Control ID='ctlPer' Type='cPopUpSelectorLauncher' RequiredField='True' LabelText='Selected Contact '
						    ErrorMessage='Staff person is required.' >						   
						</Control>   
				 </DisplayProperty>
			    <DisplayProperty PropertyKey='AffiliationTypeID'>
					<Control ID='ctlTypeOfAffiliation'
						Container='spnTypeOfAffiliation'
						Type='cDropDown'
						DataObjectDefinitionKey='GranteeProjectAffilType'
						StoredValue='AffiliationTypeID'
						DisplayValue='Description' DisplayText='Select' RequiredField='True'
						ErrorMessage='Type of Affiliation is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
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
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectStaffAffiliation' DataObjectPropertyKey='GranteeProjectStaffAffiliationID' PropertyKey='GranteeProjectStaffAffiliationID' BaseValue='GranteeProjectStaffAffiliationID='/>
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
			<ctlPer>
				<DataObject Key='PersonID' DataObjectDefinitionKey='StaffUserType' DisplayName='Person &amp;apos;s  last name '>
					<SearchProperties>
						<SearchProperty DisplayValue='LastName' DisplayLabel='Last Name' />
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='Person.LastNameFirstNameMiddleName' />
					</DisplayProperties>
				</DataObject>
			</ctlPer>
		</UserCtlLoader>
	</ModuleSection>
<!-- End Embedded XML -->
</span>

