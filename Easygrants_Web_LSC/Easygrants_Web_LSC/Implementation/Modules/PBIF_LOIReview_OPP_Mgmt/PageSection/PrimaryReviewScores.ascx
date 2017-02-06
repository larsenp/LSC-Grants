<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<div style='width:100%' class="MinorSeparatorHdg" id='spnReviewer' runat='server'/>
<span runat='server' id='spnScoreDetail'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='PrimaryReviewWfTA' Key='PrimaryReviewWfTA' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Person.LastNameFirstName'>
					<Control ID='spnReviewer'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscProBonoSecondaryScoreByCategory' DataObjectDefinitionKey='LscProBonoSecondaryScoreByCategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='PrimaryReviewWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<%--<Sort> 
				<Argument PropertyKey='MaxScore' Direction='Desc'/> 
			</Sort> --%>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlScoreDetail'
						Type='cDataListCtl'
						Container='spnScoreDetail'>
						<DisplayProperty PropertyKey='LscProBonoCategory.Description' ColumnHeader=' '/>
						<DisplayProperty PropertyKey='Weighting' ColumnHeader='Weighting (%)' DisplayTotal='Totals'/>
						<DisplayProperty PropertyKey='RawScore' ColumnHeader='Possible Scores (lowest to highest) 0,1,2,3' DisplayTotal='Totals'/>
						<DisplayProperty PropertyKey='WeightedScore' ColumnHeader='Weighted Percentage (%)' Format='#,0' DisplayTotal='Totals'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
