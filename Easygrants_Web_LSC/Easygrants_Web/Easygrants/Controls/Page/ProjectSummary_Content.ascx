<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Page.cProjectSummary_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>
<p>The <b>Project Summary</b> page displays detailed information about the applicant 
and the application project, including all individuals who are contributing to the 
application (e.g., referees, mentors, etc.). From this page you can login as the applicant by clicking on the 
<b>Log In</b> button.  To view detailed information about an individual contributing 
to the application, click on the <b>View Person Summary</b> button.</p>

<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='false' runat='server'/>
<Core:cUserCtlLoader CtlID='ctlPersonInfo' 
	Src='Easygrants/Controls/PageSection/PersonSummaryInfo.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlProjectRelationships' 
	Src='Easygrants/Controls/PageSection/WfTAListProject.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td>
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnReturnToSearch'/>
	</td>
</tr>

</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
	
	</ModuleSection>
<!-- End Embedded XML -->
</span>
