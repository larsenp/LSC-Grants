<%@ Page Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.cpgImportViewHtml" CodeBehind="pgImportViewHtml.aspx.vb" %>
<%@ Register Tagprefix='Easygrants' tagname='cPaymentImportViewHtml' src='PaymentImportViewHtml.ascx' %>

<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%--<Core:cUserCtlLoader ID='ctlStyleLoader'
		CtlID='ctlStyles' 
		Src='Implementation/CSS/DefaultStyles.ascx'
		runat='server'/>--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Import View</title>
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
</head>
<body>
	<form name='frmMain' runat='server' ID="Form1">
		<span id='spnPaymentImportViewHtml' visible='false' runat='server'>
			<Easygrants:cPaymentImportViewHtml id='ctlPaymentImportViewHtml' runat='server'/>
		</span>
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
