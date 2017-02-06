<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>



<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlLookupTableViewer' 
	Src='EasyGrants/Controls/PageSection/LookupTableViewer.ascx'
	runat='server'/>

<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
	</ModuleSection>
</span>