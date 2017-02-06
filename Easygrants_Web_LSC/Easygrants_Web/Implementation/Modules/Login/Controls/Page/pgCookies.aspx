<%@ Page Language="vb" AutoEventWireup="true" Inherits="Core.Web.cCorePage"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%--<Core:cUserCtlLoader ID='ctlStyleLoader'
		CtlID='ctlStyles' 
		Src='Implementation/CSS/DefaultStyles.ascx'
		runat='server'/>--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
  <head>
    <title>Cookies</title>
    <link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
  </head>
  <body>
	
    <form id="Form1" method="post" runat="server">
		<table runat='server' width='100%'>
			<tr>
				<td class='SeparatorHdg'>
					<b>Cookies</b>
				</td>
			</tr>
		</table>
		<p>This site uses cookies. You must have cookies enabled on your computer in order for all functionality on this site to work properly. This is the default setting for both Internet Explorer and Netscape Navigator/Communicator. Please refer to your browser's Help for more information about enabling cookies.</p>

		<P>A cookie is a small data file that is written to your hard drive when you visit certain Web sites. 
		Cookie files contain certain information, such as a random number user ID that the site assigns to a visitor to track the pages visited. The only information a cookie can contain is information you supply yourself. A cookie cannot read data off your hard disk or read cookie files created by other sites. </P>

		<P>Cookies allow this site to do two things. First and most importantly, cookies help to maintain 
		"state" while you are at the site. When you work at a computer on a network, your "state" is maintained 
		by the constant physical connection to the network. When you work at a computer on the Web, 
		you are essentially working in a disconnected mode. Cookies allow you to use more sophisticated 
		interactive programs. Second, cookies measure and report aggregate information about site users, such as 
		the number of people who view pages within the site. Cookies, by themselves, cannot be used to find 
		out the identity of any user. Only information provided voluntarily is stored, but this information is 
		not personally identifiable. All cookies that are created by this site automatically expire (i.e., get deleted) 
		when you leave the Web site.</P>


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
