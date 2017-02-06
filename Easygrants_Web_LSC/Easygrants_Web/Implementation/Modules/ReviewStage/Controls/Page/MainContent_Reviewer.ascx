<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table  border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'  >
	<tr>
		<td>
			<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlMainContent' Src='Implementation/Modules/ReviewStage/Controls/Page/MainContent.ascx' Properties='ReportOuputDefinitionTypeID=2&EditorPageKeyName=ReviewerViewOtherScoresCritiques'
				runat='server' />
		</td>
	</tr>
</table>	
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>