<%@ Page Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Login.cLoginModuleContent" Codebehind="LoginModuleContent.aspx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlJSTimer.ascx' 
	Src='Core/Controls/Base/JSTimer.ascx'
	runat='server'/>

<html>
<head>
	<title><%=ModulePage_GetTitle()%></title>
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
</head>
<body  onload="MainCalled()">
<form id='frmMain' runat='server'>

</form>
<script type="text/javascript">
	var trackKey = new String('<%=WebSession.WebAppl.GetSystemSetting("GoogleAnalytics") %>');
	if (trackKey != "") {
		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	}
</script>
<script type="text/javascript">
	var trackKey = new String('<%=WebSession.WebAppl.GetSystemSetting("GoogleAnalytics") %>');
	if (trackKey != "") {
		var pageTracker = _gat._getTracker(trackKey);
		pageTracker._trackPageview();
	}
</script>
</body>
</html>
