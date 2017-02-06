<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table width='100%' cellpadding='2' cellspacing='0'>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td class='SeparatorHdg'>
			View Full Submission
		</td>
	</tr>	
	
	
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlApplicantReportLink' Src='Core/Controls/Base/ReportOutputLink.ascx'
				runat='server' />
		</td>
	</tr>
</table>



<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
			<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View PDF~'>
						<Parameters>
							<Argument Type='ModuleUser'
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='GranteeProject.WfProject.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>