<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- Page Content - Top Of Page -->
<!--
<br>
The Notes page allows you to create notes to store information in relation to this organization.  Select links from the <b>Go To:</b> menu below to go to other Contact 
Information pages.  The links on the  <b>History:</b> menu act as a "crumb trail" as you navigate through the Contact Information pages, allowing you to easily navigate 
or click back to a previously accessed page. -->
<br><br>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/OrganizationPages.ascx'
	runat='server'/>
<br>
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Last' Key='OrgVirtualFile' LinkTitle='Notes' runat='server'/>
<!--<br><br> -->	
<Core:cUserCtlLoader CtlID='ctlOrgSum' 
	Src='Implementation/Modules/Staff/Controls/PageSection/Organization_Information.ascx'
	runat='server'/>
<br>
<Core:cUserCtlLoader CtlID='ctlNotes' 
	Src='EasyGrants/Controls/PageSection/Contact_Notes.ascx'
	runat='server'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
