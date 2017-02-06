<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cEGDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<table width='100%'>
	<tr>
		<td>
			This page lists the comments of individual reviewers for the selected
			application. Your comments are shown in <b>bold text</b>. To return to the
			<b>Unattributed Comments</b> page, click on the <b>Close</b> button below.
		</td>
	</tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlUnattributedCommentsDetail' 
				Src='Implementation/Modules/ReviewStage/Controls/PageSection/BioMedUnattributedCommentsDetail.ascx'
				runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>