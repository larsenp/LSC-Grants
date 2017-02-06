<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ApplReview.Controls.PageSection.cEvaluation" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>

<div width='100%' class='SeparatorHdg'>
	Applicant Information
</div>
<table width='100%'>
	<tr>
		<td>
			<b>Applicant ID</b> <span runat='server' id='spnApplicantID' />
		</td>
		<td>&nbsp;</td>
		<td>
			<b>Applicant Name</b> <span runat='server' id='spnApplicantName' />
		</td>
		<td>&nbsp;</td>
		<td>
			<b>Service Area</b> <span runat='server' id='spnServiceArea' />
		</td>
		<td>&nbsp;</td>
		<td>
			<b>Last Year in Competition</b> <span runat='server' id='spnYear' />
		</td>
	</tr>
	<%--<tr>
		<td>
			<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>
		</td>
	</tr>--%>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnApplicantID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.OrganizationName'>
					<Control ID='spnApplicantName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.CompetitionDisplayName'>
					<Control ID='spnServiceArea'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.TimePeriod.Description'>
					<Control ID='spnYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>


		<%--<DataObject Key='RenewalWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectLatestRenewalApp.LatestRenewalWfTAID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='RenewalWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='RenewalWfTA'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>--%>
	</ModuleSection>
</span>
