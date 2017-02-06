<%@ Page Language="vb" AutoEventWireup="true" Codebehind="PermissionErrorPage.aspx.vb" Inherits="Core_Web.Controls.Page.cPermissionErrorPage"%>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../Base/NewWindowOpener.ascx' %>
<%@ register tagprefix='Core' tagname='cButton' src='../Base/CSSButton.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<HTML>
	<HEAD>
		<title>Easygrants Permission Error Page</title>
		<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
		<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
	</HEAD>
<body>
<%--<span id='spnStyles' runat='server'/>--%>

<form id="frmMain" method="post" runat="server">
<%--<Core:cUserCtlLoader ID='ctlStyleLoader'
		CtlID='ctlStyles' 
		Src='Implementation/CSS/DefaultStyles.ascx'
		runat='server'/>--%>
<table width='100%' border="0" cellpadding="0" cellspacing="0"> <!-- competition header table -->
	<tr>
		<td bgcolor="#ffffff" width='10'><img src='<%=WebAppl.Build_RootURL("Easygrants/Images/Transparent_Filler.gif")%>' width='10' border='0'></td>
		<td bgcolor="#bbbbbb" width='140' align="Left"><img SRC="<%=WebAppl.Build_RootURL("Easygrants/Images/Header01.jpg")%>" border='0' ></td>
		<td bgcolor="#ffffff" width='10'><img src='<%=WebAppl.Build_RootURL("Easygrants/Images/Transparent_Filler.gif")%>' width='10' border='0'></td>
		<td bgcolor="#ffffff" height='48' width='100%'align="left" valign="center" class='CompetitionHdg'></td>
	</tr>
	<tr>
		<td bgcolor="white" align="left"></td>
	</tr>
</table>

<table runat='server' width='100%' ID="Table1">
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg' colspan='3'>
			<b>Permission Error</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3'>
			You do not have permission to view or access this functionality.  Please 
			contact an administrative user within your Foundation to perform this 
			function for you.  If you would like to request assistance or additional 
			access rights, click on the <b>Send an Email</b> button below.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3'>
			To continue using the system, click on the <b>Resume</b> button.  You will be 
			redirected to the previous page.  If your session has timed out, you will be 
			redirected to the Login page.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3'>
			To Logout, click on the <B>Logout</B> button.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3'>
			Note that if you log out or your session times out before saving data that 
			you have entered, these data may be lost.The system has encountered an error 
			upon your last request.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='right' width='45%'>
			<Core:cButton  id='btnResume' Caption='Resume' runat='server' bgcolor='#EEEEEE'/>
		</td>
		<td width='10%'/>
		<td align='left' width='45%'>
			<Core:cButton  id="btnSend" Caption='Send an E-mail' runat='server' bgcolor='#EEEEEE'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center' colspan='3'>
			<Core:cButton  id="btnLogout" Caption='Logout' runat='server' bgcolor='#EEEEEE'/>
		</td>
	</tr>
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
</HTML>
<Core:cNewWindowOpener runat='server' id='ctlShow'/>
