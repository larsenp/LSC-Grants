<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ApplReview.Controls.PageSection.cEvaluation" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='100%'>
	<tr>
		<td style="width:30px;text-align:center;vertical-align:top">
			<span runat='server' id='spnChk' />
		</td>
		<td style="width:30px;text-align:center;vertical-align:top">
			<span runat='server' id='spnElementNum' />
		</td>
		<td style="width:30px;text-align:center;vertical-align:top">
			<span runat='server' id='spnAlpha' />
		</td>
		<td style="vertical-align:top">
			<span runat='server' id='spnElement' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='WeakElements' Key='WeakElements' DataObjectDefinitionKey='LscReviewInquiryElement' Updatable='False' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='spnElementNum' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubtopicAlpha'>
					<Control ID='spnAlpha' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description' HtmlEncode='False'>
					<Control ID='spnElement' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WeakElement' DataObjectDefinitionKey='LscReviewAssignmentElement' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='WeakElements' DataObjectPropertyKey='LscReviewElementID' PropertyKey='LscReviewElementID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
				<Argument Type='DataObjectCollection' TypeKey='WeakElements' DataObjectPropertyKey='LscReviewElementID' PropertyKey='LscReviewElementID' Create='True' Update='False' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Checked'>
					<Control ID='chkChecked'
						Type='cCheckBox'
						Container='spnChk' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
