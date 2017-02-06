<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ReviewStageAssign.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cReviewStageAssign" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStagePages.ascx'
	runat='server'/>
<br>
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='RevProcAssign' LinkTitle='Assignments' runat='server'/>
<p>
<Core:cUserCtlLoader CtlID='ReviewStageInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStageInfo.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' id='tblBulkAssignments' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Bulk Assignments - Participant Tasks to Reviewers</b></td>
	</tr>
	<tr>
		<td colspan="2">
		To create review assignments in bulk, follow these steps:<br />
		<br>1. Select the Assignment Process.  The page will refresh and the assignment process description will be displayed.  
		<br>2. Check the Conflicts and Preferences Preprocessing box if you want to include the pre-review results (i.e., conflicts and preferences) in the assignment process.  
		<br>3. Enter the number of review assignments per participant in the text box provided.
		<br>4. Click the <b>Go</b> button to create the assignments.  (Assignments can be viewed and modified in the View and Modify Assignments section.)
		</td>
	</tr>
	<tr>
		<td><a name='AssignmentProcess'/>&nbsp;</td>
	</tr>
	<tr>
		<td valign='top' width='30%'><b>Select Assignment Process</b></td>
		<td rowspan='2'><span runat='server' id='spnAssignmentProcess'/></td>
	</tr>
	<tr>
		<td valign="top"><b>Description</b></td>
	</tr>
	
	<!-- Comment after testing -->
	<%--<tr>
		<td>Generation Type</td>
		<td>
			<span runat='server' id='spnGenType'/>&nbsp;&nbsp;
			(1-Random; 2-Avoid reviewers from previous stage; 3-Use reviewers from previous stage)
		</td>
	</tr>
	<tr>
		<td>Number of shared applicants</td>
		<td>
			<span runat='server' id='spnNumSharedApplicants'/>&nbsp;&nbsp;
			(Enter -1 to disable this option)
		</td>
	</tr>--%>
	<!-- End Comment after testing -->

	<tr>
		<td><b>Include Conflicts and Preferences Preprocessing?</b></td>
		<td><span runat='server' id='spnCheckConflict'/></td>
	</tr>
	<tr>
		<td><b>Number of review assignments per participant</b></td>
		<td valign='top'><span runat='server' id='spnNumReviewersPerApplicant'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b>Run Selected Assignment Process</b>&nbsp;&nbsp;<span runat='server' id='spnGenerateAssignments'/>
		</td>
	</tr>
	<tr>
		<td colspan='2'>(Enter -1 to assign all reviewers to all participants.)</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Bulk Assignment Process Status</b></td>
	</tr>
	<tr>
		<td colspan="2">To view the most recent status, refresh the page by clicking the refresh
		button for your browser.  The assignment process status is displayed below.</td>
	</tr>
	<tr><td colspan="2"><span runat='server' id='spnDataList'/></td></tr>
	<tr>
		<td colspan="2" class="SeparatorHdg">
			<b>View and Modify Bulk Assignments - OR - Manually Assign</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
			You may set review assignments manually, or review and modify bulk
			assignments by selecting one of the <b>View and Modify by ...</b> options below.
		</td>
	</tr>
</table>

