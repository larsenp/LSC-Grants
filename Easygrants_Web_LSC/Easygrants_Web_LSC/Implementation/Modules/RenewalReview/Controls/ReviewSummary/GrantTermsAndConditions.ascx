<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />

<div class='SeparatorHdg' width='100%'>
	PART IV. SPECIAL GRANT CONDITIONS AND OTHER IDENTIFIED ISSUES
</div>
<p>A. Proposed special grant conditions should be identified and explained here. Click the buttons below to add or delete special grant conditions. </p>
<p><span runat='server' id='spnNoGrantConditions' /> No Grant Conditions to Add</p>

<span runat='server' id='spnGrantConditions' /><br />

<p>In the box below, enter the grant conditions to be included in the Grant Award Package.</p>
<span runat='server' id='spnSpecialGrantConditions' /><br />

<p>List and describe other identified issues that should be tracked by staff during the grant term. (Examples include: 
subgrant issues, PAI plans, client service data, technology, staffing patterns.) </p>
<span runat="server" id='spnNoOtherIssues' /> None<br /><br />
<span runat="server" id='spnOtherIssues' />
<br /><br />

<table width='600'>
	<tr>
		<td>
			<b>Primary Reader</b>
		</td>
		<td>
			<span runat='server' id='spnPrimaryReaderPersonID' />
		</td>
		<td>
			<b>Date</b> 
			<span runat='server' id='spnPrimaryReaderDate' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Recommendation Reader</b>
		</td>
		<td>
			<span runat='server' id='spnRecReaderPersonID' />
		</td>
		<td>
			<b>Date</b> 
			<span runat='server' id='spnRecReaderDate' />
		</td>
	</tr>
	<tr>
		<td>
			<b>OPP Management</b>
		</td>
		<td>
			<span runat='server' id='spnOPPMgmtPersonID' />
		</td>
		<td>
			<b>Date</b> 
			<span runat='server' id='spnOPPMgmtDate' />
		</td>
	</tr>
</table>
<br /><br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
		<DataObject Key='ReviewedWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='ReviewCycleStage.LscReviewCycleStage.TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='WfTACompetitionYear' />
				</Argument>
				<Argument Group='(' Bool='And' />
				<Argument PropertyKey='WfTaskID' Value='2' Bool=''/>
				<Argument PropertyKey='WfTaskID' Value='4' Bool='Or'/>
				<Argument Group=')' Bool='' />
			</Filters>
		</DataObject>
		<DataObject Key='LscRenewalRec' DataObjectDefinitionKey='LscRenewalRec' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='NoGrantConditions'>
					<Control ID='chkNoGrantConditions'
						Type='cCheckBox'
						Container='spnNoGrantConditions' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscRenewalRecHtml.SpecialGrantConditions' HtmlEncode='False'>
					<Control ID='spnSpecialGrantConditions'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NoOtherIssues'>
					<Control ID='txtNoOtherIssues'
						Type='cCheckBox'
						Container='spnNoOtherIssues'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscRenewalRecHtml.OtherIssues' HtmlEncode='False'>
					<Control ID='spnOtherIssues'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryReaderPerson.FirstNameLastName'>
					<Control ID='spnPrimaryReaderPersonID' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryReaderDate' Format='M/d/yyyy'>
					<Control ID='spnPrimaryReaderDate' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecReaderPerson.FirstNameLastName'>
					<Control ID='spnRecReaderPersonID' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecReaderDate' Format='M/d/yyyy'>
					<Control ID='spnRecReaderDate' 
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OPPMgmtPerson.FirstNameLastName'>
					<Control ID='spnOPPMgmtPersonID' 
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OPPMgmtDate' Format='M/d/yyyy'>
					<Control ID='spnOPPMgmtDate' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscGrantCondition' DataObjectDefinitionKey='LscGrantCondition' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewedWfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='ReviewedWfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlGrantConditions'
						Type='cDataListCtl'
						Container='spnGrantConditions'
						SeparatorWidth='2'
						DataObjectDefinitionKey='LscGrantCondition'>
						<DisplayProperty PropertyKey='LscGrantConditionType.Description' ColumnHeader='Condition' />
						<DisplayProperty PropertyKey='LscGrantConditionHtml.Comment' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
