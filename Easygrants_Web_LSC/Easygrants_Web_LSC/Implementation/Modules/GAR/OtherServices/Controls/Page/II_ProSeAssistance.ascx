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
    <td><h1>Form M: Pro Se Assistance</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormII' 
	Src='Implementation/Modules/GAR/OtherServices/Controls/PageSection/FormII_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlFormIIF' 
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
			Pro Se Assistance Form M-2(a)</td>
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
	<tr>
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
	</tr>
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
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIA1Total'>
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
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIA2Total'>
					<Control ID='spnIIA2Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IIA3a'>
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
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIA3Total'>
					<Control ID='spnIIA3Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
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
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IIA4DownloadsTotal'>
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
						Container='spnContinue' >
						<Action
	                        PostBack='True'
	                        AutoSave='True'
	                        Object='EventController'
	                        Method='EventController_NavigateToModulePageKey'>
	                        <Parameters>
		                            <Argument Value='ReferredOtherServices'/>
		                            <Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
	                        </Parameters>							
	                    </Action>
				     </Control>		
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
