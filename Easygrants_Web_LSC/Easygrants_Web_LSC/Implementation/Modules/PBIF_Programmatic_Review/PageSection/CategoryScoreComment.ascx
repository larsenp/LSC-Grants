<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.PBIF_Programmatic_Review.PageSection.cSubcategoryStatement" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table style="width:100%">
	<tr>
		<td colspan='2' class='MinorSeparatorHdg'>
			<span runat='server' id='spnAbbr'/> Score
		</td>
	</tr>
	<tr>
		<td style="width:50%;text-align:center">
			<strong>Possible scores (lowest to highest)</strong>
		</td>
		<td style="width:50%;text-align:center">
			<strong>Your Score</strong>
		</td>
	</tr>
	<tr>
		<td style="text-align:center">
			0, 1, 2, 3
		</td>
		<td style="text-align:center">
			<span runat='server' id='spnLscProBonoReviewScoreLkpID'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<strong><span runat='server' id='spnAbbr2'/> Comments</strong>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnComment'/>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="ModuleUser" TypeKey="GranteeProjectID" PropertyKey="GranteeProjectID"/>
			</Filters>
		</DataObject>

		<DataObject Key='LscProBonoCategory' DataObjectDefinitionKey='LscProBonoCategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="DataObjectCollection" TypeKey="GranteeProject" DataObjectPropertyKey='WfProject.TimePeriodID' PropertyKey="TimePeriodID"/>
				<Argument Type="DataPresenter" TypeKey="CategoryNum" PropertyKey="SortOrder"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='spnAbbr'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='spnAbbr2'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscProBonoReviewScore' DataObjectDefinitionKey='LscProBonoReviewScore' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type="ModuleUser" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
				<Argument Type="DataObjectCollection" TypeKey="LscProBonoCategory" DataObjectPropertyKey='LscProBonoCategoryID' PropertyKey="LscProBonoCategoryID"/>
			</Filters>
			<DefaultValues>
				<Argument Type="ModuleUser" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
				<Argument Type="DataObjectCollection" TypeKey="LscProBonoCategory" DataObjectPropertyKey='LscProBonoCategoryID' PropertyKey="LscProBonoCategoryID"/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscProBonoReviewScoreLkpID'>
					<Control ID='ctlLscProBonoReviewScoreLkpID'
						Type='cDropDown'
						Container='spnLscProBonoReviewScoreLkpID'
						DataObjectDefinitionKey='LscProBonoReviewScoreLkp'
						StoredValue='LscProBonoReviewScoreLkpID'
						DisplayText='Select'
						DisplayValue='ScoreSelection'> 
						<Filters>
							<Argument Type="DataObjectCollection" TypeKey="GranteeProject" DataObjectPropertyKey='WfProject.TimePeriodID' PropertyKey="TimePeriodID"/>
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtComment'
						Type='cTextArea'
						Container='spnComment'
						Rows='10'
						Cols='80'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
