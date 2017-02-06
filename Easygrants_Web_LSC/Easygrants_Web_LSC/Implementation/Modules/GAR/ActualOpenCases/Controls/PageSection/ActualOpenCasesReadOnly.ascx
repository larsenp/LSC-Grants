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
					<Control ID='spnConFin'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Education'>
					<Control ID='spnEducation'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Employment'>
					<Control ID='spnEmployment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Family'>
					<Control ID='spnFamily'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Juvenile'>
					<Control ID='spnJuvenile'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Health'>
					<Control ID='spnHealth'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Housing'>
					<Control ID='spnHousing'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Income'>
					<Control ID='spnIncome'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Individual'>
					<Control ID='spnIndividual'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Misc'>
					<Control ID='spnMisc'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOpenCaseTotal.Total'>
					<Control ID='spnTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
	</ModuleSection>
</span>
