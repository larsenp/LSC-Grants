<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.PageSection.cApplicantInfo" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table width='100%'>	
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Participant Information</b></td>
	</tr>
</table>
<table>	
	<tr>
		<td><b>Primary Grantee</b><br><br></td>
		<td><span id="spnGrantee" runat='server'/></td>
	</tr>
	<tr>
		<td><b>Primary <%=GetLabel("Organization")%></b><br><br></td>
		<td><span id="spnPrimaryOrg" runat='server'/></td>
	</tr>
	<tr>
		<td><b>Current Task</b><br><br></td>
		<td><span id="spnTask" runat='server'/></td>
	</tr>
	<tr>
		<td><b>Current Outcome</b><br><br></td>
		<td><span id="spnOutcome" runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAcrobat'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
		
		<Core:cUserCtlLoader CtlID='ctlApplicantReportLink' 
			Src='Core/Controls/Base/ReportOutputLink.ascx'
			runat='server' />
		
		</td>
	</tr>
</table>

<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAcrobat'
						Container='spnAcrobat'
						Type='cLink'
						Caption='Free Adobe Reader.'
						>
						<Action PostBack='False'
							Target='_blank'
							URL='http://www.adobe.com/products/acrobat/readstep2.html'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='Click ~here~ to view the applicant final application in PDF format.'>
						<Parameters>
							<Argument Type='DataPresenter'
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataPresenter'
								TypeKey='DefinitionID'
								PropertyKey='DefinitionID'
								Value=''/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName'>
					<Control ID='spnGrantee'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName'>
					<Control ID='spnPrimaryOrg'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='spnTask'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome'>
					<Control ID='spnOutcome'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
