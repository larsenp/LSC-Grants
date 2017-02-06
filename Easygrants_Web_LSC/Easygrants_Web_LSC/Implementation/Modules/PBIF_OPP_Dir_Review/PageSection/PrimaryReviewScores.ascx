<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<b>Primary Reviewer:</b> <span runat='server' id='spnPrimaryReviewer'/>
<br />
<span runat='server' id='spnPrimaryReviewScores'/>
<table style="width:100%">
	<tr>
		<td colspan='5' class="MinorSeparatorHdg">
			Primary Review Total Score and Overall Comment
		</td>
	</tr>
	<tr>
		<td style="width:25%">&nbsp;</td>
		<td style="width:15%">&nbsp;</td>
		<td style="width:15%">
			<b>Total Raw Score</b>
		</td>
		<td style="width:15%">
			<b>Weighted Score</b>
		</td>
		<td style="width:30%">
			<b>Overall Comment</b>
		</td>
	</tr>
	<tr>
		<td colspan='2'>&nbsp;</td>
		<td>
			<b><span runat='server' id='spnRawScore'/></b>
		</td>
		<td>
			<b><span runat='server' id='spnWeightedScore'/></b>
		</td>
		<td>
			<span runat='server' id='spnOverallComment'/>
		</td>
	</tr>
</table>
<br />
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='PrimaryReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="ModuleUser" TypeKey="GranteeProjectID" PropertyKey="GranteeProjectID"/>
				<Argument PropertyKey='WfTaskID' Value='106'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Person.FirstNameLastName'>
					<Control ID='spnPrimaryReviewer'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscProBonoPrimaryScoreByCategory' DataObjectDefinitionKey='LscProBonoPrimaryScoreByCategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="DataObjectCollection" TypeKey="PrimaryReviewWfTA" DataObjectPropertyKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<Sort>
				<Argument PropertyKey="SortOrder">
					<RelatedProperty PropertyKey='LscProBonoCategory'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPrimaryReviewScores'
						Type='cDataPresenterList'
						Container='spnPrimaryReviewScores'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/PBIF_OPP_Dir_Review/PageSection/PrimaryReviewScoresChild.ascx' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscProBonoPrimaryScoreByReviewAssignment' DataObjectDefinitionKey='LscProBonoPrimaryScoreByReviewAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="DataObjectCollection" TypeKey="PrimaryReviewWfTA" DataObjectPropertyKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
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
				<Argument Type="DataObjectCollection" TypeKey="PrimaryReviewWfTA" DataObjectPropertyKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
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
