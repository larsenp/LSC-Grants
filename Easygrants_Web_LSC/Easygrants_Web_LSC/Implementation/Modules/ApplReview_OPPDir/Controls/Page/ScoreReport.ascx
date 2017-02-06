<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div width='100%' class='SeparatorHdg'>
	Instructions
</div>
<p>NOTE: This form should be used for single applicant service areas, where further review of the application is recommended. 
If no further review is recommended and the reviewer recommends full funding, complete the Final Recommendation Form (OA-2).</p>

<div width='100%' class='SeparatorHdg'>
	PART II. RATIONALE FOR FURTHER REVIEW
</div>
<p>A. The application was rated below average (2.0 or lower) in the following specific inquiries:</p>
<span runat='server' id='spnLowScores' />

<p>B. The application was rated above average (4.0 or higher) in the following specific categories:</p>
<span runat='server' id='spnHighScores' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	    <DataObject Key='ReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='5' />
			</Filters>
		</DataObject>
		
		<DataObject Key='LowScores' DataObjectDefinitionKey='LscReviewAssignmentInquiry' Updatable='False' CreateNew='False'>
			<Filters>
				
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='Value' Operator='LessThanEqual' Value='2'>
					<RelatedProperty PropertyKey='LscReviewInquiryScore' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlLowScores'
						Type='cDataListCtl'
						Container='spnLowScores'
						SeparatorWidth='2'
						DataObjectDefinitionKey='LscReviewAssignmentInquiry'>
						<DisplayProperty PropertyKey='LscReviewInquiryScore.Value' ColumnHeader='Score' />
						<DisplayProperty PropertyKey='LscReviewInquiry.LscReviewInquiryView.InquiryFullSpec' ColumnHeader='Inquiry' />
						<DisplayProperty PropertyKey='LscReviewInquiry.LscReviewCriterion.Weighting' ColumnHeader='Weighting (%)'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='HighScores' DataObjectDefinitionKey='LscReviewAssignmentInquiry' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='Value' Operator='GreaterThanEqual' Value='4'>
					<RelatedProperty PropertyKey='LscReviewInquiryScore' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlHighScores'
						Type='cDataListCtl'
						Container='spnHighScores'
						SeparatorWidth='2'
						DataObjectDefinitionKey='LscReviewAssignmentInquiry'>
						<DisplayProperty PropertyKey='LscReviewInquiryScore.Value' ColumnHeader='Score' />
						<DisplayProperty PropertyKey='LscReviewInquiry.LscReviewInquiryView.InquiryFullSpec' ColumnHeader='Inquiry' />
						<DisplayProperty PropertyKey='LscReviewInquiry.LscReviewCriterion.Weighting' ColumnHeader='Weighting (%)'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

