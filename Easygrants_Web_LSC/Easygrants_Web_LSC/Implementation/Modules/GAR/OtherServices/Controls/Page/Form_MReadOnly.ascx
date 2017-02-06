<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form M: Other Services Report</h1></td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<br />
<table width='600' cellspacing='0' cellpadding='5' >
	<tr>
		<td class='SeparatorHdg' colspan='5'>
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
		<td class='MinorSeparatorHdg' align="center">(c)
			<br>
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
			Total number of people in audiences during presentations to groups in the community
		</td>
		<td align='right'>
			<span runat='server' id='spnIA1a' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIA1b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIA1Total' />
		</td>
	</tr>
	<%--<tr>
		<td>&nbsp;</td>
		<td>
			Total copies of legal education brochures and other materials distributed
		</td>
		<td align='right'>
			<span runat='server' id='spnIA2a' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIA2b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIA2Total' />
		</td>
	</tr>--%>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total number of unique visitors to websites (e.g., total number of computers accessing website(s) for any purpose, including but not limited to community legal education)
		</td>
		<td align='right'>
			<span runat='server' id='spnIA3aUniqueVisitors' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIA3bUniqueVisitors' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIA3UniqueVisitorsTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total number of legal education materials posted on website(s) that were downloaded
		</td>
		<td align='right'>
			<span runat='server' id='spnIA4aDownloads' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIA4bDownloads' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIA4DownloadsTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Total</b>
		</td>
		<td align='right'>
			<b><span runat='server' id='spnIAaTotal' /></b>
		</td>
		<td align='right'>
			<b><span runat='server' id='spnIAbTotal' /></b>
		</td>
		<td align='right'>
			<b><span runat='server' id='spnIATotal' /></b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table width='600' cellspacing='0' cellpadding='5'>
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
		<td class='MinorSeparatorHdg' align="center" >
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
			Total number of participants in workshops or clinics
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA1a' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA1b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA1Total' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total number of people assisted at help desks at courts (e.g., court-based self-help centers and court-based clinics)
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA2a' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA2b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA2Total' />
		</td>
	</tr>
	<%--<tr>
		<td>&nbsp;</td>
		<td>
			Total copies distributed of self-help printed materials (e.g., Living Wills and other forms)
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA3a' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA3b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA3Total' />
		</td>
	</tr>--%>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total number of self-help/pro se materials posted on web sites (e.g., Living Wills and other forms) that were downloaded
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA4aDownloads' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA4bDownloads' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA4DownloadsTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Other-describe in Narrative section (e.g., any other service provided, including but not limited to pro se assistance)
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA6a' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA6b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIA6Total' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Total</b>
		</td>
		<td align='right'>
			<b><span runat='server' id='spnIIAaTotal' /></b>
		</td>
		<td align='right'>
			<b><span runat='server' id='spnIIAbTotal' /></b>
		</td>
		<td align='right'>
			<b><span runat='server' id='spnIIATotal' /></b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table width='600' cellspacing='0' cellpadding='5'>
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
		<td class='MinorSeparatorHdg' align="center" >
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
		<td align='right'>
			<span runat='server' id='spnIIIA1a' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIIA1b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIIA1Total' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total number of people referred to private bar (LRS or individual private lawyers not affiliated with program)
		</td>
		<td align='right'>
			<span runat='server' id='spnIIIA2a' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIIA2b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIIA2Total' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total number of people referred to provider of human or social services (non-legal)
		</td>
		<td align='right'>
			<span runat='server' id='spnIIIA3a' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIIA3b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIIA3Total' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total number of people referred to other source of assistance, None of the above ----<br />
			<span class="FieldLabel">If more than 10 percent of total, please describe in Narrative and provide more detailed breakdown.</span>
		</td>
		<td align='right'>
			<span runat='server' id='spnIIIA4a' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIIA4b' />
		</td>
		<td align='right'>
			<span runat='server' id='spnIIIA4Total' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Total</b>
		</td>
		<td align='right'>
			<b><span runat='server' id='spnIIIAaTotal' /></b>
		</td>
		<td align='right'>
			<b><span runat='server' id='spnIIIAbTotal' /></b>
		</td>
		<td align='right'>
			<b><span runat='server' id='spnIIIATotal' /></b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
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
			<DisplayProperties>
				<DisplayProperty PropertyKey='IA1a'>
					<Control ID='spnIA1a'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IA1b'>
					<Control ID='spnIA1b'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IA1Total'>
					<Control ID='spnIA1Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='IA2a'>
					<Control ID='spnIA2a'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IA2b'>
					<Control ID='spnIA2b'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IA2Total'>
					<Control ID='spnIA2Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='IA3aUniqueVisitors'>
					<Control ID='spnIA3aUniqueVisitors'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IA3bUniqueVisitors'>
					<Control ID='spnIA3bUniqueVisitors'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IA3UniqueVisitorsTotal'>
					<Control ID='spnIA3UniqueVisitorsTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IA4aDownloads'>
					<Control ID='spnIA4aDownloads'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IA4bDownloads'>
					<Control ID='spnIA4bDownloads'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IA4DownloadsTotal'>
					<Control ID='spnIA4DownloadsTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IAaTotal'>
					<Control ID='spnIAaTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IAbTotal'>
					<Control ID='spnIAbTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IATotal'>
					<Control ID='spnIATotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA1a'>
					<Control ID='spnIIA1a'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA1b'>
					<Control ID='spnIIA1b'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIA1Total'>
					<Control ID='spnIIA1Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA2a'>
					<Control ID='spnIIA2a'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA2b'>
					<Control ID='spnIIA2b'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIA2Total'>
					<Control ID='spnIIA2Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='IIA3a'>
					<Control ID='spnIIA3a'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA3b'>
					<Control ID='spnIIA3b'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIA3Total'>
					<Control ID='spnIIA3Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='IIA4aDownloads'>
					<Control ID='spnIIA4aDownloads'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA4bDownloads'>
					<Control ID='spnIIA4bDownloads'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIA4DownloadsTotal'>
					<Control ID='spnIIA4DownloadsTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA6a'>
					<Control ID='spnIIA6a'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA6b'>
					<Control ID='spnIIA6b'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIA6Total'>
					<Control ID='spnIIA6Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIAaTotal'>
					<Control ID='spnIIAaTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIAbTotal'>
					<Control ID='spnIIAbTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIATotal'>
					<Control ID='spnIIATotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIIA1a'>
					<Control ID='spnIIIA1a'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIIA1b'>
					<Control ID='spnIIIA1b'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIA1Total'>
					<Control ID='spnIIIA1Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIIA2a'>
					<Control ID='spnIIIA2a'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIIA2b'>
					<Control ID='spnIIIA2b'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIA2Total'>
					<Control ID='spnIIIA2Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIIA3a'>
					<Control ID='spnIIIA3a'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIIA3b'>
					<Control ID='spnIIIA3b'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIIA3Total'>
					<Control ID='spnIIIA3Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIIA4a'>
					<Control ID='spnIIIA4a'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIIA4b'>
					<Control ID='spnIIIA4b'
						Type='HtmlGenericControl'/>
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
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
