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
    <td><h1>Form M: Other Services</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormI' 
	Src='Implementation/Modules/GAR/OtherServices/Controls/PageSection/FormM_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlFormIF' 
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
			Form M Part I – Community Legal Education (CLE)
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td class='MinorSeparatorHdg'>
			Models Used
		</td>
		<td class='MinorSeparatorHdg' align="center">
			(a)<br>
		  Measured
		</td>
		<td class='MinorSeparatorHdg' align="center">(b)
			<br>
		  Estimated
		</td>
		<td class='MinorSeparatorHdg' align="center" colspan='2'>(c)
			<br>
		  Totals
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total number of people in audiences during presentations to groups in the community
		</td>
		<td>
			<span runat='server' id='spnIA1a' />
		</td>
		<td>
			<span runat='server' id='spnIA1b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIA1Total' />
		</td>
		<td>&nbsp;</td>
	</tr>
	<%--<tr>
		<td>&nbsp;</td>
		<td>
			Total copies of legal education brochures and other materials distributed
		</td>
		<td>
			<span runat='server' id='spnIA2a' />
		</td>
		<td>
			<span runat='server' id='spnIA2b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIA2Total' />
		</td>
		<td>&nbsp;</td>
	</tr>--%>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total number of unique visitors to websites (e.g., total number of computers accessing website(s) for any purpose, including but not limited to community legal education)
		</td>
		<td>
			<span runat='server' id='spnIA3aUniqueVisitors' />
		</td>
		<td>
			<span runat='server' id='spnIA3bUniqueVisitors' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIA3UniqueVisitorsTotal' />
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total number of legal education materials posted on website(s) that were downloaded
		</td>
		<td>
			<span runat='server' id='spnIA4aDownloads' />
		</td>
		<td>
			<span runat='server' id='spnIA4bDownloads' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIA4DownloadsTotal' />
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Total</b>
		</td>
		<td>
			<b><span runat='server' id='spnIAaTotal' /></b>
		</td>
		<td>
			<b><span runat='server' id='spnIAbTotal' /></b>
		</td>
		<td>
			<b><span runat='server' id='spnIATotal' /></b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg' colspan='6'>
			Form M Part II – Pro Se Assistance (Pro Se)
		</td>
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
			Total number of participants in workshops or clinics
		</td>
		<td>
			<span runat='server' id='spnIIA1a' />
		</td>
		<td>
			<span runat='server' id='spnIIA1b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA1Total' />
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total number of people assisted at help desks at courts (e.g., court-based self-help centers and court-based clinics)
		</td>
		<td>
			<span runat='server' id='spnIIA2a' />
		</td>
		<td>
			<span runat='server' id='spnIIA2b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA2Total' />
		</td>
		<td>&nbsp;</td>
	</tr>
	<%--<tr>
		<td>&nbsp;</td>
		<td>
			Total copies distributed of self-help printed materials (e.g., Living Wills and other forms)
		</td>
		<td>
			<span runat='server' id='spnIIA3a' />
		</td>
		<td>
			<span runat='server' id='spnIIA3b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA3Total' />
		</td>
		<td>&nbsp;</td>
	</tr>--%>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total number of self-help/pro se materials posted on web sites (e.g., Living Wills and other forms) that were downloaded
		</td>
		<td>
			<span runat='server' id='spnIIA4aDownloads' />
		</td>
		<td>
			<span runat='server' id='spnIIA4bDownloads' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA4DownloadsTotal' />
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Other-describe in Narrative section (e.g., any other service provided, including but not limited to pro se assistance)
		</td>
		<td>
			<span runat='server' id='spnIIA6a' />
		</td>
		<td>
			<span runat='server' id='spnIIA6b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA6Total' />
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Total</b>
		</td>
		<td>
			<b><span runat='server' id='spnIIAaTotal' /></b>
		</td>
		<td>
			<b><span runat='server' id='spnIIAbTotal' /></b>
		</td>
		<td align='right'>
			<b><span runat='server' id='spnIIATotal' /></b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg' colspan='6'>
			Form M Part III – Referral 
		</td>
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
				<DisplayProperty PropertyKey='IA1a'>
					<Control ID='txtIA1a'
						Type='cTextBox'
						Container='spnIA1a'
						MaxLength='7'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry on Form M-1 must be a number between 0 and 1,000,000.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IA1b'>
					<Control ID='txtIA1b'
						Type='cTextBox'
						Container='spnIA1b'
						MaxLength='7'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry on Form M-1 must be number between 0 and 1,000,000.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IA1Total' Format='#,0'>
					<Control ID='spnIA1Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='IA2a'>
					<Control ID='txtIA2a'
						Type='cTextBox'
						Container='spnIA2a'
						MaxLength='7'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry on Form M-1 must be number between 0 and 1,000,000.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IA2b'>
					<Control ID='txtIA2b'
						Type='cTextBox'
						Container='spnIA2b'
						MaxLength='7'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry on Form M-1 must be number between 0 and 1,000,000.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IA2Total' Format='#,0'>
					<Control ID='spnIA2Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='IA3aUniqueVisitors'>
					<Control ID='txtIA3aUniqueVisitors'
						Type='cTextBox'
						Container='spnIA3aUniqueVisitors'
						MaxLength='7'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='1899999'
							ErrorMessage='Each entry on Form M-1 must be number between 0 and 1,900,000.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IA3bUniqueVisitors'>
					<Control ID='txtIA3bUniqueVisitors'
						Type='cTextBox'
						Container='spnIA3bUniqueVisitors'
						MaxLength='7'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry on Form M-1 must be number between 0 and 1,000,000.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IA3UniqueVisitorsTotal' Format='#,0'>
					<Control ID='spnIA3UniqueVisitorsTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IA4aDownloads'>
					<Control ID='txtIA4aDownloads'
						Type='cTextBox'
						Container='spnIA4aDownloads'
						MaxLength='7'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='1300000'
							ErrorMessage='Each entry on Form M-1 must be number between 0 and 1,300,000.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IA4bDownloads'>
					<Control ID='txtIA4bDownloads'
						Type='cTextBox'
						Container='spnIA4bDownloads'
						MaxLength='7'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry on Form M-1 must be number between 0 and 1,000,000.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IA4DownloadsTotal' Format='#,0'>
					<Control ID='spnIA4DownloadsTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IAaTotal' Format='#,0'>
					<Control ID='spnIAaTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IAbTotal' Format='#,0'>
					<Control ID='spnIAbTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IATotal' Format='#,0'>
					<Control ID='spnIATotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>

				<DisplayProperty PropertyKey='IIA1a'>
					<Control ID='txtIIA1a'
						Type='cTextBox'
						Container='spnIIA1a'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA1b'>
					<Control ID='txtIIA1b'
						Type='cTextBox'
						Container='spnIIA1b'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIA1Total' Format='#,0'>
					<Control ID='spnIIA1Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA2a'>
					<Control ID='txtIIA2a'
						Type='cTextBox'
						Container='spnIIA2a'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA2b'>
					<Control ID='txtIIA2b'
						Type='cTextBox'
						Container='spnIIA2b'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIA2Total' Format='#,0'>
					<Control ID='spnIIA2Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='IIA3a'>
					<Control ID='txtIIA3a'
						Type='cTextBox'
						Container='spnIIA3a'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA3b'>
					<Control ID='txtIIA3b'
						Type='cTextBox'
						Container='spnIIA3b'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIA3Total' Format='#,0'>
					<Control ID='spnIIA3Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='IIA4aDownloads'>
					<Control ID='txtIIA4aDownloads'
						Type='cTextBox'
						Container='spnIIA4aDownloads'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA4bDownloads'>
					<Control ID='txtIIA4bDownloads'
						Type='cTextBox'
						Container='spnIIA4bDownloads'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIA4DownloadsTotal' Format='#,0'>
					<Control ID='spnIIA4DownloadsTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA6a'>
					<Control ID='txtIIA6a'
						Type='cTextBox'
						Container='spnIIA6a'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA6b'>
					<Control ID='txtIIA6b'
						Type='cTextBox'
						Container='spnIIA6b'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Each entry in the grid must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIA6Total' Format='#,0'>
					<Control ID='spnIIA6Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIAaTotal' Format='#,0'>
					<Control ID='spnIIAaTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIAbTotal' Format='#,0'>
					<Control ID='spnIIAbTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIATotal' Format='#,0'>
					<Control ID='spnIIATotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>

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
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIA1Total' Format='#,0'>
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
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIA2Total' Format='#,0'>
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
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIA3Total' Format='#,0'>
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
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIA4Total' Format='#,0'>
					<Control ID='spnIIIA4Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIAaTotal' Format='#,0'>
					<Control ID='spnIIIAaTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIAbTotal' Format='#,0'>
					<Control ID='spnIIIAbTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIATotal' Format='#,0'>
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
