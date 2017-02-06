<%@ Control Language="vb" AutoEventWireup="true" Codebehind="AssignmentsEditorByApp.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cAssignmentsEditorByApp" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="False" %>
<%@ Register Tagprefix='Core' tagname='cDoubleListBox' src='../../../../../../Core/Controls/Base/DoubleListBox.ascx' %>
<%@ Register Tagprefix='Core' tagname='cButton' src='../../../../../../Core/Controls/Base/CSSButton.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<asp:CustomValidator 
	id='valPrimary'
	runat='server'
	OnServerValidate='ValidatePrimary'
	ErrorMessage='You may only have one primary assignment for each applicant.'
	Display='None'/>

<!-- Page Content - Top Of Page -->
<br />
<br />
<Core:cUserCtlLoader CtlID='ReviewStageInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStageInfo.ascx'
	runat='server'/>
	
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Participant Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Participant</b></td>
		<td><span id='spnName' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Participant <%=GetLabel("Organization")%></b></td>
		<td><span id='spnInst' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Modify Review Assignments</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			To modify the review assignments, click the name(s) from the Available list and click the
			<b>Add</b> button. To remove a selected name from the assignments, select the name(s) from
			the Selected list and click the <b>Remove</b> button. (To select more than one name from a list,
			select the first name and hold the <b>CTL</b> key while selecting the additional names.)
		</td>
	</tr>
</table>
<a name='Type'/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='20%'><b>Select Review Assignment Type</b></td>
		<td><span runat='server' id='spnType'/></td>
	</tr>	
	<tr><td colspan='2'>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<Core:cDoubleListBox runat='server' id='ctlReviewCommitteeMember' DisplaySort='False'/>
		</td>
	</tr>	
	<tr><td colspan='2'>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
			<Core:cButton runat='server' id='btnSaveApplicants' Caption='Save' CausesValidation="false" />		
			<Core:cButton runat='server' id='btnSaveClose' Caption='Save and Close' CausesValidation="false" visible='false' />		
			&nbsp;<span runat='server' id='spnClose'/>		
		</td>
	</tr>
	<tr><td colspan='2'>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCycleStage' DataObjectDefinitionKey='ReviewCycleStage' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' />
			</Filters>
		</DataObject>
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GPID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlType'
						Container='spnType'
						Type='cDropDown'
						DataObjectDefinitionKey='ReviewAssignmentType'
						StoredValue='ReviewAssignmentTypeID'
						DisplayNone='False'
						DisplayValue='Description'>
						<SelectedValue>
							<Argument Type='QueryString' TypeKey='ReviewAssignmentTypeID' Value=''/>
						</SelectedValue>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName'>
					<Control ID='spnName' Type='HtmlGenericControl'/>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName'>
					<Control ID='spnInst' Type='HtmlGenericControl'/>
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
	</ModuleSection>
</span>
<!-- End Embedded XML -->
