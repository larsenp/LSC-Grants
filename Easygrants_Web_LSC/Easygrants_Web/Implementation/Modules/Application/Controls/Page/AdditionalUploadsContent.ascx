<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>Instructions</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4">
			Enter additional uploads below.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>Additional Uploads</b>
		</td>
	</tr>
</table>
<p>
<Core:cUserCtlLoader CtlID='ctlAdditionalUploadsList' 
	Src='Implementation/Modules/Application/Controls/PageSection/AdditionalUploadsList.ascx'
	runat='server' />
<p>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
