<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<!--
From this page you can manage grant information for the selected grant. To view the associated grant
proposal or application PDF, select the PDF type to view from the dropdown list and click on the View PDF
button. To edit the basic grant information, click the <b>Edit</b> button located at the bottom of the page.<br>
<br>
Select one of the <b>Go To...</b> links below to go to one of the related grant information pages.
<p>
-->
<br />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGrantPages' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantPages.ascx'
	runat='server'/>
<br />
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true'
	AutoVDateType='Last' Key='GrantsEditor' LinkTitle='Grant Details' runat='server'/>
	<br /><br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantSummary' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantSummary.ascx'
	runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader9" CtlID='ctlGrantFinancialSummary' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantFinancialSummary.ascx'
	runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader3"  CtlID='CtlGrantAffiliatedStaff' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantAffiliatedStaff.ascx'
	runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader4"  CtlID='CtlGrantAffiliatedStaffHistory' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantAffiliatedStaffHistory.ascx'
	runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader5" CtlID='ctlGrantInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantInfo.ascx'
	runat='server'/>	
<Core:cUserCtlLoader ID="CUserCtlLoader8" CtlID='ctlGrantAward' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantAward.ascx'
	runat='server'/>	
<Core:cUserCtlLoader ID="CUserCtlLoader7" CtlID='ctlGrantStatusHistory' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantStatusHistory.ascx'
	runat='server'/>
	<Core:cUserCtlLoader ID="CUserCtlLoader6" CtlID='ctlGrantAssurances' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantAssurances.ascx'
	runat='server'/>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>