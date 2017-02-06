<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ApplReview.Controls.PageSection.cEvaluation" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div width='100%' class='SeparatorHdg'>
	Grant Information
</div>

<table width='100%'>
	<tr>
		<td>
			<b>Grant Amount</b> <span runat='server' id='spnGrantAmount' />
		</td>
		<td>&nbsp;</td>
		<%--<td>
			<b>Poverty Population</b> <span runat='server' id='spnPovertyPopulation' />
		</td>--%>
	</tr>
</table>
<br />
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProject.Fund.FundAmount' Format='$#,0'>
					<Control ID='spnGrantAmount' Type='HtmlGenericControl' />
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='WfProject.WfCompetition.LscServiceArea.PoorPopul' Format='#,0'>
					<Control ID='spnPovertyPopulation' Type='HtmlGenericControl' />
				</DisplayProperty>--%>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
