<%@ Page Language="vb" AutoEventWireup="true" Codebehind="PageContent_Editor.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cPageContent_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" validateRequest="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title><%=ModulePage_GetTitle()%></title>
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
</head>
<body onload="setTimeout('showAlert(10)', 60000*(<%=TimeOut%> - 10))">
<form id="frmMain" method="post" runat="server">



<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>				
	</ModuleSection>
<!-- End Embedded XML -->
</span>

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
