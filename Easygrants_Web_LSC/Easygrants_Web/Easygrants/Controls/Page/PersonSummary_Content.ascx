<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Page.cPersonSummary_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>


<p>The <b>Person Summary</b> page displays detailed information about the person, including 
the login information and the tasks (To Do) that the person is responsible for completing. 
Click on the <b>Login</b> button, to login into the system as the person. To view 
detailed information about the application project and the applicant, click on the 
<b>View Project Summary</b> button.</p>

<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='false' runat='server'/>
<Core:cUserCtlLoader CtlID='ctlPersonInfo' 
	Src='Easygrants/Controls/PageSection/PersonSummaryInfo.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlPersonRelationships' 
	Src='Easygrants/Controls/PageSection/WfTAListPerson.ascx'
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
