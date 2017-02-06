<%@ Page Language="vb" AutoEventWireup="true" Codebehind="ErrorDetails.aspx.vb" Inherits="Core_Web.Controls.Page.cErrorDetails"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register tagprefix='Core' tagname='cButton' src='../Base/CSSButton.ascx' %>
<%@ register tagprefix='Core' tagname='cLink' src='../Base/Link.ascx' %>
<html>
<head>
	<title>Easygrants Error Details Page</title>
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
</head>
<body>

<form id="frmMain" method="post" runat="server">
<%--<span id='spnStyles' runat='server'/>--%>
<span id='spnCloseWindow' runat="server" visible="false">
	<SCRIPT language="javascript">
		window.open('','_self','');
		window.close();
	</SCRIPT>
</span>
<table runat='server' width='100%' ID="Table1">
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			<b>Technical Error Information</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<B>Error in:</B>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<%=errUrl%>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Error Message:</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<%=errMsg%>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Stack Trace:</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<%=errStackTrace%>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<Core:cButton id="btnClose" Caption='Close' runat='server' bgcolor='#EEEEEE'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
</form>
<script type="text/javascript">
	var trackKey = new String('<%=WebAppl.GetSystemSetting("GoogleAnalytics") %>');
	if (trackKey != "") {
		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	}
</script>
<script type="text/javascript">
	var trackKey = new String('<%=WebAppl.GetSystemSetting("GoogleAnalytics") %>');
	if (trackKey != "") {
		var pageTracker = _gat._getTracker(trackKey);
		pageTracker._trackPageview();
	}
</script>
</body>
</html>
