<%@ Control Language="vb" AutoEventWireup="true" Codebehind="EventRaiser.ascx.vb" Inherits="Core_Web.Controls.Base.cEventRaiser" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cButton' src='CSSButton.ascx' %>
<a id='ancEventRaiser' runat='server'></a>

<table id='tabSend' width='100%' cellpadding='0' cellspacing='0' runat='server'>
	<tr>
		<td align='center'>
			<Core:cButton id='btnSend' Caption='Send' runat='server' />
		</td>
	</tr>
</table>
