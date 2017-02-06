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
			<b>Year</b> <span runat='server' id='spnYear' />
		</td>
		<td>&nbsp;</td>
		<td>
			<b>Reviewer:</b> <span runat='server' id='spnReviewer' />
		</td>
	</tr>
</table>
<table width='600px'>
	<tr>
		<td>
			<b>Total Score: <span runat='server' id='spnTotalScore' /></b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Part I Board of Directors / Management Involvement
		</td>
		<td style='text-align:right'>
			<span runat='server' id='spnSubtotalPartI'/> Points out of 43 Points
		</td>
	</tr>
	<tr>
		<td>
			Part II Profile of Financial Employees
		</td>
		<td style='text-align:right'>
			<span runat='server' id='spnSubtotalPartII'/> Points out of 16 Points
		</td>
	</tr>
	<tr>
		<td>
			Part III Accounting Manual
		</td>
		<td style='text-align:right'>
			<span runat='server' id='spnSubtotalPartIII'/> Points out of 14 Points
		</td>
	</tr>
	<tr>
		<td>
			Part IV Fiscal Oversight by Other Funders 
		</td>
		<td style='text-align:right'>
			<span runat='server' id='spnSubtotalPartIV'/> Points out of 5 Points
		</td>
	</tr>
	<tr>
		<td>
			Part V Financial Management
		</td>
		<td style='text-align:right'>
			<span runat='server' id='spnSubtotalPartV'/> Points out of 9 Points
		</td>
	</tr>
	<tr>
		<td>
			Part VI Investigatory Inquiries
		</td>
		<td style='text-align:right'>
			<span runat='server' id='spnSubtotalPartVI'/> Points out of 5 Points
		</td>
	</tr>
	<tr>
		<td>
			Part VII Accounting System
		</td>
		<td style='text-align:right'>
			<span runat='server' id='spnSubtotalPartVII'/> Points out of 8 Points
		</td>
	</tr>
</table>
<table>
	<tr>
		<td>
			<EasyGrants:cReportOutputLink id='ctlFiscalReportLink' runat='server'/>
		</td>
	</tr>
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
					<Control ID='ctlFiscalReportLink'
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

		<DataObject Key='LscCompAppFiscalScoreTotal' DataObjectDefinitionKey='LscCompAppFiscalScoreTotal' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TotalScore' Format='##.#'>
					<Control ID='spnTotalScore'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscCompAppFiscalScoreByPart' DataObjectDefinitionKey='LscCompAppFiscalScoreByPart' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTA' DataObjectPropertyKey='vLSCCompWftaOrgServareaYear.OrganizationID' PropertyKey='OrganizationID'>
					<RelatedProperty PropertyKey='LscCompApplFiscal'/>
				</Argument>
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTA' DataObjectPropertyKey='vLSCCompWftaOrgServareaYear.TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscCompApplFiscal'/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SubtotalPartI' Format='##.#'>
					<Control ID='spnSubtotalPartI'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubtotalPartII' Format='##.#'>
					<Control ID='spnSubtotalPartII'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubtotalPartIII' Format='##.#'>
					<Control ID='spnSubtotalPartIII'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubtotalPartIV' Format='##.#'>
					<Control ID='spnSubtotalPartIV'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubtotalPartV' Format='##.#'>
					<Control ID='spnSubtotalPartV'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubtotalPartVI' Format='##.#'>
					<Control ID='spnSubtotalPartVI'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubtotalPartVII' Format='##.#'>
					<Control ID='spnSubtotalPartVII'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

   </ModuleSection>
</span>
