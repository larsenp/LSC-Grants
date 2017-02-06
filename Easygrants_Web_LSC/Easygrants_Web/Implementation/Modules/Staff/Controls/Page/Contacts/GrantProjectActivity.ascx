<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Contacts.cGrantProjectActivity" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<br>
The Grant Project Activity page lists the application, review, and progress report tasks for the selected grant project.  Select links from the <b>Go To:</b> menu below to go to other Contact Information pages.  
The links on the <b>History:</b> menu act as a "crumb trail" as you navigate through the contact information pages, allowing you to easily navigate or click back to a previously accessed page.<br><br>
<Core:cUserCtlLoader ID='uclPersonLinks' CtlID='ctlPersonLinks' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ContactPages.ascx'
	runat='server'/>
<Core:cUserCtlLoader ID='uclOrgLinks' CtlID='ctlOrgLinks' 
	Src='Implementation/Modules/Staff/Controls/PageSection/OrganizationPages.ascx'
	runat='server'/>
<br>
<b>History:&nbsp;</b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Last' Key='GrantProjectActivity' LinkTitle='Grant Project Activity' runat='server'/>
<br><br>
<Core:cUserCtlLoader ID='uclPersonSum' CtlID='ctlPersonSum' 
	Src='EasyGrants/Controls/PageSection/PersonSummaryInfo.ascx'
	runat='server'/>
<Core:cUserCtlLoader ID='uclOrgSum' CtlID='ctlOrgSum' 
	Src='Implementation/Modules/Staff/Controls/PageSection/Organization_Information.ascx'
	runat='server'/>
<br>

<Core:cUserCtlLoader CtlID='ctlGPAct' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GranteeProjectActivity.ascx'
	runat='server'/>

<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
	</ModuleSection>
</span>