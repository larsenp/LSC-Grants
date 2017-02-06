<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600' >
  <tr>
	  <td colspan="4"><h1>Form L: Other Services Narrative</h1></td>
  </tr>
  <tr>
		<td colspan="4" class="SeparatorHdg">Instructions</td>
  </tr>
  <tr><td>&nbsp;</td></tr>
</table>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormG6' 
	Src='Implementation/Modules/GAR/ServiceNarrative/Controls/Page/ServNarrative_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- Page Content - Controls -->

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlTaskUploads' Src='Easygrants/Controls/PageSection/TaskUploads.ascx' runat='server' />

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->
