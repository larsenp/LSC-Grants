<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div width='100%' class='SeparatorHdg'>
	Evaluation Summary Document
</div>
<br /><br />
<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<%--<Core:cUserCtlLoader CtlID='EvalFormA'
	Src='Implementation/Modules/RenewalReview/Controls/ReviewSummary/EvalFormA.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='EvalFormD'
	Src='Implementation/Modules/RenewalReview/Controls/ReviewSummary/EvalFormD.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='EvalFormG'
	Src='Implementation/Modules/RenewalReview/Controls/ReviewSummary/EvalFormG.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='EvalFormI'
	Src='Implementation/Modules/RenewalReview/Controls/ReviewSummary/EvalFormI.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='EvalFormK'
	Src='Implementation/Modules/RenewalReview/Controls/ReviewSummary/EvalFormK.ascx'
	runat='server'/>--%>

<Core:cUserCtlLoader CtlID='EvalFormL'
	Src='Implementation/Modules/RenewalReview/Controls/ReviewSummary/EvalFormL.ascx'
	runat='server'/>

<%--<Core:cUserCtlLoader CtlID='AppOverviewReview'
	Src='Implementation/Modules/RenewalReview/Controls/ReviewSummary/AppOverviewReview.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ApplicantPAIPlanReview'
	Src='Implementation/Modules/RenewalReview/Controls/ReviewSummary/AppPAIPlanReview.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='OCERptReview'
	Src='Implementation/Modules/RenewalReview/Controls/ReviewSummary/OCERptReview.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='GranteeProfileReview'
	Src='Implementation/Modules/RenewalReview/Controls/ReviewSummary/GranteeProfileReview.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='Certifications'
	Src='Implementation/Modules/RenewalReview/Controls/ReviewSummary/Certifications.ascx'
	runat='server'/>
--%>
<Core:cUserCtlLoader CtlID='FundingRecommendation'
	Src='Implementation/Modules/RenewalReview/Controls/ReviewSummary/FundingRecommendation.ascx'
	runat='server'/>

<%--<Core:cUserCtlLoader CtlID='GrantTermsAndConditions'
	Src='Implementation/Modules/RenewalReview/Controls/ReviewSummary/GrantTermsAndConditions.ascx'
	runat='server'/>--%>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>

