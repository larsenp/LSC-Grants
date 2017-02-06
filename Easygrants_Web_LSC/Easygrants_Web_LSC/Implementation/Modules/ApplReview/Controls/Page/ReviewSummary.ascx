<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div width='100%' class='SeparatorHdg'>
	Application Review Summary Document
</div>
<br /><br />
<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ReviewSummaryRFP'
	Src='Implementation/Modules/ApplReview/Controls/Page/ReviewSummaryRFP.ascx'
	runat='server'/>

<%--<Core:cUserCtlLoader CtlID='FundingTerm'
	Src='Implementation/Modules/ApplReview/Controls/Page/ForSummary/FundingTerm.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='AppOverviewReview'
	Src='Implementation/Modules/ApplReview/Controls/Page/ForSummary/AppOverviewReview.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ApplicantPAIPlanReview'
	Src='Implementation/Modules/ApplReview/Controls/Page/ForSummary/AppPAIPlanReview.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='OCERptReview'
	Src='Implementation/Modules/ApplReview/Controls/Page/ForSummary/OCERptReview.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='GranteeProfileReview'
	Src='Implementation/Modules/ApplReview/Controls/Page/ForSummary/GranteeProfileReview.ascx'
	runat='server'/>--%>

<Core:cUserCtlLoader CtlID='CSRAnalysis'
	Src='Implementation/Modules/ApplReview/Controls/Page/ForSummary/CSRAnalysis.ascx'
	runat='server'/>
	
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='OtherRequiredReview'
	Src='Implementation/Modules/ApplReview/Controls/Page/ForSummary/OtherRequiredReview.ascx'
	runat='server'/>


<%--<Core:cUserCtlLoader CtlID='EvalPart2'
	Src='Implementation/Modules/ApplReview/Controls/Page/ForSummary/EvalPart2.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='EvalPart3'
	Src='Implementation/Modules/ApplReview/Controls/Page/ForSummary/EvalPart3.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='RecommendationOA1'
	Src='Implementation/Modules/ApplReview/Controls/Page/ForSummary/RecommendationOA1.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='RecommendationOA2'
	Src='Implementation/Modules/ApplReview/Controls/Page/ForSummary/RecommendationOA2.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='GrantTermsAndConditions'
	Src='Implementation/Modules/ApplReview/Controls/Page/ForSummary/GrantTermsAndConditions.ascx'
	runat='server'/>
--%>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>

