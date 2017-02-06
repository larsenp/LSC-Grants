<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ApplReview.Controls.PageSection.cEvaluation" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<div width='100%' class='SeparatorHdg'>
	<b>Performance Area <span runat='server' id='spnPA' /></b><br />
	Criterion <span runat='server' id='spnCID' />: <span runat='server' id='spnCDesc' /> (<span runat='server' id='spnCWeight' />%)<br />
</div>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
		<td valign='top'>
			<span runat='server' id='spnQID' />&nbsp;
		</td>
		<td valign='top'>
			<span runat='server' id='spnQDesc' />
			<span runat='server' id='spnSubtopics' />
		</td>
		<td align='right' valign='top'>
			<b><span runat='server' id='spnScore' /></b>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br />
<div width='100%' class='SeparatorHdg'>
	Strong Elements
</div>
<br />
<span runat='server' id='spnStrongElements' />

<div width='100%' class='SeparatorHdg'>
	Weak Elements
</div>
<br />
<span runat='server' id='spnWeakElements' />

<div width='100%' class='SeparatorHdg'>
	Comments
</div>
<br />
<span runat='server' id='spnComment' />
<br />
<hr style="height:5px;width:100%;color:#888888"/>
<br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		<DataObject Key='LscReviewInquiry' DataObjectDefinitionKey='LscReviewInquiry' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCriterion.LscReviewPerformanceArea' />
				</Argument>
				<Argument Type='DataPresenter' TypeKey='PA' PropertyKey='SortOrder'>
					<RelatedProperty PropertyKey='LscReviewCriterion.LscReviewPerformanceArea' />
				</Argument>
				<Argument Type='DataPresenter' TypeKey='C' PropertyKey='Abbr'>
					<RelatedProperty PropertyKey='LscReviewCriterion' />
				</Argument>
				<Argument Type='DataPresenter' TypeKey='Q' PropertyKey='Abbr'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscReviewCriterion.LscReviewPerformanceArea.SortOrder' >
					<Control ID='spnPA'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewCriterion.Abbr' >
					<Control ID='spnCID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewCriterion.Description' >
					<Control ID='spnCDesc'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewCriterion.Weighting' >
					<Control ID='spnCWeight'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Abbr' >
					<Control ID='spnQID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description' HtmlEncode='False'>
					<Control ID='spnQDesc'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewSubtopic' DataObjectDefinitionKey='LscReviewSubtopic' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='Abbr' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlSubtopics'
						Type='cDataListCtl'
						Container='spnSubtopics'
						DataObjectDefinitionKey='LscReviewSubtopic'
						ShowColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='Abbr' />
						<DisplayProperty PropertyKey='Description' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewAssignmentInquiry' DataObjectDefinitionKey='LscReviewAssignmentInquiry' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscReviewInquiryScore.Value'>
					<Control ID='spnScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewAssignmentInquiryHtml.Comment'>
					<Control ID='spnComment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='StrongElements' DataObjectDefinitionKey='LscReviewInquiryElement' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
				<Argument PropertyKey='LscReviewElementTypeID' Value='1' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlStrongElements'
						Container='spnStrongElements' 
						Type='cDataPresenterList' 
						DataPresenterID='DPLStrong' 
						DataPresenterURL='Implementation/Modules/ApplReview/Controls/PageSection/StrongElementGridItem.ascx' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WeakElements' DataObjectDefinitionKey='LscReviewInquiryElement' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
				<Argument PropertyKey='LscReviewElementTypeID' Value='2' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlWeakElements'
						Container='spnWeakElements' 
						Type='cDataPresenterList' 
						DataPresenterID='DPLWeak' 
						DataPresenterURL='Implementation/Modules/ApplReview/Controls/PageSection/WeakElementGridItem.ascx' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
