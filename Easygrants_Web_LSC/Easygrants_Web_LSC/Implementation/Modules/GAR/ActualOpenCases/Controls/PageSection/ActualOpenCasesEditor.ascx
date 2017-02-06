<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='600'>
	<tr>
		<td colspan='3' class='SeparatorHdg'>
			Detail
		</td>
	</tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td width='200' class='MinorSeparatorHdg'>&nbsp;</td>
		<td class='MinorSeparatorHdg'>Cases Remaining Open at Year-End</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Consumer/Finance</td>
		<td>
			<span runat='server' id='spnConFin' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Education</td>
		<td>
			<span runat='server' id='spnEducation' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Employment</td>
		<td>
			<span runat='server' id='spnEmployment' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Family</td>
		<td>
			<span runat='server' id='spnFamily' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Juvenile</td>
		<td>
			<span runat='server' id='spnJuvenile' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Health</td>
		<td>
			<span runat='server' id='spnHealth' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Housing</td>
		<td>
			<span runat='server' id='spnHousing' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Income Maintenance</td>
		<td>
			<span runat='server' id='spnIncome' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Individual Rights</td>
		<td>
			<span runat='server' id='spnIndividual' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Miscellaneous</td>
		<td>
			<span runat='server' id='spnMisc' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><b>Total</b></td>
		<td>
			<b><span runat='server' id='spnTotal' /></b>
		</td>
	</tr>
	
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscOpenCase' DataObjectDefinitionKey='LscOpenCase' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ConFin'>
					<Control ID='txtConFin'
						Type='cTextBox'
						Container='spnConFin'
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
					<Control ID='txtEducation'
						Type='cTextBox'
						Container='spnEducation'
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
					<Control ID='txtEmployment'
						Type='cTextBox'
						Container='spnEmployment'
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
					<Control ID='txtFamily'
						Type='cTextBox'
						Container='spnFamily'
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
					<Control ID='txtJuvenile'
						Type='cTextBox'
						Container='spnJuvenile'
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
					<Control ID='txtHealth'
						Type='cTextBox'
						Container='spnHealth'
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
					<Control ID='txtHousing'
						Type='cTextBox'
						Container='spnHousing'
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
					<Control ID='txtIncome'
						Type='cTextBox'
						Container='spnIncome'
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
					<Control ID='txtIndividual'
						Type='cTextBox'
						Container='spnIndividual'
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
					<Control ID='txtMisc'
						Type='cTextBox'
						Container='spnMisc'
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
					<Control ID='spnTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
	</ModuleSection>
</span>
