<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<table width='600'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' class='SeparatorHdg'>
			Request Unsubmission
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			To request unsubmission of this application, click the <b>Send Unsubmission Request</b> button below.
			An e-mail will be sent to the program staff requesting the unsubmission. If you want to include
			comments regarding the reason for your request, type those comments in the <b>Additional comments</b>
			box before clicking the <b>Send Unsubmission Request</b> button.
		</td>
	</tr>
</table>
<br />
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Controls/PageSection/SendUnsubmitRequest.ascx'
	runat='server'/>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>