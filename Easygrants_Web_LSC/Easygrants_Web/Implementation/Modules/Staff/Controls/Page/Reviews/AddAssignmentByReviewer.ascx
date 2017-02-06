<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cAddAssignmentByReviewer" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="AddAssignmentByReviewer.ascx.vb" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />

<!-- Page Content - Top Of Page -->
<br />
<br />
<Core:cUserCtlLoader CtlID='ReviewStageInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStageInfo.ascx'
	runat='server'/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Reviewer Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>>
	<tr>
		<td width='20%'><b>Reviewer</b></td>
		<td><span id='spnName' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Reviewer <%=GetLabel("Organization")%></b></td>
		<td><span id='spnInst' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Committee</b></td>
		<td><span id='spnCmt' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Add Review Assignments</b></td>
	</tr>
</table>
<a name='Type'/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td colspan='2'>&nbsp;</td></tr>
	<tr>
		<td width='20%'><b>Participant</b></td>
		<td><span runat='server' id='spnApplicant'/></td>
	</tr>
	<tr>
		<td width='20%'><b>Select Review Assignment Type</b></td>
		<td><span runat='server' id='spnType'/></td>
	</tr>	
	<tr><td colspan='2'>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnClose'/>
		</td>
	</tr>
	<tr><td colspan='2'>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Reviewer' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewerID' PropertyKey='PersonID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastNameFirstName'>
					<Control ID='spnName' Type='HtmlGenericControl'/>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='spnInst' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReviewCycleStage' DataObjectDefinitionKey='ReviewCycleStage'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='ReviewCommitteeMember' DataObjectDefinitionKey='ReviewCommitteeMember'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewerID' PropertyKey='PersonID'/>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'>
					<RelatedProperty PropertyKey='ReviewCommittee.ReviewCycleCommittee'/>
				</Argument>
			</Filters>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='ReviewCommittee.ReviewCommitteeDescription'>
					<Control ID='spnCmt' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='ReviewerID' PropertyKey='PersonID'/>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Value='1'/>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskRoleID' Value='7'/>
				<Argument Type='' TypeKey='' PropertyKey='ReviewPreferenceTypeID' Value='0'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCommitteeMember' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID'/>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCycleStage' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProjectID'>
					<Control ID='ctlApplicant'
						Container='spnApplicant'
						Type='cDropDown'
						DataObjectDefinitionKey='vApplicantPool'
						StoredValue='GranteeProjectID'
						DisplayNone='False'
						DisplayValue='LastNameFirstName'>
						<Filters>
							<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='LastName' />
							<Argument PropertyKey='FirstName' />
						</Sort>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='ReviewAssignmentTypeID'>
					<Control ID='ctlType'
						Container='spnType'
						Type='cDropDown'
						DataObjectDefinitionKey='ReviewAssignmentType'
						StoredValue='ReviewAssignmentTypeID'
						DisplayValue='Description'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey=''>
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
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='Data' TypeKey='' BaseValue='Page=AssignmentsEditorByReviewerOne'/>
								<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
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
