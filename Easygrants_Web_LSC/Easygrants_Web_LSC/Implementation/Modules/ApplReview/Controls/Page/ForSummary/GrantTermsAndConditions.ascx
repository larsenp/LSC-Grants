<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg' width='100%'>
	PART IV. SPECIAL GRANT CONDITIONS AND OTHER IDENTIFIED ISSUES
</div>
<p><span runat='server' id='spnNoGrantConditions' /> No Grant Conditions to Add</p>
<span runat='server' id='spnGrantConditions' />

<p>B. The application was rated 2.0 or lower in the following specific RFP topics:</p>
<span runat='server' id='spnLowScores' /><br /><br />

<p>C. Other issues identified during the grant proposal review process. Please list and provide an explanation of the identified issues below:</p>
<span runat='server' id='spnPart4Comment' /><br /><br />
<span runat='server' id='spnNoOtherIssues' /> No issues<br /><br />

<div class='SeparatorHdg' width='100%'>
	PART V. GRANT TERMS AND GRANT CONDITION DESCRIPTIONS
</div>
<p>If applicant's funding term is to be restricted because of program performance, quality or compliance reasons, 
note the reasons for this restriction in the comment box below. </p>
<span runat='server' id='spnPart5Comment' /><br /><br />

<p>Please identitfy a grant term for this applicant from the drop down box (i.e. month-to-month; 3 months; 4 months; 1 year; 2 years or 3 years).</p>
Select Funding Term <span runat='server' id='spnLscFundingTermID' />

<p>If there are any special grant conditions for this applicant that you want to include in its Grant Award Package, check Yes below.</p>
<span runat='server' id='spnSpecialGrantConditions' /> Yes

<p>Enter the special grant condition language that you want to include in its Grant Award Package.</p>
<span runat='server' id='spnSpecialGrantConditionLanguage' />
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

		<DataObject Key='LscOA2' DataObjectDefinitionKey='LscOA2' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='NoGrantConditions'>
					<Control ID='chkNoGrantConditions'
						Type='cCheckBox'
						Container='spnNoGrantConditions' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SpecialGrantConditions'>
					<Control ID='chkSpecialGrantConditions'
						Type='cCheckBox'
						Container='spnSpecialGrantConditions' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscFundingTermID'>
					<Control ID='ctlLscFundingTermID'
						Type='cDropDown'
						Container='spnLscFundingTermID'
						DataObjectDefinitionKey='LscFundingTerm'
						StoredValue='LscFundingTermID'
						DisplayValue='Description' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='NoOtherIssues'>
					<Control ID='chkNoOtherIssues'
						Type='cCheckBox'
						Container='spnNoOtherIssues' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscGrantCondition' DataObjectDefinitionKey='LscGrantCondition' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewedWfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='ReviewedWfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlGrantConditions'
						Type='cDataListCtl'
						Container='spnGrantConditions'
						SeparatorWidth='2'
						DataObjectDefinitionKey='LscGrantCondition'>
						<DisplayProperty PropertyKey='LscGrantConditionType.Description' ColumnHeader='Condition' />
						<DisplayProperty PropertyKey='Comment' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscOA2Html' DataObjectDefinitionKey='LscOA2Html' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscOA2' DataObjectPropertyKey='LscOA2ID' PropertyKey='LscOA2ID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Part4Comment' HtmlEncode='False'>
					<Control ID='spnPart4Comment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Part5Comment' HtmlEncode='False'>
					<Control ID='spnPart5Comment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SpecialGrantConditionLanguage' HtmlEncode='False'>
					<Control ID='spnSpecialGrantConditionLanguage'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscReviewAssignmentInquiry' DataObjectDefinitionKey='LscReviewAssignmentInquiry' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
				<Argument PropertyKey='Value' Value='2.0' Operator='LessThanEqual' >
					<RelatedProperty PropertyKey='LscReviewInquiryScore' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlLowScores'
						Type='cDataListCtl'
						Container='spnLowScores'
						DataObjectDefinitionKey='LscReviewAssignmentInquiry'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer Name' />
						<DisplayProperty PropertyKey='WfTaskAssignment.GranteeProject.WfProject.WfCompetition.CompetitionDisplayName' ColumnHeader='Service Area' />
						<DisplayProperty PropertyKey='LscReviewInquiryScore.Value' ColumnHeader='Score' />
						<DisplayProperty PropertyKey='LscReviewInquiry.LscReviewInquiryView.DescriptionOrSubtopic' ColumnHeader='Category' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

