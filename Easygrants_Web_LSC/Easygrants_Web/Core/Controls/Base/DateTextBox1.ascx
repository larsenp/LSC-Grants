<%@ Control Language="vb" AutoEventWireup="true" Codebehind="DateTextBox1.ascx.vb" Inherits="Core_Web.Controls.Base.cDateTextBox1" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<asp:textbox id="txt_Date" runat="server" ></asp:textbox>&nbsp;&nbsp;
<span id='spnCalendar' visible='false' runat='server'>
	<asp:image id="imgCalendar" runat="server" ImageUrl="~/Core/Images/DateTextBox/calendar.gif"></asp:image>
</span>