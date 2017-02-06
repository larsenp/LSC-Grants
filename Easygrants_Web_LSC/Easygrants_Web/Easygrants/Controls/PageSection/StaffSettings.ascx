<%@ Control Language="vb" AutoEventWireup="false" Inherits="Easygrants_Web.Controls.PageSection.cStaffSettings" CodeBehind="StaffSettings.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Base' tagname='cCheckBox' src='../../../Core/Controls/Base/CheckBox.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table border='0' cellpadding='0' cellspacing='0'>
<tr>
	<td align='center'>
		<asp:label id='lblDebugEnabled' runat='server' text=''/><BR><BR>
	</td>	
</tr>
<tr>
	<td align='center'>
		<b>Debug</b>&nbsp;<Base:cCheckBox id='IsEnabled' runat='server' Value=''/><BR><BR>
		
	</td>
</tr>
<tr>
	<td align='center'>
		<Core:cSvrButton id='btnSave' Caption='Save' OnButtonClick='StaffSettings_Save' runat='server' />
	</td>
</tr>
</table>
<BR>
<BR>
<BR>