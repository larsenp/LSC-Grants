<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/PPQVApplicantInformation.ascx'
	runat='server'/>
<br />
<div width='100%' class='SeparatorHdg'>
	PART II. RATIONALE FOR FURTHER REVIEW
</div>
<p>A. The application was rated below average (2.0 or lower) in the following specific categories:</p>
<span runat='server' id='spnLowScores' />

<p>B. The application was rated above average (4.0 or higher) in the following specific categories:</p>
<span runat='server' id='spnHighScores' />

<table width='100%'>
	<tr>
		<td align='center'>
			<span runat="server" id='spnContinue' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LowScores' DataObjectDefinitionKey='LscPpqvReviewScoreByCategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='Score' Operator='LessThanEqual' Value='2'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlLowScores'
						Type='cDataListCtl'
						Container='spnLowScores'
						SeparatorWidth='2'
						DataObjectDefinitionKey='LscPpqvReviewScoreByCategory'>
						<DisplayProperty PropertyKey='Score' ColumnHeader='Score' />
						<DisplayProperty PropertyKey='LscReviewAssignmentCategory.LscReviewCategory.Description' ColumnHeader='Criteria' />
						<DisplayProperty PropertyKey='Weighting' ColumnHeader='Weighting (%)'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='HighScores' DataObjectDefinitionKey='LscPpqvReviewScoreByCategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='Score' Operator='GreaterThanEqual' Value='4'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlHighScores'
						Type='cDataListCtl'
						Container='spnHighScores'
						SeparatorWidth='2'
						DataObjectDefinitionKey='LscPpqvReviewScoreByCategory'>
						<DisplayProperty PropertyKey='Score' ColumnHeader='Score' />
						<DisplayProperty PropertyKey='LscReviewAssignmentCategory.LscReviewCategory.Description' ColumnHeader='Criteria' />
						<DisplayProperty PropertyKey='Weighting' ColumnHeader='Weighting (%)'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Caption='Continue'
						GoToNextPage='True'
						Save='False'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

