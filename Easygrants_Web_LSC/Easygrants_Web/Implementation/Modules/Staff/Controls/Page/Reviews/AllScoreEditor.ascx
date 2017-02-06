<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="AllScoreEditor.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cAllScoreEditorImpl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' Namespace='Core.Web.Navigation.CrumbTrail' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<asp:CustomValidator 
				id='valScores'
				runat='server'
				OnServerValidate='ValidateScores'
				ErrorMessage='Select a Competition and click "Go" to fill out rest of Reminder E-Mail form.'
				Display='None'/>

<asp:CustomValidator 
				id='valApplicants'
				runat='server'
				OnServerValidate='ValidateApplicants'
				Enabled='False'
				ErrorMessage=''
				Display='None'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<br />
<br />

<Core:cUserCtlLoader CtlID='ReviewStageInfo'
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStageInfo.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Review Assignment Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Reviewer</b></td>
		<td><span runat='server' id='spnName'/></td>
		<td><b>Committee</b></td>
		<td><span runat='server' id='spnCommittee'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Add or Edit Scores</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<%--<tr>
		<td colspan='4'>HHMI uses the following scoring system to rate applications:  A = 1,
		B = 2, C = 3, D = 4, F = 5.</td>
	</tr>--%>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center' width='100%'>
	<tr>
		<td align='center'><span runat='server' id='spnSave' />&nbsp;&nbsp;
		<span runat='server' id='spnSaveClose' />&nbsp;&nbsp;
		<span runat='server' id='spnClose' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnSubmit' visible='false'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCycle' DataObjectDefinitionKey='ReviewCycle'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='ReviewCycleCommittee.ReviewCommittee.ReviewCommitteeDescription'>
					<Control ID='spnCommittee' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' />
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='Person.LastNameFirstName'>
					<Control ID='spnName' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTaskAssignmentList' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument Type='Data' TypeKey='WfTaskRoleID' PropertyKey='WfTaskRoleID' Value='7' />
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
				</Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
				</Argument>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						NoRecordMessage='No reviewer tasks.'
						IsSaveOnSort='True'
						MaxPerPage='700'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName' ColumnHeader='Participant'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='Participant ~~Organization~~'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryOrganization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatus' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'>
									<RelatedProperty PropertyKey='WfTaskStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewRating' ColumnHeader='Score'>
							<Control ID='ctlScore'
								Type='cMoneyTextBox'
								MaxLength='3'
								Format='0.0'
								Size='5'
								RequiredField='False'
								MaxInputDecimalPlaces='1'
								RegExErrorMessage='Score must contain only digits.'
								DecimalErrorMessage='Score must be a number with up to 1 decimal.'
								CommaErrorMessage='Score cannot contain any commas.'
								ErrorMessage='Total Annual Research Funding amount is required.'>
							</Control>
							<Sortable>
								<Argument PropertyKey='ReviewRating'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Comments' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEditComment'
								Type='cButton'
								Image='Edit'>
								<Action PostBack='True'
									Object='DataPresenter'
									Method='EditComments'>
									<Parameters>
										<Argument Value='ScoreEditor'/>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' Value=''/>
										<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' Value=''/>
										<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' Value=''/>
										<Argument Type='URL' TypeKey='PathAndQuery' Value=''/>
									</Parameters>
								</Action>
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
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Container='spnSaveClose'
						Type='cButton'
						Image='Save_And_Close'>
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
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Image='Submit'
						Confirmation='Are you sure you want to Submit?  Once you submit, you will not be able to make changes'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='Submit'>
							<Parameters>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
