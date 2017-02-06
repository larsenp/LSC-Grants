<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->

<br />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGrantPages' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantPages.ascx'
	runat='server'/>
<br />
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true'
	AutoVDateType='Last' Key='GrantsEditor' LinkTitle='Grant Demographics' runat='server'/>
	<br><br>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantSummary' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantSummary.ascx'
	runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='ctlGrantInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantDemographics_View.ascx'
	runat='server'/>

<!-- END USER MODIFIABLE CONTENT AREA -->





<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>
