<%@ Page Language="vb" AutoEventWireup="false" Codebehind="UseDateSelector.aspx.vb" Inherits="UseDateSelector" %>
<%@Register TagPrefix="SControls" TagName="DateSelector" src="DateSelector.ascx" %>
<HTML>
	<HEAD>
		<title>UseDateSelector</title>
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<SCONTROLS:DateSelector id="useDateCal" runat="server" Text="Start Date:"></SCONTROLS:DateSelector><br>
			<SCONTROLS:DateSelector id="dtCal" runat="server" Text="End Date:"></SCONTROLS:DateSelector><br>
			<hr>
			<asp:button id="bt_Submit" runat="server" Text="Submit"></asp:button></form>
	</body>
</HTML>
