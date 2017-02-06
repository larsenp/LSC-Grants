<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cQuickLinks"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>



<table class="sidebar" width="160" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="sidebarheader">Quick Links </td>
	</tr>
	<tr>
		<td class="sidebartext">
			<a href='http://grants.lsc.gov/assistance/faqs' target="_blank">LSC Grants Frequently Asked Questions (FAQ)</a>
		</td>
	</tr>
	<tr id='trNewApp' runat='server' visible='false'>
		<td class="sidebartext">
			<a href='http://grants.lsc.gov/apply-for-funding/new-applicants' target='_blank'>New Applicants</a><br />
		</td>
	</tr>
	<tr id='trCurrGrantee' runat='server' visible='false'>
		<td class="sidebartext">
			<a href='http://grants.lsc.gov/apply-for-funding/current-grantees' target='_blank'>Current Grantees</a>
		</td>
	</tr>
	<tr id='trRenewalApp' runat='server' visible='false'>
		<td class="sidebartext">
			<a href='http://grants.lsc.gov/apply-for-funding/grant-renewal-applicants' target='_blank'>Grant renewal applicants</a> 
		</td>
	</tr>
	<tr id='trPostPQV' runat='server' visible='false'>
		<td class="sidebartext">
			<a href='http://grants.lsc.gov/apply-for-funding/post-pqv-applicants' target='_blank'>Post-PQV applicants</a>
		</td>
	</tr>
</table>
          
          
          <!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
    
      <DataObject Key='QL1' DataObjectDefinitionKey='WfTaskAssignment'>
         <Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		 </Filters>
	  </DataObject>
		  
      
      
    </ModuleSection>
</span>