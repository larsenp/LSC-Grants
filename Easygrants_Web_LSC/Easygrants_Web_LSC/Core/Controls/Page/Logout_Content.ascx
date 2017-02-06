<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Logout_Content.ascx.vb" Inherits="Core_Web.Controls.Page.cLogout_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='LogoutConfirm' src='../Base/LogoutConfirm.ascx' %>
<%@ Register Tagprefix='Core' tagname='dbgWebSessionUserList' src='../Base/dbgWebSessionUserList.ascx' %>
<%@ Register Tagprefix='Core' tagname='dbgURLDump' src='../Base/dbgURLDump.ascx' %>

<br>

<Core:LogoutConfirm id='ctlLogoutConfirm' runat='server'/>

<br><br>
<table id='tblDebugHdr' width="100%" border="0" cellspacing="0" cellpadding="0" visible='false' runat='server'>
<tr>
	<td class='SeparatorHdg'>
		Debug Information
	</td>
</tr>
</table>
<Core:dbgWebSessionUserList id='dbgWebSessionUserList' runat='server'/>
<br>
<Core:dbgURLDump id='dbgURLDump' runat='server'/>
