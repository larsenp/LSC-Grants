<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>Contact Web Address Page</P>

<!-- Page Content - Controls -->
<Core:cUserCtlLoader CtlID='ctlAddressEditor' 
	Src='EasyGrants/Controls/PageSection/WebAddressEditor.ascx'
	runat='server'/>
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
<!-- End Embedded XML -->


