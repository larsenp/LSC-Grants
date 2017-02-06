<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" %>
<%@ Register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->

<br />
<br />
<Core:cUserCtlLoader CtlID='ctlGrantPages' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantPages.ascx'
	runat='server'/>
<br />
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true'
	AutoVDateType='Last' Key='GrantsEditor' LinkTitle='Grant Media' runat='server'/>
<br /><br />
<Core:cUserCtlLoader CtlID='ctlGrantSummary' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantSummary.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlGrantLinks' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantLinks.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlGrantMedia' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantMedia.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlGrantTrips' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantTrips.ascx'
	runat='server'/>
<!-- END USER MODIFIABLE CONTENT AREA -->





<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>
