<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageContent.cConflictDetailByRevEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="ConflictDetailByRevEditor.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />
	
<asp:CustomValidator 
	id='valApplicant'
	runat='server'
	OnServerValidate='ValidateApplicant'
	ErrorMessage='Applicant Name is required.'
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
<Core:cUserCtlLoader CtlID='ReviewerInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewerInfo.ascx'
	runat='server'/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Edit Conflicts and Preferences</b></td>
</tr>	
</table>
<br>
<!--<span id='spnAddContent' runat='server' visible='false'>
This page allows you to add or modify results for the reviewer displayed.
Select the applicant name from the drop-down list.  The page will refresh allowing you to
select the Type and Conflict Type from the drop-down.  Selecting "None" as your Type removes
the conflict/request record and it will not appear on the Results Details by Reviewer page.
<b>Note:</b> Conflict Type is required if you have selected "Conflict" in the Type section.
</span><br>
<span id='spnEditContent' runat='server' visible='false'>
This page allows you to add or modify results for the reviewer displayed.
Select the Type and Conflict Type by selecting the appropriate type from the drop-down.
Selecting "None" as your Type removes the conflict/request record and it will not appear on
the Results Details by Reviewer page.  <b>Note:</b> Conflict Type is required if you have
selected "Conflict" in the Type section.
</span>-->
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td valign='top' width='200'><b>Participant</b>&nbsp;<%=kDenoteRequiredField%><a name='Applicant'/></td>
		<td>
			<Core:cUserCtlLoader CtlID='ctlPerson' Type='cDropDown' runat='server'/>
			<span runat='server' id='spnName' visible='false'/>
		</td>
	</tr>
</table>
<table id='tbl' border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td valign='top' width='200'><b>Type</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnType'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Conflict/Preference Type</b>&nbsp;&nbsp;</td>
		<td><span runat='server' id='spnConflict'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
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
		<DataObject Key='AppPerson' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='QueryString' TypeKey='AppPersonID' PropertyKey='PersonID' />
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='LastNameFirstNamePrimInst'>
					<Control ID='spnName' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryPersonID' PropertyKey='PersonID'/>
				<Argument Type='Data' TypeKey='WfTaskRoleID' PropertyKey='WfTaskRoleID' Value='1' />
				<!--
				<Argument Type='Data' TypeKey='WfTaskTypeID' PropertyKey='WfTaskTypeID' Value='1'>
					<RelatedProperty PropertyKey='WfTask'/>
				</Argument>
				-->
				<Argument Type='DataObjectCollection' TypeKey='WfProjectTask' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID'/>
			</Filters>
		</DataObject>

		<DataObject Key='ReviewCycleConflict' DataObjectDefinitionKey='ReviewCycleConflict' Updatable='True' CreateNew='True'>
			<Filters>
				<!--
				<Argument Type='QueryString' TypeKey='ReviewCycleConflictID' PropertyKey='ReviewCycleConflictID' />
				-->
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
						DisplayNone='True' >
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
	</ModuleSection>
</span>
<!-- End Embedded XML -->
