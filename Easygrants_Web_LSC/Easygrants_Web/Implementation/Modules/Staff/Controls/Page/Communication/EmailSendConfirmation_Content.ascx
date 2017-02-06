<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			E-mail Recipient List
		</td>
	</tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlEmailSendConfirmation' Src='Easygrants/Controls/Base/EmailSendConfirmation.ascx'
				runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>