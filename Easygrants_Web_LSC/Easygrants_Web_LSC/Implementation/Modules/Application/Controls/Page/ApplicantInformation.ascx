<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br>
      <span id='spnPageContent' runat='server' />

<!-- USER MODIFIIABLE CONTENT AREA -->

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr>
	  <td><h1>Applicant Information</h1></td>
  </tr>
		
</table>
<table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
  <tr>
    <td colspan="4" class="SeparatorHdg">Instructions</td>
  </tr>
  <tr>
    <td colspan="4" >&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" ><p>The <strong>Applicant Information</strong> page captures information on applicants including position, applicant category, address, telephone and email address. </p>
      <ul>
        <li>In the <strong>Applicant Information</strong> section, click <strong>Edit</strong> to add or edit information about your name, position/title or applicant category</li>
        <li>In the <strong>Address</strong>,<strong> Telephone/Fax</strong> and <strong>Email Address</strong> sections, click <strong>Add</strong> to add additional information</li>
        <li>In the <strong>Address</strong>,<strong> Telephone/Fax</strong> and <strong>Email Address</strong> sections, click <strong>Edit</strong> or <strong>Delete</strong> to edit or delete information</li>
        <li>To go to the next page, click <strong>Continue</strong> </li>
      </ul>
      <p><strong><font color="#990000">Note: The following sections on this page need to be completed:</font></strong></p>
      <ul>
        <li>Applicant Information</li>
        <li>Address</li>
        <li>Telephone/Fax</li>
        <li>Email Address </li>
      </ul></td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td width="160" valign="top" >
          <Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/>
      </td>
  </tr>
  <tr>
    <td valign="top" >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td valign="top" >&nbsp;</td>
  </tr>
</table>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Applicant Information</b></td>
	</tr>	
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width='26%'><b>Name</b></td>
		<td colspan="3"><span id='spnName' runat='server'/></td>
	</tr>
	<tr>
		<td	width='26%'><b>Organization</b></td>
		<td colspan="3"><span id='spnOrganization' runat='server'/></td>
	</tr>
	<tr>
		<td	width='26%'><b>Applicant Category</b></td>
		<td colspan="3"><span id='spnCategory' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><span id='spnEdit' runat='server'/></td>
		<td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<Core:cUserCtlLoader CtlID='ctlContactAddress' 
	Src='EasyGrants/Controls/PageSection/Contact_Address.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlContactPhone' 
	Src='EasyGrants/Controls/PageSection/Contact_Phone.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlContactEmail' 
	Src='EasyGrants/Controls/PageSection/Contact_Email.ascx'
	runat='server'/>
</br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600' >
	<tr align='center'>
		<td>			
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName'>
					<Control ID='spnName' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.OrganizationName'>
					<Control ID='spnOrganization' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscGranteeProjectInfo.ApplicantCategory.Description'>
					<Control ID='spnCategory' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlEdit'
						Container='spnEdit'
						Caption='Edit'
						Type='cButton'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ApplicantInformationEditor'/>
								<Argument Type='DataPresenter' TypeKey='GranteeProjectID' AttributeName='' BaseValue='GranteeProjectID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Continue'
						Save='False'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->