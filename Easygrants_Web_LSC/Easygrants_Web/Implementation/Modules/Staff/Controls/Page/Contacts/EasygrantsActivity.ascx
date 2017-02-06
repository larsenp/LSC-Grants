<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br />
<br />
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ContactPages.ascx'
	runat='server'/>
<br>

<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Last' Key='PersonVirtualFile' LinkTitle='Contact Activity' runat='server'/>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlPersonSum' 
	Src='EasyGrants/Controls/PageSection/PrimaryContactInfo.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlContactGrants' 
	Src='Implementation/Modules/Staff/Controls/PageSection/Contact_Grants.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlContactAppTasks' 
	Src='Implementation/Modules/Staff/Controls/PageSection/Contact_ApplicationTasks.ascx'
	runat='server'/>
	<table width='100%' cellpadding='2' cellspacing='0' border='0'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Review Tasks</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	</table>
<Core:cUserCtlLoader CtlID='ctlContactReviewTasks' 
	Src='Implementation/Modules/Staff/Controls/PageSection/Contact_ReviewTasks.ascx'
	runat='server'/>
	
<Core:cUserCtlLoader CtlID='ctlContactReportTasks' 
	Src='Implementation/Modules/Staff/Controls/PageSection/Contact_ReportTasks.ascx'
	runat='server'/>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>