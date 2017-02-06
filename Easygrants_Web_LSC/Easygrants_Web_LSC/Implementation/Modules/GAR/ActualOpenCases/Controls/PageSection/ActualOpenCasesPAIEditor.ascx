<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='600' style='text-align:center; vertical-align:bottom'>
	<tr>
		<td colspan='5' class='SeparatorHdg' style='text-align:left'>
			Detail
		</td>
	</tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td width='150' class='MinorSeparatorHdg'>&nbsp;</td>
		<td class='MinorSeparatorHdg' colspan='3'>Cases Remaining Open at Year-End</td>
	</tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td width='200' class='MinorSeparatorHdg'>&nbsp;</td>
		<td class='MinorSeparatorHdg'>Private Attorneys</td>
		<td class='MinorSeparatorHdg'>Law Students/Law Graduates</td>
		<td class='MinorSeparatorHdg'>Paralegals/Other Licensed Professionals</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style='text-align:left'>Consumer/Finance</td>
		<td>
			<span runat='server' id='spnConFinPA' />
		</td>
		<td>
			<span runat='server' id='spnConFinLS' />
		</td>
		<td>
			<span runat='server' id='spnConFinPL' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style='text-align:left'>Education</td>
		<td>
			<span runat='server' id='spnEducationPA' />
		</td>
		<td>
			<span runat='server' id='spnEducationLS' />
		</td>
		<td>
			<span runat='server' id='spnEducationPL' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style='text-align:left'>Employment</td>
		<td>
			<span runat='server' id='spnEmploymentPA' />
		</td>
		<td>
			<span runat='server' id='spnEmploymentLS' />
		</td>
		<td>
			<span runat='server' id='spnEmploymentPL' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style='text-align:left'>Family</td>
		<td>
			<span runat='server' id='spnFamilyPA' />
		</td>
		<td>
			<span runat='server' id='spnFamilyLS' />
		</td>
		<td>
			<span runat='server' id='spnFamilyPL' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style='text-align:left'>Juvenile</td>
		<td>
			<span runat='server' id='spnJuvenilePA' />
		</td>
		<td>
			<span runat='server' id='spnJuvenileLS' />
		</td>
		<td>
			<span runat='server' id='spnJuvenilePL' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style='text-align:left'>Health</td>
		<td>
			<span runat='server' id='spnHealthPA' />
		</td>
		<td>
			<span runat='server' id='spnHealthLS' />
		</td>
		<td>
			<span runat='server' id='spnHealthPL' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style='text-align:left'>Housing</td>
		<td>
			<span runat='server' id='spnHousingPA' />
		</td>
		<td>
			<span runat='server' id='spnHousingLS' />
		</td>
		<td>
			<span runat='server' id='spnHousingPL' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style='text-align:left'>Income Maintenance</td>
		<td>
			<span runat='server' id='spnIncomePA' />
		</td>
		<td>
			<span runat='server' id='spnIncomeLS' />
		</td>
		<td>
			<span runat='server' id='spnIncomePL' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style='text-align:left'>Individual Rights</td>
		<td>
			<span runat='server' id='spnIndividualPA' />
		</td>
		<td>
			<span runat='server' id='spnIndividualLS' />
		</td>
		<td>
			<span runat='server' id='spnIndividualPL' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style='text-align:left'>Miscellaneous</td>
		<td>
			<span runat='server' id='spnMiscPA' />
		</td>
		<td>
			<span runat='server' id='spnMiscLS' />
		</td>
		<td>
			<span runat='server' id='spnMiscPL' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style='text-align:left'><b>Total</b></td>
		<td>
			<b><span runat='server' id='spnTotalPA' /></b>
		</td>
		<td>
			<b><span runat='server' id='spnTotalLS' /></b>
		</td>
		<td>
			<b><span runat='server' id='spnTotalPL' /></b>
		</td>
	</tr>
	
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscOpenCasePA' DataObjectDefinitionKey='LscOpenCase' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='LscPaiCaseHandlerTypeID' Value='1'/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='LscPaiCaseHandlerTypeID' Value='1'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ConFin'>
					<Control ID='txtConFinPA'
						Type='cTextBox'
						Container='spnConFinPA'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Consumer Finance must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Education'>
					<Control ID='txtEducationPA'
						Type='cTextBox'
						Container='spnEducationPA'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Education must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Employment'>
					<Control ID='txtEmploymentPA'
						Type='cTextBox'
						Container='spnEmploymentPA'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Employment must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Family'>
					<Control ID='txtFamilyPA'
						Type='cTextBox'
						Container='spnFamilyPA'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Family must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Juvenile'>
					<Control ID='txtJuvenilePA'
						Type='cTextBox'
						Container='spnJuvenilePA'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Juvenile must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Health'>
					<Control ID='txtHealthPA'
						Type='cTextBox'
						Container='spnHealthPA'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Health must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Housing'>
					<Control ID='txtHousingPA'
						Type='cTextBox'
						Container='spnHousingPA'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Housing must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Income'>
					<Control ID='txtIncomePA'
						Type='cTextBox'
						Container='spnIncomePA'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Income Maintenance must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Individual'>
					<Control ID='txtIndividualPA'
						Type='cTextBox'
						Container='spnIndividualPA'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Individual Rights must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Misc'>
					<Control ID='txtMiscPA'
						Type='cTextBox'
						Container='spnMiscPA'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Miscellaneous must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOpenCaseTotal.Total'>
					<Control ID='spnTotalPA'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
		<DataObject Key='LscOpenCaseLS' DataObjectDefinitionKey='LscOpenCase' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='LscPaiCaseHandlerTypeID' Value='2'/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='LscPaiCaseHandlerTypeID' Value='2'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ConFin'>
					<Control ID='txtConFinLS'
						Type='cTextBox'
						Container='spnConFinLS'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Consumer Finance must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Education'>
					<Control ID='txtEducationLS'
						Type='cTextBox'
						Container='spnEducationLS'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Education must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Employment'>
					<Control ID='txtEmploymentLS'
						Type='cTextBox'
						Container='spnEmploymentLS'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Employment must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Family'>
					<Control ID='txtFamilyLS'
						Type='cTextBox'
						Container='spnFamilyLS'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Family must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Juvenile'>
					<Control ID='txtJuvenileLS'
						Type='cTextBox'
						Container='spnJuvenileLS'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Juvenile must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Health'>
					<Control ID='txtHealthLS'
						Type='cTextBox'
						Container='spnHealthLS'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Health must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Housing'>
					<Control ID='txtHousingLS'
						Type='cTextBox'
						Container='spnHousingLS'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Housing must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Income'>
					<Control ID='txtIncomeLS'
						Type='cTextBox'
						Container='spnIncomeLS'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Income Maintenance must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Individual'>
					<Control ID='txtIndividualLS'
						Type='cTextBox'
						Container='spnIndividualLS'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Individual Rights must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Misc'>
					<Control ID='txtMiscLS'
						Type='cTextBox'
						Container='spnMiscLS'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Miscellaneous must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOpenCaseTotal.Total'>
					<Control ID='spnTotalLS'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
		<DataObject Key='LscOpenCasePL' DataObjectDefinitionKey='LscOpenCase' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='LscPaiCaseHandlerTypeID' Value='3'/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='LscPaiCaseHandlerTypeID' Value='3'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ConFin'>
					<Control ID='txtConFinPL'
						Type='cTextBox'
						Container='spnConFinPL'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Consumer Finance must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Education'>
					<Control ID='txtEducationPL'
						Type='cTextBox'
						Container='spnEducationPL'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Education must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Employment'>
					<Control ID='txtEmploymentPL'
						Type='cTextBox'
						Container='spnEmploymentPL'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Employment must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Family'>
					<Control ID='txtFamilyPL'
						Type='cTextBox'
						Container='spnFamilyPL'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Family must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Juvenile'>
					<Control ID='txtJuvenilePL'
						Type='cTextBox'
						Container='spnJuvenilePL'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Juvenile must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Health'>
					<Control ID='txtHealthPL'
						Type='cTextBox'
						Container='spnHealthPL'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Health must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Housing'>
					<Control ID='txtHousingPL'
						Type='cTextBox'
						Container='spnHousingPL'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Housing must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Income'>
					<Control ID='txtIncomePL'
						Type='cTextBox'
						Container='spnIncomePL'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Income Maintenance must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Individual'>
					<Control ID='txtIndividualPL'
						Type='cTextBox'
						Container='spnIndividualPL'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Individual Rights must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Misc'>
					<Control ID='txtMiscPL'
						Type='cTextBox'
						Container='spnMiscPL'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Miscellaneous must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOpenCaseTotal.Total'>
					<Control ID='spnTotalPL'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
	</ModuleSection>
</span>
