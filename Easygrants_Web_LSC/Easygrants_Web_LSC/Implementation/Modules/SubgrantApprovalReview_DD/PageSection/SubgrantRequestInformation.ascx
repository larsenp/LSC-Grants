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
			<span runat='server' id='spnSubgranteeName'/> (<span runat="server" id='spnSubrecipientOrganizationID' />)
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
</table>

<table>
	<tr>
		<td>
			<EasyGrants:cReportOutputLink id='ctlApplicantReportLinkReq' runat='server'/>
		</td>
		<td>
			<EasyGrants:cReportOutputLink id='ctlApplicantReportLinkAA' runat='server'/>
		</td>
	</tr>
</table>



<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganization.OrganizationName'>
					<Control ID='spnOrganizationName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnLegacyOrganizationID'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscWfTASubgrant' DataObjectDefinitionKey='LscWfTASubgrant' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'>
					<RelatedProperty PropertyKey='WfTaskAssignment'/>
				</Argument>
				<Argument PropertyKey='WfTaskID' Value='53'>
					<RelatedProperty PropertyKey='WfTaskAssignment'/>
				</Argument>
			</Filters>
			<DisplayProperties>
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

		<DataObject Key='LscGranteeProjectSubgrant' DataObjectDefinitionKey='LscGranteeProjectSubgrant' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SubrecipientOrganization.OrganizationName'>
					<Control ID='spnSubgranteeName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubrecipientOrganization.LscOrganization.SubrecipientID'>
					<Control ID='spnSubrecipientOrganizationID'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='ReportOutputLinkReq' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'>
				</Argument>
				<Argument PropertyKey='WfTaskID' Value='53'>
				</Argument>
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLinkReq'
						Type='cReportOutputLink'
						DisplayText='~View Request PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLinkReq'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLinkReq'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='ReportOutputLinkAA' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'>
				</Argument>
				<Argument PropertyKey='WfTaskID' Value='64'>
				</Argument>
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLinkAA'
						Type='cReportOutputLink'
						DisplayText='~View AA Review PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLinkAA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLinkAA'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
