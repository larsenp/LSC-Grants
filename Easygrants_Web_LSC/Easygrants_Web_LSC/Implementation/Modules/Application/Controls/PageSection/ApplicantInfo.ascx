<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div style='width:100%' class='SeparatorHdg'>
	Applicant Information
</div>
<br />
<table width='600'>
	<tr>
		<td width='10px'>&nbsp;</td>
		<td width='150px' valign='top'>
			<b>Recipient Number</b>
		</td>
		<td width='200px' valign='top'>
			<span runat='server' id='spnRecipientNumber' ></span>
		</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td width='100px' valign='top'>
			<b>Service Area</b>
		</td>
		<td width='140px' valign='top'>
			<span runat='server' id='spnServiceArea' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td valign='top'>
			<b>Applicant Organization</b>
		</td>
		<td valign='top'>
			<span runat='server' id='spnRecipientName' />
		</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td valign='top'>
			<b>Application Cycle</b>
		</td>
		<td valign='top'>
			<span runat='server' id='spnWfTAYear' />
		</td>
	</tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganization.LegacyOrganizationID'
					IfBlank='Not yet assigned'>
					<Control ID='spnRecipientNumber'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.CompetitionDisplayName'>
					<Control ID='spnServiceArea'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.OrganizationName'>
					<Control ID='spnRecipientName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTAYear'>
					<Control ID='spnWfTAYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
