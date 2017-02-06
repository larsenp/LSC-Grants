<%@ Control Language="vb" AutoEventWireup="false" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<!--
From this page you can manage the budget and enter payments for the selected grant. To add
a budget, click the <b>Add</b> button and follow the instructions. To view or edit a budget
(i.e., to edit any of the information related to the budget), click the <b>Edit</b> button.
To delete a budget, click the <b>Delete</b> button.<br>
<br>
Select one of the <b>Go To...</b> links below to go to one of the related grant information
pages.
<p> -->
<br />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGrantPages' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantPages.ascx'
	runat='server'/>
<br />
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true'
	AutoVDateType='Last' Key='GrantsVirtualFile' LinkTitle='Grant Financials' runat='server'/>
<br/><br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantSummary' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantSummary.ascx'
	runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='ctlGrantFinancialSummary' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantFinancialSummary.ascx'
	runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader4" CtlID='ctlGrantBudgets' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantBudgets.ascx'
	runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader7" CtlID='ctlGrantPayments' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantPayments.ascx'
	runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader8" CtlID='ctlGrantReports'
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantReports.ascx'
	runat='server' />	
<Core:cUserCtlLoader ID="CUserCtlLoader10" CtlID='ctlGrantPaymentHistory' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantPaymentHistory.ascx'
	runat='server'/>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>

