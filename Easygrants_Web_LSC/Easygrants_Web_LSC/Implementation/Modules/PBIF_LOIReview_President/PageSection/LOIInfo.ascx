<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>

<div class='SeparatorHdg'>Letter of Intent to Apply for Funding Info</div>
<br />
<table style='width:100%'>
	<tr>
		<td>
			<strong>Organization</strong>
		</td>
		<td>
			<span runat='server' id='spnOrganizationName'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>Grant Number:</b>
		</td>
		<td>
			<span runat='server' id='spnLegacyGrantID'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>Review Score:</b>
		</td>
		<td>
			<span runat='server' id='spnWeightedScore'/>%
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>
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
				<DisplayProperty PropertyKey='LegacyGrantID'>
					<Control ID='spnLegacyGrantID'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='AppWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='123'/>
				<Argument PropertyKey='WfTaskStatusID' Value='2' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Letter of Intent to Apply for Funding PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='AppWfTaskAssignment'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='AppWfTaskAssignment'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
		<DataObject Key='LscProBonoScoreByLoi' DataObjectDefinitionKey='LscProBonoScoreByLoi' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WeightedScore' Format='#'>
					<Control ID='spnWeightedScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
				
	</ModuleSection>
</span>
