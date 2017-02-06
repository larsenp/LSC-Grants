<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br />
<br />
<table width='100%' cellpadding='2' cellspacing='0'>
<tr><td class='SeparatorHdg'>Contact Categories</td></tr>

</table>
<Core:cUserCtlLoader CtlID='ctlContactCategory' 
	Src='EasyGrants/Controls/PageSection/Contact_Category.ascx'
	runat='server'/>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>