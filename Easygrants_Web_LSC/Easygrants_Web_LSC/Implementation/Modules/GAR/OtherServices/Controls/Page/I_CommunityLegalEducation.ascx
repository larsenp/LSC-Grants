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
    <td><h1>Form M: Community Legal Education</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormI' 
	Src='Implementation/Modules/GAR/OtherServices/Controls/PageSection/FormI_Instruct.ascx'
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
			Community Legal Education Form M-1(a)</td>
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
			<b>Number of People Directly Receiving Service</b>
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
	<tr>
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
	</tr>
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
							MaximumValue='1699999'
							ErrorMessage='Each entry on Form M-1 must be a number between 0 and 1,700,000.'/>
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
							MaximumValue='1699999'
							ErrorMessage='Each entry on Form M-1 must be number between 0 and 1,700,000.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IA1Total'>
					<Control ID='spnIA1Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IA2a'>
					<Control ID='txtIA2a'
						Type='cTextBox'
						Container='spnIA2a'
						MaxLength='7'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='1699999'
							ErrorMessage='Each entry on Form M-1 must be number between 0 and 1,700,000.'/>
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
							MaximumValue='1699999'
							ErrorMessage='Each entry on Form M-1 must be number between 0 and 1,700,000.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IA2Total'>
					<Control ID='spnIA2Total'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IA3aUniqueVisitors'>
					<Control ID='txtIA3aUniqueVisitors'
						Type='cTextBox'
						Container='spnIA3aUniqueVisitors'
						MaxLength='7'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='1699999'
							ErrorMessage='Each entry on Form M-1 must be number between 0 and 1,700,000.'/>
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
							MaximumValue='1699999'
							ErrorMessage='Each entry on Form M-1 must be number between 0 and 1,700,000.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOtherServicesTotals.IA3UniqueVisitorsTotal'>
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
							MaximumValue='1699999'
							ErrorMessage='Each entry on Form M-1 must be number between 0 and 1,700,000.'/>
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
							MaximumValue='1699999'
							ErrorMessage='Each entry on Form M-1 must be number between 0 and 1,700,000.'/>
					</Control>
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
						Container='spnContinue'>
						<Action
	                        PostBack='True'
	                        AutoSave='True'
	                        Object='EventController'
	                        Method='EventController_NavigateToModulePageKey'>
	                        <Parameters>
		                            <Argument Value='ProSeAssistance'/>
		                            <Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
	                        </Parameters>							
	                    </Action>
               		</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
