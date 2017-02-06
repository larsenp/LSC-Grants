<%@ Page Language="vb" AutoEventWireup="true" Codebehind="pgUploadReader_InQueue.aspx.vb" Inherits="Core_Web.Controls.Base.pgUploadReader_InQueue"%>
<html>
<head>
	<title>Your Request is Being Processed</title>
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
<!-- META tag added on 1/9/06 by K. Sopher to replace function loaded in the body onLoad event.  Old
code left in page in case a rollback is required. -->
<META http-equiv="refresh" content="15;URL=pgUploadReader.aspx?SubmittedFileID=<%=SubmittedFileID%>"> 

<script language="JavaScript">
	var	gFileViewed = false;
	
	function refreshPage() 
	{
		//window.close
		if (gFileViewed) {
			window.close();
			return;
		}
		
		window.document.location = 'pgUploadReader.aspx?SubmittedFileID=<%=SubmittedFileID%>';
		gFileViewed = true;
	}
</script>
</head>
<body >
<!body onLoad="setInterval(refreshPage, 15000, 'RefreshEvent');">
<%--<span id='spnStyles' runat='server'/>--%>

<table runat='server' width='100%'>
	<tr>
		<td class="ModuleHdg" align="center">
			<b>In Process</b>
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
		<td>
		Depending on the request and the point in time (<i>i.e.</i>, close to the deadline), this process may take a while.  
		You can close this page and return at a later time to check on the processing status.  The system will continue to 
		process your request.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
		The system will process your request in the order in which it was received.  Processing may include generating your PDF, 
		checking the request is within the file size limits, exporting your data, and/or converting the file to PDF format for 
		system purposes.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
		If it has been more than one hour since your request, either the system is experiencing a heavy load (the deadline 
		time is typically very busy), or there may have been a problem with processing your request.  You may try to request 
		again, or you may contact the technical support team using the support information displayed at the bottom of the 
		application pages.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
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
