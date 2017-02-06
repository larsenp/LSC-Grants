<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>

<div width='100%' class='SeparatorHdg'>
	Applicant Information
</div>
<br />
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
	<tr><td>&nbsp;</td></tr>
	
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<%--<DisplayProperty PropertyKey='Person.FirstNameLastName'>
					<Control ID='spnReviewer'
						Type='HtmlGenericControl' />
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='LSCWftaRindbServarea.YearCurrentComp'>
					<Control ID='spnYear'
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
				<%--<DisplayProperty PropertyKey='WfProject.TimePeriod.Description'>
					<Control ID='spnYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>--%>
				
			</DisplayProperties>
		</DataObject>


   </ModuleSection>
</span>
