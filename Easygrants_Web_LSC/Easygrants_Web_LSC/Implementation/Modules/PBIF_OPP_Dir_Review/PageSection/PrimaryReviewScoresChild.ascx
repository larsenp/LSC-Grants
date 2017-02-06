<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div class="MinorSeparatorHdg">
	<span runat='server' id='spnLscProBonoCategory'/>
</div>
<span runat='server' id='spnLscProBonoPrimaryScoreBySubcategory'/>
<table style="width:100%">
	<tr>
		<td style="width:25%">
			<b><span runat='server' id='spnLscProBonoCategory2'/> Total</b>
		</td>
		<td style="width:15%">
			<b><span runat='server' id='spnWeighting'/></b>
		</td>
		<td style="width:15%">
			<b><span runat='server' id='spnRawScore'/></b>
		</td>
		<td style="width:15%">
			<b><span runat='server' id='spnWeightedScore'/></b>
		</td>
		<td style="width:30%">&nbsp;</td>
	</tr>
</table>
<hr style='width:100%'/>
<br />
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscProBonoPrimaryScoreByCategory' Key='LscProBonoPrimaryScoreByCategory' Updatable='False' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscProBonoCategory.Description'>
					<Control ID='spnLscProBonoCategory'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProBonoCategory.Description'>
					<Control ID='spnLscProBonoCategory2'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProBonoCategory.Weighting'>
					<Control ID='spnWeighting'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WeightedScore' Format='0.0'>
					<Control ID='spnWeightedScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RawScore'>
					<Control ID='spnRawScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
			<DataObject Key='LscProBonoPrimaryScoreBySubcategory' DataObjectDefinitionKey='LscProBonoPrimaryScoreBySubcategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscProBonoPrimaryScoreByCategory' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
				<Argument Type='DataObjectCollection' TypeKey='LscProBonoPrimaryScoreByCategory' DataObjectPropertyKey='LscProBonoCategoryID' PropertyKey='LscProBonoCategoryID'>
					<RelatedProperty PropertyKey='LscProBonoSubcategory'/>
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey="SortOrder">
					<RelatedProperty PropertyKey='LscProBonoSubcategory'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='lstLscProBonoPrimaryScoreBySubcategory'
						Type='cDataListCtl'
						Container='spnLscProBonoPrimaryScoreBySubcategory'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='LscProBonoSubcategory.Abbr' ColumnHeader=' ' Width='25%'/>
						<DisplayProperty PropertyKey='LscProBonoSubcategory.Weighting' ColumnHeader='Weighting (%)' Width='15%' />
						<DisplayProperty PropertyKey='RawScore' ColumnHeader='Possible Scores 0, 1, 2, 3 (lowest to highest)' Width='15%'/>
						<DisplayProperty PropertyKey='WeightedScore' ColumnHeader='Weighted percentage' Format='0.0' Width='15%'/>
						<%--<DisplayProperty PropertyKey='Comment' Width='30%'/>--%>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
