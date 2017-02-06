<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.Page.cMainContentWithThirdParty" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='Core' tagname='cThirdParty' src='../../../../../Easygrants/Controls/PageSection/ThirdPartyMainContent.ascx' %>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br>
      <span id='spnPageContent' runat='server' />
<br><br>
<table  border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="TableValidation" visible="True" >
	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="SeparatorHdg"><b>Validation Summary</b>
		</td>
	</tr>
	<tr>
		<td><Core:cValidate id='ctlValidate' DisplayFormat='Summary' 
			runat='server'/>
		</td>
	</tr>
</table>	
	<Core:cThirdParty id='ctlThirdParty' runat='server'/>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>
