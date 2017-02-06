<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.PageSection.cPre_Review" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br />
<br />
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewPages.ascx'
	runat='server'/>
<br>

<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='ReviewStageDetails' LinkTitle='Conflicts and Preferences Processing' runat='server'/>

<Core:cUserCtlLoader CtlID='ReviewCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewCycleInfo.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' id='tblBulkAssignments' runat='server' width='100%'>
	<tr>
		<td colspan="3" class="SeparatorHdg"><b>Select Preprocessing</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="3">
			From this page you can identify requests/conflicts between reviewers and applications.
			Select the desired preprocess from the available drop-down list. The process will be run
			for the applicant and reviewer pools selected for this cycle.  The process will also copy
			any previous review cycle conflict/preference records for the same time period and competition.
			To view the results, use the <b>View</b> links at the bottom of this page.
		</td>
	</tr>
	<tr><td>&nbsp;<a name='Go'/></td></tr>
	<tr>
		<td width='25%' valign='top'><b>Select Preprocess</b></td>
		<td width='75%' colspan='2'><span runat='server' id='spnConflictProcess'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='25%' valign='top'><b>Run Preprocess</b></td>
		<td width='75%' colspan='2'><span runat='server' id='spnGenerateAssignments'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="3" class="SeparatorHdg"><b>Preprocess Generation Status</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="3">
			The status of the preprocess is listed in this section.  To view the most recent status,
			refresh the page by clicking the refresh button for your browser.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td colspan="3"><span runat='server' id='spnDataList'/></td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' id='tblManageAssignments' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>View and Modify Conflicts and Preferences</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
			<Core:cUserCtlLoader CtlID='lnkViewResults' Type='cLink' Properties='Caption=View Conflicts and Preferences in HTML&CausesValidation=False' runat='server' visible='true'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
			<Core:cUserCtlLoader CtlID='lnkViewMatches' Type='cLink' Properties='Caption=View Participant/Reviewer Research Area and Field Matching Results in HTML&CausesValidation=False' runat='server' visible='true'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
			View and Modify By Reviewer&nbsp;&nbsp;
			<span runat='server' id="spnReviewers"/>&nbsp;&nbsp;
			<span runat='server' id='spnByReviewer'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">View and Modify By Participant&nbsp;&nbsp;
			<span runat='server' id='spnApplicants'/>&nbsp;&nbsp;
			<span runat='server' id='spnByApplicant'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">View and Modify By Committee&nbsp;&nbsp;
			<span runat='server' id='spnCommittee'/>&nbsp;&nbsp;
			<span runat='server' id='spnByCommittee'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCycleCommittee' DataObjectDefinitionKey='ReviewCycleCommittee'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCommittee'
						Container='spnCommittee'
						Type='cDropDown'
						DataObjectDefinitionKey='ReviewCommittee'
						StoredValue='ReviewCommitteeID'
						DisplayNone='False'
						DisplayText='All'
						DisplayTextValue='-1'
						DisplayValue='ReviewCommitteeDescription'>
						<Filters>
							<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'>
								<RelatedProperty PropertyKey='ReviewCycleCommittee'/>
							</Argument>	
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlByCommittee'
						Container='spnByCommittee'
						Type='cButton'
						Image='Go'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ConflictByComm'/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='Control' TypeKey='ctlCommittee' ControlPropertyKey='SelectedValue' BaseValue='ReviewCommitteeID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlConflictProcess'
						Container='spnConflictProcess'
						Type='cDropDownText'
						DataObjectDefinitionKey='ConflictProcess'
						StoredValue='ConflictProcessID'
						TextKey='Description'
						DisplayNone='False'
						DisplayValue='DisplayName'>
						<SelectedValue>
							<Argument Type='QueryString' TypeKey='ConflictProcessID'/>
						</SelectedValue>
						<Sort>
							<Argument PropertyKey='DisplayName'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGenerateAssignments'
						Container='spnGenerateAssignments'
						Type='cButton'
						Confirmation='This will create all requests, conflicts, and/or matches as specified in the process selected. To continue click OK, to stop click Cancel.'
						Image='Go'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='Generate'>
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
						DisplayText='All'
						DisplayTextValue='-1'
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
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ConflictDetailByRev'/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycleCommittee' DataObjectPropertyKey='ReviewCommitteeID' BaseValue='CommitteeID='/>
								<Argument Type='Control' TypeKey='ctlReviewers' ControlPropertyKey='SelectedValue' BaseValue='RevPersonID='/>
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
						StoredValue='PersonID'
						DisplayNone='False'
						DisplayText='All'
						DisplayTextValue='-1'
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
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ConflictDetailByApp'/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='Control' TypeKey='ctlApplicants' ControlPropertyKey='SelectedValue' BaseValue='AppPersonID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='DataCommandRequest' DataObjectDefinitionKey='DataCommandRequest'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
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
						<DisplayProperty PropertyKey='ConflictProcess.DisplayName' ColumnHeader='Process' HeaderColspan='1'/>
						<DisplayProperty PropertyKey='CreateDate' ColumnHeader='Most Recent Request Date' NoWrap='True'/>
						<DisplayProperty PropertyKey='CreatedByUser.Person.LastNameFirstName' ColumnHeader='Requested By' NoWrap='True' HeaderColspan='1'/>
						<DisplayProperty PropertyKey='DataCommandRequestStatus.Description' ColumnHeader='Status' HeaderColspan='1'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>		
		<DataCommand Key='GeneratePrimaryConflicts' DataCommandDefinitionKey='GeneratePrimaryConflicts'>
			<Parameters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' ParameterKey='ReviewCycleID'/>
			</Parameters>
		</DataCommand>	
	</ModuleSection>
</span>
