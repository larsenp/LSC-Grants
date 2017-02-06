<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='600' cellpadding = '2' cellspacing = '0'>
	<tr>
		<td colspan='7' class='SeparatorHdg'>
			Detail
		</td>
	</tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td width='200' class='MinorSeparatorHdg'>&nbsp;</td>
		<td class='MinorSeparatorHdg'>Cases Referred</td>
		<td class='MinorSeparatorHdg'>Cases Closed</td>
		<td class='MinorSeparatorHdg'>Attorneys Who Accepted Case(s)</td>
		<td class='MinorSeparatorHdg'>Attorneys Agreeing to Take Cases</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Pro Bono (in House)
		</td>
		<td>
			<span runat='server' id='spnProBonoCR' />
		</td>
		<td>
			<span runat='server' id='spnProBonoCC' />
		</td>
		<td>
			<span runat='server' id='spnProBonoAAR' />
		</td>
		<td>
			<span runat='server' id='spnProBonoAAP' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Pro Bono (Sub-Grant)
		</td>
		<td>
			<span runat='server' id='spnProBonoSubgrantCR' />
		</td>
		<td>
			<span runat='server' id='spnProBonoSubgrantCC' />
		</td>
		<td>
			<span runat='server' id='spnProBonoSubgrantAAR' />
		</td>
		<td>
			<span runat='server' id='spnProBonoSubgrantAAP' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Co-Counsel (Pro Bono)
		</td>
		<td>
			<span runat='server' id='spnCoCounselPBCR' />
		</td>
		<td>
			<span runat='server' id='spnCoCounselPBCC' />
		</td>
		<td>
			<span runat='server' id='spnCoCounselPBAAR' />
		</td>
		<td>
			<span runat='server' id='spnCoCounselPBAAP' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Other (Pro Bono)
		</td>
		<td>
			<span runat='server' id='spnOtherPBCR' />
		</td>
		<td>
			<span runat='server' id='spnOtherPBCC' />
		</td>
		<td>
			<span runat='server' id='spnOtherPBAAR' />
		</td>
		<td>
			<span runat='server' id='spnOtherPBAAP' />
		</td>
	</tr>
	<tr style="font-weight: bold">
		<td>&nbsp;</td>
		<td>
			Total Pro Bono
		</td>
		<td>
			<span runat='server' id='spnAllProBonoCR' />
		</td>
		<td>
			<span runat='server' id='spnAllProBonoCC' />
		</td>
		<td>
			<span runat='server' id='spnAllProBonoAAR' />
		</td>
		<td>
			<span runat='server' id='spnAllProBonoAAP' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Judicare/Reduced Fee Panel
		</td>
		<td>
			<span runat='server' id='spnJudicareCR' />
		</td>
		<td>
			<span runat='server' id='spnJudicareCC' />
		</td>
		<td>
			<span runat='server' id='spnJudicareAAR' />
		</td>
		<td>
			<span runat='server' id='spnJudicareAAP' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Contract (Volume Case Services)
		</td>
		<td>
			<span runat='server' id='spnContractVolCR' />
		</td>
		<td>
			<span runat='server' id='spnContractVolCC' />
		</td>
		<td>
			<span runat='server' id='spnContractVolAAR' />
		</td>
		<td>
			<span runat='server' id='spnContractVolAAP' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Contract (Individual Cases)
		</td>
		<td>
			<span runat='server' id='spnContractIndvCR' />
		</td>
		<td>
			<span runat='server' id='spnContractIndvCC' />
		</td>
		<td>
			<span runat='server' id='spnContractIndvAAR' />
		</td>
		<td>
			<span runat='server' id='spnContractIndvAAP' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Co-Counsel (Compensated)
		</td>
		<td>
			<span runat='server' id='spnCoCounselCompCR' />
		</td>
		<td>
			<span runat='server' id='spnCoCounselCompCC' />
		</td>
		<td>
			<span runat='server' id='spnCoCounselCompAAR' />
		</td>
		<td>
			<span runat='server' id='spnCoCounselCompAAP' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Other (Compensated)
		</td>
		<td>
			<span runat='server' id='spnOtherCompCR' />
		</td>
		<td>
			<span runat='server' id='spnOtherCompCC' />
		</td>
		<td>
			<span runat='server' id='spnOtherCompAAR' />
		</td>
		<td>
			<span runat='server' id='spnOtherCompAAP' />
		</td>
	</tr>
	<tr style="font-weight: bold">
		<td>&nbsp;</td>
		<td>
			Total Compensated
		</td>
		<td>
			<span runat='server' id='spnCompensatedCR' />
		</td>
		<td>
			<span runat='server' id='spnCompensatedCC' />
		</td>
		<td>
			<span runat='server' id='spnCompensatedAAR' />
		</td>
		<td>
			<span runat='server' id='spnCompensatedAAP' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr style="font-weight: bold">
		<td>&nbsp;</td>
		<td>
			Totals
		</td>
		<td>
			<span runat='server' id='spnCRTotal' />
		</td>
		<td>
			<span runat='server' id='spnCCTotal' />
		</td>
		<td>
			<span runat='server' id='spnAARTotal' />
		</td>
		<td>
			<span runat='server' id='spnAAPTotal' />
		</td>
	</tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscPaiCase' DataObjectDefinitionKey='LscPaiCase' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProBonoCR'>
					<Control ID='spnProBonoCR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoCC'>
					<Control ID='spnProBonoCC'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoAAR'>
					<Control ID='spnProBonoAAR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoAAP'>
					<Control ID='spnProBonoAAP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoSubgrantCR'>
					<Control ID='spnProBonoSubgrantCR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoSubgrantCC'>
					<Control ID='spnProBonoSubgrantCC'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoSubgrantAAR'>
					<Control ID='spnProBonoSubgrantAAR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoSubgrantAAP'>
					<Control ID='spnProBonoSubgrantAAP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselPBCR'>
					<Control ID='spnCoCounselPBCR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselPBCC'>
					<Control ID='spnCoCounselPBCC'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselPBAAR'>
					<Control ID='spnCoCounselPBAAR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselPBAAP'>
					<Control ID='spnCoCounselPBAAP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherPBCR'>
					<Control ID='spnOtherPBCR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherPBCC'>
					<Control ID='spnOtherPBCC'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherPBAAR'>
					<Control ID='spnOtherPBAAR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherPBAAP'>
					<Control ID='spnOtherPBAAP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.AllProBonoCR'>
					<Control ID='spnAllProBonoCR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.AllProBonoCC'>
					<Control ID='spnAllProBonoCC'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.AllProBonoAAR'>
					<Control ID='spnAllProBonoAAR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.AllProBonoAAP'>
					<Control ID='spnAllProBonoAAP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='JudicareCR'>
					<Control ID='spnJudicareCR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='JudicareCC'>
					<Control ID='spnJudicareCC'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='JudicareAAR'>
					<Control ID='spnJudicareAAR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='JudicareAAP'>
					<Control ID='spnJudicareAAP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractVolCR'>
					<Control ID='spnContractVolCR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractVolCC'>
					<Control ID='spnContractVolCC'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractVolAAR'>
					<Control ID='spnContractVolAAR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractVolAAP'>
					<Control ID='spnContractVolAAP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractIndvCR'>
					<Control ID='spnContractIndvCR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractIndvCC'>
					<Control ID='spnContractIndvCC'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractIndvAAR'>
					<Control ID='spnContractIndvAAR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractIndvAAP'>
					<Control ID='spnContractIndvAAP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselCompCR'>
					<Control ID='spnCoCounselCompCR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselCompCC'>
					<Control ID='spnCoCounselCompCC'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselCompAAR'>
					<Control ID='spnCoCounselCompAAR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselCompAAP'>
					<Control ID='spnCoCounselCompAAP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherCompCR'>
					<Control ID='spnOtherCompCR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherCompCC'>
					<Control ID='spnOtherCompCC'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherCompAAR'>
					<Control ID='spnOtherCompAAR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherCompAAP'>
					<Control ID='spnOtherCompAAP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.CompensatedCR'>
					<Control ID='spnCompensatedCR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.CompensatedCC'>
					<Control ID='spnCompensatedCC'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.CompensatedAAR'>
					<Control ID='spnCompensatedAAR'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.CompensatedAAP'>
					<Control ID='spnCompensatedAAP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.CRTotal'>
					<Control ID='spnCRTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.CCTotal'>
					<Control ID='spnCCTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.AARTotal'>
					<Control ID='spnAARTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.AAPTotal'>
					<Control ID='spnAAPTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
