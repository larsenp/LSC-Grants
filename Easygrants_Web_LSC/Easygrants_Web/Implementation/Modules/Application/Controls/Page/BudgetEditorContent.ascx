<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->

<!-- Page Content - Controls -->

<Core:cUserCtlLoader CtlID='ctlBudgetEditor' 
	Src='EasyGrants/Controls/PageSection/BudgetPeriod_Editor.ascx'
	Properties='BudgetUploadVisible=True'
	runat='server' />

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>


