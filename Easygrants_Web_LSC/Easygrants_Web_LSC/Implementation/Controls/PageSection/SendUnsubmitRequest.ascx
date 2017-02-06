<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Controls.PageSection.cSendUnsubmitRequest" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='600'>
	<tr>
		<td>
			<b>Recipient Number</b>
		</td>
		<td>
			<span runat='server' id='spnLegacyOrganizationID' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Organization Name</b>
		</td>
		<td>
			<span runat='server' id='spnOrganizationName' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Competition Year</b>
		</td>
		<td>
			<span runat='server' id='spnYear' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Service Area</b>
		</td>
		<td>
			<span runat='server' id='spnServiceArea' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Submission</b>
		</td>
		<td>
			<span runat='server' id='spnTask' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td valign='top'>
			<b>Additional comments</b>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdditionalComments' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnSend' />&nbsp;&nbsp;
			<span runat='server' id='spnCancel' />
		</td>
	</tr>
</table>  
  
  
  
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnLegacyOrganizationID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.OrganizationName'>
					<Control ID='spnOrganizationName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.WfProject.TimePeriod.SortOrder'>
					<Control ID='spnYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.WfProject.WfCompetition.CompetitionName'>
					<Control ID='spnServiceArea'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTask.WfTaskAbbr'>
					<Control ID='spnTask'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtAdditionalComments'
						Type='cTextArea'
						Container='spnAdditionalComments'
						Rows='15'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSend'
						Type='cButton'
						Container='spnSend'
						Caption='Send Unsubmission Request'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='SendUnsubmissionRequestWithTemplate'/>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ConfirmKey' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Type='cButton'
						Container='spnCancel'
						Caption='Cancel'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnKey' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='CorrespondenceDefinition' DataObjectDefinitionKey='CorrespondenceDefinition' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument PropertyKey='CorrespondenceDefinitionID' Value='119' />
			</Filters>
		</DataObject>
	</ModuleSection>
</span>