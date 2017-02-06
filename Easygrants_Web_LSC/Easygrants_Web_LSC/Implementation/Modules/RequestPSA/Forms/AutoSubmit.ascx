<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.RequestPSA.Forms.cAutoSubmit" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
Step 2 auto-submit page
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlSubmissionButton' Src='Easygrants/Controls/Base/Submission_Button.ascx' Properties='ForceGen=False' runat='server' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>