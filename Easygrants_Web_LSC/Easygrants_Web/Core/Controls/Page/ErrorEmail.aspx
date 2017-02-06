<%@ Page Language="vb" AutoEventWireup="true" Codebehind="ErrorEmail.aspx.vb" Inherits="Core_Web.Controls.Base.cErrorEmail"%>
<%@ register tagprefix='Core' tagname='cCloseWindow' src='../../../Core/Controls/Base/CloseWindow.ascx' %>
<%@ register tagprefix='Core' tagname='cTextBox' src='../Base/TextBox.ascx' %>
<%@ register tagprefix='Core' tagname='cTextArea' src='../Base/TextArea.ascx' %>
<%@ register tagprefix='Core' tagname='cEmailTextBox' src='../Base/EmailTextBox.ascx' %>
<%@ register tagprefix='Core' tagname='cButton' src='../Base/CSSButton.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<HTML>
<HEAD>
	<title>Easygrants Error Email Page</title>
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
</HEAD>
<body>
<form id="frmMain" method="post" runat="server">
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<%--<Core:cUserCtlLoader ID='ctlStyleLoader'
		CtlID='ctlStyles' 
		Src='Implementation/CSS/DefaultStyles.ascx'
		runat='server'/>--%>

<table border='0' cellspacing='0' cellpadding='2' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Send Error Message E-mail</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Enter your name, e-mail address, and information on the actions that led to the error page in the available fields. 
			You do not need to note the full error message.  Technical details of the error will be sent automatically with the e-mail. 
			The e-mail will be sent directly to the technical support team for the Easygrants system.		
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			To send the e-mail, click on the <B>Submit</B> button. To close and return to the System Error Page without sending the e-mail, 
			click on the <B>Close</B> button. <B>IMPORTANT:</B> If you close or navigate off this page before you save, you will lose unsaved 
			information. 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table id='tblSentMessage' visible='false' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>Your support request has been sent.  We will get back to you as soon as we can.</td>
	</tr>
</table>

<table id='tblCloseWindow' visible='false' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td align='center'>
			<a href="javascript:window.close()" style="vertical-align:top" class="CSSButtonStyle">Close</a>
		</td>
	</tr>
</table>

<table id='tblMessage' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>Name</td>
		<td>
			<Core:cTextBox  id='txtName' Size='30' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>E-mail Address</td>
		<td>
			<Core:cEmailTextBox  id='txtFromEmail' Size='30' runat='server'/>
		</td>
	</tr>
	<tr>
		<td valign='top'>Message:</td>
		<td>
			<Core:cTextArea id='txtMessage' Size='30' Rows='10' Cols='50' runat='server'/>
		</td>
	</tr>
</table>

<table id='tblSubmit' visible='false' border='0' cellspacing='0' cellpadding='2' runat='server' align='center' width='100%'>
	<tr>
		<td align='center'>
			<Core:cButton id='btnSubmit' Caption='Submit' runat='server' CausesValidation="False" />
			<a href="javascript:window.close()" style="vertical-align:top" class="CSSButtonStyle">Close</a>

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
