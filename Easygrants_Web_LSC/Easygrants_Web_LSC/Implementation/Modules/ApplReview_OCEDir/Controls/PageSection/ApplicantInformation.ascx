<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
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
			<b>Year</b> <span runat='server' id='spnYear' />
		</td>
		<td>
			<b>Reviewer</b> <span runat='server' id='spnReviewer' />
		</td>
	</tr>
	<tr>
		<td>
			<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>
		</td>
		<td>&nbsp;</td>
		<td>
			<EasyGrants:cReportOutputLink id='ctlStaffReviewReportLink' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Person.FirstNameLastName'>
					<Control ID='spnReviewer'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTA' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
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

		<DataObject Key='FiscalAppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='102' />
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Fiscal PDF with Scores~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='FiscalAppWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='FiscalAppWfTA'
								DataObjectPropertyKey='WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='StaffReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='83' />
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlStaffReviewReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Staff Review PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='StaffReviewWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='StaffReviewWfTA'
								DataObjectPropertyKey='WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

   </ModuleSection>
</span>
