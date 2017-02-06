<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'/>

<%--
<p>Enter or edit the Lookup Table item and click the <b>Save</b> button.  To close this page and return 
to the Lookup Table List page, click the <b>Close</b> button. <br>
<b>IMPORTANT:</b> If you close or navigate off this page before you save, you will lose unsaved information. </p>
--%>

<br><br>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlLookupTableEditor' 
	Src='EasyGrants/Controls/PageSection/LookupTableEditor.ascx'
	runat='server'/>

<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
	</ModuleSection>
</span>