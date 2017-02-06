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
    <td><h1>Form M: Referred Other Services</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormIII' 
	Src='Implementation/Modules/GAR/OtherServices/Controls/PageSection/FormIII_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlFormIIIF' 
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
			Referred Other Services Form M-3(a)</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
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
			Total number of people referred to other provider of civil legal services to low income people
		</td>
		<td>
			<span runat='server' id='spnIIIA1a' />
		</td>
		<td>
			<span runat='server' id='spnIIIA1b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIIA1Total' />
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total number of people referred to private bar (LRS or individual private lawyers not affiliated with program)
		</td>
		<td>
			<span runat='server' id='spnIIIA2a' />
		</td>
		<td>
			<span runat='server' id='spnIIIA2b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIIA2Total' />
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total number of people referred to provider of human or social services (non-legal)
		</td>
		<td>
			<span runat='server' id='spnIIIA3a' />
		</td>
		<td>
			<span runat='server' id='spnIIIA3b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIIA3Total' />
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total number of people referred to other source of assistance, None of the above ----<br />
			<span class="FieldLabel">If more than 10 percent of total, please describe in Narrative and provide more detailed breakdown.</span>
		</td>
		<td>
			<span runat='server' id='spnIIIA4a' />
		</td>
		<td>
			<span runat='server' id='spnIIIA4b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIIA4Total' />
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Total</b>
		</td>
		<td>
			<b><span runat='server' id='spnIIIAaTotal' /></b>
		</td>
		<td>
			<b><span runat='server' id='spnIIIAbTotal' /></b>
		</td>
		<td align='right'>
			<b><span runat='server' id='spnIIIATotal' /></b>
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
				<DisplayProperty PropertyKey='IIIA1a'>
					<Control ID='txtIIIA1a'
						Type='cTextBox'
						Container='spnIIIA1a'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIIA1b'>
					<Control ID='txtIIIA1b'
						Type='cTextBox'
						Container='spnIIIA1b'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIA1Total'>
					<Control ID='spnIIIA1Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIIA2a'>
					<Control ID='txtIIIA2a'
						Type='cTextBox'
						Container='spnIIIA2a'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIIA2b'>
					<Control ID='txtIIIA2b'
						Type='cTextBox'
						Container='spnIIIA2b'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIA2Total'>
					<Control ID='spnIIIA2Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIIA3a'>
					<Control ID='txtIIIA3a'
						Type='cTextBox'
						Container='spnIIIA3a'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIIA3b'>
					<Control ID='txtIIIA3b'
						Type='cTextBox'
						Container='spnIIIA3b'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIA3Total'>
					<Control ID='spnIIIA3Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIIA4a'>
					<Control ID='txtIIIA4a'
						Type='cTextBox'
						Container='spnIIIA4a'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIIA4b'>
					<Control ID='txtIIIA4b'
						Type='cTextBox'
						Container='spnIIIA4b'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIA4Total'>
					<Control ID='spnIIIA4Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIAaTotal'>
					<Control ID='spnIIIAaTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIAbTotal'>
					<Control ID='spnIIIAbTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIATotal'>
					<Control ID='spnIIIATotal'
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
