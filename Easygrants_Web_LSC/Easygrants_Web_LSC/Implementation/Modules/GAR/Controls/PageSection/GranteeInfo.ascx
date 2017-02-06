<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div style='width:100%' class='SeparatorHdg'>
	Grantee Information
</div>
<br />
<table width='600'>
	<tr>
		<td width='30'>&nbsp;</td>
		<td width='120'>
			<b>Recipient Number</b>
		</td>
		<td width='120'>
			<span runat='server' id='spnRecipientNumber' />
		</td>
		<td width='100'>
			<b><span runat='server' id='spnServiceAreaLbl'/></b>
		</td>
		<td>
			<span runat='server' id='spnServiceArea' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Recipient Name</b>
		</td>
		<td>
			<span runat='server' id='spnRecipientName' />
		</td>
		<td>
			<b>Calendar Year</b>
		</td>
		<td>
			<span runat='server' id='spnWfTAYear' />
		</td>
	</tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False' >
		  <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		  </Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='lblServiceAreaLbl'
						Container='spnServiceAreaLbl'
						Type='cLabel'
						LabelText='Service Area'>
						<Visible>
							<Argument PropertyKey='AssignReportPerServiceArea' Value='True' NullDataObject='True'>
								<RelatedProperty PropertyKey='WfTask.LscWfTask'/>
							</Argument>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.WfProject.WfCompetition.CompetitionDisplayName'>
					<Control ID='lblServiceArea'
						Type='cLabel'
						Container='spnServiceArea'>
						<Visible>
							<Argument PropertyKey='AssignReportPerServiceArea' Value='True' NullDataObject='True'>
								<RelatedProperty PropertyKey='WfTask.LscWfTask'/>
							</Argument>
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment'  DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnRecipientNumber'
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
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
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
