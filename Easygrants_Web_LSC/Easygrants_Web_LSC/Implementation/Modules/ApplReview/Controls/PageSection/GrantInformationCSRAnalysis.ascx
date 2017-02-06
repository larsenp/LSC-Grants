<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
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
			<b>Poverty Population</b> <span runat='server' id='spnPovertyPopulation' /><span runat='server' id='spnPovertyPopulationMW' />
		</td>
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
				<DisplayProperty PropertyKey='WfProject.WfCompetition.LscServiceArea.AdjPoorPopul' Format='#,0' >
					<Control ID='ctlPovPopBF' Container='spnPovertyPopulation' Type='cLabel'  >
					   <Visible>
						    <Argument PropertyKey='ServiceAreaTypeID' Value='1'>
						       <RelatedProperty PropertyKey='WfProject.WfCompetition.LscServiceArea' />
						    </Argument>
					    </Visible>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.LscServiceArea.MigrPoorPopul' Format='#,0' >
					<Control ID='ctlPovPopMW' Container='spnPovertyPopulationMW' Type='cLabel'  >
					   <Visible>
						    <Argument PropertyKey='ServiceAreaTypeID' Value='2'>
						       <RelatedProperty PropertyKey='WfProject.WfCompetition.LscServiceArea' />
						    </Argument>
					    </Visible>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		

		
	</ModuleSection>
</span>
