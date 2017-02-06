<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<b>Competition Year</b>: <span runat='server' id='spnCompetitionYear' /><br />
<b>Performance Area</b>: <span runat='server' id='spnPerformanceArea' /><br />
<b>Criterion</b>: <span runat='server' id='spnCriterion' /><br /><br />
<div width='100%' class='SeparatorHdg'>
	Inquiry
</div>
<br />
<span runat='server' id='spnNumber' />. <span runat='server' id='spnQuestion' /><br />
<span runat='server' id='spnSubtopics' />
<br />
<div width='100%' class='SeparatorHdg'>
	Strong Elements
</div>
<span runat='server' id='spnStrongElements' />
<div width='100%' class='SeparatorHdg'>
	Weak Elements
</div>
<span runat='server' id='spnWeakElements' />
<div width='100%' class='SeparatorHdg'>
	Sufficient Elements
</div>
<span runat='server' id='spnSufficientElements' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewInquiry' DataObjectDefinitionKey='LscReviewInquiry' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='InquiryID' PropertyKey='LscReviewInquiryID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscReviewCriterion.LscReviewCategory.LscReviewPerformanceArea.TimePeriod.Abbr'>
					<Control ID='spnCompetitionYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewCriterion.LscReviewCategory.LscReviewPerformanceArea.SortOrder'>
					<Control ID='spnPerformanceArea'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewCriterion.Abbr'>
					<Control ID='spnCriterion'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='spnNumber'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='spnQuestion'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscReviewSubtopic' DataObjectDefinitionKey='LscReviewSubtopic' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='InquiryID' PropertyKey='LscReviewInquiryID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='Abbr' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='lstSubtopics'
						Type='cDataListCtl'
						Container='spnSubtopics'
						DataObjectDefinitionKey='LscReviewSubtopic'
						ShowColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='Abbr'/>
						<DisplayProperty PropertyKey='Description' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='StrongElements' DataObjectDefinitionKey='LscReviewInquiryElement' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='InquiryID' PropertyKey='LscReviewInquiryID' />
				<Argument PropertyKey='LscReviewElementTypeID' Value='1' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlStrongElements'
						Type='cDataListCtl'
						Container='spnStrongElements'
						DataObjectDefinitionKey='LscReviewElement'>
						<DisplayProperty PropertyKey='SortOrder' ColumnHeader='Number' />
						<DisplayProperty PropertyKey='SubtopicAlpha'  ColumnHeader='Alpha'/>
						<DisplayProperty PropertyKey='Description' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WeakElements' DataObjectDefinitionKey='LscReviewInquiryElement' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='InquiryID' PropertyKey='LscReviewInquiryID' />
				<Argument PropertyKey='LscReviewElementTypeID' Value='2' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlWeakElements'
						Type='cDataListCtl'
						Container='spnWeakElements'
						DataObjectDefinitionKey='LscReviewElement'>
						<DisplayProperty PropertyKey='SortOrder' ColumnHeader='Number' />
						<DisplayProperty PropertyKey='SubtopicAlpha'  ColumnHeader='Alpha'/>
						<DisplayProperty PropertyKey='Description' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='SufficientElements' DataObjectDefinitionKey='LscReviewInquiryElement' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='InquiryID' PropertyKey='LscReviewInquiryID' />
				<Argument PropertyKey='LscReviewElementTypeID' Value='3' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlSufficientElements'
						Type='cDataListCtl'
						Container='spnSufficientElements'
						DataObjectDefinitionKey='LscReviewElement'>
						<DisplayProperty PropertyKey='SortOrder' ColumnHeader='Number' />
						<DisplayProperty PropertyKey='SubtopicAlpha'  ColumnHeader='Alpha'/>
						<DisplayProperty PropertyKey='Description' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
