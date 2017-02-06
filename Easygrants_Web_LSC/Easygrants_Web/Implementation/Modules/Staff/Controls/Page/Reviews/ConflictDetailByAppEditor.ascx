<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cConflictDetailByAppEditor" CodeBehind="ConflictDetailByAppEditor.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

	<asp:CustomValidator 
		id='valReviewer'
		runat='server'
		OnServerValidate='ValidateReviewer'
		ErrorMessage='Reviewer Name is required.'
		Enabled='False'
		Display='None'/>

	<asp:CustomValidator 
		id='valConflict'
		runat='server'
		OnServerValidate='ValidateConflict'
		ErrorMessage='If you select Conflict from the Type section, select a Conflict Type from the drop down.'
		Enabled='True'
		Display='None'/>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<Core:cUserCtlLoader CtlID='ReviewCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewCycleInfo.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ApplicantInfo' visible='true'
	Src='Implementation/Modules/Staff/Controls/PageSection/AppInfo.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Edit Conflicts and Preferences</b></td>
	</tr>
</table>
<br>
<!--<span id='spnAddContent' runat='server' visible='false'>
This page allows you to add or modify results for the applicant displayed.
Select the committee and reviewer name from the drop-down lists.  The page will refresh
allowing you to select the Type and Conflict Type from the drop-down.  Selecting "None"
as your Type removes the conflict/request record and it will not appear on the Results
Details by Applicant page.  <b>Note:</b> Conflict Type is required if you have selected
"Conflict" in the Type section.
</span>
<span id='spnEditContent' runat='server' visible='false'>
This page allows you to add or modify results for the applicant displayed.
Select the Type and Conflict Type by selecting the appropriate type from the drop-down.
Selecting "None" as your Type removes the conflict/request record and it will not appear on
the Results Details by Applicant page.  <b>Note:</b> Conflict Type is required if you have
selected "Conflict" in the Type section.
</span>
<br><br>-->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr id='trCommittee' runat='server' visible='true'>
		<td valign='top' width='250'><b>Committee</b><a name='Committee'/></td>
		<td>
			<span runat='server' id='spnCommittee'/>
			<span runat='server' id='spnCommitteeLabel' visible='false'/><br>
		</td>
	</tr>
	<tr>
		<td valign='top' width='250'><b>Reviewer</b>&nbsp;<%=kDenoteRequiredField%><a name='Reviewer'/></td>
		<td>
			<Core:cUserCtlLoader CtlID='ctlPerson' Type='cDropDown' runat='server'/>
			<span runat='server' id='spnName' visible='false'/>
		</td>
	</tr>
</table>
<table id='tbl' border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td width='250' valign="top"><b>Reviewer <%=GetLabel("Organization")%></b></td>
		<td><br><span runat='server' id='spnInst'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td valign='top' width='250'><b>Type</b></td><td>
		<span runat='server' id='spnType'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='250'><b>Conflict/Preference Type</b>&nbsp;&nbsp;</td>
		<td><span runat='server' id='spnConflict'/></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCycleCommittee' DataObjectDefinitionKey='ReviewCycleCommittee'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewCommittee.ReviewCommitteeDescription'>
					<Control ID='spnCommitteeLabel' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReviewCycleProjectTask' DataObjectDefinitionKey='ReviewCycleProjectTask'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
			</Filters>
		</DataObject>
		
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCycleProjectTask' DataObjectPropertyKey='WfProjectTaskID' PropertyKey='WfProjectTaskID'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='AppPersonID' PropertyKey='PrimaryPersonID' />
				<Argument Type='DataObjectCollection' TypeKey='WfProjectTask' DataObjectPropertyKey='WfProjectID' PropertyKey='WfProjectID'/>
			</Filters>
		</DataObject>

		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryPersonID' PropertyKey='PersonID'/>
				<Argument Type='Data' TypeKey='WfTaskRoleID' PropertyKey='WfTaskRoleID' Value='1' />
				<Argument Type='DataObjectCollection' TypeKey='WfProjectTask' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='RevPerson' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='QueryString' TypeKey='RevPersonID' PropertyKey='PersonID' />
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='LastNameFirstName'>
					<Control ID='spnName' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='spnInst' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='ReviewCycleConflict' DataObjectDefinitionKey='ReviewCycleConflict' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
				<Argument Type='QueryString' TypeKey='RevPersonID' PropertyKey='RevPersonID' />
				<Argument Type='QueryString' TypeKey='AppPersonID' PropertyKey='AppPersonID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
				<Argument Type='QueryString' TypeKey='RevPersonID' PropertyKey='RevPersonID' />
				<Argument Type='QueryString' TypeKey='AppPersonID' PropertyKey='AppPersonID' />
				<Argument Type='QueryString' TypeKey='CommitteeID' PropertyKey='ReviewCommitteeID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTAID' />
				<Argument Type='' TypeKey='' PropertyKey='ReviewSourceID' Value='2' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RequestConflictID'>
					<Control ID='ctlType'
						Container='spnType'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Type is required.'
						DataObjectDefinitionKey='RequestConflict'
						StoredValue='RequestConflictID'
						DisplayValue='Description'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ConflictTypeID'>
					<Control ID='ctlConflict'
						Container='spnConflict'
						Type='cDropDown'
						DataObjectDefinitionKey='ConflictType'
						StoredValue='ConflictTypeID'
						DisplayValue='Description'
						DisplayNone='True'>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycleConflict' DataObjectPropertyKey='ReviewCycleConflictID' PropertyKey='ReviewCycleConflictID' BaseValue='ReviewCycleConflictID='/>
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

		<DataObject Key='ReviewCommittee' DataObjectDefinitionKey='ReviewCycleConflict' >
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewCommitteeID'>
					<Control ID='ctlCommittee'
						Container='spnCommittee'
						Type='cDropDown'
						DataObjectDefinitionKey='ReviewCycleCommittee'
						StoredValue='ReviewCommitteeID'
						DisplayValue='ReviewCommittee.ReviewCommitteeDescription'
						DisplayNone='False'
						RequiredField='True'
						ErrorMessage='Committee is required.'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='ReviewCycleCommittee' PropertyKey='ReviewCycleID' DataObjectPropertyKey='ReviewCycleID' Value='' />
						</Filters>
						<Sort>
							<Argument PropertyKey='ReviewCommitteeDescription'>
								<RelatedProperty PropertyKey='ReviewCommittee'/>
							</Argument>
						</Sort>
						<SelectedValue>
							<Argument Type='QueryString' TypeKey='CommitteeID' PropertyKey='ReviewCommitteeID' Value=''/>
						</SelectedValue>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
