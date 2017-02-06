<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<!--
<br>
	The Contact Activity page lists the grant projects for this contact.  Prospecting, Review and Progress Report tasks are grouped 
	under their respective grant projects.  To view the tasks under each grant project, select "View Project Tasks" from the Grant 
	Project Action menu and click the <b>Go</b> button.  Select links from the <b>Go To:</b> menu below to go to other Contact 
	Information pages.  The links on the <b>History:</b> menu act as a "crumb trail" as you navigate through the Contact 
	Information pages, allowing you to easily navigate or click back to a previously accessed page. -->
<br><br>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/OrganizationPages.ascx'
	runat='server'/>
<br>
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Last' Key='OrgVirtualFile' LinkTitle='Activity' runat='server'/>

<Core:cUserCtlLoader CtlID='ctlOrgSum' 
	Src='Implementation/Modules/Staff/Controls/PageSection/Organization_Information.ascx'
	runat='server'/>
<br>
<Core:cUserCtlLoader CtlID='ctlContactGrants' 
	Src='Implementation/Modules/Staff/Controls/PageSection/Organization_Grants.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlContactOtherGrants'
	Src='Implementation/Modules/Staff/Controls/PageSection/Organization_Other_Grants.ascx'
	runat='server'/>	
<br>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>