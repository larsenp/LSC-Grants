<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
      <span id='spnPageContent' runat='server' />
<br>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlProjectHeader' 
	Src='Implementation/Modules/Application/Controls/PageSection/ProjectInfoHeader.ascx'
	runat='server'/>
<br>
<Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='ctlBudgetRequirements' 
	Src='Implementation/Modules/Application/Controls/PageSection/BudgetRequirements.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlParticipantOrganizations' 
	Src='Implementation/Modules/Application/Controls/PageSection/ParticipantOrganizations.ascx'
	runat='server'/>
	
<Core:cUserCtlLoader CtlID='ctlParticipanOtherKeyPersonnel' 
	Src='Implementation/Modules/Application/Controls/PageSection/ParticipanOtherKeyPersonnel.ascx'
	runat='server'/>
	
<Core:cUserCtlLoader CtlID='ctlParticipantAdminContacList' 
	Src='Implementation/Modules/Application/Controls/PageSection/ParticipantAdminContacList.ascx'
	runat='server'/>
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>		
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->







