<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Review Assignment Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='20%'>
			<b>Committee</b>&nbsp;&nbsp;
		</td>
		<td colspan='3'>
			<span runat='server' id='spnCmt' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td >
			<b>Reviewer Name</b>&nbsp;&nbsp;
		</td>
		<td width='20%'>
			<span runat='server' id='spnName'></span>
		</td>
		<td width='20%'>
			<b>Reviewer <%=GetLabel("Organization")%></b>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnInst' visible='true'></span>
		</td>
	</tr>	
	<tr>
		<td>
			<b>Participant Name</b>
		</td>
		<td>
			<span runat='server' id='spnAppName'></span>
		</td>
		<td>
			<b>Participant <%=GetLabel("Organization")%></b>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnAppInst' visible='true'></span>
		</td>
	</tr>	
	
<tr><td>&nbsp;</td></tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WfTaskAssignmentID' 
					PropertyKey='WfTaskAssignmentID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='ReviewCommitteeName.ReviewCommitteeDescription'>
					<Control ID='spnCmt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Person.LastNameFirstName'>
					<Control ID='spnName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Person.PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='spnInst'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName'>
					<Control ID='spnAppName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName'>
					<Control ID='spnAppInst'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>
