<<%@ Control Language="vb" AutoEventWireup="true" Codebehind="NavigationListCtl.ascx.vb" Inherits="Easygrants_Web.Controls.Base.cNavigationListCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table id='tHeader' border='0' cellpadding='2' cellspacing='0' width='100%' runat='server' >
	<tr visible='false' id='trHeader' runat='server'>
		<td id='tdHeader' runat='server' class='SeparatorHdg'/>
	</tr>
	<tr visible='false' id='trInstructions' runat='server'>
		<td id='tdInstructions' runat='server'/>
	</tr>
	<tr visible='false' id='trBlank' runat='server'>
		<td id='tdBlank' visible='false' runat='server'></td>
	</tr>
</table>
<table id='tResults' border='0' cellpadding='2' cellspacing='0' width='100%' runat='server' />
