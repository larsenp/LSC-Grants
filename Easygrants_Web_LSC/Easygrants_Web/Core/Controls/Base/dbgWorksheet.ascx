<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cdbgWorksheet" Codebehind="dbgWorksheet.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' Namespace='Easygrants.Web.SvrCtls' Assembly='Easygrants' %>

<table id='tblWorksheet' width="100%" border="0" cellspacing="0" cellpadding="0" runat='server' visible='false'>
	<tr>
		<td class='SeparatorHdg'>
			Debug Worksheet
		</td>
	</tr>
	<tr>
		<td class='DebugText'>
			<span id='lblScratch' class='DebugText' runat='server'>
				<Easygrants:cdbgScratch id='ctldbgScratch' runat='server'/>
			</span>
		</td>
	</tr>
</table>
