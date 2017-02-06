<%@ Page Language="vb" AutoEventWireup="true" Inherits="Easygrants_v4_CR_r1.Modules.ReviewReport.cModuleContent" CodeBehind="ModuleContent.aspx.vb" %>
<%@ Register Tagprefix='Easygrants' tagname='JSTimer' src='../../../Core/Controls/Base/JSTimer.ascx' %>
<Easygrants:JSTimer id='ctlJSTimer' runat='server'/>
<script language='javascript'>
	function configureAlert() {
		showAlertTimeZone(10, "")
	}
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title><%=ModulePage_GetTitle()%></title>
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
</head>
<body onload="setTimeout('configureAlert()', 60000*(<%=TimeOut%> - 10))">
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