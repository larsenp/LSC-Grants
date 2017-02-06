<%@ Page Language="vb" AutoEventWireup="true" Inherits="Core.Web.cCorePage" %>
<html>
<head>
	<title>Report Information</title>
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
	<script language="JavaScript">
		var	gFileViewed = false;
		function ViewSharepointDocument() 
		{
			var aFileName = new String("<%=Server.HtmlEncode(Request.QueryString("FileName")) %>");
//			ViewSharepointDocument(aFileName);
			var OpenDocumentsObject=null;
			try {
				OpenDocumentsObject = new ActiveXObject("SharePoint.OpenDocuments.3"); 
				if (OpenDocumentsObject) { 
					OpenDocumentsObject.ViewDocument3(window,aFileName,2,'');
					window.open('','_self','');
					window.close();
				} 
			}
			catch(ex) {	
				//alert("Error finding Office 2007.");
				return; 
			}
		}
	</script>
</head>
<body onLoad="ViewSharepointDocument();">

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