<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<div width='100%' class='SeparatorHdg'>
	Subgrant Request Information
</div>
<table width='100%' cellpadding="1">
	<tr>
		<td style="width:150px">
			<b>Grantee</b>
		</td>
		<td>
			<span runat='server' id='spnOrganizationName'/> (<span runat='server' id='spnLegacyOrganizationID'/>)
		</td>
	</tr>
	<tr>
		<td style="width:150px">
			<b>Subgrantee Organization</b>
		</td>
		<td>
			<span runat='server' id='spnSubgranteeName'/>
		</td>
	</tr>
	<tr>
		<td style="width:150px">
			<b>Subgrant Term</b>
		</td>
		<td>
			<span runat='server' id='spnStartDate'/> - <span runat='server' id='spnEndDate'/>
		</td>
	</tr>
	<tr>
		<td style="width:150px">
			<b>Review Due Date</b>
		</td>
		<td>
			<span runat='server' id='spnDueDate'/>
		</td>
	</tr>
</table>
<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.OrganizationName'>
					<Control ID='spnOrganizationName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnLegacyOrganizationID'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscSubgrantWfTAsByStep' DataObjectDefinitionKey='LscSubgrantWfTAsByStep' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='AAWfTAID'/>
			</Filters>
		</DataObject>

		<DataObject Key='LscWfTASubgrant' DataObjectDefinitionKey='LscWfTASubgrant' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscSubgrantWfTAsByStep' DataObjectPropertyKey='ReqWfTAID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SubgranteeName'>
					<Control ID='spnSubgranteeName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate' Format='M/d/yyyy'>
					<Control ID='spnStartDate'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndDate' Format='M/d/yyyy'>
					<Control ID='spnEndDate'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscSubgrantReviewDueDates' DataObjectDefinitionKey='LscSubgrantReviewDueDates' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscSubgrantWfTAsByStep' DataObjectPropertyKey='ReqWfTAID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OceAAReviewDue' Format='M/d/yyyy'>
					<Control ID='spnDueDate'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscSubgrantWfTAsByStep' DataObjectPropertyKey='ReqWfTAID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Request PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
