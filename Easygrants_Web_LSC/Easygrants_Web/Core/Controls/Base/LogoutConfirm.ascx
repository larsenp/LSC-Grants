<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLogoutConfirmCtl" Codebehind="LogoutConfirm.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cButton' src='CSSButton.ascx' %>
Are you sure you want to log out?<br>
<br>
<table border='0' cellpadding='0' cellspacing='0'>
	<tr>
		<td>
		    <Core:cButton id='btnOK' Caption='OK' runat='server' />
			
		</td>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
		<td>
			 <Core:cButton id='btnCancel' Caption='Cancel' runat='server' />
		</td>
	</tr>
</table>
