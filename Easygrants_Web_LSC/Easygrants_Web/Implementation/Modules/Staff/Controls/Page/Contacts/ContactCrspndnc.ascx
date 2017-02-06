<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br>
<br />
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ContactPages.ascx'
	runat='server'/>
<br>
<b>History:&nbsp;</b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Last' Key='PersonVirtualFile' LinkTitle='Correspondence' runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlPersonSum' 
	Src='EasyGrants/Controls/PageSection/PrimaryContactInfo.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlContact_Crspndnc' 
	Src='EasyGrants/Controls/PageSection/Contact_Crspndnc.ascx'
	runat='server'/>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>
