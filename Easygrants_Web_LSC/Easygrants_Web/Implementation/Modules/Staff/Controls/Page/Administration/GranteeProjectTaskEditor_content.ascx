<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cEGDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>
<Core:cUserCtlLoader CtlID='ctlWfProjectOutcomeList' 
	Src='Implementation/Modules/Staff/Controls/PageSection/OutcomeGranteeProjectEditor.ascx'
	runat='server'/>
<br>
<Core:cUserCtlLoader CtlID='ctlGranteeProjectTaskList2' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GranteeProjectTaskEditor.ascx'
	runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
										
	</ModuleSection>
<!-- End Embedded XML -->
</span>
