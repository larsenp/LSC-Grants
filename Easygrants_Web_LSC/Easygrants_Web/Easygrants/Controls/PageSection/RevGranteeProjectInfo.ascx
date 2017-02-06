<%@ Control Language="vb" AutoEventWireup="true" Codebehind="RevGranteeProjectInfo.ascx.vb" Inherits=".RevGranteeProjectInfo" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b><span id='spnProgramName' runat='server'/></b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
<!-- Control Label (for Organization information) -->
	<tr>
		<td	valign="top" width="120"><b>Applicant Name</b></td>
		<td>
			<span id='spnApplicantName' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width="120"><b><%=GetLabel("Organization")%></b></td>
		<td>
			<span id='spnOrganization' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlApplicantReportLink' Type='cReportOutputLink' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='WfTask' DataObjectDefinitionKey='WfTask'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='WfTaskAssignment'
					DataObjectPropertyKey='WfTaskID'
					PropertyKey='WfTaskID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTask'>
					<Control ID='spnProgramName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ReviewStage' DataObjectDefinitionKey='ReviewStage'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='WfTask'
					DataObjectPropertyKey='WfTaskID'
					PropertyKey='WfTaskID'
					Value='' 
					bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='ReviewStage'
					DataObjectPropertyKey='ApplicationWfTaskID'
					PropertyKey='WfTaskID'
					Value='' 
					bool=''/>
				<Argument Type='' 
					TypeKey=''
					PropertyKey='WfTaskRoleID'
					Value='1' 
					bool='And'/>
				<Argument Type='DataObjectCollection' 
					TypeKey='WfTaskAssignment'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' 
					bool='And'/>
			</Filters>
		</DataObject>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName'>
					<Control ID='spnApplicantName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName'>
					<Control ID='spnOrganization'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'>
						<Parameters>
							<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='EntityID' Value='' />
							<Argument PropertyKey='DefinitionID' Value=''/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
