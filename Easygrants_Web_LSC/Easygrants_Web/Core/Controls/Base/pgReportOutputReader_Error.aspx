<%@ Page Language="vb" AutoEventWireup="true" Codebehind="pgReportOutputReader_Error.aspx.vb" Inherits="Core_Web.Controls.Base.cpgReportOutputReader_Error" %>
<html>
<head>
	<title>Report Information</title>
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
	<script language="JavaScript">
		var	gFileViewed = false;
		function refreshPage() 
		{
			if (gFileViewed) {
				window.close();
				return;
			}
			if(<%=ReportOutputID%> == '0')
				if (navigator.userAgent.toLowerCase() == 'msie')
					window.document.location = 'pgReportOutputReader.aspx?EntityID=<%=EntityID%>&amp;DefinitionID=<%=DefinitionID%>';
				else
					window.document.location = 'pgReportOutputReader.aspx?EntityID=<%=EntityID%>&DefinitionID=<%=DefinitionID%>';
			else
				window.document.location = 'pgReportOutputReader.aspx?ReportOutputID=<%=ReportOutputID%>';
			gFileViewed = true;
		}
	</script>

</head>
<body onLoad="setInterval(refreshPage, 15000, 'RefreshEvent');">
<%--<span id='spnStyles' runat='server'/>--%>

<table id='tabInQueue' visible='false' width='100%' runat='server'>
	<tr>
		<td class="ModuleHdg" align="center">
			<b>In Process</b>
		</td>
	</tr>
	<tr>
		<td>
In order for you to view your report, the system must process it in the order in which it was requested.
You have been brought to this page because processing has not been completed on your report.
There are several possible explanations for this.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			<b>In Process</b>
		</td>
	</tr>
	<tr>
		<td>
			Processing does not happen immediately when you request to view your report. 
			Requests are placed in a queue and processed every several minutes. If you 
			have just requested to view your report, please close this window and try 
			again after at least ten minutes.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<img src='<%=WebAppl.Build_RootURL("Core/images/UploadInProcess.gif")%>' border="0" />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			<b>In Case of Error</b>
		</td>
	</tr>	
	<tr>
		<td>
			If it has been more than twenty minutes since your request, there may have been a problem with the process. Please try the request again. 
		</td>
	</tr>
	<tr>
		<td>
			For technical support please use the contact information at the bottom of the web page.
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table> <!-- tabInQueue -->
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