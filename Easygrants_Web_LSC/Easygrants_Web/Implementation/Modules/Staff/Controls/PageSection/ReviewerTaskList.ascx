<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- Page Content - Top Of Page -->

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Review Tasks</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
<tr>
	<td>
	Listed below are the review tasks and reviewers assigned to review application submissions within this grant project.  From this list, you can select the Task - Edit, Grant Info, or Contact info options from the Action list and click Go to perform these function.  Review tasks are assigned to reviewers either automatically by the system, or via the Review Module.
	</td>
</tr>
<tr><td>&nbsp;</td></tr>
</table>
<Core:cUserCtlLoader CtlID='ctlReviewerTaskList' 
	Src='Implementation/Modules/Staff/Controls/PageSection/Contact_ReviewTasks.ascx'
	runat='server'/>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
