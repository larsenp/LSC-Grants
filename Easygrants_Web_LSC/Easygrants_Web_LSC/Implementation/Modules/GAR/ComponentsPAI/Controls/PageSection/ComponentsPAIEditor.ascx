<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='1000' cellpadding = '2' cellspacing = '0'>
	<tr>
		<td colspan='10' class='SeparatorHdg'>
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
		<td class='MinorSeparatorHdg'>Law Graduates or Law Students Who Accepted Case(s)</td>
		<td class='MinorSeparatorHdg'>Law Graduates or Law Students Agreeing to Take Cases</td>
		<td class='MinorSeparatorHdg'>Paralegals or Other Licensed Professionals Who Accepted Case(s)</td>
		<td class='MinorSeparatorHdg'>Paralegals or Other Licensed Professionals Agreeing to Take Cases</td>
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
		<td>
			<span runat='server' id='spnProBonoLSAR' />
		</td>
		<td>
			<span runat='server' id='spnProBonoLSAP' />
		</td>
		<td>
			<span runat='server' id='spnProBonoPLAR' />
		</td>
		<td>
			<span runat='server' id='spnProBonoPLAP' />
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
		<td>
			<span runat='server' id='spnProBonoSubgrantLSAR' />
		</td>
		<td>
			<span runat='server' id='spnProBonoSubgrantLSAP' />
		</td>
		<td>
			<span runat='server' id='spnProBonoSubgrantPLAR' />
		</td>
		<td>
			<span runat='server' id='spnProBonoSubgrantPLAP' />
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
		<td>
			<span runat='server' id='spnCoCounselPBLSAR' />
		</td>
		<td>
			<span runat='server' id='spnCoCounselPBLSAP' />
		</td>
		<td>
			<span runat='server' id='spnCoCounselPBPLAR' />
		</td>
		<td>
			<span runat='server' id='spnCoCounselPBPLAP' />
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
		<td>
			<span runat='server' id='spnOtherPBLSAR' />
		</td>
		<td>
			<span runat='server' id='spnOtherPBLSAP' />
		</td>
		<td>
			<span runat='server' id='spnOtherPBPLAR' />
		</td>
		<td>
			<span runat='server' id='spnOtherPBPLAP' />
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
		<td>
			<span runat='server' id='spnAllProBonoLSAR' />
		</td>
		<td>
			<span runat='server' id='spnAllProBonoLSAP' />
		</td>
		<td>
			<span runat='server' id='spnAllProBonoPLAR' />
		</td>
		<td>
			<span runat='server' id='spnAllProBonoPLAP' />
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
		<td>
			<span runat='server' id='spnJudicareLSAR' />
		</td>
		<td>
			<span runat='server' id='spnJudicareLSAP' />
		</td>
		<td>
			<span runat='server' id='spnJudicarePLAR' />
		</td>
		<td>
			<span runat='server' id='spnJudicarePLAP' />
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
		<td>
			<span runat='server' id='spnContractVolLSAR' />
		</td>
		<td>
			<span runat='server' id='spnContractVolLSAP' />
		</td>
		<td>
			<span runat='server' id='spnContractVolPLAR' />
		</td>
		<td>
			<span runat='server' id='spnContractVolPLAP' />
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
		<td>
			<span runat='server' id='spnContractIndvLSAR' />
		</td>
		<td>
			<span runat='server' id='spnContractIndvLSAP' />
		</td>
		<td>
			<span runat='server' id='spnContractIndvPLAR' />
		</td>
		<td>
			<span runat='server' id='spnContractIndvPLAP' />
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
		<td>
			<span runat='server' id='spnCoCounselCompLSAR' />
		</td>
		<td>
			<span runat='server' id='spnCoCounselCompLSAP' />
		</td>
		<td>
			<span runat='server' id='spnCoCounselCompPLAR' />
		</td>
		<td>
			<span runat='server' id='spnCoCounselCompPLAP' />
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
		<td>
			<span runat='server' id='spnOtherCompLSAR' />
		</td>
		<td>
			<span runat='server' id='spnOtherCompLSAP' />
		</td>
		<td>
			<span runat='server' id='spnOtherCompPLAR' />
		</td>
		<td>
			<span runat='server' id='spnOtherCompPLAP' />
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
		<td>
			<span runat='server' id='spnCompensatedLSAR' />
		</td>
		<td>
			<span runat='server' id='spnCompensatedLSAP' />
		</td>
		<td>
			<span runat='server' id='spnCompensatedPLAR' />
		</td>
		<td>
			<span runat='server' id='spnCompensatedPLAP' />
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
		<td>
			<span runat='server' id='spnLSARTotal' />
		</td>
		<td>
			<span runat='server' id='spnLSAPTotal' />
		</td>
		<td>
			<span runat='server' id='spnPLARTotal' />
		</td>
		<td>
			<span runat='server' id='spnPLAPTotal' />
		</td>
	</tr>
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
					<Control ID='txtProBonoCR'
						Type='cTextBox'
						Container='spnProBonoCR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoCC'>
					<Control ID='txtProBonoCC'
						Type='cTextBox'
						Container='spnProBonoCC'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoAAR'>
					<Control ID='txtProBonoAAR'
						Type='cTextBox'
						Container='spnProBonoAAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoAAP'>
					<Control ID='txtProBonoAAP'
						Type='cTextBox'
						Container='spnProBonoAAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoLSAR'>
					<Control ID='txtProBonoLSAR'
						Type='cTextBox'
						Container='spnProBonoLSAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoLSAP'>
					<Control ID='txtProBonoLSAP'
						Type='cTextBox'
						Container='spnProBonoLSAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoPLAR'>
					<Control ID='txtProBonoPLAR'
						Type='cTextBox'
						Container='spnProBonoPLAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoPLAP'>
					<Control ID='txtProBonoPLAP'
						Type='cTextBox'
						Container='spnProBonoPLAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoSubgrantCR'>
					<Control ID='txtProBonoSubgrantCR'
						Type='cTextBox'
						Container='spnProBonoSubgrantCR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoSubgrantCC'>
					<Control ID='txtProBonoSubgrantCC'
						Type='cTextBox'
						Container='spnProBonoSubgrantCC'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoSubgrantAAR'>
					<Control ID='txtProBonoSubgrantAAR'
						Type='cTextBox'
						Container='spnProBonoSubgrantAAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoSubgrantAAP'>
					<Control ID='txtProBonoSubgrantAAP'
						Type='cTextBox'
						Container='spnProBonoSubgrantAAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoSubgrantLSAR'>
					<Control ID='txtProBonoSubgrantLSAR'
						Type='cTextBox'
						Container='spnProBonoSubgrantLSAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoSubgrantLSAP'>
					<Control ID='txtProBonoSubgrantLSAP'
						Type='cTextBox'
						Container='spnProBonoSubgrantLSAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoSubgrantPLAR'>
					<Control ID='txtProBonoSubgrantPLAR'
						Type='cTextBox'
						Container='spnProBonoSubgrantPLAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProBonoSubgrantPLAP'>
					<Control ID='txtProBonoSubgrantPLAP'
						Type='cTextBox'
						Container='spnProBonoSubgrantPLAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='JudicareCR'>
					<Control ID='txtJudicareCR'
						Type='cTextBox'
						Container='spnJudicareCR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='JudicareCC'>
					<Control ID='txtJudicareCC'
						Type='cTextBox'
						Container='spnJudicareCC'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='JudicareAAR'>
					<Control ID='txtJudicareAAR'
						Type='cTextBox'
						Container='spnJudicareAAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='JudicareAAP'>
					<Control ID='txtJudicareAAP'
						Type='cTextBox'
						Container='spnJudicareAAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='JudicareLSAR'>
					<Control ID='txtJudicareLSAR'
						Type='cTextBox'
						Container='spnJudicareLSAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='JudicareLSAP'>
					<Control ID='txtJudicareLSAP'
						Type='cTextBox'
						Container='spnJudicareLSAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='JudicarePLAR'>
					<Control ID='txtJudicarePLAR'
						Type='cTextBox'
						Container='spnJudicarePLAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='JudicarePLAP'>
					<Control ID='txtJudicarePLAP'
						Type='cTextBox'
						Container='spnJudicarePLAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractVolCR'>
					<Control ID='txtContractVolCR'
						Type='cTextBox'
						Container='spnContractVolCR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractVolCC'>
					<Control ID='txtContractVolCC'
						Type='cTextBox'
						Container='spnContractVolCC'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractVolAAR'>
					<Control ID='txtContractVolAAR'
						Type='cTextBox'
						Container='spnContractVolAAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractVolAAP'>
					<Control ID='txtContractVolAAP'
						Type='cTextBox'
						Container='spnContractVolAAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractVolLSAR'>
					<Control ID='txtContractVolLSAR'
						Type='cTextBox'
						Container='spnContractVolLSAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractVolLSAP'>
					<Control ID='txtContractVolLSAP'
						Type='cTextBox'
						Container='spnContractVolLSAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractVolPLAR'>
					<Control ID='txtContractVolPLAR'
						Type='cTextBox'
						Container='spnContractVolPLAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractVolPLAP'>
					<Control ID='txtContractVolPLAP'
						Type='cTextBox'
						Container='spnContractVolPLAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='ContractIndvCR'>
					<Control ID='txtContractIndvCR'
						Type='cTextBox'
						Container='spnContractIndvCR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractIndvCC'>
					<Control ID='txtContractIndvCC'
						Type='cTextBox'
						Container='spnContractIndvCC'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractIndvAAR'>
					<Control ID='txtContractIndvAAR'
						Type='cTextBox'
						Container='spnContractIndvAAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractIndvAAP'>
					<Control ID='txtContractIndvAAP'
						Type='cTextBox'
						Container='spnContractIndvAAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractIndvLSAR'>
					<Control ID='txtContractIndvLSAR'
						Type='cTextBox'
						Container='spnContractIndvLSAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractIndvLSAP'>
					<Control ID='txtContractIndvLSAP'
						Type='cTextBox'
						Container='spnContractIndvLSAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractIndvPLAR'>
					<Control ID='txtContractIndvPLAR'
						Type='cTextBox'
						Container='spnContractIndvPLAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractIndvPLAP'>
					<Control ID='txtContractIndvPLAP'
						Type='cTextBox'
						Container='spnContractIndvPLAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='CoCounselPBCR'>
					<Control ID='txtCoCounselPBCR'
						Type='cTextBox'
						Container='spnCoCounselPBCR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselPBCC'>
					<Control ID='txtCoCounselPBCC'
						Type='cTextBox'
						Container='spnCoCounselPBCC'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselPBAAR'>
					<Control ID='txtCoCounselPBAAR'
						Type='cTextBox'
						Container='spnCoCounselPBAAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselPBAAP'>
					<Control ID='txtCoCounselPBAAP'
						Type='cTextBox'
						Container='spnCoCounselPBAAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselPBLSAR'>
					<Control ID='txtCoCounselPBLSAR'
						Type='cTextBox'
						Container='spnCoCounselPBLSAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselPBLSAP'>
					<Control ID='txtCoCounselPBLSAP'
						Type='cTextBox'
						Container='spnCoCounselPBLSAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselPBPLAR'>
					<Control ID='txtCoCounselPBPLAR'
						Type='cTextBox'
						Container='spnCoCounselPBPLAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselPBPLAP'>
					<Control ID='txtCoCounselPBPLAP'
						Type='cTextBox'
						Container='spnCoCounselPBPLAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='CoCounselCompCR'>
					<Control ID='txtCoCounselCompCR'
						Type='cTextBox'
						Container='spnCoCounselCompCR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselCompCC'>
					<Control ID='txtCoCounselCompCC'
						Type='cTextBox'
						Container='spnCoCounselCompCC'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselCompAAR'>
					<Control ID='txtCoCounselCompAAR'
						Type='cTextBox'
						Container='spnCoCounselCompAAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselCompAAP'>
					<Control ID='txtCoCounselCompAAP'
						Type='cTextBox'
						Container='spnCoCounselCompAAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselCompLSAR'>
					<Control ID='txtCoCounselCompLSAR'
						Type='cTextBox'
						Container='spnCoCounselCompLSAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselCompLSAP'>
					<Control ID='txtCoCounselCompLSAP'
						Type='cTextBox'
						Container='spnCoCounselCompLSAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselCompPLAR'>
					<Control ID='txtCoCounselCompPLAR'
						Type='cTextBox'
						Container='spnCoCounselCompPLAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CoCounselCompPLAP'>
					<Control ID='txtCoCounselCompPLAP'
						Type='cTextBox'
						Container='spnCoCounselCompPLAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='OtherPBCR'>
					<Control ID='txtOtherPBCR'
						Type='cTextBox'
						Container='spnOtherPBCR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherPBCC'>
					<Control ID='txtOtherPBCC'
						Type='cTextBox'
						Container='spnOtherPBCC'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherPBAAR'>
					<Control ID='txtOtherPBAAR'
						Type='cTextBox'
						Container='spnOtherPBAAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherPBAAP'>
					<Control ID='txtOtherPBAAP'
						Type='cTextBox'
						Container='spnOtherPBAAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherPBLSAR'>
					<Control ID='txtOtherPBLSAR'
						Type='cTextBox'
						Container='spnOtherPBLSAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherPBLSAP'>
					<Control ID='txtOtherPBLSAP'
						Type='cTextBox'
						Container='spnOtherPBLSAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherPBPLAR'>
					<Control ID='txtOtherPBPLAR'
						Type='cTextBox'
						Container='spnOtherPBPLAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherPBPLAP'>
					<Control ID='txtOtherPBPLAP'
						Type='cTextBox'
						Container='spnOtherPBPLAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='OtherCompCR'>
					<Control ID='txtOtherCompCR'
						Type='cTextBox'
						Container='spnOtherCompCR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherCompCC'>
					<Control ID='txtOtherCompCC'
						Type='cTextBox'
						Container='spnOtherCompCC'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherCompAAR'>
					<Control ID='txtOtherCompAAR'
						Type='cTextBox'
						Container='spnOtherCompAAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherCompAAP'>
					<Control ID='txtOtherCompAAP'
						Type='cTextBox'
						Container='spnOtherCompAAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='OtherCompLSAR'>
					<Control ID='txtOtherCompLSAR'
						Type='cTextBox'
						Container='spnOtherCompLSAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherCompLSAP'>
					<Control ID='txtOtherCompLSAP'
						Type='cTextBox'
						Container='spnOtherCompLSAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherCompPLAR'>
					<Control ID='txtOtherCompPLAR'
						Type='cTextBox'
						Container='spnOtherCompPLAR'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherCompPLAP'>
					<Control ID='txtOtherCompPLAP'
						Type='cTextBox'
						Container='spnOtherCompPLAP'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='LscPaiCaseTotal.AllProBonoCR'>
					<Control ID='spnAllProBonoCR'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.AllProBonoCC'>
					<Control ID='spnAllProBonoCC'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.AllProBonoAAR'>
					<Control ID='spnAllProBonoAAR'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.AllProBonoAAP'>
					<Control ID='spnAllProBonoAAP'
						Type='HtmlGenericControl' />
				</DisplayProperty>

				<DisplayProperty PropertyKey='LscPaiCaseTotal.AllProBonoLSAR'>
					<Control ID='spnAllProBonoLSAR'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.AllProBonoLSAP'>
					<Control ID='spnAllProBonoLSAP'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.AllProBonoPLAR'>
					<Control ID='spnAllProBonoPLAR'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.AllProBonoPLAP'>
					<Control ID='spnAllProBonoPLAP'
						Type='HtmlGenericControl' />
				</DisplayProperty>

				<DisplayProperty PropertyKey='LscPaiCaseTotal.CompensatedCR'>
					<Control ID='spnCompensatedCR'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.CompensatedCC'>
					<Control ID='spnCompensatedCC'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.CompensatedAAR'>
					<Control ID='spnCompensatedAAR'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.CompensatedAAP'>
					<Control ID='spnCompensatedAAP'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='LscPaiCaseTotal.CompensatedLSAR'>
					<Control ID='spnCompensatedLSAR'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.CompensatedLSAP'>
					<Control ID='spnCompensatedLSAP'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.CompensatedPLAR'>
					<Control ID='spnCompensatedPLAR'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.CompensatedPLAP'>
					<Control ID='spnCompensatedPLAP'
						Type='HtmlGenericControl' />
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

				<DisplayProperty PropertyKey='LscPaiCaseTotal.LSARTotal'>
					<Control ID='spnLSARTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.LSAPTotal'>
					<Control ID='spnLSAPTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.PLARTotal'>
					<Control ID='spnPLARTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPaiCaseTotal.PLAPTotal'>
					<Control ID='spnPLAPTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>

			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