<table border='0' cellspacing='6' cellpadding='2' id='tblManageAssignments' runat='server' width='100%'>
	<tr>
		<td width='25%'>View and Modify Assignments by Reviewer</td>
		<td>
			<span runat='server' id='spnReviewers'/>&nbsp;&nbsp;
			<span runat='server' id='spnByReviewer'/>
		</td>
	</tr>
	<tr>
		<td>View and Modify Assignments by Participant</td>
		<td>
			<span runat='server' id='spnApplicants'/>&nbsp;&nbsp;
			<span runat='server' id='spnByApplicant'/>
		</td>
	</tr>
	<tr visible='false'>
		<td>&nbsp;</td>
		<td><span id='spnViewHistory' runat='server'/></td>
	</tr>
	<tr>
		<td>View Assignments by Committee</td>
		<td>
			<span runat='server' id='spnCmt'/>&nbsp;&nbsp;
			<span runat='server' id='spnByCmt'/>
		</td>
	</tr>
	<tr visible='false'>
		<td>View Assignments by Reviewer and Committee</td>
		<td><span runat='server' id='spnByReviewerSubCmt'/></td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<!-- Needed for matches pop-up -->
		<DataObject Key='ReviewCycleCommittee' DataObjectDefinitionKey='ReviewCycleCommittee'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='ReviewCycleStage' DataObjectDefinitionKey='ReviewCycleStage' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CheckConflict'>
					<Control ID='ctlCheckConflict'
						Container='spnCheckConflict'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue=''/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NumReviewersPerApplicant'>
					<Control ID='ctlNumReviewersPerApplicant'
						Container='spnNumReviewersPerApplicant'
						Type='cTextBox'
						Size='2'
						MaxLength='9'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAssignmentProcess'
						Container='spnAssignmentProcess'
						Type='cDropDownText'
						DataObjectDefinitionKey='AssignmentProcess'
						StoredValue='AssignmentProcessID'
						TextKey='Description'
						DisplayNone='False'
						DisplayValue='Abbr'>
						<SelectedValue>
							<Argument Type='QueryString' TypeKey='AssignmentProcessID'/>
						</SelectedValue>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGenerateAssignments'
						Container='spnGenerateAssignments'
						Type='cButton'
						Confirmation='This will create all the review assignments as specified in the process selected.  To continue click OK, to stop click Cancel.'
						Image='Go'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='Generate'>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCmt'
						Container='spnCmt'
						Type='cDropDown'
						DataObjectDefinitionKey='ReviewCycleCommittee'
						StoredValue='ReviewCommitteeID'
						DisplayNone='False'
						DisplayValue='ReviewCommittee.ReviewCommitteeDescription'>
						<Filters>
							<Argument Type='QueryString' TypeKey='ReviewCycleID'
								PropertyKey='ReviewCycleID' Value='' bool=''/>
						</Filters>
						<Sort>
							<Argument PropertyKey='ReviewCommitteeDescription'>
								<RelatedProperty PropertyKey='ReviewCommittee'/>
							</Argument>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlByCmt'
						Container='spnByCmt'
						Type='cButton'
						Image='Go'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='AssignmentByCommittee'>
							<Parameters>
								<Argument Type='Control' TypeKey='ctlCmt' ControlPropertyKey='SelectedValue' Value=''/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' Value=''/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' Value=''/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlByReviewerSubCmt'
						Container='spnByReviewerSubCmt'
						Type='cButton'
						Image='Go'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='AssignmentByReviewerSubcommittee'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' Value=''/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' Value=''/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReviewers'
						Container='spnReviewers'
						Type='cDropDown'
						DataObjectDefinitionKey='vCommitteePool'
						StoredValue='PersonID'
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
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlByReviewer'
						Container='spnByReviewer'
						Type='cButton'
						Image='Go'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='AssignmentByReviewer'/>
								<Argument Type='Control' TypeKey='ctlReviewers' ControlPropertyKey='SelectedValue' BaseValue='ReviewerID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicants'
						Container='spnApplicants'
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
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlByApplicant'
						Container='spnByApplicant'
						Type='cButton'
						Image='Go'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='AssignmentByApplicant'/>
								<Argument Type='Control' TypeKey='ctlApplicants' ControlPropertyKey='SelectedValue' BaseValue='GPID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlViewHistory'
						Container='spnViewHistory'
						Type='cLink'
						Caption='View History'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='ViewHistory'>
							<Parameters>
								<Argument Value='ViewHistoryByApplicant'/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' />
								<Argument Type='QueryString' TypeKey='ReviewCycleID' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='DataCommandRequest' DataObjectDefinitionKey='DataCommandRequest'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
				<Argument Type='Data' TypeKey='' PropertyKey='ProcessID' Operator='GreaterThan' Value='0'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='CreateDate' Direction='Descending'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='AssignmentProcess.Abbr' ColumnHeader='Process' HeaderColspan='1'/>
						<DisplayProperty PropertyKey='CreateDate' ColumnHeader='Most Recent Request Date' NoWrap='True'/>
						<DisplayProperty PropertyKey='CreatedByUser.Person.LastNameFirstName' ColumnHeader='Requested By' NoWrap='True' HeaderColspan='1'/>
						<DisplayProperty PropertyKey='DataCommandRequestStatus.Description' ColumnHeader='Status' HeaderColspan='1'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
