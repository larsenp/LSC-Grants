<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	
<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true'
	              AutoVDateType='Last' Key='Form_E1a' runat='server'/></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form M: Miscellaneous Other Services</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormVI' 
	Src='Implementation/Modules/GAR/OtherServices/Controls/PageSection/FormVI_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlFormVIF' 
	Src='Implementation/Modules/GAR/Controls/PageSection/InstructionsFooter.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<br />
<table width='600' cellspacing='0' cellpadding='2'>
	<tr>
		<td class='SeparatorHdg' colspan='6'>
			Miscellaneous - Mediation/ADR &amp; Direct Service Form M-6(a)</td>
	</tr>
	<tr><td height="26">&nbsp;</td></tr>
	<tr>
	  <td colspan="6"><strong>Note:</strong> If you have any other Matters that do not fit into any of the categories in Sections I-VI, please report on them in your Narrative under VI, Other, but do not attempt to report on them in these forms. If you have Other Services that could be reported in more than one of these sections, please use whatever section best describes them, even if the fit is not perfect.</td>
  </tr>
	<tr>
	  <td>&nbsp;</td>
	  <td class='MinorSeparatorHdg'>&nbsp;</td>
	  <td class='MinorSeparatorHdg' align="center">&nbsp;</td>
	  <td class='MinorSeparatorHdg' align="center">&nbsp;</td>
	  <td class='MinorSeparatorHdg' align="center" colspan='2'>&nbsp;</td>
  </tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td class='MinorSeparatorHdg'>
			Models Used
		</td>
		<td class='MinorSeparatorHdg' align="center">
			Measured
		</td>
		<td class='MinorSeparatorHdg' align="center">
			Estimated
		</td>
		<td class='MinorSeparatorHdg' align="center" colspan='2'>
			Totals
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Number of People Directly Receiving Service</b>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Mediation/Alternative Dispute Resolution Services Not Included in Case Service Statistics
		</td>
		<td>
			<span runat='server' id='spnVIA1a' />
		</td>
		<td>
			<span runat='server' id='spnVIA1b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnVIA1Total' />
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Direct Services Not Included in Case Service Statistics
		</td>
		<td>
			<span runat='server' id='spnVIA2a' />
		</td>
		<td>
			<span runat='server' id='spnVIA2b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnVIA2Total' />
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Total</b>
		</td>
		<td>
			<b><span runat='server' id='spnVIAaTotal' /></b>
		</td>
		<td>
			<b><span runat='server' id='spnVIAbTotal' /></b>
		</td>
		<td align='right'>
			<b><span runat='server' id='spnVIATotal' /></b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg' colspan='6'>
			Miscellaneous - Mediation/ADR &amp; Direct Service Form M-6(b)</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td class='MinorSeparatorHdg'>
			Subject Matter Categories
		</td>
		<td class='MinorSeparatorHdg'>
			Number of People Directly Receiving Service
		</td>	</tr>
	
	<tr>
		<td>&nbsp;</td>
		<td>
			Consumer/Finance
		</td>
		<td>
			<span runat='server' id='spnVIB1' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Education
		</td>
		<td>
			<span runat='server' id='spnVIB2' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Employment
		</td>
		<td>
			<span runat='server' id='spnVIB3' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Family
		</td>
		<td>
			<span runat='server' id='spnVIB4' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Juvenile
		</td>
		<td>
			<span runat='server' id='spnVIB5' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Health
		</td>
		<td>
			<span runat='server' id='spnVIB6' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Housing
		</td>
		<td>
			<span runat='server' id='spnVIB7' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Income Maintenance
		</td>
		<td>
			<span runat='server' id='spnVIB8' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Individual Rights
		</td>
		<td>
			<span runat='server' id='spnVIB9' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Other/Multiple Problems
		</td>
		<td>
			<span runat='server' id='spnVIB10' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Total</b>
		</td>
		<td>
			<b><span runat='server' id='spnVIBTotal' /></b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr >
		<td colspan='6' align='center'>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;
			<span runat='server' id='spnContinue' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>

		<DataObject Key='LscOtherServices' DataObjectDefinitionKey='LscOtherServices' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='VIA1a'>
					<Control ID='txtVIA1a'
						Type='cTextBox'
						Container='spnVIA1a'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VIA1b'>
					<Control ID='txtVIA1b'
						Type='cTextBox'
						Container='spnVIA1b'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.VIA1Total'>
					<Control ID='spnVIA1Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='VIA2a'>
					<Control ID='txtVIA2a'
						Type='cTextBox'
						Container='spnVIA2a'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VIA2b'>
					<Control ID='txtVIA2b'
						Type='cTextBox'
						Container='spnVIA2b'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.VIA2Total'>
					<Control ID='spnVIA2Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.VIAaTotal'>
					<Control ID='spnVIAaTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.VIAbTotal'>
					<Control ID='spnVIAbTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.VIATotal'>
					<Control ID='spnVIATotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='VIB1'>
					<Control ID='txtVIB1'
						Type='cTextBox'
						Container='spnVIB1'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VIB2'>
					<Control ID='txtVIB2'
						Type='cTextBox'
						Container='spnVIB2'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VIB3'>
					<Control ID='txtVIB3'
						Type='cTextBox'
						Container='spnVIB3'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VIB4'>
					<Control ID='txtVIB4'
						Type='cTextBox'
						Container='spnVIB4'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VIB5'>
					<Control ID='txtVIB5'
						Type='cTextBox'
						Container='spnVIB5'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VIB6'>
					<Control ID='txtVIB6'
						Type='cTextBox'
						Container='spnVIB6'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VIB7'>
					<Control ID='txtVIB7'
						Type='cTextBox'
						Container='spnVIB7'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VIB8'>
					<Control ID='txtVIB8'
						Type='cTextBox'
						Container='spnVIB8'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VIB9'>
					<Control ID='txtVIB9'
						Type='cTextBox'
						Container='spnVIB9'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VIB10'>
					<Control ID='txtVIB10'
						Type='cTextBox'
						Container='spnVIB10'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.VIBTotal'>
					<Control ID='spnVIBTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save and Calculate'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
