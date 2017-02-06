<%@ Page Language="vb" AutoEventWireup="true" Codebehind="pgUploadReader.aspx.vb" Inherits="Core_Web.Controls.Base.pgUploadReader_Error_VDate"%>
<html>
<head>
	<title>Process Error</title>
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
</head>
<body>
<%--<span id='spnStyles' runat='server'/>--%>

<table runat='server' width='100%'>
	<tr>
		<td class="ModuleHdg" align="center">
			<b>Upload Error</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			<b>Validation Error</b>
		</td>
	</tr>	
	<tr>
		<td>
			There was a problem converting your document to PDF format.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			<b>Error Description</b>
		</td>
	</tr>
	<tr>
		<td>
			<%= Result %>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td id='tdFileInvalid' visible='false' runat='server'>
			Please make the appropriate edits to the file and try uploading it again.
		</td>
		<td id='tdExceptionCaught' visible='false' runat='server'>
			Please contact technical support.
		</td>
	</tr>
</table>
<span runat='server' visible='false' id='spnServerErrorMsg'>
	Server error during conversion.
</span>
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
</BODY>
</HTML>
