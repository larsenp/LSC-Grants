<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStagePages.ascx'
	runat='server'/>
<br>

<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='ByReviewer' LinkTitle='Scores/Comments List by Reviewer' runat='server'/>
<br><br>
<Core:cUserCtlLoader CtlID='ReviewStageInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStageInfo.ascx'
	runat='server'/>
	
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Reviewer Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<Core:cUserCtlLoader CtlID='PersonInfo' 
	Src='Implementation/Modules/Staff/Controls/Page/Reviews/PersonInfo_Reviewer.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlRatingsByRev' 
	Src='Implementation/Modules/Staff/Controls/Page/Reviews/RatingsByRev.ascx'
	runat='server'/>	
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
