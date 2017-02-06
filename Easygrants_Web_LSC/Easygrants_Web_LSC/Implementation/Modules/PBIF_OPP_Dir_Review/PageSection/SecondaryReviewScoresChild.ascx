<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<div class='MinorSeparatorHdg'>
	<span runat='server' id='spnSecondaryReviewer'/>
</div>
<span runat='server' id='spnLscProBonoSecondaryScoreByCategory'/>
<table style="width:100%">
	<tr>
		<td colspan="5" class="MinorSeparatorHdg">
			<span runat='server' id='spnSecondaryReviewer2'/> Total Score and Overall Comment
		</td>
	</tr>
	<tr>
		<td style="width:25%; border-bottom-width:3px; border-bottom-style:solid; border-bottom-color:#bbbbbb; vertical-align:top">
			&nbsp;
		</td>
		<td style="width:15%; border-bottom-width:3px; border-bottom-style:solid; border-bottom-color:#bbbbbb">
			
		</td>
		<td style="width:15%; border-bottom-width:3px; border-bottom-style:solid; border-bottom-color:#bbbbbb">
			<b><span runat='server' id='spnRawScore'/></b>
		</td>
		<td style="width:15%; border-bottom-width:3px; border-bottom-style:solid; border-bottom-color:#bbbbbb">&nbsp;
			<b><span runat='server' id='spnWeightedScore'/></b>
		</td>
		<td style="width:30%; border-bottom-width:3px; border-bottom-style:solid; border-bottom-color:#bbbbbb">
			<span runat='server' id='spnOverallComment'/>
		</td>
	</tr>
</table>
<hr style='width:100%'/>
<br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='SecondaryReviewWfTA' Key='SecondaryReviewWfTA' Updatable='False' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Person.FirstNameLastName'>
					<Control ID='spnSecondaryReviewer'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Person.FirstNameLastName'>
					<Control ID='spnSecondaryReviewer2'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscProBonoSecondaryScoreByCategory' DataObjectDefinitionKey='LscProBonoSecondaryScoreByCategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='SecondaryReviewWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey="SortOrder">
					<RelatedProperty PropertyKey='LscProBonoCategory'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='lstLscProBonoSecondaryScoreByCategory'
						Type='cDataListCtl'
						Container='spnLscProBonoSecondaryScoreByCategory'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='LscProBonoCategory.Abbr'
							ColumnHeader=' '
							Width='25%'/>
						<DisplayProperty PropertyKey='Weighting'
							ColumnHeader='Weighting (%)'
							Width='15%'/>
						<DisplayProperty PropertyKey='RawScore'
							ColumnHeader='Possible Scores 0, 1, 2, 3 (lowest to highest)'
							Width='15%'/>
						<DisplayProperty PropertyKey='WeightedScore' 
							ColumnHeader='Weighted percentage' 
							Format='0.0' 
							Width='15%'/>
						<%--<DisplayProperty PropertyKey='Comment'
							ColumnHeader='Comment'
							Width='30%'/>--%>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscProBonoSecondaryScoreByReviewAssignment' DataObjectDefinitionKey='LscProBonoSecondaryScoreByReviewAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='SecondaryReviewWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RawScore'>
					<Control ID='spnRawScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WeightedScore' Format='0.0'>
					<Control ID='spnWeightedScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscPbifProgReview' DataObjectDefinitionKey='LscPbifProgReview' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="DataObjectCollection" TypeKey="SecondaryReviewWfTA" DataObjectPropertyKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OverallComment'>
					<Control ID='spnOverallComment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
