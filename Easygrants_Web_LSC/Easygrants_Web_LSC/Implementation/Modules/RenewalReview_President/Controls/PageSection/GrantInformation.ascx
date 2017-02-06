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
		<td>
			<b>Poverty Population</b> <span runat='server' id='spnPovPopBF' /> <span runat='server' id='spnPovPopMW' /> 
		</td>
		<%--<td><span runat='server' id='spnPovPopNA'> N/A </span></td>--%>
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
				<DisplayProperty PropertyKey='WfProject.WfCompetition.LscServiceArea.AdjPoorPopul' Format='#,0' >
					<Control ID='ctlPovPopBF' Container='spnPovPopBF' Type='cLabel'  >
					   <Visible>
						    <Argument PropertyKey='ServiceAreaTypeID' Value='1'>
						       <RelatedProperty PropertyKey='WfProject.WfCompetition.LscServiceArea' />
						    </Argument>
					    </Visible>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.LscServiceArea.MigrPoorPopul' Format='#,0'>
					<Control ID='ctlPovPopMW' Container='spnPovPopMW' Type='cLabel' >
					   <Visible>
						    <Argument PropertyKey='ServiceAreaTypeID' Value='2'>
						       <RelatedProperty PropertyKey='WfProject.WfCompetition.LscServiceArea' />
						    </Argument>
					    </Visible>
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='' >
					<Control ID='ctlPovPopNA' Container='spnPovPopNA' Type='cLabel'  >
					   <Visible>
						    <Argument PropertyKey='ServiceAreaTypeID' Value='3'>
						       <RelatedProperty PropertyKey='WfProject.WfCompetition.LscServiceArea' />
						    </Argument>
					    </Visible>
					</Control>
				</DisplayProperty>--%>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
