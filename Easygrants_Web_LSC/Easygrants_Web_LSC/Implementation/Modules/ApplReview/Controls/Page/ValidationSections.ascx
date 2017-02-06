<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ApplReview.Controls.Page.cValidationSections" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cTextArea' src='../../../../../Core/Controls/Base/TextArea.ascx' %>
Validation Sections control <br />
<span runat='server' id='spnValidation'/>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Inquiry' DataObjectDefinitionKey='LscReviewInquiry' Updatable='False' CreateNew='False'>
			<Sort>
				<Argument PropertyKey='SortOrder'>
					<RelatedProperty PropertyKey='LscReviewCriterion.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='Abbr'>
					<RelatedProperty PropertyKey='LscReviewCriterion' />
				</Argument>
				<Argument PropertyKey='Abbr'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtValidation'
						Type='cTextArea'
						Container='spnValidation'
						Rows='100'
						Cols='100' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
