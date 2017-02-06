<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/PPQVApplicantInformation.ascx'
	runat='server'/>

<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>
	
<div width='100%' class='SeparatorHdg'>
	Summary
</div>
<span runat='server' id='spnCommentsSummary' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	    <DataObject Key='LscReviewAssignmentCategory' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea'/>
				</Argument>
				<Argument PropertyKey='SortOrder' >
					<RelatedProperty PropertyKey='LscReviewCategory'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlCommentsSummary'
						Type='cDataListCtl'
						Container='spnCommentsSummary'
						SeparatorWidth='2'
						DataObjectDefinitionKey='LscReviewAssignmentCategory'>
						<DisplayProperty PropertyKey='LscReviewCategory.Description' ColumnHeader='Criteria' Width='50%' >
							<Control ID='lblCriteria'
								Type='cLabel' />
						</DisplayProperty>
						<DisplayProperty PropertyKey='Comment' ColumnHeader='Comments' Width='50%'>
							<Control ID='lblComment'
								Type='cLabel' />
						</DisplayProperty>
	                </Control>
				</DisplayProperty>
			</DisplayProperties>
	   </DataObject>		
	
	
    </ModuleSection>
</span>