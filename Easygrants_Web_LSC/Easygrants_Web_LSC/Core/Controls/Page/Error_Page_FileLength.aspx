<%@ Page Language="vb" AutoEventWireup="true" Codebehind="Error_Page_FileLength.aspx.vb" Inherits="Core_Web.Controls.Page.cError_Page_FileLength"%>
<%@ Register tagprefix='Core' tagname='cLink' src='../Base/Link.ascx' %>
<%@ Register tagprefix='Core' tagname='cButton' src='../Base/CSSButton.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../Base/NewWindowOpener.ascx' %>

<html>
<head>
	<title>LSC Grants Error Page</title>
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
</head>
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
		<td bgcolor="#ffffff" height='48' width='100%'align="left" valign="center" class='CompetitionHdg'>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td bgcolor="white" align="left"></td>
	</tr>
</table>

<table id="Table1" runat='server' width='100%'>

	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg' colspan='3'>
			<b>System Encountered Error</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3'>
			<b>We're sorry...</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3'>
			Your file could not be uploaded. The system can accept files of up to 16 MB in size. The file you tried to upload is 
			<span runat='server' id='spnFileSizeMegabytes'/> MB (<span runat='server' id='spnFileSizeBytes'/> bytes). To reduce 
			the file size, try deleting blank pages or large graphics, and then try to upload again.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3'>
			The system has encountered an error upon your last request. To continue using the system, click on the <B>Resume</B> 
			button.  You will be redirected to the previous page. If your session has timed out, you will be redirected to 
			the Log In page.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3'>
			If you encounter the same error when you complete the action again and would like to contact the technical support 
			team via e-mail, click on the <B>Send an E-mail</B> button below. A representative will follow up with you via e-mail as 
			soon as possible.
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
			Note that if you log out or your session times out before saving data that you have entered, these data may be lost.
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
	<tr><td>&nbsp;</td></tr>
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
</html>
<Core:cNewWindowOpener runat='server' id='ctlShow'/>
