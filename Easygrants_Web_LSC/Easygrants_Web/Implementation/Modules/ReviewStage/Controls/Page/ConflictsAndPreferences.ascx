<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="ConflictsAndPreferences.ascx.vb" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page.cConflictsAndPreferences" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cNewWindowOpener id='ctlNewWindowOpener' runat='server' />
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<!-- "Content Manager" tags -->
<br />
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
<tr>
	<td class="SeparatorHdg"><b>Instructions</b></td>
</tr>
<tr>
	<td>&nbsp;</td>
</tr>
<tr>
	<td><span id='spnPageContent' runat='server' /></td>
</tr>
</table>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Enter Conflicts and Preferences</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>
	<tr id='trSave1'>
		<td colspan='2'>
			<span runat='server' id='spnSave' />&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSave_and_Continue' />
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent />
		<DataObject Key='ReviewWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
			</Filters>
		</DataObject>	
		<DataObject Key='ReviewConflicts' DataObjectDefinitionKey='ReviewConflicts' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' Value='' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='RevWfTaskID' Value='' />
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTaskAssignment' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'>
					<RelatedProperty PropertyKey='RevWfta'/>
				</Argument>
			</Filters>				
			<Sort>
				<Argument PropertyKey='ApplicantName' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='ReviewConflicts'
						NoRecordMessage='No reviewer tasks.'
						IsSaveOnSort='True'
						SeparatorWidth='2'
						MaxPerPage='600'>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='GranteeProjectID'/>
							</Sortable>
							<Control ID='ctlLinkGrantID' Type='cLink' >
								<Action
									PostBack='True'
									AutoSave='True'
									Object='DataPresenter'
									Method='ViewParticipantSummary'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ParticipantSummary'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ApplicantName' ColumnHeader='Primary Contact/PI'>
							<Sortable>
								<Argument PropertyKey='ApplicantName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='~~Organization~~'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryOrganization' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RequestConflictID' ColumnHeader='Options' DataAlign='Center' HeaderAlign='Center'>
							<Control ID='ctlOptions'
								Type='cRadioButtonList'
								DataObjectDefinitionKey='RequestConflict'
								StoredValue='RequestConflictID'
								DisplayValue='Description'
								RepeatDirection='Horizontal'
								RepeatColumns='0'
								DefaultValue='1'
								RequiredField='True'
								ErrorMessage='Conflict/Preference option is required.'>
								<Sort>
									<Argument PropertyKey='Description' />
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ConflictTypeID' ColumnHeader='Reason for Conflict' DataAlign='Center' HeaderAlign='Center'>
							<Control ID='ctlConflictType'
								Type='cDropDown'
								DataObjectDefinitionKey='ConflictType'
								StoredValue='ConflictTypeID'
								DisplayValue='Description'>
								<Sort>
									<Argument PropertyKey='Description' />
								</Sort>
							</Control>
						</DisplayProperty>
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
						Image='Save' EnterKey='True'
						ToolTipText='Save and stay on this page'>
						<Action
							PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton' 
						Image='Continue' 
						GoToNextPage='True' >
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<ValidationItem Type='Method'>
                <Action
                                Object='ModulePage'
                                Method='ValidateScores'>
                </Action>
                <Results>
                                <Result
                                                ResultCode='1'
                                                Message=''/>
                                <Result
                                                ResultCode='3'
                                                Message='Enter a score for every proposal.'/>
                                </Results>
</ValidationItem>
<ValidationItem Type='Method'>
                <Action
                                Object='ModulePage'
                                Method='ValidateCritiques'>
                </Action>
                <Results>
                                <Result
                                                ResultCode='1'
                                                Message=''/>
                                <Result
                                                ResultCode='3'
                                                Message='Enter a critique/comment for every proposal.'/>
                                </Results>
</ValidationItem>