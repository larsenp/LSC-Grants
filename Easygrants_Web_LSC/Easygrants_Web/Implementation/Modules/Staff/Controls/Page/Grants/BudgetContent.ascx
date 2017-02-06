<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br />
<br />
<!-- Page Content - Top Of Page -->


<!-- Page Content - Controls -->
<Core:cUserCtlLoader CtlID='ctlGrantInfo' 
	Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
	runat='server' />
<br />

<Core:cUserCtlLoader CtlID='ctlBudget_Editor' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantBudgetEditor.ascx'
	runat='server'/>
<p>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>


