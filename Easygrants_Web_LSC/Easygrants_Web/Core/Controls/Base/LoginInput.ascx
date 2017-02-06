<%@ Control Language="vb" AutoEventWireup="true" Codebehind="LoginInput.ascx.vb" Inherits="Core_Web.Controls.Base.cLoginInputCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cButton' src='CSSButton.ascx' %>


<table border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr>
	<td>Primary Email:&nbsp;&nbsp;</td>
	<td>
		<input type='text' size='30' maxlength='75' runat='server' id='txtLoginID' />
	</td>
</tr>
<tr>
	<td>Password:&nbsp;&nbsp;</td>
	<td>
		<input type='password' size='15' maxlength='16' runat='server' id='txtPWord' />
	</td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td>
		<Core:cButton id='btnLogin' Caption='Log In' runat='server' />
	</td>
</tr>
</table>