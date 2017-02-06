<%@ Control Language="vb" AutoEventWireup="true" Codebehind="DocumentListCtl.ascx.vb" Inherits="Core_Web.Controls.Base.cDocumentListCtl"%>
<%@ Register TagPrefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table id='tHeader' border='0' cellpadding='2' cellspacing='0' width='100%' runat='server' >
	<tr visible='false' id='trNoRecord' runat='server'>
		<td class='DataListNoRecordStyle' id='tdNoRecord' runat='server' height='30' valign='top'/>
	</tr>
	<tr visible='false' id='trHeader' runat='server'>
		<td id='tdHeader' runat='server' class='SeparatorHdg'/>
	</tr>
	<tr visible='false' id='trNoHeaderSpace' runat='server'><td>&nbsp;</td></tr>
	<tr visible='false' id='trInstructions' runat='server'>
		<td id='tdInstructions' runat='server'/>
	</tr>
	<tr visible='false' id='trBlank' runat='server'>
		<td id='tdBlank' visible='false' runat='server'></td>
	</tr>
</table>
<a name='Results'></a>
<table id='tResults' border='0' cellpadding='2' cellspacing='0' width='100%' runat='server' />
<p id='tTotal' runat='server' visible='false'/>
<table id='tPaging' border='0' cellpadding='2' cellspacing='0' width='100%' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<Core:cPagingCtl id='ctlPaging' visible='true' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
