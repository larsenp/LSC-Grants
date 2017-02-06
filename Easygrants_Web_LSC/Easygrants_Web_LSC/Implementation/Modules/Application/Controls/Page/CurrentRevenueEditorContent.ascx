<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<Core:cUserCtlLoader CtlID='ctlEditor.ascx' 
	Src='Implementation/Modules/Application/Controls/PageSection/CurrentRevenueEditor.ascx'
	runat='server' ID="Cuserctlloader1"
	Properties='DisplayFundCode=True'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
<!-- End Embedded XML -->